#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


^1::
OldClipboard := Clipboard                        ; This saves clipboard content for later.
Clipboard = ;                                    ; This empties the clipboard.
MyString = ;                                     ; Sets MyString to blank.

Send ^c
Sleep 200
MyString := clipboard                            ; Fetch URL into variable
SplashTextOn, 300,,Opening in docketing now.,
Run %MyString%
Sleep 1000
SplashTextOff
Clipboard = %oldClipboard%
Return
