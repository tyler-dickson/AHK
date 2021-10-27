; Created with AutoHotkey by Tyler Dickson.   

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
Enabled := ComObjError(false)
SysGet, ScreenWidth, 78
SysGet, ScreenHeight, 79
global HalfScreenHeight := ScreenHeight * .50       ;964.8
;DetectHiddenWindows, On  
SetTitleMatchMode, 2
Menu, Tray, Icon, compstui.dll , 94

; NEWCPI
global NewCPI

NewCPI = 1

if (NewCPI)
	{
;	#Include \\docs-oc\files\Docketing\AutoHotKey\Scripts\Chrome.ahk
;	FileCreateDir, C:\Users\Tyler.Dickson\Desktop\AHK Startup\ChromeProfile
;	FileCreateDir, ChromeProfile
	FileCreateShortcut, % "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe", %A_Desktop%\Chrome (AHK).lnk, , % "--remote-debugging-port=9222 -- '%1'", % "Test Description" ;,  IconFile, 

;	Run, %A_Desktop%\Chrome (AHK).lnk
	
	if (Chromes := Chrome.FindInstances())
		global ChromeInst := {"base": Chrome, "DebugPort": Chromes.MinIndex()}
	else
		global ChromeInst := new Chrome("ChromeProfile", "https://web05.computerpackages.com/knobbe/patent/patschcountryapplication.aspx" ) ; 	;	global ChromeInst := new Chrome("ChromeProfile", "--app=http://oc-docketing/CPi/patfrmCountryApplication.aspx?Key=1275806")
	
	global Page := ChromeInst.GetPage()
;	Page.Call("Page.navigate", {"url" : "https://web05.computerpackages.com/knobbe/patent/patschcountryapplication.aspx" })
;	Page.Call("Target.createTarget", {"url" : "https://web05bak.computerpackages.com/knobbeAgent/patent/patschcountryapplication.aspx" })
	Page.WaitForLoad()
	Page.Disconnect()
	}


global ComputerName

StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}

if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder	
	
	
	
IfNotExist,C:\Users\%Computername%\CustomFKeys.ini
	{
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point8
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point9
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point10
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point8
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point9
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point10
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point8
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point9
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point10
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point6	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point7	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point8	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point9	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point10	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point8
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point9
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point10
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point8
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point9
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point10
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point8
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point9
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point10
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point8
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point9
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point10
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point6	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point7	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point8	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point9	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point10	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point6	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point8	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point9	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point10	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point6	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point7	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point8	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point9	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point10	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point6	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point8	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point9	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point10	
	}
	
;IniRead, Uses, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, FKeysInjector
;	if Uses = ERROR
;		IniWrite, 1, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, FKeysInjector
;	else
;		{
;		Uses++
;		IniWrite, %Uses%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, FKeysInjector
;		}
	
MsgBox, , F-Keys Action Injector, Welcome to the F-Keys Action Injector!`n`nHold the Windows key and press F1 to customize your keys.`n`nIf the first option is blank, the F-Key will function normally.`n`nEach press of an F-Key will cycle to the next option. Once you reach the end (or a blank entry), it will cycle back to the beginning.`n`nIf you leave blanks in between selections, it will never cycle to the later options.
	
return

#F1::
Gui, Destroy
Gui, New, , Customize F-Keys
Gui, Add, DropDownList, Center vCustomKey gCustomKey x5 y5 w180, F1||F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12
Gui, Add, Edit, Center vChoice1 x5 y30 w180, 
Gui, Add, Edit, Center vChoice2 x5 yp+25 w180, 
Gui, Add, Edit, Center vChoice3 x5 yp+25 w180, 
Gui, Add, Edit, Center vChoice4 x5 yp+25 w180, 
Gui, Add, Edit, Center vChoice5 x5 yp+25 w180, 
Gui, Add, Edit, Center vChoice6 x5 yp+25 w180, 
Gui, Add, Edit, Center vChoice7 x5 yp+25 w180, 
Gui, Add, Edit, Center vChoice8 x5 yp+25 w180, 
Gui, Add, Edit, Center vChoice9 x5 yp+25 w180, 
Gui, Add, Edit, Center vChoice10 x5 yp+25 w180, 
Gui, Add, Button, gSubmitCustomKeys x5 yp+25, Customize
Gui, Add, Button, gCancelChanges x118 yp, Close Menu
Gui, Show, w190
gosub CustomKey
return

