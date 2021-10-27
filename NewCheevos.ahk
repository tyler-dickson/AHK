#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;IniWrite, %GroupKeystrokesSaved%, C:\Users\%A_Username%\AHKPrefs.ini, GroupAchievements, Keystrokes
;IniWrite, %IndivKeystrokesSaved%, C:\Users\%A_Username%\AHKPrefs.ini, IndivAchievements, Keystrokes


#Persistent
SetTimer, Alert1, 10000
return

Alert1:
IniRead, Keystrokes,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, Keystrokes
IniRead, DateShortcut,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, DateShortcut
IniRead, AttyFinder,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, AttyFinder
IniRead, CalExtend,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, CalExtend
IniRead, SysSwitch,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, SysSwitch
IniRead, ExcelHLink,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, EFSCertFinder
IniRead, CopyAction,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, CopyAction
IniRead, PasteAction,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, PasteAction
IniRead, SuggestRemarks,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, SuggestRemarks
IniRead, Keystrokes10K, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, Keystrokes10K
	if Keystrokes10K = ERROR
		{
		Keystrokes10K = 0
		IniWrite, %Keystrokes10K%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, Keystrokes10K
		IniRead, Keystrokes10K, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, Keystrokes10K
		}
IniRead, Keystrokes25K, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, Keystrokes25K
	if Keystrokes25K = ERROR
		{
		Keystrokes25K = 0
		IniWrite, %Keystrokes25K%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, Keystrokes25K
		IniRead, Keystrokes25K, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, Keystrokes25K
		}

Msgbox, Keystrokes:%Keystrokes%`n10K? %Keystrokes10K%`n25K? %Keystrokes25K%
		
if (Keystrokes > 10000) AND (Keystrokes10K = 0)
	{
	var = C:\Users\%A_Username%\Desktop\giphy.gif ;location of gif you want to show
		Gui, Add, ActiveX, h1000 w1000 vWB, shell explorer
		wb.Navigate("about:blank")
		html := "<html>`n<title>name</title>`n<body>`n<center>`n<img src=""" var """ >`n</center>`n</body>`n</html>"
		wb.document.write(html)
		Gui, Show,
		;Gui, Show, AutoSize Center
	MsgBox, You have saved over 10000 keystrokes with this shortcut!
	Keystrokes10K = 1
	IniWrite, %Keystrokes10K%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, Keystrokes10K
	Sleep 10000
	Gui, Destroy
	return
	}
else if (Keystrokes > 25000) AND (Keystrokes25K = 0)
	{
	var = C:\Users\%A_Username%\Desktop\giphy.gif ;location of gif you want to show
		Gui, Add, ActiveX, h1000 w1000 vWB, shell explorer
		wb.Navigate("about:blank")
		html := "<html>`n<title>name</title>`n<body>`n<center>`n<img src=""" var """ >`n</center>`n</body>`n</html>"
		wb.document.write(html)
		Gui, Show,
		;Gui, Show, AutoSize Center
	MsgBox, You have saved over 25000 keystrokes with this shortcut!
	Keystrokes25K= 1
	IniWrite, %Keystrokes25K%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, Keystrokes25K
	Sleep 10000
	Gui, Destroy
	return
	}
else
	return
return









