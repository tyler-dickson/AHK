#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

FormatTime,time,,h:mm:ss tt   ;Time with :
Gui, Add, StatusBar, vMyStatusBar, %time%  ;Status bar
;Gui, Show, x223 y90 h400 w400,
Gui +Resize 
Gui, Add, Button, gExit, Exit This Example
Gui, Add, Button, gUpdate1, Update Registry to 1
Gui, Add, Button, gUpdate0, Update Registry to 0
Gui, Show, x223 y90 h400 w400,
MenuHandler:
;Return
SetTimer, submit1, 500
return

submit1:   
Gui, Submit, NoHide
FormatTime,time,,h:mm:ss tt   ;Time with :
SB_SetText(time)
return


Exit:
ExitApp




Update1:
RegWrite, REG_DWORD, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Outlook\Preferences, SHOWCONTACTFIELDOBSOLETE, 1
return

Update0:
RegWrite, REG_DWORD, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Outlook\Preferences, SHOWCONTACTFIELDOBSOLETE, 0
return
