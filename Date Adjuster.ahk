#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, pifmgr.dll, 11
CoordMode, ToolTip 

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

FormatTime, Today, , MM/dd/yyyy

Gui, New, ToolWindow AlwaysOnTop, Date Adjuster
Gui, Font, underline
Gui, Add, Text, Center x5 w100, Quick Close Date
Gui, Font, 
Gui, Add, Edit, Center vQuickCloseDate w100, %Today%
Gui, Add, Checkbox, vCheckcheck x3, Include Remarks?`n(Custom soon!)
Gui, Add, Checkbox, Checked vCheckcheck2 x3, Allow Multi-close?
Gui, Add, Button, gSubmit x5 w100 h30, Inject Buttons
Gui, Show, w110
return

QuickResponseSent:
Gui, Submit, NoHide
ie := WBGet()
location := ie.LocationURL
if InStr(location, "Action")
	{
	ie.document.getElementById("flddteResponseDate").value := QuickCloseDate
	Sleep 200
	ie.document.getElementsByName("btnSave")[0].Click()
	}
else
	{
	GuiControl, , Button4, Not in an action!
	Sleep 2000
	GuiControl, , Button4, Response Sent
	return
	}
return

UpdateStatus:
ie := WBGet()
ie.document.getElementById("fldstrCaseType_TextBox").value := A_GuiControl
Sleep 200
ie.document.getElementsByName("btnSave")[0].Click()
return

Submit:
Gui, Submit, NoHide
if (Checkcheck)
	NewRemarks := ATDate " Sent FA Notification of Transfer (" DocumentNumber "); " Username
else
	NewRemarks := ""

actionIframes = 
ie := WBGet()
location := ie.LocationURL

if InStr(location, "Action")
	{
	WhereWeAt := "InsideAction"
	NumberOfInputs  := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR").length
	}
else
	{
	WhereWeAt := "MainScreen"	
	NumberOfInputs  := ie.document.getElementById("dgdAction").getElementsByTagName("TBODY")[0].getElementsByTagName("TR").length
	}

Loop %NumberOfInputs%
	{
	if WhereWeAt = InsideAction
		{
		temppos  := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index-1].getElementsByTagName("INPUT")[0]
		position := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index-1].getElementsByTagName("INPUT")[1]
		}
	else
		{
		temppos  := ie.document.getElementById("dgdAction").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index-1].getElementsByTagName("INPUT")[0]
		position := ie.document.getElementById("dgdAction").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index-1].getElementsByTagName("INPUT")[1]
		}
	temptemp := temppos.OuterHTML
	
	isVisible := ie.document.getElementById("dgdAction").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index-1].style.display

	if isVisible = none
		{
		}
	else	
		{
		middleSection := SubStr(temptemp, 38, 8)
		StringReplace, middleSection, middleSection, ),  , A

		if InStr(location, "patfrmCountryApplicationAgent")	|| InStr(location, "patfrmActionDueAgent")	
			NewSource := "http://oc-docketing/CPiAgent/patfrmActDateTakenAgent.aspx?key=" . middleSection
		else if InStr(location, "patfrmCountryApplication") ||  InStr(location, "patfrmActionDue")
			NewSource := "http://oc-docketing/CPi/patfrmActDateTaken.aspx?key=" . middleSection
		else if InStr(location, "tmkfrmTrademarkAgent")	|| InStr(location, "tmkfrmActionDueAgent")	
			NewSource := "http://oc-docketing/CPiAgent/tmkfrmActDateTakenAgent.aspx?key=" . middleSection
		else if InStr(location, "tmkfrmTrademark") || InStr(location, "tmkfrmActionDue")	
			NewSource := "http://oc-docketing/CPi/tmkfrmActDateTaken.aspx?key=" . middleSection
			
		
		if (Checkcheck2)
			{
			actionIframes = 
			(
			<button title="Quick Close" id="%middleSection%" value1="%middleSection%" style="border: 1px solid black; cursor: pointer; font: 12px; font-weight: bold; background-color: beige; width: 20px; height: 20px; visibility: hidden;"  
			onclick="
			
			
			
			document.parentWindow.frames('closeAction%A_Index%').document.getElementById('flddteDateTaken').value = '%QuickCloseDate%'; 
			var tempRemarks = document.parentWindow.frames('closeAction%A_Index%').document.getElementById('fldstrRemarks').value; 
			document.parentWindow.frames('closeAction%A_Index%').document.getElementById('fldstrRemarks').value = '%NewRemarks%\r\n' + tempRemarks; 
			document.parentWindow.frames('closeAction%A_Index%').document.getElementById('btnSave').click(); 
			
			
			this.value = 'OK';
			
			try {
				document.getElementById('dgdAction').getElementsByTagName('TBODY')[0].getElementsByTagName('TR')[%A_Index% - 1].style.backgroundColor = 'lightgreen'; 
			} catch (ex) {
				document.getElementById('dgdDueDate').getElementsByTagName('TBODY')[0].getElementsByTagName('TR')[%A_Index% - 1].style.backgroundColor = 'lightgreen'; 
				document.getElementById('fldstrActionType_TextBox').value = 'I CLOSED SOME ACTIONS. REFRESH PAGE TO SEE.';
				document.getElementById('fldstrActionType_TextBox').style.backgroundColor = 'lightgreen';
				document.getElementById('fldstrActionType_TextBox').style.fontWeight = 'bold';
			}
			
			this.style.color = 'green';">✔️</button>
			)
			<iframe id="closeAction%A_Index%" value1="0" width="800" height="500" src="%NewSource%" onload="document.getElementById('%middleSection%').style.visibility = 'visible';"></iframe>

			}
		else 
			{
			actionIframes = 
			(
			<button title="Quick Close" id="%middleSection%" value1="%middleSection%" style="border: 1px solid black; cursor: pointer; font: 12px; font-weight: bold; background-color: beige; width: 20px; height: 20px; visibility: hidden;"  
			onclick="document.parentWindow.frames('closeAction%A_Index%').document.getElementById('flddteDateTaken').value = '%QuickCloseDate%'; 
			var tempRemarks = document.parentWindow.frames('closeAction%A_Index%').document.getElementById('fldstrRemarks').value; 
			document.parentWindow.frames('closeAction%A_Index%').document.getElementById('fldstrRemarks').value = '%NewRemarks%\r\n' + tempRemarks; 
			document.parentWindow.frames('closeAction%A_Index%').document.getElementById('btnSave').click(); 
			location.assign('%location%');" 

			onmouseover="this.value = '❌'; this.style.backgroundColor = 'red';" 
			onmouseout="this.value = '✔️'; this.style.backgroundColor = 'beige';">✔️</button>
			)
			

		<iframe id="closeAction%A_Index%" value1="0" width="0" height="0" src="%NewSource%" onload="document.getElementById('%middleSection%').style.visibility = 'visible';"></iframe>
		}
		if WhereWeAt = InsideAction
			position.insertAdjacentHTML("afterend", "&nbsp;" . actionIframes)
		else
			temppos.insertAdjacentHTML("afterend", "&nbsp;" . actionIframes)	
		}
	}
return


/*
CloseFirstAction:
Sleep 200
ie.document.parentWindow.frames("closeAction1").document.getElementById("fldstrRemarks").value := NewRemarks
Sleep 200
ie.document.parentWindow.frames("closeAction1").document.getElementById("flddteDateTaken").value := QuickCloseDate 
Sleep 200
ie.document.parentWindow.frames("closeAction1").document.getElementById("btnSave").click()
ie.navigate(location)
return
*/


SearchForATAction:
NewURL := ""
ie := WBGet()
location := ie.LocationURL

ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value	

if (ClientCode == "")
	ClientCode := ie.document.getElementByID("fldstrCaseNumber").Value	

if InStr(location, "Action")
	WhereWeAt := "InsideAction"
else
	WhereWeAt := "MainScreen"

Gui, 10: Add, ActiveX, w0 h0 x-1000 y-1000 vie3, Shell.Explorer  ; The final parameter is the name of the ActiveX component.	
if WhereWeAt = InsideAction
	{
	ie := WBGet()
	NumberOfInputs := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR").length
	temptemp := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[NumberOfInputs - 1].getElementsByTagName("TD")[0].innerText
	StringSplit, temptemp, temptemp, `r`n   ; temptemp1 is the Action Due., temptemp3 is the Action Due Remarks.
	FirstAction := temptemp1
	}
else 
	FirstAction := "Send FA Notification Letter - Knobbe New Atty / TAT "

GuiControl, , Button5, Action grabbed...
var := ie.LocationURL ; grab current url
	IfInstring, var, CPiAgent
		var := "Agent"
	else IfInstring, var, CPi
		var := "Live"

qry := "SELECT * FROM dbo.vwAHKMatterInfo WHERE Matter = '" ClientCode "'"
result := ADOSQL(qry)
Sleep 100
liveUrl := result[2,5] 		; url in live docketing system
agentUrl := result[2,6] 	; url in agent docketing system

if (liveURL != "")
	{
	if (var == "Agent")
		NewURL := liveUrl
	else if (var == "Live")
		NewURL := agentUrl
	}

GuiControl, , Button5, Checking AT system...
ie3.silent := true
ie3.navigate(NewURL) 
GuiControl, 2:, Button27, Looking for match...
while ie3.busy or ie3.ReadyState != 4 ;Wait for page to load
	Sleep, 100
var := ie3.LocationURL ; grab current url

Loop 20
{
NewAS := ie3.document.GetElementsBytagname("A").length
	if NewAS = 0 
		Sleep 250
	else
		break
}
GuiControl, , Button5, Looking through actions...

NewNewURL := ""
Loop %NewAS%
	{
	TempAction := ie3.document.GetElementsBytagname("A")[A_Index-1].InnerText

	ifinstring, TempAction, %FirstAction%
		{
		TempHTML := ie3.document.GetElementsBytagname("A")[A_Index-1].OuterHTML
	
		StringSplit, TempHTML, TempHTML, ",    ;"
		StringSplit, NewURL, TempHTML2, =, 
		StringSplit, NewUrlSplit, NewUrl2, &
		
		if instr(var, "http://oc-docketing/CPi/")
			NewNewURL := "http://oc-docketing/CPi/" . NewURL1 . "=" . NewUrlSplit1
		else if instr(var, "http://oc-docketing/CPiAgent/")
			NewNewURL := "http://oc-docketing/CPiAgent/" . NewURL1 . "=" . NewUrlSplit1
		;GuiControl, 2:, Button27, Match found! Click to open.
		;GuiControl, 2: Enable, Button27
		;SetTimer, TurnOffToolTip, -5000
		}
	}

if NewNewURL != 
	{
	GuiControl, , Button5, Match found! Opening action.
	if CherToggle = 1
		Run iexplore.exe  %NewNewURL% 
	else
		Run %NewNewURL%
	}
else	
	{
	GuiControl, , Button5, Didn't find it :(`nSwitching system.
	Run %NewURL%	
	}
	Sleep 3000
	GuiControl, , Button5, System Switch
	Gui, 10: Destroy
return

GuiClose:
ExitApp
return

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