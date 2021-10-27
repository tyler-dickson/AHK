#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^j::
ie := ComObjCreate("InternetExplorer.Application")
ie.Visible := true  ; This is known to work incorrectly on IE7.
ie.TheaterMode := true
ie.Navigate("https://autohotkey.com/")
return


;https://autohotkey.com/docs/commands/ComObjCreate.htm#Examples