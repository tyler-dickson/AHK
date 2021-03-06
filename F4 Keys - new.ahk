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

global Slot1 	  :=  "x55   y5"
global Slot2 	  :=  "x105  y5"
global Slot3 	  :=  "x155  y5"
global Slot4 	  :=  "x205  y5"
global Slot5 	  :=  "x255  y5"
global Slot6 	  :=  "x305  y5"
global Slot7 	  :=  "x355  y5"
global Slot8 	  :=  "x405  y5"
global Slot9 	  :=  "x455  y5"
global Slot10 	  :=  "x505  y5"
global Slot11 	  :=  "x555  y5"
global Slot12 	  :=  "x605  y5"
global Slot13 	  :=  "x655  y5"
global Slot14 	  :=  "x705  y5"
global Slot15 	  :=  "x755  y5"
global SlotHide1  :=  "x55   y-150"
global SlotHide2  :=  "x105  y-150"
global SlotHide3  :=  "x155  y-150"
global SlotHide4  :=  "x205  y-150"
global SlotHide5  :=  "x255  y-150"
global SlotHide6  :=  "x305  y-150"
global SlotHide7  :=  "x355  y-150"
global SlotHide8  :=  "x405  y-150"
global SlotHide9  :=  "x455  y-150"
global SlotHide10 :=  "x505  y-150"
global SlotHide11 :=  "x555  y-150"
global SlotHide12 :=  "x605  y-150"
global SlotHide13 :=  "x655  y-150"
global SlotHide14 :=  "x705  y-150"
global SlotHide15 :=  "x755  y-150"
global SlotVert1  :=  "x5    y55"
global SlotVert2  :=  "x5    y105"
global SlotVert3  :=  "x5    y155"
global SlotVert4  :=  "x5    y205"
global SlotVert5  :=  "x5    y255"
global SlotVert6  :=  "x5    y305"
global SlotVert7  :=  "x5    y355"
global SlotVert8  :=  "x5    y405"
global SlotVert9  :=  "x5    y455"
global SlotVert10 :=  "x5    y505"
global SlotVert11 :=  "x5    y555"
global SlotVert12 :=  "x5    y605"
global SlotVert13 :=  "x5    y655"
global SlotVert14 :=  "x5    y705"
global SlotVert15 :=  "x5    y755"


MsgBox, , Remapped Function Keys, Please remember that this will only work in the FIRST tab you opened in each Internet Explorer window.`n`nIf you're on the second tab, it will still interact with the first tab.`n`nIf you need to have another tab open, consider opening that one AFTER this one, and keep docketing in your FIRST tab.`n`nFor best results, keep docketing in the FIRST tab you opened.
SetTimer, IsNotepadActive, 500
gosub CreateGUI
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
	
	Gui, Color, 000111,  F4 Keys.ahk

    if (toggle = 1)
	{
    Gui, Show, w630 xCenter y%HalfScreenHeight%
	WinSet, Transcolor, 000111, F4 Keys.ahk
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
	WinGetPos, FKeysPosX, FKeysPosY, , , F4 Keys.ahk,
	IniWrite, %FKeysPosX%, F4 Keys.ahk, Position, FKeysPosX
	IniWrite, %FKeysPosY%, F4 Keys.ahk, Position, FKeysPosY	
	Gui, Destroy
    }
	}
return
*/

CreateGUI:
global FKeysPosX
global FKeysPosY
IniRead, 1x1, F4 Keys.ahk, Saved, 1x1
IniRead, 1x2, F4 Keys.ahk, Saved, 1x2
IniRead, 1x3, F4 Keys.ahk, Saved, 1x3
IniRead, 1x4, F4 Keys.ahk, Saved, 1x4
IniRead, 1x5, F4 Keys.ahk, Saved, 1x5
IniRead, 1x6, F4 Keys.ahk, Saved, 1x6
IniRead, 1x7, F4 Keys.ahk, Saved, 1x7
IniRead, 1x8, F4 Keys.ahk, Saved, 1x8
IniRead, 1x9, F4 Keys.ahk, Saved, 1x9
IniRead, 1x10, F4 Keys.ahk, Saved, 1x10
IniRead, 1x11, F4 Keys.ahk, Saved, 1x11
IniRead, 1x12, F4 Keys.ahk, Saved, 1x12
IniRead, 1x13, F4 Keys.ahk, Saved, 1x13
IniRead, 1x14, F4 Keys.ahk, Saved, 1x14
IniRead, 1x15, F4 Keys.ahk, Saved, 1x15
IniRead, 2x1, F4 Keys.ahk, Saved, 2x1
IniRead, 2x2, F4 Keys.ahk, Saved, 2x2
IniRead, 2x3, F4 Keys.ahk, Saved, 2x3
IniRead, 2x4, F4 Keys.ahk, Saved, 2x4
IniRead, 2x5, F4 Keys.ahk, Saved, 2x5
IniRead, 2x6, F4 Keys.ahk, Saved, 2x6
IniRead, 2x7, F4 Keys.ahk, Saved, 2x7
IniRead, 2x8, F4 Keys.ahk, Saved, 2x8
IniRead, 2x9, F4 Keys.ahk, Saved, 2x9
IniRead, 2x10, F4 Keys.ahk, Saved, 2x10
IniRead, 2x11, F4 Keys.ahk, Saved, 2x11
IniRead, 2x12, F4 Keys.ahk, Saved, 2x12
IniRead, 2x13, F4 Keys.ahk, Saved, 2x13
IniRead, 2x14, F4 Keys.ahk, Saved, 2x14
IniRead, 2x15, F4 Keys.ahk, Saved, 2x15
IniRead, 3x1, F4 Keys.ahk, Saved, 3x1
IniRead, 3x2, F4 Keys.ahk, Saved, 3x2
IniRead, 3x3, F4 Keys.ahk, Saved, 3x3
IniRead, 3x4, F4 Keys.ahk, Saved, 3x4
IniRead, 3x5, F4 Keys.ahk, Saved, 3x5
IniRead, 3x6, F4 Keys.ahk, Saved, 3x6
IniRead, 3x7, F4 Keys.ahk, Saved, 3x7
IniRead, 3x8, F4 Keys.ahk, Saved, 3x8
IniRead, 3x9, F4 Keys.ahk, Saved, 3x9
IniRead, 3x10, F4 Keys.ahk, Saved, 3x10
IniRead, 3x11, F4 Keys.ahk, Saved, 3x11
IniRead, 3x12, F4 Keys.ahk, Saved, 3x12
IniRead, 3x13, F4 Keys.ahk, Saved, 3x13
IniRead, 3x14, F4 Keys.ahk, Saved, 3x14
IniRead, 3x15, F4 Keys.ahk, Saved, 3x15
IniRead, 4x1, F4 Keys.ahk, Saved, 4x1
IniRead, 4x2, F4 Keys.ahk, Saved, 4x2
IniRead, 4x3, F4 Keys.ahk, Saved, 4x3
IniRead, 4x4, F4 Keys.ahk, Saved, 4x4
IniRead, 4x5, F4 Keys.ahk, Saved, 4x5
IniRead, 4x6, F4 Keys.ahk, Saved, 4x6
IniRead, 4x7, F4 Keys.ahk, Saved, 4x7
IniRead, 4x8, F4 Keys.ahk, Saved, 4x8
IniRead, 4x9, F4 Keys.ahk, Saved, 4x9
IniRead, 4x10, F4 Keys.ahk, Saved, 4x10
IniRead, 4x11, F4 Keys.ahk, Saved, 4x11
IniRead, 4x12, F4 Keys.ahk, Saved, 4x12
IniRead, 4x13, F4 Keys.ahk, Saved, 4x13
IniRead, 4x14, F4 Keys.ahk, Saved, 4x14
IniRead, 4x15, F4 Keys.ahk, Saved, 4x15
IniRead, 1x1Text, F4 Keys.ahk, Saved, 1x1Text
IniRead, 1x2Text, F4 Keys.ahk, Saved, 1x2Text
IniRead, 1x3Text, F4 Keys.ahk, Saved, 1x3Text
IniRead, 1x4Text, F4 Keys.ahk, Saved, 1x4Text
IniRead, 1x5Text, F4 Keys.ahk, Saved, 1x5Text
IniRead, 1x6Text, F4 Keys.ahk, Saved, 1x6Text
IniRead, 1x7Text, F4 Keys.ahk, Saved, 1x7Text
IniRead, 1x8Text, F4 Keys.ahk, Saved, 1x8Text
IniRead, 1x9Text, F4 Keys.ahk, Saved, 1x9Text
IniRead, 1x10Text, F4 Keys.ahk, Saved, 1x10Text
IniRead, 1x11Text, F4 Keys.ahk, Saved, 1x11Text
IniRead, 1x12Text, F4 Keys.ahk, Saved, 1x12Text
IniRead, 1x13Text, F4 Keys.ahk, Saved, 1x13Text
IniRead, 1x14Text, F4 Keys.ahk, Saved, 1x14Text
IniRead, 1x15Text, F4 Keys.ahk, Saved, 1x15Text
IniRead, 2x1Text, F4 Keys.ahk, Saved, 2x1Text
IniRead, 2x2Text, F4 Keys.ahk, Saved, 2x2Text
IniRead, 2x3Text, F4 Keys.ahk, Saved, 2x3Text
IniRead, 2x4Text, F4 Keys.ahk, Saved, 2x4Text
IniRead, 2x5Text, F4 Keys.ahk, Saved, 2x5Text
IniRead, 2x6Text, F4 Keys.ahk, Saved, 2x6Text
IniRead, 2x7Text, F4 Keys.ahk, Saved, 2x7Text
IniRead, 2x8Text, F4 Keys.ahk, Saved, 2x8Text
IniRead, 2x9Text, F4 Keys.ahk, Saved, 2x9Text
IniRead, 2x10Text, F4 Keys.ahk, Saved, 2x10Text
IniRead, 2x11Text, F4 Keys.ahk, Saved, 2x11Text
IniRead, 2x12Text, F4 Keys.ahk, Saved, 2x12Text
IniRead, 2x13Text, F4 Keys.ahk, Saved, 2x13Text
IniRead, 2x14Text, F4 Keys.ahk, Saved, 2x14Text
IniRead, 2x15Text, F4 Keys.ahk, Saved, 2x15Text
IniRead, 3x1Text, F4 Keys.ahk, Saved, 3x1Text
IniRead, 3x2Text, F4 Keys.ahk, Saved, 3x2Text
IniRead, 3x3Text, F4 Keys.ahk, Saved, 3x3Text
IniRead, 3x4Text, F4 Keys.ahk, Saved, 3x4Text
IniRead, 3x5Text, F4 Keys.ahk, Saved, 3x5Text
IniRead, 3x6Text, F4 Keys.ahk, Saved, 3x6Text
IniRead, 3x7Text, F4 Keys.ahk, Saved, 3x7Text
IniRead, 3x8Text, F4 Keys.ahk, Saved, 3x8Text
IniRead, 3x9Text, F4 Keys.ahk, Saved, 3x9Text
IniRead, 3x10Text, F4 Keys.ahk, Saved, 3x10Text
IniRead, 3x11Text, F4 Keys.ahk, Saved, 3x11Text
IniRead, 3x12Text, F4 Keys.ahk, Saved, 3x12Text
IniRead, 3x13Text, F4 Keys.ahk, Saved, 3x13Text
IniRead, 3x14Text, F4 Keys.ahk, Saved, 3x14Text
IniRead, 3x15Text, F4 Keys.ahk, Saved, 3x15Text
IniRead, 4x1Text, F4 Keys.ahk, Saved, 4x1Text
IniRead, 4x2Text, F4 Keys.ahk, Saved, 4x2Text
IniRead, 4x3Text, F4 Keys.ahk, Saved, 4x3Text
IniRead, 4x4Text, F4 Keys.ahk, Saved, 4x4Text
IniRead, 4x5Text, F4 Keys.ahk, Saved, 4x5Text
IniRead, 4x6Text, F4 Keys.ahk, Saved, 4x6Text
IniRead, 4x7Text, F4 Keys.ahk, Saved, 4x7Text
IniRead, 4x8Text, F4 Keys.ahk, Saved, 4x8Text
IniRead, 4x9Text, F4 Keys.ahk, Saved, 4x9Text
IniRead, 4x10Text, F4 Keys.ahk, Saved, 4x10Text
IniRead, 4x11Text, F4 Keys.ahk, Saved, 4x11Text
IniRead, 4x12Text, F4 Keys.ahk, Saved, 4x12Text
IniRead, 4x13Text, F4 Keys.ahk, Saved, 4x13Text
IniRead, 4x14Text, F4 Keys.ahk, Saved, 4x14Text
IniRead, 4x15Text, F4 Keys.ahk, Saved, 4x15Text
IniRead, 1x1Hidden, F4 Keys.ahk, Saved, 1x1Hidden
IniRead, 1x2Hidden, F4 Keys.ahk, Saved, 1x2Hidden
IniRead, 1x3Hidden, F4 Keys.ahk, Saved, 1x3Hidden
IniRead, 1x4Hidden, F4 Keys.ahk, Saved, 1x4Hidden
IniRead, 1x5Hidden, F4 Keys.ahk, Saved, 1x5Hidden
IniRead, 1x6Hidden, F4 Keys.ahk, Saved, 1x6Hidden
IniRead, 1x7Hidden, F4 Keys.ahk, Saved, 1x7Hidden
IniRead, 1x8Hidden, F4 Keys.ahk, Saved, 1x8Hidden
IniRead, 1x9Hidden, F4 Keys.ahk, Saved, 1x9Hidden
IniRead, 1x10Hidden, F4 Keys.ahk, Saved, 1x10Hidden
IniRead, 1x11Hidden, F4 Keys.ahk, Saved, 1x11Hidden
IniRead, 1x12Hidden, F4 Keys.ahk, Saved, 1x12Hidden
IniRead, 1x13Hidden, F4 Keys.ahk, Saved, 1x13Hidden
IniRead, 1x14Hidden, F4 Keys.ahk, Saved, 1x14Hidden
IniRead, 1x15Hidden, F4 Keys.ahk, Saved, 1x15Hidden
IniRead, 2x1Hidden, F4 Keys.ahk, Saved, 2x1Hidden
IniRead, 2x2Hidden, F4 Keys.ahk, Saved, 2x2Hidden
IniRead, 2x3Hidden, F4 Keys.ahk, Saved, 2x3Hidden
IniRead, 2x4Hidden, F4 Keys.ahk, Saved, 2x4Hidden
IniRead, 2x5Hidden, F4 Keys.ahk, Saved, 2x5Hidden
IniRead, 2x6Hidden, F4 Keys.ahk, Saved, 2x6Hidden
IniRead, 2x7Hidden, F4 Keys.ahk, Saved, 2x7Hidden
IniRead, 2x8Hidden, F4 Keys.ahk, Saved, 2x8Hidden
IniRead, 2x9Hidden, F4 Keys.ahk, Saved, 2x9Hidden
IniRead, 2x10Hidden, F4 Keys.ahk, Saved, 2x10Hidden
IniRead, 2x11Hidden, F4 Keys.ahk, Saved, 2x11Hidden
IniRead, 2x12Hidden, F4 Keys.ahk, Saved, 2x12Hidden
IniRead, 2x13Hidden, F4 Keys.ahk, Saved, 2x13Hidden
IniRead, 2x14Hidden, F4 Keys.ahk, Saved, 2x14Hidden
IniRead, 2x15Hidden, F4 Keys.ahk, Saved, 2x15Hidden
IniRead, 3x1Hidden, F4 Keys.ahk, Saved, 3x1Hidden
IniRead, 3x2Hidden, F4 Keys.ahk, Saved, 3x2Hidden
IniRead, 3x3Hidden, F4 Keys.ahk, Saved, 3x3Hidden
IniRead, 3x4Hidden, F4 Keys.ahk, Saved, 3x4Hidden
IniRead, 3x5Hidden, F4 Keys.ahk, Saved, 3x5Hidden
IniRead, 3x6Hidden, F4 Keys.ahk, Saved, 3x6Hidden
IniRead, 3x7Hidden, F4 Keys.ahk, Saved, 3x7Hidden
IniRead, 3x8Hidden, F4 Keys.ahk, Saved, 3x8Hidden
IniRead, 3x9Hidden, F4 Keys.ahk, Saved, 3x9Hidden
IniRead, 3x10Hidden, F4 Keys.ahk, Saved, 3x10Hidden
IniRead, 3x11Hidden, F4 Keys.ahk, Saved, 3x11Hidden
IniRead, 3x12Hidden, F4 Keys.ahk, Saved, 3x12Hidden
IniRead, 3x13Hidden, F4 Keys.ahk, Saved, 3x13Hidden
IniRead, 3x14Hidden, F4 Keys.ahk, Saved, 3x14Hidden
IniRead, 3x15Hidden, F4 Keys.ahk, Saved, 3x15Hidden
IniRead, 4x1Hidden, F4 Keys.ahk, Saved, 4x1Hidden
IniRead, 4x2Hidden, F4 Keys.ahk, Saved, 4x2Hidden
IniRead, 4x3Hidden, F4 Keys.ahk, Saved, 4x3Hidden
IniRead, 4x4Hidden, F4 Keys.ahk, Saved, 4x4Hidden
IniRead, 4x5Hidden, F4 Keys.ahk, Saved, 4x5Hidden
IniRead, 4x6Hidden, F4 Keys.ahk, Saved, 4x6Hidden
IniRead, 4x7Hidden, F4 Keys.ahk, Saved, 4x7Hidden
IniRead, 4x8Hidden, F4 Keys.ahk, Saved, 4x8Hidden
IniRead, 4x9Hidden, F4 Keys.ahk, Saved, 4x9Hidden
IniRead, 4x10Hidden, F4 Keys.ahk, Saved, 4x10Hidden
IniRead, 4x11Hidden, F4 Keys.ahk, Saved, 4x11Hidden
IniRead, 4x12Hidden, F4 Keys.ahk, Saved, 4x12Hidden
IniRead, 4x13Hidden, F4 Keys.ahk, Saved, 4x13Hidden
IniRead, 4x14Hidden, F4 Keys.ahk, Saved, 4x14Hidden
IniRead, 4x15Hidden, F4 Keys.ahk, Saved, 4x15Hidden
IniRead, FKeysPosX, F4 Keys.ahk, Position, FKeysPosX
	if FKeysPosX = ERROR
		FKeysPosX = 0
