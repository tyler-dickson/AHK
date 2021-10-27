/*

Created by Tyler Dickson using AutoHotkey. 

*/

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
Menu, Tray, Icon, compstui.dll , 41


global Computername
StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
	UserFolder = %A_LoopFileName%
if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder	
	
	
IniRead,  APIUses, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements,  APIUses
	if  APIUses = ERROR
		{
		APIUses = 0
		IniWrite, %APIUses%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements,  APIUses
		IniRead,  APIUses, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements,  APIUses
		}




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
TrayTip, Diana Action Type Grid, Will open a new action when clicked now.`nIf it takes too long to load`, it will inject Action Type when clicked again.
return

Picture2:
Picture:
PostMessage, 0xA1, 2,,, A
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
		WinGetPos, FKeysPosX, FKeysPosY, , , Diana Action Type Grid (New CPI).ahk,
		IniWrite, %FKeysPosX%, Diana Action Type Grid (New CPI).ahk, Position, FKeysPosX
		IniWrite, %FKeysPosY%, Diana Action Type Grid (New CPI).ahk, Position, FKeysPosY	
		Gui, Destroy
		}
	}
return

CreateGUI:
global FKeysPosX
global FKeysPosY
IniRead, 1x1, Diana Action Type Grid (New CPI).ahk, Saved, 1x1
IniRead, 1x1Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 1x1Hidden
IniRead, 1x1Text, Diana Action Type Grid (New CPI).ahk, Saved, 1x1Text
IniRead, 1x2, Diana Action Type Grid (New CPI).ahk, Saved, 1x2
IniRead, 1x2Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 1x2Hidden
IniRead, 1x2Text, Diana Action Type Grid (New CPI).ahk, Saved, 1x2Text
IniRead, 1x3, Diana Action Type Grid (New CPI).ahk, Saved, 1x3
IniRead, 1x3Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 1x3Hidden
IniRead, 1x3Text, Diana Action Type Grid (New CPI).ahk, Saved, 1x3Text
IniRead, 1x4, Diana Action Type Grid (New CPI).ahk, Saved, 1x4
IniRead, 1x4Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 1x4Hidden
IniRead, 1x4Text, Diana Action Type Grid (New CPI).ahk, Saved, 1x4Text
IniRead, 2x1, Diana Action Type Grid (New CPI).ahk, Saved, 2x1
IniRead, 2x1Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 2x1Hidden
IniRead, 2x1Text, Diana Action Type Grid (New CPI).ahk, Saved, 2x1Text
IniRead, 2x2, Diana Action Type Grid (New CPI).ahk, Saved, 2x2
IniRead, 2x2Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 2x2Hidden
IniRead, 2x2Text, Diana Action Type Grid (New CPI).ahk, Saved, 2x2Text
IniRead, 2x3, Diana Action Type Grid (New CPI).ahk, Saved, 2x3
IniRead, 2x3Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 2x3Hidden
IniRead, 2x3Text, Diana Action Type Grid (New CPI).ahk, Saved, 2x3Text
IniRead, 2x4, Diana Action Type Grid (New CPI).ahk, Saved, 2x4
IniRead, 2x4Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 2x4Hidden
IniRead, 2x4Text, Diana Action Type Grid (New CPI).ahk, Saved, 2x4Text
IniRead, 3x1, Diana Action Type Grid (New CPI).ahk, Saved, 3x1
IniRead, 3x1Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 3x1Hidden
IniRead, 3x1Text, Diana Action Type Grid (New CPI).ahk, Saved, 3x1Text
IniRead, 3x2, Diana Action Type Grid (New CPI).ahk, Saved, 3x2
IniRead, 3x2Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 3x2Hidden
IniRead, 3x2Text, Diana Action Type Grid (New CPI).ahk, Saved, 3x2Text
IniRead, 3x3, Diana Action Type Grid (New CPI).ahk, Saved, 3x3
IniRead, 3x3Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 3x3Hidden
IniRead, 3x3Text, Diana Action Type Grid (New CPI).ahk, Saved, 3x3Text
IniRead, 3x4, Diana Action Type Grid (New CPI).ahk, Saved, 3x4
IniRead, 3x4Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 3x4Hidden
IniRead, 3x4Text, Diana Action Type Grid (New CPI).ahk, Saved, 3x4Text
IniRead, 4x1, Diana Action Type Grid (New CPI).ahk, Saved, 4x1
IniRead, 4x1Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 4x1Hidden
IniRead, 4x1Text, Diana Action Type Grid (New CPI).ahk, Saved, 4x1Text
IniRead, 4x2, Diana Action Type Grid (New CPI).ahk, Saved, 4x2
IniRead, 4x2Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 4x2Hidden
IniRead, 4x2Text, Diana Action Type Grid (New CPI).ahk, Saved, 4x2Text
IniRead, 4x3, Diana Action Type Grid (New CPI).ahk, Saved, 4x3
IniRead, 4x3Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 4x3Hidden
IniRead, 4x3Text, Diana Action Type Grid (New CPI).ahk, Saved, 4x3Text
IniRead, 4x4, Diana Action Type Grid (New CPI).ahk, Saved, 4x4
IniRead, 4x4Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 4x4Hidden
IniRead, 4x4Text, Diana Action Type Grid (New CPI).ahk, Saved, 4x4Text
IniRead, 5x1, Diana Action Type Grid (New CPI).ahk, Saved, 5x1
IniRead, 5x1Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 5x1Hidden
IniRead, 5x1Text, Diana Action Type Grid (New CPI).ahk, Saved, 5x1Text
IniRead, 5x2, Diana Action Type Grid (New CPI).ahk, Saved, 5x2
IniRead, 5x2Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 5x2Hidden
IniRead, 5x2Text, Diana Action Type Grid (New CPI).ahk, Saved, 5x2Text
IniRead, 5x3, Diana Action Type Grid (New CPI).ahk, Saved, 5x3
IniRead, 5x3Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 5x3Hidden
IniRead, 5x3Text, Diana Action Type Grid (New CPI).ahk, Saved, 5x3Text
IniRead, 5x4, Diana Action Type Grid (New CPI).ahk, Saved, 5x4
IniRead, 5x4Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 5x4Hidden
IniRead, 5x4Text, Diana Action Type Grid (New CPI).ahk, Saved, 5x4Text
IniRead, 6x1, Diana Action Type Grid (New CPI).ahk, Saved, 6x1
IniRead, 6x1Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 6x1Hidden
IniRead, 6x1Text, Diana Action Type Grid (New CPI).ahk, Saved, 6x1Text
IniRead, 6x2, Diana Action Type Grid (New CPI).ahk, Saved, 6x2
IniRead, 6x2Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 6x2Hidden
IniRead, 6x2Text, Diana Action Type Grid (New CPI).ahk, Saved, 6x2Text
IniRead, 6x3, Diana Action Type Grid (New CPI).ahk, Saved, 6x3
IniRead, 6x3Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 6x3Hidden
IniRead, 6x3Text, Diana Action Type Grid (New CPI).ahk, Saved, 6x3Text
IniRead, 6x4, Diana Action Type Grid (New CPI).ahk, Saved, 6x4
IniRead, 6x4Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 6x4Hidden
IniRead, 6x4Text, Diana Action Type Grid (New CPI).ahk, Saved, 6x4Text
IniRead, 7x1, Diana Action Type Grid (New CPI).ahk, Saved, 7x1
IniRead, 7x1Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 7x1Hidden
IniRead, 7x1Text, Diana Action Type Grid (New CPI).ahk, Saved, 7x1Text
IniRead, 7x2, Diana Action Type Grid (New CPI).ahk, Saved, 7x2
IniRead, 7x2Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 7x2Hidden
IniRead, 7x2Text, Diana Action Type Grid (New CPI).ahk, Saved, 7x2Text
IniRead, 7x3, Diana Action Type Grid (New CPI).ahk, Saved, 7x3
IniRead, 7x3Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 7x3Hidden
IniRead, 7x3Text, Diana Action Type Grid (New CPI).ahk, Saved, 7x3Text
IniRead, 7x4, Diana Action Type Grid (New CPI).ahk, Saved, 7x4
IniRead, 7x4Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 7x4Hidden
IniRead, 7x4Text, Diana Action Type Grid (New CPI).ahk, Saved, 7x4Text
IniRead, 8x1, Diana Action Type Grid (New CPI).ahk, Saved, 8x1
IniRead, 8x1Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 8x1Hidden
IniRead, 8x1Text, Diana Action Type Grid (New CPI).ahk, Saved, 8x1Text
IniRead, 8x2, Diana Action Type Grid (New CPI).ahk, Saved, 8x2
IniRead, 8x2Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 8x2Hidden
IniRead, 8x2Text, Diana Action Type Grid (New CPI).ahk, Saved, 8x2Text
IniRead, 8x3, Diana Action Type Grid (New CPI).ahk, Saved, 8x3
IniRead, 8x3Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 8x3Hidden
IniRead, 8x3Text, Diana Action Type Grid (New CPI).ahk, Saved, 8x3Text
IniRead, 8x4, Diana Action Type Grid (New CPI).ahk, Saved, 8x4
IniRead, 8x4Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 8x4Hidden
IniRead, 8x4Text, Diana Action Type Grid (New CPI).ahk, Saved, 8x4Text
IniRead, 9x1, Diana Action Type Grid (New CPI).ahk, Saved, 9x1
IniRead, 9x1Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 9x1Hidden
IniRead, 9x1Text, Diana Action Type Grid (New CPI).ahk, Saved, 9x1Text
IniRead, 9x2, Diana Action Type Grid (New CPI).ahk, Saved, 9x2
IniRead, 9x2Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 9x2Hidden
IniRead, 9x2Text, Diana Action Type Grid (New CPI).ahk, Saved, 9x2Text
IniRead, 9x3, Diana Action Type Grid (New CPI).ahk, Saved, 9x3
IniRead, 9x3Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 9x3Hidden
IniRead, 9x3Text, Diana Action Type Grid (New CPI).ahk, Saved, 9x3Text
IniRead, 9x4, Diana Action Type Grid (New CPI).ahk, Saved, 9x4
IniRead, 9x4Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 9x4Hidden
IniRead, 9x4Text, Diana Action Type Grid (New CPI).ahk, Saved, 9x4Text
IniRead, 10x1, Diana Action Type Grid (New CPI).ahk, Saved, 10x1
IniRead, 10x1Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 10x1Hidden
IniRead, 10x1Text, Diana Action Type Grid (New CPI).ahk, Saved, 10x1Text
IniRead, 10x2, Diana Action Type Grid (New CPI).ahk, Saved, 10x2
IniRead, 10x2Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 10x2Hidden
IniRead, 10x2Text, Diana Action Type Grid (New CPI).ahk, Saved, 10x2Text
IniRead, 10x3, Diana Action Type Grid (New CPI).ahk, Saved, 10x3
IniRead, 10x3Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 10x3Hidden
IniRead, 10x3Text, Diana Action Type Grid (New CPI).ahk, Saved, 10x3Text
IniRead, 10x4, Diana Action Type Grid (New CPI).ahk, Saved, 10x4
IniRead, 10x4Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 10x4Hidden
IniRead, 10x4Text, Diana Action Type Grid (New CPI).ahk, Saved, 10x4Text
IniRead, 11x1, Diana Action Type Grid (New CPI).ahk, Saved, 11x1
IniRead, 11x1Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 11x1Hidden
IniRead, 11x1Text, Diana Action Type Grid (New CPI).ahk, Saved, 11x1Text
IniRead, 11x2, Diana Action Type Grid (New CPI).ahk, Saved, 11x2
IniRead, 11x2Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 11x2Hidden
IniRead, 11x2Text, Diana Action Type Grid (New CPI).ahk, Saved, 11x2Text
IniRead, 11x3, Diana Action Type Grid (New CPI).ahk, Saved, 11x3
IniRead, 11x3Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 11x3Hidden
IniRead, 11x3Text, Diana Action Type Grid (New CPI).ahk, Saved, 11x3Text
IniRead, 11x4, Diana Action Type Grid (New CPI).ahk, Saved, 11x4
IniRead, 11x4Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 11x4Hidden
IniRead, 11x4Text, Diana Action Type Grid (New CPI).ahk, Saved, 11x4Text
IniRead, 12x1, Diana Action Type Grid (New CPI).ahk, Saved, 12x1
IniRead, 12x1Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 12x1Hidden
IniRead, 12x1Text, Diana Action Type Grid (New CPI).ahk, Saved, 12x1Text
IniRead, 12x2, Diana Action Type Grid (New CPI).ahk, Saved, 12x2
IniRead, 12x2Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 12x2Hidden
IniRead, 12x2Text, Diana Action Type Grid (New CPI).ahk, Saved, 12x2Text
IniRead, 12x3, Diana Action Type Grid (New CPI).ahk, Saved, 12x3
IniRead, 12x3Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 12x3Hidden
IniRead, 12x3Text, Diana Action Type Grid (New CPI).ahk, Saved, 12x3Text
IniRead, 12x4, Diana Action Type Grid (New CPI).ahk, Saved, 12x4
IniRead, 12x4Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 12x4Hidden
IniRead, 12x4Text, Diana Action Type Grid (New CPI).ahk, Saved, 12x4Text
IniRead, 13x1, Diana Action Type Grid (New CPI).ahk, Saved, 13x1
IniRead, 13x1Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 13x1Hidden
IniRead, 13x1Text, Diana Action Type Grid (New CPI).ahk, Saved, 13x1Text
IniRead, 13x2, Diana Action Type Grid (New CPI).ahk, Saved, 13x2
IniRead, 13x2Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 13x2Hidden
IniRead, 13x2Text, Diana Action Type Grid (New CPI).ahk, Saved, 13x2Text
IniRead, 13x3, Diana Action Type Grid (New CPI).ahk, Saved, 13x3
IniRead, 13x3Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 13x3Hidden
IniRead, 13x3Text, Diana Action Type Grid (New CPI).ahk, Saved, 13x3Text
IniRead, 13x4, Diana Action Type Grid (New CPI).ahk, Saved, 13x4
IniRead, 13x4Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 13x4Hidden
IniRead, 13x4Text, Diana Action Type Grid (New CPI).ahk, Saved, 13x4Text
IniRead, 14x1, Diana Action Type Grid (New CPI).ahk, Saved, 14x1
IniRead, 14x1Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 14x1Hidden
IniRead, 14x1Text, Diana Action Type Grid (New CPI).ahk, Saved, 14x1Text
IniRead, 14x2, Diana Action Type Grid (New CPI).ahk, Saved, 14x2
IniRead, 14x2Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 14x2Hidden
IniRead, 14x2Text, Diana Action Type Grid (New CPI).ahk, Saved, 14x2Text
IniRead, 14x3, Diana Action Type Grid (New CPI).ahk, Saved, 14x3
IniRead, 14x3Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 14x3Hidden
IniRead, 14x3Text, Diana Action Type Grid (New CPI).ahk, Saved, 14x3Text
IniRead, 14x4, Diana Action Type Grid (New CPI).ahk, Saved, 14x4
IniRead, 14x4Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 14x4Hidden
IniRead, 14x4Text, Diana Action Type Grid (New CPI).ahk, Saved, 14x4Text
IniRead, 15x1, Diana Action Type Grid (New CPI).ahk, Saved, 15x1
IniRead, 15x1Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 15x1Hidden
IniRead, 15x1Text, Diana Action Type Grid (New CPI).ahk, Saved, 15x1Text
IniRead, 15x2, Diana Action Type Grid (New CPI).ahk, Saved, 15x2
IniRead, 15x2Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 15x2Hidden
IniRead, 15x2Text, Diana Action Type Grid (New CPI).ahk, Saved, 15x2Text
IniRead, 15x3, Diana Action Type Grid (New CPI).ahk, Saved, 15x3
IniRead, 15x3Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 15x3Hidden
IniRead, 15x3Text, Diana Action Type Grid (New CPI).ahk, Saved, 15x3Text
IniRead, 15x4, Diana Action Type Grid (New CPI).ahk, Saved, 15x4
IniRead, 15x4Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 15x4Hidden
IniRead, 15x4Text, Diana Action Type Grid (New CPI).ahk, Saved, 15x4Text
IniRead, 16x1, Diana Action Type Grid (New CPI).ahk, Saved, 16x1
IniRead, 16x1Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 16x1Hidden
IniRead, 16x1Text, Diana Action Type Grid (New CPI).ahk, Saved, 16x1Text
IniRead, 16x2, Diana Action Type Grid (New CPI).ahk, Saved, 16x2
IniRead, 16x2Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 16x2Hidden
IniRead, 16x2Text, Diana Action Type Grid (New CPI).ahk, Saved, 16x2Text
IniRead, 16x3, Diana Action Type Grid (New CPI).ahk, Saved, 16x3
IniRead, 16x3Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 16x3Hidden
IniRead, 16x3Text, Diana Action Type Grid (New CPI).ahk, Saved, 16x3Text
IniRead, 16x4, Diana Action Type Grid (New CPI).ahk, Saved, 16x4
IniRead, 16x4Hidden, Diana Action Type Grid (New CPI).ahk, Saved, 16x4Hidden
IniRead, 16x4Text, Diana Action Type Grid (New CPI).ahk, Saved, 16x4Text

