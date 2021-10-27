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
iManageFileNumber := "iwl:dms=OC-IDMS&&lib=KMOB&&num=" Clipboard
;InputBox, iManageFileNumber, Test test test, iManage File Number to Open., , 300, 137
;Msgbox, %iManageFileNumber%
;iManageFileNumber := "iwl:dms=OC-IDMS&&lib=KMOB&&num=" iManageFileNumber
;Msgbox, %iManageFileNumber%
;Run "iwl:dms=OC-IDMS&&lib=KMOB&&num=13253938"
Run % iManageFileNumber
return


CloseWindow:
IfWinActive, WorkSite, The version of this document                
	ControlSend,  , {Alt down}Y{Alt up}, WorkSite
IfWinActive, Microsoft Excel Security Notice
	ControlSend,  , {Alt down}Y{Alt up}, Microsoft Excel Security Notice
return





/*
WorkSite

The version of this document


ahk_class #32770
ahk_exe OUTLOOK.EXE



*/