IniRead, FKeysPosY, F4 Keys.ahk, Position, FKeysPosY
	if FKeysPosY = ERROR
		FKeysPosY = 0
IniRead, CurrentSet, F4 Keys.ahk, Set, CurrentSet
	if CurrentSet = ERROR
		{
		CurrentSet = 1
		IniWrite, 1, F4 Keys.ahk, Set, CurrentSet
		IniRead, CurrentSet, F4 Keys.ahk, Set, CurrentSet
		}
IniRead, toggleM, F4 Keys.ahk, Aspect, Horizontal
	if toggleM = ERROR
		toggleM = 1

Gui, Font, s8, Tahoma
Gui, +AlwaysOnTop +ToolWindow   -Caption
	;  Buttons 1 - 4
	
if (toggleM = 1)
	{	
Gui, Add, Button, %Slot1% w50 h50 Center v1x1  g1x1,  %1x1Text% ; Button1
Gui, Add, Button, %Slot2% w50 h50 Center v1x2  g1x2,  %1x2Text%
Gui, Add, Button, %Slot3% w50 h50 Center v1x3  g1x3,  %1x3Text%
Gui, Add, Button, %Slot4% w50 h50 Center v1x4  g1x4,  %1x4Text%
Gui, Add, Button, %Slot5% w50 h50 Center v1x5  g1x5,  %1x5Text%
Gui, Add, Button, %Slot6% w50 h50 Center v1x6  g1x6,  %1x6Text%
Gui, Add, Button, %Slot7% w50 h50 Center v1x7  g1x7,  %1x7Text%
Gui, Add, Button, %Slot8% w50 h50 Center v1x8  g1x8,  %1x8Text%
Gui, Add, Button, %Slot9% w50 h50 Center v1x9  g1x9,  %1x9Text%
Gui, Add, Button, %Slot10% w50 h50 Center v1x10 g1x10, %1x10Text%
Gui, Add, Button, %Slot11% w50 h50 Center v1x11 g1x11, %1x11Text%
Gui, Add, Button, %Slot12% w50 h50 Center v1x12 g1x12, %1x12Text%
Gui, Add, Button, %Slot13% w50 h50 Center v1x13 g1x13, %1x13Text%
Gui, Add, Button, %Slot14% w50 h50 Center v1x14 g1x14, %1x14Text%
Gui, Add, Button, %Slot15% w50 h50 Center v1x15 g1x15, %1x15Text% ; Button15
	}
else 
	{	
Gui, Add, Button, %SlotVert1% w50 h50 Center v1x1  g1x1,  %1x1Text% ; Button1
Gui, Add, Button, %SlotVert2% w50 h50 Center v1x2  g1x2,  %1x2Text%
Gui, Add, Button, %SlotVert3% w50 h50 Center v1x3  g1x3,  %1x3Text%
Gui, Add, Button, %SlotVert4% w50 h50 Center v1x4  g1x4,  %1x4Text%
Gui, Add, Button, %SlotVert5% w50 h50 Center v1x5  g1x5,  %1x5Text%
Gui, Add, Button, %SlotVert6% w50 h50 Center v1x6  g1x6,  %1x6Text%
Gui, Add, Button, %SlotVert7% w50 h50 Center v1x7  g1x7,  %1x7Text%
Gui, Add, Button, %SlotVert8% w50 h50 Center v1x8  g1x8,  %1x8Text%
Gui, Add, Button, %SlotVert9% w50 h50 Center v1x9  g1x9,  %1x9Text%
Gui, Add, Button, %SlotVert10% w50 h50 Center v1x10 g1x10, %1x10Text%
Gui, Add, Button, %SlotVert11% w50 h50 Center v1x11 g1x11, %1x11Text%
Gui, Add, Button, %SlotVert12% w50 h50 Center v1x12 g1x12, %1x12Text%
Gui, Add, Button, %SlotVert13% w50 h50 Center v1x13 g1x13, %1x13Text%
Gui, Add, Button, %SlotVert14% w50 h50 Center v1x14 g1x14, %1x14Text%
Gui, Add, Button, %SlotVert15% w50 h50 Center v1x15 g1x15, %1x15Text% ; Button15
	}
	
Gui, Add, Button, x-55 y5 w50 h50 Center v2x1  g2x1,  %2x1Text% ; Button16
Gui, Add, Button, x-55 y5 w50 h50 Center v2x2  g2x2,  %2x2Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v2x3  g2x3,  %2x3Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v2x4  g2x4,  %2x4Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v2x5  g2x5,  %2x5Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v2x6  g2x6,  %2x6Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v2x7  g2x7,  %2x7Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v2x8  g2x8,  %2x8Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v2x9  g2x9,  %2x9Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v2x10 g2x10, %2x10Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v2x11 g2x11, %2x11Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v2x12 g2x12, %2x12Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v2x13 g2x13, %2x13Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v2x14 g2x14, %2x14Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v2x15 g2x15, %2x15Text% ; Button30

Gui, Add, Button, x-55 y5 w50 h50 Center v3x1  g3x1,  %3x1Text%  ; Button31
Gui, Add, Button, x-55 y5 w50 h50 Center v3x2  g3x2,  %3x2Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v3x3  g3x3,  %3x3Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v3x4  g3x4,  %3x4Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v3x5  g3x5,  %3x5Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v3x6  g3x6,  %3x6Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v3x7  g3x7,  %3x7Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v3x8  g3x8,  %3x8Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v3x9  g3x9,  %3x9Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v3x10 g3x10, %3x10Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v3x11 g3x11, %3x11Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v3x12 g3x12, %3x12Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v3x13 g3x13, %3x13Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v3x14 g3x14, %3x14Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v3x15 g3x15, %3x15Text% ; Button45

Gui, Add, Button, x-55 y5 w50 h50 Center v4x1  g4x1,  %4x1Text%  ; Button46
Gui, Add, Button, x-55 y5 w50 h50 Center v4x2  g4x2,  %4x2Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v4x3  g4x3,  %4x3Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v4x4  g4x4,  %4x4Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v4x5  g4x5,  %4x5Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v4x6  g4x6,  %4x6Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v4x7  g4x7,  %4x7Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v4x8  g4x8,  %4x8Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v4x9  g4x9,  %4x9Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v4x10 g4x10, %4x10Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v4x11 g4x11, %4x11Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v4x12 g4x12, %4x12Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v4x13 g4x13, %4x13Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v4x14 g4x14, %4x14Text%
Gui, Add, Button, x-55 y5 w50 h50 Center v4x15 g4x15, %4x15Text%    ; Button60

	;Gui, Add, Picture,x5 y5  w50 h20 gPicture, top-left4.png
Gui, Add, Picture,x5  y5 w50 h18 Center   gPicture, DRAG.png
Gui, Add, Button, x5  y40 w35 h15 Center  gUnhide, Show
Gui, Add, Button, x5  y23  w13 h18 gSet1, 1
Gui, Add, Button, x17 y23  w13 h18 gSet2, 2
Gui, Add, Button, x29 y23  w14 h18 gSet3, 3
Gui, Add, Button, x42 y23  w13 h18 gSet4, 4
Gui, Add, Button, x40 y40 w15 h15 Center gRotate,↻ ; {U+21BB}
Gui, Add, Checkbox, x0 y0 vPauseCheck gPauseTimer, 
Gui, Color, ABCDEF,  F4 Keys.ahk	
gosub CheckHidden

if CurrentSet = 1
	gosub Set1
if CurrentSet = 2
	gosub Set2
if CurrentSet = 3
	gosub Set3
if CurrentSet = 4
	gosub Set4
	
if (toggleM = 1)
	Gui, Show, h55 w830 x%FKeysPosX% y%FKeysPosY%	, F4 Keys.ahk	
else
	Gui, Show, h830 w55 x%FKeysPosX% y%FKeysPosY%	, F4 Keys.ahk	

WinSet, Transcolor, ABCDEF, F4 Keys.ahk
WinMove, F4 Keys.ahk, x%FKeysPosX% y%FKeysPosY%	
WinActivate, ahk_class IEFrame
return


IsNotepadActive:
	ifWinActive ahk_class AutoHotkeyGUI, ↻
		{
		WinActivate, ahk_class IEFrame
		return
		}
	ifWinActive ahk_class IEFrame
		{
		IniRead, FKeysPosX, F4 Keys.ahk, Position, FKeysPosX
		IniRead, FKeysPosY, F4 Keys.ahk, Position, FKeysPosY	
		;WinMove, ahk_class AutoHotkeyGUI, ↻, 0, 0
		;Sleep 500
		WinMove, ahk_class AutoHotkeyGUI, ↻, %FKeysPosX%, %FKeysPosY%
		WinActivate, ahk_class IEFrame
		}
	ifWinNotActive ahk_class IEFrame
		{
		WinMove, ahk_class AutoHotkeyGUI, ↻, -2000, -2000
		}
return

PauseTimer:
Gui, Submit, NoHide
;MsgBox, PauseCheck = %PauseCheck%
if PauseCheck = 1
	SetTimer, IsNotepadActive, Off
if PauseCheck = 0
	{
	WinGetPos, FKeysPosX, FKeysPosY, , , F4 Keys.ahk,
	IniWrite, %FKeysPosX%, F4 Keys.ahk, Position, FKeysPosX
	IniWrite, %FKeysPosY%, F4 Keys.ahk, Position, FKeysPosY
	Sleep 1000
	SetTimer, IsNotepadActive, On
	}
return


Rotate:
IniRead, CurrentSet, F4 Keys.ahk, Set, CurrentSet
IniRead, toggleM, F4 Keys.ahk, Aspect, Horizontal
    ;toggleM    := !toggleM