IniRead, FKeysPosX, Diana Action Type Grid (New CPI).ahk, Position, FKeysPosX
IniRead, FKeysPosY, Diana Action Type Grid (New CPI).ahk, Position, FKeysPosY

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
IniRead, toggleM, Diana Action Type Grid (New CPI).ahk, Aspect, Horizontal
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
	Gui, Add, Picture,x5 y5  w50 h20 gPicture, DRAG
	Gui, Add, Button, x5 y25 w50 h15 Center   gUnhide, Unhide
	Gui, Add, Button, x5 y40 w50 h15 Center gRotate, Rotate
	Gui, Color, ABCDEF,  Diana Action Type Grid (New CPI).ahk	
	;Gui, Show, w220 h650 x%FKeysPosX% y%FKeysPosY%	, Diana Action Type Grid (New CPI).ahk
	gosub CheckHidden
	Gui, Show, w830 h230 x%FKeysPosX% y%FKeysPosY%	, Diana Action Type Grid (New CPI).ahk
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
	Gui, Add, Button, x5 y40 w50 h15 Center gRotate, Rotate
	Gui, Color, ABCDEF,  Diana Action Type Grid (New CPI).ahk	
	;Gui, Show, w220 h650 x%FKeysPosX% y%FKeysPosY%	, Diana Action Type Grid (New CPI).ahk
	gosub CheckHidden
	Gui, Show, h830 w220 x%FKeysPosX% y%FKeysPosY%	, Diana Action Type Grid (New CPI).ahk	
	}
