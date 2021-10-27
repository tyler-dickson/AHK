#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

#CapsLock::
Gui, New, AlwaysOnTop -Caption +Owner
Gui, Add, Button, Center x115 w200 gTransTask, Transparent Taskbar
Gui, Add, Button, Center x115 w200 gSolidTask, Solid Taskbar
Gui, Add, Button, Center x115 w200 gRoundCorners, Round Corners
Gui, Add, Button, Center x115 w200 gHoleInMiddle, Hole in Middle
Gui, Add, Button, Center x115 w200 gHexagon, Hexagon
Gui, Add, Button, Center x115 w200 gTriangle, Triangle
Gui, Add, Button, Center x115 w200 gRightArrow, Right Arrow
Gui, Add, Button, Center x115 w200 gCloseGUI, Close GUI
Gui, Add, Button, Center x115 w200 gDisableX, Disable Active Window
Gui, Add, Picture,  x200 +BackgroundTrans gPicture, top-left.png
Gui, Show, w500 h500
gosub Hexagon
return

DisableX:
Gui, Submit
Sleep 2000
DisableCloseButton(hWnd="") {
 If hWnd=
    hWnd:=WinExist("A")
 hSysMenu:=DllCall("GetSystemMenu","Int",hWnd,"Int",FALSE)
 nCnt:=DllCall("GetMenuItemCount","Int",hSysMenu)
 DllCall("RemoveMenu","Int",hSysMenu,"UInt",nCnt-1,"Uint","0x400")
 DllCall("RemoveMenu","Int",hSysMenu,"UInt",nCnt-2,"Uint","0x400")
 DllCall("DrawMenuBar","Int",hWnd)
Return ""
}
Sleep 2000
Gui, Show
return


TransTask:
WinSet, Transparent, 170, ahk_class rctrl_renwnd32 ; Shell_TrayWnd
return

SolidTask:
WinSet, Transparent, 255, ahk_class rctrl_renwnd32 ; Shell_TrayWnd
return

HoleInMiddle:
WinSet, Region, 0-0 300-0 300-300 0-300 0-0   100-100 200-100 200-200 100-200 100-100, ahk_class AutoHotkeyGUI
return

RoundCorners:
WinSet, Region, 0-0 W500 H500 R40-40 , ahk_class AutoHotkeyGUI
return

Hexagon:
WinSet, Region, 110-0 325-0 435-190 325-375 110-375 0-190, ahk_class AutoHotkeyGUI
return

Triangle:
WinSet, Region, 110-0 325-0 218-250, ahk_class AutoHotkeyGUI
return

RightArrow:
WinSet, Region, 0-70 200-70 200-0 400-135 200-270 200-200 0-200 0-70, ahk_class AutoHotkeyGUI
return

Picture:
PostMessage, 0xA1, 2,,, A
return

CloseGUI:
GuiClose:
ExitApp
return


