#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent 
Enabled := ComObjError(false)
SetTitleMatchMode, 2
SetTimer, CloseWindow, 100
return

#9::
Clipboard = 
Sleep 100
SendInput ^c
ClipWait, 1
iManageFileNumber := "iwl:dms=OC-IDMS&&lib=KMOB&&num=" Clipboard "&ver=&latest=1&command=openrocmd"
Run % iManageFileNumber
return


CloseWindow:
IfWinActive, WorkSite, The version of this document                
	{
	WinActivate,  iManage, The version of this document 
	Sleep 100
	ControlSend,  , {Alt down}Y{Alt up}, WorkSite
	}
IfWinExist, iManage, The version of this document 
	{
	WinActivate,  iManage, The version of this document 
	Sleep 100
	ControlSend,  , {Alt down}Y{Alt up}, iManage
	}
IfWinActive, Microsoft Excel Security Notice
	ControlSend,  , {Alt down}Y{Alt up}, Microsoft Excel Security Notice
return
