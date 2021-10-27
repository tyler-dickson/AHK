#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, Shell32.dll, 95


;	-DONE- Grab four columns and split into OppPieces1-4.
;	-DONE- Remove "App " from OppPieces1. This included removing `r`n and extra A_Space
;	-DONE- NewAction := "Deadline to File Opposition (" OppPieces1 ")"
;	-DONE- Retain Class for OppPieces2, or retain Subclass Description? Figure out later.
;	-DONE- Applicant in OppPieces3. Save for later.
;	-DONE- Opp Deadline in OppPieces4. Need to be reconfigured to docketing format.
;	Trouble with mark since column 5 is wordy. Will need user to add manually.
;	No reason this can't add to Live and AT simultaneously. Check with K.


global OppMonth0
global OppMonth1
global OppMonth2
global OppMonth3
global Applicant
global Class1
global Class5
global NewAction
global OppDeadline
global Computername
global ATDate
global Username
global DateLength
global FixedDeadline
global OppMark1
global LastMark

StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}
if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder
	
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate

TrayTip, Windows + S to docket opposition., Windows + S to docket opposition.
SetTimer, CloseWindow, 100
return

CloseWindow:
IfWinExist, Message from webpage, Record has successfully been saved.                ;  ahk_class #32770                   ;Message from webpage
	WinClose, Message from webpage, Record has successfully been saved.
IfWinExist, Message from webpage, The specified search criteria did not match any records.               ;  ahk_class #32770                   ;Message from webpage
	WinClose, Message from webpage, The specified search criteria did not match any records.
IfWinActive, Opening Mail Attachment, You should only open attachments from a trustworthy source.                ;  ahk_class #32770                   ;Message from webpage
	ControlSend,  , {Alt down}O{Alt up}, Opening Mail Attachment
IfWinActive, WorkSite, The version of this document                
	ControlSend,  , {Alt down}Y{Alt up}, WorkSite
IfWinActive, Microsoft Excel Security Notice
	ControlSend,  , {Alt down}Y{Alt up}, Microsoft Excel Security Notice
;IfWinExist, Web Browser              ;  ahk_class #32770                   ;Message from webpage
;	WinClose, Web Browser
return


#s::
Clipboard := ""
Class1 := ""
Class2 := ""
Class3 := ""
Class4 := ""
Class5 := ""
Class6 := ""

Sleep 500
SendInput ^c
ClipWait, 2


StringSplit, OppPieces, Clipboard, %A_Tab%
StringReplace, OppPieces1, OppPieces1, App, , 
StringReplace, OppPieces1, OppPieces1, `r`n,  , A
StringReplace, OppPieces1, OppPieces1, %A_Space%, , A 

if (OppPieces2 == "")
	{
	OppPieces2 := OppPieces3
	OppPieces3 := OppPieces4
	OppPieces4 := OppPieces5
	OppPieces5 := OppPieces6
	OppPieces6 := ""
	StringReplace, OppPieces2, OppPieces2, `r`n,  , 
	}
StringReplace, OppPieces3, OppPieces3, `r`n,  , A
DateLength := StrLen(OppPieces4)
Applicant := OppPieces3
OppMark := OppPieces5
StringSplit, OppMark, OppPieces5, `r`n
StringReplace, OppMark1, OppMark1, `r`n, A
StringReplace, OppMark5, OppMark5, `r`n, A

	if (OppMark1 == "This mark is same as the above one.")
		LegitMark := LastMark
	else if (OppMark1 == "This mark is same as the one above.")
		LegitMark := LastMark
	else if (OppMark1 == "This mark is the same as the above. ")
		LegitMark := LastMark		
	else ifinstring, OppMark1, The client own
		LegitMark := OppMark5
	else ifinstring, OppMark1, This mark is owned
		LegitMark := OppMark5	
	else
		LegitMark := OppMark1

NewAction := "Deadline to File Opposition (" OppPieces1 ")"
StringReplace, OppDeadline, OppPieces4, %A_Space%, -, A
StringSplit, OppMonth, OppDeadline, -
CorrectMonth(OppMonth1, OppMonth2, OppMonth3)
OppDeadline := OppMonth2 "/" OppMonth1 "/" OppMonth3
FixedDeadline := OppMonth3 OppMonth2 OppMonth1


StringSplit, Class, OppPieces2, `r`n
StringReplace, Class5, Class5, `r`n,  , A


AllGoods := % Class3 " " Class4 " " Class5 " " Class6

AllGoods := StrReplace(AllGoods, "SubClass Description: " , "")

Class5 := AllGoods


ie.document.getElementByID("fldstrActionType_TextBox").Value := NewAction

NewRemarks := OppPieces1 "`t" OppDeadline "`t" Class1 "`t" LegitMark "`t" Applicant "`t" Class5


Clipboard := NewRemarks

gosub DocketAction
return

CopyAction:
ClientCode := ""
Country := ""
ActionType := ""
BaseDate := ""
Remarks := ""
IssueDate := ""
Sleep 100
WinActivate, ahk_class IEFrame
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
BaseDate := ie.document.getElementByID("flddteBaseDate").Value
Remarks := ie.document.getElementByID("fldstrRemarks").Value
IssueDate :=  ie.document.getElementByID("flddteIssDate").Value
Sleep 200
return

DocketAction:
WinActivate, ahk_class IEFrame
gosub CopyAction
Sleep 100
ModifiedSwitchSystem2()
WinActivate, ahk_class IEFrame
gosub DocketNewAction
return


DocketNewAction:
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
CurrentURL := ie.LocationURL ; grab current url
ie.document.getElementByID("fldstrActionType_TextBox").Value := NewAction
if (DateLength < 25)
	{
	goto SkipCalendar
	}
