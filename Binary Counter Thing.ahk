#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

Gui, New, +ToolWindow AlwaysOnTop

Gui, Add, Button,  x25 y0 w25 h25,0
Gui, Add, Button,  x50 y0 w25 h25,0
Gui, Add, Button,  x75 y0 w25 h25,0
Gui, Add, Button, x100 y0 w25 h25,0
Gui, Add, Button, x125 y0 w25 h25,0

Gui, Add, Button,  x25 y25 w25 h25,0
Gui, Add, Button,  x50 y25 w25 h25,0
Gui, Add, Button,  x75 y25 w25 h25,0
Gui, Add, Button, x100 y25 w25 h25,0
Gui, Add, Button, x125 y25 w25 h25,0

Gui, Add, Button,  x25 y50 w25 h25,0
Gui, Add, Button,  x50 y50 w25 h25,0
Gui, Add, Button,  x75 y50 w25 h25,0
Gui, Add, Button, x100 y50 w25 h25,0
Gui, Add, Button, x125 y50 w25 h25,0

Gui, Add, Button,  x25 y75 w25 h25,0
Gui, Add, Button,  x50 y75 w25 h25,0
Gui, Add, Button,  x75 y75 w25 h25,0
Gui, Add, Button, x100 y75 w25 h25,0
Gui, Add, Button, x125 y75 w25 h25,0

Gui, Add, Button,  x25 y100 w25 h25,0
Gui, Add, Button,  x50 y100 w25 h25,0
Gui, Add, Button,  x75 y100 w25 h25,0
Gui, Add, Button, x100 y100 w25 h25,0
Gui, Add, Button, x125 y100 w25 h25,0

Gui, Add, Text, x12 y130 w170, %TotalString%
Gui, Show, w175
gosub MoveLetters
return

MoveLetters:
Loop
{
	Random, Location, 1, 25
	GuiControlGet, Number%Location%, , Button%Location%
	GuiControlGet, Number1, , Button1	
	GuiControlGet, Number2, , Button2
	GuiControlGet, Number3, , Button3
	GuiControlGet, Number4, , Button4
	GuiControlGet, Number5, , Button5
	GuiControlGet, Number6, , Button6
	GuiControlGet, Number7, , Button7
	GuiControlGet, Number8, , Button8
	GuiControlGet, Number9, , Button9
	GuiControlGet, Number10, , Button10
	GuiControlGet, Number11, , Button11
	GuiControlGet, Number12, , Button12
	GuiControlGet, Number13, , Button13
	GuiControlGet, Number14, , Button14
	GuiControlGet, Number15, , Button15
	GuiControlGet, Number16, , Button16
	GuiControlGet, Number17, , Button17
	GuiControlGet, Number18, , Button18
	GuiControlGet, Number19, , Button19
	GuiControlGet, Number20, , Button20
	GuiControlGet, Number21, , Button21
	GuiControlGet, Number22, , Button22
	GuiControlGet, Number23, , Button23
	GuiControlGet, Number24, , Button24
	GuiControlGet, Number25, , Button25
	TotalString := Number1 Number2 Number3 Number4 Number5 Number6 Number7 Number8 Number9 Number10 Number11 Number12 Number13 Number14 Number15 Number16 Number17 Number18 Number19 Number20 Number21 Number22 Number23 Number24 Number25
	Random, Roll, 0, 1
	Sleep 100
	GuiControl, ,Button%Location%, %Roll%
	;GuiControl, ,Button%A_Index%, %Roll%
	GuiControl, ,Static1, %TotalString%
}
return
	
Escape::
ExitApp	
	