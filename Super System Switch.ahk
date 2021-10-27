#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, pifmgr.dll, 27
Enabled := ComObjError(false)


StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}

if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder	
	
return

#s::
Clipboard := ""
Send ^c
ClipWait, .5
SwitchSystem()
Sleep 500
ie := WBGet()
var := ie.LocationURL ; grab current url
Sleep 500
AS := ie.document.GetElementsBytagname("A").length

;ie2 := ComObjCreate("InternetExplorer.Application")
;ie2.Visible := true
;params := [OutputVar, 4096]
;params := [var, 32]

Loop %AS%
{
TempAction := ie.document.GetElementsBytagname("A")[A_Index-1].InnerText
	ifinstring, TempAction, %Clipboard%
		{
		TempHTML := ie.document.GetElementsBytagname("A")[A_Index-1].OuterHTML
		StringSplit, TempHTML, TempHTML, ",    ;"
		StringSplit, NewURL, TempHTML2, =, 
		StringSplit, NewUrlSplit, NewUrl2, &
		NewNewURL := "http://oc-docketing/CPiAgent/" . NewURL1 . "=" . NewUrlSplit1
		params := [NewNewURL, 32]
		;ie.Navigate(params*)
		;MsgBox, Found it! %Clipboard% `n %NewURL0%`n%NewURL1%`n%NewURL2%`n%NewURL3%
		}
}
ie.Navigate(params*)
return

