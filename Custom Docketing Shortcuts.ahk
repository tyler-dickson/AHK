#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;																																		return
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, pifmgr.dll, 2
CoordMode, ToolTip 

global Computername
StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
	UserFolder = %A_LoopFileName%
if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder	
	
IniRead, Clicker1, C:\Users\%Computername%\Docketing Shortcuts.ini, Shortcuts, Clicker1
	if Clicker1 = ERROR
		Clicker1 = ^NumpadEnter
IniRead, Clicker2, C:\Users\%Computername%\Docketing Shortcuts.ini, Shortcuts, Clicker2
	if Clicker2 = ERROR
		Clicker2 = ^Numpad3
IniRead, Clicker3, C:\Users\%Computername%\Docketing Shortcuts.ini, Shortcuts, Clicker3
	if Clicker3 = ERROR
		Clicker3 = ^NumpadAdd
IniRead, Clicker4, C:\Users\%Computername%\Docketing Shortcuts.ini, Shortcuts, Clicker4
	if Clicker4 = ERROR
		Clicker4 = !Numpad7
IniRead, Clicker5, C:\Users\%Computername%\Docketing Shortcuts.ini, Shortcuts, Clicker5
	if Clicker5 = ERROR
		Clicker5 = !Numpad9
IniRead, Clicker6, C:\Users\%Computername%\Docketing Shortcuts.ini, Shortcuts, Clicker6
	if Clicker6 = ERROR
		Clicker6 = !Numpad4
IniRead, Clicker7, C:\Users\%Computername%\Docketing Shortcuts.ini, Shortcuts, Clicker7
	if Clicker7 = ERROR
		Clicker7 = !Numpad6
IniRead, Clicker8, C:\Users\%Computername%\Docketing Shortcuts.ini, Shortcuts, Clicker8
	if Clicker8 = ERROR
		Clicker8 = !Numpad5

IniRead, Uses, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
	if Uses = ERROR
		IniWrite, 0, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts

Gui, New, 		  AlwaysOnTop										, Customize!
Gui, Add, Edit,   Center ReadOnly   		Section        w100		, Click Edit/Save
Gui, Add, Edit,   Center ReadOnly   		xp 		yp+25  w100		, Click Undo
Gui, Add, Edit,   Center ReadOnly   		xp 		yp+25  w100		, Click Copy
Gui, Add, Edit,   Center ReadOnly   		xp 		yp+25  w100		, Click First Record
Gui, Add, Edit,   Center ReadOnly   		xp 		yp+25  w100		, Click Last Record
Gui, Add, Edit,   Center ReadOnly   		xp 		yp+25  w100		, Click Prev. Record
Gui, Add, Edit,   Center ReadOnly   		xp 		yp+25  w100		, Click Next Record
Gui, Add, Edit,   Center ReadOnly   		xp 		yp+25  w100		, Go Back to Main
;Gui, Add, Checkbox,  vWin1 Center 			xs-1105 ys+3   w50		, 
;Gui, Add, Checkbox,  vWin2 Center 			xs+105 	yp+25  w50		, Win +
;Gui, Add, Checkbox,  vWin3 Center 			xs+105 	yp+25  w50		, Win +
;Gui, Add, Checkbox,  vWin4 Center 			xs+105 	yp+25  w50		, Win +
;Gui, Add, Checkbox,  vWin5 Center 			xs+105 	yp+25  w50		, Win +
;Gui, Add, Checkbox,  vWin6 Center 			xs+105 	yp+25  w50		, Win +
;Gui, Add, Checkbox,  vWin7 Center 			xs+105 	yp+25  w50		, Win +
;Gui, Add, Checkbox,  vWin8 Center 			xs+105 	yp+25  w50		, Win +
Gui, Add, Edit,   vClicker1 ReadOnly		xs+110  ys 	   w100 	, Ctrl + Num Enter
Gui, Add, Hotkey, vClicker2 				xp 		yp+25  wp 		, %Clicker2%
Gui, Add, Hotkey, vClicker3 				xp 		yp+25  wp 		, %Clicker3%
Gui, Add, Hotkey, vClicker4 				xp 		yp+25  wp 		, %Clicker4%
Gui, Add, Hotkey, vClicker5 				xp 		yp+25  wp 		, %Clicker5%
Gui, Add, Hotkey, vClicker6 				xp 		yp+25  wp 		, %Clicker6%
Gui, Add, Hotkey, vClicker7 				xp 		yp+25  wp 		, %Clicker7%
Gui, Add, Hotkey, vClicker8  				xp 		yp+25  wp 		, %Clicker8%
Gui, Add, Button, gResetDefault				xs 		yp+25  w210		, Reset to Defaults
Gui, Add, Button, gJustSubmit				xs 		yp+25  w210		, Submit
Gui, Show
return

