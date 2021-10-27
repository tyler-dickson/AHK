#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
#Persistent
SetTitleMatchMode, 2

#RButton::
OpenWorkSpace:
Send ^c
Sleep 200
WinActivate, Microsoft Outlook   ;  ahk_class rctrl_renwnd32
Sleep 200
SendInput {Alt}
Sleep 50
SendInput w
Sleep 50
SendInput sw
WinWait ahk_class #32770
Sleep 500
DownABit := A_CaretY + 5
NewLocation := A_CaretX + 230
MouseMove, %A_CaretX%, %DownABit%        ;Win+C hotkey
Click down
Sleep 300
MouseMove, %NewLocation%, %DownABit% 
Sleep 200
Click up
SendInput {DELETE}     ; or figure out how to double-click on text input location.
Sleep 200
Send ^v
Sleep 200
SendInput {Enter}
Sleep 200
WinWait ahk_class #32770
Sleep 800
MouseMove, 231, 144
Sleep 200
Click 2
return

#=::
Gui, New
Gui, Add, Text,     w200 Center , WorkSpace to Open:
Gui, Add, Edit,     w200 Center vWorkSpace,
Gui, Add, Button,   w200 Center gOpenWorkSpace2, Open WorkSpace
Gui, Add, Text,     w200 Center, Open specific folder? Choose from dropdown or type other:
Gui, Add, ComboBox, w200 Center vSpecificFolder, Scanned File History|Correspondence with Foreign Associate / File History|
Gui, Show
return

OpenWorkSpace2:
Gui, Submit
;Run "C:\Program Files\Microsoft Office\Office14\OUTLOOK.EXE" /select "outlook://FileSite/OC-iDMS/_Matter Worklist/DOCKETING.INTERNATIONAL/Logs/Master Docket/" /recycle
;Clipboard = %WorkSpace%
	if SpecificFolder =    ;
		{
		gosub OpenWorkSpace3
		}
	else if SpecificFolder !=    ;
		Run "C:\Program Files\Microsoft Office\Office14\OUTLOOK.EXE" /select "outlook://FileSite/OC-iDMS/_Matter Worklist/%WorkSpace%/%SpecificFolder%" /recycle
Sleep 1000
	IfWinExist, Microsoft Outlook, Cannot display the selected folder or item.
		{
		WinClose, Microsoft Outlook, Cannot display the selected folder or item.
		gosub OpenWorkSpace4
		}
	else
		return
return

OpenWorkSpace3:
Clipboard = %WorkSpace%
Sleep 200
WinActivate, Microsoft Outlook   ;  ahk_class rctrl_renwnd32
Sleep 200
SendInput {Alt}
Sleep 50
SendInput w
Sleep 50
SendInput sw
WinWait ahk_class #32770
Sleep 500
DownABit := A_CaretY + 5
NewLocation := A_CaretX + 230
MouseMove, %A_CaretX%, %DownABit%        ;Win+C hotkey
Click down
Sleep 300
MouseMove, %NewLocation%, %DownABit% 
Sleep 200
Click up
SendInput {DELETE}     ; or figure out how to double-click on text input location.
Sleep 200
Send ^v
Sleep 200
SendInput {Enter}
Sleep 200
WinWait ahk_class #32770
Sleep 800
MouseMove, 231, 144
Sleep 200
Click 2
Sleep 200
return

OpenWorkSpace4:
Clipboard = %WorkSpace%
Sleep 200
WinActivate, Microsoft Outlook   ;  ahk_class rctrl_renwnd32
Sleep 200
SendInput {Alt}
Sleep 50
SendInput w
Sleep 50
SendInput sw
WinWait ahk_class #32770
Sleep 500
DownABit := A_CaretY + 5
NewLocation := A_CaretX + 230
MouseMove, %A_CaretX%, %DownABit%        ;Win+C hotkey
Click down
Sleep 300
MouseMove, %NewLocation%, %DownABit% 
Sleep 200
Click up
SendInput {DELETE}     ; or figure out how to double-click on text input location.
Sleep 200
Send ^v
Sleep 200
SendInput {Enter}
Sleep 200
WinWait ahk_class #32770
Sleep 800
MouseMove, 231, 144
Sleep 200
Click 2
Sleep 200
gosub OpenWorkSpace2
return
