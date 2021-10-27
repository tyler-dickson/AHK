#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#SingleInstance, Force
IniRead, LockedOut,   C:\Users\%A_Username%\AHKPrefs.ini, LockoutTime, LockoutTime
IniRead, ReleaseTime, C:\Users\%A_Username%\AHKPrefs.ini, LockoutTime, ReleaseTime

;formattime, LockedOut, %LockedOut%, hh:mm:ss
;formattime, ReleaseTime, %ReleaseTime%, hh:mm:ss
;formattime, RightNow, , hh:mm:ss
;MsgBox, Time Locked Out = %LockedOut%`n`nRelease Time = %ReleaseTime%`n`nTime Right Now = %RightNow%
;IniRead, ReleaseTime, C:\Users\%A_Username%\AHKPrefs.ini, LockoutTime, ReleaseTime
TimeLeft := ReleaseTime - A_Now
;MsgBox, %TimeLeft% = %ReleaseTime% - %A_Now%
if TimeLeft > 0
	{
	MsgBox,48, Locked out.,You are still locked out for entering the incorrect PIN.`n`nTry again in a few minutes.
	ExitApp
	return
	}
else if TimeLeft < 0
global Attempts = 0
FormatTime, TimeStamp, R
formattime, todaysdate, , MMMM dd, yyyy
formattime, PasswordDate, , MMddyyyy
Gui, New, -Caption, Pinpad    ; AlwaysOnTop
Gui, Add, Text, Center x10 y5 w140 h30, Enter today's PIN to access restricted functions.
Gui, Add, Edit, Number Center Password vPinNumber Limit4 x10 y57 w70 h19 w140, 
Gui, Font, Bold
Gui, Add, Edit, cBlue -Background Center ReadOnly x10 y35 w140 h20, %todaysdate%
Gui, Font
Gui, Add, Button, gKeypad1        x10 y80 w40 h40, 1
Gui, Add, Button, gKeypad2        x60 y80 w40 h40, 2
Gui, Add, Button, gKeypad3       x110 y80 w40 h40, 3
Gui, Add, Button, gKeypad4       x10 y130 w40 h40, 4
Gui, Add, Button, gKeypad5       x60 y130 w40 h40, 5
Gui, Add, Button, gKeypad6      x110 y130 w40 h40, 6
Gui, Add, Button, gKeypad7       x10 y180 w40 h40, 7
Gui, Add, Button, gKeypad8       x60 y180 w40 h40, 8
Gui, Add, Button, gKeypad9      x110 y180 w40 h40, 9
Gui, Add, Button, gKeypadClear   x10 y230 w40 h40, Clear
Gui, Add, Button, gKeypad0       x60 y230 w40 h40, 0
Gui, Add, Button, gKeypadCancel x110 y230 w40 h40, Exit
Gui, Color, 00FF99
Gui, Show
return

CheckPin:
StringLen, PinLength, PinNumber
;	MsgBox, %PinLength% ... %PinNumber%
if PinLength < 4
	return
else
	{
	;MsgBox, Confirming PIN is correct...
	IniRead, TodaysPIN, C:\Users\%A_Username%\Desktop\PIN Entry.ahk, DailyPIN, %PasswordDate%
	;MsgBox, Your PIN Number = %PinNumber%`n`nToday's PIN Number = %TodaysPin%
        if (PinNumber != TodaysPin) && (Attempts = 0)
			{
			Attempts++
			MsgBox, 48, Incorrect PIN. ,PIN is incorrect. Two attempts remaining...
			Gui, Color, Yellow
			gosub KeypadClear
			return
			}
		else if (PinNumber != TodaysPin) && (Attempts = 1)
			{
			Attempts++
			MsgBox, 48, Incorrect PIN. ,PIN is incorrect. One attempt remaining...
			Gui, Color, Red
			gosub KeypadClear
			return
			}	
		else if (PinNumber != TodaysPin) && (Attempts = 2)
			{
			Attempts++
			MsgBox, 48, Incorrect PIN., PIN is incorrect. You've been locked out for five minutes.
			gosub LockedOut
			return
			}
		else
			;if (PinNumber = TodaysPin
			{
			MsgBox, Correct PIN entered. Launching restricted functions.
			IniDelete, C:\Users\%A_Username%\AHKPrefs.ini, LockoutTime, LockoutTime
			IniDelete, C:\Users\%A_Username%\AHKPrefs.ini, LockoutTime, ReleaseTime
			Run calc.exe
			ExitApp
			return
			}
	}
return

Keypad1:
GuiControl, Focus, PinNumber
SendInput, 1
Gui, Submit, NoHide
gosub CheckPin
return

Keypad2:
GuiControl, Focus, PinNumber
SendInput, 2
Gui, Submit, NoHide
gosub CheckPin
return

Keypad3:
GuiControl, Focus, PinNumber
SendInput, 3
Gui, Submit, NoHide
gosub CheckPin
return

Keypad4:
GuiControl, Focus, PinNumber
SendInput, 4
Gui, Submit, NoHide
gosub CheckPin
return

Keypad5:
GuiControl, Focus, PinNumber
SendInput, 5
Gui, Submit, NoHide
gosub CheckPin
return

Keypad6:
GuiControl, Focus, PinNumber
SendInput, 6
Gui, Submit, NoHide
gosub CheckPin
return

Keypad7:
GuiControl, Focus, PinNumber
SendInput, 7
Gui, Submit, NoHide
gosub CheckPin
return

Keypad8:
GuiControl, Focus, PinNumber
SendInput, 8
Gui, Submit, NoHide
gosub CheckPin
return

Keypad9:
GuiControl, Focus, PinNumber
SendInput, 9
Gui, Submit, NoHide
gosub CheckPin
return

Keypad0:
GuiControl, Focus, PinNumber
SendInput, 0
Gui, Submit, NoHide
gosub CheckPin
return

KeypadClear:
GuiControl, ,Edit1, 
Gui, Submit, NoHide
gosub CheckPin
return

KeypadCancel:
GuiClose:
ExitApp
return

LockedOut:
IniWrite, %A_Now%, C:\Users\%A_Username%\AHKPrefs.ini, LockoutTime, LockoutTime
ReleaseTime = %A_Now%
EnvAdd, ReleaseTime, 300, seconds
IniWrite, %ReleaseTime%, C:\Users\%A_Username%\AHKPrefs.ini, LockoutTime, ReleaseTime
ExitApp
return

/*
[DailyPIN]
02112017=4027
02122017=6817
02132017=8566
02142017=4295
02152017=0154
02162017=2941
02172017=0688
02182017=6345
02192017=3106
02202017=9274
02212017=5802
02222017=9183
02232017=3755
02242017=8948
02252017=1522
02262017=6589
02272017=9274
02282017=1048
03012017=1234
05012017=1111
*/
