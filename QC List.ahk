#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
formattime, Today, , MMMM d, yyyy

Gui, New, ,QC Pairings - %Today%
Gui, Font, s16

Gui, Add, Button, x15 y15 w265 h35, %Today%
Gui, Add, DropDownList, x15 y60 w125, A||B|C|D|E|F|G|H|I|J|K|L|M|N|O|P
Loop 11
{
Gui, Add, DropDownList, x15 yp+40 w125, A||B|C|D|E|F|G|H|I|J|K|L|M|N|O|P
}

Gui, Add, DropDownList, x155 y60 w125, A||B|C|D|E|F|G|H|I|J|K|L|M|N|O|P
Gui, Add, Checkbox, x290 y60 w30,
Gui, Add, Checkbox, x320 y60 w30,
Gui, Add, Checkbox, x350 y60 w30,
Gui, Add, Checkbox, x380 y60 w30,
Gui, Add, Checkbox, x410 y60 w30,
Gui, Add, Checkbox, x440 y60 w30,

Loop 11
{
Gui, Add, DropDownList, x155 yp+40 w125, A||B|C|D|E|F|G|H|I|J|K|L|M|N|O|P
Gui, Add, Checkbox, x290 yp w30,
Gui, Add, Checkbox, x320 yp w30,
Gui, Add, Checkbox, x350 yp w30,
Gui, Add, Checkbox, x380 yp w30,
Gui, Add, Checkbox, x410 yp w30,
Gui, Add, Checkbox, x440 yp w30,
}


Gui, Show, 
return
