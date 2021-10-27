#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 119

StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}

if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder

FileCreateShortcut, \\docs-oc\files\Docketing\AutoHotKey\Scripts\Scripts.ahk, Scripts.lnk , \\docs-oc\files\Docketing\AutoHotKey\Scripts\Scripts.ahk, , Opens current Scripts.ahk file
Sleep 1000
IfExist, C:\Users\%Computername%\Desktop\Scripts.ahk
	{
	FileRecycle, C:\Users\%Computername%\Desktop\Scripts.ahk
	}

GuiClose:
ExitApp
return
