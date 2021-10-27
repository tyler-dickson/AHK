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

MsgBox, 0, Priorities & Assignments Duplicator, Welcome to the Priorities & Assignments Duplicator!`n`nPress PrintScreen to grab data.`n`nWhen you're on the Invention screen, it will grab the list of Priorities.`n`nWhen you're on the Country page, it will grab the list of Assignments instead.`n`nOnce you've grabbed the data, go to your new appropriate page and click either Add All, or individually add each to the page. The page will refresh and should now have the added items.`n`nIt seems you have can multiple instances of this open at once, so if you need to grab both Priorities and Assignments, it will create TWO separate interfaces.`n`nUPDATE 5/21/2020:`nYou can now import from an Excel document. Make sure you have added the App# Filter column so everything will line up.`nHighlight your data in Excel then press PrintScreen. It should work about the same way.

PrintScreen::
ie := WBGet()

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
else if InStr(ie.LocationURL, "patfrmInvention")
	{
	Gui, New, , Priorities & Assignments Duplicator
	;Gui, Add, Tab3,, Priorities|Assignments
	Gui, Add, ActiveX, x650 y0 w0 h0 vie2, Shell.Explorer
	Gui, Add, Text, x5 yp+5 wp h5 , 
	ie := WBGet()
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
else if InStr(ie.LocationURL, "patfrmCountryApplication")
	{
	Gui, New, , Priorities & Assignments Duplicator
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
storedLocation := StrSplit(ie.LocationURL, "&")
	
if InStr(ie.LocationURL, "patfrmInvention")
	{
	location := StrReplace(ie.LocationURL, "Invention", "InvPriority")
	ie2.Navigate(location)
	while ie2.busy or ie2.ReadyState != 4 ;Wait for page to load
		Sleep, 100
	rows:= ie2.document.getElementById("dgdMain").getElementsByTagName("TR").length
	outerLoop = 0

	if InStr(ie2.document.getElementsByTagName("IMG")[3].alt, "Delete")
		offset = 1
	else
		offset = 0
	Loop % rows
		{
		savedData := ""
		Gui, Add, Button, xp+100 yp w100 h20 gAddPriority v%A_Index%, Add Priority %A_Index%
		Loop 5
			{
			tempData :=	Trim(ie2.document.getElementById("dgdMain").getElementsByTagName("TR")[outerLoop].getElementsByTagName("TD")[A_Index + offset].innerText)
			Gui, Add, Edit, xp+100 yp w100 h20, % tempData
			}
		Gui, Add, Text, x-95 yp+20 wp h5 , 
		outerLoop++
		}
	Gui, Add, Text, x-95 yp wp h5 , 
	GuiControl, Focus, Static1
	Gui, Show, w610
	}
else if InStr(ie.LocationURL, "patfrmCountryApplication")
	{
	location := StrReplace(ie.LocationURL, "patfrmCountryApplication", "patfrmAppAssignment")
	ie2.Navigate(location)
	while ie2.busy or ie2.ReadyState != 4 ;Wait for page to load
		Sleep, 100
	rows:= ie2.document.getElementById("dgdMain").getElementsByTagName("TR").length
	outerLoop = 0

	if InStr(ie2.document.getElementsByTagName("IMG")[3].alt, "Delete")
		offset = 1
	else
		offset = 0
	Loop % rows / 3 
		{
		savedData := ""
		Gui, Add, Button, xp+100 yp w100 h20 gAddPriority v%A_Index%, Add Assignment %A_Index%

		Gui, Add, Edit, xp+100 yp w100 h20, % Trim(ie2.document.getElementById("dgdMain").getElementsByTagName("TR")[outerLoop].getElementsByTagName("SPAN")[1].innerText)
		Gui, Add, Edit, xp+100 yp w100 h20, % Trim(ie2.document.getElementById("dgdMain").getElementsByTagName("TR")[outerLoop].getElementsByTagName("SPAN")[3].innerText)
		Gui, Add, Edit, xp+100 yp w100 h20, % Trim(ie2.document.getElementById("dgdMain").getElementsByTagName("TR")[outerLoop].getElementsByTagName("SPAN")[5].innerText)
		Gui, Add, Edit, xp+100 yp w100 h20, % Trim(ie2.document.getElementById("dgdMain").getElementsByTagName("TR")[outerLoop].getElementsByTagName("SPAN")[7].innerText)
		Gui, Add, Edit, xp+100 yp w100 h20, % Trim(ie2.document.getElementById("dgdMain").getElementsByTagName("TR")[outerLoop].getElementsByTagName("SPAN")[9].innerText)
		

		Gui, Add, Text, x-95 yp+20 wp h5 , 
		outerLoop += 3
		}
	Gui, Add, Text, x-95 yp wp h5 , 
	GuiControl, Focus, Static1
	Gui, Show, w610
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

WinGetPos, , , , hHeight, Priorities & Assignments Duplicator
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

WinGetPos, , , , hHeight, Priorities & Assignments Duplicator
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
ie := WBGet()
if InStr(ie.LocationURL, "patfrmInvention")
	{
	ie.document.getElementById("fldstrClientName").style.backgroundColor := "green"
	ie.document.getElementById("fldstrClientName").style.color := "white"
	ie.document.getElementById("fldstrClientName").style.fontWeight := "bold"

	if (DoAll)
		ie.document.getElementById("fldstrClientName").value := "Injecting priority #" priorityLoop ". Please hold..."
	else
		ie.document.getElementById("fldstrClientName").value := "Injecting priority! Please hold..."

	storedLocation := StrSplit(ie.LocationURL, "&")
	location := StrReplace(ie.LocationURL, "Invention", "InvPriority")
	ie2.Navigate(location)
	while ie2.busy or ie2.ReadyState != 4 ;Wait for page to load
		Sleep, 100

	if (DoAll)
		whichEdits := (priorityLoop * 5)  + 5
	else
		whichEdits := (A_GuiControl * 5)  + 5

	ie2.document.getElementById("btnNew").Click()
	Sleep 250
	GuiControlGet, Country, 	, % "Edit" whichEdits - 4 	; 1 = 1-5, 2 = 6-10
	GuiControlGet, CaseType, 	, % "Edit" whichEdits - 3 	; 1 = 1-5, 2 = 6-10
	GuiControlGet, AppFilter, 	, % "Edit" whichEdits - 2 	; 1 = 1-5, 2 = 6-10
	GuiControlGet, AppNumber, 	, % "Edit" whichEdits - 1 	; 1 = 1-5, 2 = 6-10
	GuiControlGet, FilingDate, 	, % "Edit" whichEdits   	; 1 = 1-5, 2 = 6-10
	Sleep 250
	ie2.document.getElementsByTagName("INPUT")[3].value := Country
	ie2.document.getElementsByTagName("INPUT")[4].value := CaseType
	ie2.document.getElementsByTagName("INPUT")[5].value := AppFilter
	ie2.document.getElementsByTagName("INPUT")[6].value := AppNumber
	ie2.document.getElementsByTagName("INPUT")[7].value := FilingDate
	Sleep 500
	
	imgs := ie2.document.getElementsByTagName("IMG").length
	Loop % imgs
		{
		if InStr(ie2.document.getElementsByTagName("IMG")[A_Index].alt, "Save")
			ie2.document.getElementsByTagName("IMG")[A_Index].Click()
		}
	if (!DoAll)
		ie.Navigate(storedLocation[1] "&tab=1")	
	}
else
	{
	ie.document.getElementById("fldstrClientName").style.backgroundColor := "green"
	ie.document.getElementById("fldstrClientName").style.color := "white"
	ie.document.getElementById("fldstrClientName").style.fontWeight := "bold"

	if (DoAll)
		ie.document.getElementById("fldstrClientName").value := "Injecting assignment #" priorityLoop ". Please hold..."
	else
		ie.document.getElementById("fldstrClientName").value := "Injecting assignment! Please hold..."

	storedLocation := StrSplit(ie.LocationURL, "&")
	
	location := StrReplace(ie.LocationURL, "patfrmCountryApplication", "patfrmAppAssignment")
	ie2.Navigate(location)
	while ie2.busy or ie2.ReadyState != 4 ;Wait for page to load
		Sleep, 100

	if (DoAll)
		whichEdits := (priorityLoop * 5)  + 5
	else
		whichEdits := (A_GuiControl * 5)  + 5

	ie2.document.getElementById("btnNew").Click()

	Sleep 250
	GuiControlGet, From, 	, % "Edit" whichEdits - 4 	; 1 = 1-5, 2 = 6-10
	GuiControlGet, Date, 	, % "Edit" whichEdits - 3 	; 1 = 1-5, 2 = 6-10
	GuiControlGet, To, 		, % "Edit" whichEdits - 2 	; 1 = 1-5, 2 = 6-10
	GuiControlGet, Reel, 	, % "Edit" whichEdits - 1 	; 1 = 1-5, 2 = 6-10
	GuiControlGet, Frame, 	, % "Edit" whichEdits   	; 1 = 1-5, 2 = 6-10
	Sleep 250
	ie2.document.getElementsByTagName("INPUT")[3].value := From
	ie2.document.getElementsByTagName("INPUT")[4].value := Date
	ie2.document.getElementsByTagName("INPUT")[5].value := To
	ie2.document.getElementsByTagName("INPUT")[6].value := Reel
	ie2.document.getElementsByTagName("INPUT")[7].value := Frame
	Sleep 500
	
	imgs := ie2.document.getElementsByTagName("IMG").length
	Loop % imgs
		{
		if InStr(ie2.document.getElementsByTagName("IMG")[A_Index].alt, "Save")
			ie2.document.getElementsByTagName("IMG")[A_Index].Click()
		}
	if (!DoAll)
		ie.Navigate(storedLocation[1] "&tab=3")	
	}
return

GuiClose:
Gui, Destroy
outerLoop = 0
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