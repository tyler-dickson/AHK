; Created with AutoHotkey by Tyler Dickson.  

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; #SingleInstance, Off
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 70

DoAll := false
fromExcel := false

; NEWCPI
global NewCPI

NewCPI = 1

if (NewCPI)
	{
;	#Include \\docs-oc\files\Docketing\AutoHotKey\Scripts\Chrome.ahk
;	FileCreateDir, C:\Users\Tyler.Dickson\Desktop\AHK Startup\ChromeProfile
;	FileCreateDir, ChromeProfile
	FileCreateShortcut, % "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe", %A_Desktop%\Chrome (AHK).lnk, , % "--remote-debugging-port=9222 -- '%1'", % "Test Description" ;,  IconFile, 

;	Run, %A_Desktop%\Chrome (AHK).lnk
	
	if (Chromes := Chrome.FindInstances())
		global ChromeInst := {"base": Chrome, "DebugPort": Chromes.MinIndex()}
	else
		global ChromeInst := new Chrome("ChromeProfile", "https://web05.computerpackages.com/knobbe/patent/patschcountryapplication.aspx" ) ; 	;	global ChromeInst := new Chrome("ChromeProfile", "--app=http://oc-docketing/CPi/patfrmCountryApplication.aspx?Key=1275806")
	
	global Page := ChromeInst.GetPage()
;	Page.Call("Page.navigate", {"url" : "https://web05.computerpackages.com/knobbe/patent/patschcountryapplication.aspx" })
;	Page.Call("Target.createTarget", {"url" : "https://web05bak.computerpackages.com/knobbeAgent/patent/patschcountryapplication.aspx" })
	Page.WaitForLoad()
	Page.Disconnect()
	}

MsgBox, 0, Priorities & Assignments Duplicator (New CPI), Welcome to the Priorities & Assignments Duplicator!`n`nPress PrintScreen to grab data.`n`nWhen you're on the Invention screen, it will grab the list of Priorities.`n`nWhen you're on the Country page, it will grab the list of Assignments instead.`n`nOnce you've grabbed the data, go to your new appropriate page and click either Add All, or individually add each to the page. The page will refresh and should now have the added items.`n`nIt seems you have can multiple instances of this open at once, so if you need to grab both Priorities and Assignments, it will create TWO separate interfaces.`n`nUPDATE 5/21/2020:`nYou can now import from an Excel document. Make sure you have added the App# Filter column so everything will line up.`nHighlight your data in Excel then press PrintScreen. It should work about the same way.
return

PrintScreen::
Page := ChromeInst.GetPage()
location := Page.Evaluate("window.location.href").Value

ifWinActive, ahk_exe EXCEL.EXE
	{
;	MsgBox, Import from Excel instead of IE.
	fromExcel := true
	}

if (fromExcel == true)
	{
	Gui, New, , Priorities & Assignments Duplicator (From Excel)
	;Gui, Add, Tab3,, Priorities|Assignments
	Gui, Add, ActiveX, x650 y0 w0 h0 vie2, Shell.Explorer
	Gui, Add, Text, x5 yp+5 wp h5 , 
	Pieces := []
	xl := ComObjActive("Excel.Application")
	xl.Selection.Copy
	Clipboard := RegExReplace(Clipboard, "[\r]")
	Clipboard := StrReplace(Clipboard, "`n", "`t")
	Pieces := StrSplit(Clipboard, "`t")
	xl.CutCopyMode := False

	Gui, Add, Button, xp yp w20 h20 gAddButton2, +
	Gui, Add, Button, xp+20 yp w80 h20 gAddAllPriorities, Add All Data
	
	Loop 5
		{
		if (A_Index == 1)
			Gui, Add, Edit, Center Disabled xp+80 yp w100 h20, Country || From
		else if (A_Index == 2)
			Gui, Add, Edit, Center Disabled ReadOnly xp+100 yp w100 h20, Case Type || Date
		else if (A_Index == 3)
			Gui, Add, Edit, Center Disabled ReadOnly xp+100 yp w100 h20, App# Filter || To
		else if (A_Index == 4)
			Gui, Add, Edit, Center Disabled ReadOnly xp+100 yp w100 h20, Application # || Reel
		else if (A_Index == 5)
			Gui, Add, Edit, Center Disabled ReadOnly xp+100 yp w100 h20, Filing Date || Frame
		}
		
	Gui, Add, Text, x-95 yp+20 wp h5 , 
	outerLoop = 0
	item = 1

	Loop % Pieces.Length() / 5
		{
		savedData := ""
		Gui, Add, Button, xp+100 yp w100 h20 gAddPriority v%A_Index%, Add Item %A_Index%

		Gui, Add, Edit, xp+100 yp w100 h20, % Pieces[item]
		Gui, Add, Edit, xp+100 yp w100 h20, % Pieces[item + 1]
		Gui, Add, Edit, xp+100 yp w100 h20, % Pieces[item + 2]
		Gui, Add, Edit, xp+100 yp w100 h20, % Pieces[item + 3]
		Gui, Add, Edit, xp+100 yp w100 h20, % Pieces[item + 4]
		

		Gui, Add, Text, x-95 yp+20 wp h5 , 
		outerLoop += 1
		item += 5
		}
	Gui, Add, Text, x-95 yp wp h5 , 
	GuiControl, Focus, Static1
	Gui, Show, w610
	
	fromExcel := false
	return
	}
else if InStr(location, "patfrmInvention")
	{
	Gui, New, , Priorities & Assignments Duplicator
	;Gui, Add, Tab3,, Priorities|Assignments
	Gui, Add, ActiveX, x650 y0 w0 h0 vie2, Shell.Explorer
	Gui, Add, Text, x5 yp+5 wp h5 , 
	Gui, Add, Button, xp yp w20 h20 gAddButton, +
	Gui, Add, Button, xp+20 yp w80 h20 gAddAllPriorities, Add Priorities
	Loop 5
		{
		if (A_Index == 1)
			Gui, Add, Edit, Center Disabled xp+80 yp w100 h20, Country
		else if (A_Index == 2)
			Gui, Add, Edit, Center Disabled ReadOnly xp+100 yp w100 h20, Case Type
		else if (A_Index == 3)
			Gui, Add, Edit, Center Disabled ReadOnly xp+100 yp w100 h20, App# Filter
		else if (A_Index == 4)
			Gui, Add, Edit, Center Disabled ReadOnly xp+100 yp w100 h20, Application #
		else if (A_Index == 5)
			Gui, Add, Edit, Center Disabled ReadOnly xp+100 yp w100 h20, Filing Date
		}
	}
else if InStr(location, "patfrmCountryApplication")
	{
	Gui, New, , Priorities & Assignments Duplicator (New CPI)
	;Gui, Add, Tab3,, Priorities|Assignments
	Gui, Add, ActiveX, x650 y0 w0 h0 vie2, Shell.Explorer
	Gui, Add, Text, x5 yp+5 wp h5 , 
	ie := WBGet()
	
	Gui, Add, Button, xp yp w20 h20 gAddButton3, +
	
	Gui, Add, Button, xp+20 yp w80 h20 gAddAllPriorities, Add Assignm...

	Loop 5
		{
		if (A_Index == 1)
			Gui, Add, Edit, Center Disabled xp+80 yp w100 h20, From
		else if (A_Index == 2)
			Gui, Add, Edit, Center Disabled ReadOnly xp+100 yp w100 h20, Date
		else if (A_Index == 3)
			Gui, Add, Edit, Center Disabled ReadOnly xp+100 yp w100 h20, To
		else if (A_Index == 4)
			Gui, Add, Edit, Center Disabled ReadOnly xp+100 yp w100 h20, Reel
		else if (A_Index == 5)
			Gui, Add, Edit, Center Disabled ReadOnly xp+100 yp w100 h20, Frame
		}
	}	