WinSet, Transcolor, ABCDEF, Diana Action Type Grid (New CPI).ahk
WinMove, Diana Action Type Grid (New CPI).ahk, x%FKeysPosX% y%FKeysPosY%	
return

Rotate:
IniRead, toggleM, Diana Action Type Grid (New CPI).ahk, Aspect, Horizontal
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
	Gui, Show, h830 w220
	IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Aspect, Horizontal
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
	Gui, Show, h230 w830
	IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Aspect, Horizontal
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
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  1x1Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  1x2Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  1x3Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  1x4Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  2x1Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  2x2Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  2x3Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  2x4Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  3x1Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  3x2Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  3x3Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  3x4Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  4x1Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  4x2Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  4x3Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  4x4Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  5x1Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  5x2Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  5x3Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  5x4Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  6x1Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  6x2Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  6x3Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  6x4Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  7x1Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  7x2Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  7x3Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  7x4Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  8x1Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  8x2Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  8x3Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  8x4Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  9x1Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  9x2Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  9x3Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  9x4Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  10x1Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  10x2Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  10x3Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  10x4Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  11x1Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  11x2Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  11x3Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  11x4Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  12x1Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  12x2Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  12x3Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  12x4Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  13x1Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  13x2Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  13x3Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  13x4Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  14x1Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  14x2Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  14x3Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  14x4Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  15x1Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  15x2Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  15x3Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  15x4Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  16x1Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  16x2Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  16x3Hidden
IniWrite, 0, Diana Action Type Grid (New CPI).ahk, Saved,  16x4Hidden
return