if (toggleM = 1)
	{
	if CurrentSet = 1
		{
        GuiControl, Move, Button1  ,% SlotVert1
        GuiControl, Move, Button2  ,% SlotVert2
        GuiControl, Move, Button3  ,% SlotVert3
        GuiControl, Move, Button4  ,% SlotVert4
        GuiControl, Move, Button5  ,% SlotVert5
        GuiControl, Move, Button6  ,% SlotVert6
        GuiControl, Move, Button7  ,% SlotVert7
        GuiControl, Move, Button8  ,% SlotVert8
        GuiControl, Move, Button9  ,% SlotVert9
        GuiControl, Move, Button10 ,% SlotVert10
        GuiControl, Move, Button11 ,% SlotVert11
        GuiControl, Move, Button12 ,% SlotVert12
        GuiControl, Move, Button13 ,% SlotVert13
        GuiControl, Move, Button14 ,% SlotVert14
        GuiControl, Move, Button15 ,% SlotVert15
        GuiControl, Move, Button16 ,% SlotHide1
        GuiControl, Move, Button17 ,% SlotHide2
        GuiControl, Move, Button18 ,% SlotHide3
        GuiControl, Move, Button19 ,% SlotHide4
        GuiControl, Move, Button20 ,% SlotHide5
        GuiControl, Move, Button21 ,% SlotHide6
        GuiControl, Move, Button22 ,% SlotHide7
        GuiControl, Move, Button23 ,% SlotHide8
        GuiControl, Move, Button24 ,% SlotHide9
        GuiControl, Move, Button25 ,% SlotHide10
        GuiControl, Move, Button26 ,% SlotHide11
        GuiControl, Move, Button27 ,% SlotHide12
        GuiControl, Move, Button28 ,% SlotHide13
        GuiControl, Move, Button29 ,% SlotHide14
        GuiControl, Move, Button30 ,% SlotHide15
        GuiControl, Move, Button31 ,% SlotHide1
        GuiControl, Move, Button32 ,% SlotHide2
        GuiControl, Move, Button33 ,% SlotHide3
        GuiControl, Move, Button34 ,% SlotHide4
        GuiControl, Move, Button35 ,% SlotHide5
        GuiControl, Move, Button36 ,% SlotHide6
        GuiControl, Move, Button37 ,% SlotHide7
        GuiControl, Move, Button38 ,% SlotHide8
        GuiControl, Move, Button39 ,% SlotHide9
        GuiControl, Move, Button40 ,% SlotHide10
        GuiControl, Move, Button41 ,% SlotHide11
        GuiControl, Move, Button42 ,% SlotHide12
        GuiControl, Move, Button43 ,% SlotHide13
        GuiControl, Move, Button44 ,% SlotHide14
        GuiControl, Move, Button45 ,% SlotHide15
        GuiControl, Move, Button46 ,% SlotHide1
        GuiControl, Move, Button47 ,% SlotHide2
        GuiControl, Move, Button48 ,% SlotHide3
        GuiControl, Move, Button49 ,% SlotHide4
        GuiControl, Move, Button50 ,% SlotHide5
        GuiControl, Move, Button51 ,% SlotHide6
        GuiControl, Move, Button52 ,% SlotHide7
        GuiControl, Move, Button53 ,% SlotHide8
        GuiControl, Move, Button54 ,% SlotHide9
        GuiControl, Move, Button55 ,% SlotHide10
        GuiControl, Move, Button56 ,% SlotHide11
        GuiControl, Move, Button57 ,% SlotHide12
        GuiControl, Move, Button58 ,% SlotHide13
        GuiControl, Move, Button59 ,% SlotHide14
        GuiControl, Move, Button60 ,% SlotHide15
		}
	if CurrentSet = 2
		{
        GuiControl, Move, Button1  ,% SlotHide1
        GuiControl, Move, Button2  ,% SlotHide2
        GuiControl, Move, Button3  ,% SlotHide3
        GuiControl, Move, Button4  ,% SlotHide4
        GuiControl, Move, Button5  ,% SlotHide5
        GuiControl, Move, Button6  ,% SlotHide6
        GuiControl, Move, Button7  ,% SlotHide7
        GuiControl, Move, Button8  ,% SlotHide8
        GuiControl, Move, Button9  ,% SlotHide9
        GuiControl, Move, Button10 ,% SlotHide10
        GuiControl, Move, Button11 ,% SlotHide11
        GuiControl, Move, Button12 ,% SlotHide12
        GuiControl, Move, Button13 ,% SlotHide13
        GuiControl, Move, Button14 ,% SlotHide14
        GuiControl, Move, Button15 ,% SlotHide15
        GuiControl, Move, Button16 ,% SlotVert1
        GuiControl, Move, Button17 ,% SlotVert2
        GuiControl, Move, Button18 ,% SlotVert3
        GuiControl, Move, Button19 ,% SlotVert4
        GuiControl, Move, Button20 ,% SlotVert5
        GuiControl, Move, Button21 ,% SlotVert6
        GuiControl, Move, Button22 ,% SlotVert7
        GuiControl, Move, Button23 ,% SlotVert8
        GuiControl, Move, Button24 ,% SlotVert9
        GuiControl, Move, Button25 ,% SlotVert10
        GuiControl, Move, Button26 ,% SlotVert11
        GuiControl, Move, Button27 ,% SlotVert12
        GuiControl, Move, Button28 ,% SlotVert13
        GuiControl, Move, Button29 ,% SlotVert14
        GuiControl, Move, Button30 ,% SlotVert15
        GuiControl, Move, Button31 ,% SlotHide1
        GuiControl, Move, Button32 ,% SlotHide2
        GuiControl, Move, Button33 ,% SlotHide3
        GuiControl, Move, Button34 ,% SlotHide4
        GuiControl, Move, Button35 ,% SlotHide5
        GuiControl, Move, Button36 ,% SlotHide6
        GuiControl, Move, Button37 ,% SlotHide7
        GuiControl, Move, Button38 ,% SlotHide8
        GuiControl, Move, Button39 ,% SlotHide9
        GuiControl, Move, Button40 ,% SlotHide10
        GuiControl, Move, Button41 ,% SlotHide11
        GuiControl, Move, Button42 ,% SlotHide12
        GuiControl, Move, Button43 ,% SlotHide13
        GuiControl, Move, Button44 ,% SlotHide14
        GuiControl, Move, Button45 ,% SlotHide15
        GuiControl, Move, Button46 ,% SlotHide1
        GuiControl, Move, Button47 ,% SlotHide2
        GuiControl, Move, Button48 ,% SlotHide3
        GuiControl, Move, Button49 ,% SlotHide4
        GuiControl, Move, Button50 ,% SlotHide5
        GuiControl, Move, Button51 ,% SlotHide6
        GuiControl, Move, Button52 ,% SlotHide7
        GuiControl, Move, Button53 ,% SlotHide8
        GuiControl, Move, Button54 ,% SlotHide9
        GuiControl, Move, Button55 ,% SlotHide10
        GuiControl, Move, Button56 ,% SlotHide11
        GuiControl, Move, Button57 ,% SlotHide12
        GuiControl, Move, Button58 ,% SlotHide13
        GuiControl, Move, Button59 ,% SlotHide14
        GuiControl, Move, Button60 ,% SlotHide15
		}
	if CurrentSet = 3
		{
        GuiControl, Move, Button1  ,% SlotHide1
        GuiControl, Move, Button2  ,% SlotHide2
        GuiControl, Move, Button3  ,% SlotHide3
        GuiControl, Move, Button4  ,% SlotHide4
        GuiControl, Move, Button5  ,% SlotHide5
        GuiControl, Move, Button6  ,% SlotHide6
        GuiControl, Move, Button7  ,% SlotHide7
        GuiControl, Move, Button8  ,% SlotHide8
        GuiControl, Move, Button9  ,% SlotHide9
        GuiControl, Move, Button10 ,% SlotHide10
        GuiControl, Move, Button11 ,% SlotHide11
        GuiControl, Move, Button12 ,% SlotHide12
        GuiControl, Move, Button13 ,% SlotHide13
        GuiControl, Move, Button14 ,% SlotHide14
        GuiControl, Move, Button15 ,% SlotHide15
        GuiControl, Move, Button16 ,% SlotHide1
        GuiControl, Move, Button17 ,% SlotHide2
        GuiControl, Move, Button18 ,% SlotHide3
        GuiControl, Move, Button19 ,% SlotHide4
        GuiControl, Move, Button20 ,% SlotHide5
        GuiControl, Move, Button21 ,% SlotHide6
        GuiControl, Move, Button22 ,% SlotHide7
        GuiControl, Move, Button23 ,% SlotHide8
        GuiControl, Move, Button24 ,% SlotHide9
        GuiControl, Move, Button25 ,% SlotHide10
        GuiControl, Move, Button26 ,% SlotHide11
        GuiControl, Move, Button27 ,% SlotHide12
        GuiControl, Move, Button28 ,% SlotHide13
        GuiControl, Move, Button29 ,% SlotHide14
        GuiControl, Move, Button30 ,% SlotHide15
        GuiControl, Move, Button31 ,% SlotVert1
        GuiControl, Move, Button32 ,% SlotVert2
        GuiControl, Move, Button33 ,% SlotVert3
        GuiControl, Move, Button34 ,% SlotVert4
        GuiControl, Move, Button35 ,% SlotVert5
        GuiControl, Move, Button36 ,% SlotVert6
        GuiControl, Move, Button37 ,% SlotVert7
        GuiControl, Move, Button38 ,% SlotVert8
        GuiControl, Move, Button39 ,% SlotVert9
        GuiControl, Move, Button40 ,% SlotVert10
        GuiControl, Move, Button41 ,% SlotVert11
        GuiControl, Move, Button42 ,% SlotVert12
        GuiControl, Move, Button43 ,% SlotVert13
        GuiControl, Move, Button44 ,% SlotVert14
        GuiControl, Move, Button45 ,% SlotVert15
        GuiControl, Move, Button46 ,% SlotHide1
        GuiControl, Move, Button47 ,% SlotHide2
        GuiControl, Move, Button48 ,% SlotHide3
        GuiControl, Move, Button49 ,% SlotHide4
        GuiControl, Move, Button50 ,% SlotHide5
        GuiControl, Move, Button51 ,% SlotHide6
        GuiControl, Move, Button52 ,% SlotHide7
        GuiControl, Move, Button53 ,% SlotHide8
        GuiControl, Move, Button54 ,% SlotHide9
        GuiControl, Move, Button55 ,% SlotHide10
        GuiControl, Move, Button56 ,% SlotHide11
        GuiControl, Move, Button57 ,% SlotHide12
        GuiControl, Move, Button58 ,% SlotHide13
        GuiControl, Move, Button59 ,% SlotHide14
        GuiControl, Move, Button60 ,% SlotHide15
		}
	if CurrentSet = 4
		{
        GuiControl, Move, Button1  ,% SlotHide1
        GuiControl, Move, Button2  ,% SlotHide2
        GuiControl, Move, Button3  ,% SlotHide3
        GuiControl, Move, Button4  ,% SlotHide4
        GuiControl, Move, Button5  ,% SlotHide5
        GuiControl, Move, Button6  ,% SlotHide6
        GuiControl, Move, Button7  ,% SlotHide7
        GuiControl, Move, Button8  ,% SlotHide8
        GuiControl, Move, Button9  ,% SlotHide9
        GuiControl, Move, Button10 ,% SlotHide10
        GuiControl, Move, Button11 ,% SlotHide11
        GuiControl, Move, Button12 ,% SlotHide12
        GuiControl, Move, Button13 ,% SlotHide13
        GuiControl, Move, Button14 ,% SlotHide14
        GuiControl, Move, Button15 ,% SlotHide15
        GuiControl, Move, Button16 ,% SlotHide1
        GuiControl, Move, Button17 ,% SlotHide2
        GuiControl, Move, Button18 ,% SlotHide3
        GuiControl, Move, Button19 ,% SlotHide4
        GuiControl, Move, Button20 ,% SlotHide5
        GuiControl, Move, Button21 ,% SlotHide6
        GuiControl, Move, Button22 ,% SlotHide7
        GuiControl, Move, Button23 ,% SlotHide8
        GuiControl, Move, Button24 ,% SlotHide9
        GuiControl, Move, Button25 ,% SlotHide10
        GuiControl, Move, Button26 ,% SlotHide11
        GuiControl, Move, Button27 ,% SlotHide12
        GuiControl, Move, Button28 ,% SlotHide13
        GuiControl, Move, Button29 ,% SlotHide14
        GuiControl, Move, Button30 ,% SlotHide15
        GuiControl, Move, Button31 ,% SlotHide1
        GuiControl, Move, Button32 ,% SlotHide2
        GuiControl, Move, Button33 ,% SlotHide3
        GuiControl, Move, Button34 ,% SlotHide4
        GuiControl, Move, Button35 ,% SlotHide5
        GuiControl, Move, Button36 ,% SlotHide6
        GuiControl, Move, Button37 ,% SlotHide7
        GuiControl, Move, Button38 ,% SlotHide8
        GuiControl, Move, Button39 ,% SlotHide9
        GuiControl, Move, Button40 ,% SlotHide10
        GuiControl, Move, Button41 ,% SlotHide11
        GuiControl, Move, Button42 ,% SlotHide12
        GuiControl, Move, Button43 ,% SlotHide13
        GuiControl, Move, Button44 ,% SlotHide14
        GuiControl, Move, Button45 ,% SlotHide15
        GuiControl, Move, Button46 ,% SlotVert1
        GuiControl, Move, Button47 ,% SlotVert2
        GuiControl, Move, Button48 ,% SlotVert3
        GuiControl, Move, Button49 ,% SlotVert4
        GuiControl, Move, Button50 ,% SlotVert5
        GuiControl, Move, Button51 ,% SlotVert6
        GuiControl, Move, Button52 ,% SlotVert7
        GuiControl, Move, Button53 ,% SlotVert8
        GuiControl, Move, Button54 ,% SlotVert9
        GuiControl, Move, Button55 ,% SlotVert10
        GuiControl, Move, Button56 ,% SlotVert11
        GuiControl, Move, Button57 ,% SlotVert12
        GuiControl, Move, Button58 ,% SlotVert13
        GuiControl, Move, Button59 ,% SlotVert14
        GuiControl, Move, Button60 ,% SlotVert15
		}
Gui, Show, h830 w830
IniWrite, 0, F4 Keys.ahk, Aspect, Horizontal
WinActivate, ahk_class IEFrame
    }