Gui, Add, Text, x-95 yp+20 wp h5 , 
	
if InStr(location, "patfrmInvention")
	{
	Page := ChromeInst.GetPage()
	ClientCode := Page.Evaluate("document.getElementById('ctl00_Detail_CaseNumber').value").Value

	user := "tyler.dickson@knobbe.com"
	pass := "cpi1"
	EndPoint1 := "https://web05.computerpackages.com/knobbews/api/Knobbe?queryString="

	EndPoint2 := "SELECT t1.Country, t1.CaseType, t1.AppNumber, t1.FilDate FROM tblPatPriorityInv t1 INNER JOIN tblPatCountryApplication t2 ON t2.InvId = t1.InvId WHERE t2.CaseNumber "
	EndPoint3 := "LIKE '" ClientCode "'"
	http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	http.Open("GET", EndPoint1 . EndPoint2 . EndPoint3, true)
	http.SetRequestHeader("Authorization", "Basic "  Base64Encode(user ":" pass) )
	http.Send()
	while (http.Responsetext == "")
		Sleep 100
	value := JSON.Load(http.Responsetext)

;	MsgBox, % value.Table.length()
;	MsgBox, % http.Responsetext

	Loop % value.Table.length()
		{
;		MsgBox, % value.Table[A_Index].CaseNumber " | " value.Table[A_Index].AppNumber 
		Gui, Add, Button, xp+100 yp w100 h20 gAddPriority v%A_Index%, Add Priority %A_Index%
		Gui, Add, Edit, xp+100 yp w100 h20, % Trim(value.Table[A_Index].Country)
		Gui, Add, Edit, xp+100 yp w100 h20, % Trim(value.Table[A_Index].CaseType)
		Gui, Add, Edit, xp+100 yp w100 h20, 
		Gui, Add, Edit, xp+100 yp w100 h20, % Trim(value.Table[A_Index].AppNumber)
		Gui, Add, Edit, xp+100 yp w100 h20, % Trim(value.Table[A_Index].FilDate)
		Gui, Add, Text, x-95 yp+20 wp h5 , 
		}

	Gui, Add, Text, x-95 yp wp h5 , 
	GuiControl, Focus, Static1
	Gui, Show, w610	
	Page.Disconnect()
	return
	}
else if InStr(location, "patfrmCountryApplication")
	{
	Page := ChromeInst.GetPage()
	ClientCode := Page.Evaluate("document.getElementById('ctl00_Detail_CaseNumber_Input').value").Value

	user := "tyler.dickson@knobbe.com"
	pass := "cpi1"
	EndPoint1 := "https://web05.computerpackages.com/knobbews/api/Knobbe?queryString="

	EndPoint2 := "SELECT t2.CaseNumber, t1.AssignmentFrom, t1.AssignmentTo, t1.AssignmentStatus, t1.AssignmentDate, t1.Reel, t1.Frame FROM tblPatAssignmentHistory t1 INNER JOIN tblPatCountryApplication t2 ON t2.AppId = t1.AppId WHERE t2.CaseNumber "
	EndPoint3 := "LIKE '" ClientCode "'"
	http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	http.Open("GET", EndPoint1 . EndPoint2 . EndPoint3, true)
	http.SetRequestHeader("Authorization", "Basic "  Base64Encode(user ":" pass) )
	http.Send()
	while (http.Responsetext == "")
		Sleep 100
	value := JSON.Load(http.Responsetext)

;	MsgBox, % value.Table.length()
;	MsgBox, % http.Responsetext

	Loop % value.Table.length()
		{
	;	MsgBox, % value.Table[A_Index].AssignmentFrom " | " value.Table[A_Index].AssignmentTo " | " value.Table[A_Index].AssignmentStatus " | " value.Table[A_Index].AssignmentDate " | " value.Table[A_Index].Reel " | " value.Table[A_Index].Frame 
		Gui, Add, Button, xp+100 yp w100 h20 gAddPriority v%A_Index%, Add Assignment %A_Index%
		Gui, Add, Edit, xp+100 yp w100 h20, % Trim(value.Table[A_Index].AssignmentFrom)
		Gui, Add, Edit, xp+100 yp w100 h20, % Trim(value.Table[A_Index].AssignmentDate)
		Gui, Add, Edit, xp+100 yp w100 h20, % Trim(value.Table[A_Index].AssignmentTo)
	;	Gui, Add, Edit, xp+100 yp w100 h20, % Trim(value.Table[A_Index].AssignmentStatus)
		Gui, Add, Edit, xp+100 yp w100 h20, % Trim(value.Table[A_Index].Reel)
		Gui, Add, Edit, xp+100 yp w100 h20, % Trim(value.Table[A_Index].Frame)
		Gui, Add, Text, x-95 yp+20 wp h5 , 
		}

	Gui, Add, Text, x-95 yp wp h5 , 
	GuiControl, Focus, Static1
	Gui, Show, w610	
	Page.Disconnect()
	return
	}
return

AddButton:
outerLoop++
Gui, Add, Button, xp+100 yp w100 h20 gAddPriority v%outerLoop%, Add Priority %outerLoop%
Gui, Add, Edit, xp+100 yp w100 h20, 
Gui, Add, Edit, xp+100 yp w100 h20, 
Gui, Add, Edit, xp+100 yp w100 h20, 
Gui, Add, Edit, xp+100 yp w100 h20, 
Gui, Add, Edit, xp+100 yp w100 h20, 
Gui, Add, Text, x-95 yp+20 wp h5 , 

WinGetPos, , , , hHeight, Priorities & Assignments Duplicator (New CPI)
Gui, Show, % "w610 h" (hHeight - 30) + 21
return

AddButton2:
outerLoop++
Gui, Add, Button, xp+100 yp w100 h20 gAddPriority v%outerLoop%, Add Item %outerLoop%
Gui, Add, Edit, xp+100 yp w100 h20, 
Gui, Add, Edit, xp+100 yp w100 h20, 
Gui, Add, Edit, xp+100 yp w100 h20, 
Gui, Add, Edit, xp+100 yp w100 h20, 
Gui, Add, Edit, xp+100 yp w100 h20, 
Gui, Add, Text, x-95 yp+20 wp h5 , 

WinGetPos, , , , hHeight, Priorities & Assignments Duplicator (From Excel)
Gui, Show, % "w610 h" (hHeight - 30) + 21
return

AddButton3:
outerLoop++
tempLoop := outerLoop - 8
Gui, Add, Button, xp+100 yp w100 h20 gAddPriority v%tempLoop%, Add Assignment %tempLoop%
Gui, Add, Edit, xp+100 yp w100 h20, 
Gui, Add, Edit, xp+100 yp w100 h20, 
Gui, Add, Edit, xp+100 yp w100 h20, 
Gui, Add, Edit, xp+100 yp w100 h20, 
Gui, Add, Edit, xp+100 yp w100 h20, 
Gui, Add, Text, x-95 yp+20 wp h5 , 

WinGetPos, , , , hHeight, Priorities & Assignments Duplicator (New CPI)
Gui, Show, % "w610 h" (hHeight - 30) + 21
return

AddAllPriorities:
DoAll := true
priorityLoop = 1
ie := WBGet()

if InStr(ie.LocationURL, "patfrmCountryApplication")
	newRows := rows / 3 
else
	newRows := rows

; Loop % newRows
Loop % outerLoop
	{
	gosub AddPriority
	priorityLoop++
	}

DoAll := false

if InStr(ie.LocationURL, "patfrmCountryApplication")
	ie.Navigate(storedLocation[1] "&tab=3")
