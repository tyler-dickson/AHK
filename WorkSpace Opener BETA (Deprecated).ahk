; Created with AutoHotkey by Tyler Dickson. 

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, mmcndmgr.dll, 77
Enabled := ComObjError(false)
#Persistent
SetTitleMatchMode, 2
global ComputerName
Computername = %A_Username%

if Computername = lara.anabtawi
	Computername = lara.hamdan
if Computername = neysa.perkins
	Computername = neysa.cabudol
if Computername = jessica.george
	Computername = jessica.egigian
if Computername = sabrina.fleming
	Computername = sabrina.kellogg

IniRead, WorkSpaceOpener, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, WorkSpaceOpener
	if WorkSpaceOpener = ERROR
		{
		WorkSpaceOpener = 0
		IniWrite, %WorkSpaceOpener%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, WorkSpaceOpener
		IniRead, WorkSpaceOpener, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, WorkSpaceOpener
		}
IniRead, WorkSpaceOpenerH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, WorkSpaceOpener
	if WorkSpaceOpenerH = ERROR
		{
		WorkSpaceOpenerH = 0
		IniWrite, %WorkSpaceOpenerH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, WorkSpaceOpener
		IniRead, WorkSpaceOpenerH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, WorkSpaceOpener
		}

MsgBox, , WorkSpace Opener (BETA), Looks like you're willing to take a walk on the wild side!`n`n***PLEASE READ IF THIS IS YOUR FIRST TIME USING THE SCRIPT!***`n`nHere is how this works:`n`n-Highlight the Client Code.`n-Hold the Windows Key, and then Right Click.`n`nThe mouse will be briefly disabled until it finishes the process.`n`nThis should activate Outlook, open the WorkSpace Search, move the mouse and paste the Client Code in, and then search for it. It will then select the first option that appears.`n`nIt can occasionally fail, but it usually gets you pretty close.`nIf it doesn't work, you can just select the WorkSpace manually.`n`nFor now, it only opens the WorkSpace without opening a folder. It is possible to open directly into a specific folder, but that will have to be somewhere down the road.`n`nGood luck, and let me know if you have any feedback or comments.`n`nP.S. In the event the script goes rogue and you can't move your mouse, hold Control and press F12 to exit the script. You shouldn't need to do this, but I added the option just in case. Consider writing Ctrl + F12 down so you can remember it.
return

#RButton::
Send ^c
Sleep 200
WinActivate, ahk_exe OUTLOOK.EXE  ;  ahk_class rctrl_renwnd32
BlockInput, MouseMove
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
Sleep 750
WinWait ahk_class #32770
Sleep 1250
MouseMove, 231, 155
Sleep 750
Click 2
gosub RecordWorkSpaceOpener
BlockInput, MouseMoveOff
SendInput {Alt}
Sleep 250
SendInput H
Sleep 250
SendInput {Alt}
return

RecordWorkSpaceOpener:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, WorkSpaceOpener, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, WorkSpaceOpener
IniRead, WorkSpaceOpenerH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, WorkSpaceOpener
WorkSpaceOpener++
WorkSpaceOpenerH++
IniWrite, %WorkSpaceOpener%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, WorkSpaceOpener
IniWrite, %WorkSpaceOpenerH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, WorkSpaceOpener
return

^F12::
ExitApp
return

