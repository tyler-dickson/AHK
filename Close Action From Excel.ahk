#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
Menu, Tray, Icon, pifmgr.dll, 35
Enabled := ComObjError(false)

FormatTime, Today, , MM/dd/yyyy
CloseAction = 0
TryForAT = 0
CheckResponseSent = 0

Gui, Start: New, ,Close From Excel
Gui, Start: Add, Checkbox, vCloseAction, Close action from Excel?
Gui, Start: Add, Checkbox, vTryForAT, Try to close on AT too?
Gui, Start: Add, Checkbox, vCheckResponseSent, Check if Response Sent needed?
Gui, Start: Add, Button, gSubmitPrefs, Submit
Gui, Start: Show

return

SubmitPrefs:
Gui, Start: Submit
MsgBox, % CloseAction " | " TryForAT " | " CheckResponseSent
return


#3::
CloseDateFromSpreadsheet:
Gui, Add, ActiveX, vCloser w800 h380 x0 y0, Shell.Explorer
Closer.silent := true
xl := ComObjActive("Excel.Application")
Sleep 500

global StoredActionDue := xl.ActiveCell.Offset(0,-6).Value
global StoredURL := xl.ActiveCell.Value
global ClientCode := xl.ActiveCell.Offset(0,-3).Value

; MsgBox, % StoredURL " | " xl.Selection.Count

if (xl.Selection.Count > 1)
	{
	xl.Selection.Copy
; 	MsgBox, % xl.ActiveCell.Address " | " xl.Selection.Address "`n`n" Clipboard
	}
else
	{
	; MsgBox, % "just 1 | " xl.ActiveCell.Value " | " xl.ActiveCell.Address
	xl.Selection.Copy
	}
	

StoredURL := StrSplit(Clipboard, "`r`n")
innerLoop = 1


Loop % xl.Selection.Count
	{
	if InStr(StoredURL[innerLoop], "patfrmActionDue")
		Temp := StrReplace(StoredURL[innerLoop], "patfrmActionDue", "patfrmActDueDate", , 1)
	else
		Temp := StrReplace(StoredURL[innerLoop], "tmkfrmActionDue", "tmkfrmActDueDate", , 1)

	xl.ActiveCell.Offset(innerLoop-1,-1).Value := "Grabbed action..."
	StoredActionDue := xl.ActiveCell.Offset(innerLoop-1,-6).Value
	
	Closer.navigate(Temp)
	Gui, Show, w800 h380
	while Closer.busy or Closer.ReadyState != 4 						;Wait for page to load
		Sleep, 100

	EditButtons := []

	
	Loop % Closer.document.GetElementsBytagname("IMG").length 
		{
		Temp%A_Index% := Closer.document.GetElementsBytagname("IMG")[A_Index-1].OuterHTML
		ifinstring, Temp%A_Index% , edit
			EditButtons.Push(A_Index-1)
		}
	xl.ActiveCell.Offset(innerLoop-1,-1).Value := "Looking around..."

	if (CloseAction)
		{
		Loop % EditButtons.Length()
			{
			Closer.document.GetElementsBytagname("IMG")[EditButtons[A_Index]].Click()
			Sleep 750																						; Wait .750 seconds

			if InStr(Closer.document.GetElementsBytagname("INPUT")[3].Value, StoredActionDue)							; Action Due
				{
				xl.ActiveCell.Offset(innerLoop-1,-1).Value := "Closing action..."
				
				if (Closer.document.GetElementsBytagname("INPUT")[7].Value == "")
					{
					Closer.document.GetElementsBytagname("INPUT")[7].Value := Today		; Due Date
					xl.ActiveCell.Offset(innerLoop-1,-1).Value := "Closed in Live!"
					}
				else
					xl.ActiveCell.Offset(innerLoop-1,-1).Value := "Already closed!"
					
				Sleep 750
				gosub ClickSaveOpp
				Sleep 1000
				break
				}
			else 
				{
				gosub ClickSaveOpp
				Sleep 1000
				}
			}
		}
	
	HowManyClosed = 0
	if (CheckResponseSent)
		{
		Loop % EditButtons.Length() ; Check if all dates are closed.
			{
			Closer.document.GetElementsBytagname("IMG")[EditButtons[A_Index]].Click()
			Sleep 750
			
			if (Closer.document.GetElementsBytagname("INPUT")[7].Value == "")		; Due Date
				{
				xl.ActiveCell.Offset(innerLoop-1,-1).Value := "At least one blank."
				Sleep 750
				gosub ClickSaveOpp
				Sleep 1000
				break
				}
			else 
				{
				HowManyClosed++
				Sleep 750
				gosub ClickSaveOpp
				Sleep 1000
				}
			}

			if (HowManyClosed == EditButtons.Length()) 
				{
				xl.ActiveCell.Offset(innerLoop-1,-1).Value := "Needs Response Sent!"
				gosub ClickSaveOpp
				Sleep 1000
				}
		}
		
	if (TryForAT)
		gosub TryForAT

	innerLoop++
	}