else
	ie.Navigate(storedLocation[1] "&tab=1")
return

AddPriority:
Page := ChromeInst.GetPage()
location := Page.Evaluate("window.location.href").Value
if InStr(location, "patfrmCountryApplication")
	{
	GuiControlGet, From, 	, % "Edit" ((A_GuiControl + 1) * 5) - 4 	; 1 = 1-5, 2 = 6-10
	GuiControlGet, Date, 	, % "Edit" ((A_GuiControl + 1) * 5) - 3 	; 1 = 1-5, 2 = 6-10
	GuiControlGet, To, 		, % "Edit" ((A_GuiControl + 1) * 5) - 2 	; 1 = 1-5, 2 = 6-10
	GuiControlGet, Reel, 	, % "Edit" ((A_GuiControl + 1) * 5) - 1 	; 1 = 1-5, 2 = 6-10
	GuiControlGet, Frame, 	, % "Edit" ((A_GuiControl + 1) * 5)   		; 1 = 1-5, 2 = 6-10
	Sleep 250

	reel1 = "[id*='Reel']"
	frame1 = "[id*='Frame']"

	firstHidden := Page.Evaluate("document.getElementsByClassName('rcbInput')[6].id").Value
	firstHidden := StrReplace(firstHidden, "Input", "ClientState")
	Page.Evaluate("document.getElementsByClassName('rcbInput')[6].value = '" From "';")
	firstTextHidden = {"logEntries":[],"value":"%From%","text":"%From%","enabled":true,"checkedIndices":[],"checkedItemsTextOverflows":false}
	Page.Evaluate("document.getElementById('" firstHidden "').value = '" firstTextHidden "'")

	secondHidden := Page.Evaluate("document.getElementsByClassName('rcbInput')[7].id").Value
	secondHidden := StrReplace(secondHidden, "Input", "ClientState")
	Page.Evaluate("document.getElementsByClassName('rcbInput')[7].value = '" To "';")
	secondTextHidden = {"logEntries":[],"value":"%To%","text":"%To%","enabled":true,"checkedIndices":[],"checkedItemsTextOverflows":false}
	Page.Evaluate("document.getElementById('" secondHidden "').value = '" secondTextHidden "'")

	newYear := SubStr(Date, -3, 4)
	newMonth := SubStr(Date, 1, 2)
	newDay := SubStr(Date, 4, 2)
	updatedDate := newYear "-" newMonth "-" newDay

	if newMonth = 01
		convertedMonth := "Jan"
	else if newMonth = 02
		convertedMonth := "Feb"
	else if newMonth = 03
		convertedMonth := "Mar"
	else if newMonth = 04
		convertedMonth := "Apr"
	else if newMonth = 05
		convertedMonth := "May"
	else if newMonth = 06
		convertedMonth := "Jun"
	else if newMonth = 07
		convertedMonth := "Jul"
	else if newMonth = 08
		convertedMonth := "Aug"
	else if newMonth = 09
		convertedMonth := "Sep"
	else if newMonth = 10
		convertedMonth := "Oct"
	else if newMonth = 11
		convertedMonth := "Nov"
	else if newMonth = 12
		convertedMonth := "Dec"

	docketingDate := newDay "-" convertedMonth "-" newYear

	thirdHidden := Page.Evaluate("document.getElementsByClassName('riTextBox riEnabled DetailValue')[0].id").Value
	thirdHidden := thirdHidden "_ClientState"
	Page.Evaluate("document.getElementsByClassName('riTextBox riEnabled DetailValue')[0].value = '" docketingDate "';")
	thirdTextHidden = {"enabled":true,"emptyMessage":"","validationText":"%updatedDate%-00-00-00","valueAsString":"%updatedDate%-00-00-00","minDateStr":"1000-01-01-00-00-00","maxDateStr":"9999-12-31-00-00-00","lastSetTextBoxValue":"%docketingDate%"}
	Page.Evaluate("document.getElementById('" thirdHidden "').value = '" thirdTextHidden "'")

	Page.Evaluate("document.querySelectorAll(" reel1  ")[0].value = '" Reel  "';")
	Page.Evaluate("document.querySelectorAll(" frame1 ")[0].value = '" Frame "';")

	WinActivate, ahk_exe chrome.exe
	Sleep 200

	Page.Disconnect()
	Page := ChromeInst.GetPage()

	Page.Evaluate("document.getElementsByClassName('rcbInput')[6].focus();")
	Sleep 100
	SendInput, {Right}
	Sleep 100
	SendInput, {Space}	
	
	Page.Evaluate("document.getElementsByClassName('rcbInput')[7].focus();")
	Sleep 100
	SendInput, {Right}
	Sleep 100
	SendInput, {Space}	
	
	Page.Evaluate("document.getElementsByClassName('riTextBox riEnabled DetailValue')[0].focus();")
	Sleep 100
	SendInput, {Tab}

	Sleep 1000
	Page.Evaluate("document.querySelectorAll('input[type=image][alt=Insert]')[0].click();")	
	Page.Disconnect()
	}
else if InStr(location, "patfrmInvention")
	{
	GuiControlGet, Country, 	, % "Edit" ((A_GuiControl + 1) * 5) - 4 	; 1 = 1-5, 2 = 6-10
	GuiControlGet, CaseType, 	, % "Edit" ((A_GuiControl + 1) * 5) - 3 	; 1 = 1-5, 2 = 6-10
	GuiControlGet, AppNo, 		, % "Edit" ((A_GuiControl + 1) * 5) - 1 	; 1 = 1-5, 2 = 6-10
	GuiControlGet, FilingDate, 	, % "Edit" ((A_GuiControl + 1) * 5)   		; 1 = 1-5, 2 = 6-10
	Sleep 250

	WinActivate, ahk_exe chrome.exe

	firstHidden := Page.Evaluate("document.getElementsByClassName('rcbInput radPreventDecorate')[2].id").Value
	firstHidden := StrReplace(firstHidden, "Input", "ClientState")
	Page.Evaluate("document.getElementsByClassName('rcbInput radPreventDecorate')[2].value = '" Country "';")
	firstTextHidden = {"logEntries":[],"value":"%Country%","text":"%Country%","enabled":true,"checkedIndices":[],"checkedItemsTextOverflows":false}
	Page.Evaluate("document.getElementById('" firstHidden "').value = '" firstTextHidden "'")

	secondHidden := Page.Evaluate("document.getElementsByClassName('rcbInput radPreventDecorate')[3].id").Value
	secondHidden := StrReplace(secondHidden, "Input", "ClientState")
	Page.Evaluate("document.getElementsByClassName('rcbInput radPreventDecorate')[3].value = '" CaseType "';")
	secondTextHidden = {"logEntries":[],"value":"%CaseType%","text":"%CaseType%","enabled":true,"checkedIndices":[],"checkedItemsTextOverflows":false}
	Page.Evaluate("document.getElementById('" secondHidden "').value = '" secondTextHidden "'")

	Page.Disconnect()
	Page := ChromeInst.GetPage()
	
	thirdHidden := Page.Evaluate("document.getElementsByClassName('rcbInput radPreventDecorate')[4].id").Value
	thirdHidden := StrReplace(thirdHidden, "Input", "ClientState")
	Page.Evaluate("document.getElementsByClassName('rcbInput radPreventDecorate')[4].value = '" AppNo "';")
	thirdTextHidden = {"logEntries":[],"value":"%AppNo%","text":"%AppNo%","enabled":true,"checkedIndices":[],"checkedItemsTextOverflows":false}
	Page.Evaluate("document.getElementById('" thirdHidden "').value = '" thirdTextHidden "'")

	newYear := SubStr(FilingDate, -3, 4)
	newMonth := SubStr(FilingDate, 1, 2)
	newDay := SubStr(FilingDate, 4, 2)
	updatedDate := newYear "-" newMonth "-" newDay

	if newMonth = 01
		convertedMonth := "Jan"
	else if newMonth = 02
		convertedMonth := "Feb"
	else if newMonth = 03
		convertedMonth := "Mar"
	else if newMonth = 04
		convertedMonth := "Apr"
	else if newMonth = 05
		convertedMonth := "May"
	else if newMonth = 06
		convertedMonth := "Jun"
	else if newMonth = 07
		convertedMonth := "Jul"
	else if newMonth = 08
		convertedMonth := "Aug"
	else if newMonth = 09
		convertedMonth := "Sep"
	else if newMonth = 10
		convertedMonth := "Oct"
	else if newMonth = 11
		convertedMonth := "Nov"
	else if newMonth = 12
		convertedMonth := "Dec"

	docketingDate := newDay "-" convertedMonth "-" newYear

	fourthHidden := Page.Evaluate("document.getElementsByClassName('riTextBox riEnabled DetailValue')[0].id").Value
	fourthHidden := fourthHidden "_ClientState"
	Page.Evaluate("document.getElementsByClassName('riTextBox riEnabled DetailValue')[0].value = '" docketingDate "';")
	fourthTextHidden = {"enabled":true,"emptyMessage":"","validationText":"%updatedDate%-00-00-00","valueAsString":"%updatedDate%-00-00-00","minDateStr":"1000-01-01-00-00-00","maxDateStr":"9999-12-31-00-00-00","lastSetTextBoxValue":"%docketingDate%"}
	Page.Evaluate("document.getElementById('" fourthHidden "').value = '" fourthTextHidden "'")

	Page.Evaluate("document.querySelectorAll('input[type=image][alt=Insert]')[0].click();")
	Page.Disconnect()
	}
