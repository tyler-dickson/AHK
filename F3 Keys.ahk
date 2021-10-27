#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
Enabled := ComObjError(false)
SysGet, ScreenWidth, 78
SysGet, ScreenHeight, 79
global HalfScreenHeight := ScreenHeight * .50       ;964.8
;DetectHiddenWindows, On  
SetTitleMatchMode, 2

global Slot1 :=  "x55   y5"
global Slot2 :=  "x105  y5"
global Slot3 :=  "x155  y5"
global Slot4 :=  "x205  y5"
global Slot5 :=  "x255  y5"
global Slot6 :=  "x305  y5"
global Slot7 :=  "x355  y5"
global Slot8 :=  "x405  y5"
global Slot9 :=  "x455  y5"
global Slot10 := "x505  y5"
global Slot11 := "x555  y5"
global Slot12 := "x605  y5"
global Slot13 := "x655  y5"
global Slot14 := "x705  y5"
global Slot15 := "x755  y5"
global SlotHide1 :=  "x55   y-150"
global SlotHide2 :=  "x105  y-150"
global SlotHide3 :=  "x155  y-150"
global SlotHide4 :=  "x205  y-150"
global SlotHide5 :=  "x255  y-150"
global SlotHide6 :=  "x305  y-150"
global SlotHide7 :=  "x355  y-150"
global SlotHide8 :=  "x405  y-150"
global SlotHide9 :=  "x455  y-150"
global SlotHide10 := "x505  y-150"
global SlotHide11 := "x555  y-150"
global SlotHide12 := "x605  y-150"
global SlotHide13 := "x655  y-150"
global SlotHide14 := "x705  y-150"
global SlotHide15 := "x755  y-150"
;^F1::SendRaw You pressed Control + F1.
;F3::SendInput You pressed F3.
;F3::SendInput You pressed F3.
;F4::SendInput You pressed F4.
;F6::SendInput You pressed F6.
;F7::SendInput You pressed F7.
;F8::SendInput You pressed F8.
;F9::SendInput You pressed F9                                                      
;F10::SendInput You pressed F10.
;F11::SendInput You pressed F11.
;F12::SendInput You pressed F12.

MsgBox, , Remapped Function Keys, Please remember that this will only work in the FIRST tab you opened in each Internet Explorer window.`n`nIf you're on the second tab, it will still interact with the first tab.`n`nIf you need to have another tab open, consider opening that one AFTER this one, and keep docketing in your FIRST tab.`n`nFor best results, keep docketing in the FIRST tab you opened.
return


/*
$*Escape::                         
KeyWait, Escape
KeyWait, Escape, D T0.15           
if ErrorLevel = 1
	{
	SendInput {Escape}
	return
	}
else if ErrorLevel = 0
	{
    toggle    := !toggle
	Gui, +AlwaysOnTop +ToolWindow
	Gui, Add, Button, x5   y105 w50 h50 Center, PAT STATUS	
	Gui, Add, Button, x5   y55  w50 h50 Center, TM STATUS
	Gui, Add, Button, x5   y155 w50 h50, F1`n`nSTATUS

	Gui, Add, Button, x55  y5   w50 h50 Center, TM`nOA	
	Gui, Add, Button, x55  y55  w50 h50 Center, PAT`nDIV OA	
	Gui, Add, Button, x55  y105 w50 h50 Center, PAT`nOA	
	Gui, Add, Button, x55  y155 w50 h50, F3`n`nOA	
	
	Gui, Add, Button, x105 y5   w50 h50 Center, TM`nOA	
	Gui, Add, Button, x105 y55  w50 h50 Center, PAT`nDIV OA	
	Gui, Add, Button, x105 y105 w50 h50 Center, PAT`nOA
	Gui, Add, Button, x105 y155 w50 h50 , F3`n`nPUB
	

	Gui, Add, Button, x155 y155 w50 h50, F4
	
	Gui, Add, Button, x215 y155 w50 h50, F5`n`nPOA
	Gui, Add, Button, x265 y155 w50 h50, F6`n`nASSIGN
	Gui, Add, Button, x315 y155 w50 h50, F7`n`nPRIOR
	Gui, Add, Button, x365 y155 w50 h50, F8`n`nFORMAL
	
	Gui, Add, Button, x425 y155 w50 h50, F9
	Gui, Add, Button, x475 y155 w50 h50, F10
	Gui, Add, Button, x525 y155 w50 h50, F11
	Gui, Add, Button, x575 y155 w50 h50, F12
	
	Gui, Color, 000111,  F3 Keys.ahk

    if (toggle = 1)
	{
    Gui, Show, w630 xCenter y%HalfScreenHeight%
	WinSet, Transcolor, 000111, F3 Keys.ahk
    }
	else
	{
	Gui, Hide
    }
	}
return

ShowFKeys:
    toggle    := !toggle
	Gui, New
	Gui, Add, Button, , Test.
    if (toggle = 1)
	{
    Gui, Show
    }
	else
	{
    Gui, Destroy
    }
return
*/

