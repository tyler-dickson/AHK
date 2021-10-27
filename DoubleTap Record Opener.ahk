; Created with AutoHotkey by Tyler Dickson. 

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, wmploc.dll , 27



$*Alt::
KeyWait, Alt
KeyWait, Alt, D T0.15
if ErrorLevel = 1
	{
	SendInput {Alt}
	return
	}
else if ErrorLevel = 0
	{
	Clipboard := ""
	SendInput, ^c
	ClipWait, 1
	ClientCodeIE()
	}
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

ClientCodeIE()
{
IniRead, CustomColor, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowColor
;NewClipboard = %Clipboard%
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 

IfWinActive, ahk_exe EXCEL.EXE
	{
	xl := ComObjActive("Excel.Application")
	NewClipboard := xl.ActiveCell.Value
	}
	
if (NewClipboard != "")
	Clipboard := NewClipboard
	
	
Clipboard := Trim(Clipboard, " ")

if (Clipboard == "" ) || (Length := StrLen(Clipboard) > 20)
	return
StringLen, ClipLength, Clipboard
StringReplace, Clipboard, Clipboard, `r`n, , A
NewMousePosX := (xpos - 150)
NewMousePosY := (ypos - 50)
Gui, New, +Owner +AlwaysOnTop ToolWindow -Caption, OpenInIE
Gui, Font, s10 w500 normal, Verdana
;Gui, Add, Button, x100 y0 w100 h25, %Clipboard%
IniRead, RecordBoxes, C:\Users\%Computername%\AHKPrefs.ini, Username, RecordBoxes
IniRead, RadioChoice, C:\Users\%Computername%\AHKPrefs.ini, Username, Radio
StringSplit, RecordBoxes, RecordBoxes, `, ,
StringSplit, RadioChoice, RadioChoice, `, ,
;Msgbox %RecordBoxes0%, %RecordBoxes1%%RecordBoxes2%%RecordBoxes3%%RecordBoxes4%%RecordBoxes5%%RecordBoxes6% 
;MsgBox, %RadioChoice0% , %RadioChoice1% , %RadioChoice2% , %RadioChoice3% 

Gui, Add, Button, x105 y65 w90 h25 gCancelOpen, Cancel
Gui, Add, Button, x105 y35 w90 h25 gOpenWorkSpace, WorkSpace	

GUIHeight = 105
if RadioChoice2 = 1
		{
		gosub OpenPATLive
		return
		}
if RadioChoice3 = 1
		{
		gosub OpenTMLive
		return
		}
if RecordBoxes1 = 0 
		{
		}
else 
	Gui, Add, Button, x200 y35 w95 h25 Default gOpenPATLive, Patent Live		               ;RecordBox1
if RecordBoxes2 = 0 
		{
		}
else 
	Gui, Add, Button, x200 y65 w95 h25 gOpenPATAT, Patent AT		                   ;RecordBox2				
if RecordBoxes3 = 0 
		{
		}
else 
	{
	Gui, Add, Button, x47 y95 w100 h25 gOpenInventionLive, Invention Live		       ;RecordBox3	
	GUIHeight = 125
	}
if RecordBoxes4 = 0 
		{
		}
else 
	{
	Gui, Add, Button, x158 y95 w100 h25 gOpenInventionAT, Invention AT		           ;RecordBox4			
	GUIHeight = 125
	}	
if RecordBoxes5 = 0 
		{
		}
else 
	Gui, Add, Button, x5 y35 w95 h25 gOpenTMLive, TM Live		                       ;RecordBox5			
if RecordBoxes6 = 0 
		{
		}
else 
	Gui, Add, Button, x5 y65 w95 h25 gOpenTMAT, TM AT		                           ;RecordBox6		

Gui, Font, bold
Gui, Add, Button, x60 y5 h25 w180 gCancelOpen, %Clipboard%	
Gui, Font, s10 w500, Verdana


Gui, Color, %CustomColor%, OpenInIE  
Gui, Show, x%NewMousePosX% y%NewMousePosY% w300 h%GUIHeight%
	
WinSet, Transparent, 0, OpenInIE
Sleep 50
if GUIHeight = 125
	WinSet, Region, 0-0 W300 H125 R50-50, ahk_class AutoHotkeyGUI
else
	WinSet, Region, 0-0 W300 H105 R50-50, ahk_class AutoHotkeyGUI
WinSet, Transparent, 40, OpenInIE
Sleep 50
WinSet, Transparent, 70, OpenInIE
Sleep 50
WinSet, Transparent, 110, OpenInIE
Sleep 50				
WinSet, Transparent, 150, OpenInIE	
Sleep 50				
WinSet, Transparent, 190, OpenInIE	
Sleep 50				
WinSet, Transparent, 255, OpenInIE

;Gui, Color, %CustomColor%, OpenInIE                                 ; can be any colour but it's good to use a color that is NOT present in ur GUI
;WinSet, Transcolor, 000111, OpenInIE
;Gui, Show, x%NewMousePosX% y%NewMousePosY%
return

;matter := result[2,1] ;matter name
;matterId := result[2,2] ;countryapp id or trademark id
;invId := result[2,3] ;if matter is a patent, otherwise 0 is returned
;system := result[2,4] ;matter type: patent or trademark
;liveUrl := result[2,5] ;url in live docketing system
;agentUrl := result[2,6] ;url in agent docketing system
;invUrl := result[2,7] ;invention url if patent, otherwise black
;display := % matter "`n" matterId "`n" invId "`n" system "`n" liveUrl "`n" agentUrl "`n" invUrl


CancelOpen:
Gui, Submit, NoHide
WinSet, Transparent, 235, OpenInIE
Sleep 50
WinSet, Transparent, 190, OpenInIE
Sleep 50
WinSet, Transparent, 150, OpenInIE
Sleep 50
WinSet, Transparent, 110, OpenInIE
Sleep 50				
WinSet, Transparent,  70, OpenInIE	
Sleep 50				
WinSet, Transparent,  40, OpenInIE
Sleep 50				
WinSet, Transparent,  10, OpenInIE
Gui, Destroy
return

;                            https://msdn.microsoft.com/en-us/library/dd565688(v=vs.85).aspx
OpenTMLive:
Gui, Submit, NoHide
WinSet, Transparent, 235, OpenInIE
Sleep 50
WinSet, Transparent, 190, OpenInIE
Sleep 50
WinSet, Transparent, 150, OpenInIE
Sleep 50
WinSet, Transparent, 110, OpenInIE
Sleep 50				
WinSet, Transparent,  70, OpenInIE	
Sleep 50				
WinSet, Transparent,  40, OpenInIE
Sleep 50				
WinSet, Transparent,  10, OpenInIE
Gui, Destroy
OutputVar = http://oc-docketing/CPi/tmkschTrademark.aspx
ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
; ; gosub RecordClientCodeIE
return

OpenTMAT:
Gui, Submit, NoHide
WinSet, Transparent, 235, OpenInIE
Sleep 50
WinSet, Transparent, 190, OpenInIE
Sleep 50
WinSet, Transparent, 150, OpenInIE
Sleep 50
WinSet, Transparent, 110, OpenInIE
Sleep 50				
WinSet, Transparent,  70, OpenInIE	
Sleep 50				
WinSet, Transparent,  40, OpenInIE
Sleep 50				
WinSet, Transparent,  10, OpenInIE
Gui, Destroy
OutputVar = http://oc-docketing/CPiAgent/tmkschTrademarkAgent.aspx
ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
; gosub RecordClientCodeIE
return

OpenPATLive:
Gui, Submit, NoHide
WinSet, Transparent, 235, OpenInIE
Sleep 50
WinSet, Transparent, 190, OpenInIE
Sleep 50
WinSet, Transparent, 150, OpenInIE
Sleep 50
WinSet, Transparent, 110, OpenInIE
Sleep 50				
WinSet, Transparent,  70, OpenInIE	
Sleep 50				
WinSet, Transparent,  40, OpenInIE
Sleep 50				
WinSet, Transparent,  10, OpenInIE
Gui, Destroy
OutputVar = http://oc-docketing/CPi/patschCountryApplication.aspx
ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
; gosub RecordClientCodeIE
return

OpenPATAT:
Gui, Submit, NoHide
WinSet, Transparent, 235, OpenInIE
Sleep 50
WinSet, Transparent, 190, OpenInIE
Sleep 50
WinSet, Transparent, 150, OpenInIE
Sleep 50
WinSet, Transparent, 110, OpenInIE
Sleep 50				
WinSet, Transparent,  70, OpenInIE	
Sleep 50				
WinSet, Transparent,  40, OpenInIE
Sleep 50				
WinSet, Transparent,  10, OpenInIE
Gui, Destroy
OutputVar = http://oc-docketing/CPiAgent/patschCountryApplicationAgent.aspx
ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
; gosub RecordClientCodeIE
return

OpenInventionLive:
Gui, Submit, NoHide
WinSet, Transparent, 235, OpenInIE
Sleep 50
WinSet, Transparent, 190, OpenInIE
Sleep 50
WinSet, Transparent, 150, OpenInIE
Sleep 50
WinSet, Transparent, 110, OpenInIE
Sleep 50				
WinSet, Transparent,  70, OpenInIE	
Sleep 50				
WinSet, Transparent,  40, OpenInIE
Sleep 50				
WinSet, Transparent,  10, OpenInIE
Gui, Destroy
OutputVar = http://oc-docketing/CPi/patschInvention.aspx
ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
; gosub RecordClientCodeIE
return

OpenInventionAT:
Gui, Submit, NoHide
WinSet, Transparent, 235, OpenInIE
Sleep 50
WinSet, Transparent, 190, OpenInIE
Sleep 50
WinSet, Transparent, 150, OpenInIE
Sleep 50
WinSet, Transparent, 110, OpenInIE
Sleep 50				
WinSet, Transparent,  70, OpenInIE	
Sleep 50				
WinSet, Transparent,  40, OpenInIE
Sleep 50				
WinSet, Transparent,  10, OpenInIE
Gui, Destroy
OutputVar = http://oc-docketing/CPiAgent/patschInventionAgent.aspx
ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
; gosub RecordClientCodeIE
return

OpenWorkSpace:
Gui, Submit, NoHide
WinSet, Transparent, 235, OpenInIE
Sleep 50
WinSet, Transparent, 190, OpenInIE
Sleep 50
WinSet, Transparent, 150, OpenInIE
Sleep 50
WinSet, Transparent, 110, OpenInIE
Sleep 50				
WinSet, Transparent,  70, OpenInIE	
Sleep 50				
WinSet, Transparent,  40, OpenInIE
Sleep 50				
WinSet, Transparent,  10, OpenInIE
Gui, Destroy
TrayTip, Opening WorkSpace in iManage,`n`nPlease wait...
qry := "SELECT * FROM dbo.vwAHKWorkspace WHERE WorkspaceName = '" Clipboard "'"
result := ADOSQL(qry)
workspaceName := result[2,1] ;workspace name
FolderNumber := result[2,2] ;miscellaneous folder Id
Sleep 300
if (FolderNumber == "")
	{
	TrayTip, Unable to open WorkSpace, I couldn't open the WorkSpace.`nYou may have selected too much text`, or it may not exist.`nPlease open manually or try again.
	return
	}
else 
	{
	DocumentText := "OC-iDMS`n!nrtdms:0:!session:OC-iDMS:!database:KMOB:!folder:ordinary," . FolderNumber . ":"
	Sleep 250
	; MsgBox, %FolderNumber% `n`n %DocumentText% `n`n %Computername% `n`n %Computername%
	FileAppend, %DocumentText%, C:\Users\%Computername%\KMOB_%FolderNumber%.nrl
	Sleep 750
	WinActivate, ahk_exe OUTLOOK.EXE  ;  ahk_class rctrl_renwnd32
	Sleep 100
	Run, % "C:\Users\" Computername "\KMOB_" FolderNumber ".nrl"
	Sleep 1500
	; gosub RecordWorkSpaceOpener
	FileDelete, % "C:\Users\" Computername "\KMOB_" FolderNumber ".nrl"
	return
	}
return



}


