#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)

return

#RButton::
OpenWorkSpace:
Send ^c
Sleep 200
WinActivate ahk_class rctrl_renwnd32
Sleep 200
SendInput {Alt}
Sleep 50
SendInput w
Sleep 50
SendInput sw
WinWait ahk_class #32770
Sleep 500
MouseMove, %A_CaretX%, %A_CaretY%        ;Win+C hotkey
NewLocation := A_CaretX + 230
Click down
Sleep 300
MouseMove, %NewLocation%, %A_CaretY% 
Sleep 200
Click up
SendInput {DELETE}     ; or figure out how to double-click on text input location.
Sleep 200
Send ^v
Sleep 200
SendInput {Enter}
Sleep 200
WinWait ahk_class #32770
Sleep 400
MouseMove, 231, 144
Sleep 200
Click 2
return
