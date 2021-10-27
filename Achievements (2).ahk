#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Function1()
{
;Username = TDICKSON   ; These will typically be grabbed from somewhere else,
;ATDate = 12/12/16
IniRead, GroupKeystrokesSaved, C:\Users\%A_Username%\AHKPrefs.ini, GroupAchievements, Keystrokes
IniRead, IndivKeystrokesSaved, C:\Users\%A_Username%\AHKPrefs.ini, IndivAchievements, Keystrokes
if (GroupKeystrokesSaved > 500) AND (GroupKeystroke = 0)
	{
	MsgBox, Everyone combined has saved over 500 keystrokes with this shortcut!
	GroupKeystroke = 1
	IniWrite, %GroupKeystroke%, C:\Users\%A_Username%\AHKPrefs.ini, GroupAchievements, GroupKeystroke
	}
if (IndivKeystrokesSaved > 500) AND (IndivKeystroke = 0)
	{
	MsgBox, You have saved over 500 keystrokes with this shortcut!
	IndivKeystroke = 1
	IniWrite, %IndivKeystroke%, C:\Users\%A_Username%\AHKPrefs.ini, IndivAchievements, IndivKeystroke
	}
StringLen, NameLen, Username
StringLen, DateLen, ATDate
Keystrokes := (NameLen + DateLen + 5)
GroupKeystrokesSaved+=%Keystrokes%
IndivKeystrokesSaved+=%Keystrokes%
IniWrite, %GroupKeystrokesSaved%, C:\Users\%A_Username%\AHKPrefs.ini, GroupAchievements, Keystrokes
IniWrite, %IndivKeystrokesSaved%, C:\Users\%A_Username%\AHKPrefs.ini, IndivAchievements, Keystrokes
return
}








Subroutine1:
IniRead, GroupKeystrokesSaved, C:\Users\%A_Username%\AHKPrefs.ini, GroupAchievements, Keystrokes
IniRead, IndivKeystrokesSaved, C:\Users\%A_Username%\AHKPrefs.ini, IndivAchievements, Keystrokes
if (GroupKeystrokesSaved > 500) AND (GroupKeystroke = 0)
	{
	MsgBox, Everyone combined has saved over 500 keystrokes with this shortcut!
	GroupKeystroke = 1
	IniWrite, %GroupKeystroke%, C:\Users\%A_Username%\AHKPrefs.ini, GroupAchievements, GroupKeystroke
	}
if (IndivKeystrokesSaved > 500) AND (IndivKeystroke = 0)
	{
	MsgBox, You have saved over 500 keystrokes with this shortcut!
	IndivKeystroke = 1
	IniWrite, %IndivKeystroke%, C:\Users\%A_Username%\AHKPrefs.ini, IndivAchievements, IndivKeystroke
	}
StringLen, NameLen, Username
StringLen, DateLen, ATDate
Keystrokes := (NameLen + DateLen + 5)
GroupKeystrokesSaved+=%Keystrokes%
IndivKeystrokesSaved+=%Keystrokes%
IniWrite, %GroupKeystrokesSaved%, C:\Users\%A_Username%\AHKPrefs.ini, GroupAchievements, Keystrokes
IniWrite, %IndivKeystrokesSaved%, C:\Users\%A_Username%\AHKPrefs.ini, IndivAchievements, Keystrokes
return