Gui, Destroy
return

RefreshGUIOpp:
AS := Closer.document.GetElementsBytagname("A").length
INPUTS := Closer.document.GetElementsBytagname("INPUT").length
SPANS := Closer.document.GetElementsBytagname("SPAN").length
TEXTAREAS := Closer.document.GetElementsBytagname("TEXTAREA").length
IMGS := Closer.document.GetElementsBytagname("IMG").length
return

ClickSaveOpp:
AS := Closer.document.GetElementsBytagname("A").length
Loop %AS%
	{
	Temp%A_Index% := Closer.document.GetElementsBytagname("A")[A_Index-1].OuterHTML
	ifinstring, Temp%A_Index% , save
		{
		Closer.document.GetElementsBytagname("A")[A_Index-1].Click()
		break
		}
	}
return

TryForAT:
if (xl.ActiveCell.Offset(innerLoop-1,-1).Value == "Already closed!")
	xl.ActiveCell.Offset(innerLoop-1,-1).Value := "Already closed!, Checking AT..."
else
	xl.ActiveCell.Offset(innerLoop-1,-1).Value := "Closed in Live, Checking AT..."

qry := "SELECT * FROM dbo.vwAHKMatterInfo WHERE Matter = '" ClientCode "'"
result := ADOSQL(qry)
Sleep 1000
liveUrl := result[2,5] 		; url in live docketing system
agentUrl := result[2,6] 	; url in agent docketing system

Closer.navigate(agentUrl)
Sleep 1000

FirstAction := StoredActionDue

while Closer.busy or Closer.ReadyState != 4 ;Wait for page to load
	Sleep, 100
var := Closer.LocationURL ; grab current ur

if (FirstAction != "NOPE")
	{
	Loop 20
	{
	NewAS := Closer.document.GetElementsBytagname("A").length
		if NewAS = 0 
			Sleep 250
		else
			break
	}

	NewNewURL := ""
	Loop %NewAS%
		{
		TempAction := Closer.document.GetElementsBytagname("A")[A_Index-1].InnerText
		ifinstring, TempAction, %FirstAction%
			{
			TempHTML := Closer.document.GetElementsBytagname("A")[A_Index-1].OuterHTML
		
			StringSplit, TempHTML, TempHTML, ",    ;"
			StringSplit, NewURL, TempHTML2, =, 
			StringSplit, NewUrlSplit, NewUrl2, &
			
			NewURL1 := StrReplace(NewURL1, "ActionDue", "ActDueDate", , 1)
			
			if instr(var, "http://oc-docketing/CPi/")
				NewNewURL := "http://oc-docketing/CPi/" . NewURL1 . "=" . NewUrlSplit1
			else if instr(var, "http://oc-docketing/CPiAgent/")
				NewNewURL := "http://oc-docketing/CPiAgent/" . NewURL1 . "=" . NewUrlSplit1
			}
		}

	if NewNewURL != 
		{
		Closer.navigate(NewNewURL)
		}
	else	
		{
		xl.ActiveCell.Offset(innerLoop-1,-1).Value := "Closed in Live! Not in AT..."
		
		if InStr(NewNewURL, "tmk")
			Run, % agentUrl . "&tab=4"
		else 
			Run, % agentUrl . "&tab=2"	
		Gui, Destroy
		return
		}
	}

gosub CloseSelectedDate2
return


CloseSelectedDate2:
EditButtons := []

Sleep 1000

Loop % Closer.document.GetElementsBytagname("IMG").length 
	{
	Temp%A_Index% := Closer.document.GetElementsBytagname("IMG")[A_Index-1].OuterHTML
	ifinstring, Temp%A_Index% , edit
		EditButtons.Push(A_Index-1)
	}
		xl.ActiveCell.Offset(0,-1).Value := "Closed in Live! Looking in AT..."

Loop % EditButtons.Length()
	{
	Closer.document.GetElementsBytagname("IMG")[EditButtons[A_Index]].Click()
	Sleep 750	

	if InStr(Closer.document.GetElementsBytagname("INPUT")[3].Value, FirstAction)
		{
		xl.ActiveCell.Offset(0,-1).Value := "Closed in Live! Closing in AT..."
		Closer.document.GetElementsBytagname("INPUT")[7].Value := Today	; Due Date
		Sleep 750
		gosub ClickSaveOpp
		Sleep 1000
		break
		}
	else 
		{
		gosub ClickSaveOpp
		Sleep 1000
		}
	}
