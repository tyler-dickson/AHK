#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global Keystrokes

		
IniRead, Keystrokes, C:\Users\%A_Username%\AHKPrefs.ini, Achievements, Keystrokes
	if Keystrokes = ERROR
		{
		Keystrokes = 0
		IniWrite, %Keystrokes%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, Keystrokes
		IniRead, Keystrokes, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, Keystrokes
		}
   

RecordKeystrokes:
IniRead, Keystrokes, C:\Users\%A_Username%\AHKPrefs.ini, Achievements, Keystrokes
StringLen, NameLen, Username
StringLen, DateLen, ATDate
Keystrokes := (NameLen + DateLen + 5)
KeystrokesSaved+=%Keystrokes%
IniWrite, %KeystrokesSaved%, C:\Users\%A_Username%\AHKPrefs.ini, Achievements, Keystrokes
return