if (toggleM = 0)
	{
	if CurrentSet = 1
		{
        GuiControl, Move, Button1  ,% Slot1
        GuiControl, Move, Button2  ,% Slot2
        GuiControl, Move, Button3  ,% Slot3
        GuiControl, Move, Button4  ,% Slot4
        GuiControl, Move, Button5  ,% Slot5
        GuiControl, Move, Button6  ,% Slot6
        GuiControl, Move, Button7  ,% Slot7
        GuiControl, Move, Button8  ,% Slot8
        GuiControl, Move, Button9  ,% Slot9
        GuiControl, Move, Button10 ,% Slot10
        GuiControl, Move, Button11 ,% Slot11
        GuiControl, Move, Button12 ,% Slot12
        GuiControl, Move, Button13 ,% Slot13
        GuiControl, Move, Button14 ,% Slot14
        GuiControl, Move, Button15 ,% Slot15
        GuiControl, Move, Button16 ,% SlotHide1
        GuiControl, Move, Button17 ,% SlotHide2
        GuiControl, Move, Button18 ,% SlotHide3
        GuiControl, Move, Button19 ,% SlotHide4
        GuiControl, Move, Button20 ,% SlotHide5
        GuiControl, Move, Button21 ,% SlotHide6
        GuiControl, Move, Button22 ,% SlotHide7
        GuiControl, Move, Button23 ,% SlotHide8
        GuiControl, Move, Button24 ,% SlotHide9
        GuiControl, Move, Button25 ,% SlotHide10
        GuiControl, Move, Button26 ,% SlotHide11
        GuiControl, Move, Button27 ,% SlotHide12
        GuiControl, Move, Button28 ,% SlotHide13
        GuiControl, Move, Button29 ,% SlotHide14
        GuiControl, Move, Button30 ,% SlotHide15
        GuiControl, Move, Button31 ,% SlotHide1
        GuiControl, Move, Button32 ,% SlotHide2
        GuiControl, Move, Button33 ,% SlotHide3
        GuiControl, Move, Button34 ,% SlotHide4
        GuiControl, Move, Button35 ,% SlotHide5
        GuiControl, Move, Button36 ,% SlotHide6
        GuiControl, Move, Button37 ,% SlotHide7
        GuiControl, Move, Button38 ,% SlotHide8
        GuiControl, Move, Button39 ,% SlotHide9
        GuiControl, Move, Button40 ,% SlotHide10
        GuiControl, Move, Button41 ,% SlotHide11
        GuiControl, Move, Button42 ,% SlotHide12
        GuiControl, Move, Button43 ,% SlotHide13
        GuiControl, Move, Button44 ,% SlotHide14
        GuiControl, Move, Button45 ,% SlotHide15
        GuiControl, Move, Button46 ,% SlotHide1
        GuiControl, Move, Button47 ,% SlotHide2
        GuiControl, Move, Button48 ,% SlotHide3
        GuiControl, Move, Button49 ,% SlotHide4
        GuiControl, Move, Button50 ,% SlotHide5
        GuiControl, Move, Button51 ,% SlotHide6
        GuiControl, Move, Button52 ,% SlotHide7
        GuiControl, Move, Button53 ,% SlotHide8
        GuiControl, Move, Button54 ,% SlotHide9
        GuiControl, Move, Button55 ,% SlotHide10
        GuiControl, Move, Button56 ,% SlotHide11
        GuiControl, Move, Button57 ,% SlotHide12
        GuiControl, Move, Button58 ,% SlotHide13
        GuiControl, Move, Button59 ,% SlotHide14
        GuiControl, Move, Button60 ,% SlotHide15
		}
	if CurrentSet = 2
		{
        GuiControl, Move, Button1  ,% SlotHide1
        GuiControl, Move, Button2  ,% SlotHide2
        GuiControl, Move, Button3  ,% SlotHide3
        GuiControl, Move, Button4  ,% SlotHide4
        GuiControl, Move, Button5  ,% SlotHide5
        GuiControl, Move, Button6  ,% SlotHide6
        GuiControl, Move, Button7  ,% SlotHide7
        GuiControl, Move, Button8  ,% SlotHide8
        GuiControl, Move, Button9  ,% SlotHide9
        GuiControl, Move, Button10 ,% SlotHide10
        GuiControl, Move, Button11 ,% SlotHide11
        GuiControl, Move, Button12 ,% SlotHide12
        GuiControl, Move, Button13 ,% SlotHide13
        GuiControl, Move, Button14 ,% SlotHide14
        GuiControl, Move, Button15 ,% SlotHide15
        GuiControl, Move, Button16 ,% Slot1
        GuiControl, Move, Button17 ,% Slot2
        GuiControl, Move, Button18 ,% Slot3
        GuiControl, Move, Button19 ,% Slot4
        GuiControl, Move, Button20 ,% Slot5
        GuiControl, Move, Button21 ,% Slot6
        GuiControl, Move, Button22 ,% Slot7
        GuiControl, Move, Button23 ,% Slot8
        GuiControl, Move, Button24 ,% Slot9
        GuiControl, Move, Button25 ,% Slot10
        GuiControl, Move, Button26 ,% Slot11
        GuiControl, Move, Button27 ,% Slot12
        GuiControl, Move, Button28 ,% Slot13
        GuiControl, Move, Button29 ,% Slot14
        GuiControl, Move, Button30 ,% Slot15
        GuiControl, Move, Button31 ,% SlotHide1
        GuiControl, Move, Button32 ,% SlotHide2
        GuiControl, Move, Button33 ,% SlotHide3
        GuiControl, Move, Button34 ,% SlotHide4
        GuiControl, Move, Button35 ,% SlotHide5
        GuiControl, Move, Button36 ,% SlotHide6
        GuiControl, Move, Button37 ,% SlotHide7
        GuiControl, Move, Button38 ,% SlotHide8
        GuiControl, Move, Button39 ,% SlotHide9
        GuiControl, Move, Button40 ,% SlotHide10
        GuiControl, Move, Button41 ,% SlotHide11
        GuiControl, Move, Button42 ,% SlotHide12
        GuiControl, Move, Button43 ,% SlotHide13
        GuiControl, Move, Button44 ,% SlotHide14
        GuiControl, Move, Button45 ,% SlotHide15
        GuiControl, Move, Button46 ,% SlotHide1
        GuiControl, Move, Button47 ,% SlotHide2
        GuiControl, Move, Button48 ,% SlotHide3
        GuiControl, Move, Button49 ,% SlotHide4
        GuiControl, Move, Button50 ,% SlotHide5
        GuiControl, Move, Button51 ,% SlotHide6
        GuiControl, Move, Button52 ,% SlotHide7
        GuiControl, Move, Button53 ,% SlotHide8
        GuiControl, Move, Button54 ,% SlotHide9
        GuiControl, Move, Button55 ,% SlotHide10
        GuiControl, Move, Button56 ,% SlotHide11
        GuiControl, Move, Button57 ,% SlotHide12
        GuiControl, Move, Button58 ,% SlotHide13
        GuiControl, Move, Button59 ,% SlotHide14
        GuiControl, Move, Button60 ,% SlotHide15
		}
	if CurrentSet = 3
		{
        GuiControl, Move, Button1  ,% SlotHide1
        GuiControl, Move, Button2  ,% SlotHide2
        GuiControl, Move, Button3  ,% SlotHide3
        GuiControl, Move, Button4  ,% SlotHide4
        GuiControl, Move, Button5  ,% SlotHide5
        GuiControl, Move, Button6  ,% SlotHide6
        GuiControl, Move, Button7  ,% SlotHide7
        GuiControl, Move, Button8  ,% SlotHide8
        GuiControl, Move, Button9  ,% SlotHide9
        GuiControl, Move, Button10 ,% SlotHide10
        GuiControl, Move, Button11 ,% SlotHide11
        GuiControl, Move, Button12 ,% SlotHide12
        GuiControl, Move, Button13 ,% SlotHide13
        GuiControl, Move, Button14 ,% SlotHide14
        GuiControl, Move, Button15 ,% SlotHide15
        GuiControl, Move, Button16 ,% SlotHide1
        GuiControl, Move, Button17 ,% SlotHide2
        GuiControl, Move, Button18 ,% SlotHide3
        GuiControl, Move, Button19 ,% SlotHide4
        GuiControl, Move, Button20 ,% SlotHide5
        GuiControl, Move, Button21 ,% SlotHide6
        GuiControl, Move, Button22 ,% SlotHide7
        GuiControl, Move, Button23 ,% SlotHide8
        GuiControl, Move, Button24 ,% SlotHide9
        GuiControl, Move, Button25 ,% SlotHide10
        GuiControl, Move, Button26 ,% SlotHide11
        GuiControl, Move, Button27 ,% SlotHide12
        GuiControl, Move, Button28 ,% SlotHide13
        GuiControl, Move, Button29 ,% SlotHide14
        GuiControl, Move, Button30 ,% SlotHide15
        GuiControl, Move, Button31 ,% Slot1
        GuiControl, Move, Button32 ,% Slot2
        GuiControl, Move, Button33 ,% Slot3
        GuiControl, Move, Button34 ,% Slot4
        GuiControl, Move, Button35 ,% Slot5
        GuiControl, Move, Button36 ,% Slot6
        GuiControl, Move, Button37 ,% Slot7
        GuiControl, Move, Button38 ,% Slot8
        GuiControl, Move, Button39 ,% Slot9
        GuiControl, Move, Button40 ,% Slot10
        GuiControl, Move, Button41 ,% Slot11
        GuiControl, Move, Button42 ,% Slot12
        GuiControl, Move, Button43 ,% Slot13
        GuiControl, Move, Button44 ,% Slot14
        GuiControl, Move, Button45 ,% Slot15
        GuiControl, Move, Button46 ,% SlotHide1
        GuiControl, Move, Button47 ,% SlotHide2
        GuiControl, Move, Button48 ,% SlotHide3
        GuiControl, Move, Button49 ,% SlotHide4
        GuiControl, Move, Button50 ,% SlotHide5
        GuiControl, Move, Button51 ,% SlotHide6
        GuiControl, Move, Button52 ,% SlotHide7
        GuiControl, Move, Button53 ,% SlotHide8
        GuiControl, Move, Button54 ,% SlotHide9
        GuiControl, Move, Button55 ,% SlotHide10
        GuiControl, Move, Button56 ,% SlotHide11
        GuiControl, Move, Button57 ,% SlotHide12
        GuiControl, Move, Button58 ,% SlotHide13
        GuiControl, Move, Button59 ,% SlotHide14
        GuiControl, Move, Button60 ,% SlotHide15
		}
	if CurrentSet = 4
		{
        GuiControl, Move, Button1  ,% SlotHide1
        GuiControl, Move, Button2  ,% SlotHide2
        GuiControl, Move, Button3  ,% SlotHide3
        GuiControl, Move, Button4  ,% SlotHide4
        GuiControl, Move, Button5  ,% SlotHide5
        GuiControl, Move, Button6  ,% SlotHide6
        GuiControl, Move, Button7  ,% SlotHide7
        GuiControl, Move, Button8  ,% SlotHide8
        GuiControl, Move, Button9  ,% SlotHide9
        GuiControl, Move, Button10 ,% SlotHide10
        GuiControl, Move, Button11 ,% SlotHide11
        GuiControl, Move, Button12 ,% SlotHide12
        GuiControl, Move, Button13 ,% SlotHide13
        GuiControl, Move, Button14 ,% SlotHide14
        GuiControl, Move, Button15 ,% SlotHide15
        GuiControl, Move, Button16 ,% SlotHide1
        GuiControl, Move, Button17 ,% SlotHide2
        GuiControl, Move, Button18 ,% SlotHide3
        GuiControl, Move, Button19 ,% SlotHide4
        GuiControl, Move, Button20 ,% SlotHide5
        GuiControl, Move, Button21 ,% SlotHide6
        GuiControl, Move, Button22 ,% SlotHide7
        GuiControl, Move, Button23 ,% SlotHide8
        GuiControl, Move, Button24 ,% SlotHide9
        GuiControl, Move, Button25 ,% SlotHide10
        GuiControl, Move, Button26 ,% SlotHide11
        GuiControl, Move, Button27 ,% SlotHide12
        GuiControl, Move, Button28 ,% SlotHide13
        GuiControl, Move, Button29 ,% SlotHide14
        GuiControl, Move, Button30 ,% SlotHide15
        GuiControl, Move, Button31 ,% SlotHide1
        GuiControl, Move, Button32 ,% SlotHide2
        GuiControl, Move, Button33 ,% SlotHide3
        GuiControl, Move, Button34 ,% SlotHide4
        GuiControl, Move, Button35 ,% SlotHide5
        GuiControl, Move, Button36 ,% SlotHide6
        GuiControl, Move, Button37 ,% SlotHide7
        GuiControl, Move, Button38 ,% SlotHide8
        GuiControl, Move, Button39 ,% SlotHide9
        GuiControl, Move, Button40 ,% SlotHide10
        GuiControl, Move, Button41 ,% SlotHide11
        GuiControl, Move, Button42 ,% SlotHide12
        GuiControl, Move, Button43 ,% SlotHide13
        GuiControl, Move, Button44 ,% SlotHide14
        GuiControl, Move, Button45 ,% SlotHide15
        GuiControl, Move, Button46 ,% Slot1
        GuiControl, Move, Button47 ,% Slot2
        GuiControl, Move, Button48 ,% Slot3
        GuiControl, Move, Button49 ,% Slot4
        GuiControl, Move, Button50 ,% Slot5
        GuiControl, Move, Button51 ,% Slot6
        GuiControl, Move, Button52 ,% Slot7
        GuiControl, Move, Button53 ,% Slot8
        GuiControl, Move, Button54 ,% Slot9
        GuiControl, Move, Button55 ,% Slot10
        GuiControl, Move, Button56 ,% Slot11
        GuiControl, Move, Button57 ,% Slot12
        GuiControl, Move, Button58 ,% Slot13
        GuiControl, Move, Button59 ,% Slot14
        GuiControl, Move, Button60 ,% Slot15
		}
Gui, Show, h830 w830
IniWrite, 1, F4 Keys.ahk, Aspect, Horizontal
WinActivate, ahk_class IEFrame
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
if 1x5Hidden = 1
    GuiControl, Hide, Button5
if 1x6Hidden = 1
    GuiControl, Hide, Button6
if 1x7Hidden = 1
    GuiControl, Hide, Button7
if 1x8Hidden = 1
    GuiControl, Hide, Button8
if 1x9Hidden = 1
    GuiControl, Hide, Button9
if 1x10Hidden = 1
    GuiControl, Hide, Button10
if 1x11Hidden = 1
    GuiControl, Hide, Button11
if 1x12Hidden = 1
    GuiControl, Hide, Button12
if 1x13Hidden = 1
    GuiControl, Hide, Button13
if 1x14Hidden = 1
    GuiControl, Hide, Button14
if 1x15Hidden = 1
    GuiControl, Hide, Button15
if 2x1Hidden = 1
    GuiControl, Hide, Button16
if 2x2Hidden = 1
    GuiControl, Hide, Button17
if 2x3Hidden = 1
    GuiControl, Hide, Button18
if 2x4Hidden = 1
    GuiControl, Hide, Button19
if 2x5Hidden = 1
    GuiControl, Hide, Button20
if 2x6Hidden = 1
    GuiControl, Hide, Button21
if 2x7Hidden = 1
    GuiControl, Hide, Button22
if 2x8Hidden = 1
    GuiControl, Hide, Button23
if 2x9Hidden = 1
    GuiControl, Hide, Button24
if 2x10Hidden = 1
    GuiControl, Hide, Button25
if 2x11Hidden = 1
    GuiControl, Hide, Button26
if 2x12Hidden = 1
    GuiControl, Hide, Button27
if 2x13Hidden = 1
    GuiControl, Hide, Button28
if 2x14Hidden = 1
    GuiControl, Hide, Button29
if 2x15Hidden = 1
    GuiControl, Hide, Button30
if 3x1Hidden = 1
    GuiControl, Hide, Button31
if 3x2Hidden = 1
    GuiControl, Hide, Button32
if 3x3Hidden = 1
    GuiControl, Hide, Button33
if 3x4Hidden = 1
    GuiControl, Hide, Button34
if 3x5Hidden = 1
    GuiControl, Hide, Button35
if 3x6Hidden = 1
    GuiControl, Hide, Button36
if 3x7Hidden = 1
    GuiControl, Hide, Button37
if 3x8Hidden = 1
    GuiControl, Hide, Button38
if 3x9Hidden = 1
    GuiControl, Hide, Button39
if 3x10Hidden = 1
    GuiControl, Hide, Button40
if 3x11Hidden = 1
    GuiControl, Hide, Button41
if 3x12Hidden = 1
    GuiControl, Hide, Button42
if 3x13Hidden = 1
    GuiControl, Hide, Button43
if 3x14Hidden = 1
    GuiControl, Hide, Button44
if 3x15Hidden = 1
    GuiControl, Hide, Button45
if 4x1Hidden = 1
    GuiControl, Hide, Button46
if 4x2Hidden = 1
    GuiControl, Hide, Button47
if 4x3Hidden = 1
    GuiControl, Hide, Button48
if 4x4Hidden = 1
    GuiControl, Hide, Button49
if 4x5Hidden = 1
    GuiControl, Hide, Button50
if 4x6Hidden = 1
    GuiControl, Hide, Button51
if 4x7Hidden = 1
    GuiControl, Hide, Button52
if 4x8Hidden = 1
    GuiControl, Hide, Button53
if 4x9Hidden = 1
    GuiControl, Hide, Button54
if 4x10Hidden = 1
    GuiControl, Hide, Button55
if 4x11Hidden = 1
    GuiControl, Hide, Button56
if 4x12Hidden = 1
    GuiControl, Hide, Button57
if 4x13Hidden = 1
    GuiControl, Hide, Button58
if 4x14Hidden = 1
    GuiControl, Hide, Button59
if 4x15Hidden = 1
    GuiControl, Hide, Button60
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
IniWrite, 0, F4 Keys.ahk, Saved, 1x1Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 1x2Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 1x3Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 1x4Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 1x5Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 1x6Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 1x7Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 1x8Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 1x9Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 1x10Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 1x11Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 1x12Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 1x13Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 1x14Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 1x15Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 2x1Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 2x2Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 2x3Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 2x4Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 2x5Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 2x6Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 2x7Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 2x8Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 2x9Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 2x10Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 2x11Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 2x12Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 2x13Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 2x14Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 2x15Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 3x1Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 3x2Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 3x3Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 3x4Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 3x5Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 3x6Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 3x7Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 3x8Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 3x9Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 3x10Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 3x11Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 3x12Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 3x13Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 3x14Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 3x15Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 4x1Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 4x2Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 4x3Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 4x4Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 4x5Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 4x6Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 4x7Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 4x8Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 4x9Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 4x10Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 4x11Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 4x12Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 4x13Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 4x14Hidden
IniWrite, 0, F4 Keys.ahk, Saved, 4x15Hidden
WinActivate, ahk_class IEFrame
return

UpdateShortcut:
InputBox, NewText,   New Shortcut Text,    Enter the new shortcut text that will appear on the button:, , 370, 127, , , , , % %ThisThreadText%
InputBox, NewAction, New Docketing Action, Enter the new Action Type to inject into docketing:, , 322, 127, , , , , % ThisShortcut
IniWrite, %NewText%,   F4 Keys.ahk, Saved, %ThisThreadText%
IniWrite, %NewAction%, F4 Keys.ahk, Saved, %ThisThread%
return

1x1:
Gui, Submit, NoHide
WinActivate, ahk_class IEFrame
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button1, %NewText%
		IniRead, 1x1, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x1Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button1
		IniWrite, 1, F4 Keys.ahk, Saved, 1x1Hidden
		}
	else
		{
		gosub GrabHandle
		IniRead, 1x1, F4 Keys.ahk, Saved, 1x1
		ActionType = %1x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		}
		WinActivate, ahk_class IEFrame