UpdateShortcut:
InputBox, NewText,   New Shortcut Text,    Enter the new shortcut text that will appear on the button:, , 300, 150, , , , , % %ThisThreadText%
InputBox, NewAction, New Docketing Action, Enter the new Action Type to inject into docketing:, , 300, 150, , , , , % ThisShortcut
IniWrite, %NewText%,   Diana Action Type Grid (New CPI).ahk, Saved, %ThisThreadText%
IniWrite, %NewAction%, Diana Action Type Grid (New CPI).ahk, Saved, %ThisThread%
return

CPIInjectAction:
Page.Disconnect()
Page := ChromeInst.GetPage()
cpi_location := Page.Evaluate("window.location.href").Value
if InStr(cpi_location, "knobbeAgent/patent/patfrm")
	OutputVar := "https://web05bak.computerpackages.com/knobbeAgent/patent/patfrmActionDue.aspx?key=-1&appId=" GetAppID()
else if InStr(cpi_location, "knobbe/patent/patfrm")
	OutputVar := "https://web05.computerpackages.com/knobbe/patent/patfrmActionDue.aspx?key=-1&appId=" GetAppID()
else if InStr(cpi_location, "knobbeagent/trademark/tmkfrm")
	OutputVar := "https://web05bak.computerpackages.com/knobbeAgent/trademark/tmkfrmActionDue.aspx?key=-1&tmkId=" GetTmkID()		
else if InStr(cpi_location, "knobbe/trademark/tmkfrm")
	OutputVar := "https://web05.computerpackages.com/knobbe/trademark/tmkfrmActionDue.aspx?key=-1&tmkId=" GetTmkID()	