CancelChanges:
Gui, Destroy
return

CustomKey:
Gui, Submit, NoHide
IniRead, Choice1, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point1
IniRead, Choice2, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point2
IniRead, Choice3, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point3
IniRead, Choice4, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point4
IniRead, Choice5, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point5
IniRead, Choice6, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point6
IniRead, Choice7, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point7
IniRead, Choice8, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point8
IniRead, Choice9, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point9
IniRead, Choice10, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point10
GuiControl, , Edit1, %Choice1%
GuiControl, , Edit2, %Choice2%
GuiControl, , Edit3, %Choice3%
GuiControl, , Edit4, %Choice4%
GuiControl, , Edit5, %Choice5%
GuiControl, , Edit6, %Choice6%
GuiControl, , Edit7, %Choice7%
GuiControl, , Edit8, %Choice8%
GuiControl, , Edit9, %Choice9%
GuiControl, , Edit10, %Choice10%
return

SubmitCustomKeys:
Gui, Submit, NoHide
IniWrite, %Choice1%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point1
IniWrite, %Choice2%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point2
IniWrite, %Choice3%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point3
IniWrite, %Choice4%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point4
IniWrite, %Choice5%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point5
IniWrite, %Choice6%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point6
IniWrite, %Choice7%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point7
IniWrite, %Choice8%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point8
IniWrite, %Choice9%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point9
IniWrite, %Choice10%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point10
MsgBox, , Shortcuts updated!, Shortcuts have been updated for this key.
return

$F1::
$F2::
$F3::
$F4::
$F5::
$F6::
$F7::
$F8::
$F9::
$F10::
$F11::
$F12::
PressedKey := StrReplace(A_ThisHotKey, "$", "")
Loop 10
	IniRead, %PressedKey%point%A_Index%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %PressedKey%point%A_Index%

if %PressedKey%point1 = 
	{
	Send {%PressedKey%}
	return
	}
else
	{
	Page := ChromeInst.GetPage()
	ActionType := Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value").Value
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = '';")
		
	Temp1  := %PressedKey%point1  ; " "
	Temp2  := %PressedKey%point2  ; " "
	Temp3  := %PressedKey%point3  ; " "
	Temp4  := %PressedKey%point4  ; " "
	Temp5  := %PressedKey%point5  ; " "
	Temp6  := %PressedKey%point6  ; " "
	Temp7  := %PressedKey%point7  ; " "
	Temp8  := %PressedKey%point8  ; " "
	Temp9  := %PressedKey%point9  ; " "
	Temp10 := %PressedKey%point10 ; " "

	
	if (ActionType == " ")
		CPIInjectAction(Temp1)	
	else if InStr(ActionType, Temp1)
		CPIInjectAction(Temp2)
	else if InStr(ActionType, Temp2)
		CPIInjectAction(Temp3)
	else if InStr(ActionType, Temp3)
		CPIInjectAction(Temp4)
	else if InStr(ActionType, Temp4)
		CPIInjectAction(Temp5)
	else if InStr(ActionType, Temp5)
		CPIInjectAction(Temp6)
	else if InStr(ActionType, Temp6)
		CPIInjectAction(Temp7)
	else if InStr(ActionType, Temp7)
		CPIInjectAction(Temp8)
	else if InStr(ActionType, Temp8)
		CPIInjectAction(Temp9)
	else if InStr(ActionType, Temp9)
		CPIInjectAction(Temp10)
	else if InStr(ActionType, Temp10)
		CPIInjectAction(Temp1)
	else if (ActionType != Temp1) || (ActionType != Temp2) || (ActionType != Temp3) || (ActionType != Temp4) || (ActionType != Temp5)|| (ActionType != Temp6) || (ActionType != Temp7) || (ActionType != Temp8) || (ActionType != Temp9) || (ActionType != Temp10)
		CPIInjectAction(Temp1)	
		
	return
	}
return


CPIInjectAction(ActionType2) { 
	Page.Disconnect()
	Page := ChromeInst.GetPage()

	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = '" ActionType2 "';")
	WinActivate, ahk_exe chrome.exe

	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').focus()")
	SendInput, {Right}
	Sleep 100
	SendInput, {Space}
	Sleep 100
	SendInput, {Tab}
	Page.Disconnect()
	return
}

class Chrome
{
	static DebugPort := 9222
	
