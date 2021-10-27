#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

WindowWidth := 500
WindowHeight := 300

#3::
Gui +Resize
Gui Add, Edit, w930 r1 vURL, https://autohotkey.com/boards/
Gui Add, Button, x+6 yp w44 Default, Go
Gui Add, ActiveX, xm w%WindowWidth% h%WindowHeight% vWB, Shell.Explorer
;Gui Add, ActiveX, xm w1280 h720 vWB, Shell.Explorer
ComObjConnect(WB, WB_events)  ; Connect WB's events to the WB_events class object.
Gui Show
; Continue on to load the initial page:
ButtonGo:
Gui Submit, NoHide
WB.Navigate(URL)
WB.silent := true 
SetTimer, CheckWindowSize, 100
return

class WB_events
{
    NavigateComplete2(wb, NewURL)
    {
        GuiControl,, URL, %NewURL%  ; Update the URL edit control.
    }
}


CheckWindowSize:
WinGetPos, WindowPosX, WindowPosY, WindowWidth, WindowHeight, test - Copy.ahk,  ; ahk_class AutoHotkeyGUI
;MsgBox, % WindowWidth " | " WindowHeight
GuiControl, Move , WB, w%WindowWidth% h%WindowHeight%
return

GuiClose:
ExitApp

return