if (!InStr(cpi_location, "-1") || Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType').value").Value != "")
	{
	Page.Call("Target.createTarget", {"url" : OutputVar })
	Page.Disconnect()
	Sleep 2000
	Page := ChromeInst.GetPage()
	Page.WaitForLoad()
	Sleep 500
	}

Page := ChromeInst.GetPage()
Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = '" ActionType "'; document.getElementById('ctl00_Detail_tplFormview_BaseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
WinActivate, ahk_exe chrome.exe
Sleep 100
SendInput, {Tab}
Page.Disconnect()
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
		IniRead, 1x1, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 1x1Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button1
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 1x1Hidden
		return
		}
	else
		{
		IniRead, 1x1, Diana Action Type Grid (New CPI).ahk, Saved, 1x1
		ActionType = %1x1%
		gosub CPIInjectAction
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
		IniRead, 1x2, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 1x2Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button2
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 1x2Hidden
		return
		}
	else
		{
		IniRead, 1x2, Diana Action Type Grid (New CPI).ahk, Saved, 1x2
		ActionType = %1x2%
		gosub CPIInjectAction
		}
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
		IniRead, 1x3, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 1x3Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button3
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 1x3Hidden
		return
		}
	else
		{
		IniRead, 1x3, Diana Action Type Grid (New CPI).ahk, Saved, 1x3
		ActionType = %1x3%
		gosub CPIInjectAction
		}
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
		IniRead, 1x4, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 1x4Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button4
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 1x4Hidden
		return
		}
	else
		{
		IniRead, 1x4, Diana Action Type Grid (New CPI).ahk, Saved, 1x4
		ActionType = %1x4%
		gosub CPIInjectAction
		}
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
		IniRead, 2x1, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 2x1Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button5
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 2x1Hidden
		return
		}
	else
		{
		IniRead, 2x1, Diana Action Type Grid (New CPI).ahk, Saved, 2x1
		ActionType = %2x1%
		gosub CPIInjectAction
		}
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
		IniRead, 2x2, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 2x2Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button6
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 2x2Hidden
		return
		}
	else
		{
		IniRead, 2x2, Diana Action Type Grid (New CPI).ahk, Saved, 2x2
		ActionType = %2x2%
		gosub CPIInjectAction
		}
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
		IniRead, 2x3, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 2x3Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button7
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 2x3Hidden
		return
		}
	else
		{
		IniRead, 2x3, Diana Action Type Grid (New CPI).ahk, Saved, 2x3
		ActionType = %2x3%
		gosub CPIInjectAction
		}
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
		IniRead, 2x4, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 2x4Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button8
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 2x4Hidden
		return
		}
	else
		{
		IniRead, 2x4, Diana Action Type Grid (New CPI).ahk, Saved, 2x4
		ActionType = %2x4%
		gosub CPIInjectAction
		}
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
		IniRead, 3x1, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 3x1Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button9
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 3x1Hidden
		return
		}
	else
		{
		IniRead, 3x1, Diana Action Type Grid (New CPI).ahk, Saved, 3x1
		ActionType = %3x1%
		gosub CPIInjectAction
		}
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
		IniRead, 3x2, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 3x2Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button10
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 3x2Hidden
		return
		}
	else
		{
		IniRead, 3x2, Diana Action Type Grid (New CPI).ahk, Saved, 3x2
		ActionType = %3x2%
		gosub CPIInjectAction
		}
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
		IniRead, 3x3, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 3x3Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button11
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 3x3Hidden
		return
		}
	else
		{
		IniRead, 3x3, Diana Action Type Grid (New CPI).ahk, Saved, 3x3
		ActionType = %3x3%
		gosub CPIInjectAction
		}
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
		IniRead, 3x4, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 3x4Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button12
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 3x4Hidden
		return
		}
	else
		{
		IniRead, 3x4, Diana Action Type Grid (New CPI).ahk, Saved, 3x4
		ActionType = %3x4%
		gosub CPIInjectAction
		}
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
		IniRead, 4x1, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 4x1Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button13
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 4x1Hidden
		return
		}
	else
		{
		IniRead, 4x1, Diana Action Type Grid (New CPI).ahk, Saved, 4x1
		ActionType = %4x1%
		gosub CPIInjectAction
		}
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
		IniRead, 4x2, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 4x2Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button14
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 4x2Hidden
		return
		}
	else
		{
		IniRead, 4x2, Diana Action Type Grid (New CPI).ahk, Saved, 4x2
		ActionType = %4x2%
		gosub CPIInjectAction
		}
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
		IniRead, 4x3, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 4x3Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button15
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 4x3Hidden
		return
		}
	else
		{
		IniRead, 4x3, Diana Action Type Grid (New CPI).ahk, Saved, 4x3
		ActionType = %4x3%
		gosub CPIInjectAction
		}
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
		IniRead, 4x4, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 4x4Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button16
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 4x4Hidden
		return
		}
	else
		{
		IniRead, 4x4, Diana Action Type Grid (New CPI).ahk, Saved, 4x4
		ActionType = %4x4%
		gosub CPIInjectAction
		}
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
		IniRead, 5x1, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 5x1Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button17
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 5x1Hidden
		return
		}
	else
		{
		IniRead, 5x1, Diana Action Type Grid (New CPI).ahk, Saved, 5x1
		ActionType = %5x1%
		gosub CPIInjectAction
		}
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
		IniRead, 5x2, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 5x2Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button18
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 5x2Hidden
		return
		}
	else
		{
		IniRead, 5x2, Diana Action Type Grid (New CPI).ahk, Saved, 5x2
		ActionType = %5x2%
		gosub CPIInjectAction
		}
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
		IniRead, 5x3, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 5x3Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button19
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 5x3Hidden
		return
		}
	else
		{
		IniRead, 5x3, Diana Action Type Grid (New CPI).ahk, Saved, 5x3
		ActionType = %5x3%
		gosub CPIInjectAction
		}
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
		IniRead, 5x4, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 5x4Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button20
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 5x4Hidden
		return
		}
	else
		{
		IniRead, 5x4, Diana Action Type Grid (New CPI).ahk, Saved, 5x4
		ActionType = %5x4%
		gosub CPIInjectAction
		}
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
		IniRead, 6x1, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 6x1Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button21
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 6x1Hidden
		return
		}
	else
		{
		IniRead, 6x1, Diana Action Type Grid (New CPI).ahk, Saved, 6x1
		ActionType = %6x1%
		gosub CPIInjectAction
		}
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
		IniRead, 6x2, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 6x2Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button22
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 6x2Hidden
		return
		}
	else
		{
		IniRead, 6x2, Diana Action Type Grid (New CPI).ahk, Saved, 6x2
		ActionType = %6x2%
		gosub CPIInjectAction
		}
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
		IniRead, 6x3, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 6x3Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button23
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 6x3Hidden
		return
		}
	else
		{
		IniRead, 6x3, Diana Action Type Grid (New CPI).ahk, Saved, 6x3
		ActionType = %6x3%
		gosub CPIInjectAction
		}
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
		IniRead, 6x4, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 6x4Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button24
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 6x4Hidden
		return
		}
	else
		{
		IniRead, 6x4, Diana Action Type Grid (New CPI).ahk, Saved, 6x4
		ActionType = %6x4%
		gosub CPIInjectAction
		}
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
		IniRead, 7x1, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 7x1Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button25
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 7x1Hidden
		return
		}
	else
		{
		IniRead, 7x1, Diana Action Type Grid (New CPI).ahk, Saved, 7x1
		ActionType = %7x1%
		gosub CPIInjectAction
		}
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
		IniRead, 7x2, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 7x2Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button26
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 7x2Hidden
		return
		}
	else
		{
		IniRead, 7x2, Diana Action Type Grid (New CPI).ahk, Saved, 7x2
		ActionType = %7x2%
		gosub CPIInjectAction
		}
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
		IniRead, 7x3, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 7x3Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button27
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 7x3Hidden
		return
		}
	else
		{
		IniRead, 7x3, Diana Action Type Grid (New CPI).ahk, Saved, 7x3
		ActionType = %7x3%
		gosub CPIInjectAction
		}
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
		IniRead, 7x4, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 7x4Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button28
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 7x4Hidden
		return
		}
	else
		{
		IniRead, 7x4, Diana Action Type Grid (New CPI).ahk, Saved, 7x4
		ActionType = %7x4%
		gosub CPIInjectAction
		}
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
		IniRead, 8x1, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 8x1Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button29
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 8x1Hidden
		return
		}
	else
		{
		IniRead, 8x1, Diana Action Type Grid (New CPI).ahk, Saved, 8x1
		ActionType = %8x1%
		gosub CPIInjectAction
		}
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
		IniRead, 8x2, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 8x2Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button30
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 8x2Hidden
		return
		}
	else
		{
		IniRead, 8x2, Diana Action Type Grid (New CPI).ahk, Saved, 8x2
		ActionType = %8x2%
		gosub CPIInjectAction
		}
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
		IniRead, 8x3, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 8x3Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button31
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 8x3Hidden
		return
		}
	else
		{
		IniRead, 8x3, Diana Action Type Grid (New CPI).ahk, Saved, 8x3
		ActionType = %8x3%
		gosub CPIInjectAction
		}
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
		IniRead, 8x4, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 8x4Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button32
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 8x4Hidden
		return
		}
	else
		{
		IniRead, 8x4, Diana Action Type Grid (New CPI).ahk, Saved, 8x4
		ActionType = %8x4%
		gosub CPIInjectAction
		}
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
		IniRead, 9x1, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 9x1Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button33
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 9x1Hidden
		return
		}
	else
		{
		IniRead, 9x1, Diana Action Type Grid (New CPI).ahk, Saved, 9x1
		ActionType = %9x1%
		gosub CPIInjectAction
		}
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
		IniRead, 9x2, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 9x2Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button34
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 9x2Hidden
		return
		}
	else
		{
		IniRead, 9x2, Diana Action Type Grid (New CPI).ahk, Saved, 9x2
		ActionType = %9x2%
		gosub CPIInjectAction
		}
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
		IniRead, 9x3, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 9x3Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button35
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 9x3Hidden
		return
		}
	else
		{
		IniRead, 9x3, Diana Action Type Grid (New CPI).ahk, Saved, 9x3
		ActionType = %9x3%
		gosub CPIInjectAction
		}
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
		IniRead, 9x4, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 9x4Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button36
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 9x4Hidden
		return
		}
	else
		{
		IniRead, 9x4, Diana Action Type Grid (New CPI).ahk, Saved, 9x4
		ActionType = %9x4%
		gosub CPIInjectAction
		}
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
		IniRead, 10x1, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 10x1Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button37
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 10x1Hidden
		return
		}
	else
		{
		IniRead, 10x1, Diana Action Type Grid (New CPI).ahk, Saved, 10x1
		ActionType = %10x1%
		gosub CPIInjectAction
		}
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
		IniRead, 10x2, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 10x2Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button38
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 10x2Hidden
		return
		}
	else
		{
		IniRead, 10x2, Diana Action Type Grid (New CPI).ahk, Saved, 10x2
		ActionType = %10x2%
		gosub CPIInjectAction
		}
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
		IniRead, 10x3, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 10x3Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button39
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 10x3Hidden
		return
		}
	else
		{
		IniRead, 10x3, Diana Action Type Grid (New CPI).ahk, Saved, 10x3
		ActionType = %10x3%
		gosub CPIInjectAction
		}
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
		IniRead, 10x4, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 10x4Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button40
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 10x4Hidden
		return
		}
	else
		{
		IniRead, 10x4, Diana Action Type Grid (New CPI).ahk, Saved, 10x4
		ActionType = %10x4%
		gosub CPIInjectAction
		}
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
		IniRead, 11x1, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 11x1Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button41
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 11x1Hidden
		return
		}
	else
		{
		IniRead, 11x1, Diana Action Type Grid (New CPI).ahk, Saved, 11x1
		ActionType = %11x1%
		gosub CPIInjectAction
		}
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
		IniRead, 11x2, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 11x2Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button42
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 11x2Hidden
		return
		}
	else
		{
		IniRead, 11x2, Diana Action Type Grid (New CPI).ahk, Saved, 11x2
		ActionType = %11x2%
		gosub CPIInjectAction
		}
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
		IniRead, 11x3, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 11x3Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button43
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 11x3Hidden
		return
		}
	else
		{
		IniRead, 11x3, Diana Action Type Grid (New CPI).ahk, Saved, 11x3
		ActionType = %11x3%
		gosub CPIInjectAction
		}
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
		IniRead, 11x4, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 11x4Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button44
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 11x4Hidden
		return
		}
	else
		{
		IniRead, 11x4, Diana Action Type Grid (New CPI).ahk, Saved, 11x4
		ActionType = %11x4%
		gosub CPIInjectAction
		}
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
		IniRead, 12x1, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 12x1Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button45
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 12x1Hidden
		return
		}
	else
		{
		IniRead, 12x1, Diana Action Type Grid (New CPI).ahk, Saved, 12x1
		ActionType = %12x1%
		gosub CPIInjectAction
		}
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
		IniRead, 12x2, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 12x2Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button46
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 12x2Hidden
		return
		}
	else
		{
		IniRead, 12x2, Diana Action Type Grid (New CPI).ahk, Saved, 12x2
		ActionType = %12x2%
		gosub CPIInjectAction
		}
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
		IniRead, 12x3, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 12x3Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button47
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 12x3Hidden
		return
		}
	else
		{
		IniRead, 12x3, Diana Action Type Grid (New CPI).ahk, Saved, 12x3
		ActionType = %12x3%
		gosub CPIInjectAction
		}
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
		IniRead, 12x4, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 12x4Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button48
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 12x4Hidden
		return
		}
	else
		{
		IniRead, 12x4, Diana Action Type Grid (New CPI).ahk, Saved, 12x4
		ActionType = %12x4%
		gosub CPIInjectAction
		}
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
		IniRead, 13x1, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 13x1Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button49
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 13x1Hidden
		return
		}
	else
		{
		IniRead, 13x1, Diana Action Type Grid (New CPI).ahk, Saved, 13x1
		ActionType = %13x1%
		gosub CPIInjectAction
		}
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
		IniRead, 13x2, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 13x2Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button50
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 13x2Hidden
		return
		}
	else
		{
		IniRead, 13x2, Diana Action Type Grid (New CPI).ahk, Saved, 13x2
		ActionType = %13x2%
		gosub CPIInjectAction
		}
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
		IniRead, 13x3, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 13x3Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button51
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 13x3Hidden
		return
		}
	else
		{
		IniRead, 13x3, Diana Action Type Grid (New CPI).ahk, Saved, 13x3
		ActionType = %13x3%
		gosub CPIInjectAction
		}
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
		IniRead, 13x4, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 13x4Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button52
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 13x4Hidden
		return
		}
	else
		{
		IniRead, 13x4, Diana Action Type Grid (New CPI).ahk, Saved, 13x4
		ActionType = %13x4%
		gosub CPIInjectAction
		}
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
		IniRead, 14x1, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 14x1Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button53
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 14x1Hidden
		return
		}
	else
		{
		IniRead, 14x1, Diana Action Type Grid (New CPI).ahk, Saved, 14x1
		ActionType = %14x1%
		gosub CPIInjectAction
		}
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
		IniRead, 14x2, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 14x2Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button54
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 14x2Hidden
		return
		}
	else
		{
		IniRead, 14x2, Diana Action Type Grid (New CPI).ahk, Saved, 14x2
		ActionType = %14x2%
		gosub CPIInjectAction
		}
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
		IniRead, 14x3, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 14x3Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button55
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 14x3Hidden
		return
		}
	else
		{
		IniRead, 14x3, Diana Action Type Grid (New CPI).ahk, Saved, 14x3
		ActionType = %14x3%
		gosub CPIInjectAction
		}
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
		IniRead, 14x4, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 14x4Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button56
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 14x4Hidden
		return
		}
	else
		{
		IniRead, 14x4, Diana Action Type Grid (New CPI).ahk, Saved, 14x4
		ActionType = %14x4%
		gosub CPIInjectAction
		}
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
		IniRead, 15x1, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 15x1Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button57
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 15x1Hidden
		return
		}
	else
		{
		IniRead, 15x1, Diana Action Type Grid (New CPI).ahk, Saved, 15x1
		ActionType = %15x1%
		gosub CPIInjectAction
		}
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
		IniRead, 15x2, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 15x2Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button58
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 15x2Hidden
		return
		}
	else
		{
		IniRead, 15x2, Diana Action Type Grid (New CPI).ahk, Saved, 15x2
		ActionType = %15x2%
		gosub CPIInjectAction
		}
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
		IniRead, 15x3, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 15x3Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button59
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 15x3Hidden
		return
		}
	else
		{
		IniRead, 15x3, Diana Action Type Grid (New CPI).ahk, Saved, 15x3
		ActionType = %15x3%
		gosub CPIInjectAction
		}
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
		IniRead, 15x4, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 15x4Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button60
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 15x4Hidden
		return
		}
	else
		{
		IniRead, 15x4, Diana Action Type Grid (New CPI).ahk, Saved, 15x4
		ActionType = %15x4%
		gosub CPIInjectAction
		}
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
		IniRead, 16x1, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 16x1Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button61
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 16x1Hidden
		return
		}
	else
		{
		IniRead, 16x1, Diana Action Type Grid (New CPI).ahk, Saved, 16x1
		ActionType = %16x1%
		gosub CPIInjectAction
		}
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
		IniRead, 16x2, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 16x2Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button62
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 16x2Hidden
		return
		}
	else
		{
		IniRead, 16x2, Diana Action Type Grid (New CPI).ahk, Saved, 16x2
		ActionType = %16x2%
		gosub CPIInjectAction
		}
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
		IniRead, 16x3, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 16x3Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button63
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 16x3Hidden
		return
		}
	else
		{
		IniRead, 16x3, Diana Action Type Grid (New CPI).ahk, Saved, 16x3
		ActionType = %16x3%
		gosub CPIInjectAction
		}
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
		IniRead, 16x4, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%
		IniRead, 16x4Text, Diana Action Type Grid (New CPI).ahk, Saved, %A_ThisLabel%Text
		return
		}
	if (IsShiftDown = "D")
		{
		GuiControl, Hide , Button64
		IniWrite, 1, Diana Action Type Grid (New CPI).ahk, Saved, 16x4Hidden
		return
		}
	else
		{
		IniRead, 16x4, Diana Action Type Grid (New CPI).ahk, Saved, 16x4
		ActionType = %16x4%
		gosub CPIInjectAction
		}
