#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, pifmgr.dll, 29
CoordMode, ToolTip 

global Live
global Agent
FormatTime, Today, , MM/dd/yyyy

FieldArray := ["flddtePriDate","flddteFilDate","flddtePubDate","flddtePubDate_2","flddteRegDate","flddteIssDate","flddteNextRenewalDate","flddteLastRenewalDate","flddteAllowanceDate","flddteParentPCTDate","flddteParentIssDate","flddteExpDate"]


StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}

if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder	

Gui, New, +Resize, Splitscreen Fork
Gui, Font, s12 bold
; Gui, Add, ActiveX, vLive w1280 h600 x0 y-72, Shell.Explorer
Gui, Add, ActiveX, vLive w1280 h600 x0 y0, Shell.Explorer
Gui, Add, UpDown, x0 yp+604 h33 Range0-1 gMoveStuff vAdjustUpdown -16 , 
; Gui, Add, Button, x5     y532 w150 h33 gSearchForATAction, Find Action in AT
Gui, Add, Button, xp+30     yp w135 h33 gSearchForATAction, ↓ Open in AT ↓
Gui, Add, Button, xp+140 yp   w180 h33 gDuplicateBiblio, ↓ Duplicate Biblio ↓
Gui, Add, Button, xp+320 yp   w200 h33 gDualResponseSent , ↓↑ 2x Response Sent ↑↓
Gui, Add, Button, xp+205 yp   w130 h33 gDualSave		 , ↓↑ 2x Save ↑↓
Gui, Font, s12 bold
Gui, Add, Text,   xp+180 yp+6   w180 h25 	 , Response Sent Date:
Gui, Add, Edit,   xp+180 yp-2   w100 h25 	vToday , %Today%


Gui, Font, 
;Gui, Add, Edit, ReadOnly x752 y532 h16 w500, Live URL
;Gui, Add, Edit, ReadOnly x752 yp+17 h16 w500, AT URL
;Gui, Font, bold




Gui, Add, ActiveX, vAgent w1280 h340 x0 y640, Shell.Explorer
OnMessage(0x100, "WB_OnKeyPress", 2) ; [color=green]; This when the GUI is initialized.[/color]
ComObjConnect(Live, Live_events)  ; Connect ie's events to the ie_events class object.
ComObjConnect(Agent, Agent_events)  ; Connect ie's events to the ie_events class object.

Live.silent := true
Agent.silent := true

LiveURL := "http://oc-docketing/CPi/patschCountryApplication.aspx"
ATURL := "http://oc-docketing/CPiAgent/patschCountryApplicationAgent.aspx"

Live.navigate(LiveURL)
Agent.navigate(ATURL)


Menu, FileMenu2, Add, &Patent Search, MenuHandler
Menu, FileMenu2, Add, &Trademark Search, MenuHandler
Menu, FileMenu2, Icon, &Patent Search,  %A_AhkPath%, 1
Menu, FileMenu2, Icon, &Trademark Search,  %A_AhkPath%, 1
Menu, MyMenuBar, Add, &Search Pages, :FileMenu2

/*

Menu, FileMenu, Add, Top Option, MenuHandler
Menu, FileMenu, Add, Middle Option (no icon), MenuHandler
Menu, FileMenu, Add, Bottom Option, MenuHandler
Menu, FileMenu, Icon, Top Option, %A_AhkPath%, 1 ; Use the 2nd icon group from the file
Menu, FileMenu, Icon, Bottom Option, %A_AhkPath%, -206 ; Use icon with resource identifier 206
Menu, MyMenuBar, Add, &This is the second Menu dropdown. I'm still figuring this part out., :FileMenu

Menu, FileMenu3, Add, Check box thing., MenuHandler
Menu, FileMenu3, Color, yellow, Single ; Use the 2nd icon group from the file
Menu, FileMenu3, Check, Check box thing.

*/
Menu, FileMenu3, Add, Yellow background., MenuHandler
Menu, FileMenu3, Icon, Yellow background., %A_AhkPath%, 3 ; Use the 2nd icon group from the file
Menu, FileMenu3, Disable, Yellow background.


Menu, MyMenuBar, Add, You can do Windows + A to do a Double Record Opener on a highlighted client code., :FileMenu3
Gui, Menu, MyMenuBar




Gui, Show, x0 y0 h1080 w1260
SetTimer, HideCPILogo, 60
return