	/*
		Escape a string in a manner suitable for command line parameters
	*/
	CliEscape(Param)
	{
		return """" RegExReplace(Param, "(\\*)""", "$1$1\""") """"
	}
	
	/*
		Finds instances of chrome in debug mode and the ports they're running
		on. If no instances are found, returns a false value. If one or more
		instances are found, returns an associative array where the keys are
		the ports, and the values are the full command line texts used to start
		the processes.
		
		One example of how this may be used would be to open chrome on a
		different port if an instance of chrome is already open on the port
		you wanted to used.
		
		```
		; If the wanted port is taken, use the largest taken port plus one
		DebugPort := 9222
		if (Chromes := Chrome.FindInstances()).HasKey(DebugPort)
			DebugPort := Chromes.MaxIndex() + 1
		ChromeInst := new Chrome(ProfilePath,,,, DebugPort)
		```
		
		Another use would be to scan for running instances and attach to one
		instead of starting a new instance.
		
		```
		if (Chromes := Chrome.FindInstances())
			ChromeInst := {"base": Chrome, "DebugPort": Chromes.MinIndex()}
		else
			ChromeInst := new Chrome(ProfilePath)
		```
	*/
	FindInstances()
	{
		static Needle := "--remote-debugging-port=(\d+)"
		Out := {}
		for Item in ComObjGet("winmgmts:")
			.ExecQuery("SELECT CommandLine FROM Win32_Process"
			. " WHERE Name = 'chrome.exe'")
			if RegExMatch(Item.CommandLine, Needle, Match)
				Out[Match1] := Item.CommandLine
		return Out.MaxIndex() ? Out : False
	}
	
	/*
		ProfilePath - Path to the user profile directory to use. Will use the standard if left blank.
		URLs        - The page or array of pages for Chrome to load when it opens
		Flags       - Additional flags for chrome when launching
		ChromePath  - Path to chrome.exe, will detect from start menu when left blank
		DebugPort   - What port should Chrome's remote debugging server run on
	*/
	__New(ProfilePath:="", URLs:="about:blank", Flags:="", ChromePath:="", DebugPort:="")
	{
		; Verify ProfilePath
		if (ProfilePath != "" && !InStr(FileExist(ProfilePath), "D"))
			throw Exception("The given ProfilePath does not exist")
		this.ProfilePath := ProfilePath
		
		; Verify ChromePath
		if (ChromePath == "")
			FileGetShortcut, %A_StartMenuCommon%\Programs\Google Chrome.lnk, ChromePath
		if (ChromePath == "")
			RegRead, ChromePath, HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Pahs\chrome.exe
		if !FileExist(ChromePath)
			throw Exception("Chrome could not be found")
		this.ChromePath := ChromePath
		
		; Verify DebugPort
		if (DebugPort != "")
		{
			if DebugPort is not integer
				throw Exception("DebugPort must be a positive integer")
			else if (DebugPort <= 0)
				throw Exception("DebugPort must be a positive integer")
			this.DebugPort := DebugPort
		}
		
		; Escape the URL(s)
		for Index, URL in IsObject(URLs) ? URLs : [URLs]
			URLString .= " " this.CliEscape(URL)
		
		Run, % this.CliEscape(ChromePath)
		. " --remote-debugging-port=" this.DebugPort
		. (ProfilePath ? " --user-data-dir=" this.CliEscape(ProfilePath) : "")
		. (Flags ? " " Flags : "")
		. URLString
		,,, OutputVarPID
		this.PID := OutputVarPID
	}
	
	/*
		End Chrome by terminating the process.
	*/
	Kill()
	{
		Process, Close, % this.PID
	}
	
	/*
		Queries chrome for a list of pages that expose a debug interface.
		In addition to standard tabs, these include pages such as extension
		configuration pages.
	*/
	GetPageList()
	{
		http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
		http.open("GET", "http://127.0.0.1:" this.DebugPort "/json")
		http.send()
		return this.Jxon_Load(http.responseText)
	}
	
	/*
		Returns a connection to the debug interface of a page that matches the
		provided criteria. When multiple pages match the criteria, they appear
		ordered by how recently the pages were opened.
		
		Key        - The key from the page list to search for, such as "url" or "title"
		Value      - The value to search for in the provided key
		MatchMode  - What kind of search to use, such as "exact", "contains", "startswith", or "regex"
		Index      - If multiple pages match the given criteria, which one of them to return
		fnCallback - A function to be called whenever message is received from the page
	*/
	GetPageBy(Key, Value, MatchMode:="exact", Index:=1, fnCallback:="")
	{
		Count := 0
		for n, PageData in this.GetPageList()
		{
			if (((MatchMode = "exact" && PageData[Key] = Value) ; Case insensitive
				|| (MatchMode = "contains" && InStr(PageData[Key], Value))
				|| (MatchMode = "startswith" && InStr(PageData[Key], Value) == 1)
				|| (MatchMode = "regex" && PageData[Key] ~= Value))
				&& ++Count == Index)
				return new this.Page(PageData.webSocketDebuggerUrl, fnCallback)
		}
	}
	
	/*
		Shorthand for GetPageBy("url", Value, "startswith")
	*/
	GetPageByURL(Value, MatchMode:="startswith", Index:=1, fnCallback:="")
	{
		return this.GetPageBy("url", Value, MatchMode, Index, fnCallback)
	}
	
	/*
		Shorthand for GetPageBy("title", Value, "startswith")
	*/
	GetPageByTitle(Value, MatchMode:="startswith", Index:=1, fnCallback:="")
	{
		return this.GetPageBy("title", Value, MatchMode, Index, fnCallback)
	}
	
	/*
		Shorthand for GetPageBy("type", Type, "exact")
		
		The default type to search for is "page", which is the visible area of
		a normal Chrome tab.
	*/
	GetPage(Index:=1, Type:="page", fnCallback:="")
	{
		return this.GetPageBy("type", Type, "exact", Index, fnCallback)
	}
	
	/*
		Connects to the debug interface of a page given its WebSocket URL.
	*/
	class Page
	{
		Connected := False
		ID := 0
		Responses := []
		
		/*
			wsurl      - The desired page's WebSocket URL
			fnCallback - A function to be called whenever message is received
		*/
		__New(wsurl, fnCallback:="")
		{
			this.fnCallback := fnCallback
			this.BoundKeepAlive := this.Call.Bind(this, "Browser.getVersion",, False)
			
			; TODO: Throw exception on invalid objects
			if IsObject(wsurl)
				wsurl := wsurl.webSocketDebuggerUrl
			
			wsurl := StrReplace(wsurl, "localhost", "127.0.0.1")
			this.ws := {"base": this.WebSocket, "_Event": this.Event, "Parent": this}
			this.ws.__New(wsurl)
			
			while !this.Connected
				Sleep, 50
		}
		
		/*
			Calls the specified endpoint and provides it with the given
			parameters.
			
			DomainAndMethod - The endpoint domain and method name for the
			endpoint you would like to call. For example:
			PageInst.Call("Browser.close")
			PageInst.Call("Schema.getDomains")
			
			Params - An associative array of parameters to be provided to the
			endpoint. For example:
			PageInst.Call("Page.printToPDF", {"scale": 0.5 ; Numeric Value
			, "landscape": Chrome.Jxon_True() ; Boolean Value
			, "pageRanges: "1-5, 8, 11-13"}) ; String value
			PageInst.Call("Page.navigate", {"url": "https://autohotkey.com/"})
			
			WaitForResponse - Whether to block until a response is received from
			Chrome, which is necessary to receive a return value, or whether
			to continue on with the script without waiting for a response.
		*/
		Call(DomainAndMethod, Params:="", WaitForResponse:=True)
		{
			;if !this.Connected
			;	throw Exception("Not connected to tab")
			
			;;;;; MAYBE TURN BACK ON LATER I DUNNO
			
			
			; Use a temporary variable for ID in case more calls are made
			; before we receive a response.
			ID := this.ID += 1
			this.ws.Send(Chrome.Jxon_Dump({"id": ID
			, "params": Params ? Params : {}
			, "method": DomainAndMethod}))
			
			if !WaitForResponse
				return
			
			; Wait for the response
			this.responses[ID] := False
			while !this.responses[ID]
				Sleep, 50
			
			; Get the response, check if it's an error
			response := this.responses.Delete(ID)
			if (response.error)
				throw Exception("Chrome indicated error in response",, Chrome.Jxon_Dump(response.error))
			
			return response.result
		}
		
		/*
			Run some JavaScript on the page. For example:
			
			PageInst.Evaluate("alert(""I can't believe it's not IE!"");")
			PageInst.Evaluate("document.getElementsByTagName('button')[0].click();")
		*/
		Evaluate(JS)
		{
			response := this.Call("Runtime.evaluate",
			( LTrim Join
			{
				"expression": JS,
				"objectGroup": "console",
				"includeCommandLineAPI": Chrome.Jxon_True(),
				"silent": Chrome.Jxon_False(),
				"returnByValue": Chrome.Jxon_False(),
				"userGesture": Chrome.Jxon_True(),
				"awaitPromise": Chrome.Jxon_False()
			}
			))
			
			; if (response.exceptionDetails)
			;	throw Exception(response.result.description,, Chrome.Jxon_Dump(response.exceptionDetails))
			
						
			;;;;; MAYBE TURN BACK ON LATER I DUNNO
			
			return response.result
		}
		
		/*
			Waits for the page's readyState to match the DesiredState.
			
			DesiredState - The state to wait for the page's ReadyState to match
			Interval     - How often it should check whether the state matches
		*/
		WaitForLoad(DesiredState:="complete", Interval:=100)
		{
			while this.Evaluate("document.readyState").value != DesiredState
				Sleep, Interval
		}
		
		/*
			Internal function triggered when the script receives a message on
			the WebSocket connected to the page.
		*/
		Event(EventName, Event)
		{
			; If it was called from the WebSocket adjust the class context
			if this.Parent
				this := this.Parent
			
			; TODO: Handle Error events
			if (EventName == "Open")
			{
				this.Connected := True
				BoundKeepAlive := this.BoundKeepAlive
				SetTimer, %BoundKeepAlive%, 15000
			}
			else if (EventName == "Message")
			{
				data := Chrome.Jxon_Load(Event.data)
				
				; Run the callback routine
				fnCallback := this.fnCallback
				if (newData := %fnCallback%(data))
					data := newData
				
				if this.responses.HasKey(data.ID)
					this.responses[data.ID] := data
			}
			else if (EventName == "Close")
			{
				this.Disconnect()
			}
			else if (EventName == "Error")
			{
				; throw Exception("Websocket Error!")
				
							
			;;;;; MAYBE TURN BACK ON LATER I DUNNO
			}
		}
		
		/*
			Disconnect from the page's debug interface, allowing the instance
			to be garbage collected.
			
			This method should always be called when you are finished with a
			page or else your script will leak memory.
		*/
		Disconnect()
		{
			if !this.Connected
				return
			
			this.Connected := False
			this.ws.Delete("Parent")
			this.ws.Disconnect()
			
			BoundKeepAlive := this.BoundKeepAlive
			SetTimer, %BoundKeepAlive%, Delete
			this.Delete("BoundKeepAlive")
		}
		
		class WebSocket
		{
			__New(WS_URL)
			{
				static wb
				
				; Create an IE instance
				Gui, +hWndhOld
				Gui, New, +hWndhWnd
				this.hWnd := hWnd
				Gui, Add, ActiveX, vWB, Shell.Explorer
				Gui, %hOld%: Default
				

				; Write an appropriate document
				WB.Navigate("about:<!DOCTYPE html><meta http-equiv='X-UA-Compatible'"
				. "content='IE=edge'><body></body>")
				while (WB.ReadyState < 4)
					sleep, 50
				this.document := WB.document
				
				; Add our handlers to the JavaScript namespace
				this.document.parentWindow.ahk_savews := this._SaveWS.Bind(this)
				this.document.parentWindow.ahk_event := this._Event.Bind(this)
				this.document.parentWindow.ahk_ws_url := WS_URL
				
				; Add some JavaScript to the page to open a socket
				Script := this.document.createElement("script")
				Script.text := "ws = new WebSocket(ahk_ws_url);`n"
				. "ws.onopen = function(event){ ahk_event('Open', event); };`n"
				. "ws.onclose = function(event){ ahk_event('Close', event); };`n"
				. "ws.onerror = function(event){ ahk_event('Error', event); };`n"
				. "ws.onmessage = function(event){ ahk_event('Message', event); };"
				this.document.body.appendChild(Script)
			}
			
			; Called by the JS in response to WS events
			_Event(EventName, Event)
			{
				this["On" EventName](Event)
			}
			
			; Sends data through the WebSocket
			Send(Data)
			{
				this.document.parentWindow.ws.send(Data)
			}
			
			; Closes the WebSocket connection
			Close(Code:=1000, Reason:="")
			{
				this.document.parentWindow.ws.close(Code, Reason)
			}
			
			; Closes and deletes the WebSocket, removing
			; references so the class can be garbage collected
			Disconnect()
			{
				if this.hWnd
				{
					this.Close()
					Gui, % this.hWnd ": Destroy"
					this.hWnd := False
				}
			}
		}
	}
	
	Jxon_Load(ByRef src, args*)
	{
		static q := Chr(34)
		
		key := "", is_key := false
		stack := [ tree := [] ]
		is_arr := { (tree): 1 }
		next := q . "{[01234567890-tfn"
		pos := 0
		while ( (ch := SubStr(src, ++pos, 1)) != "" )
		{
			if InStr(" `t`n`r", ch)
				continue
			if !InStr(next, ch, true)
			{
				ln := ObjLength(StrSplit(SubStr(src, 1, pos), "`n"))
				col := pos - InStr(src, "`n",, -(StrLen(src)-pos+1))
				
				msg := Format("{}: line {} col {} (char {})"
				,   (next == "")      ? ["Extra data", ch := SubStr(src, pos)][1]
				: (next == "'")     ? "Unterminated string starting at"
				: (next == "\")     ? "Invalid \escape"
				: (next == ":")     ? "Expecting ':' delimiter"
				: (next == q)       ? "Expecting object key enclosed in double quotes"
				: (next == q . "}") ? "Expecting object key enclosed in double quotes or object closing '}'"
				: (next == ",}")    ? "Expecting ',' delimiter or object closing '}'"
				: (next == ",]")    ? "Expecting ',' delimiter or array closing ']'"
				: [ "Expecting JSON value(string, number, [true, false, null], object or array)"
				, ch := SubStr(src, pos, (SubStr(src, pos)~="[\]\},\s]|$")-1) ][1]
				, ln, col, pos)
				
				throw Exception(msg, -1, ch)
			}
			
			is_array := is_arr[obj := stack[1]]
			
			if i := InStr("{[", ch)
			{
				val := (proto := args[i]) ? new proto : {}
				is_array? ObjPush(obj, val) : obj[key] := val
				ObjInsertAt(stack, 1, val)
				
				is_arr[val] := !(is_key := ch == "{")
				next := q . (is_key ? "}" : "{[]0123456789-tfn")
			}
			
			else if InStr("}]", ch)
			{
				ObjRemoveAt(stack, 1)
				next := stack[1]==tree ? "" : is_arr[stack[1]] ? ",]" : ",}"
			}
			
			else if InStr(",:", ch)
			{
				is_key := (!is_array && ch == ",")
				next := is_key ? q : q . "{[0123456789-tfn"
			}
			
			else ; string | number | true | false | null
			{
				if (ch == q) ; string
				{
					i := pos
					while i := InStr(src, q,, i+1)
					{
						val := StrReplace(SubStr(src, pos+1, i-pos-1), "\\", "\u005C")
						static end := A_AhkVersion<"2" ? 0 : -1
						if (SubStr(val, end) != "\")
							break
					}
					if !i ? (pos--, next := "'") : 0
						continue
					
					pos := i ; update pos
					
					val := StrReplace(val,    "\/",  "/")
					, val := StrReplace(val, "\" . q,    q)
					, val := StrReplace(val,    "\b", "`b")
					, val := StrReplace(val,    "\f", "`f")
					, val := StrReplace(val,    "\n", "`n")
					, val := StrReplace(val,    "\r", "`r")
					, val := StrReplace(val,    "\t", "`t")
					
					i := 0
					while i := InStr(val, "\",, i+1)
					{
						if (SubStr(val, i+1, 1) != "u") ? (pos -= StrLen(SubStr(val, i)), next := "\") : 0
							continue 2
						
						; \uXXXX - JSON unicode escape sequence
						xxxx := Abs("0x" . SubStr(val, i+2, 4))
						if (A_IsUnicode || xxxx < 0x100)
							val := SubStr(val, 1, i-1) . Chr(xxxx) . SubStr(val, i+6)
					}
					
					if is_key
					{
						key := val, next := ":"
						continue
					}
				}
				
				else ; number | true | false | null
				{
					val := SubStr(src, pos, i := RegExMatch(src, "[\]\},\s]|$",, pos)-pos)
					
					; For numerical values, numerify integers and keep floats as is.
					; I'm not yet sure if I should numerify floats in v2.0-a ...
					static number := "number", integer := "integer"
					if val is %number%
					{
						if val is %integer%
							val += 0
					}
					; in v1.1, true,false,A_PtrSize,A_IsUnicode,A_Index,A_EventInfo,
					; SOMETIMES return strings due to certain optimizations. Since it
					; is just 'SOMETIMES', numerify to be consistent w/ v2.0-a
					else if (val == "true" || val == "false")
						val := %value% + 0
					; AHK_H has built-in null, can't do 'val := %value%' where value == "null"
					; as it would raise an exception in AHK_H(overriding built-in var)
					else if (val == "null")
						val := ""
					; any other values are invalid, continue to trigger error
					else if (pos--, next := "#")
						continue
					
					pos += i-1
				}
				
				is_array? ObjPush(obj, val) : obj[key] := val
				next := obj==tree ? "" : is_array ? ",]" : ",}"
			}
		}
		
		return tree[1]
	}
	
	Jxon_Dump(obj, indent:="", lvl:=1)
	{
		static q := Chr(34)
		
		if IsObject(obj)
		{
			static Type := Func("Type")
			if Type ? (Type.Call(obj) != "Object") : (ObjGetCapacity(obj) == "")
				throw Exception("Object type not supported.", -1, Format("<Object at 0x{:p}>", &obj))
			
			prefix := SubStr(A_ThisFunc, 1, InStr(A_ThisFunc, ".",, 0))
			fn_t := prefix "Jxon_True",  obj_t := this ? %fn_t%(this) : %fn_t%()
			fn_f := prefix "Jxon_False", obj_f := this ? %fn_f%(this) : %fn_f%()
			
			if (&obj == &obj_t)
				return "true"
			else if (&obj == &obj_f)
				return "false"
			
			is_array := 0
			for k in obj
				is_array := k == A_Index
			until !is_array
			
			static integer := "integer"
			if indent is %integer%
			{
				if (indent < 0)
					throw Exception("Indent parameter must be a postive integer.", -1, indent)
				spaces := indent, indent := ""
				Loop % spaces
					indent .= " "
			}
			indt := ""
			Loop, % indent ? lvl : 0
				indt .= indent
			
			this_fn := this ? Func(A_ThisFunc).Bind(this) : A_ThisFunc
			lvl += 1, out := "" ; Make #Warn happy
			for k, v in obj
			{
				if IsObject(k) || (k == "")
					throw Exception("Invalid object key.", -1, k ? Format("<Object at 0x{:p}>", &obj) : "<blank>")
				
				if !is_array
					out .= ( ObjGetCapacity([k], 1) ? %this_fn%(k) : q . k . q ) ;// key
				.  ( indent ? ": " : ":" ) ; token + padding
				out .= %this_fn%(v, indent, lvl) ; value
				.  ( indent ? ",`n" . indt : "," ) ; token + indent
			}
			
			if (out != "")
			{
				out := Trim(out, ",`n" . indent)
				if (indent != "")
					out := "`n" . indt . out . "`n" . SubStr(indt, StrLen(indent)+1)
			}
			
			return is_array ? "[" . out . "]" : "{" . out . "}"
		}
		
		; Number
		else if (ObjGetCapacity([obj], 1) == "")
			return obj
		
		; String (null -> not supported by AHK)
		if (obj != "")
		{
			obj := StrReplace(obj,  "\",    "\\")
			, obj := StrReplace(obj,  "/",    "\/")
			, obj := StrReplace(obj,    q, "\" . q)
			, obj := StrReplace(obj, "`b",    "\b")
			, obj := StrReplace(obj, "`f",    "\f")
			, obj := StrReplace(obj, "`n",    "\n")
			, obj := StrReplace(obj, "`r",    "\r")
			, obj := StrReplace(obj, "`t",    "\t")
			
			static needle := (A_AhkVersion<"2" ? "O)" : "") . "[^\x20-\x7e]"
			while RegExMatch(obj, needle, m)
				obj := StrReplace(obj, m[0], Format("\u{:04X}", Ord(m[0])))
		}
		
		return q . obj . q
	}
	
	Jxon_True()
	{
		static obj := {}
		return obj
	}
	
	Jxon_False()
	{
		static obj := {}
		return obj
	}
}

