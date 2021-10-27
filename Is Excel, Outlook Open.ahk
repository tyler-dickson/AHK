#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force


Gui, New, , Check Open Apps
Gui, Add, Button, gCheckOutlook w100, Check Outlook
Gui, Add, Button, gCheckExcel w100, Check Excel
Gui, Show
return

CheckOutlook:
ol := ComObjActive("Outlook.Application")
Temp := IsObject(ol)
if (Temp == 1)
	MsgBox, Outlook is open.
else
	MsgBox, Can't find Outlook.
return

CheckExcel:
xl := ComObjActive("Excel.Application")
Temp := IsObject(xl)
if (Temp == 1)
	MsgBox, Excel is open.
else
	MsgBox, Can't find Excel.
return

GuiClose:
ExitApp