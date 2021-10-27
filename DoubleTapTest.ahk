#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force


LWin & A::
MsgBox, test.
return

LWin & S::
MsgBox, tests.
return

$*Control::
KeyWait, Control
KeyWait, Control, D T0.15
if ErrorLevel = 1
	{
	SendInput {Control}
	return
	}
else if ErrorLevel = 0
	MsgBox, Test.
return


LWin::
keywait, LWin   ;Wait for the space that activated the hotstring to be released
keywait, LWin, d, T0.25  ;Wait for space to be pressed again
	If ErrorLevel = 1
		SendInput {LWin}
	else
		{
		SplashtextOn, , ,You double-tapped Windows key.
		sleep 1000
		Splashtextoff
		}
return


CapsLock::
if winc_presses > 0 ; SetTimer already started, so we log the keypress instead.
{
    winc_presses += 1
	return
}
winc_presses = 1 ; Otherwise, this is the first press of a new series. Set count to 1 and start the timer:
SetTimer, KeyWinC, -400 ; Wait for more presses within a 400 millisecond window.
return

KeyWinC:
if winc_presses = 1 ; The key was pressed once.
{
toggle := !toggle
	if toggle = 1
		SetCapsLockState, On
	else
		SetCapsLockState, Off
}
else if winc_presses = 2 ; The key was pressed twice.
{
    Run, C:\users\%A_Username%  ; Open a different folder.
}
else if winc_presses > 2 
{
    MsgBox, Three or more clicks detected.
}
winc_presses = 0 ; Regardless of which action above was triggered, reset the count to 0, prepares for the next series of presses:
return