ResetDefault:
FileDelete, C:\Users\%Computername%\Docketing Shortcuts.ini
Reload
return

JustSubmit:
Gui, Submit

if Clicker1 != 
	Hotkey, ^NumpadEnter,  	ClickEdit, 				On
if Clicker2 !=
	Hotkey, %Clicker2%,  	ClickUndo, 				On
if Clicker3 !=
	Hotkey, %Clicker3%,  	ClickCopy, 				On
if Clicker4 !=
	Hotkey, %Clicker4%, 	ClickFirstRecord, 		On
if Clicker5 !=
	Hotkey, %Clicker5%, 	ClickLastRecord, 		On
if Clicker6 !=
	Hotkey, %Clicker6%, 	ClickPreviousRecord, 	On
if Clicker7 !=
	Hotkey, %Clicker7%, 	ClickNextRecord, 		On
if Clicker8 !=
	Hotkey, %Clicker8%, 	ClickBackToMain, 		On
	
IniWrite, %Clicker1%, C:\Users\%Computername%\Docketing Shortcuts.ini, Shortcuts, Clicker1
IniWrite, %Clicker2%, C:\Users\%Computername%\Docketing Shortcuts.ini, Shortcuts, Clicker2
IniWrite, %Clicker3%, C:\Users\%Computername%\Docketing Shortcuts.ini, Shortcuts, Clicker3
IniWrite, %Clicker4%, C:\Users\%Computername%\Docketing Shortcuts.ini, Shortcuts, Clicker4
IniWrite, %Clicker5%, C:\Users\%Computername%\Docketing Shortcuts.ini, Shortcuts, Clicker5
IniWrite, %Clicker6%, C:\Users\%Computername%\Docketing Shortcuts.ini, Shortcuts, Clicker6
IniWrite, %Clicker7%, C:\Users\%Computername%\Docketing Shortcuts.ini, Shortcuts, Clicker7
IniWrite, %Clicker8%, C:\Users\%Computername%\Docketing Shortcuts.ini, Shortcuts, Clicker8
return

CloseToolTip:
ToolTip, , ,
return

ClickEdit:
ToolTip, , 
ie := WBGet()
Status := ie.document.getElementById("tdbtnSave").style.display
	if Status = block
		{
		ie.document.getElementByID("btnSave").Click()
		WinGetPos, mX, mY, mW, mH, A
		ToolTip, Click Save Button, mX + mW/2, mY + mH/3, 
		SetTimer, CloseToolTip, 2500
		}
	else
		{
		ie.document.getElementByID("btnEdit").Click()
		WinGetPos, mX, mY, mW, mH, A
		ToolTip, Click Edit Button, mX + mW/2, mY + mH/3, 
		SetTimer, CloseToolTip, 2500
		}
IniRead, Uses, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
Uses++
IniWrite, %Uses%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
return

ClickUndo:
ToolTip, , 
ie := WBGet()
Status := ie.document.getElementById("tdbtnUndo").style.display
if Status != block
	return
else
	{
	WinGetPos, mX, mY, mW, mH, A
	ToolTip, Click Undo Button, mX + mW/2, mY + mH/3, 
	SetTimer, CloseToolTip, 2500
	ie.document.getElementByID("btnUndo").Click()
	IniRead, Uses, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
	Uses++
	IniWrite, %Uses%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
	}
