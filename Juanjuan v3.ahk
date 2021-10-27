#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, Shell32.dll, 95


xl := ComObjActive("Excel.Application")
return


F2::
if instr((Name := ComObjType(ComObjActive("Outlook.Application").ActiveWindow, "Name")), "Inspector")
   OpenEmail := COMObjActive("Outlook.Application").ActiveInspector.CurrentItem
else if instr(Name, "Explorer")
   OpenEmail := COMObjActive("Outlook.Application").ActiveExplorer.Selection.Item(1)
else
   msgbox Active Outlook window is a %name% window

Address := OpenEmail.SenderEmailAddress
From := OpenEmail.SenderName
Subj := OpenEmail.Subject
Body := OpenEmail.Body

Body := RegExReplace(Body,"\bAPP\b","App")
Body := RegExReplace(Body,"\bApp\b","AppSplit`n")
AppArray := StrSplit(Body, "AppSplit")

MsgBox, % AppArray.Length()

StoredMark := ""
StartAt = 1
OuterIndex = 1
Loop % AppArray.Length()
	{
	AppArray[A_Index + StartAt] := StrReplace(AppArray[A_Index + StartAt], "`r`n`r`n", "`n")
	AppArray[A_Index + StartAt] := StrReplace(AppArray[A_Index + StartAt], " ", "", , 1)
	SubArray := StrSplit(AppArray[A_Index + StartAt], "`n")
	SubArray.RemoveAt(1, 1)
	SubArray.RemoveAt(SubArray.Length(), 1)
	SubArray.RemoveAt(SubArray.Length(), 1)
	

	if (OuterIndex == 1)
		{
		StoredMark := SubArray[SubArray.Length()]
		if InStr(StoredMark, "Original")
			StoredMark := SubArray[SubArray.Length() - 1]			
		}
	else
		{
;		MsgBox, %  StoredMark " | " SubArray[1] " | " SubArray[2] " | " SubArray[3] " | " SubArray[4] " | " SubArray[5] " | " OuterIndex		

		if (SubArray[1] != "")
			{
			xl.Range("A" . A_Index + StartAt).Value := SubArray[1]
			xl.Range("B" . A_Index + StartAt).Value := SubArray[4]
			; xl.Range("D" . A_Index + StartAt).Value := "Goods TBD"
			xl.Range("D" . A_Index + StartAt).Value := SubArray[3]
			xl.Range("F" . A_Index + StartAt).Value := StoredMark
			

			Loop % SubArray.Length()
				{

				if InStr(SubArray[A_Index], "Computerised")
					{
					xl.Range("C" . OuterIndex + StartAt).Value := SubArray[A_Index + 1]
					xl.Range("E" . OuterIndex + StartAt).Value := SubArray[A_Index + 2]
					break
					}
				}
			}
		}
	StoredMark := SubArray[SubArray.Length()]	; fixes if it has the Original TM Name wording.
	if InStr(StoredMark, "Original")
		StoredMark := SubArray[SubArray.Length() - 1]	
		
	OuterIndex++	
	}
return



F1::
if instr((Name := ComObjType(ComObjActive("Outlook.Application").ActiveWindow, "Name")), "Inspector")
   OpenEmail := COMObjActive("Outlook.Application").ActiveInspector.CurrentItem
else if instr(Name, "Explorer")
   OpenEmail := COMObjActive("Outlook.Application").ActiveExplorer.Selection.Item(1)
else
   msgbox Active Outlook window is a %name% window

Address := OpenEmail.SenderEmailAddress
From := OpenEmail.SenderName
Subj := OpenEmail.Subject
Body := OpenEmail.Body

Body := StrReplace(Body, "`t", "")

Body := RegExReplace(Body,"\bAPP\b","App")
Body := RegExReplace(Body,"\bApp\b","AppSplit`n")
AppArray := StrSplit(Body, "AppSplit")


; MsgBox, % AppArray[6]

