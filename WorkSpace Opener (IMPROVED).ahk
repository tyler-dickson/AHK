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
return

#RButton::
Clipboard = 
SendInput ^c
ClipWait, .5
Sleep 50
IniRead, FolderNumber, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\WorkSpaceOpener.ini, Miscellaneous, %Clipboard%
Sleep 200
DocumentText := "OC-iDMS`n!nrtdms:0:!session:OC-iDMS:!database:KMOB:!folder:ordinary," . FolderNumber
Sleep 200
FileDelete, C:\Users\%A_Username%\Desktop\KMOB_%FolderNumber%.nrl
Sleep 250
FileAppend, %DocumentText%, C:\Users\%A_Username%\Desktop\KMOB_%FolderNumber%.nrl
Sleep 250
WinActivate, ahk_exe OUTLOOK.EXE  ;  ahk_class rctrl_renwnd32
Sleep 100
Run, C:\Users\%A_Username%\Desktop\KMOB_%FolderNumber%.nrl
Sleep 500
FileDelete, C:\Users\%A_Username%\Desktop\KMOB_%FolderNumber%.nrl
gosub RecordWorkSpaceOpener
return

;OC-iDMS
;!nrtdms:0:!session:OC-iDMS:!database:KMOB:!folder:ordinary,7721805:

RecordWorkSpaceOpener:
IniRead, WorkSpaceOpener, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, WorkSpaceOpener
WorkSpaceOpener++
IniWrite, %WorkSpaceOpener%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, WorkSpaceOpener
return