return

GuiClose:
Gui, Destroy
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



/**
 * Lib: JSON.ahk
 *     JSON lib for AutoHotkey.
 * Version:
 *     v2.1.3 [updated 04/18/2016 (MM/DD/YYYY)]
 * License:
 *     WTFPL [http://wtfpl.net/]
 * Requirements:
 *     Latest version of AutoHotkey (v1.1+ or v2.0-a+)
 * Installation:
 *     Use #Include JSON.ahk or copy into a function library folder and then
 *     use #Include <JSON>
 * Links:
 *     GitHub:     - https://github.com/cocobelgica/AutoHotkey-JSON
 *     Forum Topic - http://goo.gl/r0zI8t
 *     Email:      - cocobelgica <at> gmail <dot> com
 */

/**
 * Class: JSON
 *     The JSON object contains methods for parsing JSON and converting values
 *     to JSON. Callable - NO; Instantiable - YES; Subclassable - YES;
 *     Nestable(via #Include) - NO.
 * Methods:
 *     Load() - see relevant documentation before method definition header
 *     Dump() - see relevant documentation before method definition header
 */
class JSON
{
	/**
	 * Method: Load
	 *     Parses a JSON string into an AHK value
	 * Syntax:
	 *     value := JSON.Load( text [, reviver ] )
	 * Parameter(s):
	 *     value      [retval] - parsed value
	 *     text    [in, ByRef] - JSON formatted string
	 *     reviver   [in, opt] - function object, similar to JavaScript's
	 *                           JSON.parse() 'reviver' parameter
	 */
	class Load extends JSON.Functor
	{
		Call(self, ByRef text, reviver:="")
		{
			this.rev := IsObject(reviver) ? reviver : false
		; Object keys(and array indices) are temporarily stored in arrays so that
		; we can enumerate them in the order they appear in the document/text instead
		; of alphabetically. Skip if no reviver function is specified.
			this.keys := this.rev ? {} : false

			static quot := Chr(34), bashq := "\" . quot
			     , json_value := quot . "{[01234567890-tfn"
			     , json_value_or_array_closing := quot . "{[]01234567890-tfn"
			     , object_key_or_object_closing := quot . "}"

			key := ""
			is_key := false
			root := {}
			stack := [root]
			next := json_value
			pos := 0

			while ((ch := SubStr(text, ++pos, 1)) != "") {
				if InStr(" `t`r`n", ch)
					continue
				if !InStr(next, ch, 1)
					this.ParseError(next, text, pos)

				holder := stack[1]
				is_array := holder.IsArray

				if InStr(",:", ch) {
					next := (is_key := !is_array && ch == ",") ? quot : json_value

				} else if InStr("}]", ch) {
					ObjRemoveAt(stack, 1)
					next := stack[1]==root ? "" : stack[1].IsArray ? ",]" : ",}"

				} else {
					if InStr("{[", ch) {
					; Check if Array() is overridden and if its return value has
					; the 'IsArray' property. If so, Array() will be called normally,
					; otherwise, use a custom base object for arrays
						static json_array := Func("Array").IsBuiltIn || ![].IsArray ? {IsArray: true} : 0
					
					; sacrifice readability for minor(actually negligible) performance gain
						(ch == "{")
							? ( is_key := true
							  , value := {}
							  , next := object_key_or_object_closing )
						; ch == "["
							: ( value := json_array ? new json_array : []
							  , next := json_value_or_array_closing )
						
						ObjInsertAt(stack, 1, value)

						if (this.keys)
							this.keys[value] := []
					
					} else {
						if (ch == quot) {
							i := pos
							while (i := InStr(text, quot,, i+1)) {
								value := StrReplace(SubStr(text, pos+1, i-pos-1), "\\", "\u005c")

								static tail := A_AhkVersion<"2" ? 0 : -1
								if (SubStr(value, tail) != "\")
									break
							}

							if (!i)
								this.ParseError("'", text, pos)

							  value := StrReplace(value,  "\/",  "/")
							, value := StrReplace(value, bashq, quot)
							, value := StrReplace(value,  "\b", "`b")
							, value := StrReplace(value,  "\f", "`f")
							, value := StrReplace(value,  "\n", "`n")
							, value := StrReplace(value,  "\r", "`r")
							, value := StrReplace(value,  "\t", "`t")

							pos := i ; update pos
							
							i := 0
							while (i := InStr(value, "\",, i+1)) {
								if !(SubStr(value, i+1, 1) == "u")
									this.ParseError("\", text, pos - StrLen(SubStr(value, i+1)))

								uffff := Abs("0x" . SubStr(value, i+2, 4))
								if (A_IsUnicode || uffff < 0x100)
									value := SubStr(value, 1, i-1) . Chr(uffff) . SubStr(value, i+6)
							}

							if (is_key) {
								key := value, next := ":"
								continue
							}
						
						} else {
							value := SubStr(text, pos, i := RegExMatch(text, "[\]\},\s]|$",, pos)-pos)

							static number := "number", integer :="integer"
							if value is %number%
							{
								if value is %integer%
									value += 0
							}
							else if (value == "true" || value == "false")
								value := %value% + 0
							else if (value == "null")
								value := ""
							else
							; we can do more here to pinpoint the actual culprit
							; but that's just too much extra work.
								this.ParseError(next, text, pos, i)

							pos += i-1
						}

						next := holder==root ? "" : is_array ? ",]" : ",}"
					} ; If InStr("{[", ch) { ... } else

					is_array? key := ObjPush(holder, value) : holder[key] := value

					if (this.keys && this.keys.HasKey(holder))
						this.keys[holder].Push(key)
				}
			
			} ; while ( ... )

			return this.rev ? this.Walk(root, "") : root[""]
		}

		ParseError(expect, ByRef text, pos, len:=1)
		{
			static quot := Chr(34), qurly := quot . "}"
			
			line := StrSplit(SubStr(text, 1, pos), "`n", "`r").Length()
			col := pos - InStr(text, "`n",, -(StrLen(text)-pos+1))
			msg := Format("{1}`n`nLine:`t{2}`nCol:`t{3}`nChar:`t{4}"
			,     (expect == "")     ? "Extra data"
			    : (expect == "'")    ? "Unterminated string starting at"
			    : (expect == "\")    ? "Invalid \escape"
			    : (expect == ":")    ? "Expecting ':' delimiter"
			    : (expect == quot)   ? "Expecting object key enclosed in double quotes"
			    : (expect == qurly)  ? "Expecting object key enclosed in double quotes or object closing '}'"
			    : (expect == ",}")   ? "Expecting ',' delimiter or object closing '}'"
			    : (expect == ",]")   ? "Expecting ',' delimiter or array closing ']'"
			    : InStr(expect, "]") ? "Expecting JSON value or array closing ']'"
			    :                      "Expecting JSON value(string, number, true, false, null, object or array)"
			, line, col, pos)

			static offset := A_AhkVersion<"2" ? -3 : -4
			throw Exception(msg, offset, SubStr(text, pos, len))
		}

		Walk(holder, key)
		{
			value := holder[key]
			if IsObject(value) {
				for i, k in this.keys[value] {
					; check if ObjHasKey(value, k) ??
					v := this.Walk(value, k)
					if (v != JSON.Undefined)
						value[k] := v
					else
						ObjDelete(value, k)
				}
			}
			
			return this.rev.Call(holder, key, value)
		}
	}

	/**
	 * Method: Dump
	 *     Converts an AHK value into a JSON string
	 * Syntax:
	 *     str := JSON.Dump( value [, replacer, space ] )
	 * Parameter(s):
	 *     str        [retval] - JSON representation of an AHK value
	 *     value          [in] - any value(object, string, number)
	 *     replacer  [in, opt] - function object, similar to JavaScript's
	 *                           JSON.stringify() 'replacer' parameter
	 *     space     [in, opt] - similar to JavaScript's JSON.stringify()
	 *                           'space' parameter
	 */
	class Dump extends JSON.Functor
	{
		Call(self, value, replacer:="", space:="")
		{
			this.rep := IsObject(replacer) ? replacer : ""

			this.gap := ""
			if (space) {
				static integer := "integer"
				if space is %integer%
					Loop, % ((n := Abs(space))>10 ? 10 : n)
						this.gap .= " "
				else
					this.gap := SubStr(space, 1, 10)

				this.indent := "`n"
			}

			return this.Str({"": value}, "")
		}

		Str(holder, key)
		{
			value := holder[key]

			if (this.rep)
				value := this.rep.Call(holder, key, ObjHasKey(holder, key) ? value : JSON.Undefined)

			if IsObject(value) {
			; Check object type, skip serialization for other object types such as
			; ComObject, Func, BoundFunc, FileObject, RegExMatchObject, Property, etc.
				static type := A_AhkVersion<"2" ? "" : Func("Type")
				if (type ? type.Call(value) == "Object" : ObjGetCapacity(value) != "") {
					if (this.gap) {
						stepback := this.indent
						this.indent .= this.gap
					}

					is_array := value.IsArray
				; Array() is not overridden, rollback to old method of
				; identifying array-like objects. Due to the use of a for-loop
				; sparse arrays such as '[1,,3]' are detected as objects({}). 
					if (!is_array) {
						for i in value
							is_array := i == A_Index
						until !is_array
					}

					str := ""
					if (is_array) {
						Loop, % value.Length() {
							if (this.gap)
								str .= this.indent
							
							v := this.Str(value, A_Index)
							str .= (v != "") ? v . "," : "null,"
						}
					} else {
						colon := this.gap ? ": " : ":"
						for k in value {
							v := this.Str(value, k)
							if (v != "") {
								if (this.gap)
									str .= this.indent

								str .= this.Quote(k) . colon . v . ","
							}
						}
					}

					if (str != "") {
						str := RTrim(str, ",")
						if (this.gap)
							str .= stepback
					}

					if (this.gap)
						this.indent := stepback

					return is_array ? "[" . str . "]" : "{" . str . "}"
				}
			
			} else ; is_number ? value : "value"
				return ObjGetCapacity([value], 1)=="" ? value : this.Quote(value)
		}

		Quote(string)
		{
			static quot := Chr(34), bashq := "\" . quot

			if (string != "") {
				  string := StrReplace(string,  "\",  "\\")
				; , string := StrReplace(string,  "/",  "\/") ; optional in ECMAScript
				, string := StrReplace(string, quot, bashq)
				, string := StrReplace(string, "`b",  "\b")
				, string := StrReplace(string, "`f",  "\f")
				, string := StrReplace(string, "`n",  "\n")
				, string := StrReplace(string, "`r",  "\r")
				, string := StrReplace(string, "`t",  "\t")

				static rx_escapable := A_AhkVersion<"2" ? "O)[^\x20-\x7e]" : "[^\x20-\x7e]"
				while RegExMatch(string, rx_escapable, m)
					string := StrReplace(string, m.Value, Format("\u{1:04x}", Ord(m.Value)))
			}

			return quot . string . quot
		}
	}

	/**
	 * Property: Undefined
	 *     Proxy for 'undefined' type
	 * Syntax:
	 *     undefined := JSON.Undefined
	 * Remarks:
	 *     For use with reviver and replacer functions since AutoHotkey does not
	 *     have an 'undefined' type. Returning blank("") or 0 won't work since these
	 *     can't be distnguished from actual JSON values. This leaves us with objects.
	 *     Replacer() - the caller may return a non-serializable AHK objects such as
	 *     ComObject, Func, BoundFunc, FileObject, RegExMatchObject, and Property to
	 *     mimic the behavior of returning 'undefined' in JavaScript but for the sake
	 *     of code readability and convenience, it's better to do 'return JSON.Undefined'.
	 *     Internally, the property returns a ComObject with the variant type of VT_EMPTY.
	 */
	Undefined[]
	{
		get {
			static empty := {}, vt_empty := ComObject(0, &empty, 1)
			return vt_empty
		}
	}

	class Functor
	{
		__Call(method, ByRef arg, args*)
		{
		; When casting to Call(), use a new instance of the "function object"
		; so as to avoid directly storing the properties(used across sub-methods)
		; into the "function object" itself.
			if IsObject(method)
				return (new this).Call(method, arg, args*)
			else if (method == "")
				return (new this).Call(arg, args*)
		}
	}
}

Base64Encode(String) ;by Uberi @ https://autohotkey.com/board/topic/5545-base64-coderdecoder/page-3#entry690930
{
    static CharSet := "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    VarSetCapacity(Output,Ceil(Length / 3) << 2)
    Index := 1, Length := StrLen(String)
    Loop, % Length // 3
    {
        Value := Asc(SubStr(String,Index,1)) << 16
            | Asc(SubStr(String,Index + 1,1)) << 8
            | Asc(SubStr(String,Index + 2,1))
        Index += 3
        Output .= SubStr(CharSet,(Value >> 18) + 1,1)
            . SubStr(CharSet,((Value >> 12) & 63) + 1,1)
            . SubStr(CharSet,((Value >> 6) & 63) + 1,1)
            . SubStr(CharSet,(Value & 63) + 1,1)
    }
    Length := Mod(Length,3)
    If Length = 0 ;no characters remain
        Return, Output
    Value := Asc(SubStr(String,Index,1)) << 10
    If Length = 1
    {
        Return, Output ;one character remains
            . SubStr(CharSet,(Value >> 12) + 1,1)
            . SubStr(CharSet,((Value >> 6) & 63) + 1,1) . "=="
    }
    Value |= Asc(SubStr(String,Index + 1,1)) << 2 ;insert the third character
    Return, Output ;two characters remain
        . SubStr(CharSet,(Value >> 12) + 1,1)
        . SubStr(CharSet,((Value >> 6) & 63) + 1,1)
        . SubStr(CharSet,(Value & 63) + 1,1) . "="
}

Global ADOSQL_LastError, ADOSQL_LastQuery ; These super-globals are for debugging your SQL queries.

ADOSQL(Query_Statement) {
Connection_String := "Provider=sqloledb;Data Source=DB-Portal;Initial Catalog=KMOBPortal;Integrated Security=SSPI;"
coer := "", txtout := 0, rd := "`n", cd := "CSV", str := Connection_String ; 'str' is shorter.

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

	If !( oCon := ComObjCreate( "ADODB.Connection" ) )
		Return "", ComObjError( 1 ), ErrorLevel := "Error"
		, ADOSQL_LastError := "Fatal Error: ADODB is not available."


	oCon.ConnectionTimeout := 3 ; Allow 3 seconds to connect to the server.
	oCon.CursorLocation := 3 ; Use a client-side cursor server.
	oCon.CommandTimeout := 900 ; A generous 15 minute timeout on the actual SQL statement.
	oCon.Open( str ) ; open the connection.

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

	oCon.Close()
	;ComObjError( 1 )
	ErrorLevel := coer
	Return txtout ? Query_Statement : o3DA.MaxIndex() = 1 ? o3DA[1] : o3DA
} ; END - ADOSQL( Connection_String, Query_Statement )


class Chrome
{
	static DebugPort := 9222
	
	/*
		Escape a string in a manner suitable for command line parameters
	*/
	CliEscape(Param)
	{
		return """" RegExReplace(Param, "(\\*)""", "$1$1\""") """"
	}
	
	/*
		Finds instances of chrome in debug mode and the ports they're running
		on. If no instances are found, returns a false value. If one or more
		instances are found, returns an associative array where the keys are
		the ports, and the values are the full command line texts used to start
		the processes.
		
		One example of how this may be used would be to open chrome on a
		different port if an instance of chrome is already open on the port
		you wanted to used.
		
		```
		; If the wanted port is taken, use the largest taken port plus one
		DebugPort := 9222
		if (Chromes := Chrome.FindInstances()).HasKey(DebugPort)
			DebugPort := Chromes.MaxIndex() + 1
		ChromeInst := new Chrome(ProfilePath,,,, DebugPort)
		```
		
		Another use would be to scan for running instances and attach to one
		instead of starting a new instance.
		
		```
		if (Chromes := Chrome.FindInstances())
			ChromeInst := {"base": Chrome, "DebugPort": Chromes.MinIndex()}
		else
			ChromeInst := new Chrome(ProfilePath)
		```
	*/
	FindInstances()
	{
		static Needle := "--remote-debugging-port=(\d+)"
		Out := {}
		for Item in ComObjGet("winmgmts:")
			.ExecQuery("SELECT CommandLine FROM Win32_Process"
			. " WHERE Name = 'chrome.exe'")
			if RegExMatch(Item.CommandLine, Needle, Match)
				Out[Match1] := Item.CommandLine
		return Out.MaxIndex() ? Out : False
	}
	
	/*
		ProfilePath - Path to the user profile directory to use. Will use the standard if left blank.
		URLs        - The page or array of pages for Chrome to load when it opens
		Flags       - Additional flags for chrome when launching
		ChromePath  - Path to chrome.exe, will detect from start menu when left blank
		DebugPort   - What port should Chrome's remote debugging server run on
	*/
	__New(ProfilePath:="", URLs:="about:blank", Flags:="", ChromePath:="", DebugPort:="")
	{
		; Verify ProfilePath
		if (ProfilePath != "" && !InStr(FileExist(ProfilePath), "D"))
			throw Exception("The given ProfilePath does not exist")
		this.ProfilePath := ProfilePath
		
		; Verify ChromePath
		if (ChromePath == "")
			FileGetShortcut, %A_StartMenuCommon%\Programs\Google Chrome.lnk, ChromePath
		if (ChromePath == "")
			RegRead, ChromePath, HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Pahs\chrome.exe
		if !FileExist(ChromePath)
			throw Exception("Chrome could not be found")
		this.ChromePath := ChromePath
		
		; Verify DebugPort
		if (DebugPort != "")
		{
			if DebugPort is not integer
				throw Exception("DebugPort must be a positive integer")
			else if (DebugPort <= 0)
				throw Exception("DebugPort must be a positive integer")
			this.DebugPort := DebugPort
		}
		
		; Escape the URL(s)
		for Index, URL in IsObject(URLs) ? URLs : [URLs]
			URLString .= " " this.CliEscape(URL)
		
		Run, % this.CliEscape(ChromePath)
		. " --remote-debugging-port=" this.DebugPort
		. (ProfilePath ? " --user-data-dir=" this.CliEscape(ProfilePath) : "")
		. (Flags ? " " Flags : "")
		. URLString
		,,, OutputVarPID
		this.PID := OutputVarPID
	}
	
	/*
		End Chrome by terminating the process.
	*/
	Kill()
	{
		Process, Close, % this.PID
	}
	
	/*
		Queries chrome for a list of pages that expose a debug interface.
		In addition to standard tabs, these include pages such as extension
		configuration pages.
	*/
	GetPageList()
	{
		http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
		http.open("GET", "http://127.0.0.1:" this.DebugPort "/json")
		http.send()
		return this.Jxon_Load(http.responseText)
	}
	
	/*
		Returns a connection to the debug interface of a page that matches the
		provided criteria. When multiple pages match the criteria, they appear
		ordered by how recently the pages were opened.
		
		Key        - The key from the page list to search for, such as "url" or "title"
		Value      - The value to search for in the provided key
		MatchMode  - What kind of search to use, such as "exact", "contains", "startswith", or "regex"
		Index      - If multiple pages match the given criteria, which one of them to return
		fnCallback - A function to be called whenever message is received from the page
	*/
	GetPageBy(Key, Value, MatchMode:="exact", Index:=1, fnCallback:="")
	{
		Count := 0
		for n, PageData in this.GetPageList()
		{
			if (((MatchMode = "exact" && PageData[Key] = Value) ; Case insensitive
				|| (MatchMode = "contains" && InStr(PageData[Key], Value))
				|| (MatchMode = "startswith" && InStr(PageData[Key], Value) == 1)
				|| (MatchMode = "regex" && PageData[Key] ~= Value))
				&& ++Count == Index)
				return new this.Page(PageData.webSocketDebuggerUrl, fnCallback)
		}
	}
	
	/*
		Shorthand for GetPageBy("url", Value, "startswith")
	*/
	GetPageByURL(Value, MatchMode:="startswith", Index:=1, fnCallback:="")
	{
		return this.GetPageBy("url", Value, MatchMode, Index, fnCallback)
	}
	
	/*
		Shorthand for GetPageBy("title", Value, "startswith")
	*/
	GetPageByTitle(Value, MatchMode:="startswith", Index:=1, fnCallback:="")
	{
		return this.GetPageBy("title", Value, MatchMode, Index, fnCallback)
	}
	
	/*
		Shorthand for GetPageBy("type", Type, "exact")
		
		The default type to search for is "page", which is the visible area of
		a normal Chrome tab.
	*/
	GetPage(Index:=1, Type:="page", fnCallback:="")
	{
		return this.GetPageBy("type", Type, "exact", Index, fnCallback)
	}
	
	/*
		Connects to the debug interface of a page given its WebSocket URL.
	*/
	class Page
	{
		Connected := False
		ID := 0
		Responses := []
		
		/*
			wsurl      - The desired page's WebSocket URL
			fnCallback - A function to be called whenever message is received
		*/
		__New(wsurl, fnCallback:="")
		{
			this.fnCallback := fnCallback
			this.BoundKeepAlive := this.Call.Bind(this, "Browser.getVersion",, False)
			
			; TODO: Throw exception on invalid objects
			if IsObject(wsurl)
				wsurl := wsurl.webSocketDebuggerUrl
			
			wsurl := StrReplace(wsurl, "localhost", "127.0.0.1")
			this.ws := {"base": this.WebSocket, "_Event": this.Event, "Parent": this}
			this.ws.__New(wsurl)
			
			while !this.Connected
				Sleep, 50
		}
		
		/*
			Calls the specified endpoint and provides it with the given
			parameters.
			
			DomainAndMethod - The endpoint domain and method name for the
			endpoint you would like to call. For example:
			PageInst.Call("Browser.close")
			PageInst.Call("Schema.getDomains")
			
			Params - An associative array of parameters to be provided to the
			endpoint. For example:
			PageInst.Call("Page.printToPDF", {"scale": 0.5 ; Numeric Value
			, "landscape": Chrome.Jxon_True() ; Boolean Value
			, "pageRanges: "1-5, 8, 11-13"}) ; String value
			PageInst.Call("Page.navigate", {"url": "https://autohotkey.com/"})
			
			WaitForResponse - Whether to block until a response is received from
			Chrome, which is necessary to receive a return value, or whether
			to continue on with the script without waiting for a response.
		*/
		Call(DomainAndMethod, Params:="", WaitForResponse:=True)
		{
			;if !this.Connected
			;	throw Exception("Not connected to tab")
			
			;;;;; MAYBE TURN BACK ON LATER I DUNNO
			
			
			; Use a temporary variable for ID in case more calls are made
			; before we receive a response.
			ID := this.ID += 1
			this.ws.Send(Chrome.Jxon_Dump({"id": ID
			, "params": Params ? Params : {}
			, "method": DomainAndMethod}))
			
			if !WaitForResponse
				return
			
			; Wait for the response
			this.responses[ID] := False
			while !this.responses[ID]
				Sleep, 50
			
			; Get the response, check if it's an error
			response := this.responses.Delete(ID)
			if (response.error)
				throw Exception("Chrome indicated error in response",, Chrome.Jxon_Dump(response.error))
			
			return response.result
		}
		
		/*
			Run some JavaScript on the page. For example:
			
			PageInst.Evaluate("alert(""I can't believe it's not IE!"");")
			PageInst.Evaluate("document.getElementsByTagName('button')[0].click();")
		*/
		Evaluate(JS)
		{
			response := this.Call("Runtime.evaluate",
			( LTrim Join
			{
				"expression": JS,
				"objectGroup": "console",
				"includeCommandLineAPI": Chrome.Jxon_True(),
				"silent": Chrome.Jxon_False(),
				"returnByValue": Chrome.Jxon_False(),
				"userGesture": Chrome.Jxon_True(),
				"awaitPromise": Chrome.Jxon_False()
			}
			))
			
			; if (response.exceptionDetails)
			;	throw Exception(response.result.description,, Chrome.Jxon_Dump(response.exceptionDetails))
			
						
			;;;;; MAYBE TURN BACK ON LATER I DUNNO
			
			return response.result
		}
		
		/*
			Waits for the page's readyState to match the DesiredState.
			
			DesiredState - The state to wait for the page's ReadyState to match
			Interval     - How often it should check whether the state matches
		*/
		WaitForLoad(DesiredState:="complete", Interval:=100)
		{
			while this.Evaluate("document.readyState").value != DesiredState
				Sleep, Interval
		}
		
		/*
			Internal function triggered when the script receives a message on
			the WebSocket connected to the page.
		*/
		Event(EventName, Event)
		{
			; If it was called from the WebSocket adjust the class context
			if this.Parent
				this := this.Parent
			
			; TODO: Handle Error events
			if (EventName == "Open")
			{
				this.Connected := True
				BoundKeepAlive := this.BoundKeepAlive
				SetTimer, %BoundKeepAlive%, 15000
			}
			else if (EventName == "Message")
			{
				data := Chrome.Jxon_Load(Event.data)
				
				; Run the callback routine
				fnCallback := this.fnCallback
				if (newData := %fnCallback%(data))
					data := newData
				
				if this.responses.HasKey(data.ID)
					this.responses[data.ID] := data
			}
			else if (EventName == "Close")
			{
				this.Disconnect()
			}
			else if (EventName == "Error")
			{
				; throw Exception("Websocket Error!")
				
							
			;;;;; MAYBE TURN BACK ON LATER I DUNNO
			}
		}
		
		/*
			Disconnect from the page's debug interface, allowing the instance
			to be garbage collected.
			
			This method should always be called when you are finished with a
			page or else your script will leak memory.
		*/
		Disconnect()
		{
			if !this.Connected
				return
			
			this.Connected := False
			this.ws.Delete("Parent")
			this.ws.Disconnect()
			
			BoundKeepAlive := this.BoundKeepAlive
			SetTimer, %BoundKeepAlive%, Delete
			this.Delete("BoundKeepAlive")
		}
		
		class WebSocket
		{
			__New(WS_URL)
			{
				static wb
				
				; Create an IE instance
				Gui, +hWndhOld
				Gui, New, +hWndhWnd
				this.hWnd := hWnd
				Gui, Add, ActiveX, vWB, Shell.Explorer
				Gui, %hOld%: Default
				

				; Write an appropriate document
				WB.Navigate("about:<!DOCTYPE html><meta http-equiv='X-UA-Compatible'"
				. "content='IE=edge'><body></body>")
				while (WB.ReadyState < 4)
					sleep, 50
				this.document := WB.document
				
				; Add our handlers to the JavaScript namespace
				this.document.parentWindow.ahk_savews := this._SaveWS.Bind(this)
				this.document.parentWindow.ahk_event := this._Event.Bind(this)
				this.document.parentWindow.ahk_ws_url := WS_URL
				
				; Add some JavaScript to the page to open a socket
				Script := this.document.createElement("script")
				Script.text := "ws = new WebSocket(ahk_ws_url);`n"
				. "ws.onopen = function(event){ ahk_event('Open', event); };`n"
				. "ws.onclose = function(event){ ahk_event('Close', event); };`n"
				. "ws.onerror = function(event){ ahk_event('Error', event); };`n"
				. "ws.onmessage = function(event){ ahk_event('Message', event); };"
				this.document.body.appendChild(Script)
			}
			
			; Called by the JS in response to WS events
			_Event(EventName, Event)
			{
				this["On" EventName](Event)
			}
			
			; Sends data through the WebSocket
			Send(Data)
			{
				this.document.parentWindow.ws.send(Data)
			}
			
			; Closes the WebSocket connection
			Close(Code:=1000, Reason:="")
			{
				this.document.parentWindow.ws.close(Code, Reason)
			}
			
			; Closes and deletes the WebSocket, removing
			; references so the class can be garbage collected
			Disconnect()
			{
				if this.hWnd
				{
					this.Close()
					Gui, % this.hWnd ": Destroy"
					this.hWnd := False
				}
			}
		}
	}
	
	Jxon_Load(ByRef src, args*)
	{
		static q := Chr(34)
		
		key := "", is_key := false
		stack := [ tree := [] ]
		is_arr := { (tree): 1 }
		next := q . "{[01234567890-tfn"
		pos := 0
		while ( (ch := SubStr(src, ++pos, 1)) != "" )
		{
			if InStr(" `t`n`r", ch)
				continue
			if !InStr(next, ch, true)
			{
				ln := ObjLength(StrSplit(SubStr(src, 1, pos), "`n"))
				col := pos - InStr(src, "`n",, -(StrLen(src)-pos+1))
				
				msg := Format("{}: line {} col {} (char {})"
				,   (next == "")      ? ["Extra data", ch := SubStr(src, pos)][1]
				: (next == "'")     ? "Unterminated string starting at"
				: (next == "\")     ? "Invalid \escape"
				: (next == ":")     ? "Expecting ':' delimiter"
				: (next == q)       ? "Expecting object key enclosed in double quotes"
				: (next == q . "}") ? "Expecting object key enclosed in double quotes or object closing '}'"
				: (next == ",}")    ? "Expecting ',' delimiter or object closing '}'"
				: (next == ",]")    ? "Expecting ',' delimiter or array closing ']'"
				: [ "Expecting JSON value(string, number, [true, false, null], object or array)"
				, ch := SubStr(src, pos, (SubStr(src, pos)~="[\]\},\s]|$")-1) ][1]
				, ln, col, pos)
				
				throw Exception(msg, -1, ch)
			}
			
			is_array := is_arr[obj := stack[1]]
			
			if i := InStr("{[", ch)
			{
				val := (proto := args[i]) ? new proto : {}
				is_array? ObjPush(obj, val) : obj[key] := val
				ObjInsertAt(stack, 1, val)
				
				is_arr[val] := !(is_key := ch == "{")
				next := q . (is_key ? "}" : "{[]0123456789-tfn")
			}
			
			else if InStr("}]", ch)
			{
				ObjRemoveAt(stack, 1)
				next := stack[1]==tree ? "" : is_arr[stack[1]] ? ",]" : ",}"
			}
			
			else if InStr(",:", ch)
			{
				is_key := (!is_array && ch == ",")
				next := is_key ? q : q . "{[0123456789-tfn"
			}
			
			else ; string | number | true | false | null
			{
				if (ch == q) ; string
				{
					i := pos
					while i := InStr(src, q,, i+1)
					{
						val := StrReplace(SubStr(src, pos+1, i-pos-1), "\\", "\u005C")
						static end := A_AhkVersion<"2" ? 0 : -1
						if (SubStr(val, end) != "\")
							break
					}
					if !i ? (pos--, next := "'") : 0
						continue
					
					pos := i ; update pos
					
					val := StrReplace(val,    "\/",  "/")
					, val := StrReplace(val, "\" . q,    q)
					, val := StrReplace(val,    "\b", "`b")
					, val := StrReplace(val,    "\f", "`f")
					, val := StrReplace(val,    "\n", "`n")
					, val := StrReplace(val,    "\r", "`r")
					, val := StrReplace(val,    "\t", "`t")
					
					i := 0
					while i := InStr(val, "\",, i+1)
					{
						if (SubStr(val, i+1, 1) != "u") ? (pos -= StrLen(SubStr(val, i)), next := "\") : 0
							continue 2
						
						; \uXXXX - JSON unicode escape sequence
						xxxx := Abs("0x" . SubStr(val, i+2, 4))
						if (A_IsUnicode || xxxx < 0x100)
							val := SubStr(val, 1, i-1) . Chr(xxxx) . SubStr(val, i+6)
					}
					
					if is_key
					{
						key := val, next := ":"
						continue
					}
				}
				
				else ; number | true | false | null
				{
					val := SubStr(src, pos, i := RegExMatch(src, "[\]\},\s]|$",, pos)-pos)
					
					; For numerical values, numerify integers and keep floats as is.
					; I'm not yet sure if I should numerify floats in v2.0-a ...
					static number := "number", integer := "integer"
					if val is %number%
					{
						if val is %integer%
							val += 0
					}
					; in v1.1, true,false,A_PtrSize,A_IsUnicode,A_Index,A_EventInfo,
					; SOMETIMES return strings due to certain optimizations. Since it
					; is just 'SOMETIMES', numerify to be consistent w/ v2.0-a
					else if (val == "true" || val == "false")
						val := %value% + 0
					; AHK_H has built-in null, can't do 'val := %value%' where value == "null"
					; as it would raise an exception in AHK_H(overriding built-in var)
					else if (val == "null")
						val := ""
					; any other values are invalid, continue to trigger error
					else if (pos--, next := "#")
						continue
					
					pos += i-1
				}
				
				is_array? ObjPush(obj, val) : obj[key] := val
				next := obj==tree ? "" : is_array ? ",]" : ",}"
			}
		}
		
		return tree[1]
	}
	
	Jxon_Dump(obj, indent:="", lvl:=1)
	{
		static q := Chr(34)
		
		if IsObject(obj)
		{
			static Type := Func("Type")
			if Type ? (Type.Call(obj) != "Object") : (ObjGetCapacity(obj) == "")
				throw Exception("Object type not supported.", -1, Format("<Object at 0x{:p}>", &obj))
			
			prefix := SubStr(A_ThisFunc, 1, InStr(A_ThisFunc, ".",, 0))
			fn_t := prefix "Jxon_True",  obj_t := this ? %fn_t%(this) : %fn_t%()
			fn_f := prefix "Jxon_False", obj_f := this ? %fn_f%(this) : %fn_f%()
			
			if (&obj == &obj_t)
				return "true"
			else if (&obj == &obj_f)
				return "false"
			
			is_array := 0
			for k in obj
				is_array := k == A_Index
			until !is_array
			
			static integer := "integer"
			if indent is %integer%
			{
				if (indent < 0)
					throw Exception("Indent parameter must be a postive integer.", -1, indent)
				spaces := indent, indent := ""
				Loop % spaces
					indent .= " "
			}
			indt := ""
			Loop, % indent ? lvl : 0
				indt .= indent
			
			this_fn := this ? Func(A_ThisFunc).Bind(this) : A_ThisFunc
			lvl += 1, out := "" ; Make #Warn happy
			for k, v in obj
			{
				if IsObject(k) || (k == "")
					throw Exception("Invalid object key.", -1, k ? Format("<Object at 0x{:p}>", &obj) : "<blank>")
				
				if !is_array
					out .= ( ObjGetCapacity([k], 1) ? %this_fn%(k) : q . k . q ) ;// key
				.  ( indent ? ": " : ":" ) ; token + padding
				out .= %this_fn%(v, indent, lvl) ; value
				.  ( indent ? ",`n" . indt : "," ) ; token + indent
			}
			
			if (out != "")
			{
				out := Trim(out, ",`n" . indent)
				if (indent != "")
					out := "`n" . indt . out . "`n" . SubStr(indt, StrLen(indent)+1)
			}
			
			return is_array ? "[" . out . "]" : "{" . out . "}"
		}
		
		; Number
		else if (ObjGetCapacity([obj], 1) == "")
			return obj
		
		; String (null -> not supported by AHK)
		if (obj != "")
		{
			obj := StrReplace(obj,  "\",    "\\")
			, obj := StrReplace(obj,  "/",    "\/")
			, obj := StrReplace(obj,    q, "\" . q)
			, obj := StrReplace(obj, "`b",    "\b")
			, obj := StrReplace(obj, "`f",    "\f")
			, obj := StrReplace(obj, "`n",    "\n")
			, obj := StrReplace(obj, "`r",    "\r")
			, obj := StrReplace(obj, "`t",    "\t")
			
			static needle := (A_AhkVersion<"2" ? "O)" : "") . "[^\x20-\x7e]"
			while RegExMatch(obj, needle, m)
				obj := StrReplace(obj, m[0], Format("\u{:04X}", Ord(m[0])))
		}
		
		return q . obj . q
	}
	
	Jxon_True()
	{
		static obj := {}
		return obj
	}
	
	Jxon_False()
	{
		static obj := {}
		return obj
	}
}