return

#IfWinActive

/*

[Position]
FKeysPosX=23
FKeysPosY=769

[Set2]
Hidden=0

[Set3]
Hidden=0

[Saved]
1x1=INT-PAT STATUS CHECK
1x1Hidden=0
1x1Text=PAT STATUS
1x2=INT-PAT STATUS CHECK
1x2Hidden=0
1x2Text=PAT STATUS
1x3=INT-TM STATUS ACTION
1x3Hidden=0
1x3Text=TM STATUS
1x4=
1x4Hidden=0
1x4Text=
2x1=INT-PAT STATUS CHECK
2x1Hidden=0
2x1Text=asdf
2x2=INT-PAT INSTR APPLICATION FILING
2x2Hidden=0
2x2Text=PAT FILING INSTR
2x3=INT-TM INSTR APPLICATION FILING
2x3Hidden=0
2x3Text=TM FILING NO PR
2x4=
2x4Hidden=0
2x4Text=
3x1=
3x1Hidden=0
3x1Text=
3x2=INT-PAT INSTR REQUEST EXAM
3x2Hidden=0
3x2Text=PAT EXAM REQUEST
3x3=INT-TM INSTR APPLICATION FILING BY DUE DATE
3x3Hidden=0
3x3Text=TM FILING PRIOR
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
9x1=INT-PAT FA REQUEST EARLY INSTR ATTY
9x1Hidden=0
9x1Text=PAT EARLY INSTR
9x2=INT-PAT FURTHER INSTR ATTY
9x2Hidden=0
9x2Text=PAT FURTH ATTY
9x3=INT-TM FA REQUEST FURTHER INSTR
9x3Hidden=0
9x3Text=TM FURTH
9x4=INT-TM REG CERTIFICATE DUE
9x4Hidden=0
9x4Text=TM REG CERT
10x1Text=PAT OA DIV
10x1=INT-PAT DIV OFFICE ACTION
10x1Hidden=0
10x2Text=PAT OA
10x2=INT-PAT OFFICE ACTION
10x2Hidden=0
10x3Text=TM FA REQ EARLY
10x3=INT-TM FA REQUEST EARLY INSTR
10x3Hidden=0
10x4Text=TM PUB
10x4=INT-TM FIRST PUBLICATION
10x4Hidden=0
11x1Text=PAT PUB
11x1=INT-PAT APPLICATION PUBLICATION
11x1Hidden=0
11x2Text=PAT CITED REFS
11x2=INT-PAT FOREIGN ACTION REFS
11x2Hidden=0
11x3Text=TM POSS OPP
11x3=INT-TM POSS OPP
11x3Hidden=0
11x4Text=TM EARLY INSTR
11x4=INT-TM FA REQUEST EARLY INSTR
11x4Hidden=0
12x1Text=EP OA 4M
12x1=INT-PAT EP OFFICE ACTION 4M
12x1Hidden=0
12x2Text=PCT ART 2M
12x2=INT-PAT PCT ART.19 2M DEADLINE
12x2Hidden=0
12x3Text=TM OA
12x3=INT-TM OFFICE ACTION
12x3Hidden=0
12x4Text=TM OPP BRIEF
12x4=INT-TM BRIEF EVIDENCE DEADLINE
12x4Hidden=0
13x1Text=OA EARLY
13x1=INT-PAT OFFICE ACTION INSTR TO FA
13x1Hidden=0
13x2Text=PCT ART 16M
13x2=INT-PAT PCT ART.19 16M DEADLINE
13x2Hidden=0
13x3Text=TM CLOSE MAC
13x3=DKT-TM CLOSE MACRO REMINDER
13x3Hidden=0
13x4Text=TM CANCEL RESP
13x4=INT-TM CANCEL RESPONSE
13x4Hidden=0
14x1Text=CN grace period
14x1=INT-PAT CN NOTIFICATION PERIOD DEADLINE
14x1Hidden=0
14x2Text=PAT DEMAND 22M
14x2=INT-PAT PCT DEMAND 22M DEADLINE
14x2Hidden=0
14x3Text=TM OA
14x3=INT-TM OFFICE ACTION
14x3Hidden=0
14x4Text=REG FEES
14x4=INT-TM REGISTRATION FEE
14x4Hidden=0
15x1Text=
15x1=
15x1Hidden=0
15x2Text=PAT OA EXT. DIV
15x2=INT-PAT EXTENSION WITH DIV CONFIRMED
15x2Hidden=0
15x3Text=
15x3=
15x3Hidden=0
15x4Text=APPEAL
15x4=INT-TM APPEAL NOTICE DEADLINE
15x4Hidden=0
16x1Text=TM REG FEE
16x1=INT-TM REGISTRATION FEE
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

[Aspect]
Horizontal=1

*/

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