xl.ActiveCell.Offset(0,-1).Value := "Closed in both!"
Gui, Destroy
return


/*

;SetTimer, GrabExcel, 1000
;return

;GrabExcel:
acc := ComObjActive("Access.Application")

TrueOrFalse := IsObject(acc)
MsgBox, % TrueOrFalse
MsgBox, % acc.Name
MsgBox, % acc.Version
test := acc.CurrentData.AllTables
MsgBox, % test.Count
return


; https://docs.microsoft.com/en-us/office/vba/api/access.application


offset = 3
if (TrueOrFalse == 1)
	{
	xl.Range("A1").Value := "Connected to Excel."
	xl.Range("B1").Value := " " A_Now
	}

return

; H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Temp\Test.accdb



*/





























;************Pointer to Open IE Window******************
WBGet(WinTitle="ahk_class IEFrame", Svr#=1) {               ;// based on ComObjQuery docs
   static msg := DllCall("RegisterWindowMessage", "str", "WM_HTML_GETOBJECT")
        , IID := "{0002DF05-0000-0000-C000-000000000046}"   ;// IID_IWebBrowserApp
;//     , IID := "{332C4427-26CB-11D0-B483-00C04FD90119}"   ;// IID_IHTMLWindow2
   SendMessage msg, 0, 0, Internet Explorer_Server%Svr#%, %WinTitle%

   if (ErrorLevel != "FAIL") {
      lResult:=ErrorLevel, VarSetCapacity(GUID,16,0)
      if DllCall("ole32\CLSIDFromString", "wstr","{332C4425-26CB-11D0-B483-00C04FD90119}", "ptr",&GUID) >= 0 {
         DllCall("oleacc\ObjectFromLresult", "ptr",lResult, "ptr",&GUID, "ptr",0, "ptr*",pdoc)
         return ComObj(9,ComObjQuery(pdoc,IID,IID),1), ObjRelease(pdoc)
      }
   }
}

/*
###############################################################################################################
######                                      ADOSQL v5.04L - By [VxE]                                     ######
###############################################################################################################

	Wraps the utility of ADODB to connect to a database, submit a query, and read the resulting recordset.
	Returns the result as a new object (or array of objects, if the query has multiple statements).
	To instead have this function return a string, include a delimiter option in the connection string.

	For AHK-L (v1.1 or later).
	Freely available @ http://www.autohotkey.com/community/viewtopic.php?p=558323#p558323

	IMPORTANT! Before you can use this library, you must have access to a database AND know the connection
	string to connect to your database.

	Varieties of databases will have different connection string formats, and different drivers (providers).
	Use the mighty internet to discover the connection string format and driver for your type of database.

	Example connection string for SQLServer (2005) listening on port 1234 and with a static IP:
	DRIVER={SQL SERVER};SERVER=192.168.0.12,1234\SQLEXPRESS;DATABASE=mydb;UID=admin;PWD=12345;APP=AHK
*/

Global ADOSQL_LastError, ADOSQL_LastQuery ; These super-globals are for debugging your SQL queries.