SwitchSystem()
{
WinActivate, ahk_class IEFrame
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

if (liveURL != "")
	{
	if (var == "Agent")
		NewURL := liveUrl
	else if (var == "Live")
		NewURL := agentUrl
	}
else
	{
	TrayTip, System Switch, Not on a docketing page.
	ClientCode := ""
	liveUrl := ""
	agentUrl := ""
	result := ""
	qry := ""
	NewURL := ""
	return
	}
TrayTip, System Switch, Opening in opposite system.
	if CherToggle = 1
		Run iexplore.exe  %NewURL% 
	else
		Run, %NewURL%
	
Sleep 1500
ClientCode := ""
liveUrl := ""
agentUrl := ""
result := ""
qry := ""
NewURL := ""
gosub RecordSysSwitch
SendInput {Ctrl up}
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

/*
The version for AHK-Basic can be found here.

Here's a sample showing the use of microsoft's ODBC text driver with a csv file.SetWorkingDir, % A_ScriptDir
IfNotExist, products.csv
	FileAppend,
(
P_CODE,P_DESCRIPT,P_INDATE,P_QOH,P_MIN,P_PRICE,P_DISCOUNT,V_CODE
"11QER/31","Power painter,15 psi.,3-nozzle","03-NOV-2011",8,5,109.99,0.00,25595
"13-Q2/P2","7.25-in. pwr. saw blade","13-DEC-2011",32,15,14.99,0.05,21344
"14-Q1/L3","9.00-in. pwr. saw blade","13-NOV-2011",18,12,17.49,0.00,21344
"1546-QQ2","Hrd. cloth,1/4-in.,2x50","15-JAN-2012",15,8,39.95,0.00,23119
"1558-QW1","Hrd. cloth,1/2-in.,3x50","15-JAN-2012",23,5,43.99,0.00,23119
"2232/QTY","B\&D jigsaw,12-in. blade","30-DEC-2011",8,5,109.92,0.05,24288
"2232/QWE","B\&D jigsaw,8-in. blade","24-DEC-2011",6,5,99.87,0.05,24288
"2238/QPD","B\&D cordless drill,1/2-in.","20-JAN-2012",12,5,38.95,0.05,25595
"23109-HB","Claw hammer","20-JAN-2012",23,10,9.95,0.10,21225
"23114-AA","Sledge hammer,12 lb.","02-JAN-2012",8,5,14.40,0.05,NULL 
"54778-2T","Rat-tail file,1/8-in. fine","15-DEC-2011",43,20,4.99,0.00,21344
"89-WRE-Q","Hicut chain saw,16 in.","07-FEB-2012",11,5,256.99,0.05,24288
"PVC23DRT","PVC pipe,3.5-in.,8-ft","20-FEB-2011",188,75,5.87,0.00,NULL 
"SM-18277","1.25-in. metal screw,25","01-MAR-2012",172,75,6.99,0.00,21225
"SW-23116","2.5-in. wd. screw,50","24-FEB-2012",237,100,8.45,0.00,21231
"WR3/TT3","Steel matting,4""x8""x1/6",.5" mesh","17-JAN-2012",18,5,119.95,0.10,25595
), products.csv

connection_string =
( ltrim join;
	Driver={Microsoft Text Driver (*.txt; *.csv)}
	Extensions=asc,csv,tab,txt
	Persist Security Info=False
)

MsgBox % ADOSQL( connection_string ";coldelim=   `t", "
(
	SELECT P_CODE, P_PRICE, P_DESCRIPT
	FROM products.csv
	WHERE P_PRICE > ( SELECT AVG( P_PRICE ) FROM products.csv )
)")

filedelete, products.csv
*/



















/*

Gui, 2: Add, DateTime, x0 y200 w220, dd-MMM-yyyy
Gui, 2: Add, Button, x-100 y25 w70 gClickButton, Button1
Gui, 2: Add, Button, x-100 y50 w70 gClickButton, Button2
Gui, 2: Add, Button, x-100 y75 w70 gClickButton, Button3
Gui, 2: Add, Button, x-100 y100 w70 gClickButton, Button4
Gui, 2: Add, Button, x-100 y125 w70 gClickButton, Button5
Gui, 2: Add, Button, x-100 y150 w70 gClickButton, Button6
Gui, 2: Add, Button, x-100 y175 w70 gClickButton, Button7
Gui, 2: Add, Button, x-100 y200 w70 gClickButton, Button8
Gui, 2: Add, Button, x-100 y225 w70 gClickButton, Button9
Gui, 2: Add, Button, x-100 y250 w70 gClickButton, Button10
Gui, 2: Add, Button, x-100 y25 w100 gInputButton, Button11
Gui, 2: Add, Button, x-100 y50 w100 gInputButton, Button12
Gui, 2: Add, Button, x-100 y75 w100 gInputButton, Button13
Gui, 2: Add, Button, x-100 y100 w100 gInputButton, Button14
Gui, 2: Add, Button, x-100 y125 w100 gInputButton, Button15
Gui, 2: Add, Button, x-100 y150 w100 gInputButton, Button16
Gui, 2: Add, Button, x-100 y200 w100 gInputButton, Button17
Gui, 2: Add, Button, x150 y225 w50 h50 gAdd15D, ADD 15D
Gui, 2: Add, Text,   x0 y300, Number of As: %AS%
Gui, 2: Add, Text,   x0 y325, Number of INPUTs: %INPUTS%
Gui, 2: Add, Text,   x0 y350, Number of SPANs: %SPANS%
Gui, 2: Add, Text,   x0 y375, Number of TEXTAREAs: %TEXTAREAS%


return

ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value	
MsgBox, % ie2.document.GetElementsBytagname("A")[0].InnerText ; Use for multi-level & change array value

Gui, New, ,Docketing SuperEdit
Gui, Add, ActiveX, x0 y0 w800 h800 vie, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
ie.Navigate("http://oc-docketing/CPi/patfrmActDueDate.aspx?key=9686728&bc=1&key2=1275806")  ; This is specific to the web browser control.
ie.silent := true
Gui, Show
return

    THIS IS THE ONE IN THE TOP-LEFT CORNER - MsgBox, % "SPAN 0 - " ie.document.GetElementsBytagname("SPAN")[0].InnerText ; Click() 
	MsgBox % ie.document.GetElementsBytagname("A")[0].InnerText  ; HAVE TO CLICK ON A, not SPAN


ie.document.GetElementsBytagname("A")[0].Click()

Msgbox, % "Number of <A>: "ie.document.GetElementsBytagname("A").length
Msgbox, % "Number of <INPUT>: "ie.document.GetElementsBytagname("INPUT").length
Msgbox, % "Number of <SPAN>: "ie.document.GetElementsBytagname("SPAN").length

;GuiControl, 2: , Static1, As: %AS%
;GuiControl, 2: , Static2, Inputs: %INPUTS%
;GuiControl, 2: , Static3, SPANS: %SPANS%
;GuiControl, 2: , Static4, TextAreas: %TEXTAREAS%

;Loop 17
;{
;GuiControl, 2: , Button%A_Index%,	
;}

;Loop %AS%
;{
;Temp%A_Index% := ie2.document.GetElementsBytagname("A")[A_Index-1].OuterHTML

;ifinstring, Temp%A_Index% , save
	;GuiControl, 2: , Button%A_Index%, Save %A_Index%	
;else ifinstring, Temp%A_Index% , delete
	;GuiControl, 2: , Button%A_Index%, Delete %A_Index%	
;else ifinstring, Temp%A_Index% , cancel
	;GuiControl, 2: , Button%A_Index%, Cancel %A_Index%		
;else ifinstring, Temp%A_Index% , edit
	;GuiControl, 2: , Button%A_Index%, Edit %A_Index%		
	
		; A's
		; 0 = <blank>
		; 1 = <blank>
		; 2 = <bunch of junk>
		; 3 = Action Due
		; 4 = Due Date
		; 5 = Indicator
		; 6 = Indicator too.
		; 7 = Date Taken
		; 8 = Responsible
		; 9 = Responsible too.
		; 10 = Face on/off.
;}

;Loop 6
;{
;CurrentButton := A_Index + 10
;Offset := CurrentButton - 7
;Temp%CurrentButton% := ie2.document.GetElementsBytagname("INPUT")[CurrentButton-1].OuterHTML
;Value%CurrentButton% := ie2.document.GetElementsBytagname("INPUT")[Offset-1].Value

;ifinstring, Temp%A_Index% , save
;	GuiControl, 2: , Button%A_Index+10%, Save %A_Index%	
;else

	;if (CurrentButton == 14)
		;{
		;MsgBox, %Offset% %CurrentButton%
		;CurrentButton := CurrentButton - 2
		;Offset++
		;CurrentButton++
		;MsgBox, %Offset% %CurrentButton%
		
		
	;	GuiControl, 2: , Button%CurrentButton%, % Value%CurrentButton% "% " Offset
	;	}
	;else
		;GuiControl, 2: , Button%CurrentButton%, % Value%CurrentButton% "| " Offset

	; INPUTs
	; 0 = <junk>
	; 1 = <junk>
	; 2 = <junk>
	; 3 = <junk>
	; 4 = Action Due
	; 5 = Due Date
	; 6 = Due Date
	; 7 = Indicator
	; 8 = Date Taken
	; 9 = Responsible
;}

;MsgBox, % ie2.document.GetElementsBytagname("TEXTAREA")[0].Value
;GuiControl, 2: , Button17, % ie2.document.GetElementsBytagname("TEXTAREA")[0].Value

;return

	

else ifinstring, Temp%A_Index% , cancel
	{
	Gui, Add, Button, gClickButton xp+50, CANCEL - %A_Index%	
	INPUTS := ie2.document.GetElementsBytagname("INPUT").length
		Loop %INPUTS%
		{
		;MsgBox, % A_Index-1 " | " ie2.document.GetElementsBytagname("INPUT")[A_Index-1].Value
		if ((A_Index - 1 == 3) || (A_Index - 1 == 4) ||  (A_Index - 1 == 5) || (A_Index - 1 == 7) || (A_Index - 1 == 8))
			GuiControl, 2: , Button%A_Index%, % "As: " ie2.document.GetElementsBytagname("INPUT")[A_Index-1].Value	
		
		
		; A's
		; 0 = <blank>
		; 1 = <blank>
		; 2 = <bunch of junk>
		; 3 = Action Due
		; 4 = Due Date
		; 5 = Indicator
		; 6 = Indicator too.
		; 7 = Date Taken
		; 8 = Responsible
		; 9 = Responsible too.
		; 10 = Face on/off.
		
		}
		ie2.document.GetElementsBytagname("INPUT")[5].Value := "test"
		CurrentRemarks := ie2.document.GetElementsBytagname("TEXTAREA")[0].Value
		Gui, Add, Button, gTestButton xp yp+25, % ie2.document.GetElementsBytagname("TEXTAREA")[0].Value	
		;ie2.document.GetElementsBytagname("TEXTAREA")[0].Value := "This is a test.`n" . CurrentRemarks
	}
else ifinstring, Temp%A_Index% , edit
	Gui, Add, Button, gClickButton x0, EDIT - %A_Index%
	

;}
;Gui, Show,

ClickButton:
FullString := A_GuiControl
MsgBox, %FullString%
Button := SubStr(A_GuiControl, 0, 1)
MsgBox, % ie2.document.GetElementsBytagname("A")[Button-1].OuterHTML
ie2.document.GetElementsBytagname("A")[Button-1].Click()
ifinstring, FullString, save
	Sleep 300
gosub RefreshGUI
return

InputButton:
FullString := A_GuiControl
MsgBox, %FullString%
Button := SubStr(A_GuiControl, 0, 1)
FixedButton := Button - 1
MsgBox, % ie2.document.GetElementsBytagname("INPUT")[FixedButton].OuterHTML
MsgBox, % ie2.document.GetElementsBytagname("INPUT")[FixedButton].Value
ie2.document.GetElementsBytagname("INPUT")[FixedButton].Value := "test"
;ie2.document.GetElementsBytagname("INPUT")[Button-1].Click()
;ifinstring, FullString, save
;	Sleep 300
gosub RefreshGUI
return



gui_KeyDown(wParam, lParam, nMsg, webhndl) {
	ControlGetFocus, Cur
	If Cur = Internet Explorer_Server3
	{
		global WB
		pipa := ComObjQuery(WB, "{00000117-0000-0000-C000-000000000046}")
		VarSetCapacity(kMsg, 48), NumPut(A_GuiY, NumPut(A_GuiX
		, NumPut(A_EventInfo, NumPut(lParam, NumPut(wParam
		, NumPut(nMsg, NumPut(webhndl, kMsg)))), "uint"), "int"), "int")
		Loop 2
		r := DllCall(NumGet(NumGet(1*pipa)+5*A_PtrSize), "ptr", pipa, "ptr", &kMsg)
		; Loop to work around an odd tabbing issue (it's as if there
		; is a non-existent element at the end of the tab order).
		until wParam != 9 || WB.Document.activeElement != ""
		ObjRelease(pipa)
		if r = 0 ; S_OK: the message was translated to an accelerator.
			return 0
	}
	If Cur = Internet Explorer_Server4
	{
		global NV
		pipa := ComObjQuery(NV, "{00000117-0000-0000-C000-000000000046}")
		VarSetCapacity(kMsg, 48), NumPut(A_GuiY, NumPut(A_GuiX
		, NumPut(A_EventInfo, NumPut(lParam, NumPut(wParam
		, NumPut(nMsg, NumPut(vpnhndl, kMsg)))), "uint"), "int"), "int")
		Loop 2
		r := DllCall(NumGet(NumGet(1*pipa)+5*A_PtrSize), "ptr", pipa, "ptr", &kMsg)
		; Loop to work around an odd tabbing issue (it's as if there
		; is a non-existent element at the end of the tab order).
		until wParam != 9 || NV.Document.activeElement != ""
		ObjRelease(pipa)
		if r = 0 ; S_OK: the message was translated to an accelerator.
			return 0
	}
}

http://oc-docketing/CPi/patfrmActDueDate.aspx?key=9686728&bc=1&key2=1275806

MsgBox, % "SPAN 1 - Action Due - " 	ie.document.GetElementsBytagname("SPAN")[1].InnerText ; Click()
MsgBox, % "SPAN 2 - Due Date - " 		ie.document.GetElementsBytagname("SPAN")[2].InnerText ; Click()
MsgBox, % "SPAN 3 - Date Taken - " 	ie.document.GetElementsBytagname("SPAN")[3].InnerText ; Click()
MsgBox, % "SPAN 4 - Face Checkbox - " 	ie.document.GetElementsBytagname("SPAN")[4].InnerText ; Click()
MsgBox, % "SPAN 5 - Remarks - " 		ie.document.GetElementsBytagname("SPAN")[5].InnerText ; Click()

MsgBox, % "SPAN 6 - Action Due - " 	ie.document.GetElementsBytagname("SPAN")[6].InnerText ; Click()
MsgBox, % "SPAN 7 - Due Date - " 		ie.document.GetElementsBytagname("SPAN")[7].InnerText ; Click()
MsgBox, % "SPAN 8 - Date Taken - " 	ie.document.GetElementsBytagname("SPAN")[8].InnerText ; Click()
MsgBox, % "SPAN 9 - Face Checkbox - " 	ie.document.GetElementsBytagname("SPAN")[9].InnerText ; Click()
MsgBox, % "SPAN 10 - Remarks - " 		ie.document.GetElementsBytagname("SPAN")[10].InnerText ; Click()

ie.document.GetElementsBytagname("A")[0].Click()    ; - <blank>
MsgBox, % "A 1 - " ie.document.GetElementsBytagname("A")[1].OuterHTML ; Click()		- Delete 12$_1
MsgBox, % "A 2 - " ie.document.GetElementsBytagname("A")[2].OuterHTML ; Click()		- Edit 13$_0
MsgBox, % "A 3 - " ie.document.GetElementsBytagname("A")[3].OuterHTML ; Click()		- Delete 13$_1
MsgBox, % "A 4 - " ie.document.GetElementsBytagname("A")[4].OuterHTML ; Click()		- Edit 14$_0
MsgBox, % "A 5 - " ie.document.GetElementsBytagname("A")[5].OuterHTML ; Click()		- Delete 14$_1
MsgBox, % "A 6 - " ie.document.GetElementsBytagname("A")[6].OuterHTML ; Click()		- <blank>
MsgBox, % "A 7 - " ie.document.GetElementsBytagname("A")[7].OuterHTML ; Click()		- <blank>
MsgBox, % "A 8 - " ie.document.GetElementsBytagname("A")[8].OuterHTML ; Click()		- <blank>
MsgBox, % "A 9 - " ie.document.GetElementsBytagname("A")[9].OuterHTML ; Click()		- <blank>
MsgBox, % "A 10 - "ie.document.GetElementsBytagname("A")[10].OuterHTML ; Click()		- <blank>

*/