MoveStuff:
if AdjustUpdown = 1
	{
	GuiControlGet, Pos, Pos, Live
	GuiControl, Move , Live, % "h" PosH - 10
	GuiControlGet, Pos, Pos, Agent
	GuiControl, Move , Agent, % "y" PosY - 10
	GuiControl, Move , Agent, % "h" PosH + 10
	GuiControlGet, PosB, Pos, Static1
	GuiControl, Move , Static1, % "y" PosBY - 10
	GuiControlGet, PosB, Pos, Edit1
	GuiControl, Move , Edit1, % "y" PosBY - 10
	GuiControlGet, PosB, Pos, AdjustUpdown
	GuiControl, MoveDraw , AdjustUpdown, % "y" PosBY - 10
	
	Loop 6
		{
		GuiControlGet, PosB, Pos, Button%A_Index%
		GuiControl, MoveDraw , Button%A_Index%, % "y" PosBY - 10
		}
	}
else
	{
	GuiControlGet, Pos, Pos, Live
	GuiControl, Move , Live, % "h" PosH + 10
	GuiControlGet, Pos, Pos, Agent
	GuiControl, Move , Agent, % "y" PosY + 10
	GuiControl, Move , Agent, % "h" PosH - 10
	GuiControlGet, PosB, Pos, Static1
	GuiControl, Move , Static1, % "y" PosBY + 10
	GuiControlGet, PosB, Pos, Edit1
	GuiControl, Move , Edit1, % "y" PosBY + 10
	GuiControlGet, PosB, Pos, AdjustUpdown
	GuiControl, MoveDraw , AdjustUpdown, % "y" PosBY + 10

	Loop 6
		{
		GuiControlGet, PosB, Pos, Button%A_Index%
		GuiControl, MoveDraw , Button%A_Index%, % "y" PosBY + 10
		}
	}
return

DuplicateBiblio:
Loop % FieldArray.Length()
	Agent.document.getElementById(FieldArray[A_Index]).Value := Live.document.getElementById(FieldArray[A_Index]).Value

Sleep 1000
Agent.document.getElementById("btnSave").Click()
return

SearchPatent:
LiveURL := Live.LocationURL
ATURL := Agent.LocationURL

GuiControl, , Edit1, %LiveURL%
GuiControl, , Edit2, %ATURL%
return

MenuHandler:
; MsgBox, % A_ThisMenu " | " A_ThisMenuItem " | "  A_ThisMenuItemPos

if (A_ThisMenuItem == "&Patent Search")
	{
	Live.navigate("http://oc-docketing/CPi/patschCountryApplication.aspx")
	Agent.navigate("http://oc-docketing/CPiAgent/patschCountryApplicationAgent.aspx")
	}
else if (A_ThisMenuItem == "&Trademark Search")
	{
	Live.navigate("http://oc-docketing/CPi/tmkschTrademark.aspx")
	Agent.navigate("http://oc-docketing/CPiAgent/tmkschTrademarkAgent.aspx")
	}
	
if (A_ThisMenuItem == "Check box thing.") 
	{
	Menu, FileMenu3, ToggleCheck, Check box thing.
	}

return

GuiClose:
ExitApp
return

HideCPILogo:
Live.document.getElementsByTagName("IMG")[0].style.display := "none"
Agent.document.getElementsByTagName("IMG")[0].style.display := "none"
; Agent.document.body.scrollTop := "75"
	
return

DualResponseSent:
Gui, Submit, NoHide
Live.document.getElementById("btnEdit").click()
Agent.document.getElementById("btnEdit").click()
Live.document.getElementById("flddteResponseDate").value := Today
Agent.document.getElementById("flddteResponseDate").value := Today
return

DualSave:
Live.document.getElementById("btnSave").click()
Agent.document.getElementById("btnSave").click()
return

DuplicateAction:
Agent.document.getElementById("btnEdit").click()
Agent.document.getElementById("fldstrActionType_TextBox").value := Live.document.getElementById("fldstrActionType_TextBox").value
Agent.document.getElementById("flddteBaseDate").value := Live.document.getElementById("flddteBaseDate").value
Agent.document.getElementById("flddteResponseDate").value := Live.document.getElementById("flddteResponseDate").value
Agent.document.getElementById("fldstrRemarks").value := Live.document.getElementById("fldstrRemarks").value
return

#a::
DualRecordOpener:
Clipboard := ""
Send ^c
ClipWait, .2
ClientCode := Clipboard
qry := "SELECT * FROM dbo.vwAHKMatterInfo WHERE Matter = '" ClientCode "'"
result := ADOSQL(qry)
Sleep 500
liveUrl := result[2,5] 		; url in live docketing system
agentUrl := result[2,6] 	; url in agent docketing system

; HANLB.110XJP


if (liveURL != "")
	{
	Live.navigate(liveUrl)
	Agent.navigate(agentUrl)
	}
