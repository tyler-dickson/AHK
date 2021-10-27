#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, pifmgr.dll, 30
Enabled := ComObjError(false)

global offset = 3

StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}

if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder

IniRead, ExcelSearch, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ExcelSearch
	if ExcelSearch = ERROR
		{
		ExcelSearch = 0
		IniWrite, %ExcelSearch%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ExcelSearch
		IniRead, ExcelSearch, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ExcelSearch
		}

xl := ComObjActive("Excel.Application")
TrueOrFalse := IsObject(xl)
if (TrueOrFalse == 1)
	{
	while (xl.Range("B" . A_Index + 3).Value != "") {
		offset++
	}
	WinActivate, ahk_exe EXCEL.EXE
	Gui, Excel: New, AlwaysOnTop, Excel Search

	if (offset == 3)	
		{
		Gui, Excel: Font, bold s12 cRed
		Gui, Excel: Add, Text, Center w400, I might be having some issues.`nConsider clicking the button below. 	
		Gui, Excel: Font, s12
		}
	else
		{
		Gui, Excel: Font, bold s12 cGreen
		Gui, Excel: Add, Text,Center w400, Starting on Row %offset%.`nThis is the first unfinished AT that I found. 
		Gui, Excel: Font, s12
		}
		Gui, Excel: Add, Button, gCloseExcel w400, Not working, or behaving strangely?`nSave your work and close Excel, and then click this button to fix the issue.
		Gui, Excel: Font, 
		Gui, Excel: Show
	}
	else
	{
	MsgBox, Couldn't find Excel. Open Excel first, then try again.	
	ExitApp
	}

return

Recalculate:
xl := ComObjActive("Excel.Application")
offset = 3
while (xl.Range("B" . A_Index + 3).Value != "") {
	offset++
}
; TrayTip, Starting on Row %offset%.,This is the first unfinished AT that I found. 
return

!f::
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
;MsgBox, %Body%

Gui, Excel: Destroy
Clipboard := ""
Send ^c
ClipWait, .5
if (Clipboard != "")
	Subj := Clipboard
Subj := RegExReplace(Subj, "[\r]")
Subj := RegExReplace(Subj, "[\n]")
Subj := RegExReplace(Subj, "[\r\n]")
Subj := StrReplace(Subj, "FW:" , "", , 1)
;Subj := StrReplace(Subj, "RE:" , "", , 1)
;Subj := StrReplace(Subj, A_Space , "", , 1)
Sleep 200
WinActivate, ahk_exe EXCEL.EXE
Instances = 0
Locations := ""
while (xl.Range("A" . A_Index + offset).Value != "") {
	value := xl.Range("D" . A_Index + offset).Value
	address := xl.Range("D" . A_Index + offset).Address
	StringReplace, FoundIt, value, %Subj%, %Subj%, UseErrorLevel
	if ErrorLevel = 1
		{
		datevalue := xl.Range("A" . A_Index + offset).Value
		newvalue := xl.Range("B" . A_Index + offset).Value
		newaddress := xl.Range("B" . A_Index + offset).Address
		timereceived := xl.Range("E" . A_Index + offset).Value
		if (newvalue == "") 
			{
			xl.Range(newaddress).Select()
			Instances++
			Locations := Locations " " address " "
			StringReplace, cleanaddress, address, $, , A
			}
		}
}
StringReplace, Locations, Locations, $, , A
TrayTip, Instances Found: %Instances%, I found %Instances% instances that aren't completed.`n%Locations%
value := ""
address := ""
newvalue := ""
newaddress := ""
cleanaddress := ""
datevalue := ""
timereceived := ""
Subj := ""
gosub RecordExcelSearch
; gosub Recalculate
return

;JumpToRow:
;NewCell := SubStr(A_GuiControl, 8, -1)
;xl.Range(NewCell).Select()
;WinActivate, ahk_exe EXCEL.EXE
;return

CloseExcel:
Process,Close,Excel.exe
GuiControl, Excel: Disable , Button1
GuiControl, Excel: , Button1, I've killed Excel.`nRestart it, then run this script again.`nClosing script in 5...
Sleep 1000
GuiControl, Excel: , Button1, I've killed Excel.`nRestart it, then run this script again.`nClosing script in 4...
Sleep 1000
GuiControl, Excel: , Button1, I've killed Excel.`nRestart it, then run this script again.`nClosing script in 3...
Sleep 1000
GuiControl, Excel: , Button1, I've killed Excel.`nRestart it, then run this script again.`nClosing script in 2...
Sleep 1000
GuiControl, Excel: , Button1, I've killed Excel.`nRestart it, then run this script again.`nClosing script in 1...
Sleep 1000
ExitApp
return

RecordExcelSearch:
IniRead, ExcelSearch, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ExcelSearch
ExcelSearch++
IniWrite, %ExcelSearch%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ExcelSearch
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

https://autohotkey.com/board/topic/127825-to-close-hidden-excelexe-process-showing-in-win-task-mgr/

http://the-automator.com/excel-autohotkey/

xl := ComObjActive("Excel.Application")
Sleep 300
TrueOrFalse := IsObject(xl)
MsgBox, % TrueOrFalse
Sleep 2000
Cell := xl.ActiveCell
MsgBox, % XL.Cells(Cell.Row,Cell.Column).Value
MsgBox, % XL.Cells(Cell.Row,Cell.Column-2).Value
MsgBox, % XL.Cells(Cell.Row-5,Cell.Column).Address
MsgBox, % XL.Cells(Cell.Row,Cell.Column).Address
MsgBox, % xl.Range("D1").Value 
xl.ActiveCell.Offset(0,-2).select
Clipboard := RegExReplace(Clipboard, "[\r]")
xl.CutCopyMode := False

*/
