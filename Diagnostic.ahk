#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
formattime, RightNow, , yyyy-MM-dd hh.mm.ss          ; yyyy-MM-dd
global DiagnosticData := "User,Is Admin?,Is 64-bit?,OS Type,OS Version,Computer Name,Username,IP#1,Startup Folder,Desktop Location,iManage Version,AHK Version,AHK Script Version,IE Version,Jabber Version,Chrome Version,Excel Version,Word Version,Outlook Version,Adobe Version,Desktop Authority"
global NumUsers = 0

Loop, Files, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\*.ini, F
	{
	User%A_Index% = %A_LoopFileName%
	StringReplace, User%A_Index%, User%A_Index%, .ini, , 
	NumUsers++
	}
MsgBox, %NumUsers%
Loop, %NumUsers%
	{
	IniRead, AHKScript,  		% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Version, Version
	IniRead, Admin, 	 		% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, Admin
	IniRead, 64bit, 	 		% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, 64bit
	IniRead, OSType, 	 		% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, OS Type
	IniRead, OSVersion,  		% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, OS Version
	IniRead, CompName, 	 		% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, Computer Name
	IniRead, User,		 		% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, Username
	IniRead, IPAddress1, 		% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, IP Address 1
	;IniRead, MyDocs,	 		% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, My Documents
	IniRead, Startup, 	 		% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, Startup Folder
	IniRead, Desktop, 	 		% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, Desktop
	IniRead, iManVersion,		% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, iManVersion
	IniRead, AHKVersion, 		% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, AHKVersion
	IniRead, IEVersion,  		% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, IEVersion
	IniRead, JabberVersion,  	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, JabberVersion
	IniRead, ChromeVersion,  	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, ChromeVersion
	IniRead, ExcelVersion,   	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, ExcelVersion
	IniRead, WordVersion,    	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, WordVersion
	IniRead, OutlookVersion, 	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, OutlookVersion
	IniRead, AdobeVersion,   	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, AdobeVersion
	IniRead, DesktopAuthority,  % "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" User%A_Index% ".ini", Diagnostic, DesktopAuthority
	
	Admin := if Admin == 0 ? "No" : "Yes"
	64bit := if 64bit == 0 ? "No" : "Yes"	
	
	DiagnosticData := DiagnosticData "`n" User%A_Index% "," Admin "," 64bit "," OSType "," OSVersion "," CompName "," User "," IPAddress1 "," Startup "," Desktop "," iManVersion "," AHKVersion "," AHKScript "," IEVersion "," JabberVersion "," ChromeVersion "," ExcelVersion "," WordVersion "," OutlookVersion "," AdobeVersion "," DesktopAuthority
	}
FileAppend, %DiagnosticData%, % "C:\Users\" A_Username "\Desktop\Diagnostic Data - " RightNow ".csv"
Sleep 3000
Run, % "C:\Users\" A_Username "\Desktop\Diagnostic Data - " RightNow ".csv"
return