return

1x2:
Gui, Submit, NoHide
WinActivate, ahk_class IEFrame
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button2, %NewText%
		IniRead, 1x2, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x2Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button2
		IniWrite, 1, F4 Keys.ahk, Saved, 1x2Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 1x2, F4 Keys.ahk, Saved, 1x2
		ActionType = %1x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

1x3:
Gui, Submit, NoHide
WinActivate, ahk_class IEFrame
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button3, %NewText%
		IniRead, 1x3, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x3Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button3
		IniWrite, 1, F4 Keys.ahk, Saved, 1x3Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 1x3, F4 Keys.ahk, Saved, 1x3
		ActionType = %1x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

1x4:
Gui, Submit, NoHide
WinActivate, ahk_class IEFrame
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button4, %NewText%
		IniRead, 1x4, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x4Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button4
		IniWrite, 1, F4 Keys.ahk, Saved, 1x4Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 1x4, F4 Keys.ahk, Saved, 1x4
		ActionType = %1x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

1x5:
Gui, Submit, NoHide
WinActivate, ahk_class IEFrame
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button5, %NewText%
		IniRead, 1x5, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x5Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button5
		IniWrite, 1, F4 Keys.ahk, Saved, 1x5Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 1x5, F4 Keys.ahk, Saved, 1x5
		ActionType = %1x5%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

1x6:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button6, %NewText%
		IniRead, 1x6, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x6Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button6
		IniWrite, 1, F4 Keys.ahk, Saved, 1x6Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 1x6, F4 Keys.ahk, Saved, 1x6
		ActionType = %1x6%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

1x7:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button7, %NewText%
		IniRead, 1x7, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x7Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button7
		IniWrite, 1, F4 Keys.ahk, Saved, 1x7Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 1x7, F4 Keys.ahk, Saved, 1x7
		ActionType = %1x7%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

1x8:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button8, %NewText%
		IniRead, 1x8, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x8Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button8
		IniWrite, 1, F4 Keys.ahk, Saved, 1x8Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 1x8, F4 Keys.ahk, Saved, 1x8
		ActionType = %1x8%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

1x9:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button9, %NewText%
		IniRead, 1x9, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x9Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button9
		IniWrite, 1, F4 Keys.ahk, Saved, 1x9Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 1x9, F4 Keys.ahk, Saved, 1x9
		ActionType = %1x9%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

1x10:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button10, %NewText%
		IniRead, 1x10, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x10Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button10
		IniWrite, 1, F4 Keys.ahk, Saved, 1x10Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 1x10, F4 Keys.ahk, Saved, 1x10
		ActionType = %1x10%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

1x11:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button11, %NewText%
		IniRead, 1x11, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x11Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button11
		IniWrite, 1, F4 Keys.ahk, Saved, 1x11Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 1x11, F4 Keys.ahk, Saved, 1x11
		ActionType = %1x11%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

1x12:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button12, %NewText%
		IniRead, 1x12, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x12Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button12
		IniWrite, 1, F4 Keys.ahk, Saved, 1x12Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 1x12, F4 Keys.ahk, Saved, 1x12
		ActionType = %1x12%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

1x13:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button13, %NewText%
		IniRead, 1x13, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x13Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button13
		IniWrite, 1, F4 Keys.ahk, Saved, 1x13Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 1x13, F4 Keys.ahk, Saved, 1x13
		ActionType = %1x13%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

1x14:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button14, %NewText%
		IniRead, 1x14, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x14Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button14
		IniWrite, 1, F4 Keys.ahk, Saved, 1x14Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 1x14, F4 Keys.ahk, Saved, 1x14
		ActionType = %1x14%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

1x15:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button15, %NewText%
		IniRead, 1x15, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 1x15Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button15
		IniWrite, 1, F4 Keys.ahk, Saved, 1x15Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 1x15, F4 Keys.ahk, Saved, 1x15
		ActionType = %1x15%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

2x1:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button16, %NewText%
		IniRead, 2x1, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x1Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button16
		IniWrite, 1, F4 Keys.ahk, Saved, 2x1Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 2x1, F4 Keys.ahk, Saved, 2x1
		ActionType = %2x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

2x2:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button17, %NewText%
		IniRead, 2x2, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x2Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button17
		IniWrite, 1, F4 Keys.ahk, Saved, 2x2Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 2x2, F4 Keys.ahk, Saved, 2x2
		ActionType = %2x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

2x3:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button18, %NewText%
		IniRead, 2x3, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x3Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button18
		IniWrite, 1, F4 Keys.ahk, Saved, 2x3Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 2x3, F4 Keys.ahk, Saved, 2x3
		ActionType = %2x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

2x4:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button19, %NewText%
		IniRead, 2x4, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x4Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button19
		IniWrite, 1, F4 Keys.ahk, Saved, 2x4Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 2x4, F4 Keys.ahk, Saved, 2x4
		ActionType = %2x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

2x5:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button20, %NewText%
		IniRead, 2x5, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x5Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button20
		IniWrite, 1, F4 Keys.ahk, Saved, 2x5Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 2x5, F4 Keys.ahk, Saved, 2x5
		ActionType = %2x5%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

2x6:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button21, %NewText%
		IniRead, 2x6, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x6Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button21
		IniWrite, 1, F4 Keys.ahk, Saved, 2x6Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 2x6, F4 Keys.ahk, Saved, 2x6
		ActionType = %2x6%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

2x7:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button22, %NewText%
		IniRead, 2x7, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x7Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button22
		IniWrite, 1, F4 Keys.ahk, Saved, 2x7Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 2x7, F4 Keys.ahk, Saved, 2x7
		ActionType = %2x7%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

2x8:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button23, %NewText%
		IniRead, 2x8, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x8Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button23
		IniWrite, 1, F4 Keys.ahk, Saved, 2x8Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 2x8, F4 Keys.ahk, Saved, 2x8
		ActionType = %2x8%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

2x9:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button24, %NewText%
		IniRead, 2x9, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x9Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button24
		IniWrite, 1, F4 Keys.ahk, Saved, 2x9Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 2x9, F4 Keys.ahk, Saved, 2x9
		ActionType = %2x9%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

2x10:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button25, %NewText%
		IniRead, 2x10, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x10Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button25
		IniWrite, 1, F4 Keys.ahk, Saved, 2x10Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 2x10, F4 Keys.ahk, Saved, 2x10
		ActionType = %2x10%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

2x11:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button26, %NewText%
		IniRead, 2x11, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x11Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button26
		IniWrite, 1, F4 Keys.ahk, Saved, 2x11Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 2x11, F4 Keys.ahk, Saved, 2x11
		ActionType = %2x11%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

2x12:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button27, %NewText%
		IniRead, 2x12, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x12Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button27
		IniWrite, 1, F4 Keys.ahk, Saved, 2x12Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 2x12, F4 Keys.ahk, Saved, 2x12
		ActionType = %2x12%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

2x13:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button28, %NewText%
		IniRead, 2x13, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x13Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button28
		IniWrite, 1, F4 Keys.ahk, Saved, 2x13Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 2x13, F4 Keys.ahk, Saved, 2x13
		ActionType = %2x13%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

2x14:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button29, %NewText%
		IniRead, 2x14, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x14Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button29
		IniWrite, 1, F4 Keys.ahk, Saved, 2x14Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 2x14, F4 Keys.ahk, Saved, 2x14
		ActionType = %2x14%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

2x15:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button30, %NewText%
		IniRead, 2x15, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 2x15Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button30
		IniWrite, 1, F4 Keys.ahk, Saved, 2x15Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 2x15, F4 Keys.ahk, Saved, 2x15
		ActionType = %2x15%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

3x1:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button31, %NewText%
		IniRead, 3x1, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x1Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button31
		IniWrite, 1, F4 Keys.ahk, Saved, 3x1Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 3x1, F4 Keys.ahk, Saved, 3x1
		ActionType = %3x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

3x2:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button32, %NewText%
		IniRead, 3x2, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x2Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button32
		IniWrite, 1, F4 Keys.ahk, Saved, 3x2Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 3x2, F4 Keys.ahk, Saved, 3x2
		ActionType = %3x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

3x3:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button33, %NewText%
		IniRead, 3x3, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x3Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button33
		IniWrite, 1, F4 Keys.ahk, Saved, 3x3Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 3x3, F4 Keys.ahk, Saved, 3x3
		ActionType = %3x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

3x4:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button34, %NewText%
		IniRead, 3x4, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x4Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button34
		IniWrite, 1, F4 Keys.ahk, Saved, 3x4Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 3x4, F4 Keys.ahk, Saved, 3x4
		ActionType = %3x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

3x5:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button35, %NewText%
		IniRead, 3x5, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x5Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button35
		IniWrite, 1, F4 Keys.ahk, Saved, 3x5Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 3x5, F4 Keys.ahk, Saved, 3x5
		ActionType = %3x5%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

3x6:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button36, %NewText%
		IniRead, 3x6, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x6Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button36
		IniWrite, 1, F4 Keys.ahk, Saved, 3x6Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 3x6, F4 Keys.ahk, Saved, 3x6
		ActionType = %3x6%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

3x7:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button37, %NewText%
		IniRead, 3x7, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x7Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button37
		IniWrite, 1, F4 Keys.ahk, Saved, 3x7Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 3x7, F4 Keys.ahk, Saved, 3x7
		ActionType = %3x7%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