ADOSQL(Query_Statement) {
; Uses an ADODB object to connect to a database, submit a query and read the resulting recordset.
; By default, this function returns an object. If the query generates exactly one result set, the object is
; a 2-dimensional array containing that result (the first row contains the column names). Otherwise, the
; returned object is an array of all the results. To instead have this function return a string, append either
; ";RowDelim=`n" or ";ColDelim=`t" to the connection string (substitute your preferences for "`n" and "`t").
; If there is more than one table in the output string, they are separated by 3 consecutive row-delimiters.
; ErrorLevel is set to "Error" if ADODB is not available, or the COM error code if a COM error is encountered.
; Otherwise ErrorLevel is set to zero.

Connection_String := "Provider=sqloledb;Data Source=DB-Portal;Initial Catalog=KMOBPortal;Integrated Security=SSPI;"

coer := "", txtout := 0, rd := "`n", cd := "CSV", str := Connection_String ; 'str' is shorter.

; Examine the connection string for output formatting options.
	If ( 9 < oTbl := 9 + InStr( ";" str, ";RowDelim=" ) )
	{
		rd := SubStr( str, oTbl, 0 - oTbl + oRow := InStr( str ";", ";", 0, oTbl ) )
		str := SubStr( str, 1, oTbl - 11 ) SubStr( str, oRow )
		txtout := 1
	}
	If ( 9 < oTbl := 9 + InStr( ";" str, ";ColDelim=" ) )
	{
		cd := SubStr( str, oTbl, 0 - oTbl + oRow := InStr( str ";", ";", 0, oTbl ) )
		str := SubStr( str, 1, oTbl - 11 ) SubStr( str, oRow )
		txtout := 1
	}

	;ComObjError( 0 ) ; We'll manage COM errors manually.

; Create a connection object. > http://www.w3schools.com/ado/ado_ref_connection.asp
; If something goes wrong here, return blank and set the error message.
	If !( oCon := ComObjCreate( "ADODB.Connection" ) )
		Return "", ComObjError( 1 ), ErrorLevel := "Error"
		, ADOSQL_LastError := "Fatal Error: ADODB is not available."


	oCon.ConnectionTimeout := 3 ; Allow 3 seconds to connect to the server.
	oCon.CursorLocation := 3 ; Use a client-side cursor server.
	oCon.CommandTimeout := 900 ; A generous 15 minute timeout on the actual SQL statement.
	oCon.Open( str ) ; open the connection.

; Execute the query statement and get the recordset. > http://www.w3schools.com/ado/ado_ref_recordset.asp
	If !( coer := A_LastError )
		oRec := oCon.execute( ADOSQL_LastQuery := Query_Statement )

	If !( coer := A_LastError ) ; The query executed OK, so examine the recordsets.
	{
		o3DA := [] ; This is a 3-dimensional array.
		While IsObject( oRec )
			If !oRec.State ; Recordset.State is zero if the recordset is closed, so we skip it.
				oRec := oRec.NextRecordset()
			Else ; A row-returning operation returns an open recordset
			{
				oFld := oRec.Fields
				o3DA.Insert( oTbl := [] )
				oTbl.Insert( oRow := [] )

				Loop % cols := oFld.Count ; Put the column names in the first row.
					oRow[ A_Index ] := oFld.Item( A_Index - 1 ).Name

				While !oRec.EOF ; While the record pointer is not at the end of the recordset...
				{
					oTbl.Insert( oRow := [] )
					oRow.SetCapacity( cols ) ; Might improve performance on huge tables??
					Loop % cols
						oRow[ A_Index ] := oFld.Item( A_Index - 1 ).Value	
					oRec.MoveNext() ; move the record pointer to the next row of values
				}

				oRec := oRec.NextRecordset() ; Get the next recordset.
			}

		If (txtout) ; If the user wants plaintext output, copy the results into a string
		{
			Query_Statement := "x"
			Loop % o3DA.MaxIndex()
			{
				Query_Statement .= rd rd
				oTbl := o3DA[ A_Index ]
				Loop % oTbl.MaxIndex()
				{
					oRow := oTbl[ A_Index ]
					Loop % oRow.MaxIndex()
						If ( cd = "CSV" )
						{
							str := oRow[ A_Index ]
							StringReplace, str, str, ", "", A                   ; "
							If !ErrorLevel || InStr( str, "," ) || InStr( str, rd )
								str := """" str """"
							Query_Statement .= ( A_Index = 1 ? rd : "," ) str
						}
						Else
							Query_Statement .= ( A_Index = 1 ? rd : cd ) oRow[ A_Index ]
				}
			}
			Query_Statement := SubStr( Query_Statement, 2 + 3 * StrLen( rd ) )
		}
	}
	Else ; Oh NOES!! Put a description of each error in 'ADOSQL_LastError'.
	{
		oErr := oCon.Errors ; > http://www.w3schools.com/ado/ado_ref_error.asp
		Query_Statement := "x"
		Loop % oErr.Count
		{
			oFld := oErr.Item( A_Index - 1 )
			str := oFld.Description
			Query_Statement .= "`n`n" SubStr( str, 1 + InStr( str, "]", 0, 2 + InStr( str, "][", 0, 0 ) ) )
				. "`n   Number: " oFld.Number
				. ", NativeError: " oFld.NativeError
				. ", Source: " oFld.Source
				. ", SQLState: " oFld.SQLState
		}
		ADOSQL_LastError := SubStr( Query_Statement, 4 )
		Query_Statement := ""
		txtout := 1
	}

; Close the connection and return the result. Local objects are cleaned up as the function returns.
	oCon.Close()
	;ComObjError( 1 )
	ErrorLevel := coer
	Return txtout ? Query_Statement : o3DA.MaxIndex() = 1 ? o3DA[1] : o3DA
} ; END - ADOSQL( Connection_String, Query_Statement )