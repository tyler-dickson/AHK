#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

CoordMode, Mouse, Relative
IfExist ("ahk_class Shell_TrayWnd")
hwnd:=WinExist("ahk_class Shell_TrayWnd")
Return
~LButton Up::
MouseGetPos,x,y,win
If win = %hwnd%
{
	If y > 28
		Gosub, Action3
	else if y > 14
		Gosub, Action2
	else
		Gosub, Action1
}
Return
Action1:
MsgBox 1
Return
Action2:
MsgBox 2
Return
Action3:
MsgBox 3
Return