3x8:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button38, %NewText%
		IniRead, 3x8, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x8Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button38
		IniWrite, 1, F4 Keys.ahk, Saved, 3x8Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 3x8, F4 Keys.ahk, Saved, 3x8
		ActionType = %3x8%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

3x9:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button39, %NewText%
		IniRead, 3x9, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x9Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button39
		IniWrite, 1, F4 Keys.ahk, Saved, 3x9Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 3x9, F4 Keys.ahk, Saved, 3x9
		ActionType = %3x9%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

3x10:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button40, %NewText%
		IniRead, 3x10, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x10Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button40
		IniWrite, 1, F4 Keys.ahk, Saved, 3x10Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 3x10, F4 Keys.ahk, Saved, 3x10
		ActionType = %3x10%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

3x11:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button41, %NewText%
		IniRead, 3x11, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x11Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button41
		IniWrite, 1, F4 Keys.ahk, Saved, 3x11Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 3x11, F4 Keys.ahk, Saved, 3x11
		ActionType = %3x11%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

3x12:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button42, %NewText%
		IniRead, 3x12, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x12Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button42
		IniWrite, 1, F4 Keys.ahk, Saved, 3x12Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 3x12, F4 Keys.ahk, Saved, 3x12
		ActionType = %3x12%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

3x13:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button43, %NewText%
		IniRead, 3x13, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x13Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button43
		IniWrite, 1, F4 Keys.ahk, Saved, 3x13Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 3x13, F4 Keys.ahk, Saved, 3x13
		ActionType = %3x13%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

3x14:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button44, %NewText%
		IniRead, 3x14, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x14Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button44
		IniWrite, 1, F4 Keys.ahk, Saved, 3x14Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 3x14, F4 Keys.ahk, Saved, 3x14
		ActionType = %3x14%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

3x15:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button45, %NewText%
		IniRead, 3x15, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 3x15Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button45
		IniWrite, 1, F4 Keys.ahk, Saved, 3x15Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 3x15, F4 Keys.ahk, Saved, 3x15
		ActionType = %3x15%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

4x1:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button46, %NewText%
		IniRead, 4x1, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x1Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button46
		IniWrite, 1, F4 Keys.ahk, Saved, 4x1Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 4x1, F4 Keys.ahk, Saved, 4x1
		ActionType = %4x1%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

4x2:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button47, %NewText%
		IniRead, 4x2, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x2Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button47
		IniWrite, 1, F4 Keys.ahk, Saved, 4x2Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 4x2, F4 Keys.ahk, Saved, 4x2
		ActionType = %4x2%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

4x3:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button48, %NewText%
		IniRead, 4x3, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x3Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button48
		IniWrite, 1, F4 Keys.ahk, Saved, 4x3Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 4x3, F4 Keys.ahk, Saved, 4x3
		ActionType = %4x3%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

4x4:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button49, %NewText%
		IniRead, 4x4, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x4Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button49
		IniWrite, 1, F4 Keys.ahk, Saved, 4x4Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 4x4, F4 Keys.ahk, Saved, 4x4
		ActionType = %4x4%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

4x5:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button50, %NewText%
		IniRead, 4x5, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x5Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button50
		IniWrite, 1, F4 Keys.ahk, Saved, 4x5Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 4x5, F4 Keys.ahk, Saved, 4x5
		ActionType = %4x5%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

4x6:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button51, %NewText%
		IniRead, 4x6, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x6Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button51
		IniWrite, 1, F4 Keys.ahk, Saved, 4x6Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 4x6, F4 Keys.ahk, Saved, 4x6
		ActionType = %4x6%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

4x7:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button52, %NewText%
		IniRead, 4x7, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x7Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button52
		IniWrite, 1, F4 Keys.ahk, Saved, 4x7Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 4x7, F4 Keys.ahk, Saved, 4x7
		ActionType = %4x7%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

4x8:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button53, %NewText%
		IniRead, 4x8, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x8Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button53
		IniWrite, 1, F4 Keys.ahk, Saved, 4x8Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 4x8, F4 Keys.ahk, Saved, 4x8
		ActionType = %4x8%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

4x9:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button54, %NewText%
		IniRead, 4x9, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x9Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button54
		IniWrite, 1, F4 Keys.ahk, Saved, 4x9Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 4x9, F4 Keys.ahk, Saved, 4x9
		ActionType = %4x9%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

4x10:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button55, %NewText%
		IniRead, 4x10, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x10Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button55
		IniWrite, 1, F4 Keys.ahk, Saved, 4x10Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 4x10, F4 Keys.ahk, Saved, 4x10
		ActionType = %4x10%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

4x11:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button56, %NewText%
		IniRead, 4x11, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x11Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button56
		IniWrite, 1, F4 Keys.ahk, Saved, 4x11Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 4x11, F4 Keys.ahk, Saved, 4x11
		ActionType = %4x11%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

4x12:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button57, %NewText%
		IniRead, 4x12, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x12Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button57
		IniWrite, 1, F4 Keys.ahk, Saved, 4x12Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 4x12, F4 Keys.ahk, Saved, 4x12
		ActionType = %4x12%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

4x13:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button58, %NewText%
		IniRead, 4x13, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x13Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button58
		IniWrite, 1, F4 Keys.ahk, Saved, 4x13Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 4x13, F4 Keys.ahk, Saved, 4x13
		ActionType = %4x13%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

4x14:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button59, %NewText%
		IniRead, 4x14, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x14Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button59
		IniWrite, 1, F4 Keys.ahk, Saved, 4x14Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 4x14, F4 Keys.ahk, Saved, 4x14
		ActionType = %4x14%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

4x15:
Gui, Submit, NoHide
GetKeyState, IsShiftDown, Shift
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		ThisThread = %A_ThisLabel%
		ThisShortcut := %ThisThread%
		ThisThreadText := ThisThread . "Text"
		gosub UpdateShortcut
		GuiControl, , Button60, %NewText%
		IniRead, 4x15, F4 Keys.ahk, Saved, %A_ThisLabel%
		IniRead, 4x15Text, F4 Keys.ahk, Saved, %A_ThisLabel%Text
		;return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button60
		IniWrite, 1, F4 Keys.ahk, Saved, 4x15Hidden
		;return
		}
	else
		{
		gosub GrabHandle
		IniRead, 4x15, F4 Keys.ahk, Saved, 4x15
		ActionType = %4x15%
		ActionType := ActionType
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		;return
		}
		WinActivate, ahk_class IEFrame
return

Set1:
IniRead, Horizontal, F4 Keys.ahk, Aspect, Horizontal
	if Horizontal = 1
	{
GuiControl, Move, Button1  ,% Slot1
GuiControl, Move, Button2  ,% Slot2
GuiControl, Move, Button3  ,% Slot3
GuiControl, Move, Button4  ,% Slot4
GuiControl, Move, Button5  ,% Slot5
GuiControl, Move, Button6  ,% Slot6
GuiControl, Move, Button7  ,% Slot7
GuiControl, Move, Button8  ,% Slot8
GuiControl, Move, Button9  ,% Slot9
GuiControl, Move, Button10 ,% Slot10
GuiControl, Move, Button11 ,% Slot11
GuiControl, Move, Button12 ,% Slot12
GuiControl, Move, Button13 ,% Slot13
GuiControl, Move, Button14 ,% Slot14
GuiControl, Move, Button15 ,% Slot15

GuiControl, Move, Button16 ,% SlotHide1
GuiControl, Move, Button17 ,% SlotHide2
GuiControl, Move, Button18 ,% SlotHide3
GuiControl, Move, Button19 ,% SlotHide4
GuiControl, Move, Button20 ,% SlotHide5
GuiControl, Move, Button21 ,% SlotHide6
GuiControl, Move, Button22 ,% SlotHide7
GuiControl, Move, Button23 ,% SlotHide8
GuiControl, Move, Button24 ,% SlotHide9
GuiControl, Move, Button25 ,% SlotHide10
GuiControl, Move, Button26 ,% SlotHide11
GuiControl, Move, Button27 ,% SlotHide12
GuiControl, Move, Button28 ,% SlotHide13
GuiControl, Move, Button29 ,% SlotHide14
GuiControl, Move, Button30 ,% SlotHide15

GuiControl, Move, Button31 ,% SlotHide1
GuiControl, Move, Button32 ,% SlotHide2
GuiControl, Move, Button33 ,% SlotHide3
GuiControl, Move, Button34 ,% SlotHide4
GuiControl, Move, Button35 ,% SlotHide5
GuiControl, Move, Button36 ,% SlotHide6
GuiControl, Move, Button37 ,% SlotHide7
GuiControl, Move, Button38 ,% SlotHide8
GuiControl, Move, Button39 ,% SlotHide9
GuiControl, Move, Button40 ,% SlotHide10
GuiControl, Move, Button41 ,% SlotHide11
GuiControl, Move, Button42 ,% SlotHide12
GuiControl, Move, Button43 ,% SlotHide13
GuiControl, Move, Button44 ,% SlotHide14
GuiControl, Move, Button45 ,% SlotHide15

GuiControl, Move, Button46 ,% SlotHide1
GuiControl, Move, Button47 ,% SlotHide2
GuiControl, Move, Button48 ,% SlotHide3
GuiControl, Move, Button49 ,% SlotHide4
GuiControl, Move, Button50 ,% SlotHide5
GuiControl, Move, Button51 ,% SlotHide6
GuiControl, Move, Button52 ,% SlotHide7
GuiControl, Move, Button53 ,% SlotHide8
GuiControl, Move, Button54 ,% SlotHide9
GuiControl, Move, Button55 ,% SlotHide10
GuiControl, Move, Button56 ,% SlotHide11
GuiControl, Move, Button57 ,% SlotHide12
GuiControl, Move, Button58 ,% SlotHide13
GuiControl, Move, Button59 ,% SlotHide14
GuiControl, Move, Button60 ,% SlotHide15

IniWrite, 1, F4 Keys.ahk, Set, CurrentSet
	}
else
	{
GuiControl, Move, Button1  ,% SlotVert1
GuiControl, Move, Button2  ,% SlotVert2
GuiControl, Move, Button3  ,% SlotVert3
GuiControl, Move, Button4  ,% SlotVert4
GuiControl, Move, Button5  ,% SlotVert5
GuiControl, Move, Button6  ,% SlotVert6
GuiControl, Move, Button7  ,% SlotVert7
GuiControl, Move, Button8  ,% SlotVert8
GuiControl, Move, Button9  ,% SlotVert9
GuiControl, Move, Button10 ,% SlotVert10
GuiControl, Move, Button11 ,% SlotVert11
GuiControl, Move, Button12 ,% SlotVert12
GuiControl, Move, Button13 ,% SlotVert13
GuiControl, Move, Button14 ,% SlotVert14
GuiControl, Move, Button15 ,% SlotVert15

GuiControl, Move, Button16 ,% SlotHide1
GuiControl, Move, Button17 ,% SlotHide2
GuiControl, Move, Button18 ,% SlotHide3
GuiControl, Move, Button19 ,% SlotHide4
GuiControl, Move, Button20 ,% SlotHide5
GuiControl, Move, Button21 ,% SlotHide6
GuiControl, Move, Button22 ,% SlotHide7
GuiControl, Move, Button23 ,% SlotHide8
GuiControl, Move, Button24 ,% SlotHide9
GuiControl, Move, Button25 ,% SlotHide10
GuiControl, Move, Button26 ,% SlotHide11
GuiControl, Move, Button27 ,% SlotHide12
GuiControl, Move, Button28 ,% SlotHide13
GuiControl, Move, Button29 ,% SlotHide14
GuiControl, Move, Button30 ,% SlotHide15

GuiControl, Move, Button31 ,% SlotHide1
GuiControl, Move, Button32 ,% SlotHide2
GuiControl, Move, Button33 ,% SlotHide3
GuiControl, Move, Button34 ,% SlotHide4
GuiControl, Move, Button35 ,% SlotHide5
GuiControl, Move, Button36 ,% SlotHide6
GuiControl, Move, Button37 ,% SlotHide7
GuiControl, Move, Button38 ,% SlotHide8
GuiControl, Move, Button39 ,% SlotHide9
GuiControl, Move, Button40 ,% SlotHide10
GuiControl, Move, Button41 ,% SlotHide11
GuiControl, Move, Button42 ,% SlotHide12
GuiControl, Move, Button43 ,% SlotHide13
GuiControl, Move, Button44 ,% SlotHide14
GuiControl, Move, Button45 ,% SlotHide15

GuiControl, Move, Button46 ,% SlotHide1
GuiControl, Move, Button47 ,% SlotHide2
GuiControl, Move, Button48 ,% SlotHide3
GuiControl, Move, Button49 ,% SlotHide4
GuiControl, Move, Button50 ,% SlotHide5
GuiControl, Move, Button51 ,% SlotHide6
GuiControl, Move, Button52 ,% SlotHide7
GuiControl, Move, Button53 ,% SlotHide8
GuiControl, Move, Button54 ,% SlotHide9
GuiControl, Move, Button55 ,% SlotHide10
GuiControl, Move, Button56 ,% SlotHide11
GuiControl, Move, Button57 ,% SlotHide12
GuiControl, Move, Button58 ,% SlotHide13
GuiControl, Move, Button59 ,% SlotHide14
GuiControl, Move, Button60 ,% SlotHide15
IniWrite, 1, F4 Keys.ahk, Set, CurrentSet
	}
	WinActivate, ahk_class IEFrame
return