OpenWorkSpace2:
ie := WBGet()
var := ie.LocationURL ; grab current url
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

TrayTip, Opening %ClientCode% WorkSpace in iManage,`n`nPlease wait...
qry := "SELECT * FROM dbo.vwAHKWorkspace WHERE WorkspaceName = '" ClientCode "'"
result := ADOSQL(qry)
workspaceName := result[2,1] ;workspace name
FolderNumber := result[2,2] ;miscellaneous folder Id
Sleep 300
if (FolderNumber == "")
	{
	TrayTip, Unable to open WorkSpace, I couldn't open the WorkSpace.`nYou may have selected too much text`, or it may not exist.`nPlease open manually or try again.
	return
	}
else 
	{
	DocumentText := "OC-iDMS`n!nrtdms:0:!session:OC-iDMS:!database:KMOB:!folder:ordinary," . FolderNumber . ":"
	Sleep 250
	; MsgBox, %FolderNumber% `n`n %DocumentText% `n`n %Computername% `n`n %Computername%
	FileAppend, %DocumentText%, C:\Users\%Computername%\KMOB_%FolderNumber%.nrl
	Sleep 750
;	WinActivate, ahk_exe OUTLOOK.EXE  ;  ahk_class rctrl_renwnd32
	Sleep 100
	Run, % "C:\Users\" Computername "\KMOB_" FolderNumber ".nrl"
	Sleep 1500
	; gosub RecordWorkSpaceOpener
	FileDelete, % "C:\Users\" Computername "\KMOB_" FolderNumber ".nrl"
	return
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
#F3:: ;windowskey+F3
Send, ^c
ClipWait, .5
selText := Clipboard

qry := "SELECT * FROM dbo.vwAHKWorkspace WHERE WorkspaceName = '" selText "'"

result := ADOSQL(qry)

workspaceName := result[2,1] ;workspace name
miscId := result[2,2] ;miscellaneous folder Id

display := % miscId "`n" workspaceName

MsgBox, 0, Workspace Opener, % display
Return


#F4::
Send, ^c
ClipWait, .5
selText := Clipboard

qry := "SELECT * FROM dbo.vwAHKMatterInfo WHERE Matter = '" selText "'"

result := ADOSQL(qry)

matter := result[2,1] ;matter name
matterId := result[2,2] ;countryapp id or trademark id
invId := result[2,3] ;if matter is a patent, otherwise 0 is returned
system := result[2,4] ;matter type: patent or trademark
liveUrl := result[2,5] ;url in live docketing system
agentUrl := result[2,6] ;url in agent docketing system
invUrl := result[2,7] ;invention url if patent, otherwise black

display := % matter "`n" matterId "`n" invId "`n" system "`n" liveUrl "`n" agentUrl "`n" invUrl

MsgBox, 0, Matter Urls, % display
Return
*/
