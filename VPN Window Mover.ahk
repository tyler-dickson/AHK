#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, pifmgr.dll, 36
Enabled := ComObjError(false)


WinMove, ahk_class IEFrame,, 1316, 0, 1251, 941
WinMove, Conversations, Chrome Legacy Window, 963, 911, 751, 450
WinMove, ahk_class XLMAIN,, 1398, 383, 1162, 975
WinMove, ahk_class rctrl_renwnd32,, 0, -3, 1293, 941
WinMove, Cisco Jabber,, -2, 720, 318, 641
return