$`::
KeyWait, ``
KeyWait, ``, D T0.15
if ErrorLevel = 1
	{
	SendInput ``
	return
	}
else if ErrorLevel = 0
	{
    toggle    := !toggle
    if (toggle = 1)
	{
	gosub CreateGUI
    }
	else
	{
	WinGetPos, FKeysPosX, FKeysPosY, , , F3 Keys.ahk,
	IniWrite, %FKeysPosX%, F3 Keys.ahk, Position, FKeysPosX
	IniWrite, %FKeysPosY%, F3 Keys.ahk, Position, FKeysPosY	
	Gui, Destroy
    }
	}
return


CreateGUI:
global FKeysPosX
global FKeysPosY
IniRead, 1x1, F3 Keys.ahk, Saved, 1x1
IniRead, 1x1Hidden, F3 Keys.ahk, Saved, 1x1Hidden
IniRead, 1x1Text, F3 Keys.ahk, Saved, 1x1Text
IniRead, 1x2, F3 Keys.ahk, Saved, 1x2
IniRead, 1x2Hidden, F3 Keys.ahk, Saved, 1x2Hidden
IniRead, 1x2Text, F3 Keys.ahk, Saved, 1x2Text
IniRead, 1x3, F3 Keys.ahk, Saved, 1x3
IniRead, 1x3Hidden, F3 Keys.ahk, Saved, 1x3Hidden
IniRead, 1x3Text, F3 Keys.ahk, Saved, 1x3Text
IniRead, 1x4, F3 Keys.ahk, Saved, 1x4
IniRead, 1x4Hidden, F3 Keys.ahk, Saved, 1x4Hidden
IniRead, 1x4Text, F3 Keys.ahk, Saved, 1x4Text
IniRead, 2x1, F3 Keys.ahk, Saved, 2x1
IniRead, 2x1Hidden, F3 Keys.ahk, Saved, 2x1Hidden
IniRead, 2x1Text, F3 Keys.ahk, Saved, 2x1Text
IniRead, 2x2, F3 Keys.ahk, Saved, 2x2
IniRead, 2x2Hidden, F3 Keys.ahk, Saved, 2x2Hidden
IniRead, 2x2Text, F3 Keys.ahk, Saved, 2x2Text
IniRead, 2x3, F3 Keys.ahk, Saved, 2x3
IniRead, 2x3Hidden, F3 Keys.ahk, Saved, 2x3Hidden
IniRead, 2x3Text, F3 Keys.ahk, Saved, 2x3Text
IniRead, 2x4, F3 Keys.ahk, Saved, 2x4
IniRead, 2x4Hidden, F3 Keys.ahk, Saved, 2x4Hidden
IniRead, 2x4Text, F3 Keys.ahk, Saved, 2x4Text
IniRead, 3x1, F3 Keys.ahk, Saved, 3x1
IniRead, 3x1Hidden, F3 Keys.ahk, Saved, 3x1Hidden
IniRead, 3x1Text, F3 Keys.ahk, Saved, 3x1Text
IniRead, 3x2, F3 Keys.ahk, Saved, 3x2
IniRead, 3x2Hidden, F3 Keys.ahk, Saved, 3x2Hidden
IniRead, 3x2Text, F3 Keys.ahk, Saved, 3x2Text
IniRead, 3x3, F3 Keys.ahk, Saved, 3x3
IniRead, 3x3Hidden, F3 Keys.ahk, Saved, 3x3Hidden
IniRead, 3x3Text, F3 Keys.ahk, Saved, 3x3Text
IniRead, 3x4, F3 Keys.ahk, Saved, 3x4
IniRead, 3x4Hidden, F3 Keys.ahk, Saved, 3x4Hidden
IniRead, 3x4Text, F3 Keys.ahk, Saved, 3x4Text
IniRead, 4x1, F3 Keys.ahk, Saved, 4x1
IniRead, 4x1Hidden, F3 Keys.ahk, Saved, 4x1Hidden
IniRead, 4x1Text, F3 Keys.ahk, Saved, 4x1Text
IniRead, 4x2, F3 Keys.ahk, Saved, 4x2
IniRead, 4x2Hidden, F3 Keys.ahk, Saved, 4x2Hidden
IniRead, 4x2Text, F3 Keys.ahk, Saved, 4x2Text
IniRead, 4x3, F3 Keys.ahk, Saved, 4x3
IniRead, 4x3Hidden, F3 Keys.ahk, Saved, 4x3Hidden
IniRead, 4x3Text, F3 Keys.ahk, Saved, 4x3Text
IniRead, 4x4, F3 Keys.ahk, Saved, 4x4
IniRead, 4x4Hidden, F3 Keys.ahk, Saved, 4x4Hidden
IniRead, 4x4Text, F3 Keys.ahk, Saved, 4x4Text
IniRead, 5x1, F3 Keys.ahk, Saved, 5x1
IniRead, 5x1Hidden, F3 Keys.ahk, Saved, 5x1Hidden
IniRead, 5x1Text, F3 Keys.ahk, Saved, 5x1Text
IniRead, 5x2, F3 Keys.ahk, Saved, 5x2
IniRead, 5x2Hidden, F3 Keys.ahk, Saved, 5x2Hidden
IniRead, 5x2Text, F3 Keys.ahk, Saved, 5x2Text
IniRead, 5x3, F3 Keys.ahk, Saved, 5x3
IniRead, 5x3Hidden, F3 Keys.ahk, Saved, 5x3Hidden
IniRead, 5x3Text, F3 Keys.ahk, Saved, 5x3Text
IniRead, 5x4, F3 Keys.ahk, Saved, 5x4
IniRead, 5x4Hidden, F3 Keys.ahk, Saved, 5x4Hidden
IniRead, 5x4Text, F3 Keys.ahk, Saved, 5x4Text
IniRead, 6x1, F3 Keys.ahk, Saved, 6x1
IniRead, 6x1Hidden, F3 Keys.ahk, Saved, 6x1Hidden
IniRead, 6x1Text, F3 Keys.ahk, Saved, 6x1Text
IniRead, 6x2, F3 Keys.ahk, Saved, 6x2
IniRead, 6x2Hidden, F3 Keys.ahk, Saved, 6x2Hidden
IniRead, 6x2Text, F3 Keys.ahk, Saved, 6x2Text
IniRead, 6x3, F3 Keys.ahk, Saved, 6x3
IniRead, 6x3Hidden, F3 Keys.ahk, Saved, 6x3Hidden
IniRead, 6x3Text, F3 Keys.ahk, Saved, 6x3Text
IniRead, 6x4, F3 Keys.ahk, Saved, 6x4
IniRead, 6x4Hidden, F3 Keys.ahk, Saved, 6x4Hidden
IniRead, 6x4Text, F3 Keys.ahk, Saved, 6x4Text
IniRead, 7x1, F3 Keys.ahk, Saved, 7x1
IniRead, 7x1Hidden, F3 Keys.ahk, Saved, 7x1Hidden
IniRead, 7x1Text, F3 Keys.ahk, Saved, 7x1Text
IniRead, 7x2, F3 Keys.ahk, Saved, 7x2
IniRead, 7x2Hidden, F3 Keys.ahk, Saved, 7x2Hidden
IniRead, 7x2Text, F3 Keys.ahk, Saved, 7x2Text
IniRead, 7x3, F3 Keys.ahk, Saved, 7x3
IniRead, 7x3Hidden, F3 Keys.ahk, Saved, 7x3Hidden
IniRead, 7x3Text, F3 Keys.ahk, Saved, 7x3Text
IniRead, 7x4, F3 Keys.ahk, Saved, 7x4
IniRead, 7x4Hidden, F3 Keys.ahk, Saved, 7x4Hidden
IniRead, 7x4Text, F3 Keys.ahk, Saved, 7x4Text
IniRead, 8x1, F3 Keys.ahk, Saved, 8x1
IniRead, 8x1Hidden, F3 Keys.ahk, Saved, 8x1Hidden
IniRead, 8x1Text, F3 Keys.ahk, Saved, 8x1Text
IniRead, 8x2, F3 Keys.ahk, Saved, 8x2
IniRead, 8x2Hidden, F3 Keys.ahk, Saved, 8x2Hidden
IniRead, 8x2Text, F3 Keys.ahk, Saved, 8x2Text
IniRead, 8x3, F3 Keys.ahk, Saved, 8x3
IniRead, 8x3Hidden, F3 Keys.ahk, Saved, 8x3Hidden
IniRead, 8x3Text, F3 Keys.ahk, Saved, 8x3Text
IniRead, 8x4, F3 Keys.ahk, Saved, 8x4
IniRead, 8x4Hidden, F3 Keys.ahk, Saved, 8x4Hidden
IniRead, 8x4Text, F3 Keys.ahk, Saved, 8x4Text
IniRead, 9x1, F3 Keys.ahk, Saved, 9x1
IniRead, 9x1Hidden, F3 Keys.ahk, Saved, 9x1Hidden
IniRead, 9x1Text, F3 Keys.ahk, Saved, 9x1Text
IniRead, 9x2, F3 Keys.ahk, Saved, 9x2
IniRead, 9x2Hidden, F3 Keys.ahk, Saved, 9x2Hidden
IniRead, 9x2Text, F3 Keys.ahk, Saved, 9x2Text
IniRead, 9x3, F3 Keys.ahk, Saved, 9x3
IniRead, 9x3Hidden, F3 Keys.ahk, Saved, 9x3Hidden
IniRead, 9x3Text, F3 Keys.ahk, Saved, 9x3Text
IniRead, 9x4, F3 Keys.ahk, Saved, 9x4
IniRead, 9x4Hidden, F3 Keys.ahk, Saved, 9x4Hidden
IniRead, 9x4Text, F3 Keys.ahk, Saved, 9x4Text
IniRead, 10x1, F3 Keys.ahk, Saved, 10x1
IniRead, 10x1Hidden, F3 Keys.ahk, Saved, 10x1Hidden
IniRead, 10x1Text, F3 Keys.ahk, Saved, 10x1Text
IniRead, 10x2, F3 Keys.ahk, Saved, 10x2
IniRead, 10x2Hidden, F3 Keys.ahk, Saved, 10x2Hidden
IniRead, 10x2Text, F3 Keys.ahk, Saved, 10x2Text
IniRead, 10x3, F3 Keys.ahk, Saved, 10x3
IniRead, 10x3Hidden, F3 Keys.ahk, Saved, 10x3Hidden
IniRead, 10x3Text, F3 Keys.ahk, Saved, 10x3Text
IniRead, 10x4, F3 Keys.ahk, Saved, 10x4
IniRead, 10x4Hidden, F3 Keys.ahk, Saved, 10x4Hidden
IniRead, 10x4Text, F3 Keys.ahk, Saved, 10x4Text
IniRead, 11x1, F3 Keys.ahk, Saved, 11x1
IniRead, 11x1Hidden, F3 Keys.ahk, Saved, 11x1Hidden
IniRead, 11x1Text, F3 Keys.ahk, Saved, 11x1Text
IniRead, 11x2, F3 Keys.ahk, Saved, 11x2
IniRead, 11x2Hidden, F3 Keys.ahk, Saved, 11x2Hidden
IniRead, 11x2Text, F3 Keys.ahk, Saved, 11x2Text
IniRead, 11x3, F3 Keys.ahk, Saved, 11x3
IniRead, 11x3Hidden, F3 Keys.ahk, Saved, 11x3Hidden
IniRead, 11x3Text, F3 Keys.ahk, Saved, 11x3Text
IniRead, 11x4, F3 Keys.ahk, Saved, 11x4
IniRead, 11x4Hidden, F3 Keys.ahk, Saved, 11x4Hidden
IniRead, 11x4Text, F3 Keys.ahk, Saved, 11x4Text
IniRead, 12x1, F3 Keys.ahk, Saved, 12x1
IniRead, 12x1Hidden, F3 Keys.ahk, Saved, 12x1Hidden
IniRead, 12x1Text, F3 Keys.ahk, Saved, 12x1Text
IniRead, 12x2, F3 Keys.ahk, Saved, 12x2
IniRead, 12x2Hidden, F3 Keys.ahk, Saved, 12x2Hidden
IniRead, 12x2Text, F3 Keys.ahk, Saved, 12x2Text
IniRead, 12x3, F3 Keys.ahk, Saved, 12x3
IniRead, 12x3Hidden, F3 Keys.ahk, Saved, 12x3Hidden
IniRead, 12x3Text, F3 Keys.ahk, Saved, 12x3Text
IniRead, 12x4, F3 Keys.ahk, Saved, 12x4
IniRead, 12x4Hidden, F3 Keys.ahk, Saved, 12x4Hidden
IniRead, 12x4Text, F3 Keys.ahk, Saved, 12x4Text
IniRead, 13x1, F3 Keys.ahk, Saved, 13x1
IniRead, 13x1Hidden, F3 Keys.ahk, Saved, 13x1Hidden
IniRead, 13x1Text, F3 Keys.ahk, Saved, 13x1Text
IniRead, 13x2, F3 Keys.ahk, Saved, 13x2
IniRead, 13x2Hidden, F3 Keys.ahk, Saved, 13x2Hidden
IniRead, 13x2Text, F3 Keys.ahk, Saved, 13x2Text
IniRead, 13x3, F3 Keys.ahk, Saved, 13x3
IniRead, 13x3Hidden, F3 Keys.ahk, Saved, 13x3Hidden
IniRead, 13x3Text, F3 Keys.ahk, Saved, 13x3Text
IniRead, 13x4, F3 Keys.ahk, Saved, 13x4
IniRead, 13x4Hidden, F3 Keys.ahk, Saved, 13x4Hidden
IniRead, 13x4Text, F3 Keys.ahk, Saved, 13x4Text
IniRead, 14x1, F3 Keys.ahk, Saved, 14x1
IniRead, 14x1Hidden, F3 Keys.ahk, Saved, 14x1Hidden
IniRead, 14x1Text, F3 Keys.ahk, Saved, 14x1Text
IniRead, 14x2, F3 Keys.ahk, Saved, 14x2
IniRead, 14x2Hidden, F3 Keys.ahk, Saved, 14x2Hidden
IniRead, 14x2Text, F3 Keys.ahk, Saved, 14x2Text
IniRead, 14x3, F3 Keys.ahk, Saved, 14x3
IniRead, 14x3Hidden, F3 Keys.ahk, Saved, 14x3Hidden
IniRead, 14x3Text, F3 Keys.ahk, Saved, 14x3Text
IniRead, 14x4, F3 Keys.ahk, Saved, 14x4
IniRead, 14x4Hidden, F3 Keys.ahk, Saved, 14x4Hidden
IniRead, 14x4Text, F3 Keys.ahk, Saved, 14x4Text
IniRead, 15x1, F3 Keys.ahk, Saved, 15x1
IniRead, 15x1Hidden, F3 Keys.ahk, Saved, 15x1Hidden
IniRead, 15x1Text, F3 Keys.ahk, Saved, 15x1Text
IniRead, 15x2, F3 Keys.ahk, Saved, 15x2
IniRead, 15x2Hidden, F3 Keys.ahk, Saved, 15x2Hidden
IniRead, 15x2Text, F3 Keys.ahk, Saved, 15x2Text
IniRead, 15x3, F3 Keys.ahk, Saved, 15x3
IniRead, 15x3Hidden, F3 Keys.ahk, Saved, 15x3Hidden
IniRead, 15x3Text, F3 Keys.ahk, Saved, 15x3Text
IniRead, 15x4, F3 Keys.ahk, Saved, 15x4
IniRead, 15x4Hidden, F3 Keys.ahk, Saved, 15x4Hidden
IniRead, 15x4Text, F3 Keys.ahk, Saved, 15x4Text
IniRead, 16x1, F3 Keys.ahk, Saved, 16x1
IniRead, 16x1Hidden, F3 Keys.ahk, Saved, 16x1Hidden
IniRead, 16x1Text, F3 Keys.ahk, Saved, 16x1Text
IniRead, 16x2, F3 Keys.ahk, Saved, 16x2
IniRead, 16x2Hidden, F3 Keys.ahk, Saved, 16x2Hidden
IniRead, 16x2Text, F3 Keys.ahk, Saved, 16x2Text
IniRead, 16x3, F3 Keys.ahk, Saved, 16x3
IniRead, 16x3Hidden, F3 Keys.ahk, Saved, 16x3Hidden
IniRead, 16x3Text, F3 Keys.ahk, Saved, 16x3Text
IniRead, 16x4, F3 Keys.ahk, Saved, 16x4
IniRead, 16x4Hidden, F3 Keys.ahk, Saved, 16x4Hidden
IniRead, 16x4Text, F3 Keys.ahk, Saved, 16x4Text

IniRead, FKeysPosX, F3 Keys.ahk, Position, FKeysPosX
IniRead, FKeysPosY, F3 Keys.ahk, Position, FKeysPosY

if FKeysPosX = ERROR
	FKeysPosX = 0
if FKeysPosY = ERROR
	FKeysPosY = 0
Gui, Font, s8, Tahoma
Gui, +AlwaysOnTop +ToolWindow   -Caption
	;  Buttons 1 - 4
Gui, Add, Button,     x-55  y5  w50 h50 Center v1x1 g1x1,   %1x1Text%       ; Column x Row
Gui, Add, Button,     x5   y55  w50 h50 Center v1x2 g1x2,   %1x2Text%
Gui, Add, Button,     x5   y105 w50 h50 Center v1x3 g1x3,   %1x3Text%
Gui, Add, Button,     x5   y155 w50 h50 Center v1x4 g1x4,   %1x4Text%
	;  Buttons 5 - 8
Gui, Add, Button,     x55  y5   w50 h50 Center v2x1 g2x1,   %2x1Text%		; Column x Row
Gui, Add, Button,     x55  y55  w50 h50 Center v2x2 g2x2,   %2x2Text%
Gui, Add, Button,     x55  y105 w50 h50 Center v2x3 g2x3,   %2x3Text%
Gui, Add, Button,     x55  y155 w50 h50 Center v2x4 g2x4,   %2x4Text%
	 ;  Buttons 9 - 12	
Gui, Add, Button,     x105 y5   w50 h50 Center v3x1 g3x1,   %3x1Text%		; Column x Row
Gui, Add, Button,     x105 y55  w50 h50 Center v3x2 g3x2,   %3x2Text%	
Gui, Add, Button,     x105 y105 w50 h50 Center v3x3 g3x3,   %3x3Text%
Gui, Add, Button,     x105 y155 w50 h50 Center v3x4 g3x4,   %3x4Text%
	;  Buttons 13 - 16	
Gui, Add, Button,     x155 y5   w50 h50 Center v4x1 g4x1,   %4x1Text%		; Column x Row
Gui, Add, Button,     x155 y55  w50 h50 Center v4x2 g4x2,   %4x2Text%	
Gui, Add, Button,     x155 y105 w50 h50 Center v4x3 g4x3,   %4x3Text%
Gui, Add, Button,     x155 y155 w50 h50 Center v4x4 g4x4,   %4x4Text%
IniRead, toggleM, F3 Keys.ahk, Aspect, Horizontal
if toggleM = 1
	{
 ; Buttons 17 - 20
	Gui, Add, Button, x205 y5   w50 h50 Center v5x1  g5x1,  %5x1Text%
	Gui, Add, Button, x205 y55  w50 h50 Center v5x2  g5x2,  %5x2Text%	
	Gui, Add, Button, x205 y105 w50 h50 Center v5x3  g5x3,  %5x3Text%	
	Gui, Add, Button, x205 y155 w50 h50 Center v5x4  g5x4,  %5x4Text%
	;  Buttons 21 - 24		
	Gui, Add, Button, x255 y5   w50 h50 Center v6x1  g6x1,  %6x1Text%
	Gui, Add, Button, x255 y55  w50 h50 Center v6x2  g6x2,  %6x2Text%	
	Gui, Add, Button, x255 y105 w50 h50 Center v6x3  g6x3,  %6x3Text%		
	Gui, Add, Button, x255 y155 w50 h50 Center v6x4  g6x4,  %6x4Text%
	;  Buttons 25 - 28		
	Gui, Add, Button, x305 y5   w50 h50 Center v7x1  g7x1,  %7x1Text%
	Gui, Add, Button, x305 y55  w50 h50 Center v7x2  g7x2,  %7x2Text%	
	Gui, Add, Button, x305 y105 w50 h50 Center v7x3  g7x3,  %7x3Text%			
	Gui, Add, Button, x305 y155 w50 h50 Center v7x4  g7x4,  %7x4Text%
	;  Buttons 29 - 32		
	Gui, Add, Button, x355 y5   w50 h50 Center v8x1  g8x1,  %8x1Text%
	Gui, Add, Button, x355 y55  w50 h50 Center v8x2  g8x2,  %8x2Text%	
	Gui, Add, Button, x355 y105 w50 h50 Center v8x3  g8x3,  %8x3Text%	
	Gui, Add, Button, x355 y155 w50 h50 Center v8x4  g8x4,  %8x4Text%
	;  Buttons 33 - 36		
	Gui, Add, Button, x405 y5   w50 h50 Center v9x1  g9x1,  %9x1Text%
	Gui, Add, Button, x405 y55  w50 h50 Center v9x2  g9x2,  %9x2Text%	
	Gui, Add, Button, x405 y105 w50 h50 Center v9x3  g9x3,  %9x3Text%		
	Gui, Add, Button, x405 y155 w50 h50 Center v9x4  g9x4,  %9x4Text%
	;  Buttons 37 - 40		
	Gui, Add, Button, x455 y5   w50 h50 Center v10x1 g10x1, %10x1Text%
	Gui, Add, Button, x455 y55  w50 h50 Center v10x2 g10x2, %10x2Text%	
	Gui, Add, Button, x455 y105 w50 h50 Center v10x3 g10x3, %10x3Text%	
	Gui, Add, Button, x455 y155 w50 h50 Center v10x4 g10x4, %10x4Text%
	;  Buttons 41 - 44		
	Gui, Add, Button, x505 y5   w50 h50 Center v11x1 g11x1, %11x1Text%
	Gui, Add, Button, x505 y55  w50 h50 Center v11x2 g11x2, %11x2Text%	
	Gui, Add, Button, x505 y105 w50 h50 Center v11x3 g11x3, %11x3Text%		
	Gui, Add, Button, x505 y155 w50 h50 Center v11x4 g11x4, %11x4Text%
	;  Buttons 45 - 48		
	Gui, Add, Button, x555 y5   w50 h50 Center v12x1 g12x1, %12x1Text%
	Gui, Add, Button, x555 y55  w50 h50 Center v12x2 g12x2, %12x2Text%	
	Gui, Add, Button, x555 y105 w50 h50 Center v12x3 g12x3, %12x3Text%		
	Gui, Add, Button, x555 y155 w50 h50 Center v12x4 g12x4, %12x4Text%
    ;  Buttons 49 - 52
	Gui, Add, Button, x605 y5   w50 h50 Center v13x1  g13x1,  %13x1Text%
	Gui, Add, Button, x605 y55  w50 h50 Center v13x2  g13x2,  %13x2Text%	
	Gui, Add, Button, x605 y105 w50 h50 Center v13x3  g13x3,  %13x3Text%		
	Gui, Add, Button, x605 y155 w50 h50 Center v13x4  g13x4,  %13x4Text%
	;  Buttons 53 - 56		
	Gui, Add, Button, x655 y5   w50 h50 Center v14x1 g14x1, %14x1Text%
	Gui, Add, Button, x655 y55  w50 h50 Center v14x2 g14x2, %14x2Text%	
	Gui, Add, Button, x655 y105 w50 h50 Center v14x3 g14x3, %14x3Text%	
	Gui, Add, Button, x655 y155 w50 h50 Center v14x4 g14x4, %14x4Text%
	;  Buttons 57 - 60		
	Gui, Add, Button, x705 y5   w50 h50 Center v15x1 g15x1, %15x1Text%
	Gui, Add, Button, x705 y55  w50 h50 Center v15x2 g15x2, %15x2Text%	
	Gui, Add, Button, x705 y105 w50 h50 Center v15x3 g15x3, %15x3Text%		
	Gui, Add, Button, x705 y155 w50 h50 Center v15x4 g15x4, %15x4Text%
	;  Buttons 61 - 64		
	Gui, Add, Button, x755 y5   w50 h50 Center v16x1 g16x1, %16x1Text%
	Gui, Add, Button, x755 y55  w50 h50 Center v16x2 g16x2, %16x2Text%	
	Gui, Add, Button, x755 y105 w50 h50 Center v16x3 g16x3, %16x3Text%		
	Gui, Add, Button, x755 y155 w50 h50 Center v16x4 g16x4, %16x4Text%	
	Gui, Add, Button, x5 y25 w50 h15 Center   gUnhide, Unhide
	;Gui, Add, Button, x5 y40 w50 h15 Center gRotate, Rotate
	Gui, Add, Picture, x5 y40 w50 h15 Center gPicture, DRAG
	Gui, Add, Button, x5  y5  w13 h20 gSet1, 1
	Gui, Add, Button, x18 y5  w13 h20 gSet2, 2
	Gui, Add, Button, x30 y5  w13 h20 gSet3, 3
	Gui, Add, Button, x42 y5  w13 h20 gSet4, 4
	Gui, Color, ABCDEF,  F3 Keys.ahk	
	;Gui, Show, w220 h650 x%FKeysPosX% y%FKeysPosY%	, F3 Keys.ahk
	gosub CheckHidden
	Gui, Show, w830 h55 x%FKeysPosX% y%FKeysPosY%	, F3 Keys.ahk
	}
if toggleM = 0
	{
	;  Buttons 17 - 20
	Gui, Add, Button, x5 y205   w50 h50 Center v5x1  g5x1,  %5x1Text%
	Gui, Add, Button, x5 y255  w50 h50 Center v5x2  g5x2,  %5x2Text%	
	Gui, Add, Button, x5 y305 w50 h50 Center v5x3  g5x3,  %5x3Text%	
	Gui, Add, Button, x5 y355 w50 h50 Center v5x4  g5x4,  %5x4Text%
	;  Buttons 21 - 24		
	Gui, Add, Button, x55 y205   w50 h50 Center v6x1  g6x1,  %6x1Text%
	Gui, Add, Button, x55 y255  w50 h50 Center v6x2  g6x2,  %6x2Text%	
	Gui, Add, Button, x55 y305 w50 h50 Center v6x3  g6x3,  %6x3Text%		
	Gui, Add, Button, x55 y355 w50 h50 Center v6x4  g6x4,  %6x4Text%
	;  Buttons 25 - 28		
	Gui, Add, Button, x105 y205   w50 h50 Center v7x1  g7x1,  %7x1Text%
	Gui, Add, Button, x105 y255  w50 h50 Center v7x2  g7x2,  %7x2Text%	
	Gui, Add, Button, x105 y305 w50 h50 Center v7x3  g7x3,  %7x3Text%			
	Gui, Add, Button, x105 y355 w50 h50 Center v7x4  g7x4,  %7x4Text%
	;  Buttons 29 - 32		
	Gui, Add, Button, x155 y205   w50 h50 Center v8x1  g8x1,  %8x1Text%
	Gui, Add, Button, x155 y255  w50 h50 Center v8x2  g8x2,  %8x2Text%	
	Gui, Add, Button, x155 y305 w50 h50 Center v8x3  g8x3,  %8x3Text%	
	Gui, Add, Button, x155 y355 w50 h50 Center v8x4  g8x4,  %8x4Text%
	;  Buttons 33 - 36		
	Gui, Add, Button, x5 y405   w50 h50 Center v9x1  g9x1,  %9x1Text%
	Gui, Add, Button, x5 y455  w50 h50 Center v9x2  g9x2,  %9x2Text%	
	Gui, Add, Button, x5 y505 w50 h50 Center v9x3  g9x3,  %9x3Text%		
	Gui, Add, Button, x5 y555 w50 h50 Center v9x4  g9x4,  %9x4Text%
	;  Buttons 37 - 40		
	Gui, Add, Button, x55 y405   w50 h50 Center v10x1 g10x1, %10x1Text%
	Gui, Add, Button, x55 y455  w50 h50 Center v10x2 g10x2, %10x2Text%	
	Gui, Add, Button, x55 y505 w50 h50 Center v10x3 g10x3, %10x3Text%	
	Gui, Add, Button, x55 y555 w50 h50 Center v10x4 g10x4, %10x4Text%
	;  Buttons 41 - 44		
	Gui, Add, Button, x105 y405   w50 h50 Center v11x1 g11x1, %11x1Text%
	Gui, Add, Button, x105 y455  w50 h50 Center v11x2 g11x2, %11x2Text%	
	Gui, Add, Button, x105 y505 w50 h50 Center v11x3 g11x3, %11x3Text%		
	Gui, Add, Button, x105 y555 w50 h50 Center v11x4 g11x4, %11x4Text%
	;  Buttons 45 - 48		
	Gui, Add, Button, x155 y405   w50 h50 Center v12x1 g12x1, %12x1Text%
	Gui, Add, Button, x155 y455  w50 h50 Center v12x2 g12x2, %12x2Text%	
	Gui, Add, Button, x155 y505 w50 h50 Center v12x3 g12x3, %12x3Text%		
	Gui, Add, Button, x155 y555 w50 h50 Center v12x4 g12x4, %12x4Text%
         ;49 - 52
	Gui, Add, Button, x5 y605   w50 h50 Center v13x1  g13x1,  %13x1Text%
	Gui, Add, Button, x5 y655  w50 h50 Center v13x2  g13x2,  %13x2Text%	
	Gui, Add, Button, x5 y705 w50 h50 Center v13x3  g13x3,  %13x3Text%		
	Gui, Add, Button, x5 y755 w50 h50 Center v13x4  g13x4,  %13x4Text%
	;  Buttons 53 - 56		
	Gui, Add, Button, x55 y605   w50 h50 Center v14x1 g14x1, %14x1Text%
	Gui, Add, Button, x55 y655  w50 h50 Center v14x2 g14x2, %14x2Text%	
	Gui, Add, Button, x55 y705 w50 h50 Center v14x3 g14x3, %14x3Text%	
	Gui, Add, Button, x55 y755 w50 h50 Center v14x4 g14x4, %14x4Text%
	;  Buttons 57 - 60		
	Gui, Add, Button, x105 y605   w50 h50 Center v15x1 g15x1, %15x1Text%
	Gui, Add, Button, x105 y655  w50 h50 Center v15x2 g15x2, %15x2Text%	
	Gui, Add, Button, x105 y705 w50 h50 Center v15x3 g15x3, %15x3Text%		
	Gui, Add, Button, x105 y755 w50 h50 Center v15x4 g15x4, %15x4Text%
	;  Buttons 61 - 64		
	Gui, Add, Button, x155 y605   w50 h50 Center v16x1 g16x1, %16x1Text%
	Gui, Add, Button, x155 y655  w50 h50 Center v16x2 g16x2, %16x2Text%	
	Gui, Add, Button, x155 y705 w50 h50 Center v16x3 g16x3, %16x3Text%		
	Gui, Add, Button, x155 y755 w50 h50 Center v16x4 g16x4, %16x4Text%
	Gui, Add, Picture,x5 y5  w50 h20 gPicture, top-left4.png
	Gui, Add, Button, x5 y25 w50 h15 Center   gUnhide, Unhide
	;Gui, Add, Button, x5 y40 w50 h15 Center gRotate, Rotate
	Gui, Add, Picture, x5 y40 w50 h15 Center gPicture, DRAG.jpg
	Gui, Add, Button, x5  y5  w12 h20 gSet1, 1
	Gui, Add, Button, x17 y5  w12 h20 gSet2, 2
	Gui, Add, Button, x29 y5  w12 h20 gSet3, 3
	Gui, Add, Button, x41 y5  w12 h20 gSet4, 4
	Gui, Color, ABCDEF,  F3 Keys.ahk	
	;Gui, Show, w220 h650 x%FKeysPosX% y%FKeysPosY%	, F3 Keys.ahk
	gosub CheckHidden
	Gui, Show, h55 w220 x%FKeysPosX% y%FKeysPosY%	, F3 Keys.ahk	
	}
WinSet, Transcolor, ABCDEF, F3 Keys.ahk
WinMove, F3 Keys.ahk, x%FKeysPosX% y%FKeysPosY%	
return

Rotate:
IniRead, toggleM, F3 Keys.ahk, Aspect, Horizontal
    ;toggleM    := !toggleM
if (toggleM = 1)
	{
	GuiControl, Move, Button17, x5   y205
	GuiControl, Move, Button18, x5   y255
	GuiControl, Move, Button19, x5   y305
	GuiControl, Move, Button20, x5   y355
	GuiControl, Move, Button21, x55  y205
	GuiControl, Move, Button22, x55  y255
	GuiControl, Move, Button23, x55  y305
	GuiControl, Move, Button24, x55  y355
	GuiControl, Move, Button25, x105 y205
	GuiControl, Move, Button26, x105 y255
	GuiControl, Move, Button27, x105 y305
	GuiControl, Move, Button28, x105 y355
	GuiControl, Move, Button29, x155 y205
	GuiControl, Move, Button30, x155 y255
	GuiControl, Move, Button31, x155 y305
	GuiControl, Move, Button32, x155 y355
	GuiControl, Move, Button33, x5   y405
	GuiControl, Move, Button34, x5   y455
	GuiControl, Move, Button35, x5   y505
	GuiControl, Move, Button36, x5   y555
	GuiControl, Move, Button37, x55  y405
	GuiControl, Move, Button38, x55  y455
	GuiControl, Move, Button39, x55  y505
	GuiControl, Move, Button40, x55  y555
	GuiControl, Move, Button41, x105 y405
	GuiControl, Move, Button42, x105 y455
	GuiControl, Move, Button43, x105 y505
	GuiControl, Move, Button44, x105 y555
	GuiControl, Move, Button45, x155 y405
	GuiControl, Move, Button46, x155 y455
	GuiControl, Move, Button47, x155 y505
	GuiControl, Move, Button48, x155 y555
	GuiControl, Move, Button49, x5 y605
	GuiControl, Move, Button50, x5 y655
	GuiControl, Move, Button51, x5 y705
	GuiControl, Move, Button52, x5 y755
	GuiControl, Move, Button53, x55 y605
	GuiControl, Move, Button54, x55 y655
	GuiControl, Move, Button55, x55 y705
	GuiControl, Move, Button56, x55 y755
	GuiControl, Move, Button57, x105 y605
	GuiControl, Move, Button58, x105 y655	
	GuiControl, Move, Button59, x105 y705	
	GuiControl, Move, Button60, x105 y755	
	GuiControl, Move, Button61, x155 y605	
	GuiControl, Move, Button62, x155 y655	
	GuiControl, Move, Button63, x155 y705
	GuiControl, Move, Button64, x155 y755
	Gui, Show, h55 w220
	IniWrite, 0, F3 Keys.ahk, Aspect, Horizontal
    }
if (toggleM = 0)
	{
	GuiControl, Move, Button17, x205 y5
	GuiControl, Move, Button18, x205 y55
	GuiControl, Move, Button19, x205 y105
	GuiControl, Move, Button20, x205 y155
	GuiControl, Move, Button21, x255 y5
	GuiControl, Move, Button22, x255 y55
	GuiControl, Move, Button23, x255 y105
	GuiControl, Move, Button24, x255 y155
	GuiControl, Move, Button25, x305 y5
	GuiControl, Move, Button26, x305 y55
	GuiControl, Move, Button27, x305 y105
	GuiControl, Move, Button28, x305 y155
	GuiControl, Move, Button29, x355 y5
	GuiControl, Move, Button30, x355 y55
	GuiControl, Move, Button31, x355 y105
	GuiControl, Move, Button32, x355 y155
	GuiControl, Move, Button33, x405 y5
	GuiControl, Move, Button34, x405 y55
	GuiControl, Move, Button35, x405 y105
	GuiControl, Move, Button36, x405 y155
	GuiControl, Move, Button37, x455 y5
	GuiControl, Move, Button38, x455 y55
	GuiControl, Move, Button39, x455 y105
	GuiControl, Move, Button40, x455 y155
	GuiControl, Move, Button41, x505 y5
	GuiControl, Move, Button42, x505 y55
	GuiControl, Move, Button43, x505 y105
	GuiControl, Move, Button44, x505 y155
	GuiControl, Move, Button45, x555 y5
	GuiControl, Move, Button46, x555 y55
	GuiControl, Move, Button47, x555 y105
	GuiControl, Move, Button48, x555 y155
	GuiControl, Move, Button49, x605 y5
	GuiControl, Move, Button50, x605 y55
	GuiControl, Move, Button51, x605 y105
	GuiControl, Move, Button52, x605 y155
	GuiControl, Move, Button53, x655 y5
	GuiControl, Move, Button54, x655 y55
	GuiControl, Move, Button55, x655 y105
	GuiControl, Move, Button56, x655 y155
	GuiControl, Move, Button57, x705 y5
	GuiControl, Move, Button58, x705 y55	
	GuiControl, Move, Button59, x705 y105	
	GuiControl, Move, Button60, x705 y155	
	GuiControl, Move, Button61, x755 y5	
	GuiControl, Move, Button62, x755 y55	
	GuiControl, Move, Button63, x755 y105
	GuiControl, Move, Button64, x755 y155
	Gui, Show, h55 w830
	IniWrite, 1, F3 Keys.ahk, Aspect, Horizontal
	}
return

CheckHidden:
if 1x1Hidden = 1	
	GuiControl, Hide, Button1
if 1x2Hidden = 1	
	GuiControl, Hide, Button2
if 1x3Hidden = 1	
	GuiControl, Hide, Button3
if 1x4Hidden = 1	
	GuiControl, Hide, Button4
if 2x1Hidden = 1	
	GuiControl, Hide, Button5
if 2x2Hidden = 1	
	GuiControl, Hide, Button6
if 2x3Hidden = 1	
	GuiControl, Hide, Button7
if 2x4Hidden = 1	
	GuiControl, Hide, Button8
if 3x1Hidden = 1	
	GuiControl, Hide, Button9
if 3x2Hidden = 1	
	GuiControl, Hide, Button10
if 3x3Hidden = 1	
	GuiControl, Hide, Button11
if 3x4Hidden = 1	
	GuiControl, Hide, Button12
if 4x1Hidden = 1	
	GuiControl, Hide, Button13
if 4x2Hidden = 1	
	GuiControl, Hide, Button14
if 4x3Hidden = 1	
	GuiControl, Hide, Button15
if 4x4Hidden = 1	
	GuiControl, Hide, Button16
if 5x1Hidden = 1	
	GuiControl, Hide, Button17
if 5x2Hidden = 1	
	GuiControl, Hide, Button18
if 5x3Hidden = 1
	GuiControl, Hide, Button19
if 5x4Hidden = 1
	GuiControl, Hide, Button20
if 6x1Hidden = 1
	GuiControl, Hide, Button21
if 6x2Hidden = 1	
	GuiControl, Hide, Button22
if 6x3Hidden = 1	
	GuiControl, Hide, Button23
if 6x4Hidden = 1	
	GuiControl, Hide, Button24
if 7x1Hidden = 1	
	GuiControl, Hide, Button25
if 7x2Hidden = 1	
	GuiControl, Hide, Button26
if 7x3Hidden = 1
	GuiControl, Hide, Button27
if 7x4Hidden = 1
	GuiControl, Hide, Button28
if 8x1Hidden = 1	
	GuiControl, Hide, Button29
if 8x2Hidden = 1
	GuiControl, Hide, Button30
if 8x3Hidden = 1	
	GuiControl, Hide, Button31
if 8x4Hidden = 1	
	GuiControl, Hide, Button32
if 9x1Hidden = 1	
	GuiControl, Hide, Button33
if 9x2Hidden = 1
	GuiControl, Hide, Button34
if 9x3Hidden = 1
	GuiControl, Hide, Button35
if 9x4Hidden = 1	
	GuiControl, Hide, Button36
if 10x1Hidden = 1	
	GuiControl, Hide, Button37
if 10x2Hidden = 1	
	GuiControl, Hide, Button38
if 10x3Hidden = 1
	GuiControl, Hide, Button39
if 10x4Hidden = 1	
	GuiControl, Hide, Button40
if 11x1Hidden = 1	
	GuiControl, Hide, Button41
if 11x2Hidden = 1	
	GuiControl, Hide, Button42
if 11x3Hidden = 1	
	GuiControl, Hide, Button43
if 11x4Hidden = 1	
	GuiControl, Hide, Button44
if 12x1Hidden = 1
	GuiControl, Hide, Button45
if 12x2Hidden = 1
	GuiControl, Hide, Button46
if 12x3Hidden = 1	
	GuiControl, Hide, Button47
if 12x4Hidden = 1	
	GuiControl, Hide, Button48
if 13x1Hidden = 1	
	GuiControl, Hide, Button49
if 13x2Hidden = 1	
	GuiControl, Hide, Button50
if 13x3Hidden = 1
	GuiControl, Hide, Button51
if 13x4Hidden = 1	
	GuiControl, Hide, Button52
if 14x1Hidden = 1	
	GuiControl, Hide, Button53
if 14x2Hidden = 1	
	GuiControl, Hide, Button54
if 14x3Hidden = 1	
	GuiControl, Hide, Button55
if 14x4Hidden = 1
	GuiControl, Hide, Button56
if 15x1Hidden = 1	
	GuiControl, Hide, Button57
if 15x2Hidden = 1
	GuiControl, Hide, Button58
if 15x3Hidden = 1	
	GuiControl, Hide, Button59
if 15x4Hidden = 1	
	GuiControl, Hide, Button60
if 16x1Hidden = 1	
	GuiControl, Hide, Button61
if 16x2Hidden = 1	
	GuiControl, Hide, Button62
if 16x3Hidden = 1	
	GuiControl, Hide, Button63
if 16x4Hidden = 1	
	GuiControl, Hide, Button64
return

Unhide:
GuiControl, Show, Button1
GuiControl, Show, Button2
GuiControl, Show, Button3
GuiControl, Show, Button4
GuiControl, Show, Button5
GuiControl, Show, Button6
GuiControl, Show, Button7
GuiControl, Show, Button8
GuiControl, Show, Button9
GuiControl, Show, Button10
GuiControl, Show, Button11
GuiControl, Show, Button12
GuiControl, Show, Button13
GuiControl, Show, Button14
GuiControl, Show, Button15
GuiControl, Show, Button16
GuiControl, Show, Button17
GuiControl, Show, Button18
GuiControl, Show, Button19
GuiControl, Show, Button20
GuiControl, Show, Button21
GuiControl, Show, Button22
GuiControl, Show, Button23
GuiControl, Show, Button24
GuiControl, Show, Button25
GuiControl, Show, Button26
GuiControl, Show, Button27
GuiControl, Show, Button28
GuiControl, Show, Button29
GuiControl, Show, Button30
GuiControl, Show, Button31
GuiControl, Show, Button32
GuiControl, Show, Button50
GuiControl, Show, Button33
GuiControl, Show, Button34
GuiControl, Show, Button35
GuiControl, Show, Button36
GuiControl, Show, Button37
GuiControl, Show, Button38
GuiControl, Show, Button39
GuiControl, Show, Button40
GuiControl, Show, Button41
GuiControl, Show, Button42
GuiControl, Show, Button43
GuiControl, Show, Button44
GuiControl, Show, Button45
GuiControl, Show, Button46
GuiControl, Show, Button47
GuiControl, Show, Button48
GuiControl, Show, Button49
GuiControl, Show, Button50
GuiControl, Show, Button51
GuiControl, Show, Button52
GuiControl, Show, Button53
GuiControl, Show, Button54
GuiControl, Show, Button55
GuiControl, Show, Button56
GuiControl, Show, Button57
GuiControl, Show, Button58
GuiControl, Show, Button59
GuiControl, Show, Button60
GuiControl, Show, Button61
GuiControl, Show, Button62
GuiControl, Show, Button63
GuiControl, Show, Button64
IniWrite, 0, F3 Keys.ahk, Saved,  1x1Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  1x2Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  1x3Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  1x4Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  2x1Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  2x2Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  2x3Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  2x4Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  3x1Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  3x2Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  3x3Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  3x4Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  4x1Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  4x2Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  4x3Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  4x4Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  5x1Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  5x2Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  5x3Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  5x4Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  6x1Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  6x2Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  6x3Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  6x4Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  7x1Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  7x2Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  7x3Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  7x4Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  8x1Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  8x2Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  8x3Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  8x4Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  9x1Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  9x2Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  9x3Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  9x4Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  10x1Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  10x2Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  10x3Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  10x4Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  11x1Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  11x2Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  11x3Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  11x4Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  12x1Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  12x2Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  12x3Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  12x4Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  13x1Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  13x2Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  13x3Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  13x4Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  14x1Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  14x2Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  14x3Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  14x4Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  15x1Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  15x2Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  15x3Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  15x4Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  16x1Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  16x2Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  16x3Hidden
IniWrite, 0, F3 Keys.ahk, Saved,  16x4Hidden
return

UpdateShortcut:
InputBox, NewText,   New Shortcut Text,    Enter the new shortcut text that will appear on the button:, , 300, 150, , , , , % %ThisThreadText%
InputBox, NewAction, New Docketing Action, Enter the new Action Type to inject into docketing:, , 300, 150, , , , , % ThisShortcut
IniWrite, %NewText%,   F3 Keys.ahk, Saved, %ThisThreadText%
IniWrite, %NewAction%, F3 Keys.ahk, Saved, %ThisThread%
return

1x1:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button1, %NewText%
		IniRead, 1x1, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x1Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button1
		IniWrite, 1, F3 Keys.ahk, Saved, 1x1Hidden
		return
		}
	else
		{
		gosub GrabHandle
		IniRead, 1x1, F3 Keys.ahk, Saved, 1x1
		ActionType = %1x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
		}
return

1x2:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button2, %NewText%
		IniRead, 1x2, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x2Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button2
		IniWrite, 1, F3 Keys.ahk, Saved, 1x2Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 1x2, F3 Keys.ahk, Saved, 1x2
		ActionType = %1x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

1x3:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button3, %NewText%
		IniRead, 1x3, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x3Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button3
		IniWrite, 1, F3 Keys.ahk, Saved, 1x3Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 1x3, F3 Keys.ahk, Saved, 1x3
		ActionType = %1x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

1x4:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button4, %NewText%
		IniRead, 1x4, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x4Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button4
		IniWrite, 1, F3 Keys.ahk, Saved, 1x4Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 1x4, F3 Keys.ahk, Saved, 1x4
		ActionType = %1x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return


2x1:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button5, %NewText%
		IniRead, 2x1, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x1Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button5
		IniWrite, 1, F3 Keys.ahk, Saved, 2x1Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 2x1, F3 Keys.ahk, Saved, 2x1
		ActionType = %2x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

2x2:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button6, %NewText%
		IniRead, 2x2, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x2Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button6
		IniWrite, 1, F3 Keys.ahk, Saved, 2x2Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 2x2, F3 Keys.ahk, Saved, 2x2
		ActionType = %2x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

2x3:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button7, %NewText%
		IniRead, 2x3, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x3Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button7
		IniWrite, 1, F3 Keys.ahk, Saved, 2x3Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 2x3, F3 Keys.ahk, Saved, 2x3
		ActionType = %2x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

2x4:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button8, %NewText%
		IniRead, 2x4, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x4Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button8
		IniWrite, 1, F3 Keys.ahk, Saved, 2x4Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 2x4, F3 Keys.ahk, Saved, 2x4
		ActionType = %2x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

3x1:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button9, %NewText%
		IniRead, 3x1, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x1Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button9
		IniWrite, 1, F3 Keys.ahk, Saved, 3x1Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 3x1, F3 Keys.ahk, Saved, 3x1
		ActionType = %3x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

3x2:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button10, %NewText%
		IniRead, 3x2, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x2Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button10
		IniWrite, 1, F3 Keys.ahk, Saved, 3x2Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 3x2, F3 Keys.ahk, Saved, 3x2
		ActionType = %3x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

3x3:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button11, %NewText%
		IniRead, 3x3, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x3Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button11
		IniWrite, 1, F3 Keys.ahk, Saved, 3x3Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 3x3, F3 Keys.ahk, Saved, 3x3
		ActionType = %3x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

3x4:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button12, %NewText%
		IniRead, 3x4, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x4Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button12
		IniWrite, 1, F3 Keys.ahk, Saved, 3x4Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 3x4, F3 Keys.ahk, Saved, 3x4
		ActionType = %3x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

4x1:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button13, %NewText%
		IniRead, 4x1, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x1Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button13
		IniWrite, 1, F3 Keys.ahk, Saved, 4x1Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 4x1, F3 Keys.ahk, Saved, 4x1
		ActionType = %4x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

4x2:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button14, %NewText%
		IniRead, 4x2, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x2Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button14
		IniWrite, 1, F3 Keys.ahk, Saved, 4x2Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 4x2, F3 Keys.ahk, Saved, 4x2
		ActionType = %4x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

4x3:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button15, %NewText%
		IniRead, 4x3, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x3Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button15
		IniWrite, 1, F3 Keys.ahk, Saved, 4x3Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 4x3, F3 Keys.ahk, Saved, 4x3
		ActionType = %4x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

4x4:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button16, %NewText%
		IniRead, 4x4, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x4Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button16
		IniWrite, 1, F3 Keys.ahk, Saved, 4x4Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 4x4, F3 Keys.ahk, Saved, 4x4
		ActionType = %4x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

5x1:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button17, %NewText%
		IniRead, 5x1, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 5x1Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button17
		IniWrite, 1, F3 Keys.ahk, Saved, 5x1Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 5x1, F3 Keys.ahk, Saved, 5x1
		ActionType = %5x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

5x2:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button18, %NewText%
		IniRead, 5x2, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 5x2Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button18
		IniWrite, 1, F3 Keys.ahk, Saved, 5x2Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 5x2, F3 Keys.ahk, Saved, 5x2
		ActionType = %5x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

5x3:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button19, %NewText%
		IniRead, 5x3, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 5x3Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button19
		IniWrite, 1, F3 Keys.ahk, Saved, 5x3Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 5x3, F3 Keys.ahk, Saved, 5x3
		ActionType = %5x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

5x4:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button20, %NewText%
		IniRead, 5x4, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 5x4Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button20
		IniWrite, 1, F3 Keys.ahk, Saved, 5x4Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 5x4, F3 Keys.ahk, Saved, 5x4
		ActionType = %5x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

6x1:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button21, %NewText%
		IniRead, 6x1, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 6x1Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button21
		IniWrite, 1, F3 Keys.ahk, Saved, 6x1Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 6x1, F3 Keys.ahk, Saved, 6x1
		ActionType = %6x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

6x2:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button22, %NewText%
		IniRead, 6x2, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 6x2Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button22
		IniWrite, 1, F3 Keys.ahk, Saved, 6x2Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 6x2, F3 Keys.ahk, Saved, 6x2
		ActionType = %6x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

6x3:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button23, %NewText%
		IniRead, 6x3, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 6x3Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button23
		IniWrite, 1, F3 Keys.ahk, Saved, 6x3Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 6x3, F3 Keys.ahk, Saved, 6x3
		ActionType = %6x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

6x4:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button24, %NewText%
		IniRead, 6x4, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 6x4Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button24
		IniWrite, 1, F3 Keys.ahk, Saved, 6x4Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 6x4, F3 Keys.ahk, Saved, 6x4
		ActionType = %6x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

7x1:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button25, %NewText%
		IniRead, 7x1, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 7x1Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button25
		IniWrite, 1, F3 Keys.ahk, Saved, 7x1Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 7x1, F3 Keys.ahk, Saved, 7x1
		ActionType = %7x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

7x2:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button26, %NewText%
		IniRead, 7x2, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 7x2Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button26
		IniWrite, 1, F3 Keys.ahk, Saved, 7x2Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 7x2, F3 Keys.ahk, Saved, 7x2
		ActionType = %7x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

7x3:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button27, %NewText%
		IniRead, 7x3, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 7x3Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button27
		IniWrite, 1, F3 Keys.ahk, Saved, 7x3Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 7x3, F3 Keys.ahk, Saved, 7x3
		ActionType = %7x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

7x4:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button28, %NewText%
		IniRead, 7x4, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 7x4Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button28
		IniWrite, 1, F3 Keys.ahk, Saved, 7x4Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 7x4, F3 Keys.ahk, Saved, 7x4
		ActionType = %7x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

8x1:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button29, %NewText%
		IniRead, 8x1, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 8x1Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button29
		IniWrite, 1, F3 Keys.ahk, Saved, 8x1Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 8x1, F3 Keys.ahk, Saved, 8x1
		ActionType = %8x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

8x2:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button30, %NewText%
		IniRead, 8x2, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 8x2Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button30
		IniWrite, 1, F3 Keys.ahk, Saved, 8x2Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 8x2, F3 Keys.ahk, Saved, 8x2
		ActionType = %8x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

8x3:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button31, %NewText%
		IniRead, 8x3, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 8x3Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button31
		IniWrite, 1, F3 Keys.ahk, Saved, 8x3Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 8x3, F3 Keys.ahk, Saved, 8x3
		ActionType = %8x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

8x4:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button32, %NewText%
		IniRead, 8x4, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 8x4Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button32
		IniWrite, 1, F3 Keys.ahk, Saved, 8x4Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 8x4, F3 Keys.ahk, Saved, 8x4
		ActionType = %8x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

9x1:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button33, %NewText%
		IniRead, 9x1, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 9x1Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button33
		IniWrite, 1, F3 Keys.ahk, Saved, 9x1Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 9x1, F3 Keys.ahk, Saved, 9x1
		ActionType = %9x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

9x2:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button34, %NewText%
		IniRead, 9x2, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 9x2Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button34
		IniWrite, 1, F3 Keys.ahk, Saved, 9x2Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 9x2, F3 Keys.ahk, Saved, 9x2
		ActionType = %9x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

9x3:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button35, %NewText%
		IniRead, 9x3, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 9x3Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button35
		IniWrite, 1, F3 Keys.ahk, Saved, 9x3Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 9x3, F3 Keys.ahk, Saved, 9x3
		ActionType = %9x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

9x4:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button36, %NewText%
		IniRead, 9x4, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 9x4Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button36
		IniWrite, 1, F3 Keys.ahk, Saved, 9x4Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 9x4, F3 Keys.ahk, Saved, 9x4
		ActionType = %9x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

10x1:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button37, %NewText%
		IniRead, 10x1, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 10x1Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button37
		IniWrite, 1, F3 Keys.ahk, Saved, 10x1Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 10x1, F3 Keys.ahk, Saved, 10x1
		ActionType = %10x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

10x2:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button38, %NewText%
		IniRead, 10x2, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 10x2Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button38
		IniWrite, 1, F3 Keys.ahk, Saved, 10x2Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 10x2, F3 Keys.ahk, Saved, 10x2
		ActionType = %10x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

10x3:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button39, %NewText%
		IniRead, 10x3, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 10x3Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button39
		IniWrite, 1, F3 Keys.ahk, Saved, 10x3Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 10x3, F3 Keys.ahk, Saved, 10x3
		ActionType = %10x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

10x4:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button40, %NewText%
		IniRead, 10x4, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 10x4Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button40
		IniWrite, 1, F3 Keys.ahk, Saved, 10x4Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 10x4, F3 Keys.ahk, Saved, 10x4
		ActionType = %10x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

11x1:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button41, %NewText%
		IniRead, 11x1, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 11x1Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button41
		IniWrite, 1, F3 Keys.ahk, Saved, 11x1Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 11x1, F3 Keys.ahk, Saved, 11x1
		ActionType = %11x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

11x2:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button42, %NewText%
		IniRead, 11x2, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 11x2Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button42
		IniWrite, 1, F3 Keys.ahk, Saved, 11x2Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 11x2, F3 Keys.ahk, Saved, 11x2
		ActionType = %11x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

11x3:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button43, %NewText%
		IniRead, 11x3, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 11x3Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button43
		IniWrite, 1, F3 Keys.ahk, Saved, 11x3Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 11x3, F3 Keys.ahk, Saved, 11x3
		ActionType = %11x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

11x4:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button44, %NewText%
		IniRead, 11x4, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 11x4Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button44
		IniWrite, 1, F3 Keys.ahk, Saved, 11x4Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 11x4, F3 Keys.ahk, Saved, 11x4
		ActionType = %11x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

12x1:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button45, %NewText%
		IniRead, 12x1, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 12x1Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button45
		IniWrite, 1, F3 Keys.ahk, Saved, 12x1Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 12x1, F3 Keys.ahk, Saved, 12x1
		ActionType = %12x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

12x2:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button46, %NewText%
		IniRead, 12x2, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 12x2Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button46
		IniWrite, 1, F3 Keys.ahk, Saved, 12x2Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 12x2, F3 Keys.ahk, Saved, 12x2
		ActionType = %12x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

12x3:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button47, %NewText%
		IniRead, 12x3, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 12x3Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button47
		IniWrite, 1, F3 Keys.ahk, Saved, 12x3Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 12x3, F3 Keys.ahk, Saved, 12x3
		ActionType = %12x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

12x4:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button48, %NewText%
		IniRead, 12x4, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 12x4Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button48
		IniWrite, 1, F3 Keys.ahk, Saved, 12x4Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 12x4, F3 Keys.ahk, Saved, 12x4
		ActionType = %12x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

13x1:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button49, %NewText%
		IniRead, 13x1, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 13x1Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button49
		IniWrite, 1, F3 Keys.ahk, Saved, 13x1Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 13x1, F3 Keys.ahk, Saved, 13x1
		ActionType = %13x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

13x2:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button50, %NewText%
		IniRead, 13x2, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 13x2Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button50
		IniWrite, 1, F3 Keys.ahk, Saved, 13x2Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 13x2, F3 Keys.ahk, Saved, 13x2
		ActionType = %13x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

13x3:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button51, %NewText%
		IniRead, 13x3, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 13x3Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button51
		IniWrite, 1, F3 Keys.ahk, Saved, 13x3Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 13x3, F3 Keys.ahk, Saved, 13x3
		ActionType = %13x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

13x4:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button52, %NewText%
		IniRead, 13x4, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 13x4Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button52
		IniWrite, 1, F3 Keys.ahk, Saved, 13x4Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 13x4, F3 Keys.ahk, Saved, 13x4
		ActionType = %13x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

14x1:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button53, %NewText%
		IniRead, 14x1, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 14x1Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button53
		IniWrite, 1, F3 Keys.ahk, Saved, 14x1Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 14x1, F3 Keys.ahk, Saved, 14x1
		ActionType = %14x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

14x2:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button54, %NewText%
		IniRead, 14x2, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 14x2Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button54
		IniWrite, 1, F3 Keys.ahk, Saved, 14x2Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 14x2, F3 Keys.ahk, Saved, 14x2
		ActionType = %14x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

14x3:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button55, %NewText%
		IniRead, 14x3, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 14x3Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button55
		IniWrite, 1, F3 Keys.ahk, Saved, 14x3Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 14x3, F3 Keys.ahk, Saved, 14x3
		ActionType = %14x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

14x4:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button56, %NewText%
		IniRead, 14x4, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 14x4Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button56
		IniWrite, 1, F3 Keys.ahk, Saved, 14x4Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 14x4, F3 Keys.ahk, Saved, 14x4
		ActionType = %14x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

15x1:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button57, %NewText%
		IniRead, 15x1, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 15x1Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button57
		IniWrite, 1, F3 Keys.ahk, Saved, 15x1Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 15x1, F3 Keys.ahk, Saved, 15x1
		ActionType = %15x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

15x2:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button58, %NewText%
		IniRead, 15x2, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 15x2Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button58
		IniWrite, 1, F3 Keys.ahk, Saved, 15x2Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 15x2, F3 Keys.ahk, Saved, 15x2
		ActionType = %15x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

15x3:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button59, %NewText%
		IniRead, 15x3, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 15x3Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button59
		IniWrite, 1, F3 Keys.ahk, Saved, 15x3Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 15x3, F3 Keys.ahk, Saved, 15x3
		ActionType = %15x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

15x4:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button60, %NewText%
		IniRead, 15x4, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 15x4Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button60
		IniWrite, 1, F3 Keys.ahk, Saved, 15x4Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 15x4, F3 Keys.ahk, Saved, 15x4
		ActionType = %15x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

16x1:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button61, %NewText%
		IniRead, 16x1, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 16x1Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button61
		IniWrite, 1, F3 Keys.ahk, Saved, 16x1Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 16x1, F3 Keys.ahk, Saved, 16x1
		ActionType = %16x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

16x2:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button62, %NewText%
		IniRead, 16x2, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 16x2Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button62
		IniWrite, 1, F3 Keys.ahk, Saved, 16x2Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 16x2, F3 Keys.ahk, Saved, 16x2
		ActionType = %16x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

16x3:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button63, %NewText%
		IniRead, 16x3, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 16x3Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button63
		IniWrite, 1, F3 Keys.ahk, Saved, 16x3Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 16x3, F3 Keys.ahk, Saved, 16x3
		ActionType = %16x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

16x4:
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button64, %NewText%
		IniRead, 16x4, F3 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 16x4Text, F3 Keys.ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button64
		IniWrite, 1, F3 Keys.ahk, Saved, 16x4Hidden
		return
		}
	else
		gosub GrabHandle
		IniRead, 16x4, F3 Keys.ahk, Saved, 16x4
		ActionType = %16x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		return
return

Set1:
GuiControl, Move, Button5,  % Slot1
GuiControl, Move, Button9,  % Slot2
GuiControl, Move, Button13, % Slot3
GuiControl, Move, Button17, % Slot4
GuiControl, Move, Button21, % Slot5
GuiControl, Move, Button25, % Slot6
GuiControl, Move, Button29, % Slot7				;Slot 1
GuiControl, Move, Button33, % Slot8
GuiControl, Move, Button37, % Slot9
GuiControl, Move, Button41, % Slot10
GuiControl, Move, Button45, % Slot11
GuiControl, Move, Button49, % Slot12
GuiControl, Move, Button53, % Slot13
GuiControl, Move, Button57, % Slot14
GuiControl, Move, Button61, % Slot15
GuiControl, Move, Button6,  % SlotHide1
GuiControl, Move, Button10, % SlotHide2
GuiControl, Move, Button14, % SlotHide3
GuiControl, Move, Button18, % SlotHide4
GuiControl, Move, Button22, % SlotHide5
GuiControl, Move, Button26, % SlotHide6
GuiControl, Move, Button30, % SlotHide7
GuiControl, Move, Button34, % SlotHide8			;Slot 2
GuiControl, Move, Button38, % SlotHide9
GuiControl, Move, Button42, % SlotHide10
GuiControl, Move, Button46, % SlotHide11
GuiControl, Move, Button50, % SlotHide12
GuiControl, Move, Button54, % SlotHide13
GuiControl, Move, Button58, % SlotHide14
GuiControl, Move, Button62, % SlotHide15
GuiControl, Move, Button7,  % SlotHide1
GuiControl, Move, Button11, % SlotHide2
GuiControl, Move, Button15, % SlotHide3
GuiControl, Move, Button19, % SlotHide4
GuiControl, Move, Button23, % SlotHide5
GuiControl, Move, Button27, % SlotHide6
GuiControl, Move, Button31, % SlotHide7
GuiControl, Move, Button35, % SlotHide8			;Slot 3
GuiControl, Move, Button39, % SlotHide9
GuiControl, Move, Button43, % SlotHide10
GuiControl, Move, Button47, % SlotHide11
GuiControl, Move, Button51, % SlotHide12
GuiControl, Move, Button55, % SlotHide13
GuiControl, Move, Button59, % SlotHide14
GuiControl, Move, Button63, % SlotHide15
GuiControl, Move, Button8,  % SlotHide1
GuiControl, Move, Button12, % SlotHide2
GuiControl, Move, Button16, % SlotHide3
GuiControl, Move, Button20, % SlotHide4
GuiControl, Move, Button24, % SlotHide5
GuiControl, Move, Button28, % SlotHide6
GuiControl, Move, Button32, % SlotHide7
GuiControl, Move, Button36, % SlotHide8			;Slot 4
GuiControl, Move, Button40, % SlotHide9
GuiControl, Move, Button44, % SlotHide10
GuiControl, Move, Button48, % SlotHide11
GuiControl, Move, Button52, % SlotHide12
GuiControl, Move, Button56, % SlotHide13
GuiControl, Move, Button60, % SlotHide14
GuiControl, Move, Button64, % SlotHide15
return

Set2:
GuiControl, Move, Button5,  % SlotHide1
GuiControl, Move, Button9,  % SlotHide2
GuiControl, Move, Button13, % SlotHide3
GuiControl, Move, Button17, % SlotHide4
GuiControl, Move, Button21, % SlotHide5
GuiControl, Move, Button25, % SlotHide6
GuiControl, Move, Button29, % SlotHide7				;SlotHide 1
GuiControl, Move, Button33, % SlotHide8
GuiControl, Move, Button37, % SlotHide9
GuiControl, Move, Button41, % SlotHide10
GuiControl, Move, Button45, % SlotHide11
GuiControl, Move, Button49, % SlotHide12
GuiControl, Move, Button53, % SlotHide13
GuiControl, Move, Button57, % SlotHide14
GuiControl, Move, Button61, % SlotHide15
GuiControl, Move, Button6,  % Slot1
GuiControl, Move, Button10, % Slot2
GuiControl, Move, Button14, % Slot3
GuiControl, Move, Button18, % Slot4
GuiControl, Move, Button22, % Slot5
GuiControl, Move, Button26, % Slot6
GuiControl, Move, Button30, % Slot7
GuiControl, Move, Button34, % Slot8			;Slot 2
GuiControl, Move, Button38, % Slot9
GuiControl, Move, Button42, % Slot10
GuiControl, Move, Button46, % Slot11
GuiControl, Move, Button50, % Slot12
GuiControl, Move, Button54, % Slot13
GuiControl, Move, Button58, % Slot14
GuiControl, Move, Button62, % Slot15
GuiControl, Move, Button7,  % SlotHide1
GuiControl, Move, Button11, % SlotHide2
GuiControl, Move, Button15, % SlotHide3
GuiControl, Move, Button19, % SlotHide4
GuiControl, Move, Button23, % SlotHide5
GuiControl, Move, Button27, % SlotHide6
GuiControl, Move, Button31, % SlotHide7
GuiControl, Move, Button35, % SlotHide8			;Slot 3
GuiControl, Move, Button39, % SlotHide9
GuiControl, Move, Button43, % SlotHide10
GuiControl, Move, Button47, % SlotHide11
GuiControl, Move, Button51, % SlotHide12
GuiControl, Move, Button55, % SlotHide13
GuiControl, Move, Button59, % SlotHide14
GuiControl, Move, Button63, % SlotHide15
GuiControl, Move, Button8,  % SlotHide1
GuiControl, Move, Button12, % SlotHide2
GuiControl, Move, Button16, % SlotHide3
GuiControl, Move, Button20, % SlotHide4
GuiControl, Move, Button24, % SlotHide5
GuiControl, Move, Button28, % SlotHide6
GuiControl, Move, Button32, % SlotHide7
GuiControl, Move, Button36, % SlotHide8			;Slot 4
GuiControl, Move, Button40, % SlotHide9
GuiControl, Move, Button44, % SlotHide10
GuiControl, Move, Button48, % SlotHide11
GuiControl, Move, Button52, % SlotHide12
GuiControl, Move, Button56, % SlotHide13
GuiControl, Move, Button60, % SlotHide14
GuiControl, Move, Button64, % SlotHide15
return

Set3:
GuiControl, Move, Button5,  % SlotHide1
GuiControl, Move, Button9,  % SlotHide2
GuiControl, Move, Button13, % SlotHide3
GuiControl, Move, Button17, % SlotHide4
GuiControl, Move, Button21, % SlotHide5
GuiControl, Move, Button25, % SlotHide6
GuiControl, Move, Button29, % SlotHide7				;SlotHide 1
GuiControl, Move, Button33, % SlotHide8
GuiControl, Move, Button37, % SlotHide9
GuiControl, Move, Button41, % SlotHide10
GuiControl, Move, Button45, % SlotHide11
GuiControl, Move, Button49, % SlotHide12
GuiControl, Move, Button53, % SlotHide13
GuiControl, Move, Button57, % SlotHide14
GuiControl, Move, Button61, % SlotHide15
GuiControl, Move, Button6,  % SlotHide1
GuiControl, Move, Button10, % SlotHide2
GuiControl, Move, Button14, % SlotHide3
GuiControl, Move, Button18, % SlotHide4
GuiControl, Move, Button22, % SlotHide5
GuiControl, Move, Button26, % SlotHide6
GuiControl, Move, Button30, % SlotHide7
GuiControl, Move, Button34, % SlotHide8			;Slot 2
GuiControl, Move, Button38, % SlotHide9
GuiControl, Move, Button42, % SlotHide10
GuiControl, Move, Button46, % SlotHide11
GuiControl, Move, Button50, % SlotHide12
GuiControl, Move, Button54, % SlotHide13
GuiControl, Move, Button58, % SlotHide14
GuiControl, Move, Button62, % SlotHide15
GuiControl, Move, Button7,  % Slot1
GuiControl, Move, Button11, % Slot2
GuiControl, Move, Button15, % Slot3
GuiControl, Move, Button19, % Slot4
GuiControl, Move, Button23, % Slot5
GuiControl, Move, Button27, % Slot6
GuiControl, Move, Button31, % Slot7
GuiControl, Move, Button35, % Slot8			;Slot 3
GuiControl, Move, Button39, % Slot9
GuiControl, Move, Button43, % Slot10
GuiControl, Move, Button47, % Slot11
GuiControl, Move, Button51, % Slot12
GuiControl, Move, Button55, % Slot13
GuiControl, Move, Button59, % Slot14
GuiControl, Move, Button63, % Slot15
GuiControl, Move, Button8,  % SlotHide1
GuiControl, Move, Button12, % SlotHide2
GuiControl, Move, Button16, % SlotHide3
GuiControl, Move, Button20, % SlotHide4
GuiControl, Move, Button24, % SlotHide5
GuiControl, Move, Button28, % SlotHide6
GuiControl, Move, Button32, % SlotHide7
GuiControl, Move, Button36, % SlotHide8			;Slot 4
GuiControl, Move, Button40, % SlotHide9
GuiControl, Move, Button44, % SlotHide10
GuiControl, Move, Button48, % SlotHide11
GuiControl, Move, Button52, % SlotHide12
GuiControl, Move, Button56, % SlotHide13
GuiControl, Move, Button60, % SlotHide14
GuiControl, Move, Button64, % SlotHide15
return

Set4:
GuiControl, Move, Button5,  % SlotHide1
GuiControl, Move, Button9,  % SlotHide2
GuiControl, Move, Button13, % SlotHide3
GuiControl, Move, Button17, % SlotHide4
GuiControl, Move, Button21, % SlotHide5
GuiControl, Move, Button25, % SlotHide6
GuiControl, Move, Button29, % SlotHide7				;SlotHide 1
GuiControl, Move, Button33, % SlotHide8
GuiControl, Move, Button37, % SlotHide9
GuiControl, Move, Button41, % SlotHide10
GuiControl, Move, Button45, % SlotHide11
GuiControl, Move, Button49, % SlotHide12
GuiControl, Move, Button53, % SlotHide13
GuiControl, Move, Button57, % SlotHide14
GuiControl, Move, Button61, % SlotHide15
GuiControl, Move, Button6,  % SlotHide1
GuiControl, Move, Button10, % SlotHide2
GuiControl, Move, Button14, % SlotHide3
GuiControl, Move, Button18, % SlotHide4
GuiControl, Move, Button22, % SlotHide5
GuiControl, Move, Button26, % SlotHide6
GuiControl, Move, Button30, % SlotHide7
GuiControl, Move, Button34, % SlotHide8			;Slot 2
GuiControl, Move, Button38, % SlotHide9
GuiControl, Move, Button42, % SlotHide10
GuiControl, Move, Button46, % SlotHide11
GuiControl, Move, Button50, % SlotHide12
GuiControl, Move, Button54, % SlotHide13
GuiControl, Move, Button58, % SlotHide14
GuiControl, Move, Button62, % SlotHide15
GuiControl, Move, Button7,  % SlotHide1
GuiControl, Move, Button11, % SlotHide2
GuiControl, Move, Button15, % SlotHide3
GuiControl, Move, Button19, % SlotHide4
GuiControl, Move, Button23, % SlotHide5
GuiControl, Move, Button27, % SlotHide6
GuiControl, Move, Button31, % SlotHide7
GuiControl, Move, Button35, % SlotHide8			;Slot 3
GuiControl, Move, Button39, % SlotHide9
GuiControl, Move, Button43, % SlotHide10
GuiControl, Move, Button47, % SlotHide11
GuiControl, Move, Button51, % SlotHide12
GuiControl, Move, Button55, % SlotHide13
GuiControl, Move, Button59, % SlotHide14
GuiControl, Move, Button63, % SlotHide15
GuiControl, Move, Button8,  % Slot1
GuiControl, Move, Button12, % Slot2
GuiControl, Move, Button16, % Slot3
GuiControl, Move, Button20, % Slot4
GuiControl, Move, Button24, % Slot5
GuiControl, Move, Button28, % Slot6
GuiControl, Move, Button32, % Slot7
GuiControl, Move, Button36, % Slot8			;Slot 4
GuiControl, Move, Button40, % Slot9
GuiControl, Move, Button44, % Slot10
GuiControl, Move, Button48, % Slot11
GuiControl, Move, Button52, % Slot12
GuiControl, Move, Button56, % Slot13
GuiControl, Move, Button60, % Slot14
GuiControl, Move, Button64, % Slot15
return

Picture:
PostMessage, 0xA1, 2,,, A
return


;Escape::
;ExitApp

#IfWinActive

/*

[Position]
FKeysPosX=1540
FKeysPosY=864

[Set2]
Hidden=0

[Set3]
Hidden=0

[Saved]
1x1=INT-PAT STATUS CHECK
1x1Hidden=0
1x1Text=PAT STATUS
1x2=
1x2Hidden=0
1x2Text=
1x3=
1x3Hidden=0
1x3Text=
1x4=
1x4Hidden=0
1x4Text=
2x1=INT-TM STATUS ACTION
2x1Hidden=0
2x1Text=TM STATUS
2x2=
2x2Hidden=0
2x2Text=
2x3=
2x3Hidden=0
2x3Text=
2x4=
2x4Hidden=0
2x4Text=
3x1=
3x1Hidden=0
3x1Text=
3x2=
3x2Hidden=0
3x2Text=
3x3=
3x3Hidden=0
3x3Text=
3x4=
3x4Hidden=0
3x4Text=
4x1=
4x1Hidden=0
4x1Text=
4x2=
4x2Hidden=0
4x2Text=
4x3=
4x3Hidden=0
4x3Text=
4x4=
4x4Hidden=0
4x4Text=
5x1=INT-PAT POWER OF ATTORNEY REQUEST
5x1Hidden=0
5x1Text=PAT POA
5x2=INT-PAT POWER OF ATTORNEY REQUEST NO DATE
5x2Hidden=0
5x2Text=PAT POA N/D
5x3=INT-TM POWER OF ATTORNEY REQUEST
5x3Hidden=0
5x3Text=TM POA
5x4=INT-TM POWER OF ATTORNEY REQUEST NO DATE
5x4Hidden=0
5x4Text=TM POA N/D
6x1=INT-PAT ASSIGNMENT REQUEST
6x1Hidden=0
6x1Text=PAT ASSIGN
6x2=INT-PAT ASSIGNMENT REQUEST NO DATE
6x2Hidden=0
6x2Text=PAT ASSIGN N/D
6x3=INT-TM ASSIGNMENT REQUEST
6x3Hidden=0
6x3Text=TM ASSIGN
6x4=INT-TM ASSIGNMENT REQUEST NO DATE
6x4Hidden=0
6x4Text=TM ASSIGN N/D
7x1=INT-PAT PRIORITY DOCUMENT REQUEST
7x1Hidden=0
7x1Text=PAT PRIOR DOCS
7x2=INT-PAT PRIORITY DOCUMENT REQUEST NO DATE
7x2Hidden=0
7x2Text=PAT P. DOCS N/D
7x3=INT-TM PRIORITY DOCUMENT REQUEST
7x3Hidden=0
7x3Text=TM PRIOR DOCS
7x4=INT-TM PRIORITY DOCUMENT REQUEST NO DATE
7x4Hidden=0
7x4Text=TM P.DOCS N/D
8x1=INT-PAT FORMAL DOCUMENT REQUEST
8x1Hidden=0
8x1Text=PAT FORMAL DOCS
8x2=INT-PAT FORMAL DOCUMENT REQUEST NO DATE
8x2Hidden=0
8x2Text=PAT F. DOCS N/D
8x3=INT-TM FORMAL DOCUMENT REQUEST
8x3Hidden=0
8x3Text=TM FORMAL DOCS
8x4=INT-TM FORMAL DOCUMENT REQUEST NO DATE
8x4Hidden=0
8x4Text=TM F. DOCS N/D
9x1=
9x1Hidden=0
9x1Text=
9x2=
9x2Hidden=0
9x2Text=
9x3=
9x3Hidden=0
9x3Text=
9x4=
9x4Hidden=0
9x4Text=
10x1Text=
10x1=
10x1Hidden=0
10x2Text=
10x2=
10x2Hidden=0
10x3Text=
10x3=
10x3Hidden=0
10x4Text=
10x4=
10x4Hidden=0
11x1Text=
11x1=
11x1Hidden=0
11x2Text=
11x2=
11x2Hidden=0
11x3Text=
11x3=
11x3Hidden=0
11x4Text=
11x4=
11x4Hidden=0
12x1Text=
12x1=
12x1Hidden=0
12x2Text=
12x2=
12x2Hidden=0
12x3Text=
12x3=
12x3Hidden=0
12x4Text=
12x4=
12x4Hidden=0
13x1Text=
13x1=
13x1Hidden=0
13x2Text=
13x2=
13x2Hidden=0
13x3Text=
13x3=
13x3Hidden=0
13x4Text=
13x4=
13x4Hidden=0
14x1Text=
14x1=
14x1Hidden=0
14x2Text=
14x2=
14x2Hidden=0
14x3Text=
14x3=
14x3Hidden=0
14x4Text=
14x4=
14x4Hidden=0
15x1Text=
15x1=
15x1Hidden=0
15x2Text=
15x2=
15x2Hidden=0
15x3Text=
15x3=
15x3Hidden=0
15x4Text=
15x4=
15x4Hidden=0
16x1Text=
16x1=
16x1Hidden=0
16x2Text=
16x2=
16x2Hidden=0
16x3Text=
16x3=
16x3Hidden=0
16x4Text=
16x4=
16x4Hidden=0

[CustomFKeys]
F1point1=INT-PAT STATUS CHECK
F1point2=INT-TM STATUS ACTION
F1point3=
F1point4=
F1point5=
F1point6=
F2point1=
F2point2=
F2point3=
F2point4=
F2point5=
F2point6=
F3point1=
F3point2=
F3point3=
F3point4=
F3point5=
F3point6=
F5point1=
F5point2=
F5point3=
F5point4=
F5point5=
F5point6=
F6point1=
F6point2=
F6point3=
F6point4=
F6point5=
F6point6=
F7point1=
F7point2=
F7point3=
F7point4=
F7point5=
F7point6=
F8point1=
F8point2=
F8point3=
F8point4=
F8point5=
F8point6=

[Aspect]
Horizontal=1

*/

#IfWinActive ahk_class IEFrame

GrabHandle:
;ObjRelease(ie)
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
  ie.Visible := True
   params := [OutputVar, 32]
}
;ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
return

#If

#F1::
Gui, Destroy
Gui, New, , Customize F-Keys
Gui, Add, DropDownList, Center vCustomKey gCustomKey x5 y5 w180, F1||F2|F3|F5|F6|F7|F8|
Gui, Add, Edit, Center vChoice1 x5 y30 w180, 
Gui, Add, Edit, Center vChoice2 x5 y55 w180, 
Gui, Add, Edit, Center vChoice3 x5 y80 w180, 
Gui, Add, Edit, Center vChoice4 x5 y105 w180, 
Gui, Add, Edit, Center vChoice5 x5 y130 w180, 
Gui, Add, Edit, Center vChoice6 x5 y155 w180, 
Gui, Add, Button, gSubmitCustomKeys x5 y180, Customize
Gui, Add, Button, gCancelChanges x140 y180, Cancel
Gui, Show, w190
gosub CustomKey
return

CancelChanges:
Gui, Destroy
return

CustomKey:
Gui, Submit, NoHide
IniRead, Choice1, F3 Keys.ahk, CustomFKeys, %CustomKey%point1
IniRead, Choice2, F3 Keys.ahk, CustomFKeys, %CustomKey%point2
IniRead, Choice3, F3 Keys.ahk, CustomFKeys, %CustomKey%point3
IniRead, Choice4, F3 Keys.ahk, CustomFKeys, %CustomKey%point4
IniRead, Choice5, F3 Keys.ahk, CustomFKeys, %CustomKey%point5
IniRead, Choice6, F3 Keys.ahk, CustomFKeys, %CustomKey%point6
GuiControl, , Edit1, %Choice1%
GuiControl, , Edit2, %Choice2%
GuiControl, , Edit3, %Choice3%
GuiControl, , Edit4, %Choice4%
GuiControl, , Edit5, %Choice5%
GuiControl, , Edit6, %Choice6%
return

SubmitCustomKeys:
Gui, Submit, NoHide
;MsgBox, % CustomKey " | " Choice1 " | " Choice2 " | " Choice3 " | " Choice4 " | " Choice5 " | " Choice6
IniWrite, %Choice1%, F3 Keys.ahk, CustomFKeys, %CustomKey%point1
IniWrite, %Choice2%, F3 Keys.ahk, CustomFKeys, %CustomKey%point2
IniWrite, %Choice3%, F3 Keys.ahk, CustomFKeys, %CustomKey%point3
IniWrite, %Choice4%, F3 Keys.ahk, CustomFKeys, %CustomKey%point4
IniWrite, %Choice5%, F3 Keys.ahk, CustomFKeys, %CustomKey%point5
IniWrite, %Choice6%, F3 Keys.ahk, CustomFKeys, %CustomKey%point6
return

F1::
IniRead, F1point1, F3 Keys.ahk, CustomFKeys, F1point1
IniRead, F1point2, F3 Keys.ahk, CustomFKeys, F1point2
IniRead, F1point3, F3 Keys.ahk, CustomFKeys, F1point3
IniRead, F1point4, F3 Keys.ahk, CustomFKeys, F1point4
IniRead, F1point5, F3 Keys.ahk, CustomFKeys, F1point5
IniRead, F1point6, F3 Keys.ahk, CustomFKeys, F1point6
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F1point6)
	{
	ActionType := F1point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F1point1)
	{
	ActionType := F1point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F1point2)
	{
	ActionType := F1point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F1point3)
	{
	ActionType := F1point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F1point4)
	{
	ActionType := F1point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F1point5)
	{
	ActionType := F1point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F1point1) || (ActionType != F1point2) || (ActionType != F1point3) || (ActionType != F1point4) || (ActionType != F1point5)|| (ActionType != F1point6)
	{
	ActionType := F1point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return

F2::
IniRead, F2point1, F3 Keys.ahk, CustomFKeys, F2point1
IniRead, F2point2, F3 Keys.ahk, CustomFKeys, F2point2
IniRead, F2point3, F3 Keys.ahk, CustomFKeys, F2point3
IniRead, F2point4, F3 Keys.ahk, CustomFKeys, F2point4
IniRead, F2point5, F3 Keys.ahk, CustomFKeys, F2point5
IniRead, F2point6, F3 Keys.ahk, CustomFKeys, F2point6
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F2point6)
	{
	ActionType := F2point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F2point1)
	{
	ActionType := F2point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F2point2)
	{
	ActionType := F2point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F2point3)
	{
	ActionType := F2point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F2point4)
	{
	ActionType := F2point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F2point5)
	{
	ActionType := F2point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F2point1) || (ActionType != F2point2) || (ActionType != F2point3) || (ActionType != F2point4) || (ActionType != F2point5)|| (ActionType != F2point6)
	{
	ActionType := F2point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return

F3::
IniRead, F3point1, F3 Keys.ahk, CustomFKeys, F3point1
IniRead, F3point2, F3 Keys.ahk, CustomFKeys, F3point2
IniRead, F3point3, F3 Keys.ahk, CustomFKeys, F3point3
IniRead, F3point4, F3 Keys.ahk, CustomFKeys, F3point4
IniRead, F3point5, F3 Keys.ahk, CustomFKeys, F3point5
IniRead, F3point6, F3 Keys.ahk, CustomFKeys, F3point6
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F3point6)
	{
	ActionType := F3point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F3point1)
	{
	ActionType := F3point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F3point2)
	{
	ActionType := F3point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F3point3)
	{
	ActionType := F3point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F3point4)
	{
	ActionType := F3point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F3point5)
	{
	ActionType := F3point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F3point1) || (ActionType != F3point2) || (ActionType != F3point3) || (ActionType != F3point4) || (ActionType != F3point5)|| (ActionType != F3point6)
	{
	ActionType := F3point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return

F5::
IniRead, F5point1, F3 Keys.ahk, CustomFKeys, F5point1
IniRead, F5point2, F3 Keys.ahk, CustomFKeys, F5point2
IniRead, F5point3, F3 Keys.ahk, CustomFKeys, F5point3
IniRead, F5point4, F3 Keys.ahk, CustomFKeys, F5point4
IniRead, F5point5, F3 Keys.ahk, CustomFKeys, F5point5
IniRead, F5point6, F3 Keys.ahk, CustomFKeys, F5point6
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F5point6)
	{
	ActionType := F5point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F5point1)
	{
	ActionType := F5point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F5point2)
	{
	ActionType := F5point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F5point3)
	{
	ActionType := F5point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F5point4)
	{
	ActionType := F5point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F5point5)
	{
	ActionType := F5point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F5point1) || (ActionType != F5point2) || (ActionType != F5point3) || (ActionType != F5point4) || (ActionType != F5point5)|| (ActionType != F5point6)
	{
	ActionType := F5point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return

F6::
IniRead, F6point1, F3 Keys.ahk, CustomFKeys, F6point1
IniRead, F6point2, F3 Keys.ahk, CustomFKeys, F6point2
IniRead, F6point3, F3 Keys.ahk, CustomFKeys, F6point3
IniRead, F6point4, F3 Keys.ahk, CustomFKeys, F6point4
IniRead, F6point5, F3 Keys.ahk, CustomFKeys, F6point5
IniRead, F6point6, F3 Keys.ahk, CustomFKeys, F6point6
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F6point6)
	{
	ActionType := F6point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F6point1)
	{
	ActionType := F6point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F6point2)
	{
	ActionType := F6point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F6point3)
	{
	ActionType := F6point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F6point4)
	{
	ActionType := F6point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F6point5)
	{
	ActionType := F6point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F6point1) || (ActionType != F6point2) || (ActionType != F6point3) || (ActionType != F6point4) || (ActionType != F6point5)|| (ActionType != F6point6)
	{
	ActionType := F6point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return

F7::
IniRead, F7point1, F3 Keys.ahk, CustomFKeys, F7point1
IniRead, F7point2, F3 Keys.ahk, CustomFKeys, F7point2
IniRead, F7point3, F3 Keys.ahk, CustomFKeys, F7point3
IniRead, F7point4, F3 Keys.ahk, CustomFKeys, F7point4
IniRead, F7point5, F3 Keys.ahk, CustomFKeys, F7point5
IniRead, F7point6, F3 Keys.ahk, CustomFKeys, F7point6
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F7point6)
	{
	ActionType := F7point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F7point1)
	{
	ActionType := F7point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F7point2)
	{
	ActionType := F7point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F7point3)
	{
	ActionType := F7point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F7point4)
	{
	ActionType := F7point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F7point5)
	{
	ActionType := F7point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F7point1) || (ActionType != F7point2) || (ActionType != F7point3) || (ActionType != F7point4) || (ActionType != F7point5)|| (ActionType != F7point6)
	{
	ActionType := F7point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return

F8::
IniRead, F8point1, F3 Keys.ahk, CustomFKeys, F8point1
IniRead, F8point2, F3 Keys.ahk, CustomFKeys, F8point2
IniRead, F8point3, F3 Keys.ahk, CustomFKeys, F8point3
IniRead, F8point4, F3 Keys.ahk, CustomFKeys, F8point4
IniRead, F8point5, F3 Keys.ahk, CustomFKeys, F8point5
IniRead, F8point6, F3 Keys.ahk, CustomFKeys, F8point6
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F8point6)
	{
	ActionType := F8point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F8point1)
	{
	ActionType := F8point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F8point2)
	{
	ActionType := F8point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F8point3)
	{
	ActionType := F8point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F8point4)
	{
	ActionType := F8point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F8point5)
	{
	ActionType := F8point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F8point1) || (ActionType != F8point2) || (ActionType != F8point3) || (ActionType != F8point4) || (ActionType != F8point5)|| (ActionType != F8point6)
	{
	ActionType := F8point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return
/*
F2::
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = "INT-TM OFFICE ACTION")
	{
	ActionType := "INT-PAT OFFICE ACTION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if ActionType = INT-PAT OFFICE ACTION
	{
	ActionType := "INT-PAT DIV OFFICE ACTION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if ActionType = INT-PAT DIV OFFICE ACTION
	{
	ActionType := "INT-TM OFFICE ACTION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType != "INT-PAT OFFICE ACTION") || (ActionType != "INT-PAT DIV OFFICE ACTION") || (ActionType != "INT-TM OFFICE ACTION")
	{
	ActionType := "INT-PAT OFFICE ACTION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return

F3::
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = "INT-TM SECOND PUBLICATION")
	{
	ActionType := "INT-PAT PCT PUBLICATION RECVD"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if ActionType = INT-PAT PCT PUBLICATION RECVD
	{
	ActionType := "INT-PAT PCT REPUBLICATION RECVD"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if ActionType = INT-PAT PCT REPUBLICATION RECVD
	{
	ActionType := "INT-PAT APPLICATION PUBLICATION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if ActionType = INT-PAT APPLICATION PUBLICATION
	{
	ActionType := "INT-PAT SECOND PUBLICATION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}			
if ActionType = INT-PAT SECOND PUBLICATION
	{
	ActionType := "INT-TM FIRST PUBLICATION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if ActionType = INT-TM FIRST PUBLICATION
	{
	ActionType := "INT-TM SECOND PUBLICATION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
	
if (ActionType != "INT-PAT PCT PUBLICATION RECVD") || (ActionType != "INT-PAT PCT REPUBLICATION RECVD") || (ActionType != "INT-PAT APPLICATION PUBLICATION") || (ActionType != "INT-PAT SECOND PUBLICATION") || (ActionType != "INT-TM FIRST PUBLICATION") || (ActionType != "INT-TM SECOND PUBLICATION")
	{
	ActionType := "INT-PAT PCT PUBLICATION RECVD"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return


F5::
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = "INT-TM POWER OF ATTORNEY REQUEST NO DATE")
	{
	ActionType := "INT-PAT POWER OF ATTORNEY REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if ActionType = INT-PAT POWER OF ATTORNEY REQUEST
	{
	ActionType := "INT-PAT POWER OF ATTORNEY REQUEST NO DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if ActionType = INT-PAT POWER OF ATTORNEY REQUEST NO DATE
	{
	ActionType := "INT-TM POWER OF ATTORNEY REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if ActionType = INT-TM POWER OF ATTORNEY REQUEST
	{
	ActionType := "INT-TM POWER OF ATTORNEY REQUEST NO DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != "INT-PAT POWER OF ATTORNEY REQUEST") || (ActionType != "INT-PAT POWER OF ATTORNEY REQUEST NO DATE") || (ActionType != "INT-TM POWER OF ATTORNEY REQUEST") || (ActionType != "INT-TM POWER OF ATTORNEY REQUEST NO DATE")
	{
	ActionType := "INT-PAT POWER OF ATTORNEY REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return	
	
F6::
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = "INT-TM ASSIGNMENT REQUEST NO DATE")
	{
	ActionType := "INT-PAT ASSIGNMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if ActionType = INT-PAT ASSIGNMENT REQUEST
	{
	ActionType := "INT-PAT ASSIGNMENT REQUEST NO DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if ActionType = INT-PAT ASSIGNMENT REQUEST NO DATE
	{
	ActionType := "INT-TM ASSIGNMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if ActionType = INT-TM ASSIGNMENT REQUEST
	{
	ActionType := "INT-TM ASSIGNMENT REQUEST NO DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != "INT-PAT ASSIGNMENT REQUEST") || (ActionType != "INT-PAT ASSIGNMENT REQUEST NO DATE") || (ActionType != "INT-TM ASSIGNMENT REQUEST") || (ActionType != "INT-TM ASSIGNMENT REQUEST NO DATE")
	{
	ActionType := "INT-PAT ASSIGNMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return		
	
F7::
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = "INT-TM PRIORITY DOCUMENT REQUEST NO DATE")
	{
	ActionType := "INT-PAT PRIORITY DOCUMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if ActionType = INT-PAT PRIORITY DOCUMENT REQUEST
	{
	ActionType := "INT-PAT PRIORITY DOCUMENT REQUEST NO DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if ActionType = INT-PAT PRIORITY DOCUMENT REQUEST NO DATE
	{
	ActionType := "INT-TM PRIORITY DOCUMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if ActionType = INT-TM PRIORITY DOCUMENT REQUEST
	{
	ActionType := "INT-TM PRIORITY DOCUMENT REQUEST NO DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != "INT-PAT PRIORITY DOCUMENT REQUEST") || (ActionType != "INT-PAT PRIORITY DOCUMENT REQUEST NO DATE") || (ActionType != "INT-TM PRIORITY DOCUMENT REQUEST") || (ActionType != "INT-TM PRIORITY DOCUMENT REQUEST NO DATE")
	{
	ActionType := "INT-PAT PRIORITY DOCUMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return	

F8::
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = "INT-TM FORMAL DOCUMENT REQUEST NO DATE")
	{
	ActionType := "INT-PAT FORMAL DOCUMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if ActionType = INT-PAT FORMAL DOCUMENT REQUEST
	{
	ActionType := "INT-PAT FORMAL DOCUMENT REQUEST NO DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if ActionType = INT-PAT FORMAL DOCUMENT REQUEST NO DATE
	{
	ActionType := "INT-TM FORMAL DOCUMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if ActionType = INT-TM FORMAL DOCUMENT REQUEST
	{
	ActionType := "INT-TM FORMAL DOCUMENT REQUEST NO DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != "INT-PAT FORMAL DOCUMENT REQUEST") || (ActionType != "INT-PAT FORMAL DOCUMENT REQUEST NO DATE") || (ActionType != "INT-TM FORMAL DOCUMENT REQUEST") || (ActionType != "INT-TM FORMAL DOCUMENT REQUEST NO DATE")
	{
	ActionType := "INT-PAT FORMAL DOCUMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return	

*/