GetAppID() {
user := "Paperboy@knobbe.com"
pass := "knobbedocket"
Page := ChromeInst.GetPage()
CPIClientCode := Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_CaseNumber').value").Value
CPIClientCode2 := Page.Evaluate("document.getElementById('ctl00_Detail_CaseNumber').value").Value

if (CPIClientCode == "")
	CPIClientCode := CPIClientCode2

EndPoint1 := "https://web05.computerpackages.com/knobbews/api/Knobbe?queryString="
EndPoint2 := "select appid from tblpatcountryapplication WHERE casenumber "
EndPoint3 := "= '" CPIClientCode "';"
http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http.Open("GET", EndPoint1 . EndPoint2 . EndPoint3, true)
http.SetRequestHeader("Authorization", "Basic "  Base64Encode(user ":" pass) )
http.Send()
while (http.Responsetext == "")
	Sleep 100
value := JSON.Load(http.Responsetext)
gosub RecordAPIUses
return % value.Table[1].appid
}

GetTmkID() {
user := "Paperboy@knobbe.com"
pass := "knobbedocket"
Page := ChromeInst.GetPage()
CPIClientCode := Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_CaseNumber').value").Value
CPIClientCode2 := Page.Evaluate("document.getElementById('ctl00_Detail_CaseNumber').value").Value

if (CPIClientCode == "")
	CPIClientCode := CPIClientCode2

EndPoint1 := "https://web05.computerpackages.com/knobbews/api/Knobbe?queryString="
EndPoint2 := "select tmkid from tblTmkTrademark WHERE casenumber "
EndPoint3 := "= '" CPIClientCode "';"
http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http.Open("GET", EndPoint1 . EndPoint2 . EndPoint3, true)
http.SetRequestHeader("Authorization", "Basic "  Base64Encode(user ":" pass) )
http.Send()
while (http.Responsetext == "")
	Sleep 100
value := JSON.Load(http.Responsetext)
gosub RecordAPIUses
return % value.Table[1].tmkId
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

RecordAPIUses:	
IniRead, APIUses, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, APIUses
APIUses++
IniWrite, %APIUses%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, APIUses
return