Set2:
IniRead, Horizontal, F4 Keys.ahk, Aspect, Horizontal
	if Horizontal = 1
	{
GuiControl, Move, Button1  ,% SlotHide1
GuiControl, Move, Button2  ,% SlotHide2
GuiControl, Move, Button3  ,% SlotHide3
GuiControl, Move, Button4  ,% SlotHide4
GuiControl, Move, Button5  ,% SlotHide5
GuiControl, Move, Button6  ,% SlotHide6
GuiControl, Move, Button7  ,% SlotHide7
GuiControl, Move, Button8  ,% SlotHide8
GuiControl, Move, Button9  ,% SlotHide9
GuiControl, Move, Button10 ,% SlotHide10
GuiControl, Move, Button11 ,% SlotHide11
GuiControl, Move, Button12 ,% SlotHide12
GuiControl, Move, Button13 ,% SlotHide13
GuiControl, Move, Button14 ,% SlotHide14
GuiControl, Move, Button15 ,% SlotHide15

GuiControl, Move, Button16 ,% Slot1
GuiControl, Move, Button17 ,% Slot2
GuiControl, Move, Button18 ,% Slot3
GuiControl, Move, Button19 ,% Slot4
GuiControl, Move, Button20 ,% Slot5
GuiControl, Move, Button21 ,% Slot6
GuiControl, Move, Button22 ,% Slot7
GuiControl, Move, Button23 ,% Slot8
GuiControl, Move, Button24 ,% Slot9
GuiControl, Move, Button25 ,% Slot10
GuiControl, Move, Button26 ,% Slot11
GuiControl, Move, Button27 ,% Slot12
GuiControl, Move, Button28 ,% Slot13
GuiControl, Move, Button29 ,% Slot14
GuiControl, Move, Button30 ,% Slot15

GuiControl, Move, Button31 ,% SlotHide1
GuiControl, Move, Button32 ,% SlotHide2
GuiControl, Move, Button33 ,% SlotHide3
GuiControl, Move, Button34 ,% SlotHide4
GuiControl, Move, Button35 ,% SlotHide5
GuiControl, Move, Button36 ,% SlotHide6
GuiControl, Move, Button37 ,% SlotHide7
GuiControl, Move, Button38 ,% SlotHide8
GuiControl, Move, Button39 ,% SlotHide9
GuiControl, Move, Button40 ,% SlotHide10
GuiControl, Move, Button41 ,% SlotHide11
GuiControl, Move, Button42 ,% SlotHide12
GuiControl, Move, Button43 ,% SlotHide13
GuiControl, Move, Button44 ,% SlotHide14
GuiControl, Move, Button45 ,% SlotHide15

GuiControl, Move, Button46 ,% SlotHide1
GuiControl, Move, Button47 ,% SlotHide2
GuiControl, Move, Button48 ,% SlotHide3
GuiControl, Move, Button49 ,% SlotHide4
GuiControl, Move, Button50 ,% SlotHide5
GuiControl, Move, Button51 ,% SlotHide6
GuiControl, Move, Button52 ,% SlotHide7
GuiControl, Move, Button53 ,% SlotHide8
GuiControl, Move, Button54 ,% SlotHide9
GuiControl, Move, Button55 ,% SlotHide10
GuiControl, Move, Button56 ,% SlotHide11
GuiControl, Move, Button57 ,% SlotHide12
GuiControl, Move, Button58 ,% SlotHide13
GuiControl, Move, Button59 ,% SlotHide14
GuiControl, Move, Button60 ,% SlotHide15
IniWrite, 2, F4 Keys.ahk, Set, CurrentSet
	}
else
	{
GuiControl, Move, Button1  ,% SlotHide1
GuiControl, Move, Button2  ,% SlotHide2
GuiControl, Move, Button3  ,% SlotHide3
GuiControl, Move, Button4  ,% SlotHide4
GuiControl, Move, Button5  ,% SlotHide5
GuiControl, Move, Button6  ,% SlotHide6
GuiControl, Move, Button7  ,% SlotHide7
GuiControl, Move, Button8  ,% SlotHide8
GuiControl, Move, Button9  ,% SlotHide9
GuiControl, Move, Button10 ,% SlotHide10
GuiControl, Move, Button11 ,% SlotHide11
GuiControl, Move, Button12 ,% SlotHide12
GuiControl, Move, Button13 ,% SlotHide13
GuiControl, Move, Button14 ,% SlotHide14
GuiControl, Move, Button15 ,% SlotHide15

GuiControl, Move, Button16 ,% SlotVert1
GuiControl, Move, Button17 ,% SlotVert2
GuiControl, Move, Button18 ,% SlotVert3
GuiControl, Move, Button19 ,% SlotVert4
GuiControl, Move, Button20 ,% SlotVert5
GuiControl, Move, Button21 ,% SlotVert6
GuiControl, Move, Button22 ,% SlotVert7
GuiControl, Move, Button23 ,% SlotVert8
GuiControl, Move, Button24 ,% SlotVert9
GuiControl, Move, Button25 ,% SlotVert10
GuiControl, Move, Button26 ,% SlotVert11
GuiControl, Move, Button27 ,% SlotVert12
GuiControl, Move, Button28 ,% SlotVert13
GuiControl, Move, Button29 ,% SlotVert14
GuiControl, Move, Button30 ,% SlotVert15

GuiControl, Move, Button31 ,% SlotHide1
GuiControl, Move, Button32 ,% SlotHide2
GuiControl, Move, Button33 ,% SlotHide3
GuiControl, Move, Button34 ,% SlotHide4
GuiControl, Move, Button35 ,% SlotHide5
GuiControl, Move, Button36 ,% SlotHide6
GuiControl, Move, Button37 ,% SlotHide7
GuiControl, Move, Button38 ,% SlotHide8
GuiControl, Move, Button39 ,% SlotHide9
GuiControl, Move, Button40 ,% SlotHide10
GuiControl, Move, Button41 ,% SlotHide11
GuiControl, Move, Button42 ,% SlotHide12
GuiControl, Move, Button43 ,% SlotHide13
GuiControl, Move, Button44 ,% SlotHide14
GuiControl, Move, Button45 ,% SlotHide15

GuiControl, Move, Button46 ,% SlotHide1
GuiControl, Move, Button47 ,% SlotHide2
GuiControl, Move, Button48 ,% SlotHide3
GuiControl, Move, Button49 ,% SlotHide4
GuiControl, Move, Button50 ,% SlotHide5
GuiControl, Move, Button51 ,% SlotHide6
GuiControl, Move, Button52 ,% SlotHide7
GuiControl, Move, Button53 ,% SlotHide8
GuiControl, Move, Button54 ,% SlotHide9
GuiControl, Move, Button55 ,% SlotHide10
GuiControl, Move, Button56 ,% SlotHide11
GuiControl, Move, Button57 ,% SlotHide12
GuiControl, Move, Button58 ,% SlotHide13
GuiControl, Move, Button59 ,% SlotHide14
GuiControl, Move, Button60 ,% SlotHide15
IniWrite, 2, F4 Keys.ahk, Set, CurrentSet
	}
	WinActivate, ahk_class IEFrame
return

Set3:
IniRead, Horizontal, F4 Keys.ahk, Aspect, Horizontal
	if Horizontal = 1
	{
GuiControl, Move, Button1  ,% SlotHide1
GuiControl, Move, Button2  ,% SlotHide2
GuiControl, Move, Button3  ,% SlotHide3
GuiControl, Move, Button4  ,% SlotHide4
GuiControl, Move, Button5  ,% SlotHide5
GuiControl, Move, Button6  ,% SlotHide6
GuiControl, Move, Button7  ,% SlotHide7
GuiControl, Move, Button8  ,% SlotHide8
GuiControl, Move, Button9  ,% SlotHide9
GuiControl, Move, Button10 ,% SlotHide10
GuiControl, Move, Button11 ,% SlotHide11
GuiControl, Move, Button12 ,% SlotHide12
GuiControl, Move, Button13 ,% SlotHide13
GuiControl, Move, Button14 ,% SlotHide14
GuiControl, Move, Button15 ,% SlotHide15

GuiControl, Move, Button16 ,% SlotHide1
GuiControl, Move, Button17 ,% SlotHide2
GuiControl, Move, Button18 ,% SlotHide3
GuiControl, Move, Button19 ,% SlotHide4
GuiControl, Move, Button20 ,% SlotHide5
GuiControl, Move, Button21 ,% SlotHide6
GuiControl, Move, Button22 ,% SlotHide7
GuiControl, Move, Button23 ,% SlotHide8
GuiControl, Move, Button24 ,% SlotHide9
GuiControl, Move, Button25 ,% SlotHide10
GuiControl, Move, Button26 ,% SlotHide11
GuiControl, Move, Button27 ,% SlotHide12
GuiControl, Move, Button28 ,% SlotHide13
GuiControl, Move, Button29 ,% SlotHide14
GuiControl, Move, Button30 ,% SlotHide15

GuiControl, Move, Button31 ,% Slot1
GuiControl, Move, Button32 ,% Slot2
GuiControl, Move, Button33 ,% Slot3
GuiControl, Move, Button34 ,% Slot4
GuiControl, Move, Button35 ,% Slot5
GuiControl, Move, Button36 ,% Slot6
GuiControl, Move, Button37 ,% Slot7
GuiControl, Move, Button38 ,% Slot8
GuiControl, Move, Button39 ,% Slot9
GuiControl, Move, Button40 ,% Slot10
GuiControl, Move, Button41 ,% Slot11
GuiControl, Move, Button42 ,% Slot12
GuiControl, Move, Button43 ,% Slot13
GuiControl, Move, Button44 ,% Slot14
GuiControl, Move, Button45 ,% Slot15

GuiControl, Move, Button46 ,% SlotHide1
GuiControl, Move, Button47 ,% SlotHide2
GuiControl, Move, Button48 ,% SlotHide3
GuiControl, Move, Button49 ,% SlotHide4
GuiControl, Move, Button50 ,% SlotHide5
GuiControl, Move, Button51 ,% SlotHide6
GuiControl, Move, Button52 ,% SlotHide7
GuiControl, Move, Button53 ,% SlotHide8
GuiControl, Move, Button54 ,% SlotHide9
GuiControl, Move, Button55 ,% SlotHide10
GuiControl, Move, Button56 ,% SlotHide11
GuiControl, Move, Button57 ,% SlotHide12
GuiControl, Move, Button58 ,% SlotHide13
GuiControl, Move, Button59 ,% SlotHide14
GuiControl, Move, Button60 ,% SlotHide15
IniWrite, 3, F4 Keys.ahk, Set, CurrentSet
	}
else
	{
GuiControl, Move, Button1  ,% SlotHide1
GuiControl, Move, Button2  ,% SlotHide2
GuiControl, Move, Button3  ,% SlotHide3
GuiControl, Move, Button4  ,% SlotHide4
GuiControl, Move, Button5  ,% SlotHide5
GuiControl, Move, Button6  ,% SlotHide6
GuiControl, Move, Button7  ,% SlotHide7
GuiControl, Move, Button8  ,% SlotHide8
GuiControl, Move, Button9  ,% SlotHide9
GuiControl, Move, Button10 ,% SlotHide10
GuiControl, Move, Button11 ,% SlotHide11
GuiControl, Move, Button12 ,% SlotHide12
GuiControl, Move, Button13 ,% SlotHide13
GuiControl, Move, Button14 ,% SlotHide14
GuiControl, Move, Button15 ,% SlotHide15

GuiControl, Move, Button16 ,% SlotHide1
GuiControl, Move, Button17 ,% SlotHide2
GuiControl, Move, Button18 ,% SlotHide3
GuiControl, Move, Button19 ,% SlotHide4
GuiControl, Move, Button20 ,% SlotHide5
GuiControl, Move, Button21 ,% SlotHide6
GuiControl, Move, Button22 ,% SlotHide7
GuiControl, Move, Button23 ,% SlotHide8
GuiControl, Move, Button24 ,% SlotHide9
GuiControl, Move, Button25 ,% SlotHide10
GuiControl, Move, Button26 ,% SlotHide11
GuiControl, Move, Button27 ,% SlotHide12
GuiControl, Move, Button28 ,% SlotHide13
GuiControl, Move, Button29 ,% SlotHide14
GuiControl, Move, Button30 ,% SlotHide15

GuiControl, Move, Button31 ,% SlotVert1
GuiControl, Move, Button32 ,% SlotVert2
GuiControl, Move, Button33 ,% SlotVert3
GuiControl, Move, Button34 ,% SlotVert4
GuiControl, Move, Button35 ,% SlotVert5
GuiControl, Move, Button36 ,% SlotVert6
GuiControl, Move, Button37 ,% SlotVert7
GuiControl, Move, Button38 ,% SlotVert8
GuiControl, Move, Button39 ,% SlotVert9
GuiControl, Move, Button40 ,% SlotVert10
GuiControl, Move, Button41 ,% SlotVert11
GuiControl, Move, Button42 ,% SlotVert12
GuiControl, Move, Button43 ,% SlotVert13
GuiControl, Move, Button44 ,% SlotVert14
GuiControl, Move, Button45 ,% SlotVert15

GuiControl, Move, Button46 ,% SlotHide1
GuiControl, Move, Button47 ,% SlotHide2
GuiControl, Move, Button48 ,% SlotHide3
GuiControl, Move, Button49 ,% SlotHide4
GuiControl, Move, Button50 ,% SlotHide5
GuiControl, Move, Button51 ,% SlotHide6
GuiControl, Move, Button52 ,% SlotHide7
GuiControl, Move, Button53 ,% SlotHide8
GuiControl, Move, Button54 ,% SlotHide9
GuiControl, Move, Button55 ,% SlotHide10
GuiControl, Move, Button56 ,% SlotHide11
GuiControl, Move, Button57 ,% SlotHide12
GuiControl, Move, Button58 ,% SlotHide13
GuiControl, Move, Button59 ,% SlotHide14
GuiControl, Move, Button60 ,% SlotHide15
IniWrite, 3, F4 Keys.ahk, Set, CurrentSet
	}
	WinActivate, ahk_class IEFrame
return