else
	{
	WinGetPos, mX, mY, mW, mH, Action Detail	
	Sleep 250
	Gui, New, +AlwaysOnTop +LastFound +OwnDialogs ToolWindow, Can't confirm the opposition deadline.
	Gui, Add, Text, w225 Center , I couldn't confirm the deadline.`n`nDid the FA perhaps include the weekend?`n`nSelect the original deadline then click Submit.
	Gui, Add, MonthCal, vNewOppDeadline, %FixedDeadline%
	Gui, Add, Button, w225 gAddOppAction, Submit
	NewX := mX + mW/2 - 120
	NewY := mY + mH/2 - 65
	Gui, Show, x%NewX% y%NewY%
	return
	}

AddOppAction:
Gui, Submit
StringMid, NewYear, NewOppDeadline, 1, 4
StringMid, NewMonth, NewOppDeadline, 5, 2
StringMid, NewDay, NewOppDeadline, 7, 2
OppDeadline := NewMonth "/" NewDay "/" NewYear

SkipCalendar:
ie.document.getElementByID("flddteBaseDate").Value := OppDeadline
ie.document.getElementByID("btnSave").Click()
Gui, Destroy
Sleep 1250
Gui +LastFound +OwnDialogs +AlwaysOnTop
WinGetPos, mX, mY, mW, mH, Action Detail
Sleep 250
Gui, New, +AlwaysOnTop +LastFound +OwnDialogs ToolWindow, Confirm the mark is correct.
Gui, Add, Text, w225 Center , Does the mark look correct?`n`nIf not, fix it, then click Submit.
Gui, Add, Edit, w225 h100 vLegitMark, %LegitMark%
Gui, Add, Button, w225 gAddLegitMark, Submit
NewX := mX + mW/2 - 120
NewY := mY + mH/2 - 65
Gui, Show, x%NewX% y%NewY%, Confirm the mark is correct.
return

AddLegitMark:
Gui, Submit	
NewRemarks := ATDate " Possible opposition against`nApplication Number: " OppPieces1 " in Class " Class1 "`n"" " LegitMark " "" " "`nby " Applicant "`nOur Mark(s): HANBEV.204GEN`nRcvd via instr. " Username "`n`nGoods: " Class5
ie.document.getElementByID("btnEdit").Click()
ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
Sleep 1000
ie.document.getElementByID("btnSave").Click()
NewOppDeadline := ""
RespAtty := ""
NewRemarks := ""
OppMonth0 := ""
OppMonth1 := ""
OppMonth2 := ""
OppMonth3 := ""
Applicant := ""
Class1 := ""
Class5 := ""
NewAction := ""
OppDeadline := ""
OppPieces1 := ""
Mark := ""
LastMark := LegitMark
return

ModifiedSwitchSystem2()
{
ie := WBGet()
var := ie.LocationURL ; grab current url
;MsgBox, %var%
	IfInstring, var, CPiAgent
		var := "Agent"
	else IfInstring, var, CPi
		var := "Live"
	else
		{
		TrayTip, System Switch, Not on a docketing page.
		return
		}
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value	

if (ClientCode == "")
	ClientCode := ie.document.getElementByID("fldstrCaseNumber").Value	

qry := "SELECT * FROM dbo.vwAHKMatterInfo WHERE Matter = '" ClientCode "'"
result := ADOSQL(qry)
Sleep 100
liveUrl := result[2,5] 		; url in live docketing system
agentUrl := result[2,6] 	; url in agent docketing system

matterId := result[2,2] ;countryapp id or trademark id
system := result[2,4] ;matter type: patent or trademark

if (liveURL != "")
	{
	if (var == "Agent")
		{
		if (system == "Patent")
			NewURL := "http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=-1&key2=" matterId
		else
			NewURL := "http://oc-docketing/CPiAgent/tmkfrmActionDueAgent.aspx?key=-1&key2=" matterId
		}
	else if (var == "Live")
		{
		if (system == "Patent")
			NewURL := "http://oc-docketing/CPi/patfrmActionDue.aspx?key=-1&key2=" matterId
		else
			NewURL := "http://oc-docketing/CPi/tmkfrmActionDue.aspx?key=-1&key2=" matterId
		}
	}
params := [NewURL, 16384]
ie.Navigate(params*)
}

CorrectMonth(Day, Month, Year)
{

if (Day == 1)
	OppMonth1 = 01
if (Day == 2)
	OppMonth1 = 02
if (Day == 3)
	OppMonth1 = 03
if (Day == 4)
	OppMonth1 = 04
if (Day == 5)
	OppMonth1 = 05
if (Day == 6)
	OppMonth1 = 06
if (Day == 7)
	OppMonth1 = 07
if (Day == 8)
	OppMonth1 = 08
if (Day == 9)
	OppMonth1 = 09

if (Month = "January")
	OppMonth2 := "01"
if (Month = "February")
	OppMonth2 := "02"
if (Month = "March")
	OppMonth2 := "03"
if (Month = "April")
	OppMonth2 := "04"
if (Month = "May")
	OppMonth2 := "05"
if (Month = "June")
	OppMonth2 := "06"
if (Month = "July")
	OppMonth2 := "07"
if (Month = "August")
	OppMonth2 := "08"
if (Month = "September")
	OppMonth2 := "09"
if (Month = "October")
	OppMonth2 := "10"
if (Month = "November")
	OppMonth2 := "11"
if (Month = "December")
	OppMonth2 := "12"

return
}
		
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

Global ADOSQL_LastError, ADOSQL_LastQuery ; These super-globals are for debugging your SQL queries.

ADOSQL(Query_Statement) {

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