StartAt = 2
Loop % AppArray.Length()
	{
	AppArray[A_Index + StartAt] := StrReplace(AppArray[A_Index + StartAt], "`r`n`r`n", "`n")
	AppArray[A_Index + StartAt] := StrReplace(AppArray[A_Index + StartAt], " ", "", , 1)
	
	SubArray := StrSplit(AppArray[A_Index + StartAt], "`n")
	SubArray.RemoveAt(1, 1)
	
	Loop % SubArray.Length()
		{
		if InStr(SubArray[A_Index], "Subclass")
			{
			SubArray.RemoveAt(A_Index, 1)
			break
			}
		}



	if (SubArray[2] == " ")
		SubArray.RemoveAt(2, 1)
	if (SubArray[2] == " ")
		SubArray.RemoveAt(2, 1)
	if (SubArray[4] == " ")
		SubArray.RemoveAt(4, 1)


	tempCount = 0
	Loop % SubArray.Length()
		{
		if (SubArray[A_Index - tempCount] == " ")
			{
			SubArray.RemoveAt(A_Index - tempCount, 1)
			tempCount++
			}
		}

;	SubArray[2] := StrReplace(SubArray[2], " ", "$")

;	if (SubArray[2] == "Class $")
;		{
;		msgbox, it's fucked
;		
;		SubArray.RemoveAt(2, 1)
;		
;		}

		
;	MsgBOx, % "|" SubArray[1] "|`n|" SubArray[2] "|`n" SubArray[3] "`n" SubArray[4] "`n" SubArray[5] "`n" SubArray[6] "`n" SubArray[7] 	
		
	SubArray[2] := StrReplace(SubArray[2], " ", "")
		
	if SubArray[1] != ""
		{
		if (InStr(SubArray[2], " ") && SubArray[7] != "")
			{
			SubArray.RemoveAt(2, 1)
			xl.Range("A" . A_Index + StartAt).Value := SubArray[1]
			xl.Range("B" . A_Index + StartAt).Value := SubArray[2]
			xl.Range("C" . A_Index + StartAt).Value := SubArray[3]
			xl.Range("D" . A_Index + StartAt).Value := SubArray[4]
			xl.Range("E" . A_Index + StartAt).Value := SubArray[5]
			xl.Range("F" . A_Index + StartAt).Value := SubArray[6]			
			}
		else if (SubArray.Length() > 10 && !InStr(SubArray[5], "same") && !InStr(SubArray[6], "same"))
			{
			xl.Range("A" . A_Index + StartAt).Value := SubArray[1]
			xl.Range("B" . A_Index + StartAt).Value := SubArray[2]
			xl.Range("C" . A_Index + StartAt).Value := SubArray[3]
			xl.Range("D" . A_Index + StartAt).Value := SubArray[4]
			xl.Range("E" . A_Index + StartAt).Value := SubArray[5]
			xl.Range("F" . A_Index + StartAt).Value := SubArray[6]
			}
		else if InStr(SubArray[5], "same")
			{
			xl.Range("A" . A_Index + StartAt).Value := SubArray[1]
			xl.Range("B" . A_Index + StartAt).Value := SubArray[2]
			xl.Range("C" . A_Index + StartAt).Value := SubArray[3]
			xl.Range("D" . A_Index + StartAt).Value := xl.Range("D" . A_Index + StartAt - 1).Value
			xl.Range("E" . A_Index + StartAt).Value := SubArray[4]
			xl.Range("F" . A_Index + StartAt).Value := xl.Range("F" . A_Index + StartAt - 1).Value			
			}
		else if InStr(SubArray[6], "same")
			{
			xl.Range("A" . A_Index + StartAt).Value := SubArray[1]
			xl.Range("B" . A_Index + StartAt).Value := SubArray[2]
			xl.Range("C" . A_Index + StartAt).Value := SubArray[3]
			xl.Range("D" . A_Index + StartAt).Value := SubArray[4]
			xl.Range("E" . A_Index + StartAt).Value := SubArray[5]
			xl.Range("F" . A_Index + StartAt).Value := xl.Range("F" . A_Index + StartAt - 1).Value			
			}
		else if InStr(SubArray[7], "same")
			{
			xl.Range("A" . A_Index + StartAt).Value := SubArray[1]
			xl.Range("B" . A_Index + StartAt).Value := SubArray[2]
			xl.Range("C" . A_Index + StartAt).Value := SubArray[3]
			xl.Range("D" . A_Index + StartAt).Value := SubArray[4]
			xl.Range("E" . A_Index + StartAt).Value := SubArray[5]
			xl.Range("F" . A_Index + StartAt).Value := xl.Range("F" . A_Index + StartAt - 1).Value			
			}
		else
			{
			xl.Range("A" . A_Index + StartAt).Value := SubArray[1]
			xl.Range("B" . A_Index + StartAt).Value := SubArray[2]
			xl.Range("C" . A_Index + StartAt).Value := SubArray[3]
			xl.Range("D" . A_Index + StartAt).Value := xl.Range("D" . A_Index + StartAt - 1).Value
			xl.Range("E" . A_Index + StartAt).Value := xl.Range("E" . A_Index + StartAt - 1).Value
			xl.Range("F" . A_Index + StartAt).Value := xl.Range("F" . A_Index + StartAt - 1).Value		
			}

		if (xl.Range("B" . A_Index + StartAt).Value == "")
			{
			xl.Range("B" . A_Index + StartAt).Value := "ERROR"
			xl.Range("B" . A_Index + StartAt).Interior.ColorIndex := 3 ; https://the-automator.com/shading-cells-in-excel-with-autohotkey/
			
			}
		}
	}
return


#s::

AppNo := % xl.ActiveCell.Value
MsgBox, % AppNo

return

gosub DocketAction
; gosub ClearVariables
return

DocketAction:
WinActivate, ahk_class IEFrame
gosub CopyAction
Sleep 100
ModifiedSwitchSystem2()
WinActivate, ahk_class IEFrame
gosub DocketNewAction
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

DocketNewAction:
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
CurrentURL := ie.LocationURL ; grab current url
ie.document.getElementByID("fldstrActionType_TextBox").Value := NewAction

NewRemarks := ATDate " Possible opposition against`nApplication Number: " OppPieces1 " in Class " Class1 "`n"" " LegitMark " "" " "`nby " Applicant "`nOur Mark(s): HANBEV.204GEN`nRcvd via instr. " Username "`n`nGoods: " Class5
ie.document.getElementByID("btnEdit").Click()
ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
Sleep 1000
ie.document.getElementByID("btnSave").Click()
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