Set4:
IniRead, Horizontal, F4 Keys.ahk, Aspect, Horizontal
	if Horizontal = 1
	{
GuiControl, Move, Button1  ,% SlotHide1
GuiControl, Move, Button2  ,% SlotHide2
GuiControl, Move, Button3  ,% SlotHide3
GuiControl, Move, Button4  ,% SlotHide4
GuiControl, Move, Button5  ,% SlotHide5
GuiControl, Move, Button6  ,% SlotHide6
GuiControl, Move, Button7  ,% SlotHide7
GuiControl, Move, Button8  ,% SlotHide8
GuiControl, Move, Button9  ,% SlotHide9
GuiControl, Move, Button10 ,% SlotHide10
GuiControl, Move, Button11 ,% SlotHide11
GuiControl, Move, Button12 ,% SlotHide12
GuiControl, Move, Button13 ,% SlotHide13
GuiControl, Move, Button14 ,% SlotHide14
GuiControl, Move, Button15 ,% SlotHide15

GuiControl, Move, Button16 ,% SlotHide1
GuiControl, Move, Button17 ,% SlotHide2
GuiControl, Move, Button18 ,% SlotHide3
GuiControl, Move, Button19 ,% SlotHide4
GuiControl, Move, Button20 ,% SlotHide5
GuiControl, Move, Button21 ,% SlotHide6
GuiControl, Move, Button22 ,% SlotHide7
GuiControl, Move, Button23 ,% SlotHide8
GuiControl, Move, Button24 ,% SlotHide9
GuiControl, Move, Button25 ,% SlotHide10
GuiControl, Move, Button26 ,% SlotHide11
GuiControl, Move, Button27 ,% SlotHide12
GuiControl, Move, Button28 ,% SlotHide13
GuiControl, Move, Button29 ,% SlotHide14
GuiControl, Move, Button30 ,% SlotHide15

GuiControl, Move, Button31 ,% SlotHide1
GuiControl, Move, Button32 ,% SlotHide2
GuiControl, Move, Button33 ,% SlotHide3
GuiControl, Move, Button34 ,% SlotHide4
GuiControl, Move, Button35 ,% SlotHide5
GuiControl, Move, Button36 ,% SlotHide6
GuiControl, Move, Button37 ,% SlotHide7
GuiControl, Move, Button38 ,% SlotHide8
GuiControl, Move, Button39 ,% SlotHide9
GuiControl, Move, Button40 ,% SlotHide10
GuiControl, Move, Button41 ,% SlotHide11
GuiControl, Move, Button42 ,% SlotHide12
GuiControl, Move, Button43 ,% SlotHide13
GuiControl, Move, Button44 ,% SlotHide14
GuiControl, Move, Button45 ,% SlotHide15

GuiControl, Move, Button46 ,% Slot1
GuiControl, Move, Button47 ,% Slot2
GuiControl, Move, Button48 ,% Slot3
GuiControl, Move, Button49 ,% Slot4
GuiControl, Move, Button50 ,% Slot5
GuiControl, Move, Button51 ,% Slot6
GuiControl, Move, Button52 ,% Slot7
GuiControl, Move, Button53 ,% Slot8
GuiControl, Move, Button54 ,% Slot9
GuiControl, Move, Button55 ,% Slot10
GuiControl, Move, Button56 ,% Slot11
GuiControl, Move, Button57 ,% Slot12
GuiControl, Move, Button58 ,% Slot13
GuiControl, Move, Button59 ,% Slot14
GuiControl, Move, Button60 ,% Slot15
IniWrite, 4, F4 Keys.ahk, Set, CurrentSet
	}
else
	{
GuiControl, Move, Button1  ,% SlotHide1
GuiControl, Move, Button2  ,% SlotHide2
GuiControl, Move, Button3  ,% SlotHide3
GuiControl, Move, Button4  ,% SlotHide4
GuiControl, Move, Button5  ,% SlotHide5
GuiControl, Move, Button6  ,% SlotHide6
GuiControl, Move, Button7  ,% SlotHide7
GuiControl, Move, Button8  ,% SlotHide8
GuiControl, Move, Button9  ,% SlotHide9
GuiControl, Move, Button10 ,% SlotHide10
GuiControl, Move, Button11 ,% SlotHide11
GuiControl, Move, Button12 ,% SlotHide12
GuiControl, Move, Button13 ,% SlotHide13
GuiControl, Move, Button14 ,% SlotHide14
GuiControl, Move, Button15 ,% SlotHide15

GuiControl, Move, Button16 ,% SlotHide1
GuiControl, Move, Button17 ,% SlotHide2
GuiControl, Move, Button18 ,% SlotHide3
GuiControl, Move, Button19 ,% SlotHide4
GuiControl, Move, Button20 ,% SlotHide5
GuiControl, Move, Button21 ,% SlotHide6
GuiControl, Move, Button22 ,% SlotHide7
GuiControl, Move, Button23 ,% SlotHide8
GuiControl, Move, Button24 ,% SlotHide9
GuiControl, Move, Button25 ,% SlotHide10
GuiControl, Move, Button26 ,% SlotHide11
GuiControl, Move, Button27 ,% SlotHide12
GuiControl, Move, Button28 ,% SlotHide13
GuiControl, Move, Button29 ,% SlotHide14
GuiControl, Move, Button30 ,% SlotHide15

GuiControl, Move, Button31 ,% SlotHide1
GuiControl, Move, Button32 ,% SlotHide2
GuiControl, Move, Button33 ,% SlotHide3
GuiControl, Move, Button34 ,% SlotHide4
GuiControl, Move, Button35 ,% SlotHide5
GuiControl, Move, Button36 ,% SlotHide6
GuiControl, Move, Button37 ,% SlotHide7
GuiControl, Move, Button38 ,% SlotHide8
GuiControl, Move, Button39 ,% SlotHide9
GuiControl, Move, Button40 ,% SlotHide10
GuiControl, Move, Button41 ,% SlotHide11
GuiControl, Move, Button42 ,% SlotHide12
GuiControl, Move, Button43 ,% SlotHide13
GuiControl, Move, Button44 ,% SlotHide14
GuiControl, Move, Button45 ,% SlotHide15

GuiControl, Move, Button46 ,% SlotVert1
GuiControl, Move, Button47 ,% SlotVert2
GuiControl, Move, Button48 ,% SlotVert3
GuiControl, Move, Button49 ,% SlotVert4
GuiControl, Move, Button50 ,% SlotVert5
GuiControl, Move, Button51 ,% SlotVert6
GuiControl, Move, Button52 ,% SlotVert7
GuiControl, Move, Button53 ,% SlotVert8
GuiControl, Move, Button54 ,% SlotVert9
GuiControl, Move, Button55 ,% SlotVert10
GuiControl, Move, Button56 ,% SlotVert11
GuiControl, Move, Button57 ,% SlotVert12
GuiControl, Move, Button58 ,% SlotVert13
GuiControl, Move, Button59 ,% SlotVert14
GuiControl, Move, Button60 ,% SlotVert15
IniWrite, 4, F4 Keys.ahk, Set, CurrentSet
	}
	WinActivate, ahk_class IEFrame
return

Picture:
PostMessage, 0xA1, 2,,, A
return

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
;MsgBox, text.
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
IniRead, Choice1, F4 Keys.ahk, CustomFKeys, %CustomKey%point1
IniRead, Choice2, F4 Keys.ahk, CustomFKeys, %CustomKey%point2
IniRead, Choice3, F4 Keys.ahk, CustomFKeys, %CustomKey%point3
IniRead, Choice4, F4 Keys.ahk, CustomFKeys, %CustomKey%point4
IniRead, Choice5, F4 Keys.ahk, CustomFKeys, %CustomKey%point5
IniRead, Choice6, F4 Keys.ahk, CustomFKeys, %CustomKey%point6
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
IniWrite, %Choice1%, F4 Keys.ahk, CustomFKeys, %CustomKey%point1
IniWrite, %Choice2%, F4 Keys.ahk, CustomFKeys, %CustomKey%point2
IniWrite, %Choice3%, F4 Keys.ahk, CustomFKeys, %CustomKey%point3
IniWrite, %Choice4%, F4 Keys.ahk, CustomFKeys, %CustomKey%point4
IniWrite, %Choice5%, F4 Keys.ahk, CustomFKeys, %CustomKey%point5
IniWrite, %Choice6%, F4 Keys.ahk, CustomFKeys, %CustomKey%point6
return

F1::
IniRead, F1point1, F4 Keys.ahk, CustomFKeys, F1point1
IniRead, F1point2, F4 Keys.ahk, CustomFKeys, F1point2
IniRead, F1point3, F4 Keys.ahk, CustomFKeys, F1point3
IniRead, F1point4, F4 Keys.ahk, CustomFKeys, F1point4
IniRead, F1point5, F4 Keys.ahk, CustomFKeys, F1point5
IniRead, F1point6, F4 Keys.ahk, CustomFKeys, F1point6
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
IniRead, F2point1, F4 Keys.ahk, CustomFKeys, F2point1
IniRead, F2point2, F4 Keys.ahk, CustomFKeys, F2point2
IniRead, F2point3, F4 Keys.ahk, CustomFKeys, F2point3
IniRead, F2point4, F4 Keys.ahk, CustomFKeys, F2point4
IniRead, F2point5, F4 Keys.ahk, CustomFKeys, F2point5
IniRead, F2point6, F4 Keys.ahk, CustomFKeys, F2point6
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
IniRead, F3point1, F4 Keys.ahk, CustomFKeys, F3point1
IniRead, F3point2, F4 Keys.ahk, CustomFKeys, F3point2
IniRead, F3point3, F4 Keys.ahk, CustomFKeys, F3point3
IniRead, F3point4, F4 Keys.ahk, CustomFKeys, F3point4
IniRead, F3point5, F4 Keys.ahk, CustomFKeys, F3point5
IniRead, F3point6, F4 Keys.ahk, CustomFKeys, F3point6
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
IniRead, F5point1, F4 Keys.ahk, CustomFKeys, F5point1
IniRead, F5point2, F4 Keys.ahk, CustomFKeys, F5point2
IniRead, F5point3, F4 Keys.ahk, CustomFKeys, F5point3
IniRead, F5point4, F4 Keys.ahk, CustomFKeys, F5point4
IniRead, F5point5, F4 Keys.ahk, CustomFKeys, F5point5
IniRead, F5point6, F4 Keys.ahk, CustomFKeys, F5point6
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
IniRead, F6point1, F4 Keys.ahk, CustomFKeys, F6point1
IniRead, F6point2, F4 Keys.ahk, CustomFKeys, F6point2
IniRead, F6point3, F4 Keys.ahk, CustomFKeys, F6point3
IniRead, F6point4, F4 Keys.ahk, CustomFKeys, F6point4
IniRead, F6point5, F4 Keys.ahk, CustomFKeys, F6point5
IniRead, F6point6, F4 Keys.ahk, CustomFKeys, F6point6
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
IniRead, F7point1, F4 Keys.ahk, CustomFKeys, F7point1
IniRead, F7point2, F4 Keys.ahk, CustomFKeys, F7point2
IniRead, F7point3, F4 Keys.ahk, CustomFKeys, F7point3
IniRead, F7point4, F4 Keys.ahk, CustomFKeys, F7point4
IniRead, F7point5, F4 Keys.ahk, CustomFKeys, F7point5
IniRead, F7point6, F4 Keys.ahk, CustomFKeys, F7point6
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
IniRead, F8point1, F4 Keys.ahk, CustomFKeys, F8point1
IniRead, F8point2, F4 Keys.ahk, CustomFKeys, F8point2
IniRead, F8point3, F4 Keys.ahk, CustomFKeys, F8point3
IniRead, F8point4, F4 Keys.ahk, CustomFKeys, F8point4
IniRead, F8point5, F4 Keys.ahk, CustomFKeys, F8point5
IniRead, F8point6, F4 Keys.ahk, CustomFKeys, F8point6
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

[Position]
FKeysPosX=1544
FKeysPosY=968

[Set2]
Hidden=0

[Set3]
Hidden=0

[Saved]
1x1Hidden=0
1x2Hidden=0
1x3Hidden=0
1x4Hidden=0
1x5Hidden=0
1x6Hidden=0
1x7Hidden=0
1x8Hidden=0
1x9Hidden=0
1x10Hidden=0
1x11Hidden=0
1x12Hidden=0
1x13Hidden=0
1x14Hidden=0
1x15Hidden=0
2x1Hidden=0
2x2Hidden=0
2x3Hidden=0
2x4Hidden=0
2x5Hidden=0
2x6Hidden=0
2x7Hidden=0
2x8Hidden=0
2x9Hidden=0
2x10Hidden=0
2x11Hidden=0
2x12Hidden=0
2x13Hidden=0
2x14Hidden=0
2x15Hidden=0
3x1Hidden=0
3x2Hidden=0
3x3Hidden=0
3x4Hidden=0
3x5Hidden=0
3x6Hidden=0
3x7Hidden=0
3x8Hidden=0
3x9Hidden=0
3x10Hidden=0
3x11Hidden=0
3x12Hidden=0
3x13Hidden=0
3x14Hidden=0
3x15Hidden=0
4x1Hidden=0
4x2Hidden=0
4x3Hidden=0
4x4Hidden=0
4x5Hidden=0
4x6Hidden=0
4x7Hidden=0
4x8Hidden=0
4x9Hidden=0
4x10Hidden=0
4x11Hidden=0
4x12Hidden=0
4x13Hidden=0
4x14Hidden=0
4x15Hidden=0
1x1Text=TM STATUS
1x2Text=PAT STATUS CHECK
1x3Text=
1x4Text=
1x5Text=
1x6Text=asdf
1x7Text=
1x8Text=
1x9Text=
1x10Text=
1x11Text=
1x12Text=
1x13Text=
1x14Text=
1x15Text=
2x1Text=
2x2Text=
2x3Text=
2x4Text=
2x5Text=
2x6Text=
2x7Text=
2x8Text=
2x9Text=
2x10Text=
2x11Text=
2x12Text=
2x13Text=
2x14Text=
2x15Text=
3x1Text=
3x2Text=
3x3Text=
3x4Text=
3x5Text=
3x6Text=
3x7Text=
3x8Text=
3x9Text=
3x10Text=
3x11Text=
3x12Text=
3x13Text=
3x14Text=
3x15Text=
4x1Text=
4x2Text=
4x3Text=
4x4Text=
4x5Text=
4x6Text=
4x7Text=
4x8Text=
4x9Text=
4x10Text=
4x11Text=
4x12Text=
4x13Text=
4x14Text=
4x15Text=
1x1=INT-TM STATUS ACTION
1x2=INT-PAT STATUS CHECK
1x3=
1x4=
1x5=
1x6=asdf
1x7=
1x8=
1x9=
1x10=
1x11=
1x12=
1x13=
1x14=
1x15=
2x1=
2x2=
2x3=
2x4=
2x5=
2x6=
2x7=
2x8=
2x9=
2x10=
2x11=
2x12=
2x13=
2x14=
2x15=
3x1=
3x2=
3x3=
3x4=
3x5=
3x6=
3x7=
3x8=
3x9=
3x10=
3x11=
3x12=
3x13=
3x14=
3x15=
4x1=
4x2=
4x3=
4x4=
4x5=
4x6=
4x7=
4x8=
4x9=
4x10=
4x11=
4x12=
4x13=
4x14=
4x15=

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

[Set]
CurrentSet=1

*/
