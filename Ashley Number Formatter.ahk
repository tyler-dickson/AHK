; Created with AutoHotkey by Tyler Dickson. 

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 43


TrayTip, Number Reformatter, Highlight number`, press Windows + N.`n`nWorks on 12/345678 and 12345678 type numbers.
return


#n::
Clipboard = 
SendInput ^c
ClipWait, .2

if InStr(Clipboard, "/")
	{
	Spl := StrSplit(Clipboard)
	Clipboard := Spl[1] Spl[2] Spl[3] Spl[4] Spl[5] Spl[6] "," Spl[7] Spl[8] Spl[9]
	}
else
	{
	Clipboard := RegExReplace(Clipboard, "(\d)(?=(?:\d{3})+(?:\.|$))", "$1,")
	}

TrayTip, Number reformatted | %Clipboard%, Go ahead and paste it somewhere.

return

