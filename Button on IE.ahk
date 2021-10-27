#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



#IfWinExists ahk_class IEFrame
#Persistent
;^8::

IfWinActive, ahk_class IEFrame
    return
else 
    SetTimer, IEActive, 10000


IEActive:
WinGetPos , X, Y, Width, Height, ahk_class IEFrame
Msgbox, The IE Window is at X%x% Y%y%. 

NewX :=  x + 100

Gui, New, +AlwaysOnTop +Owner, Test
Gui, Add, Button, x0 y5 w100 h25 gTest, Test
Gui, Add, Button, x120 y5 w100 h25 gCancel, Cancel
Gui, Show, ,Test
Gui, +ToolWindow -Caption                           ; Removes the Border and Task bar icon
Gui, Color, 000111                                  ; can be any colour but it's good to use a color that is NOT present in ur GUI
Gui, Show, X%NewX% Y%y% h300 w400, Test
WinSet, Transcolor, 000111, Test
return

Test:
{
Gui, Destroy
Return
}

Cancel:
{
Gui, Destroy
Return
}

