#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)


; You can set any title here for the menu:
MenuTitle = -=-=-=-=-=-=-=-

; This is how long the mouse button must be held to cause the menu to appear:
UMDelay = 20

SetFormat, float, 0.0
SetBatchLines, 10ms 
SetTitleMatchMode, 2
#SingleInstance


;___________________________________________
;_____Menu Definitions______________________

; Create / Edit Menu Items here.
; You can't use spaces in keys/values/section names.

; Don't worry about the order, the menu will be sorted.

MenuItems = Notepad/Calculator/Section 3/Section 4/Section 5


;___________________________________________
;______Dynamic menuitems here_______________

; Syntax:
;     Dyn# = MenuItem|Window title

Dyn1 = MS Word|- Microsoft Word
Dyn2 = Notepad II|- Notepad

;___________________________________________

Exit


;___________________________________________
;_____Menu Sections_________________________

; Create / Edit Menu Sections here.

Notepad:
Run, Notepad.exe
Return

Calculator:
Run, Calc
Return

Section3:
MsgBox, You selected 3
Return

Section4:
MsgBox, You selected 4
Return

Section5:
MsgBox, You selected 5
Return

MSWord:
msgbox, this is a dynamic entry (word)
Return

NotepadII:
msgbox, this is a dynamic entry (notepad)
Return


;___________________________________________
;_____Hotkey Section________________________

~MButton::
HowLong = 0
Loop
{
    HowLong ++
    Sleep, 10
    GetKeyState, MButton, MButton, P
    IfEqual, MButton, U, Break
}
IfLess, HowLong, %UMDelay%, Return


;prepares dynamic menu
DynMenu =
Loop
{
    IfEqual, Dyn%a_index%,, Break

    StringGetPos, ppos, dyn%a_index%, |
    StringLeft, item, dyn%a_index%, %ppos%
    ppos += 2
    StringMid, win, dyn%a_index%, %ppos%, 1000

    IfWinActive, %win%,
        DynMenu = %DynMenu%/%item%
}


;Joins sorted main menu and dynamic menu
Sort, MenuItems, D/
TempMenu = %MenuItems%%DynMenu%


;clears earlier entries
Loop
{
    IfEqual, MenuItem%a_index%,, Break
    MenuItem%a_index% =
}

;creates new entries
Loop, Parse, TempMenu, /
{
    MenuItem%a_index% = %a_loopfield%
}

;creates the menu
Menu = %MenuTitle%
Loop
{
    IfEqual, MenuItem%a_index%,, Break
    numItems ++
    StringTrimLeft, MenuText, MenuItem%a_index%, 0
    Menu = %Menu%`n%MenuText%
}

MouseGetPos, mX, mY
HotKey, ~LButton, MenuClick
HotKey, ~LButton, On
ToolTip, %Menu%, %mX%, %mY%
WinActivate, %MenuTitle%
Return


MenuClick:
HotKey, ~LButton, Off
IfWinNotActive, %MenuTitle%
{
    ToolTip
    Return
}

MouseGetPos, mX, mY
ToolTip
mY -= 3        ;space after which first line starts
mY /= 13    ;space taken by each line
IfLess, mY, 1, Return
IfGreater, mY, %numItems%, Return
StringTrimLeft, TargetSection, MenuItem%mY%, 0
StringReplace, TargetSection, TargetSection, %a_space%,, A
Gosub, %TargetSection%
Return






/*
Timer = 0
Gui, Add, Edit,   w200 vMyEdit ReadOnly Center , Timer: %Timer%
Gui, Add, Button, w200 gTestButton vTestButton Default, 0
Gui, Show,   ; w500 h500
SetTimer, IncreaseTime, 1000
return

IncreaseTime:
Timer++
GuiControl,, MyEdit, Timer: %Timer%
return

TestButton:
TestButton += 5
GuiControl,, TestButton, %TestButton%
return

*/
Escape::ExitApp