return

ClickCopy:
ToolTip, , 
ie := WBGet()
Status := ie.document.getElementById("tdbtnSave").style.display
if Status != none
	return
else
	{
	WinGetPos, mX, mY, mW, mH, A
	ToolTip, Click Copy Button, mX + mW/2, mY + mH/3, 
	SetTimer, CloseToolTip, 2500
	ie.document.getElementByID("btnCopy").Click()
	IniRead, Uses, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
	Uses++
	IniWrite, %Uses%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
	}
return

ClickFirstRecord:
ToolTip, , 
WinGetPos, mX, mY, mW, mH, A
ToolTip, Click First Record, mX + mW/2, mY + mH/3, 
SetTimer, CloseToolTip, 2500
ie := WBGet()
ie.document.getElementByID("rsmMain_btnFirstRecord").Click()
IniRead, Uses, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
Uses++
IniWrite, %Uses%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
return

ClickLastRecord:
ToolTip, , 
WinGetPos, mX, mY, mW, mH, A
ToolTip, Click Last Record, mX + mW/2, mY + mH/3, 
SetTimer, CloseToolTip, 2500
ie := WBGet()
ie.document.getElementByID("rsmMain_btnLastRecord").Click()
IniRead, Uses, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
Uses++
IniWrite, %Uses%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
return

ClickPreviousRecord:
ToolTip, , 
WinGetPos, mX, mY, mW, mH, A
ToolTip, Click Previous Record, mX + mW/2, mY + mH/3, 
SetTimer, CloseToolTip, 2500
ie := WBGet()
ie.document.getElementByID("rsmMain_btnPreviousRecord").Click()
IniRead, Uses, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
Uses++
IniWrite, %Uses%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
return

ClickNextRecord:
ToolTip, , 
WinGetPos, mX, mY, mW, mH, A
ToolTip, Click Next Record, mX + mW/2, mY + mH/3, 
SetTimer, CloseToolTip, 2500
ie := WBGet()
ie.document.getElementByID("rsmMain_btnNextRecord").Click()
IniRead, Uses, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
Uses++
IniWrite, %Uses%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
return

^XButton1::
ClickBackToMain:
ToolTip, , 
WinGetPos, mX, mY, mW, mH, A
ToolTip, Back to Main Page, mX + mW/2, mY + mH/3, 
SetTimer, CloseToolTip, 2500
ie := WBGet()
location := ie.LocationURL	
links := ie.document.GetElementsByTagName("A").length
if InStr(location, "patfrmInvention") or InStr(location, "tmkfrmTrademark") 
	{
	if InStr(location, "tmkfrmTrademark") 
		return
	else
		{
		IfInstring, location, patfrmInventionAgent
			var := "Agent"
		else IfInstring, location, patfrmInvention
			var := "Live"
	
		ClientCode := ie.document.getElementByID("fldstrCaseNumber").Value	

		qry := "SELECT * FROM dbo.vwAHKMatterInfo WHERE Matter = '" ClientCode "'"
		result := ADOSQL(qry)
		Sleep 100
		liveUrl := result[2,5] 		; url in live docketing system
		agentUrl := result[2,6] 	; url in agent docketing system

		if (liveURL != "")
			{
			if (var == "Agent")
				NewURL := agentUrl
			else if (var == "Live")
				NewURL := liveUrl
			}
			OutputVar := NewURL
			params := [OutputVar, 16384]
			ie.Navigate(params*)
		}
	}
else
	{
	Loop %links%
		{
		Temp := ie.document.GetElementsByTagName("A")[A_Index-1].InnerText
			if ((Temp == "Country Application Detail") || (Temp == "Invention Detail") || (Temp == "Trademark Detail"))
				{
				ie.document.GetElementsByTagName("A")[A_Index-1].Click()
				break
				}		
		}
	}
IniRead, Uses, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
Uses++
IniWrite, %Uses%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CustomDocketingShortcuts
return

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
*/

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