else
	{
	Live.navigate("http://oc-docketing/CPi/patschCountryApplication.aspx")
	Agent.navigate("http://oc-docketing/CPiAgent/patschCountryApplicationAgent.aspx")
	ClientCode := ""
	liveUrl := ""
	agentUrl := ""
	result := ""
	qry := ""
	NewURL := ""
	return
	}
return

SearchForATAction:

if InStr(Live.LocationURL, "ActionDue")
	{
	NumberOfInputs := Live.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR").length
	temptemp := Live.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[NumberOfInputs - 1].getElementsByTagName("TD")[0].innerText
	StringSplit, temptemp, temptemp, `r`n   ; temptemp1 is the Action Due., temptemp3 is the Action Due Remarks.
	FirstAction := temptemp1
	}
else
	FirstAction := "NOPE"

var := Live.LocationURL ; grab current url
	IfInstring, var, CPiAgent
		var := "Agent"
	else IfInstring, var, CPi
		var := "Live"
ClientCode := Live.document.getElementByID("fldstrCaseNumber_TextBox").Value	

if (ClientCode == "")
	ClientCode := Live.document.getElementByID("fldstrCaseNumber").Value	

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


Agent.navigate(NewURL) 
while Agent.busy or Agent.ReadyState != 4 ;Wait for page to load
	Sleep, 100
var := Agent.LocationURL ; grab current ur

if (FirstAction != "NOPE")
	{
	Loop 20
	{
	NewAS := Agent.document.GetElementsBytagname("A").length
		if NewAS = 0 
			Sleep 250
		else
			break
	}

	NewNewURL := ""
	Loop %NewAS%
		{
		TempAction := Agent.document.GetElementsBytagname("A")[A_Index-1].InnerText
		ifinstring, TempAction, %FirstAction%
			{
			TempHTML := Agent.document.GetElementsBytagname("A")[A_Index-1].OuterHTML
		
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
		Interface.document.getElementById("findATAction").value := "Match found!"
		Agent.navigate(NewNewURL)
		}
	else	
		{
		
		}
	}

return



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

WB_OnKeyPress(wParam, lParam, nMsg, hWnd)
{
   WinGetClass WinClass, ahk_id %hWnd%
   if (WinClass == "Internet Explorer_Server")
   {
      static riid_IDispatch
      if !VarSetCapacity(riid_IDispatch)
      {
         VarSetCapacity(riid_IDispatch, 16)
         DllCall("ole32\CLSIDFromString", "WStr", "{00020400-0000-0000-C000-000000000046}", "Ptr", &riid_IDispatch)
      }
      DllCall("oleacc\AccessibleObjectFromWindow", "Ptr", hWnd, "UInt", 0xFFFFFFFC, "Ptr", &riid_IDispatch, "Ptr*", pacc) ; OBJID_CLIENT:=0xFFFFFFFC
      
      static IID_IHTMLWindow2 := "{332C4427-26CB-11D0-B483-00C04FD90119}"
      pwin := ComObjQuery(pacc, IID_IHTMLWindow2, IID_IHTMLWindow2)
         ObjRelease(pacc)
      
      static IID_IWebBrowserApp := "{0002DF05-0000-0000-C000-000000000046}"
           , SID_SWebBrowserApp := IID_IWebBrowserApp
      pweb := ComObjQuery(pwin, SID_SWebBrowserApp, IID_IWebBrowserApp)
         ObjRelease(pwin)
      wb := ComObject(9, pweb, 1)

      static IID_IOleInPlaceActiveObject := "{00000117-0000-0000-C000-000000000046}"
      pIOIPAO := ComObjQuery(wb, IID_IOleInPlaceActiveObject)

      VarSetCapacity(MSG, 48, 0)                      ; http://goo.gl/GX6GNm
      , NumPut(A_GuiY                                 ; POINT.y
      , NumPut(A_GuiX                                 ; POINT.x
      , NumPut(A_EventInfo                            ; time
      , NumPut(lParam                                 ; lParam
      , NumPut(wParam                                 ; wParam
      , NumPut(nMsg                                   ; message
      , NumPut(hWnd, MSG)))), "UInt"), "Int"), "Int") ; hwnd

      TranslateAccelerator := NumGet(NumGet(pIOIPAO + 0) + 5*A_PtrSize)
      Loop 2
         r := DllCall(TranslateAccelerator, "Ptr", pIOIPAO, "Ptr", &MSG)
      until (wParam != 9 || wb.Document.activeElement != "")
      ObjRelease(pIOIPAO)
      if (r == 0)
         return 0
   }
}
