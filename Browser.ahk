#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)


WindowWidth := 1200
WindowHeight := 800


Gui +Resize
Gui Add, Edit, x5 w400 r1 vURL, https://www.google.com
Gui Add, Button, x+6 yp w50 Default gGoButton, Go
Gui Add, Button, x+6 yp w100 gSwitchSystem, System Switch
Gui Add, Button, x+6 yp w100 , EFS Fill
Gui Add, Button, x+6 yp w100 , EFS Fee Login
Gui Add, ActiveX, Section xm w%WindowWidth% h%WindowHeight% vie, Shell.Explorer
;Gui Add, ActiveX, xm w1280 h720 vie, Shell.Explorer
ComObjConnect(ie, ie_events)  ; Connect ie's events to the ie_events class object.
Gui, Add, Button, w50 h50 Section xs ys, Test
Gui, Add, Button, w50 h50 xs+55 ys, Test2
Gui, Add, Button, w50 h50 xp+55 ys, Test3
Gui, Add, Button, w50 h50 xp+55 ys, Test4
Gui, Add, Button, w50 h50 xp+55 ys, Test5
Gui, Add, Button, w50 h50 xp+55 ys, Test6
Gui, Add, Button, w50 h50 xp+55 ys, Test7
Gui, Add, Button, w50 h50 xp+55 ys, Test8
Gui, Add, Button, w50 h50 xp+55 ys, Test9
Gui, Add, Button, w50 h50 xp+55 ys, Test10
Gui Show
; Continue on to load the initial page:
GoButton:
Gui Submit, NoHide
ie.Navigate(URL)
ie.silent := true 
SetTimer, CheckWindowSize, 100
return

class ie_events
{
    NavigateComplete2(ie, NewURL)
    {
        GuiControl,, URL, %NewURL%  ; Update the URL edit control.
    }
}

SwitchSystem:
MsgBox,4, This is a test., Text.
return

^v::
SendInput %Clipboard%
return

CheckWindowSize:
WinGetPos, WindowPosX, WindowPosY, WindowWidth, WindowHeight, Browser.ahk,  ; ahk_class AutoHotkeyGUI
WindowWidth := WindowWidth - 20
WindowHeight := WindowHeight - 150
ButtonHeight := WindowHeight + 50
GuiControl, Move , ie, x0 w%WindowWidth% h%WindowHeight%
GuiControl, Move, Button5, y%ButtonHeight%
GuiControl, Move, Button6, y%ButtonHeight%
GuiControl, Move, Button7, y%ButtonHeight%
GuiControl, Move, Button8, y%ButtonHeight%
GuiControl, Move, Button9, y%ButtonHeight%
GuiControl, Move, Button10, y%ButtonHeight%
GuiControl, Move, Button11, y%ButtonHeight%
GuiControl, Move, Button12, y%ButtonHeight%
GuiControl, Move, Button13, y%ButtonHeight%
GuiControl, Move, Button14, y%ButtonHeight%
return

GuiClose:
ExitApp

return


F1::
SendInput ^c
Clipwait .25
;Gui, Submit
SplashTextOn, 250, , Opening a TM in docketing.
;OutputVar = http://oc-docketing/CPi/tmkschTrademark.aspx
OutputVar = https://www.google.com
if  hWnd :=  WinExist("ahk_class AutoHotkeyGUI")
{
   For ie in ComObjConnect(ie, ie_events).Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
   ie.Visible := True
   params := [OutputVar, 32]
}
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
SplashTextOff
return




