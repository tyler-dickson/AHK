/*
Created by Tyler Dickson using AutoHotKey.

Major Release History:

The Updated Help Section Update - 7/25/2017
The Improved Record Opener Update - 6/2/2017
The Beta WorkSpace Opener Update - 5/5/2017
The Even More Suppression Update - 4/26/2017
The PCT 220 Date Generator Update - 4/20/2017
The Message Box Suppressor/Bubble Notification/Update Notifier Update - 3/28/2017
The Hotstring/HotCorner/Custom Color Update - 3/1/2017
The Updated Interface/Help Section Update - 1/20/2017
The Revamped Settings Menu/Extra Improved Record Opener Update - 1/10/2017
The EFS Fee Payment Log-in Update – 1/6/2017
The EFS Fill/SideBar Update – 1/4/2017
The Customized Date/Initials and Record Opener Update - 12/30/2016 
The Improved Date/Initials and Record Opener Update - 12/29/2016
The Shortcuts Bar+EFS Merging Update - 12/12/2016 
Initial Release - v1.0 - 12/8/2016

-------
Script for toggling in case I ever need it.

F1::SetTimer Toggle, % (Toggle := !Toggle) ? "on" : "off"

Toggle:
SendInput 1
Sleep 50
return

---

!3::
    toggle    := !toggle
    if (toggle = 1){
        MouseMove, 0, 30, 1, R
    }else{
        MouseMove, 0, -30, 1, R
    }
return

---

$*Control::
KeyWait, Control
KeyWait, Control, D T0.15
if ErrorLevel = 1
	return
Else if ErrorLevel = 0
	QuickDate()
return

--------

*/

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, Force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetWinDelay, 20  ; 20 is good for drawers.
formattime, Today, , yyyy-MM-dd		
Menu, Tray, Icon, Shell32.dll, 45
/*

GUI List:
Gui, 1:  Main GUI

Gui, 7: Sidebar Position Tester
Gui, 8:  Decoy Settings Button
Gui, 9:  Settings Button and Arrow
Gui, 10: Settings,/Shortcut Button
Gui, 11: Decoy Settings/Shortcut Button 

Gui, 13: Help Menu

Gui, 20: Settings Drawer Top Left Corner

Gui, 49: Settings Position Tester
Gui, 50: SideBar

Gui, 99: Suggested Remarks
Gui, 99: Paste Extra Clipboards
Gui, 99: Store Extra Clipboards

------------------------------------------------

Table of Contents:
Look for ¿ to jump.

Sets Username for Remarks 
Multiple Things in Internet Explorer
Multiuse:
DateExtend()
Persistent Box on IE 
PersistentBar()
Store Extra Clipboard Items 
StoreClipboard()
Paste Extra Stored Clipboard
PasteClipboard()
Hotkey for Date and Initials
DateAndName()
Open Hyperlink from Excel
HyperlinkFromExcel:
Open Opposite System
SwitchSystem()
Suggested Remarks 
SuggestRemarks()
Attorney Email Finder
AttyEmailFinder()
ClientCodeIE()
QuickDate()
Crazy COM Stuff
OpenSideBar()

Option1 = CalExtend Remarks?
Option2 = QuickDate and Initials
Option3 = Enable Multiuse
Option4 = SystemSwitch
Option5 = Settings/Shortcut Bar
Option6 = Store/Paste Clipboards
Option7 = Enable EFS Options
Option8 = Open Excel Hyperlink
Option9 = Enable Sidebar

*/
Enabled := ComObjError(false)
SysGet, ScreenWidth, 78
SysGet, ScreenHeight, 79
;MsgBox, w%ScreenWidth%, h%ScreenHeight% 
formattime, ThisHour, , MM.dd.yyyy-htt
global ScreenWidth
global ScreenHeight
global ScreenWidthMinus5    := ScreenWidth - 5
global ScreenHeightMinus5   := ScreenHeight - 5
global ScreenWidthPlusFifteenPercent   := ScreenWidth + (ScreenWidth * .15) ;2944
global ThirdScreenHeight    := ScreenHeight * .33                           ;475.2
global HalfScreenHeight     := ScreenHeight * .5                            ;720
global TwoThirdScreenHeight := ScreenHeight * .67		                    ;964.8
	
global ScreenWidthPointFive        := Screenwidth * .005                    ;12.8
global ScreenWidthOnePercent       := Screenwidth * .01                     ;25.6
global ScreenWidthTwoPercent       := Screenwidth * .02                     ;51.2
global ScreenWidthThreePercent     := ScreenWidth * .0333	                ;81.92
global ScreenWidthFourPercent      := ScreenWidth * .04                     ;102.04
global ScreenWidthFivePercent      := ScreenWidth * .05                     ;128
global ScreenWidthFifteenPercent   := ScreenWidth * .15                     ;384
global ScreenWidthSixteenPercent   := ScreenWidth * .16                     ;409.6
global ScreenWidthMinusFivePercent := 0 - ScreenWidthFivePercent            ;-128

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
	
IniRead, Custom1, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom1
	if Custom1 = ERROR
		Custom1 = +CapsLock
IniRead, Custom2, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom2
	if Custom2 = ERROR
		Custom2 = ^``
Custom3 = ^RButton
IniRead, Custom4, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom4
	if Custom4 = ERROR
		Custom4 = ^5
IniRead, Custom5, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom5
	if Custom5 = ERROR
		Custom5 = ^6
;Custom6 = ^;
IniRead, Custom6, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom6
	if Custom6 = ERROR
		Custom6 = ^;
IniRead, Custom7, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom7
	if Custom7 = ERROR
		Custom7 = ^1
Custom10 = !LButton
Custom11 = !RButton
IniWrite, %Custom1%, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom1
IniWrite, %Custom2%, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom2
IniWrite, %Custom4%, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom4
IniWrite, %Custom5%, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom5
IniWrite, %Custom6%, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom6
IniWrite, %Custom7%, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom7

	Sleep 100
	IniRead, Custom1, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom1
	IniRead, Custom2, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom2
	;IniRead, Custom3, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom3
	IniRead, Custom4, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom4
	IniRead, Custom5, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom5
	IniRead, Custom6, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom6
	IniRead, Custom7, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom7
IniRead, QuickRecordOpener, C:\Users\%Computername%\AHKPrefs.ini, Username, QuickRecordOpener
	if QuickRecordOpener = ERROR
		{
		QuickRecordOpener = Alt+RightClick / Alt+LeftClick
		IniWrite, %QuickRecordOpener%, C:\Users\%Computername%\AHKPrefs.ini, Username, QuickRecordOpener
		IniRead, QuickRecordOpener, C:\Users\%Computername%\AHKPrefs.ini, Username, QuickRecordOpener
		}
IniRead, CustomSideBar, C:\Users\%Computername%\AHKPrefs.ini, Custom, CustomSideBar
	if CustomSideBar = ERROR
		{
		IniWrite, www.google.com, C:\Users\%Computername%\AHKPrefs.ini, Custom, CustomSideBar
		Sleep 100
		IniRead, CustomSideBar, C:\Users\%Computername%\AHKPrefs.ini, Custom, CustomSideBar
		}
IniRead, HotCornerBL, C:\Users\%Computername%\AHKPrefs.ini, Hotcorner, HotCornerBL
	if HotCornerBL = ERROR
		{
		IniWrite, "" , C:\Users\%Computername%\AHKPrefs.ini, Hotcorner, HotCornerBL
		Sleep 100
		IniRead, HotCornerBL, C:\Users\%Computername%\AHKPrefs.ini, Hotcorner, HotCornerBL
		}		
IniRead, HotCornerTR, C:\Users\%Computername%\AHKPrefs.ini, Hotcorner, HotCornerTR
	if HotCornerTR = ERROR
		{
		IniWrite,  "", C:\Users\%Computername%\AHKPrefs.ini, Hotcorner, HotCornerTR
		Sleep 100
		IniRead, HotCornerTR, C:\Users\%Computername%\AHKPrefs.ini, Hotcorner, HotCornerTR
		}		
IniRead, HotCornerBR, C:\Users\%Computername%\AHKPrefs.ini, Hotcorner, HotCornerBR
	if HotCornerBR = ERROR
		{
		IniWrite, "" , C:\Users\%Computername%\AHKPrefs.ini, Hotcorner, HotCornerBR
		Sleep 100
		IniRead, HotCornerBR, C:\Users\%Computername%\AHKPrefs.ini, Hotcorner, HotCornerBR
		}		
IniRead, Checkboxes, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes
	if Checkboxes = ERROR
		{
		Checkboxes = 0,0,0,0,0,0,0,0,0
		IniWrite, %Checkboxes%, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes
		IniRead, Checkboxes, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes
		}
IniRead, RecordBoxes, C:\Users\%Computername%\AHKPrefs.ini, Username, RecordBoxes
	if RecordBoxes = ERROR
		{
		RecordBoxes = 1,1,1,1,1,1
		IniWrite, %RecordBoxes%, C:\Users\%Computername%\AHKPrefs.ini, Username, RecordBoxes
		IniRead, RecordBoxes, C:\Users\%Computername%\AHKPrefs.ini, Username, RecordBoxes
		}
IniRead, RadioChoice, C:\Users\%Computername%\AHKPrefs.ini, Username, Radio
	if RadioChoice = ERROR
		{
		RadioChoice = 1,0,0
		IniWrite, %RadioChoice%, C:\Users\%Computername%\AHKPrefs.ini, Username, Radio
		IniRead, RadioChoice, C:\Users\%Computername%\AHKPrefs.ini, Username, Radio
		}
IniRead, EFSEmail, C:\Users\%Computername%\AHKPrefs.ini, Username, EFSEmail
	if EFSEmail = ERROR
		{
		EFSEmail = instructions@knobbe.com
		IniWrite, %EFSEmail%, C:\Users\%Computername%\AHKPrefs.ini, Username, EFSEmail
		IniRead, EFSEmail, C:\Users\%Computername%\AHKPrefs.ini, Username, EFSEmail
		}
IniRead, SettingsX,     C:\Users\%Computername%\AHKPrefs.ini, Username, SettingsX
	if SettingsX = ERROR
		{
		SettingsX = 1
		IniWrite, %SettingsX%, C:\Users\%Computername%\AHKPrefs.ini, Username, SettingsX
		IniRead,   SettingsX,  C:\Users\%Computername%\AHKPrefs.ini, Username, SettingsX
		}
IniRead, SettingsY,    C:\Users\%Computername%\AHKPrefs.ini, Username, SettingsY
	if SettingsY = ERROR	
		{
		SettingsY = 917
		IniWrite, %SettingsY%, C:\Users\%Computername%\AHKPrefs.ini, Username, SettingsY
		IniRead,   SettingsY,  C:\Users\%Computername%\AHKPrefs.ini, Username, SettingsY
		}	
IniRead, SidebarX,    C:\Users\%Computername%\AHKPrefs.ini, Username, SidebarX
	if SidebarX = ERROR	
		{
		SidebarX = 2557
		IniWrite, %SidebarX%, C:\Users\%Computername%\AHKPrefs.ini, Username, SidebarX
		IniRead,   SidebarX,  C:\Users\%Computername%\AHKPrefs.ini, Username, SidebarX
		}	

IniRead, WindowPosX, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
	if WindowPosX = ERROR
		{
		WindowPosX = 0
		IniWrite, %WindowPosX%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
		IniRead,   WindowPosX,  C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
		}
IniRead, WindowPosY, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
	if WindowPosY = ERROR	
		{
		WindowPosY = 0
		IniWrite, %WindowPosY%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
		IniRead,   WindowPosY,  C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
		}
IniRead, Keystrokes, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, Keystrokes
	if Keystrokes = ERROR
		{
		Keystrokes = 0
		IniWrite, %Keystrokes%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, Keystrokes
		IniRead, Keystrokes, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, Keystrokes
		}
IniRead, DateShortcut, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, DateShortcut
	if DateShortcut = ERROR
		{
		DateShortcut = 0
		IniWrite, %DateShortcut%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, DateShortcut
		IniRead, DateShortcut, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, DateShortcut
		}
IniRead, AttyFinder, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AttyFinder
	if AttyFinder = ERROR
		{
		AttyFinder = 0
		IniWrite, %AttyFinder%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AttyFinder
		IniRead, AttyFinder, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AttyFinder
		}
IniRead, CalExtend, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CalExtend
	if CalExtend = ERROR
		{
		CalExtend = 0
		IniWrite, %CalExtend%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CalExtend
		IniRead, CalExtend, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CalExtend
		}
IniRead, SysSwitch, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SysSwitch
	if SysSwitch = ERROR
		{
		SysSwitch = 0
		IniWrite, %SysSwitch%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SysSwitch
		IniRead, SysSwitch, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SysSwitch
		}
IniRead, ExcelHLink, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ExcelHLink
	if ExcelHLink = ERROR
		{
		ExcelHLink = 0
		IniWrite, %ExcelHLink%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ExcelHLink
		IniRead, ExcelHLink, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ExcelHLink
		}
IniRead, EFSCertFinder, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSCertFinder
	if EFSCertFinder = ERROR
		{
		EFSCertFinder = 0
		IniWrite, %EFSCertFinder%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSCertFinder
		IniRead, EFSCertFinder, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSCertFinder
		}
IniRead, CopyAction, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CopyAction
	if CopyAction = ERROR
		{
		CopyAction = 0
		IniWrite, %CopyAction%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CopyAction
		IniRead, CopyAction, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CopyAction
		}
IniRead, PasteAction, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, PasteAction
	if PasteAction = ERROR
		{
		PasteAction = 0
		IniWrite, %PasteAction%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, PasteAction
		IniRead, PasteAction, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, PasteAction
		}
IniRead, SuggestRemarks, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SuggestRemarks
	if SuggestRemarks = ERROR
		{
		SuggestRemarks = 0
		IniWrite, %SuggestRemarks%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SuggestRemarks
		IniRead, SuggestRemarks, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SuggestRemarks
		}
IniRead, ClientCodeIE, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
	if ClientCodeIE = ERROR
		{
		ClientCodeIE = 0
		IniWrite, %ClientCodeIE%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
		IniRead, ClientCodeIE, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
		}
IniRead, EFSFill, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSFill
	if EFSFill = ERROR
		{
		EFSFill = 0
		IniWrite, %EFSFill%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSFill
		IniRead, EFSFill, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSFill
		}
IniRead, EFSLogin, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSLogin
	if EFSLogin = ERROR
		{
		EFSLogin = 0
		IniWrite, %EFSLogin%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSLogin
		IniRead, EFSLogin, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSLogin
		}
IniRead, AHotCornerBL, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBL
	if AHotCornerBL = ERROR
		{
		AHotCornerBL = 0
		IniWrite, %AHotCornerBL%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBL
		IniRead, AHotCornerBL, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBL
		}		
IniRead, AHotCornerTR, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerTR
	if AHotCornerTR = ERROR
		{
		AHotCornerTR = 0
		IniWrite, %AHotCornerTR%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerTR
		IniRead, AHotCornerTR, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerTR
		}			
IniRead, AHotCornerBR, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBR
	if AHotCornerBR = ERROR
		{
		AHotCornerBR = 0
		IniWrite, %AHotCornerBR%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBR
		IniRead, AHotCornerBR, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBR
		}
		
IniRead, KeystrokesH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, Keystrokes
	if KeystrokesH = ERROR
		{
		KeystrokesH = 0
		IniWrite, %KeystrokesH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, Keystrokes
		IniRead, KeystrokesH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, Keystrokes
		}
IniRead, DateShortcutH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, DateShortcut
	if DateShortcutH = ERROR
		{
		DateShortcutH = 0
		IniWrite, %DateShortcutH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, DateShortcut
		IniRead, DateShortcutH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, DateShortcut
		}
IniRead, AttyFinderH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AttyFinder
	if AttyFinderH = ERROR
		{
		AttyFinderH = 0
		IniWrite, %AttyFinderH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AttyFinder
		IniRead, AttyFinderH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AttyFinder
		}
IniRead, CalExtendH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, CalExtend
	if CalExtendH = ERROR
		{
		CalExtendH = 0
		IniWrite, %CalExtendH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, CalExtend
		IniRead, CalExtendH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, CalExtend
		}
IniRead, SysSwitchH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, SysSwitch
	if SysSwitchH = ERROR
		{
		SysSwitchH = 0
		IniWrite, %SysSwitchH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, SysSwitch
		IniRead, SysSwitchH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, SysSwitch
		}
IniRead, ExcelHLinkH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, ExcelHLink
	if ExcelHLinkH = ERROR
		{
		ExcelHLinkH = 0
		IniWrite, %ExcelHLinkH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, ExcelHLink
		IniRead, ExcelHLinkH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, ExcelHLink
		}
IniRead, EFSCertFinderH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSCertFinder
	if EFSCertFinderH = ERROR
		{
		EFSCertFinderH = 0
		IniWrite, %EFSCertFinderH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSCertFinder
		IniRead, EFSCertFinderH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSCertFinder
		}
IniRead, CopyActionH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, CopyAction
	if CopyActionH = ERROR
		{
		CopyActionH = 0
		IniWrite, %CopyActionH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, CopyAction
		IniRead, CopyActionH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, CopyAction
		}
IniRead, PasteActionH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, PasteAction
	if PasteActionH = ERROR
		{
		PasteActionH = 0
		IniWrite, %PasteActionH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, PasteAction
		IniRead, PasteActionH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, PasteAction
		}
IniRead, SuggestRemarksH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, SuggestRemarks
	if SuggestRemarksH = ERROR
		{
		SuggestRemarksH = 0
		IniWrite, %SuggestRemarksH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, SuggestRemarks
		IniRead, SuggestRemarksH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, SuggestRemarks
		}
IniRead, ClientCodeIEH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, ClientCodeIE
	if ClientCodeIEH = ERROR
		{
		ClientCodeIEH = 0
		IniWrite, %ClientCodeIEH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, ClientCodeIE
		IniRead, ClientCodeIEH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, ClientCodeIE
		}
IniRead, EFSFillH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSFill
	if EFSFillH = ERROR
		{
		EFSFillH = 0
		IniWrite, %EFSFillH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSFill
		IniRead, EFSFillH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSFill
		}
IniRead, EFSLoginH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSLogin
	if EFSLoginH = ERROR
		{
		EFSLoginH = 0
		IniWrite, %EFSLoginH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSLogin
		IniRead, EFSLoginH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSLogin
		}

IniRead, AHotCornerBLH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AHotCornerBL
	if AHotCornerBLH = ERROR
		{
		AHotCornerBLH = 0
		IniWrite, %AHotCornerBLH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AHotCornerBL
		IniRead, AHotCornerBLH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AHotCornerBL
		}	
IniRead, AHotCornerTRH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AHotCornerTR
	if AHotCornerTRH = ERROR
		{
		AHotCornerTRH = 0
		IniWrite, %AHotCornerTRH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AHotCornerTR
		IniRead, AHotCornerTRH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AHotCornerTR
		}
IniRead, AHotCornerBRH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AHotCornerBR
	if AHotCornerBRH = ERROR
		{
		AHotCornerBRH = 0
		IniWrite, %AHotCornerBRH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AHotCornerBR
		IniRead, AHotCornerBRH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AHotCornerBR
		}
		
		
global ie	
global IntPat = INT-PAT
global IntTM = INT-TM
global year := SubStr(NewClipboard, 8,4)
global month := SubStr(NewClipboard, 4, 3) 
global day := SubStr(NewClipboard, 1,2)
global NewClipboard := Clipboard
global MyMonthCal
global Array
global ATDate
global ATPartner
global Username
global TestString
global AttyString
global Hotstring
global Extended
global ThreeString
global Oldclipboard
global QC
global Option1
global Option2
global Option3
global Option4
global Option5
global Option6
global Option7
global Option8
global Option9
global RecordBox1
global RecordBox2
global RecordBox3
global RecordBox4
global RecordBox5
global RecordBox6
global RadioChoice1
global RadioChoice2
global RadioChoice3
global HotKR = 0
global HotKL = 0
global HotKD = 0
global HelpKL = 0
global SettingsX
global SettingsY
global SidebarX
global RespAtty
;IniRead, CloseMsgForever, C:\Users\%Computername%\AHKPrefs.ini, CloseMsgBox, 08222017
;
;	if (CloseMsgForever = "ERROR") || (CloseMsgForever = 0)
;		MsgBox, 52, Updated Help Section + Improved Calendar Extender, The Help section (bottom-left corner of the Settings Menu) has been updated. I've transitioned everything to a webpage with .gif examples of each script. This should hopefully give you a good example of how each is used in case you aren't using some.`n`nThe Calendar Extender has been updated to include a spot for the Attorney's initials. This is great for huge MD updates all from the same person. (Thanks to Jason F. for the suggestion!)`n`nClick YES to hide this message for forever.`nClick NO to see this the next time you open the script.
;		IfMsgBox Yes
;			{
;			IniWrite, 1, C:\Users\%Computername%\AHKPrefs.ini, CloseMsgBox, 08222017 
;			goto Reopen
;			}
;		IfMsgBox No
;			{
;			goto Reopen
;			}
;	if CloseMsgForever = 1
goto Reopen
return
;return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;       Quick TM/Patent Opener       ;;
;;   Ctrl+K / Alt + RClick/LClick     ;;
;;     Might be unnecessary soon      ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#E::
gosub FillEFS
return

#F::
gosub EFSPayLogIn
return

Custom10:
SendInput ^c
Clipwait .25
ie := WBGet()
	if IsObject(ie) = 0
		{
		Run "iexplore.exe"
		Sleep 3000
		ie := WBGet()
		return
		}
	else

var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
TrayTip, Quick Record Opener, Opening a TM in docketing.
OutputVar = http://oc-docketing/CPi/tmkschTrademark.aspx

params := [OutputVar, 32]
ie.Navigate(params*)
while ie.busy ;  or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
Sleep 3000
TrayTip
gosub RecordClientCodeIE
SendInput {Ctrl up}
return

Custom11:
SendInput ^c
Clipwait .25
ie := WBGet()
	if IsObject(ie) = 0
		{
		Run "iexplore.exe"
		Sleep 3000
		ie := WBGet()
		return
		}
	else
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
TrayTip, Quick Record Opener, Opening a Patent in docketing.
OutputVar = http://oc-docketing/CPi/patschCountryApplication.aspx
params := [OutputVar, 32]
ie.Navigate(params*)

while ie.busy ; or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
Sleep 3000
TrayTip
gosub RecordClientCodeIE
SendInput {Ctrl up}
return
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;            Settings Menu           ;;
;;           CTRL + CapsLock          ;;
;;   Stores data in %Computername%.ini  ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^CapsLock::
Reopen:
Gui, 1: Destroy
FormatTime, TimeStamp, R
;CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
;MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATPartner, C:\Users\%Computername%\AHKPrefs.ini, Username, ATPartner
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
IniRead, Checkboxes, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes
IniRead, RecordBoxes, C:\Users\%Computername%\AHKPrefs.ini, Username, RecordBoxes
IniRead, RadioChoice, C:\Users\%Computername%\AHKPrefs.ini, Username, Radio
StringSplit, Checkboxes, Checkboxes, `, ,
StringSplit, RecordBoxes, RecordBoxes, `, ,
StringSplit, RadioChoice, RadioChoice, `, ,
IniRead, EFSFirst,       C:\Users\%Computername%\AHKPrefs.ini, Username, EFSFirst
IniRead, EFSLast,        C:\Users\%Computername%\AHKPrefs.ini, Username, EFSLast
IniRead, EFSEmail,       C:\Users\%Computername%\AHKPrefs.ini, Username, EFSEmail
IniRead, EFSPayEmail,    C:\Users\%Computername%\AHKPrefs.ini, Username, EFSPayEmail
IniRead, EFSPayPassword, C:\Users\%Computername%\AHKPrefs.ini, Username, EFSPayPassword
IniRead, QuickRecordOpener, C:\Users\%Computername%\AHKPrefs.ini, Username, QuickRecordOpener
IniRead, CustomColor, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowColor
	if CustomColor = ERROR	
		CustomColor = Default
	if CustomColor = FF69B4
		CustomColor = Pink
;Msgbox %Checkboxes0%, %Checkboxes1%%Checkboxes2%%Checkboxes3%%Checkboxes4%%Checkboxes5%%Checkboxes6%%Checkboxes7%%Checkboxes8%
;Msgbox %RecordBoxes0%, %RecordBoxes1%%RecordBoxes2%%RecordBoxes3%%RecordBoxes4%%RecordBoxes5%%RecordBoxes6%
Gui, 1: Add, Tab3, x1 y0 w300 h390 +Center, Miscellaneous|Multiuse|EFS/HotCorners|Keybindings| ;
Gui, 1: Tab, 1
Gui, 1:Add, GroupBox, x5 y30 w290 h85,
Gui, 1:Add, Checkbox, cBlue x10 y30 Checked%Checkboxes2% gDisable1 vOption2, Enable Quick Date and Initials
Gui, 1:Font, italic
Gui, 1:Add, Text, x20 y50 w260 +Center, *Make sure you add formatting punctuation.* 
Gui, 1:Font
Gui, 1:Add, GroupBox, +Center x10 y65 w75 h45, Date
Gui, 1: Add, Edit, x15 y80 w65 h20 +Center vATDate, %ATDate%
Gui, 1: Add, Text, x86 y84 w110, Test remarks go here.
Gui, 1: Add, GroupBox, +Center x190 y65 w100 h45, Username
Gui, 1: Add, Edit, x195 y80 w90 h20 +Center vUsername, %Username%

Gui, 1:Add, GroupBox, x5 y122 w143 h50, 
Gui, 1:Add, Checkbox, cBlue x10 y122 Check3 Checked%Checkboxes4% gDisable2 vOption4, Enable System Switch
Gui, 1:Font, italic
Gui, 1:Add, Text, x10 y139 w130 +Center, *Allows switching between`nLive and Audit Trail.*
Gui, 1:Font

Gui, 1:Add, GroupBox, x5 y180 w290 h65, 
Gui, 1:Add, Checkbox, cBlue x10 y180  Checked%Checkboxes5% vOption5, Enable Settings/Shortcuts Bar
Gui, 1:Font, Italic
Gui, 1:Add, Text, x10 y198 w135 +Center, *Most enabled options will appear as optional shortcuts on the Settings Bar.*
Gui, 1:Font
Gui, 1:Add, GroupBox, +Center x150 y195 w140 h43, Settings Bar Positioning
Gui, 1:Add, Edit, x157 y210 w60 h20, gSettingsPosX,
Gui, 1:Add, UpDown, Horz 16 Left 0x80 wp vSettingsX gUpDownButton2 Range1-5000, %SettingsX%	
Gui, 1:Add, Edit, x224 y210 w60 h20, gSettingsPosY,
Gui, 1:Add, UpDown, Left 0x80 wp vSettingsY gUpDownButton Range1440-1, %SettingsY%

Gui, 1:Add, GroupBox, x5 y254 w290 h40, 
Gui, 1:Add, Checkbox, cBlue x10 y254 Checked%Checkboxes6% gDisable3 vOption6, Enable Store/Paste Extra Clipboards
Gui, 1:Font, Italic
Gui, 1:Add, Text, x10 y274 w270 +Center, *See Help section for detailed usage instructions.*
Gui, 1:Font, 
Gui, 1:Font, s8
Gui, 1:Font

Gui, 1:Add, GroupBox, x150 y122 w145 h50, 
Gui, 1:Add, Checkbox, cRed x156 y122 Checked%Checkboxes8% gDisable4 vOption8, Enable Link from Excel
Gui, 1:Font, Italic
Gui, 1:Add, Text, x160 y139 w130 +Center, *Very uncommon.*`n*See Help for details.*
Gui, 1:Font

Gui, 1:Font, bold underline
Gui, 1:Add, Button, x5 y350 w40 h30 gOpenHelp , Help
Gui, 1:Font
Gui, 1:Font, bold
Gui, 1:Add, Button, x70 y350 w80 h30 gaOK , Update
Gui, 1:Add, Button, x155 y350 w80 h30 gCancel , Cancel
Gui, 1:Font

Gui, 1:Font, s6
Gui, 1:Add, Text, x255 h10 y375 gCherSystemSwitch vCherSystemSwitch, v.8.22.2017   ; change to 1.23.2017 when released
Gui, 1:Font

Gui, 1:Tab, 2
Gui, 1:Add, GroupBox, x5 y30 w290 h75,
Gui, 1:Add, Checkbox, cBlue x10 y30 Checked%Checkboxes3% gNoRemarks1 vOption3, Enable Multiuse (Hold Control, then Right Click.)
Gui, 1:Add, Text, x10 y50 , Includes: Calendar Extender, Remarks Suggester,`n`t`t    Attorney Finder, and Record Opener 
Gui, 1:Add, Checkbox, cGreen x65 y84 Checked%Checkboxes1% gNoRemarks2 vOption1, Auto-remarks on Calendar Extend?
Gui, 1:Add, GroupBox, cGreen  x5   y110 w290 h180 +Center, Record Opener (Select options to appear on pop-up.)
Gui, 1:Add, GroupBox, +Center x10  y130 w90 h40, Patent
Gui, 1:Add, GroupBox, +Center x105 y130 w90 h40, Trademark
Gui, 1:Add, GroupBox, +Center x200 y130 w89 h40, Invention
Gui, 1:Add, Checkbox, x18 y150  Checked%RecordBoxes1% gClearA vRecordBox1, Live
Gui, 1:Add, Checkbox, x63 y150  Checked%RecordBoxes2% gClearB vRecordBox2, AT
Gui, 1:Add, Checkbox, x113 y150 Checked%RecordBoxes5% gClearC vRecordBox5, Live
Gui, 1:Add, Checkbox, x158 y150 Checked%RecordBoxes6% gClearD vRecordBox6, AT
Gui, 1:Add, Checkbox, x208 y150 Checked%RecordBoxes3% gClearE vRecordBox3, Live
Gui, 1:Add, Checkbox, x253 y150 w30 Checked%RecordBoxes4% gClearF vRecordBox4, AT
Gui, 1:Add, GroupBox, cGreen x10 y175 w280 h40 +Center, Force Only Patent/TM? (No pop-up or AT option.)
Gui, 1:Add, Radio, x25  y190 h20 w32          Checked%RadioChoice1% vRadioChoice1, Off
Gui, 1:Add, Radio, x113 y190 h20 w50 gClear1 Checked%RadioChoice2% vRadioChoice2, Patent
Gui, 1:Add, Radio, x208 y190 h20 w70 gClear2 Checked%RadioChoice3% vRadioChoice3, Trademark
Gui, 1:Add, GroupBox, cGreen x10 y220 w280 h65 +Center, Quick Record Opener (Ignores above preferences.)
Gui, 1:Font, bold
Gui, 1:Add, Groupbox,    x40 y237 w220 h43 +Center, Patent   |   Trademark
Gui, 1:Font
	if QuickRecordOpener = Alt+LeftClick / Alt+RightClick
		Gui, 1:Add, DropDownList, R2 x70 y253 w163 h15 +Center vQuickRecordOpener, %QuickRecordOpener%||Alt+RightClick / Alt+LeftClick
	if QuickRecordOpener = Alt+RightClick / Alt+LeftClick
		Gui, 1:Add, DropDownList, R2 x70 y253 w163 h15 +Center vQuickRecordOpener, %QuickRecordOpener%||Alt+LeftClick / Alt+RightClick
Gui, 1:Add, GroupBox, cGreen x5  y295 w290 h67 +Center, Attorney Finder AT Partner (Appended to attorneys.)
Gui, 1:Add, GroupBox, +Center x40 y313 w220 h43, FirstName.LastName
Gui, 1:Add, Edit,     x70 y328 w163 h20 +Center vATPartner, %ATPartner%


Gui, 1:Tab, 3
Gui, 1:Add, GroupBox, x5 y30 w290 h55,
Gui, 1:Add, Checkbox, cBlue x10 y30 Checked%Checkboxes7% vOption7, Enable EFS Options (!ATY in EFS + Quick Settings.) 
Gui, 1:Add, Text, x10 y50 , Includes: EFS Certificate and Password Finder,`n`t           EFS Information Filler, and EFS Fees Log-in 
;Gui, 1:Add, Button, x65 y80 w175 h20 gPopEFSButton,Pop-out EFS Options


Gui, 1:Add, GroupBox, cGreen  x5  y90 w155 h141 +Center, EFS Filler Information
Gui, 1:Add, Text, x10 h20 y110 w144 +Center, First Name:
Gui, 1:Add, Edit, x10 h20 y125 w144 Limit +Center vEFSFirst, %EFSFirst%
Gui, 1:Add, Text, x10 h20 y150 w144 +Center, Last Name:
Gui, 1:Add, Edit, x10 h20 y165 w144 Limit +Center vEFSLast, %EFSLast%
Gui, 1:Add, Text, x10 h20 y190 w144 +Center, Filing Email Address:
	if EFSEmail = instructions@knobbe.com
		Gui, 1:Add, DropDownList, R2 x10 h20 y205 w144 +Center vEFSEmail, %EFSEmail%||efiling@knobbe.com
	else if EFSEmail = efiling@knobbe.com
		Gui, 1:Add, DropDownList, R2 x10 h20 y205 w144 +Center vEFSEmail, %EFSEmail%||instructions@knobbe.com
		
		
Gui, 1:Add, GroupBox, cGreen  x165  y90 w130 h141 +Center, EFS Fees Log-in Info
Gui, 1:Font, Italic
Gui, 1:Add, Text, x170 h40 y108 w120 +Center, *Use about two minutes prior to paying to avoid log-in screen.*
Gui, 1:Font
Gui, 1:Add, Text, x170 h20 y150 w120 +Center, Fees Email/Username:
Gui, 1:Add, Edit, x170 h20 y165 w120 +Left vEFSPayEmail, %EFSPayEmail%
Gui, 1:Font
Gui, 1:Add, Text, x170 h20 y190 w120 +Center, Fees Password:
Gui, 1:Add, Edit, x170 h20 y205 w120 +Left Password vEFSPayPassword, %EFSPayPassword%


Gui, 1:Add, GroupBox, x505  y244 w290 h67, 
Gui, 1:Add, GroupBox, +Center x510  y262 w135 h43, SideBar Function
Gui, 1:Add, Checkbox, cBlue x510 y246 Checked%Checkboxes9% vOption9, Enable SideBar (Custom action on edge of screen.)
	if CustomSideBar = ;
		Gui, 1: Add, ComboBox, Sort R20 x515 y279 w125 h12 +Center vCustomSideBar, calc.exe||www.google.com|calc.exe|iexplore.exe|Kronos|Settings Menu|Paste Clipboards|Copy Clipboards|Quick Date and Initials|Hyperlink from Excel|System Switch|Quick Today's Date|
	else
		Gui, 1: Add, ComboBox, Sort R20 x515 y279 w125 h12 +Center vCustomSideBar, %CustomSideBar%||www.google.com|calc.exe|iexplore.exe|Kronos|Settings Menu|Paste Clipboards|Copy Clipboards|Quick Date and Initials|Hyperlink from Excel|System Switch|Quick Today's Date|
Gui, 1:Add, GroupBox, +Center x650 y262 w140 h43, SideBar Positioning
Gui, 1:Add, Edit, x690 y279 w60 h20, gSideBarPosX,
Gui, 1:Add, UpDown, Horz 16 Left 0x80 wp vSideBarX gSideBarPos Range1-5000, %SideBarX%	

Gui, 1: Tab, 4
IniRead, Custom1, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom1
IfInString, Custom1, ^
		{
		Gui, 1:Add, Checkbox, Checked1 gNoCtrl1 vCustom1C x10  y52 w35, Ctrl
		StringReplace, Custom1, Custom1, ^, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoCtrl1 vCustom1C x10  y52 w35, Ctrl
IfInString, Custom1, #
		{
		Gui, 1:Add, Checkbox, Checked1 gNoWin1 vCustom1W x49  y52 w35, Win
		StringReplace, Custom1, Custom1, #, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoWin1 vCustom1W x49  y52 w35, Win
IfInString, Custom1, !
		{
		Gui, 1:Add, Checkbox, Checked1 gNoAlt1 vCustom1A x91  y52 w30, Alt
		StringReplace, Custom1, Custom1, !, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoAlt1 vCustom1A x91  y52 w30, Alt
IfInString, Custom1, +
		{
		Gui, 1:Add, Checkbox, Checked1 gNoShift1 vCustom1S x125 y52 w40, Shift
		StringReplace, Custom1, Custom1, +, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoShift1 vCustom1S x125 y52 w40, Shift	
IfInString, Custom1, ``
	StringReplace, Custom1, Custom1, ``, `` (Backtick)
IfInString, Custom1, `,
	StringReplace, Custom1, Custom1, `, , `, (Comma)
IfInString, Custom1, .
	StringReplace, Custom1, Custom1, . , . (Period)
IfInString, Custom1, `;
	StringReplace, Custom1, Custom1, `; , `; (Semicolon)
IfInString, Custom1, '
	StringReplace, Custom1, Custom1, ' , ' (Apostrophe)
IniRead, Custom2, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom2
IfInString, Custom2, ^
		{
		Gui, 1:Add, Checkbox, Checked1 gNoCtrl2 vCustom2C x10  y102 w35, Ctrl
		StringReplace, Custom2, Custom2, ^, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoCtrl2 vCustom2C x10  y102 w35, Ctrl
IfInString, Custom2, #
		{
		Gui, 1:Add, Checkbox, Checked1 gNoWin2 vCustom2W x49  y102 w35, Win
		StringReplace, Custom2, Custom2, #, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoWin2 vCustom2W x49  y102 w35, Win
IfInString, Custom2, !
		{
		Gui, 1:Add, Checkbox, Checked1 gNoAlt2 vCustom2A x91  y102 w30, Alt
		StringReplace, Custom2, Custom2, !, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoAlt2 vCustom2A x91  y102 w30, Alt
IfInString, Custom2, +
		{
		Gui, 1:Add, Checkbox, Checked1 gNoShift2 vCustom2S x125 y102 w40, Shift
		StringReplace, Custom2, Custom2, +, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoShift2 vCustom2S x125 y102 w40, Shift	
IfInString, Custom2, ``
	StringReplace, Custom2, Custom2, ``, `` (Backtick)
IfInString, Custom2, `,
	StringReplace, Custom2, Custom2, `, , `, (Comma)
IfInString, Custom2, .
	StringReplace, Custom2, Custom2, . , . (Period)
IfInString, Custom2, `;
	StringReplace, Custom2, Custom2, `; , `; (Semicolon)
IfInString, Custom2, '
	StringReplace, Custom2, Custom2, ' , ' (Apostrophe)
IniRead, Custom4, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom4
IfInString, Custom4, ^
		{
		Gui, 1:Add, Checkbox, Checked1 gNoCtrl4 vCustom4C x10  y152 w35, Ctrl
		StringReplace, Custom4, Custom4, ^, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoCtrl4 vCustom4C x10  y152 w35, Ctrl
IfInString, Custom4, #
		{
		Gui, 1:Add, Checkbox, Checked1 gNoWin4 vCustom4W x49  y152 w35, Win
		StringReplace, Custom4, Custom4, #, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoWin4 vCustom4W x49  y152 w35, Win
IfInString, Custom4, !
		{
		Gui, 1:Add, Checkbox, Checked1 gNoAlt4 vCustom4A x91  y152 w30, Alt
		StringReplace, Custom4, Custom4, !, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoAlt4 vCustom4A x91  y152 w30, Alt
IfInString, Custom4, +
		{
		Gui, 1:Add, Checkbox, Checked1 gNoShift4 vCustom4S x125 y152 w40, Shift
		StringReplace, Custom4, Custom4, +, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoShift4 vCustom4S x125 y152 w40, Shift	
IfInString, Custom4, ``
	StringReplace, Custom4, Custom4, ``, `` (Backtick)
IfInString, Custom4, `,
	StringReplace, Custom4, Custom4, `, , `, (Comma)
IfInString, Custom4, .
	StringReplace, Custom4, Custom4, . , . (Period)
IfInString, Custom4, `;
	StringReplace, Custom4, Custom4, `; , `; (Semicolon)
IfInString, Custom4, '
	StringReplace, Custom4, Custom4, ' , ' (Apostrophe)
IniRead, Custom5, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom5
IfInString, Custom5, ^
		{
		Gui, 1:Add, Checkbox, Checked1 gNoCtrl5 vCustom5C x10  y202 w35, Ctrl
		StringReplace, Custom5, Custom5, ^, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoCtrl5 vCustom5C x10  y202 w35, Ctrl
IfInString, Custom5, #
		{
		Gui, 1:Add, Checkbox, Checked1 gNoWin5 vCustom5W x49  y202 w35, Win
		StringReplace, Custom5, Custom5, #, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoWin5 vCustom5W x49  y202 w35, Win
IfInString, Custom5, !
		{
		Gui, 1:Add, Checkbox, Checked1 gNoAlt5 vCustom5A x91  y202 w30, Alt
		StringReplace, Custom5, Custom5, !, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoAlt5 vCustom5A x91  y202 w30, Alt
IfInString, Custom5, +
		{
		Gui, 1:Add, Checkbox, Checked1 gNoShift5 vCustom5S x125 y202 w40, Shift
		StringReplace, Custom5, Custom5, +, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoShift5 vCustom5S x125 y202 w40, Shift	
IfInString, Custom5, ``
	StringReplace, Custom5, Custom5, ``, `` (Backtick)
IfInString, Custom5, `,
	StringReplace, Custom5, Custom5, `, , `, (Comma)
IfInString, Custom5, .
	StringReplace, Custom5, Custom5, . , . (Period)
IfInString, Custom5, `;
	StringReplace, Custom5, Custom5, `; , `; (Semicolon)
IfInString, Custom5, '
	StringReplace, Custom5, Custom5, ' , ' (Apostrophe)
IniRead, Custom7, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom7
IfInString, Custom7, ^
		{
		Gui, 1:Add, Checkbox, Checked1 gNoCtrl7 vCustom7C x10  y252 w35, Ctrl
		StringReplace, Custom7, Custom7, ^, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoCtrl7 vCustom7C x10  y252 w35, Ctrl
IfInString, Custom7, #
		{
		Gui, 1:Add, Checkbox, Checked1 gNoWin7 vCustom7W x49  y252 w35, Win
		StringReplace, Custom7, Custom7, #, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoWin7 vCustom7W x49  y252 w35, Win
IfInString, Custom7, !
		{
		Gui, 1:Add, Checkbox, Checked1 gNoAlt7 vCustom7A x91  y252 w30, Alt
		StringReplace, Custom7, Custom7, !, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoAlt7 vCustom7A x91  y252 w30, Alt
IfInString, Custom7, +
		{
		Gui, 1:Add, Checkbox, Checked1 gNoShift7 vCustom7S x125 y252 w40, Shift
		StringReplace, Custom7, Custom7, +, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoShift7 vCustom7S x125 y252 w40, Shift	
IfInString, Custom7, ``
	StringReplace, Custom7, Custom7, ``, `` (Backtick)
IfInString, Custom7, `,
	StringReplace, Custom7, Custom7, `, , `, (Comma)
IfInString, Custom7, .
	StringReplace, Custom7, Custom7, . , . (Period)
IfInString, Custom7, `;
	StringReplace, Custom7, Custom7, `; , `; (Semicolon)
IfInString, Custom7, '
	StringReplace, Custom7, Custom7, ' , ' (Apostrophe)
IniRead, Custom6, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom6
IfInString, Custom6, ^
		{
		Gui, 1:Add, Checkbox, Checked1 gNoCtrl6 vCustom6C x10  y302 w35, Ctrl
		StringReplace, Custom6, Custom6, ^, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoCtrl6 vCustom6C x10  y302 w35, Ctrl
IfInString, Custom6, #
		{
		Gui, 1:Add, Checkbox, Checked1 gNoWin6 vCustom6W x49  y302 w35, Win
		StringReplace, Custom6, Custom6, #, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoWin6 vCustom6W x49  y302 w35, Win
IfInString, Custom6, !
		{
		Gui, 1:Add, Checkbox, Checked1 gNoAlt6 vCustom6A x91  y302 w30, Alt
		StringReplace, Custom6, Custom6, !, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoAlt6 vCustom6A x91  y302 w30, Alt
IfInString, Custom6, +
		{
		Gui, 1:Add, Checkbox, Checked1 gNoShift6 vCustom6S x125 y302 w40, Shift
		StringReplace, Custom6, Custom6, +, 
		}
	else
		Gui, 1:Add, Checkbox, Checked0 gNoShift6 vCustom6S x125 y302 w40, Shift	
IfInString, Custom6, ``
	StringReplace, Custom6, Custom6, ``, `` (Backtick)
IfInString, Custom6, `,
	StringReplace, Custom6, Custom6, `, , `, (Comma)
IfInString, Custom6, .
	StringReplace, Custom6, Custom6, . , . (Period)
IfInString, Custom6, `;
	StringReplace, Custom6, Custom6, `; , `; (Semicolon)
IfInString, Custom6, '
	StringReplace, Custom6, Custom6, ' , ' (Apostrophe)	
	
IfInString, Custom1, PAUSE
	Custom1 = -DISABLED-
IfInString, Custom2, PAUSE
	Custom2 = -DISABLED-
IfInString, Custom4, PAUSE
	Custom4 = -DISABLED-
IfInString, Custom5, PAUSE
	Custom5 = -DISABLED-
IfInString, Custom7, PAUSE
	Custom7 = -DISABLED-
IfInString, Custom6, PAUSE
	Custom6 = -DISABLED-
Gui, 1:Add, GroupBox, cTeal x5 y30  w290 h45, Quick Date and Initials            ; Option2, Custom1, Date and Initials
Gui, 1:Add, GroupBox, cTeal x5 y80  w290 h45, System Switch Shortcut             ; Option4, Custom2, SysSwitch
Gui, 1:Add, GroupBox, cTeal x5 y130 w290 h45, Store Extra Clipboard              ; Option6, Custom4, StoreClip
Gui, 1:Add, GroupBox, cTeal x5 y180 w290 h45, Paste Extra Clipboard              ; Option6, Custom5, PasteClip
Gui, 1:Add, GroupBox, cTeal x5 y230 w290 h45, Open Hyperlink from Excel          ; Option8, Custom7, XLHyperlink
Gui, 1:Add, GroupBox, cTeal x5 y280 w290 h45, Quick Today's Date                         ;        , Custom6, QuickDate
Gui, 1:Add, Text, cTeal x170 y30   h20, Default: Shift + CapsLock           ; Option2, Custom1, Date and Initials
Gui, 1:Add, Text, cTeal x170 y80   h20, Default: Ctrl + `` (Backtick)       ; Option4, Custom2, SysSwitch
Gui, 1:Add, Text, cTeal x170 y130  h20, Default: Ctrl + 5                    ; Option6, Custom4, StoreClip
Gui, 1:Add, Text, cTeal x170 y180  h20, Default: Ctrl + 6                    ; Option6, Custom5, PasteClip
Gui, 1:Add, Text, cTeal x170 y230  h20, Default: Ctrl + 1                    ; Option8, Custom7, XLHyperlink
Gui, 1:Add, Text, cTeal x170 y280  h20, Default: Ctrl +`; (Semicolon)                   ;        , Custom6, QuickDate
Gui, 1:Font, s10
Gui, 1:Add, DropDownList, R25 x170 y45  h23 w120 +Center gNoNum1 vCustom1,  %Custom1%||A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-
Gui, 1:Add, DropDownList, R25 x170 y95  h23 w120 +Center gNoNum2 vCustom2,  %Custom2%||A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-
Gui, 1:Add, DropDownList, R25 x170 y145 h23 w120 +Center gNoNum4 vCustom4,  %Custom4%||A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-
Gui, 1:Add, DropDownList, R25 x170 y195 h23 w120 +Center gNoNum5 vCustom5,  %Custom5%||A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-
Gui, 1:Add, DropDownList, R25 x170 y245 h22 w120 +Center gNoNum7 vCustom7,  %Custom7%||A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-
Gui, 1:Add, DropDownList, R25 x170 y295 h22 w120 +Center gNoNum6 vCustom6,  %Custom6%||A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-
Gui, 1:Font
Gui, 1:Add, Button, x30 y328 w120 h20 gResetDefaults, Reset to Defaults
Gui, 1:Add, Button, x155 y328 w120 h20 gClearAll, Clear All Keybindings
;Gui, 1:Add, Checkbox,  y355 x5 vDontClose gDontClose, Close`nDrawer?
Gui, 1: Tab, 1
Gui, 1: Font, 
;Gui, 1:Add, Text, cRed x210 y244 vCustomColor, Color:
Gui, 1:Add, ComboBox, R21 x210 y250  h18 w70 +Center vCustomColor, %CustomColor%|| |Default|Black|Silver|Gray|White|Maroon|Red|Purple|Pink|Fuchsia|Green|Lime|Olive|Yellow|Navy|Blue|Teal|Aqua|CFC2FF
Gui, 1:Add, Text, x283 y253 gColorPicker, ?
Gui, 1: Font
Gui, 1:Add, GroupBox, cGreen  x5 y295 w290 h50 +Center, Hotstrings Options (If present on Desktop.)
Gui, 1:Add, Button, gHotstringIt x10 y315 w80 h25, Start Script
Gui, 1:Add, Button, gHotstringIt2 x95 y315 w105 h25, Add New Hotstring
Gui, 1:Add, Button, gHotstringIt3 x205 y315 w85 h25, Correct Errors
Gui, 1: Tab, 3

Gui, 1:Add, Groupbox, cPurple x5 y234 w290 h66 +Center, HotCorners Shortcuts
Gui, 1:Add, Edit, +ReadOnly  Sort R1    x8 y246 w90 h16                     , Quick Settings   ;vHotCornerTL
Gui, 1:Add, ComboBox,        Sort R20   x8 y273 w90 h16  vHotCornerBL, %HotCornerBL%|| |google.com|calc.exe|iexplore.exe|Kronos|Settings Menu|Paste Clipboard|Copy Clipboard|Date and Initials|Link from Excel|System Switch|Today's Date|EFS Fill|EFS Fees Login|
Gui, 1:Add, ComboBox,        Sort R20 x201 y246 w90 h16  vHotCornerTR, %HotCornerTR%|| |google.com|calc.exe|iexplore.exe|Kronos|Settings Menu|Paste Clipboard|Copy Clipboard|Date and Initials|Link from Excel|System Switch|Today's Date|EFS Fill|EFS Fees Login|
Gui, 1:Add, ComboBox,        Sort R20 x201 y273 w90 h16  vHotCornerBR, %HotCornerBR%|| |google.com|calc.exe|iexplore.exe|Kronos|Settings Menu|Paste Clipboard|Copy Clipboard|Date and Initials|Link from Excel|System Switch|Today's Date|EFS Fill|EFS Fees Login|
Gui, 1:Add, Text, x100 y253 w98 h40 +Center, Hold Control and move mouse to far corners of screens.

Gui, 1:Font, bold
Gui, 1:Add, Button, x70 y350 w80 h30 gaOK3 , Update
Gui, 1:Add, Button, x155 y350 w80 h30 gCancel3 , Cancel
Gui, 1:Font

Gui, 1: Tab, 2
Gui, 1:Font, bold
Gui, 1:Add, Button, x70 y365 w80 h20 gaOK2 , Update
Gui, 1:Add, Button, x155 y365 w80 h20 gCancel2 , Cancel
Gui, 1:Font

Gui, 1: Tab, 4
Gui, 1:Font, bold
Gui, 1:Add, Button, x70 y350 w80 h30 gaOK3 , Update
Gui, 1:Add, Button, x155 y350 w80 h30 gCancel3 , Cancel
Gui, 1:Font

;MsgBox, ↖️   ↗️   ↘️   ↙️ 

Gui, 1: Tab, 3

Gui, 1:Add, Groupbox, cRed x5 y304 w290 h45 +Right, % "***BETA SCRIPTS (Use at your own risk!)***"
Gui, 1:Add, Button, x10 y313 w70 h32 gRunBetaScripts, I like to live dangerously.
Gui, 1:Add, Text, Center x83 y319 h15, Click here to view BETA scripts.`nInstructions for each will show once opened.


;Gui, 1: Tab, 4
;Gui, 1:Add, Text, Checked0 gCherSystemSwitch vCherSystemSwitch x281 y370, 
Gui, 1: Tab, 1
Gui, 1:Add, Button, gFixWindows x268 y274 w25 h15 +Center, FIX
Gui, 1: Show, h390 w300
SplashTextOn, 500, 225, AHK Update - 8/22/2017, AHK Update - 8/22/2017`n`nI figure you HAVE to read this now since you can't click it away. It will go away after about twenty seconds. I'll update the script to remove this in a few days.`n`nI've updated the EFS/HotCorners tab to have a new ***BETA SCRIPTS*** section. They aren't as dangerous as they sound, but haven't been extensively tested by more than a couple people. Those who have tested them seem to like them a lot.`n`nHop on over to the EFS/HotCorners tab to check them out if you have a chance, and let me know if you have questions on how to use them.
WinMove, AHK Update - 8/22/2017, , 50, 50
SetTimer, TurnOffSplash, 20000
global CherToggle = 0
return

TurnOffSplash:
SplashTextOff
SetTimer, TurnOffSplash, Off
return


RunBetaScripts:
Gui, New, , BETA Scripts
Gui, Add, Groupbox, cBlue x5 y5 w400 h80, WorkSpace Opener
Gui, Add, Button, gRunWorkSpaceOpener +Center xp+5 yp+20 w100 h50, WorkSpace Opener
Gui, Add, Text, xp+105 yp+10 w285 +Center,Highlight Client Code. Hold Windows key, then Right Click.`nMore detailed instructions are shown when script is opened.
Gui, Add, Groupbox, cBlue x5 y95 w400 h80, DoubleTap
Gui, Add, Button, gRunDoubleTap +Center xp+5 yp+20 w100 h50, DoubleTap
Gui, Add, Text, xp+105 yp+10 w285 +Center,Double-tap Control to quickly enter Today's Date.`nDouble-tap Alt to quickly enter Date and Initials.
Gui, Add, Groupbox, cBlue x5 y185 w400 h80, F-Keys Action Injector
Gui, Add, Button, Section gRunActionInjector +Center xp+5 yp+20 w100 h50, F-Keys Action Injector
Gui, Add, Text, xp+105 yp-10 w285 +Center,Remap the (mostly) useless F-Keys`nto store frequently used Action Types.`n`nHold Windows key and press F1 to customize.`nOnce customized, use F-Key to cycle between options.


Gui, Add, Groupbox, cBlue x5 y275 w400 h80, WoWbar
Gui, Add, Button, Section gRunWoWbar +Center xp+5 yp+20 w100 h50, WoWbar
Gui, Add, Text, xp+105 yp-2 w285 +Center,Programmable grid of buttons for quick access`nto frequently used Action Types.`n`nControls will be shown once script is started.
Gui, Color, ABCDEF,  BETA Scripts
Gui, Show, w410 h360
return

RunWorkSpaceOpener:
Run "H:\Docketing\AutoHotKey\Scripts\BETA Scripts\WorkSpace Opener BETA.ahk"
return

RunDoubleTap:
Run "H:\Docketing\AutoHotKey\Scripts\BETA Scripts\DoubleTap.ahk"
return

RunActionInjector:
Run "H:\Docketing\AutoHotKey\Scripts\BETA Scripts\F-Keys Action Injector.ahk"
return

RunWoWbar:
Run "H:\Docketing\AutoHotKey\Scripts\BETA Scripts\WoWbar.ahk"
return

FixWindows:
IniWrite, 0, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniWrite, 0, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
TrayTip, Window position reset., If you had an error when using Paste/Store Clipboard or Remarks Suggester`, this should now be fixed.
Sleep 5000
TrayTip
return

CherSystemSwitch:
	if CherToggle = 0
		{
		TrayTip, Activated., Activated.
		CherToggle = 1
		}
	else if CherToggle = 1
		{
		TrayTip, Deactivated., Deactivated.
		CherToggle = 0
		}
return

ColorPicker:
Run http://htmlcolorcodes.com/
return

Disable1:
GuiControlGet,  Button2Enabled, , Button2
;	If Button2Enabled = 0
;		{
;		GuiControl, 1: , Button49, 0
;		GuiControl, 1: , Button50, 0
;		GuiControl, 1: , Button51, 0
;		GuiControl, 1: , Button52, 0		
;		GuiControl, 1: , ComboBox4, |-DISABLED-||
;		}
;	If Button2Enabled = 1
;		GuiControl, 1: , ComboBox4, %Custom1%||A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-|
return

Disable2:
GuiControlGet,  Button6Enabled, , Button6
;	If Button6Enabled = 0
;		{
;		GuiControl, 1: , Button53, 0
;		GuiControl, 1: , Button54, 0
;		GuiControl, 1: , Button55, 0
;		GuiControl, 1: , Button56, 0		
;		GuiControl, 1: , ComboBox5, |-DISABLED-||
;		}
;	If Button6Enabled = 1
;		GuiControl, 1: , ComboBox5, %Custom2%||A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-|
return

Disable3:
GuiControlGet,  Button11Enabled, , Button11
;	If Button11Enabled = 0
;		{
;		GuiControl, 1: , Button57, 0
;		GuiControl, 1: , Button58, 0
;		GuiControl, 1: , Button59, 0
;		GuiControl, 1: , Button60, 0
;		GuiControl, 1: , Button61, 0
;		GuiControl, 1: , Button62, 0
;		GuiControl, 1: , Button63, 0
;		GuiControl, 1: , Button64, 0
;		GuiControl, 1: , ComboBox6, |-DISABLED-||
;		GuiControl, 1: , ComboBox7, |-DISABLED-||
;	If Button11Enabled = 1
;		GuiControl, 1: , ComboBox6, %Custom4%||A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-|
;		GuiControl, 1: , ComboBox7, %Custom5%||A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-|
;		}
return

Disable4:
GuiControlGet,  Button13Enabled, , Button13
;	If Button13Enabled = 0
;		{
;		GuiControl, 1: , Button65, 0
;		GuiControl, 1: , Button66, 0
;		GuiControl, 1: , Button67, 0
;		GuiControl, 1: , Button68, 0	
;		GuiControl, 1: , ComboBox8, |-DISABLED-||
;		}
;	If Button13Enabled = 1
;		GuiControl, 1: , ComboBox8, %Custom7%||A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-|
return


ClearAll:
GuiControl, 1: ,  Button46, 0
GuiControl, 1: ,  Button47, 0
GuiControl, 1: ,  Button48, 0
GuiControl, 1: ,  Button49, 0
GuiControl, 1: ,  Button50, 0
GuiControl, 1: ,  Button51, 0
GuiControl, 1: ,  Button52, 0
GuiControl, 1: ,  Button53, 0
GuiControl, 1: ,  Button54, 0
GuiControl, 1: ,  Button55, 0
GuiControl, 1: ,  Button56, 0
GuiControl, 1: ,  Button57, 0
GuiControl, 1: ,  Button58, 0
GuiControl, 1: ,  Button59, 0
GuiControl, 1: ,  Button60, 0
GuiControl, 1: ,  Button61, 0
GuiControl, 1: ,  Button62, 0
GuiControl, 1: ,  Button63, 0
GuiControl, 1: ,  Button64, 0
GuiControl, 1: ,  Button65, 0
GuiControl, 1: ,  Button66, 0
GuiControl, 1: ,  Button67, 0
GuiControl, 1: ,  Button68, 0
GuiControl, 1: ,  Button69, 0
GuiControl, 1: , ComboBox4, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-||
GuiControl, 1: , ComboBox5, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-||
GuiControl, 1: , ComboBox6, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-||
GuiControl, 1: , ComboBox7, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-||
GuiControl, 1: , ComboBox8, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-||
GuiControl, 1: , ComboBox9, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-||
return

ResetDefaults:
GuiControl, 1: ,  Button46, 0
GuiControl, 1: ,  Button47, 0
GuiControl, 1: ,  Button48, 0
GuiControl, 1: ,  Button49, 1
GuiControl, 1: ,  Button50, 1
GuiControl, 1: ,  Button51, 0
GuiControl, 1: ,  Button52, 0
GuiControl, 1: ,  Button53, 0
GuiControl, 1: ,  Button54, 1
GuiControl, 1: ,  Button55, 0
GuiControl, 1: ,  Button56, 0
GuiControl, 1: ,  Button57, 0
GuiControl, 1: ,  Button58, 1
GuiControl, 1: ,  Button59, 0
GuiControl, 1: ,  Button60, 0
GuiControl, 1: ,  Button61, 0
GuiControl, 1: ,  Button62, 1
GuiControl, 1: ,  Button63, 0
GuiControl, 1: ,  Button64, 0
GuiControl, 1: ,  Button65, 0
GuiControl, 1: ,  Button66, 1
GuiControl, 1: ,  Button67, 0
GuiControl, 1: ,  Button68, 0
GuiControl, 1: ,  Button69, 0
GuiControl, 1: , ComboBox4, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock||Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-|
GuiControl, 1: , ComboBox5, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)||, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-|
GuiControl, 1: , ComboBox6, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5||6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-|
GuiControl, 1: , ComboBox7, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6||7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-|
GuiControl, 1: , ComboBox8, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1||2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)|' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-|
GuiControl, 1: , ComboBox9, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpad0|-|=|[|]|/|\|`` (Backtick)|, (Comma)|. (Period)|`; (Semicolon)||' (Apostrophe)|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|Space|CapsLock|Tab|BackSpace|Enter|LButton|MButton|RButton|WheelUp|WheelDown|-DISABLED-|
return

NoCtrl1:
NoWin1:
NoAlt1:
NoNum1:
NoShift1:
GuiControlGet,  ComboBox4Text, , ComboBox4
	IfInString, ComboBox4Text, Numpad
		{
		GuiControl, 1: , Button46, 0
		GuiControl, 1: , Button48, 0
		GuiControl, 1: , Button49, 0
		}
	IfInString, ComboBox4Text, DISABLED
		{
		;GuiControl, 1: ,  Button2, 0		
		GuiControl, 1: ,  Button46, 0
		GuiControl, 1: ,  Button47, 0
		GuiControl, 1: ,  Button48, 0
		GuiControl, 1: ,  Button49, 0
		}
return

NoCtrl2:
NoWin2:
NoAlt2:
NoNum2:
NoShift2:
GuiControlGet,  ComboBox5Text, , ComboBox5
	IfInString, ComboBox5Text, Numpad
		{
		GuiControl, 1: , Button50, 0
		GuiControl, 1: , Button52, 0
		GuiControl, 1: , Button53, 0
		}
	IfInString, ComboBox5Text, DISABLED
		{
		;GuiControl, 1: ,  Button6, 0
		GuiControl, 1: ,  Button50, 0
		GuiControl, 1: ,  Button51, 0
		GuiControl, 1: ,  Button52, 0
		GuiControl, 1: ,  Button53, 0
		}
return

NoCtrl4:
NoWin4:
NoAlt4:
NoNum4:
NoShift4:
GuiControlGet,  ComboBox6Text, , ComboBox6
	IfInString, ComboBox6Text, Numpad
		{
		GuiControl, 1: , Button54, 0
		GuiControl, 1: , Button56, 0
		GuiControl, 1: , Button57, 0
		}
	IfInString, ComboBox6Text, DISABLED
		{
		;GuiControl, 1: ,  Button11, 0
		GuiControl, 1: ,  Button54, 0
		GuiControl, 1: ,  Button55, 0
		GuiControl, 1: ,  Button56, 0
		GuiControl, 1: ,  Button57, 0
		GuiControl, 1: ,  Button58, 0
		GuiControl, 1: ,  Button59, 0
		GuiControl, 1: ,  Button60, 0
		GuiControl, 1: ,  Button61, 0
		GuiControl, 1: , ComboBox6, |-DISABLED-||
		GuiControl, 1: , ComboBox7, |-DISABLED-||
		}
return

NoCtrl5:
NoWin5:
NoAlt5:
NoNum5:
NoShift5:
GuiControlGet,  ComboBox7Text, , ComboBox7
	IfInString, ComboBox7Text, Numpad
		{
		GuiControl, 1: , Button54, 0
		GuiControl, 1: , Button56, 0
		GuiControl, 1: , Button57, 0
		}
	IfInString, ComboBox7Text, DISABLED
		{
		;GuiControl, 1: ,  Button11, 0
		GuiControl, 1: ,  Button54, 0
		GuiControl, 1: ,  Button55, 0
		GuiControl, 1: ,  Button56, 0
		GuiControl, 1: ,  Button57, 0
		GuiControl, 1: ,  Button58, 0
		GuiControl, 1: ,  Button59, 0
		GuiControl, 1: ,  Button60, 0
		GuiControl, 1: ,  Button61, 0
		GuiControl, 1: , ComboBox6, |-DISABLED-||
		GuiControl, 1: , ComboBox7, |-DISABLED-||
		}
return

NoCtrl7:
NoWin7:
NoAlt7:
NoNum7:
NoShift7:
GuiControlGet,  ComboBox8Text, , ComboBox8
	IfInString, ComboBox8Text, Numpad
		{
		GuiControl, 1: , Button62, 0
		GuiControl, 1: , Button64, 0
		GuiControl, 1: , Button65, 0
		}
	IfInString, ComboBox8Text, DISABLED
		{
		;GuiControl, 1: ,  Button6, 0
		GuiControl, 1: ,  Button62, 0
		GuiControl, 1: ,  Button63, 0
		GuiControl, 1: ,  Button64, 0
		GuiControl, 1: ,  Button65, 0
		}
return

NoCtrl6:
NoWin6:
NoAlt6:
NoNum6:
NoShift6:
GuiControlGet,  ComboBox9Text, , ComboBox9
	IfInString, ComboBox9Text, Numpad
		{
		GuiControl, 1: , Button66, 0
		GuiControl, 1: , Button68, 0
		GuiControl, 1: , Button69, 0
		}
	IfInString, ComboBox9Text, DISABLED
		{
		GuiControl, 1: ,  Button66, 0
		GuiControl, 1: ,  Button67, 0
		GuiControl, 1: ,  Button68, 0
		GuiControl, 1: ,  Button69, 0
		}
return

SidebarPos:
Gui, 7:Destroy
Gui, 7:New, +Owner +AlwaysOnTop, SidebarPosition
Gui, 7:Add, Button, x0 y0 w3 h1040, 
Gui, 7:+ToolWindow -Caption 
Gui, 7:Color, 000111                           ; can be any colour but it's good to use a color that is NOT present in ur GUI
Gui, 7:Show, X%SettingsX% Y%SettingsY% h25 , SidebarPosition
WinSet, Transcolor, 000111, SidebarPosition
Gui, 7:Show, x%SidebarX% y20 w5 h1060
return

UpDownButton:
Gui, 49:Destroy
Gui, 49:New, +Owner +AlwaysOnTop, SettingsPosition
Gui, 49:Add, Button, x0 y0 h20, Test Position  
Gui, 49:+ToolWindow -Caption 
Gui, 49:Color, 000111                           ; can be any colour but it's good to use a color that is NOT present in ur GUI
Gui, 49:Show, X%SettingsX% Y%SettingsY% h25 , SettingsPosition
WinSet, Transcolor, 000111, SettingsPosition
Gui, 49:Show
return

UpDownButton2:
Gui, 49:Destroy
Gui, 49:New, +Owner +AlwaysOnTop, SettingsPosition
Gui, 49:Add, Button, x0 y0 h25, Test Position  
Gui, 49:+ToolWindow -Caption 
Gui, 49:Color, 000111                           ; can be any colour but it's good to use a color that is NOT present in ur GUI
Gui, 49:Show, X%SettingsX% Y%SettingsY% h25 , SettingsPosition
WinSet, Transcolor, 000111, SettingsPosition
Gui, 49:Show
return

HotstringIt:
	IfExist, C:\Users\%Computername%\Desktop\Hotstrings.ahk
		{
		Run "C:\Users\%Computername%\Desktop\Hotstrings.ahk"
		return
		}
	else
		MsgBox, 4, Hotstrings.ahk not on Desktop,Hotstrings.ahk is not present on Desktop.`n`nWould you like to me to move it there for you?
			ifMsgBox Yes
				{
				FileCopy, H:\Docketing\AutoHotKey\Scripts\Personal Scripts. Save to Desktop. DO NOT RUN FROM HERE!\Hotstrings.ahk, C:\Users\%Computername%\Desktop\
				Sleep 200
					IfExist, C:\Users\%Computername%\Desktop\Hotstrings.ahk
						MsgBox, ,Hotstrings.ahk copied to Desktop,OK! You should have Hotstrings.ahk on your desktop now.`n`nClick the Run Script button again to start it.
					else
						MsgBox, ,Something went wrong... :(, I think something went wrong. I don't think it worked.`n`nDo you have the H: drive mapped?`n`nTry again, or add the Hotstrings.ahk script directly to your desktop.
				return
				}
			ifMsgBox No
				{
				MsgBox, ,Nothing copied to Desktop.,No worries. You can try out the Hotstrings function later.
				return
				}
return 
				
HotstringIt2:
DetectHiddenWindows, On
SetTitleMatchMode, 2
	IfWinNotExist, C:\Users\%Computername%\Desktop\Hotstrings.ahk
		{
		Run "C:\Users\%Computername%\Desktop\Hotstrings.ahk"
		Sleep 1000
		SendInput ^{=}
		return
		}
	IfWinExist, C:\Users\%Computername%\Desktop\Hotstrings.ahk
		{
		SendInput ^{=}
		return
		}
	else
		MsgBox, 4, Hotstrings.ahk not on Desktop,Hotstrings.ahk is not present on Desktop.`n`nWould you like to me to move it there for you?
		ifMsgBox Yes
			{
			FileCopy, H:\Docketing\AutoHotKey\Scripts\Personal Scripts. Save to Desktop. DO NOT RUN FROM HERE!\Hotstrings.ahk, C:\Users\%Computername%\Desktop\
			Sleep 200
				IfExist, C:\Users\%Computername%\Desktop\Hotstrings.ahk
					MsgBox, ,Hotstrings.ahk copied to Desktop,OK! You should have Hotstrings.ahk on your desktop now.`n`nClick the Run Script button again to start it.
				else
					MsgBox, ,Something went wrong... :(, I think something went wrong. I don't think it worked.`n`nDo you have the H: drive mapped?`n`nTry again, or add the Hotstrings.ahk script directly to your desktop.
			return
			}
		ifMsgBox No
				{
				MsgBox, ,Nothing copied to Desktop.,No worries. You can try out the Hotstrings function later.
				return
				}
return

HotstringIt3:
	IfExist, C:\Users\%Computername%\Desktop\Hotstrings.ahk
		{
		MsgBox, OK, let's open the file so you can fix any mistakes.
		Run, C:\Windows\Notepad.exe "C:\Users\%Computername%\Desktop\Hotstrings.ahk"
		Sleep 200
		SendInput ^{End} ; Takes the user to the bottom of the document.
		return
		}
	else
		MsgBox, 4, Hotstrings.ahk not on Desktop,Hotstrings.ahk is not present on Desktop.`n`nWould you like to me to move it there for you?
		ifMsgBox Yes
			{
			FileCopy, H:\Docketing\AutoHotKey\Scripts\Personal Scripts. Save to Desktop. DO NOT RUN FROM HERE!\Hotstrings.ahk, C:\Users\%Computername%\Desktop\
			Sleep 200
				IfExist, C:\Users\%Computername%\Desktop\Hotstrings.ahk
					MsgBox, ,Hotstrings.ahk copied to Desktop,OK! You should have Hotstrings.ahk on your desktop now.`n`nClick the Run Script button again to start it.
				else
					MsgBox, ,Something went wrong... :(, I think something went wrong. I don't think it worked.`n`nDo you have the H: drive mapped?`n`nTry again, or add the Hotstrings.ahk script directly to your desktop.
			return
			}
		ifMsgBox No
				{
				MsgBox, ,Nothing copied to Desktop.,No worries. You can try out the Hotstrings function later.
				return
				}
return

MapIt2:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
gosub CloseDrawer
return

Example1:
PicSwitch = 0
;H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\QuickDate1.png ;location of gif you want to show
Gui, 14: New, AlwaysOnTop Owner, Examples
Gui, 14: Add, Picture,w603 h335, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\QuickDateAndName1.png ;location of gif you want to show
Gui, 14: Add, Button, x0 y0 w40 h20 gNextPic1, 1 of 2
Gui, 14: Show , w603 h335
return

NextPic1:
	if PicSwitch = 0
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w599 h337
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\QuickDateAndName2.png
		GuiControl, 14: , Button1, 2 of 2
		PicSwitch = 1
		Gui, 14: Show , w599 h337
		return
		}
	if PicSwitch = 1
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w603 h335
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\QuickDateAndName1.png
		GuiControl, 14: , Button1, 1 of 2
		PicSwitch = 0
		Gui, 14: Show , w603 h335
		return
		}
return

Example2:
PicSwitch = 0
;H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\QuickDate1.png ;location of gif you want to show
Gui, 14: New, AlwaysOnTop Owner, Examples
Gui, 14: Add, Button, x0 y0 w40 h20 gNextPic2, 1 of 2
;Gui, 14: Add, Picture, w600 h-1, C:\Users\tyler.dickson\Desktop\bunny1.gif ;location of gif you want to show
Gui, 14: Add, Picture, w542 h315, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\SystemSwitch1.png ;location of gif you want to show
Gui, 14: Show ,w542 h315
return

NextPic2:
	if PicSwitch = 0
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w552 h317
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\SystemSwitch2.png
		GuiControl, 14: , Button1, 2 of 2
		PicSwitch = 1
		Gui, 14: Show , w552 h317
		return
		}
	if PicSwitch = 1
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w542 h315
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\SystemSwitch1.png
		GuiControl, 14: , Button1, 1 of 2
		PicSwitch = 0
		Gui, 14: Show , w542 h315
		return
		}
return

Example3:
PicSwitch = 0
;H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\QuickDate1.png ;location of gif you want to show
Gui, 14: New, AlwaysOnTop Owner, Examples
Gui, 14: Add, Button, x0 y0 w40 h20 gNextPic3, 1 of 4
Gui, 14: Add, Picture, w788 h317, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\SettingsBar1.png ;location of gif you want to show
Gui, 14: Show , w788 h317
return

NextPic3:
	if PicSwitch = 0
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w788 h318
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\SettingsBar2.png
		GuiControl, 14: , Button1, 2 of 4
		PicSwitch = 1
		Gui, 14: Show , w788 h318
		return
		}
	if PicSwitch = 1
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w440 h434
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\SettingsBar3.png
		GuiControl, 14: , Button1, 3 of 4
		PicSwitch = 2
		Gui, 14: Show , w440 h434
		return
		}
	if PicSwitch = 2
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w455 h437
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\SettingsBar4.png
		GuiControl, 14: , Button1, 4 of 4
		PicSwitch = 3
		Gui, 14: Show , w455 h437
		return
		}
	if PicSwitch = 3
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w788 h317
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\SettingsBar1.png
		GuiControl, 14: , Button1, 1 of 4
		PicSwitch = 0
		Gui, 14: Show , w788 h317
		return
		}		
return

Example4:
PicSwitch = 0
;H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\QuickDate1.png ;location of gif you want to show
Gui, 14: New, AlwaysOnTop Owner, Examples
Gui, 14: Add, Button, x0 y0 w40 h20 gNextPic4, 1 of 4
Gui, 14: Add, Picture, w586 h350, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\CopyClipboard1.png ;location of gif you want to show
Gui, 14: Show ,w586 h350
return

NextPic4:
	if PicSwitch = 0
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w591 h399
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\CopyClipboard2.png
		GuiControl, 14: , Button1, 2 of 4
		PicSwitch = 1
		Gui, 14: Show , w591 h399
		return
		}
	if PicSwitch = 1
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w586 h419
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\CopyClipboard3.png
		GuiControl, 14: , Button1, 3 of 4
		PicSwitch = 2
		Gui, 14: Show , w586 h419
		return
		}
	if PicSwitch = 2
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w593 h400
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\CopyClipboard4.png
		GuiControl, 14: , Button1, 4 of 4
		PicSwitch = 3
		Gui, 14: Show , w593 h400
		return
		}
	if PicSwitch = 3
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w586 h350
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\CopyClipboard1.png
		GuiControl, 14: , Button1, 1 of 4
		PicSwitch = 0
		Gui, 14: Show , w586 h350
		return
		}		
return

Example5:
PicSwitch = 0
;H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\QuickDate1.png ;location of gif you want to show
Gui, 14: New, AlwaysOnTop Owner, Examples
Gui, 14: Add, Button, x0 y0 w40 h20 gNextPic5, 1 of 2
Gui, 14: Add, Picture, w550 h301, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\ExcelHyperlink1.png ;location of gif you want to show
Gui, 14: Show ,w550 h301
return

NextPic5:
	if PicSwitch = 0
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w374 h248
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\ExcelHyperlink2.png
		GuiControl, 14: , Button1, 2 of 2
		PicSwitch = 1
		Gui, 14: Show , w374 h248
		return
		}
	if PicSwitch = 1
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w550 h301
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\ExcelHyperlink1.png
		GuiControl, 14: , Button1, 1 of 2
		PicSwitch = 0
		Gui, 14: Show , w550 h301
		return
		}
return

Example6:
PicSwitch = 0
;H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\QuickDate1.png ;location of gif you want to show
Gui, 14: New, AlwaysOnTop Owner, Examples
Gui, 14: Add, Button, x0 y0 w60 h20 gNextPic6, 1 of 11
Gui, 14: Add, Picture, w660 h304, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\Multiuse1.png ;location of gif you want to show
Gui, 14: Show ,w660 h304
return

NextPic6:
	if PicSwitch = 0
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w657 h371
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\Multiuse2.png
		GuiControl, 14: , Button1, 2 of 11
		PicSwitch = 1
		Gui, 14: Show , w657 h371
		return
		}
	if PicSwitch = 1
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w648 h343
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\Multiuse3.png
		GuiControl, 14: , Button1, 3 of 11
		PicSwitch = 2
		Gui, 14: Show , w648 h343
		return
		}
	if PicSwitch = 2
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w647 h382
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\Multiuse4.png
		GuiControl, 14: , Button1, 4 of 11
		PicSwitch = 3
		Gui, 14: Show , w647 h382
		return
		}
	if PicSwitch = 3
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w848 h267
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\Multiuse5.png
		GuiControl, 14: , Button1, 5 of 11
		PicSwitch = 4
		Gui, 14: Show , w848 h267
		return
		}
	if PicSwitch = 4
		{
		Gui, 14: Hide ,
		GuiControl, 14: Move , Static1, w699 h266
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\Multiuse6.png
		GuiControl, 14: , Button1, 6 of 11
		PicSwitch = 5
		Gui, 14: Show , w699 h266
		return
		}
	if PicSwitch = 5
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w501 h343
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\Multiuse7.png
		GuiControl, 14: , Button1, 7 of 11
		PicSwitch = 6
		Gui, 14: Show , w501 h343
		return
		}
	if PicSwitch = 6
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w712 h299
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\Multiuse8.png
		GuiControl, 14: , Button1, 8 of 11
		PicSwitch = 7
		Gui, 14: Show , w712 h299
		return
		}
	if PicSwitch = 7
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w712 h258
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\Multiuse9.png
		GuiControl, 14: , Button1, 9 of 11
		PicSwitch = 8
		Gui, 14: Show , w712 h258
		return
		}
	if PicSwitch = 8
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w712 h258
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\Multiuse10.png
		GuiControl, 14: , Button1, 10 of 11
		PicSwitch = 9
		Gui, 14: Show , w712 h258
		return
		}
	if PicSwitch = 9
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w662 h275
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\Multiuse11.png
		GuiControl, 14: , Button1, 11 of 11
		PicSwitch = 10
		Gui, 14: Show , w662 h275
		return
		}
	if PicSwitch = 10
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w660 h304
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\Multiuse1.png
		GuiControl, 14: , Button1, 1 of 11
		PicSwitch = 0
		Gui, 14: Show , w660 h304
		return
		}		
return		
		
		
Example7:
PicSwitch = 0
;H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\QuickDate1.png ;location of gif you want to show
Gui, 14: New, AlwaysOnTop Owner, Examples
Gui, 14: Add, Button, x0 y0 w40 h20 gNextPic7, 1 of 3
Gui, 14: Add, Picture, w522 h388, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\EFS1.png ;location of gif you want to show
Gui, 14: Show ,w522 h388
return

NextPic7:
	if PicSwitch = 0
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w628 h558
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\EFS2.png
		GuiControl, 14: , Button1, 2 of 3
		PicSwitch = 1
		Gui, 14: Show , w628 h558
		return
		}
	if PicSwitch = 1
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w560 h400
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\EFS3.png
		GuiControl, 14: , Button1, 3 of 3
		PicSwitch = 2
		Gui, 14: Show , w560 h400
		return
		}
	if PicSwitch = 2
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w522 h388
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\EFS1.png
		GuiControl, 14: , Button1, 1 of 3
		PicSwitch = 0
		Gui, 14: Show , w522 h388
		return
		}	
	
return

Example8:
PicSwitch = 0
;H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\QuickDate1.png ;location of gif you want to show
Gui, 14: New, AlwaysOnTop Owner, Examples
Gui, 14: Add, Button, x0 y0 w40 h20 gNextPic8, 1 of 2
Gui, 14: Add, Picture, w601 h420, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\SideBar1.png ;location of gif you want to show
Gui, 14: Show ,w601 h420
return

NextPic8:
	if PicSwitch = 0
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w475 h484
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\SideBar2.png
		GuiControl, 14: , Button1, 2 of 2
		PicSwitch = 1
		Gui, 14: Show , w475 h484
		return
		}
	if PicSwitch = 1
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w601 h420
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\SideBar1.png
		GuiControl, 14: , Button1, 1 of 2
		PicSwitch = 0
		Gui, 14: Show , w601 h420
		return
		}
return

Example9:
PicSwitch = 0
;H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\QuickDate1.png ;location of gif you want to show
Gui, 14: New, AlwaysOnTop Owner, Examples
Gui, 14: Add, Button, x0 y0 w40 h20 gNextPic9, 1 of 2
Gui, 14: Add, Picture, w221 h275, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\Hotstring1.png ;location of gif you want to show
Gui, 14: Show ,w221 h275
return

NextPic9:
	if PicSwitch = 0
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w325 h438
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\Hotstring2.png
		GuiControl, 14: , Button1, 2 of 2
		PicSwitch = 1
		Gui, 14: Show , w325 h438
		return
		}
	if PicSwitch = 1
		{
		Gui, 14: Hide , 
		GuiControl, 14: Move , Static1, w221 h275
		GuiControl, 14: , Static1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\Hotstring1.png
		GuiControl, 14: , Button1, 1 of 2
		PicSwitch = 0
		Gui, 14: Show , w221 h275
		return
		}
return


OpenHelp:
FileCopy, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HTML\AHK Instructions.html, C:\Users\%ComputerName%\AHK Instructions.html, 1
Sleep 2000
Run "C:\Users\%ComputerName%\AHK Instructions.html"
return


SideBar:
if CustomSideBar = Kronos
	{
	Gui, 50:Hide
	Run http://oc-kronos/wfc/applications/wtk/html/ess/logon.jsp
	Gui, 50:Show
	return
	}
if CustomSideBar = Settings Menu
	{
	Gui, 50:Hide
	gosub Reopen
	Gui, 50:Show
	return
	}
if CustomSideBar = Paste Clipboards
	{
	Gui, 50:Hide
	gosub PasteClipboards
	Gui, 50:Show
	return
	}
if CustomSideBar = Copy Clipboards
	{
	Gui, 50:Hide
	StoreClipboard()
	Gui, 50:Show
	return
	}	
if CustomSideBar = Quick Date and Initials
	{
	Gui, 50:Hide
	DateAndName()
	Gui, 50:Show
	return
	}
if CustomSideBar = Hyperlink from Excel
	{
	Gui, 50:Hide
	gosub HyperlinkFromExcel
	Gui, 50:Show
	return
	}
if CustomSideBar = System Switch
	{
	Gui, 50:Hide
	SwitchSystem()
	Gui, 50:Show
	return
	}	
if CustomSideBar = Quick Today's Date
	{
	Gui, 50:Hide
	QuickDate()
	Gui, 50:Show
	return
	}
else
	{
	Gui, 50:Hide	
	Run % CustomSideBar
	Gui, 50:Show
	return
	}
return

NoRemarks1:
GuiControlGet, StatusButton18, , Option3
GuiControlGet, StatusButton19, , Option1
if StatusButton18 = 0
	GuiControl, 1: , Button19, 0
return

NoRemarks2:
GuiControlGet, StatusButton18, , Option3
GuiControlGet, StatusButton19, , Option1
if StatusButton18 = 0
	GuiControl, 1: , Button19, 0
return

ClearA:
GuiControl, 1: , Button31, 1
GuiControl, 1: , Button32, 0
GuiControl, 1: , Button33, 0
return

ClearB:
GuiControl, 1: , Button31, 1
GuiControl, 1: , Button32, 0
GuiControl, 1: , Button33, 0
return

ClearC:
GuiControl, 1: , Button31, 1
GuiControl, 1: , Button32, 0
GuiControl, 1: , Button33, 0
return

ClearD:
GuiControl, 1: , Button31, 1
GuiControl, 1: , Button32, 0
GuiControl, 1: , Button33, 0
return

ClearE:
GuiControl, 1: , Button31, 1
GuiControl, 1: , Button32, 0
GuiControl, 1: , Button33, 0
return

ClearF:
GuiControl, 1: , Button31, 1
GuiControl, 1: , Button32, 0
GuiControl, 1: , Button33, 0
return

Clear1:
GuiControl, 1: , Button24, 0
GuiControl, 1: , Button25, 0
GuiControl, 1: , Button26, 0
GuiControl, 1: , Button27, 0
GuiControl, 1: , Button28, 0
GuiControl, 1: , Button29, 0
return

Clear2:
GuiControl, 1: , Button24, 0
GuiControl, 1: , Button25, 0
GuiControl, 1: , Button26, 0
GuiControl, 1: , Button27, 0
GuiControl, 1: , Button28, 0
GuiControl, 1: , Button29, 0
return

aOK4:
aOK3:
aOK2:
aOK:
Gui, 1:Submit
Gui, 1:Destroy
Gui, 7:Destroy
Gui, 49:Destroy
;MsgBox, %Option1%%Option2%%Option3%%Option4%%Option5%%Option6%%Option7%%Option8%
Option9 = 0
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%,%Option9%
RecordBoxes = %RecordBox1%,%RecordBox2%,%RecordBox3%,%RecordBox4%,%RecordBox5%,%RecordBox6%
RadioChoice = %RadioChoice1%,%RadioChoice2%,%RadioChoice3%
IniWrite, %Username%, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniWrite, %ATPartner%, C:\Users\%Computername%\AHKPrefs.ini, Username, ATPartner
IniWrite, %ATDate%, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
IniWrite, %Checkboxes%, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes
IniWrite, %RecordBoxes%, C:\Users\%Computername%\AHKPrefs.ini, Username, RecordBoxes
IfInString, Custom1, Backtick
	StringReplace, Custom1, Custom1, `` (Backtick), `` 
IfInString, Custom1, Comma
	StringReplace, Custom1, Custom1, `, (Comma), `,
IfInString, Custom1, Period
	StringReplace, Custom1, Custom1, . (Period), .
IfInString, Custom1, Semicolon
	StringReplace, Custom1, Custom1, `; (Semicolon), `;	
IfInString, Custom1, Apostrophe
	StringReplace, Custom1, Custom1, ' (Apostrophe), '	
	if Custom1C = 1
		Custom1 = ^%Custom1%
	if Custom1W = 1
		Custom1 = #%Custom1%
	if Custom1A = 1
		Custom1 = !%Custom1%
	if Custom1S = 1
		Custom1 = +%Custom1%
IfInString, Custom2, Backtick
	StringReplace, Custom2, Custom2, `` (Backtick), `` 
IfInString, Custom2, Comma
	StringReplace, Custom2, Custom2, `, (Comma), `,
IfInString, Custom2, Period
	StringReplace, Custom2, Custom2, . (Period), .
IfInString, Custom2, Semicolon
	StringReplace, Custom2, Custom2, `; (Semicolon), `;	
IfInString, Custom2, Apostrophe
	StringReplace, Custom2, Custom2, ' (Apostrophe), '	
	if Custom2C = 1
		Custom2 = ^%Custom2%
	if Custom2W = 1
		Custom2 = #%Custom2%
	if Custom2A = 1
		Custom2 = !%Custom2%
	if Custom2S = 1
		Custom2 = +%Custom2%		
IfInString, Custom4, Backtick
	StringReplace, Custom4, Custom4, `` (Backtick), `` 
IfInString, Custom4, Comma
	StringReplace, Custom4, Custom4, `, (Comma), `,
IfInString, Custom4, Period
	StringReplace, Custom4, Custom4, . (Period), .
IfInString, Custom4, Semicolon
	StringReplace, Custom4, Custom4, `; (Semicolon), `;	
IfInString, Custom4, Apostrophe
	StringReplace, Custom4, Custom4, ' (Apostrophe), '	
	if Custom4C = 1
		Custom4 = ^%Custom4%
	if Custom4W = 1
		Custom4 = #%Custom4%
	if Custom4A = 1
		Custom4 = !%Custom4%
	if Custom4S = 1
		Custom4 = +%Custom4%		
IfInString, Custom5, Backtick
	StringReplace, Custom5, Custom5, `` (Backtick), `` 
IfInString, Custom5, Comma
	StringReplace, Custom5, Custom5, `, (Comma), `,
IfInString, Custom5, Period
	StringReplace, Custom5, Custom5, . (Period), .
IfInString, Custom5, Semicolon
	StringReplace, Custom5, Custom5, `; (Semicolon), `;	
IfInString, Custom5, Apostrophe
	StringReplace, Custom5, Custom5, ' (Apostrophe), '	
	if Custom5C = 1
		Custom5 = ^%Custom5%
	if Custom5W = 1
		Custom5 = #%Custom5%
	if Custom5A = 1
		Custom5 = !%Custom5%
	if Custom5S = 1
		Custom5 = +%Custom5%			
IfInString, Custom7, Backtick
	StringReplace, Custom7, Custom7, `` (Backtick), `` 
IfInString, Custom7, Comma
	StringReplace, Custom7, Custom7, `, (Comma), `,
IfInString, Custom7, Period
	StringReplace, Custom7, Custom7, . (Period), .
IfInString, Custom7, Semicolon
	StringReplace, Custom7, Custom7, `; (Semicolon), `;	
IfInString, Custom7, Apostrophe
	StringReplace, Custom7, Custom7, ' (Apostrophe), '	
	if Custom7C = 1
		Custom7 = ^%Custom7%
	if Custom7W = 1
		Custom7 = #%Custom7%
	if Custom7A = 1
		Custom7 = !%Custom7%
	if Custom7S = 1
		Custom7 = +%Custom7%
IfInString, Custom6, Backtick
	StringReplace, Custom6, Custom6, `` (Backtick), `` 
IfInString, Custom6, Comma
	StringReplace, Custom6, Custom6, `, (Comma), `,
IfInString, Custom6, Period
	StringReplace, Custom6, Custom6, . (Period), .
IfInString, Custom6, Semicolon
	StringReplace, Custom6, Custom6, `; (Semicolon), `;	
IfInString, Custom6, Apostrophe
	StringReplace, Custom6, Custom6, ' (Apostrophe), '	
	if Custom6C = 1
		Custom6 = ^%Custom6%
	if Custom6W = 1
		Custom6 = #%Custom6%
	if Custom6A = 1
		Custom6 = !%Custom6%
	if Custom6S = 1
		Custom6 = +%Custom6%		
	
IfInString, Custom1, -DISABLED-
	StringReplace, Custom1, Custom1, -DISABLED-, PAUSE		
IfInString, Custom2, -DISABLED-
	StringReplace, Custom2, Custom2, -DISABLED-, PAUSE	
IfInString, Custom4, -DISABLED-
	StringReplace, Custom4, Custom4, -DISABLED-, PAUSE	
IfInString, Custom5, -DISABLED-
	StringReplace, Custom5, Custom5, -DISABLED-, PAUSE	
IfInString, Custom7, -DISABLED-
	StringReplace, Custom7, Custom7, -DISABLED-, PAUSE	
IfInString, Custom6, -DISABLED-
	StringReplace, Custom6, Custom6, -DISABLED-, PAUSE		
IniWrite, %Custom1%, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom1
IniWrite, %Custom2%, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom2
IniWrite, %Custom4%, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom4
IniWrite, %Custom5%, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom5
IniWrite, %Custom6%, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom6
IniWrite, %Custom7%, C:\Users\%Computername%\AHKPrefs.ini, Custom, Custom7
IniWrite, %CustomSideBar%, C:\Users\%Computername%\AHKPrefs.ini, Custom, CustomSideBar
IniWrite, %HotCornerBL%, C:\Users\%Computername%\AHKPrefs.ini, Hotcorner, HotCornerBL
IniWrite, %HotCornerTR%, C:\Users\%Computername%\AHKPrefs.ini, Hotcorner, HotCornerTR
IniWrite, %HotCornerBR%, C:\Users\%Computername%\AHKPrefs.ini, Hotcorner, HotCornerBR
IniWrite, %EFSFirst%,C:\Users\%Computername%\AHKPrefs.ini, Username, EFSFirst
IniWrite, %EFSLast%, C:\Users\%Computername%\AHKPrefs.ini, Username, EFSLast
IniWrite, %EFSEmail%,C:\Users\%Computername%\AHKPrefs.ini, Username, EFSEmail
IniWrite, %RadioChoice%,C:\Users\%Computername%\AHKPrefs.ini, Username, Radio
IniWrite, %EFSPayEmail%,    C:\Users\%Computername%\AHKPrefs.ini, Username, EFSPayEmail
IniWrite, %EFSPayPassword%, C:\Users\%Computername%\AHKPrefs.ini, Username, EFSPayPassword
IniWrite, %QuickRecordOpener%, C:\Users\%Computername%\AHKPrefs.ini, Username, QuickRecordOpener
IniWrite, %SettingsX%, C:\Users\%Computername%\AHKPrefs.ini, Username, SettingsX
IniWrite, %SettingsY%, C:\Users\%Computername%\AHKPrefs.ini, Username, SettingsY
IniWrite, %SidebarX%, C:\Users\%Computername%\AHKPrefs.ini, Username, SidebarX
IniRead, SettingsX, C:\Users\%Computername%\AHKPrefs.ini, Username, SettingsX
IniRead, SettingsY, C:\Users\%Computername%\AHKPrefs.ini, Username, SettingsY
IniRead, SidebarX, C:\Users\%Computername%\AHKPrefs.ini, Username, SidebarX
IniWrite, %A_Now%`n, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, %Computername%, LastUpdated
IniWrite, v.8.22.2017, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Version, Version
if CustomColor = Pink
	CustomColor = FF69B4
IniWrite, %CustomColor%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowColor
Gui, 8:Destroy    ; change to 1.23.2017 when released
Gui, 9:Destroy
Gui, 10:Destroy
Gui, 11:Destroy
		Hotkey, %Custom1%,  Custom1,  Off
		Hotkey, %Custom2%,  Custom2,  Off
		Hotkey, %Custom3%,  Custom3,  Off
		Hotkey, %Custom4%,  Custom4,  Off
		Hotkey, %Custom5%,  Custom5,  Off	
		Hotkey, %Custom6%,  Custom6,  Off		
		Hotkey, %Custom7%,  Custom7,  Off
		Hotkey, %Custom10%, Custom10, Off
		Hotkey, %Custom11%, Custom11, Off
if Option2 = 1
	Hotkey, %Custom1%, Custom1, On
if Option3 = 1
	Hotkey, %Custom3%, Custom3, On
if Option4 = 1
	Hotkey, %Custom2%, Custom2, On
if Option5 = 1
	PersistentBar()
if Option6 = 1
	{
	Hotkey, %Custom4%, Custom4, On
	Hotkey, %Custom5%, Custom5, On
	}
if Option8 = 1
	Hotkey, %Custom7%, Custom7, On
if Option9 = 1
	OpenSideBar()
if Option9 = 0
	Gui, 50: Destroy	
if QuickRecordOpener = Alt+RightClick / Alt+LeftClick
	{
	Custom10 = !LButton
	Custom11 = !RButton
	Hotkey, %Custom10%, Custom10, On
	Hotkey, %Custom11%, Custom11, On
	}
else if QuickRecordOpener = Alt+LeftClick / Alt+RightClick
	{
	Custom10 = !RButton
	Custom11 = !LButton
	Hotkey, %Custom10%, Custom10, On
	Hotkey, %Custom11%, Custom11, On
	}
Hotkey, %Custom6%,  Custom6,  On	
;if Option7 = 1
;	{
;	gosub EFSDrawer
;	}
;if Option7 = 0
;	{
;	Gui, 20: Destroy
;	}
gosub SettingsDrawer
SetTimer, CloseWindow, 100
SetTimer, UpdateReady, 3600000
;SetTimer, UpdateReady, 5000
return

UpdateReady:
IniRead, Version, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Version, Version
IniRead, NewestVersion, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Update\Update.ini, Update, UpdateReady
	if (Version = NewestVersion)
		return
	else
		MsgBox, 515, Update Available!, Updates have been made to the script.`n`nYour Version:`t%Version%`nNewest Version:`t%NewestVersion%`n`nClick Yes to restart now, or click No to postpone until later.`n`nIf you postpone, you'll be reminded in an hour.
			{
			ifMsgBox Yes
				{
				Run "H:\Docketing\AutoHotKey\Scripts\Scripts.ahk"
				Sleep 2000
				MsgBox, Unable to restart script. Please restart manually.
				return
				}
			ifMsgBox No
				return
			ifMsgBox Cancel
				goto UpdateReady			
			}
return

CloseWindow:
IfWinExist, Message from webpage, Record has successfully been saved.                ;  ahk_class #32770                   ;Message from webpage
	WinClose, Message from webpage, Record has successfully been saved.
IfWinExist, Message from webpage, The specified search criteria did not match any records.               ;  ahk_class #32770                   ;Message from webpage
	WinClose, Message from webpage, The specified search criteria did not match any records.
IfWinActive, Opening Mail Attachment, You should only open attachments from a trustworthy source.                ;  ahk_class #32770                   ;Message from webpage
	ControlSend,  , {Alt down}O{Alt up}, Opening Mail Attachment
IfWinActive, WorkSite, The version of this document                
	ControlSend,  , {Alt down}Y{Alt up}, WorkSite
IfWinActive, Microsoft Excel Security Notice
	ControlSend,  , {Alt down}Y{Alt up}, Microsoft Excel Security Notice
return

;PopEFSButton:
;SplashTextOn, 725, , This is automatically in the top-left corner now. Click Update`, then hold Control and move your mouse to top-left corner of the screen.
;Sleep 3500	
;SplashTextOff
;return

SettingsDrawer:
PosFound = 0
IniRead, CustomColor, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowColor
Gui, 20: Destroy
Gui, 20: New, Owner AlwaysOnTop , Drawer
;Gui, 20: Add, Picture, x0 y0 w%ScreenWidthFivePercent%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\top-left.png ;location of gif you want to show
;Gui, 20: Add, Picture, x0 y0 w%ScreenWidthFivePercent%, top-left.png ;location of gif you want to show
Gui, 20: Add, Text, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% +Center , --------------------------
Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gdSettings, Settings
Gui, 20: Add, Text, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% +Center , --------------------------
Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gCalculator, Open Calculator
Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gGoogle, Open Google
Gui, 20: Add, Text, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% +Center , --------------------------
Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gPCT220, Open PCT 220 Date Generator
Gui, 20: Add, Text, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% +Center , --------------------------
;if Option1 = 1
;if Option2 = 1
;if Option3 = 1

/*
if Option4 = 1
	Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gSystemSwitch, Switch System
;if Option5 = 1
if Option6 = 1
	{
	Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gSuperCopy, Copy++
	Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gSuperPaste, Paste++
	}
if Option8 = 1
	Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gSuperExcel, Excel Hyperlink
;if Option9 = 1
Gui, 20: Add, Text, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% +Center , --------------------------
if Option7 = 1
	{
	Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gMapIt2, Run MapIt!
	Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gFillEFS, Open EFS Options
	Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gEFSPayLogIn, Log into EFS Fees
	}
*/

if Option7 = 1
	{
	Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gMapIt2, Run MapIt!
	Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gFillEFS, Fill EFS Info
	Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gEFSPayLogIn, Log into EFS Fees
	}
Gui, 20: +ToolWindow -Caption
Gui, 20: Color, %CustomColor%
;Gui, 20: Show, x0 y0 w%ScreenWidthFivePercent% ; h510
;Gui, 20: Show, x%ScreenWidthMinusFivePercent% y0 w%ScreenWidthFivePercent% ; h510
SetTimer, OpenTLDrawer, 200
SetTimer, HotCornerBL, 200
SetTimer, HotCornerTR, 200
SetTimer, HotCornerBR, 200
return

OpenTLDrawer:
CoordMode, Mouse, Screen
MouseGetPos,X, Y
GetKeyState, IsCtrlDown, Control
	if (X < 5 &&  Y < 5 && PosFound = 0 && IsCtrlDown = "D")
		{
		PosFound = 1
		DetectHiddenWindows, on
		WinSet, Transparent, 0, Drawer
				Sleep 35
		Gui, 20: Show, x0 y0 w%ScreenWidthFivePercent% ; h510
		WinSet, Transparent, 51, Drawer
				Sleep 35
		WinSet, Transparent, 102, Drawer
				Sleep 35
		WinSet, Transparent, 153, Drawer
				Sleep 35
		WinSet, Transparent, 204, Drawer
				Sleep 35				
		WinSet, Transparent, 255, Drawer
		Sleep 1000
		}
	else if (X < 5 && Y < 5 && PosFound = 1 && IsCtrlDown = "D")
		{
		gosub CloseDrawer
		}
return

CloseDrawer:
		PosFound = 0
		SetTimer, OpenTLDrawer, On
		WinSet, Transparent, 204, Drawer
				Sleep 35
		WinSet, Transparent, 153, Drawer
				Sleep 35
		WinSet, Transparent, 102, Drawer
				Sleep 35
		WinSet, Transparent, 51, Drawer
				Sleep 35				
		WinSet, Transparent, 25, Drawer
		Gui, 20: Hide
		Sleep 1000
return

HotCornerBL:
CoordMode, Mouse, Screen
MouseGetPos,X, Y
GetKeyState, IsCtrlDown, Control
	if (X < 5 &&  Y > ScreenHeightMinus5 && PosFound = 0 && IsCtrlDown = "D")
		{
		PosFound = 1
		gosub RunHotCornerBL
		Sleep 1000
		PosFound = 0
		}
return

RunHotCornerBL:
if HotCornerBL =
	return
if HotCornerBL = Kronos
	{
	Run http://oc-kronos/wfc/applications/wtk/html/ess/logon.jsp
	gosub RecordHotCornerBL
	return
	}
if HotCornerBL = Settings Menu
	{
	gosub Reopen
	gosub RecordHotCornerBL
	return
	}
if HotCornerBL = Paste Clipboard
	{
	gosub PasteClipboards
	gosub RecordHotCornerBL
	return
	}
if HotCornerBL = Copy Clipboard
	{
	StoreClipboard()
	gosub RecordHotCornerBL
	return
	}	
if HotCornerBL = Date and Initials
	{
	DateAndName()
	gosub RecordHotCornerBL
	return
	}
if HotCornerBL = Link from Excel
	{
	gosub HyperlinkFromExcel
	gosub RecordHotCornerBL
	return
	}
if HotCornerBL = System Switch
	{
	SwitchSystem()
	gosub RecordHotCornerBL
	return
	}	
if HotCornerBL = Today's Date
	{
	QuickDate()
	gosub RecordHotCornerBL
	return
	}
if HotCornerBL = www.google.com
	{
	Run https://www.google.com
	gosub RecordHotCornerBL
	return
	}
if HotCornerBL = EFS Fill
	{
	gosub FillEFS
	gosub RecordHotCornerBL
	return
	}
if HotCornerBL = EFS Fees Login
	{
	gosub EFSPayLogIn
	gosub RecordHotCornerBL
	return
	}
else
	{
	Run % HotCornerBL
	gosub RecordHotCornerBL
	return
	}
return

HotCornerTR:
CoordMode, Mouse, Screen
MouseGetPos,X, Y
GetKeyState, IsCtrlDown, Control
	if (X > ScreenWidthMinus5  &&  Y < 5 && PosFound = 0 && IsCtrlDown = "D")
		{
		PosFound = 1
		gosub RunHotCornerTR
		Sleep 1000
		PosFound = 0
		}
return

RunHotCornerTR:
if HotCornerTR =
	return
if HotCornerTR = Kronos
	{
	Run http://oc-kronos/wfc/applications/wtk/html/ess/logon.jsp
	gosub RecordHotCornerTR
	return
	}
if HotCornerTR = Settings Menu
	{
	gosub Reopen
	gosub RecordHotCornerTR
	return
	}
if HotCornerTR = Paste Clipboard
	{
	gosub PasteClipboards
	gosub RecordHotCornerTR
	return
	}
if HotCornerTR = Copy Clipboard
	{
	StoreClipboard()
	gosub RecordHotCornerTR
	return
	}	
if HotCornerTR = Date and Initials
	{
	DateAndName()
	gosub RecordHotCornerTR
	return
	}
if HotCornerTR = Link from Excel
	{
	gosub HyperlinkFromExcel
	gosub RecordHotCornerTR
	return
	}
if HotCornerTR = System Switch
	{
	SwitchSystem()
	gosub RecordHotCornerTR
	return
	}	
if HotCornerTR = Today's Date
	{
	QuickDate()
	gosub RecordHotCornerTR
	return
	}
if HotCornerTR = www.google.com
	{
	Run https://www.google.com
	gosub RecordHotCornerTR
	return
	}
if HotCornerTR = EFS Fill
	{
	gosub FillEFS
	gosub RecordHotCornerTR
	return
	}
if HotCornerTR = EFS Fees Login
	{
	gosub EFSPayLogIn
	gosub RecordHotCornerTR
	return
	}
else
	{
	Run % HotCornerTR
	gosub RecordHotCornerTR
	return
	}
return

HotCornerBR:
CoordMode, Mouse, Screen
MouseGetPos,X, Y
GetKeyState, IsCtrlDown, Control
	if (X > ScreenWidthMinus5  &&  Y > ScreenHeightMinus5 && PosFound = 0 && IsCtrlDown = "D")
		{
		PosFound = 1
		gosub RunHotCornerBR
		Sleep 1000
		PosFound = 0
		}
return

RunHotCornerBR:
if HotCornerBR =
	return
if HotCornerBR = Kronos
	{
	Run http://oc-kronos/wfc/applications/wtk/html/ess/logon.jsp
	gosub RecordHotCornerBR
	return
	}
if HotCornerBR = Settings Menu
	{
	gosub Reopen
	gosub RecordHotCornerBR
	return
	}
if HotCornerBR = Paste Clipboard
	{
	gosub PasteClipboards
	gosub RecordHotCornerBR
	return
	}
if HotCornerBR = Copy Clipboard
	{
	StoreClipboard()
	gosub RecordHotCornerBR
	return
	}	
if HotCornerBR = Date and Initials
	{
	DateAndName()
	gosub RecordHotCornerBR
	return
	}
if HotCornerBR = Link from Excel
	{
	gosub HyperlinkFromExcel
	gosub RecordHotCornerBR
	return
	}
if HotCornerBR = System Switch
	{
	SwitchSystem()
	gosub RecordHotCornerBR
	return
	}	
if HotCornerBR = Today's Date
	{
	QuickDate()
	gosub RecordHotCornerBR
	return
	}
if HotCornerBR = www.google.com
	{
	Run https://www.google.com
	gosub RecordHotCornerBR
	return
	}
if HotCornerBR = EFS Fill
	{
	gosub FillEFS
	gosub RecordHotCornerBR
	return
	}
if HotCornerBR = EFS Fees Login
	{
	gosub EFSPayLogIn
	gosub RecordHotCornerBR
	return
	}
else
	{
	MsgBox, %HotCornerBR%
	Run % HotCornerBR
	gosub RecordHotCornerBR
	return
	}
return

dSettings:
gosub Reopen
gosub CloseDrawer
return

Google:
gosub CloseDrawer
Run www.google.com
return

Calculator:
gosub CloseDrawer
Run calc.exe
return

PCT220:
gosub CloseDrawer
Run "H:\Docketing\AutoHotKey\Scripts\PCT 220 Date Generator.ahk"
return

SuperCopy:
Gui, 20: Hide
StoreClipboard()
Gui, 20: Show
gosub CloseDrawer
return

SystemSwitch:
Gui, 20: Hide
WinActivate, ahk_class IEFrame
SwitchSystem()
Gui, 20: Show
gosub CloseDrawer
return

SuperExcel:
gosub CloseDrawer
gosub, HyperlinkFromExcel
return

SuperPaste:
gosub CloseDrawer
gosub PasteClipboards
return

Cancel4:
Cancel3:
Cancel2:
Cancel:
{
Gui, 1:Destroy
Gui, 7:Destroy
Gui, 49:Destroy
Return
}

Custom1:  ;+CapsLock
DateAndName()
return

Custom2: ;^`:: This is for system switch.
SwitchSystem()
return
	
Custom3: ; This is for multiple cool things.
gosub, Multiuse
return

Custom4: ;^5:: This is for saving extra clipboards.
StoreClipboard()
return
	
Custom5: ;^6:: This is for pasting extra clipboards.
gosub PasteClipboards   ;PasteClipboard: 
return
	
Custom6: ; This is for EFS Cert Finder now. Since there isn't a hotkey, it isn't really necessary. See way down below.
QuickDate()
return

Custom7: ;^1:: This is for opening hyperlinks from Excel.
gosub, HyperlinkFromExcel
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                     ;;
;;            Custom SideBar            ;;
;;               Passive                ;;
;;     3px Wide Button on Right Edge    ;;
;;                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

OpenSideBar()
{
Gui, 50:New, AlwaysOnTop Owner,SideBar
Gui, 50:Add, Button, x0 y0 w3 h1040 gSideBar, 
Gui, 50:Show, x%SideBarx% y20 w5 h1040
Gui, 50:+ToolWindow -Caption                           ; Removes the Border and Task bar icon
Gui, 50:Color, 000111, SideBar                                ; can be any colour but it's good to use a color that is NOT present in ur GUI
WinSet, Transcolor, 000111, SideBar
Gui, 50:Show, x%SideBarx% y20 w5 h1060
return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                     ;;
;;            Multiple Things           ;;
;;           CTRL + RightClick          ;;
;;   DateExtend,AttyFind,SuggestRemark  ;;
;;                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Multiuse:
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
OldClipboard = %clipboard%
Clipboard = ;
SendInput ^c
ClipWait, .2
NewClipboard = %Clipboard%

if NewClipboard = ;
	{
	TrayTip, Multiuse, Blank clipboard. Please try again.
	;SplashTextOn, 150, , Blank clipboard. Try again.
	Sleep 3000
	TrayTip
	;SplashTextOff
	return
	}
else if InStr(NewClipboard, "Work")
	{
	;SplashTextOn, 300, ,Running AttyEmailFinder()
	Sleep 1000
	;SplashTextOff
	AttyEmailFinder()
	return
	}
else if InStr(NewClipboard, "Bill")
	{
	;SplashTextOn, 300, ,Running AttyEmailFinder()
	Sleep 1000
	;SplashTextOff
	AttyEmailFinder()
	return
	}
else if InStr(NewClipboard, "TMPL")
	{
	;SplashTextOn, 300, ,Running AttyEmailFinder()
        Sleep 1000
	;SplashTextOff
	AttyEmailFinder()
	return
	}		
else if InStr(NewClipboard, "INT-TM")
	{
	;SplashTextOn, 300, ,Running SuggestRemarks()
	;Sleep 1000
	;SplashTextOff
	SuggestRemarks()
	return
	}
else if InStr(NewClipboard, "INT-PAT")
	{
	;SplashTextOn, 300, ,Running SuggestRemarks()
	;Sleep 1000
	;SplashTextOff
	SuggestRemarks()
	return
	}
else if InStr(NewClipboard, "US-TM")
	{
	;SplashTextOn, 300, ,Running SuggestRemarks()
	;Sleep 1000
	;SplashTextOff
	SuggestRemarks()
	return
	}
else if InStr(NewClipboard, "US-PAT")
	{
	;SplashTextOn, 300, ,Running SuggestRemarks()
	;Sleep 1000
	;SplashTextOff
	SuggestRemarks()
	return
	}
else if InStr(NewClipboard, ".")
	{
	;SplashTextOn, 300, ,Running SuggestRemarks()
	;Sleep 1000
	;SplashTextOff
	ClientCodeIE()
	return
	}
else if InStr(NewClipboard, "-Jan-")
	{
	;SplashTextOn, 300, ,Running DateExtend()
	;Sleep 1000
	;SplashTextOff
	DateExtend()
	return
	}	
else if InStr(NewClipboard, "-Feb-")
	{
	;SplashTextOn, 300, ,Running DateExtend()
	;Sleep 1000
	;SplashTextOff
	DateExtend()
	return
	}	
else if InStr(NewClipboard, "-Mar-")
	{
	;SplashTextOn, 300, ,Running DateExtend()
	;Sleep 1000
	;SplashTextOff
	DateExtend()
	return
	}	
else if InStr(NewClipboard, "-Apr-")
	{
	;SplashTextOn, 300, ,Running DateExtend()
	;Sleep 1000
	;SplashTextOff
	DateExtend()
	return
	}
else if InStr(NewClipboard, "-May-")
	{
	;SplashTextOn, 300, ,Running DateExtend()
	;Sleep 1000
	;SplashTextOff
	DateExtend()
	return
	}
else if InStr(NewClipboard, "-Jun-")
	{
	;SplashTextOn, 300, ,Running DateExtend()
	;Sleep 1000
	;SplashTextOff
	DateExtend()
	return
	}
else if InStr(NewClipboard, "-Jul-")
	{
	;SplashTextOn, 300, ,Running DateExtend()
	;Sleep 1000
	;SplashTextOff
	DateExtend()
	return
	}
else if InStr(NewClipboard, "-Aug-")
	{
	;SplashTextOn, 300, ,Running DateExtend()
	;Sleep 1000
	;SplashTextOff
	DateExtend()
	return
	}
else if InStr(NewClipboard, "-Sep-")
	{
	;SplashTextOn, 300, ,Running DateExtend()
	;Sleep 1000
	;SplashTextOff
	DateExtend()
	return
	}
else if InStr(NewClipboard, "-Oct-")
	{
	;SplashTextOn, 300, ,Running DateExtend()
	;Sleep 1000
	;SplashTextOff
	DateExtend()
	return
	}
else if InStr(NewClipboard, "-Nov-")
	{
	;SplashTextOn, 300, ,Running DateExtend()
	;Sleep 1000
	;SplashTextOff
	DateExtend()
	return
	}
else if InStr(NewClipboard, "-Dec-")
	{
	;SplashTextOn, 300, ,Running DateExtend()
	;Sleep 1000
	;SplashTextOff
	DateExtend()
	return
	}
else
	MsgBox, Valid text not selected.`n`nValid options include:`n`na) an Action Type`n                    (e.g. INT-PAT STATUS CHECK)`nb) a block of Attorneys`n                    (e.g. JWB - TMPL, SJN - Reviewing)`nc) a date in Docketing`n                    (e.g. 14-Dec-2016)`nd) a Client Code.`n                    (e.g. QVID.123BR)
return

;¿
ClientCodeIE()
{
;NewClipboard = %Clipboard%
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
SendInput ^c
ClipWait, .2
;NewClipboard = %Trim(Clipboard)%
Sleep 50
StringLen, ClipLength, Clipboard
NewMousePosX := (xpos - 150)
NewMousePosY := (ypos - 50)
Gui, New, +Owner +AlwaysOnTop, OpenInIE
Gui, Font, s10 w500, Verdana
Gui, Font, bold
Gui, Add, Button, x100 y30 w100 h55, Open Record in Docketing
if ClipLength < 9
	Gui, Add, Button, x100 y0 h25 w100, %Clipboard%
else
	Gui, Add, Button, x50 y0 h25 w200, %Clipboard%
Gui, Font, s10 w500 normal, Verdana
;Gui, Add, Button, x100 y0 w100 h25, %Clipboard%
IniRead, RecordBoxes, C:\Users\%Computername%\AHKPrefs.ini, Username, RecordBoxes
IniRead, RadioChoice, C:\Users\%Computername%\AHKPrefs.ini, Username, Radio
StringSplit, RecordBoxes, RecordBoxes, `, ,
StringSplit, RadioChoice, RadioChoice, `, ,
;Msgbox %RecordBoxes0%, %RecordBoxes1%%RecordBoxes2%%RecordBoxes3%%RecordBoxes4%%RecordBoxes5%%RecordBoxes6% 
;MsgBox, %RadioChoice0% , %RadioChoice1% , %RadioChoice2% , %RadioChoice3% 
if RadioChoice2 = 1
		{
		gosub OpenPATLive
		return
		}
if RadioChoice3 = 1
		{
		gosub OpenTMLive
		return
		}
if RecordBoxes1 = 0 
		{
		}
else 
	Gui, Add, Button, x200 y30 w100 h25 gOpenPATLive, Patent Live		               ;RecordBox1
if RecordBoxes2 = 0 
		{
		}
else 
	Gui, Add, Button, x200 y60 w100 h25 gOpenPATAT, Patent AT		                   ;RecordBox2				
if RecordBoxes3 = 0 
		{
		}
else 
	Gui, Add, Button, x305 y30 w100 h25 gOpenInventionLive, Invention Live		       ;RecordBox3	
if RecordBoxes4 = 0 
		{
		}
else 
	Gui, Add, Button, x305 y60 w100 h25 gOpenInventionAT, Invention AT		           ;RecordBox4			 
if RecordBoxes5 = 0 
		{
		}
else 
	Gui, Add, Button, x0 y30 w100 h25 gOpenTMLive, TM Live		                       ;RecordBox5			
if RecordBoxes6 = 0 
		{
		}
else 
	Gui, Add, Button, x0 y60 w100 h25 gOpenTMAT, TM AT		                           ;RecordBox6		
	Gui, Add, Button, x100 y90 w100 h25 gCancelOpen, Cancel
	Gui, Show, x%NewMousePosX% y%NewMousePosY%
	Gui, +ToolWindow -Caption                           ; Removes the Border and Task bar icon
	Gui, Color, 000111, OpenInIE                                 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	WinSet, Transcolor, 000111, OpenInIE
	Gui, Show, x%NewMousePosX% y%NewMousePosY%
return

CancelOpen:
Gui, Hide
return

;                            https://msdn.microsoft.com/en-us/library/dd565688(v=vs.85).aspx
OpenTMLive:
Gui, Submit
OutputVar = http://oc-docketing/CPi/tmkschTrademark.aspx
ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
return

OpenTMAT:
Gui, Submit
OutputVar = http://oc-docketing/CPiAgent/tmkschTrademarkAgent.aspx
ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
return

OpenPATLive:
Gui, Submit
OutputVar = http://oc-docketing/CPi/patschCountryApplication.aspx
ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
return

OpenPATAT:
Gui, Submit
OutputVar = http://oc-docketing/CPiAgent/patschCountryApplicationAgent.aspx
ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
return

OpenInventionLive:
Gui, Submit
OutputVar = http://oc-docketing/CPi/patschInvention.aspx
ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
return

OpenInventionAT:
Gui, Submit
OutputVar = http://oc-docketing/CPiAgent/patschInventionAgent.aspx
ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
return
}

;;;;;;;;;;;
;¿


AddAtty(wParam, lParam, Msg) {
MouseGetPos,,,, OutputVarControl
IfEqual, OutputVarControl, Edit1
	AddAtty := "Add ABC or 2ABC to include in Auto-remarks.`nLeave blank to type manually."
else IfEqual, OutputVarControl, Button9
	AddAtty := "Check this box to use Auto-remarks."

ToolTip % AddAtty
}

DateExtend()
{
IniRead, Checkboxes, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes
StringSplit, Checkboxes, Checkboxes, `, ,
CoordMode, Mouse, Screen       ;Place mouse coordinates at absolute screen coordinates (multiple monitor)
IniRead, RespAtty, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
	if RespAtty = ERROR
		RespAtty := ""
MouseGetPos, xpos, ypos 
year := SubStr(NewClipboard, 8,4)
month := SubStr(NewClipboard, 4, 3) 
day := SubStr(NewClipboard, 1,2)

if month = Jan
	newmonth := 01
else if month = Feb
	newmonth := 02
else if month = Mar
	newmonth := 03
else if month = Apr
	newmonth := 04
else if month = May
	newmonth := 05
else if month = Jun
	newmonth := 06
else if month = Jul
	newmonth := 07
else if month = Aug
	newmonth := 08
else if month = Sep
	newmonth := 09
else if month = Oct
	newmonth := 10
else if month = Nov
	newmonth := 11
else if month = Dec
	newmonth := 12

formattedTime := year . newmonth . day
;MsgBox, %formattedTime%
Gui, New, +AlwaysOnTop +Owner,
;Gui, Add, Text, gText Center , Click here to test clicking text!
Gui, Add, Button, y2 w37 gAdd1, +1M
Gui, Add, Button, y2 w37 gAdd2, +2M
Gui, Add, Button, y2 w37 gAdd3, +3M
Gui, Add, Button, y2 w37 gAdd6, +6M
Gui, Add, Button, y2 w37 gAdd12, +1Y
Gui, Add, MonthCal, x11 vMyMonthCal, %formattedTime%
Gui, Add, Button, x11 y192 w50 Default gExtend, Extend
Gui, Add, Button, x71 y192 w37 gAdd1W, +1W
Gui, Add, Button, x119 y192 w37 gAdd2W, +2W
;Gui, Add, Button, x154 y192 w37 gAddTBD1, TBD1
;Gui, Add, Button, x197 y192 w37 gAddTBD2, TBD2
;Gui, Add, Button, x197 y192 w37 gAddTBD3, TBD3
;Gui, Add, Checkbox, x197 y192 Checked%Checkboxes1% vOption1, Remarks?
Gui, Add, Checkbox, x221 y198 Checked%Checkboxes1% vOption1, 
Gui, Font, s8
Gui, Add, Edit, Center Limit4 -Wrap Uppercase vRespAtty x164 y194 w50, %RespAtty%
Gui, Font
NewY := (ypos - 265)
NewX := (xpos - 50)
Gui, Show, x%NewX% y%NewY% w245, Calendar Selection
OnMessage(0x200, "AddAtty")
Return


Extend:
Gui, Submit
FormatTime, MyMonthCal, %MyMonthCal%, dd-MMM-yyyy
SendInput %MyMonthCal%
Clipboard = %OldClipboard%
gosub RecordCalExtend
Gui, Destroy
return

Add1:
Gui, Submit
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
IniWrite, %Checkboxes%, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes
;MsgBox, %MyMonthCal%                                 ; shows selected date as YYYYMMDD - 20170106
FormatTime, MyMonthCal, %MyMonthCal%, dd-MMM-yyyy
ifInString, MyMonthCal, Jan                                   
	{
	StringReplace, MyMonthCal, MyMonthCal, Jan, Feb
	ifInString, MyMonthCal, 29
		StringReplace, MyMonthCal, MyMonthCal, 29, 28
	else ifInString, MyMonthCal, 30
		StringReplace, MyMonthCal, MyMonthCal, 30, 28
	else ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 28	
	}	
else ifInString, MyMonthCal, Feb
	StringReplace, MyMonthCal, MyMonthCal, Feb, Mar
else ifInString, MyMonthCal, Mar
	{
	StringReplace, MyMonthCal, MyMonthCal, Mar, Apr
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Apr
	StringReplace, MyMonthCal, MyMonthCal, Apr, May
else ifInString, MyMonthCal, May
	{
	StringReplace, MyMonthCal, MyMonthCal, May, Jun
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Jun
	StringReplace, MyMonthCal, MyMonthCal, Jun, Jul
else ifInString, MyMonthCal, Jul
	StringReplace, MyMonthCal, MyMonthCal, Jul, Aug
else ifInString, MyMonthCal, Aug
	{
	StringReplace, MyMonthCal, MyMonthCal, Aug, Sep
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Sep
	StringReplace, MyMonthCal, MyMonthCal, Sep, Oct
else ifInString, MyMonthCal, Oct
	{
	StringReplace, MyMonthCal, MyMonthCal, Oct, Nov
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Nov
	StringReplace, MyMonthCal, MyMonthCal, Nov, Dec
else ifInString, MyMonthCal, Dec
	{
	StringReplace, MyMonthCal, MyMonthCal, Dec, Jan
		ifInString, MyMonthCal, 2016
			StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
		else ifInString, MyMonthCal, 2017
			StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
		else ifInString, MyMonthCal, 2018
			StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
		else ifInString, MyMonthCal, 2019
			StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
		else ifInString, MyMonthCal, 2020
			StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
		else ifInString, MyMonthCal, 2021
			StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
		else ifInString, MyMonthCal, 2022
			StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
		else ifInString, MyMonthCal, 2023
			StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
		else ifInString, MyMonthCal, 2024
			StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
		else ifInString, MyMonthCal, 2025
			StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
		else ifInString, MyMonthCal, 2026
			StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
		else ifInString, MyMonthCal, 2027
			StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
		else ifInString, MyMonthCal, 2028
			StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
		else ifInString, MyMonthCal, 2029
			StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else	
	MsgBox, didn't work.
if Option1 = 0
	{
	SendInput %MyMonthCal%
	Clipboard = %OldClipboard%
	gosub RecordCalExtend
	Gui, Destroy
	return
	}
else if Option1 = 1
	{
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
StringLen, NameLen, Username
NameLen3 := NameLen + 2
SendInput %MyMonthCal%
SendInput {TAB 5} ; I think it is 5 TABS. Could be 6.
;OldClipboard = %Clipboard%
Clipboard = ;
SendInput ^a
Sleep 50
SendInput ^c
ClipWait, .2
SavedRemarks = %Clipboard%
ExtendRemarks = %ATDate% Extend 1M per %RespAtty%. %Username% 
Clipboard =%ExtendRemarks%`n%SavedRemarks%
Sleep 50
SendInput ^v
Sleep 50
SendInput {PgUp}{END}
Sleep 50
SendInput {PgUp}{END}{Left %NameLen3%} 
Sleep 100
Clipboard = %OldClipboard%
gosub RecordCalExtend
return
	return
	}
else
	return
}

Add2:
Gui, Submit
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
IniWrite, %Checkboxes%, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes
;MsgBox, %MyMonthCal%                                 ; shows selected date as YYYYMMDD - 20170106
FormatTime, MyMonthCal, %MyMonthCal%, dd-MMM-yyyy
ifInString, MyMonthCal, Jan                                   
	StringReplace, MyMonthCal, MyMonthCal, Jan, Mar
else ifInString, MyMonthCal, Feb
	StringReplace, MyMonthCal, MyMonthCal, Feb, Apr
else ifInString, MyMonthCal, Mar
	StringReplace, MyMonthCal, MyMonthCal, Mar, May
else ifInString, MyMonthCal, Apr
	StringReplace, MyMonthCal, MyMonthCal, Apr, Jun
else ifInString, MyMonthCal, May
	StringReplace, MyMonthCal, MyMonthCal, May, Jul
else ifInString, MyMonthCal, Jun
	StringReplace, MyMonthCal, MyMonthCal, Jun, Aug
else ifInString, MyMonthCal, Jul
	{
	StringReplace, MyMonthCal, MyMonthCal, Jul, Sep
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Aug
	StringReplace, MyMonthCal, MyMonthCal, Aug, Oct
else ifInString, MyMonthCal, Sep
	StringReplace, MyMonthCal, MyMonthCal, Sep, Nov
else ifInString, MyMonthCal, Oct
	StringReplace, MyMonthCal, MyMonthCal, Oct, Dec
else ifInString, MyMonthCal, Nov
	{
	StringReplace, MyMonthCal, MyMonthCal, Nov, Jan
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Dec
	{
	StringReplace, MyMonthCal, MyMonthCal, Dec, Feb
		ifInString, MyMonthCal, 31
			StringReplace, MyMonthCal, MyMonthCal, 31, 28
		else ifInString, MyMonthCal, 30
			StringReplace, MyMonthCal, MyMonthCal, 30, 28
		else ifInString, MyMonthCal, 29
			StringReplace, MyMonthCal, MyMonthCal, 29, 28	
		ifInString, MyMonthCal, 2016
			StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
		else ifInString, MyMonthCal, 2017
			StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
		else ifInString, MyMonthCal, 2018
			StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
		else ifInString, MyMonthCal, 2019
			StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
		else ifInString, MyMonthCal, 2020
			StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
		else ifInString, MyMonthCal, 2021
			StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
		else ifInString, MyMonthCal, 2022
			StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
		else ifInString, MyMonthCal, 2023
			StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
		else ifInString, MyMonthCal, 2024
			StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
		else ifInString, MyMonthCal, 2025
			StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
		else ifInString, MyMonthCal, 2026
			StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
		else ifInString, MyMonthCal, 2027
			StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
		else ifInString, MyMonthCal, 2028
			StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
		else ifInString, MyMonthCal, 2029
			StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else	
	MsgBox, didn't work.
if Option1 = 0
	{
	SendInput %MyMonthCal%
	Clipboard = %OldClipboard%
	gosub RecordCalExtend
	Gui, Destroy
	return
	}
else if Option1 = 1
	{
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
StringLen, NameLen, Username
NameLen3 := NameLen + 2
SendInput %MyMonthCal%
SendInput {TAB 5} ; I think it is 5 TABS. Could be 6.
OldClipboard = %Clipboard%
Clipboard = ;
SendInput ^a
Sleep 50
SendInput ^c
ClipWait, .2
SavedRemarks = %Clipboard%
ExtendRemarks = %ATDate% Extend 2M per %RespAtty%. %Username% 
Clipboard =%ExtendRemarks%`n%SavedRemarks%
Sleep 50
SendInput ^v
Sleep 50
SendInput {PgUp}{END}
Sleep 50
SendInput {PgUp}{END}{Left %NameLen3%} 
Sleep 100
Clipboard = %OldClipboard%
gosub RecordCalExtend
return
	}
else
	return

Add3:
Gui, Submit
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
IniWrite, %Checkboxes%, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes
;MsgBox, %MyMonthCal%                                 ; shows selected date as YYYYMMDD - 20170106
FormatTime, MyMonthCal, %MyMonthCal%, dd-MMM-yyyy
ifInString, MyMonthCal, Jan                                   
	{
	StringReplace, MyMonthCal, MyMonthCal, Jan, Apr
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30	
	}	
else ifInString, MyMonthCal, Feb
	StringReplace, MyMonthCal, MyMonthCal, Feb, May
else ifInString, MyMonthCal, Mar
	{
	StringReplace, MyMonthCal, MyMonthCal, Mar, Jun
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Apr
	StringReplace, MyMonthCal, MyMonthCal, Apr, Jul
else ifInString, MyMonthCal, May
	StringReplace, MyMonthCal, MyMonthCal, May, Aug
else ifInString, MyMonthCal, Jun
	StringReplace, MyMonthCal, MyMonthCal, Jun, Sep
else ifInString, MyMonthCal, Jul
	StringReplace, MyMonthCal, MyMonthCal, Jul, Oct
else ifInString, MyMonthCal, Aug
	{
	StringReplace, MyMonthCal, MyMonthCal, Aug, Nov
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Sep
	StringReplace, MyMonthCal, MyMonthCal, Sep, Dec
else ifInString, MyMonthCal, Oct
	{
	StringReplace, MyMonthCal, MyMonthCal, Oct, Jan
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Nov
	{
	StringReplace, MyMonthCal, MyMonthCal, Nov, Feb
	ifInString, MyMonthCal, 29
		StringReplace, MyMonthCal, MyMonthCal, 29, 28
	else ifInString, MyMonthCal, 30
		StringReplace, MyMonthCal, MyMonthCal, 30, 28
	else ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 28	
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Dec
	{
	StringReplace, MyMonthCal, MyMonthCal, Dec, Mar
		ifInString, MyMonthCal, 2016
			StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
		else ifInString, MyMonthCal, 2017
			StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
		else ifInString, MyMonthCal, 2018
			StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
		else ifInString, MyMonthCal, 2019
			StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
		else ifInString, MyMonthCal, 2020
			StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
		else ifInString, MyMonthCal, 2021
			StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
		else ifInString, MyMonthCal, 2022
			StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
		else ifInString, MyMonthCal, 2023
			StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
		else ifInString, MyMonthCal, 2024
			StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
		else ifInString, MyMonthCal, 2025
			StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
		else ifInString, MyMonthCal, 2026
			StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
		else ifInString, MyMonthCal, 2027
			StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
		else ifInString, MyMonthCal, 2028
			StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
		else ifInString, MyMonthCal, 2029
			StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else	
	MsgBox, didn't work.
if Option1 = 0
	{
	SendInput %MyMonthCal%
	Clipboard = %OldClipboard%
	gosub RecordCalExtend
	Gui, Destroy
	return
	}
else if Option1 = 1
	{
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
StringLen, NameLen, Username
NameLen3 := NameLen + 2
SendInput %MyMonthCal%
SendInput {TAB 5} ; I think it is 5 TABS. Could be 6.
OldClipboard = %Clipboard%
Clipboard = ;
SendInput ^a
Sleep 50
SendInput ^c
ClipWait, .2
SavedRemarks = %Clipboard%
ExtendRemarks = %ATDate% Extend 3M per %RespAtty%. %Username% 
Clipboard =%ExtendRemarks%`n%SavedRemarks%
Sleep 50
SendInput ^v
Sleep 50
SendInput {PgUp}{END}
Sleep 50
SendInput {PgUp}{END}{Left %NameLen3%} 
Sleep 100
Clipboard = %OldClipboard%
gosub RecordCalExtend
return
	}
else
	return

Add6:
Gui, Submit
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
IniWrite, %Checkboxes%, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes
;MsgBox, %MyMonthCal%                                 ; shows selected date as YYYYMMDD - 20170106
FormatTime, MyMonthCal, %MyMonthCal%, dd-MMM-yyyy
ifInString, MyMonthCal, Jan                                   
	StringReplace, MyMonthCal, MyMonthCal, Jan, Jul
else ifInString, MyMonthCal, Feb
	StringReplace, MyMonthCal, MyMonthCal, Feb, Aug
else ifInString, MyMonthCal, Mar
	{
	StringReplace, MyMonthCal, MyMonthCal, Mar, Sep
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Apr
	StringReplace, MyMonthCal, MyMonthCal, Apr, Oct
else ifInString, MyMonthCal, May
	{
	StringReplace, MyMonthCal, MyMonthCal, May, Nov
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Jun
	StringReplace, MyMonthCal, MyMonthCal, Jun, Dec
else ifInString, MyMonthCal, Jul
	{
	StringReplace, MyMonthCal, MyMonthCal, Jul, Jan
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}	
else ifInString, MyMonthCal, Aug
	{
	StringReplace, MyMonthCal, MyMonthCal, Aug, Feb
	ifInString, MyMonthCal, 29
		StringReplace, MyMonthCal, MyMonthCal, 29, 28
	else ifInString, MyMonthCal, 30
		StringReplace, MyMonthCal, MyMonthCal, 30, 28
	else ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 28	
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Sep
	{
	StringReplace, MyMonthCal, MyMonthCal, Sep, Mar
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Oct
	{
	StringReplace, MyMonthCal, MyMonthCal, Oct, Apr
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Nov
	{
	StringReplace, MyMonthCal, MyMonthCal, Nov, May
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Dec
	{
	StringReplace, MyMonthCal, MyMonthCal, Dec, Jun
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else	
	MsgBox, didn't work.
if Option1 = 0
	{
	SendInput %MyMonthCal%
	Clipboard = %OldClipboard%
	gosub RecordCalExtend
	Gui, Destroy
	return
	}
else if Option1 = 1
	{
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
StringLen, NameLen, Username
NameLen3 := NameLen + 2
SendInput %MyMonthCal%
SendInput {TAB 5} ; I think it is 5 TABS. Could be 6.
OldClipboard = %Clipboard%
Clipboard = ;
SendInput ^a
Sleep 50
SendInput ^c
ClipWait, .2
SavedRemarks = %Clipboard%
ExtendRemarks = %ATDate% Extend 6M per %RespAtty%. %Username% 
Clipboard =%ExtendRemarks%`n%SavedRemarks%
Sleep 50
SendInput ^v
Sleep 50
SendInput {PgUp}{END}
Sleep 50
SendInput {PgUp}{END}{Left %NameLen3%} 
Sleep 100
Clipboard = %OldClipboard%
gosub RecordCalExtend
return
	}
else
	return

Add12:
Gui, Submit
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
IniWrite, %Checkboxes%, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes
;MsgBox, %MyMonthCal%                                 ; shows selected date as YYYYMMDD - 20170106
FormatTime, MyMonthCal, %MyMonthCal%, dd-MMM-yyyy
ifInString, MyMonthCal, Jan
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Feb
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Mar
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Apr
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, May
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Jun
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Jul
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Aug
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Sep
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Oct
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Nov
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Dec
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else	
	MsgBox, didn't work.
if Option1 = 0
	{
	SendInput %MyMonthCal%
	Clipboard = %OldClipboard%
	gosub RecordCalExtend
	Gui, Destroy
	return
	}
else if Option1 = 1
	{
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
StringLen, NameLen, Username
NameLen3 := NameLen + 2
SendInput %MyMonthCal%
SendInput {TAB 5} ; I think it is 5 TABS. Could be 6.
OldClipboard = %Clipboard%
Clipboard = ;
SendInput ^a
Sleep 50
SendInput ^c
ClipWait, .2
SavedRemarks = %Clipboard%
ExtendRemarks = %ATDate% Extend 1YR per %RespAtty%. %Username% 
Clipboard =%ExtendRemarks%`n%SavedRemarks%
Sleep 50
SendInput ^v
Sleep 50
SendInput {PgUp}{END}
Sleep 50
SendInput {PgUp}{END}{Left %NameLen3%} 
Sleep 100
Clipboard = %OldClipboard%
gosub RecordCalExtend
return
	return
	}
else
	return

Add1W:
Gui, Submit
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
IniWrite, %Checkboxes%, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes
MyMonthCal += 7, days
FormatTime, MyMonthCal, %MyMonthCal%, dd-MMM-yyyy
if Option1 = 0
	{
	SendInput %MyMonthCal%
	Clipboard = %OldClipboard%
	gosub RecordCalExtend
	Gui, Destroy
	return
	}
else if Option1 = 1
	{
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
StringLen, NameLen, Username
NameLen3 := NameLen + 2
SendInput %MyMonthCal%
SendInput {TAB 5} ; I think it is 5 TABS. Could be 6.
OldClipboard = %Clipboard%
Clipboard = ;
SendInput ^a
Sleep 50
SendInput ^c
ClipWait, .2
SavedRemarks = %Clipboard%
ExtendRemarks = %ATDate% Extend 1W per %RespAtty%. %Username% 
Clipboard =%ExtendRemarks%`n%SavedRemarks%
Sleep 50
SendInput ^v
Sleep 50
SendInput {PgUp}{END}
Sleep 50
SendInput {PgUp}{END}{Left %NameLen3%} 
Sleep 100
Clipboard = %OldClipboard%
gosub RecordCalExtend
return
	}
else
	return

Add2W:
Gui, Submit
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
IniWrite, %Checkboxes%, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes
MyMonthCal += 14, days
FormatTime, MyMonthCal, %MyMonthCal%, dd-MMM-yyyy
if Option1 = 0
	{
	SendInput %MyMonthCal%
	Clipboard = %OldClipboard%
	gosub RecordCalExtend
	Gui, Destroy
	return
	}
else if Option1 = 1
	{
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
StringLen, NameLen, Username
NameLen3 := NameLen + 2
SendInput %MyMonthCal%
SendInput {TAB 5} ; I think it is 5 TABS. Could be 6.
OldClipboard = %Clipboard%
Clipboard = ;
SendInput ^a
Sleep 50
SendInput ^c
ClipWait, .2
SavedRemarks = %Clipboard%
ExtendRemarks = %ATDate% Extend 2W per %RespAtty%. %Username% 
Clipboard =%ExtendRemarks%`n%SavedRemarks%
Sleep 50
SendInput ^v
Sleep 50
SendInput {PgUp}{END}
Sleep 50
SendInput {PgUp}{END}{Left %NameLen3%} 
Sleep 100
Clipboard = %OldClipboard%
gosub RecordCalExtend
return
	}
else
	return

;AddTBD1:
;MsgBox This doesn't do anything... yet. Suggestions?
;return

;AddTBD2:
;MsgBox This doesn't do anything... yet. Suggestions?
;return

;AddTBD3:
;MsgBox This doesn't do anything... yet. Suggestions?
;return

;Text:
;MsgBox, You clicked the text.
;return

GuiClose:
Gui, Submit
IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
Clipboard = %OldClipboard%
Gui, Destroy
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;        Persistent Box on IE        ;;
;;             CTRL + 8               ;;
;;   Press Space or Enter to close.   ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;#IfWinActive ahk_class IEFrame
;#Space::
;FormatTime, TimeStamp, R
;Gui, Destroy
;CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
;MouseGetPos, xpos, ypos 
;formattime, todaysdate, , MM/dd/yy 
;WinActivate, ahk_class IEFrame
;PersistentBar()
;return

PersistentBar()
{
IniRead, SettingsX, C:\Users\%Computername%\AHKPrefs.ini, Username, SettingsX
IniRead, SettingsY, C:\Users\%Computername%\AHKPrefs.ini, Username, SettingsY
Slot1X := 105
Slot2X := 210
Slot3X := 315
Slot4X := 420
Slot5X := 525
Slot6X := 630
Slot7X := 735
global SettingsHidden = 0
IniRead, Checkboxes, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes
StringSplit, Checkboxes, Checkboxes, `, ,
Slots = XXX%Checkboxes4%%Checkboxes5%%Checkboxes6%%Checkboxes7%%Checkboxes8%
Gui, 9:New,  +AlwaysOnTop +Owner, Settings1
Gui, 11:New, +AlwaysOnTop +Owner, Decoy
Gui, 10:New, +AlwaysOnTop +Owner, Persist
Gui, 9:Add, Button,   x0 y0 w75 h20 gCustomBut1, Settings         ;    ^CapsLock - Settings
Gui, 9:Add, Button,  x78 y0 w25 h20 gHideSettings, >>
Gui, 10:Font, ;underline bold
Gui, 11:Font, ;underline bold
if Slots = XXX00000   ; None of the options selected. Bar will not pop up.
	{
	return
	}
if Slots = XXX01000   ; Settings will show up. Nothing to do here.
	{
	return
	}
if Slots = XXX01001   ;
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Excel Hyperlink		         ;Option 8 - ^1 - Open Excel Hyperlink	
	}
if Slots = XXX01010
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut6, Open EFS Options		 ;Quick link to Open EFS Options
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Open EFS Options			 ;Quick link to Open EFS Options	
	}
if Slots = XXX01011
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Excel Hyperlink		 ;Option 8 - ^1 - Open Excel Hyperlink	
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut6, Open EFS Options		 ;Quick link to Open EFS Options
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Open EFS Options			 ;Quick link to Open EFS Options	
	}
if Slots = XXX01100
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut3, Copy++		 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Copy++		   	 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards
	}
if Slots = XXX01101
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut3, Copy++		 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Copy++		   	 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 10:Add, Button, x%Slot3X% y0 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot3X% y0 w100 h20, Excel Hyperlink		 ;Option 8 - ^1 - Open Excel Hyperlink	
	}
if Slots = XXX01110
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut3, Copy++		 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Copy++		   	 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 10:Add, Button, x%Slot3X% y0 w100 h20 gCustomBut6, Open EFS Options		 ;Quick link to Open EFS Options
	Gui, 11:Add, Button, x%Slot3X% y0 w100 h20, Open EFS Options			 ;Quick link to Open EFS Options	
	}
if Slots = XXX01111
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut3, Copy++		 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Copy++		   	 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards	
	Gui, 10:Add, Button, x%Slot3X% y0 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot3X% y0 w100 h20, Excel Hyperlink		 ;Option 8 - ^1 - Open Excel Hyperlink	
	Gui, 10:Add, Button, x%Slot4X% y0 w100 h20 gCustomBut6, Open EFS Options		 ;Quick link to Open EFS Options
	Gui, 11:Add, Button, x%Slot4X% y0 w100 h20, Open EFS Options			 ;Quick link to Open EFS Options	
	}
if Slots = XXX11000
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	}
if Slots = XXX11001
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Excel Hyperlink		 ;Option 8 - ^1 - Open Excel Hyperlink	
	}
if Slots = XXX11010
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut6, Open EFS Options		 ;Quick link to Open EFS Options
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Open EFS Options			 ;Quick link to Open EFS Options	
	}
if Slots = XXX11011
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Excel Hyperlink		 ;Option 8 - ^1 - Open Excel Hyperlink	
	Gui, 10:Add, Button, x%Slot3X% y0 w100 h20 gCustomBut6, Open EFS Options		 ;Quick link to Open EFS Options
	Gui, 11:Add, Button, x%Slot3X% y0 w100 h20, Open EFS Options			 ;Quick link to Open EFS Options	
	}
if Slots = XXX11100
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut3, Copy++		 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Copy++		   	 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot3X% y0 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot3X% y0 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards
	}
if Slots = XXX11101
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut3, Copy++		 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Copy++		   	 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot3X% y0 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot3X% y0 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards	
	Gui, 10:Add, Button, x%Slot4X% y0 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot4X% y0 w100 h20, Excel Hyperlink		 ;Option 8 - ^1 - Open Excel Hyperlink	
	}
if Slots = XXX11110
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut3, Copy++		 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Copy++		   	 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot3X% y0 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot3X% y0 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards	
	Gui, 10:Add, Button, x%Slot4X% y0 w100 h20 gCustomBut6, Open EFS Options		 ;Quick link to Open EFS Options
	Gui, 11:Add, Button, x%Slot4X% y0 w100 h20, Open EFS Options			 ;Quick link to Open EFS Options	
	}
if Slots = XXX11111
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut3, Copy++		     ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Copy++		   			     ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot3X% y0 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot3X% y0 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards	
	Gui, 10:Add, Button, x%Slot4X% y0 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot4X% y0 w100 h20, Excel Hyperlink		         ;Option 8 - ^1 - Open Excel Hyperlink	
	Gui, 10:Add, Button, x%Slot5X% y0 w100 h20 gCustomBut6, Open EFS Options			 ;Quick link to Open EFS Options
	Gui, 11:Add, Button, x%Slot5X% y0 w100 h20, Open EFS Options			             ;Quick link to Open EFS Options	
	}
Gui, 9: +ToolWindow -Caption                           ; Removes the Border and Task bar icon
Gui, 10:+ToolWindow -Caption                           ; Removes the Border and Task bar icon
Gui, 11:+ToolWindow -Caption 
Gui, 8: Color, 000111 
Gui, 9: Color, 000111 
Gui, 10:Color, 000111                           ; Removes the Border and Task bar icon
Gui, 11:Color, 000111                           ; can be any colour but it's good to use a color that is NOT present in ur GUI
Gui, 9:Show, X%SettingsX% Y%SettingsY% h25 , Settings1
;Gui, 11:Show, X%NewX% Y%NewY% h25 , Decoy
;Gui, 10:Show, X%NewX% Y%NewY% h25 , Persist
WinSet, Transcolor, 000111, Settings2
WinSet, Transcolor, 000111, Settings1
WinSet, Transcolor, 000111, Decoy
WinSet, Transcolor, 000111, Persist
return
}

HideSettings:
	if SettingsHidden = 1
		{
		Gui, 10:Hide
		Gui, 11:Hide
		SettingsHidden = 0
		return
		}
	if SettingsHidden = 0
		{
	Gui, 11:Show, X%SettingsX% Y%SettingsY% h25 , Decoy
	Gui, 10:Show, X%SettingsX% Y%SettingsY% h25 , Persist
	Gui, 9:Show, X%SettingsX% Y%SettingsY% h25 , Settings1
	WinSet, Transcolor, 000111, Decoy
	WinSet, Transcolor, 000111, Persist
	SettingsHidden = 1
		}
return

CustomBut1:
	{
	gosub Reopen
	Gui, 9: Show
	return
	}

CustomBut2:
	{
	;WinActivate, ahk_class IEFrame
	;Sleep 200
	Gui, 10: Hide
	SwitchSystem()
	Gui, 10: Show
	;WinActivate, ahk_class IEFrame
	Gui, 10: Show
	Gui, 9: Show
	return
	}

CustomBut3:
	{
	Gui, 10: Hide
	StoreClipboard()
	Gui, 10: Show
	Gui, 9: Show
	return
	}

CustomBut4:
	{
	Gui, 10: Hide
	gosub PasteClipboards
	Gui, 10: Show
	Gui, 9: Show
	return
	}
	
CustomBut5:
	{
	Gui, 10: Hide
	gosub HyperlinkFromExcel
	Gui, 10: Show
	Gui, 9: Show
	return
	}

CustomBut6:
	{
	Gui, 10: Hide
	PosFound = 1
gosub SettingsDrawer
		PosFound = 1
		DetectHiddenWindows, on
		WinSet, Transparent, 0, Drawer
				Sleep 35
		Gui, 20: Show, x0 y0 w%ScreenWidthFivePercent% ; h510
		WinSet, Transparent, 51, Drawer
				Sleep 35
		WinSet, Transparent, 102, Drawer
				Sleep 35
		WinSet, Transparent, 153, Drawer
				Sleep 35
		WinSet, Transparent, 204, Drawer
				Sleep 35				
		WinSet, Transparent, 255, Drawer
		Sleep 1000
	Gui, 10: Show
	Gui, 9: Show
	return
	}

CustomBut7:
	{
	MsgBox, CustomBut7
	return
	}

CustomBut8:
	{
	MsgBox, CustomBut8
	return
	}

CustomBut9:
	{
	MsgBox, CustomBut9
	return
	}

	
FillEFS:
gosub CloseDrawer
TrayTip, Just getting started..., Filling in EFS Information...
Sleep 1000
gosub EFSFill
TrayTip, And we're done!, If it didn't work`, try accessing the URL and removing everything from the ? over.`nPress Enter to refresh the page and try again! 
Sleep 3000

return

/*
QCType:
global QC
;global QC2
WinGetPos , X, Y, Width, Height, ahk_class IEFrame
NewX := x + 10
NewY := y + 2
NewNewY := NewY + 25
Gui, Submit, NoHide

IniRead, QCAction, C:\Users\%Computername%\AHKPrefs.ini, QC, %QC%
StringSplit, QCActionsSplit, QCAction, `|, %A_Space%,
;MsgBox, %QCActionsSplit0%, %QCActionsSplit1% %QCActionsSplit2% %QCActionsSplit3% %QCActionsSplit4% %QCActionsSplit5%
Gui, New, +AlwaysOnTop +Owner, Test2
Gui, Font, s12 bold, Verdana
Gui, Add, Button, w300 h30, What would you like to paste?
Gui, Font, s10 w500, Verdana
Gui, Add, Button, gQCAction1, %QCActionsSplit1%
if QCActionsSplit2 =  ; 
{
}
else  
	Gui, Add, Button, gQCAction2, %QCActionsSplit2%
if QCActionsSplit3 =  ; 
{
}
else	 
	Gui, Add, Button, gQCAction3, %QCActionsSplit3%
if QCActionsSplit4 =  ; 
{
}
else	 
	Gui, Add, Button, gQCAction4, %QCActionsSplit4%
if QCActionsSplit5 =  ; 
{
}
else	
	Gui, Add, Button, gQCAction5, %QCActionsSplit5%
Gui, Font, s12 bold, Verdana
Gui, Add, Button, gQCAction6, Cancel
Gui, Show
Gui, +ToolWindow -Caption                           ; Removes the Border and Task bar icon
Gui, Color, 000111                                  ; can be any colour but it's good to use a color that is NOT present in ur GUI
;Gui, Show, X%X% Y%Y% h28 w225, Test
;Gui, Show, X%NewX% Y%NewY% h500 w500, Test2
Gui, Show, X%NewX% Y%NewNewY%, Test2
WinSet, Transcolor, 000111, Test2	
return
	
QCAction1:
	OldClipboard = %Clipboard%
	Clipboard = %QCActionsSplit1%
	Gui, Submit
	SendInput ^v
	Sleep 100
	Gui, Show
	Clipboard = %OldClipboard%
	return

QCAction2:
	OldClipboard = %Clipboard%
	Clipboard = %QCActionsSplit2%
	Gui, Submit
	SendInput ^v
	Sleep 100
	Gui, Show
	Clipboard = %OldClipboard%
	return

QCAction3:
	OldClipboard = %Clipboard%
	Clipboard = %QCActionsSplit3%
	Gui, Submit
	SendInput ^v
	Sleep 100
	Gui, Show
	Clipboard = %OldClipboard%
	return

QCAction4:
	OldClipboard = %Clipboard%
	Clipboard = %QCActionsSplit4%
	Gui, Submit
	SendInput ^v
	Sleep 100
	Gui, Show
	Clipboard = %OldClipboard%
	return

QCAction5:
	OldClipboard = %Clipboard%
	Clipboard = %QCActionsSplit5%
	Gui, Submit
	SendInput ^v
	Sleep 100
	Gui, Show
	Clipboard = %OldClipboard%
	return

QCAction6:
	Gui, Destroy
	return

;GuiControl, ,ComboBox2, |INT-PAT INSTR NPHASE|ANNUITY STATUS|BR GENETIC|
;	if QC = Direct
;		{
;		GuiControl, ,ComboBox2, |INT-PAT INSTR DIRECT|ANNUITY STATUS|DOCS TO FOLLOW|
;		}
;	if QC =  ;
;		{
;		;GuiControl, Hide, ComboBox2
;		GuiControl, ,ComboBox2, ||
;		}
;	if QC2 = INT-PAT INSTR NPHASE
;		{
;		GuiControl, , ComboBox2, |INT-PAT INSTR NPHASE|ANNUITY STATUS|BR GENETIC|
;		;MsgBox, INT-PAT INSTR NPHASE copied to Clipboard.
;		Clipboard = INT-PAT INSTR NPHASE
;		}
;	if QC2 = ANNUITY STATUS
;		{
;		GuiControl, ,ComboBox2, |INT-PAT INSTR NPHASE|ANNUITY STATUS|BR GENETIC|
;		;MsgBox, INT-PAT ANNUITY STATUS copied to Clipboard.
;		Clipboard = INT-PAT ANNUITY STATUS
;		}
;	if QC2 = BR GENETIC
;		{
;		GuiControl, ,ComboBox2, |INT-PAT INSTR NPHASE|ANNUITY STATUS|BR GENETIC|
;		;MsgBox, INT-PAT BR GENETIC MATERIAL copied to Clipboard.
;		Clipboard = INT-PAT BR GENETIC MATERIAL
;		}
;return

*/
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (RETIRED)                          ;;
;;        Open Shortcut Tips          ;;
;;          CTRL + CapsLock           ;;
;;   Press Space or Enter to close.   ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;^CapsLock::
;FormatTime, TimeStamp, R
;Gui, Destroy
;CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
;MouseGetPos, xpos, ypos 
;formattime, todaysdate, , MM/dd/yy 
;ShortcutTips()
;return

;ShortcutTips()
;{
;FormatTime, TimeStamp, R
;;IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
;SplashTextOn,350 ,310, Quick Shortcuts                                         (Press Enter/ESC to close.), Ctrl+`` = Open Docketing in Opposite System `n Ctrl+1 = Open Hyperlink from Excel `n`n Ctrl+5 = Store Extra Clipboard Items `n Ctrl+6 = Paste Stored Clipboard Items `n`n Ctrl+3 = Set Username for Remarks `n Shift+CapsLock = Paste current date and initials. `n`n Ctrl+= = Create Shortcut Abbreviations `n`n Highlight text, then Ctrl+RightClick:`n     Suggest Action Remarks`n     Extend Docketing Date`n     Generate Attorney Emails
;WinMove, Quick Shortcuts , , 0, 0 ; Move the splash window to the top left corner.
;Msgbox
;Sleep 4000
;SplashTextOff
;Return
;}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;     Store Extra Clipboard Items    ;;
;;             CTRL + 5               ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;^5::
;FormatTime, TimeStamp, R
;Gui, Destroy
;CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
;MouseGetPos, xpos, ypos 
;formattime, todaysdate, , MM/dd/yy 
;StoreClipboard()
;return

StoreClipboard()
{
IniRead, CustomColor, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowColor
IniRead, WindowPosX, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniRead, WindowPosY, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
if WindowPosX = ERROR
	WindowPosX = 0
if WindowPosY = ERROR
	WindowPosY = 0
Gui, 99: Destroy
FormatTime, TimeStamp, R
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username 
CoordMode, Mouse, Screen       ;Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
OldClipboard = %Clipboard%
Clipboard = ;
IniRead, Clip1, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip1
IniRead, Clip2, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip2
IniRead, Clip3, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip3
IniRead, Clip4, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip4
IniRead, Clip5, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip5
SendInput ^c
ClipWait, .2
NewClipboard = %Clipboard%
StringReplace, NewClipboard, NewClipboard, `r`n, %A_Space%, All    ; Replace any hard returns with a space. 
StringReplace, NewClipboard, NewClipboard, `r, %A_Space%, All      ; Replace any hard returns with a space. 
StringReplace, NewClipboard, NewClipboard, `n, %A_Space%, All      ; Replace any hard returns with a space. 
StringReplace, NewClipboard, NewClipboard, %A_Space%%A_Space%, %A_Space%, All      ; Replace any hard returns with a space. 
Gui, 99: New, +AlwaysOnTop +Owner, Copy Clipboard Slots
Gui, 99: Font, s12 bold, Verdana
Gui, 99: Add, Button, x%ScreenWidthPointFive%  w%ScreenWidthFifteenPercent% h30 gBut7, Where would you like to store the text?
Gui, 99: Font, s10 w500, Verdana
Gui, 99: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFifteenPercent% Wrap gBut1, %Clip1%
Gui, 99: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFifteenPercent% Wrap gBut2, %Clip2%
Gui, 99: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFifteenPercent% Wrap gBut3, %Clip3%
Gui, 99: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFifteenPercent% Wrap gBut4, %Clip4%
Gui, 99: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFifteenPercent% Wrap gBut5, %Clip5%
Gui, 99: Font, s12 bold, Verdana
Gui, 99: Add, Button, x%ScreenWidthPointFive%  gBut6, Cancel
Gui, 99: +ToolWindow  ; Removes the Border and Task bar icon
Gui, 99: Color, %CustomColor%
Gui, 99: Show, x%WindowPosX% y%WindowPosY% w%ScreenWidthSixteenPercent%, Copy Clipboard Slots
return 
}

But1:
WinGetPos, WindowPosX, WindowPosY, , , A, 
Gui, 99: Submit
IniWrite, %NewClipboard%, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip1
IniWrite, %WindowPosX%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniWrite, %WindowPosY%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
Sleep 200
IniRead, Clip1, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip1
Clipboard = %OldClipboard%
gosub RecordCopyAction
Return

But2:
WinGetPos, WindowPosX, WindowPosY, , , A, 
Gui, 99: Submit
IniWrite, %NewClipboard%, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip2
IniWrite, %WindowPosX%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniWrite, %WindowPosY%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
Sleep 200
IniRead, Clip2, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip2
Clipboard = %OldClipboard%
gosub RecordCopyAction
Return

But3:
WinGetPos, WindowPosX, WindowPosY, , , A, 
Gui, 99: Submit
IniWrite, %NewClipboard%, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip3
IniWrite, %WindowPosX%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniWrite, %WindowPosY%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
Sleep 200
IniRead, Clip3, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip3
Clipboard = %OldClipboard%
gosub RecordCopyAction
Return

But4:
WinGetPos, WindowPosX, WindowPosY, , , A, 
Gui, 99: Submit
IniWrite, %NewClipboard%, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip4
IniWrite, %WindowPosX%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniWrite, %WindowPosY%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
Sleep 200
IniRead, Clip4, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip4
Clipboard = %OldClipboard%
gosub RecordCopyAction
Return


But5:
WinGetPos, WindowPosX, WindowPosY, , , A, 
Gui, 99: Submit
IniWrite, %NewClipboard%, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip5
IniWrite, %WindowPosX%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniWrite, %WindowPosY%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
Sleep 200
IniRead, Clip5, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip5
Clipboard = %OldClipboard%
gosub RecordCopyAction
Return

But7:
But6:
WinGetPos, WindowPosX, WindowPosY, , , A, 
Gui, 99: Hide
IniWrite, %WindowPosX%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniWrite, %WindowPosY%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
Clipboard = %OldClipboard%
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;    Paste Extra Stored Clipboard    ;;
;;             CTRL + 6               ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PasteClipboards:
IniRead, WindowClose, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowClose
	if WindowClose = ERROR
		WindowClose = 0
IniRead, CustomColor, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowColor
IniRead, WindowPosX, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniRead, WindowPosY, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY

if WindowPosX = ERROR
	WindowPosX = 0
if WindowPosY = ERROR
	WindowPosY = 0
global Clip1
global Clip2
global Clip3
global Clip4
global Clip5
Gui, 99: Destroy
FormatTime, TimeStamp, R
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, key
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
IniRead, Clip1, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip1
IniRead, Clip2, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip2
IniRead, Clip3, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip3
IniRead, Clip4, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip4
IniRead, Clip5, C:\Users\%Computername%\AHKPrefs.ini, Clips, Clip5
Gui, 99: New, +AlwaysOnTop +Owner, Paste Clipboard Slots
Gui, 99: Font, s12 bold, Verdana
Gui, 99: Add, Button, x%ScreenWidthPointFive%  w%ScreenWidthFifteenPercent% gPaste7 h30, What would you like to paste?
Gui, 99: Font, s10 w500, Verdana
Gui, 99: Add, Button, x%ScreenWidthPointFive%  w%ScreenWidthFifteenPercent% Wrap gPaste1, %Clip1%
Gui, 99: Add, Button, x%ScreenWidthPointFive%  w%ScreenWidthFifteenPercent% Wrap gPaste2, %Clip2%
Gui, 99: Add, Button, x%ScreenWidthPointFive%  w%ScreenWidthFifteenPercent% Wrap gPaste3, %Clip3%
Gui, 99: Add, Button, x%ScreenWidthPointFive%  w%ScreenWidthFifteenPercent% Wrap gPaste4, %Clip4%
Gui, 99: Add, Button, x%ScreenWidthPointFive%  w%ScreenWidthFifteenPercent% Wrap gPaste5, %Clip5%
Gui, 99: Font, s12 bold, Verdana
Gui, 99: Add, Button, x%ScreenWidthPointFive%  gPaste6, Cancel
Gui, 99: Add, Checkbox, x0 y0 w12 h12 Checked%WindowClose% vWindowClose,
Gui, 99: +ToolWindow  ; Removes the Border and Task bar icon
Gui, 99: Color, %CustomColor%
Gui, 99: Show, x%WindowPosX% y%WindowPosY% w%ScreenWidthSixteenPercent%, Paste Clipboard Slots
;SetTimer, PasteClipboards, 200
return

Paste1:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, 99: Submit
SendRaw %Clip1%
Sleep 1000
GuiControlGet, HideWindow, , Button8
	if HideWindow = 0
		{
		gosub RecordPasteAction
		IniWrite, %WindowClose%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowClose
		IniWrite, %WindowPosX%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
		IniWrite, %WindowPosY%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY		
		return
		}
	if HideWindow = 1
		{
		Gui, 99: Show
		gosub RecordPasteAction
		IniWrite, %WindowClose%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowClose
		IniWrite, %WindowPosX%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
		IniWrite, %WindowPosY%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
		return
		}
return

Paste2:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, 99: Submit
SendRaw %Clip2%
Sleep 1000
GuiControlGet, HideWindow, , Button8
	if HideWindow = 0
		{
		gosub RecordPasteAction
		IniWrite, %WindowClose%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowClose
		IniWrite, %WindowPosX%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
		IniWrite, %WindowPosY%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY		
		return
		}
	if HideWindow = 1
		{
		Gui, 99: Show
		gosub RecordPasteAction
		IniWrite, %WindowClose%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowClose
		IniWrite, %WindowPosX%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
		IniWrite, %WindowPosY%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
		return
		}
return

Paste3:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, 99: Submit
SendRaw %Clip3%
Sleep 1000
GuiControlGet, HideWindow, , Button8
	if HideWindow = 0
		{
		gosub RecordPasteAction
		IniWrite, %WindowClose%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowClose
		IniWrite, %WindowPosX%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
		IniWrite, %WindowPosY%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY		
		return
		}
	if HideWindow = 1
		{
		Gui, 99: Show
		gosub RecordPasteAction
		IniWrite, %WindowClose%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowClose
		IniWrite, %WindowPosX%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
		IniWrite, %WindowPosY%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
		return
		}
return

Paste4:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, 99: Submit
SendRaw %Clip4%
Sleep 1000
GuiControlGet, HideWindow, , Button8
	if HideWindow = 0
		{
		gosub RecordPasteAction
		IniWrite, %WindowClose%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowClose
		IniWrite, %WindowPosX%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
		IniWrite, %WindowPosY%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY		
		return
		}
	if HideWindow = 1
		{
		Gui, 99: Show
		gosub RecordPasteAction
		IniWrite, %WindowClose%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowClose
		IniWrite, %WindowPosX%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
		IniWrite, %WindowPosY%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
		return
		}
return

Paste5:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, 99: Submit
SendRaw %Clip5%
Sleep 1000
GuiControlGet, HideWindow, , Button8
	if HideWindow = 0
		{
		gosub RecordPasteAction
		IniWrite, %WindowClose%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowClose
		IniWrite, %WindowPosX%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
		IniWrite, %WindowPosY%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY		
		return
		}
	if HideWindow = 1
		{
		Gui, 99: Show
		gosub RecordPasteAction
		IniWrite, %WindowClose%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowClose
		IniWrite, %WindowPosX%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
		IniWrite, %WindowPosY%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
		return
		}
return

Paste7:
Paste6:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, 99: Submit
IniWrite, %WindowClose%, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowClose
IniWrite, %WindowPosX%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniWrite, %WindowPosY%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;    Hotkey for Date and Initials    ;;
;;          Shift + CapsLock          ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;+CapsLock::
;DateAndName()
;return

DateAndName()
{
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
StringLen, NameLen, Username
NameLen1 := NameLen + 1
NameLen2 := NameLen + 2
LastClipboard = %Clipboard%
Clipboard = ;
Sleep 75
SendInput ^c
ClipWait, .2
NewClipboard = %Clipboard%
	if NewClipboard = ;
		{
		Sleep 75
		SendInput %ATDate%            ; Pastes current date.
		SendInput {Space}             ; Adds space after date.
		;SendInput {End}{Space}-%Username% ; Jumps to end of line and pastes Username.
		SendInput {End}{Space}%Username% ; Jumps to end of line and pastes Username.
		SendInput {Left %NameLen1%}              ; Positions cursor in middle of text by taking length of Username and adding 2.
		}
	else IfInString, NewClipboard, * -
		{
		Sleep 75
		StringReplace, NewClipboard, NewClipboard, *,, 
		StringReplace, NewClipboard, NewClipboard, %A_Space%,,		
		StringReplace, NewClipboard, NewClipboard, -,, 
		Sleep 75
		;Clipboard = %ATDate% -%NewClipboard% -%Username% 
		Clipboard = %ATDate%%NewClipboard%%Username% 
		Sleep 75
		SendInput ^v
		SendInput {Left %NameLen%}              ; Positions cursor in middle of text by taking length of Username and adding 2.
		SendInput {Space}
		}
	else
		{
		Sleep 75
		;Clipboard = %ATDate% - %NewClipboard% -%Username% 
		Clipboard = %ATDate% %NewClipboard% %Username% 
		Sleep 100
		SendInput ^v
		SendInput {Left %NameLen1%}              ; Positions cursor in middle of text by taking length of Username and adding 2.
		}
Sleep 100
Clipboard = %LastClipboard%
gosub RecordKeystrokes
SendInput {Ctrl up}
return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;     Open Hyperlink from Excel      ;;
;;             CTRL + 1               ;;
;; For Past Due/IntFees/Facing Report ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#IfWinNotActive ahk_class AcrobatSDIWindow
;^1::
HyperlinkFromExcel:
FormatTime, TimeStamp, R
;Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, key
OldClipboard := Clipboard                         ; This saves clipboard content for later.
Clipboard = ;                                     ; This empties the clipboard.
URLString = ;                                     ; Sets MyString to blank.
DocketingString = oc-docketing ;
SendInput ^c
ClipWait, .2
URLString := clipboard                            ; Fetch URL into variable
if InStr(URLString, DocketingString)
     {
	 TrayTip, Excel Hyperlink., Opening in docketing now.
     ;SplashTextOn, 300,,Opening in docketing now.,
     Run %URLString%
     Sleep 2500
     TrayTip,
     Clipboard = %oldClipboard%
     gosub RecordExcelHLink
     Return
     }
else
     {
	 TrayTip, Excel Hyperlink., Not a docketing URL. Unable to open link.
     ;SplashTextOn, 300,,Not a docketing URL. Unable to open link.,
     Sleep 2500
	 TrayTip     
	 ;SplashTextOff
     Clipboard = %oldClipboard%
     Return
     }
SendInput {Ctrl up}
Return

#IfWinActive

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;        Open Opposite System        ;;
;;             CTRL + `               ;;
;;        For use in Docketing.       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;^`::
;FormatTime, TimeStamp, R
;Gui, Destroy
;CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
;MouseGetPos, xpos, ypos 
;formattime, todaysdate, , MM/dd/yy 
;SwitchSystem()
;return

SwitchSystem()
{
WinActivate, ahk_class IEFrame
		OldClipboard := Clipboard                                                                ; This saves clipboard content for later.
        Clipboard = ;                                                                            ; This empties the clipboard.
        MyString = ;                                                                             ; Sets MyString to blank.
        AppString = ;
        FrontString = ;
        
        PatentString = http://oc-docketing/CPi/patfrmCountryApplication.aspx?Key=                ; Prefix section of a Live Patent (58 Characters).
        PatentATString = http://oc-docketing/CPiAgent/patfrmCountryApplicationAgent.aspx?Key=    ; Prefix section of a AT Patent (68 Characters).
        PatentActionString = http://oc-docketing/CPi/patfrmActionDue.aspx?key=                   ; Patent Action (49 + 7)
        PatentATActionString = http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=       ; Patent AT Action (60 + 7)

        TMString = http://oc-docketing/CPi/tmkfrmTrademark.aspx?Key=                             ; Prefix section of a Live Trademark (49 Characters).
        TMATString = http://oc-docketing/CPiAgent/tmkfrmTrademarkAgent.aspx?Key=                 ; Prefix section of a AT Trademark (59 + 6 Characters).
        TMActionString = http://oc-docketing/CPi/tmkfrmActionDue.aspx?Key=                       ; TM Live Action (49 + 6)
        TMATActionString = http://oc-docketing/CPiAgent/tmkfrmActionDueAgent.aspx?Key=           ; TM AT Action (59 + 6)
ie := WBGet()
MyString := ie.LocationURL ;grab current url

;MsgBox, % IsObject(ie)
	if IsObject(ie) = 0
		{
		Run "iexplore.exe"
		Sleep 5000
		ie := WBGet()
		return
		}
	else

if InStr(MyString, PatentString)
     {
     StringLeft, FrontString, MyString, 65       ; Stores first 58+7=65 characters of URL for Live Patent with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     FrontString = %PatentATString%
     }
else if InStr(MyString, TMString)
     {
     StringLeft, FrontString, MyString, 55       ; Stores first 49+6=55 characters of URL for Live Trademark with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     FrontString = %TMATString%
     }
else if InStr(MyString, PatentATString)
     {
     StringLeft, FrontString, MyString, 75       ; Stores first 68+7=75 characters of URL for AT Patent with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     FrontString = %PatentString%
     }
else if InStr(MyString, TMATString)
     {
     StringLeft, FrontString, MyString, 65       ; Stores first 54+6=60 characters of URL for AT Trademark with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     FrontString = %TMString%
     }
else if Instr(MyString, PatentActionString)
     {
     StringLeft, FrontString, MyString, 74       ; Stores first 67+7=74 characters of URL for Live Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     FrontString = %PatentATString%
     }
else if Instr(MyString, PatentATActionString)
     {
     StringLeft, FrontString, MyString, 85       ; Stores first 78+7=85 characters of URL for AT Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     FrontString = %PatentString%
     }
else if Instr(MyString, TMActionString)
     {
     StringLeft, FrontString, MyString, 73       ; Stores first 67+6=73 characters of URL for Live TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     FrontString = %TMATString%
     }
else if Instr(MyString, TMATActionString)
     {
     StringLeft, FrontString, MyString, 83       ; Stores first 77+6=83 characters of URL for AT TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     FrontString = %TMString%
     }
else
     {
     TrayTip, System Switch, Not on a Live or AT docketing page. Unable to open page.,
     Sleep 1500
     TrayTip
     Clipboard = %OldClipboard%
     Return
     }
MyString := FrontString . AppString
TrayTip, System Switch, Opening in opposite system.
;SplashTextOn, 300,,Opening in opposite system now.,
	if CherToggle = 1
		{
		Run iexplore.exe  %MyString% 
		;Sleep 1000
		;ie := WBGet()
		;Run %MyString%
		}
	else
		{
		Run %MyString%
		}
Sleep 1500
TrayTip
Clipboard = %OldClipboard%
AppString = ;
FrontString = ;
gosub RecordSysSwitch
SendInput {Ctrl up}
Return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;         Suggested Remarks          ;;
;;             CTRL + 9               ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SuggestRemarks()
{
Gui, 99: Destroy
IniRead, CustomColor, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowColor
IniRead, WindowPosX, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniRead, WindowPosY, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
if WindowPosX = ERROR
	WindowPosX = 0
if WindowPosY = ERROR
	WindowPosY = 0
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
Array = ;
PreviousClip := Clipboard
SendInput ^c
ClipWait, .2
CopiedAction := Clipboard                                                    ; This saves clipboard content for later.
;InStr(CopiedAction, IntPat) OR InStr(CopiedAction, IntTM)
IniRead, CopiedAction, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Actions (BETA).ini, Actions, %CopiedAction%
Sleep 100
Array := StrSplit(CopiedAction, "|", A_Space)
if % Array[1] == "ERROR"  OR (StringLen, CopiedAction > 50)
     {
     Sleep 200
     TrayTip, Action not found.,Action not found`, or not copied correctly (perhaps extra spaces?).
	 Sleep 2500
	 Clipboard = %PreviousClip%
	 TrayTip
	 Return
	 }	 
else 
     {
Gui, 99:  New, +AlwaysOnTop +Owner, Suggested Remarks
Gui, 99:  Font, s12 w700, Verdana
Gui, 99:  Add, Button, x%ScreenWidthPointFive%  w%ScreenWidthFifteenPercent% Wrap gArray7 h30, Here are some suggested remarks:
Gui, 99:  Font, s10 w500, Verdana
Gui, 99:  Add, Button, x%ScreenWidthPointFive%  w%ScreenWidthFifteenPercent% Wrap gArray1, % Array[1]
if % Array[2] = ""{
}
else  
     Gui, 99: Add, Button, x%ScreenWidthPointFive%  w%ScreenWidthFifteenPercent% Wrap gArray2, % Array[2] 
if % Array[3] = ""{
}
else	 
     Gui, 99: Add, Button, x%ScreenWidthPointFive%  w%ScreenWidthFifteenPercent% Wrap gArray3, % Array[3]
if % Array[4] = ""{
}
else	 
     Gui, 99: Add, Button, x%ScreenWidthPointFive%  w%ScreenWidthFifteenPercent% Wrap gArray4, % Array[4]
if % Array[5] = ""{
}
else	
Gui, 99: Add, Button, x%ScreenWidthPointFive%  w%ScreenWidthFifteenPercent% Wrap gArray5, % Array[5] 
Gui, 99: Font, s12 bold, Verdana 
Gui, 99: Add, Button, x%ScreenWidthPointFive%  gArray6, Cancel
Gui, 99: Font
Gui, 99: Color, %CustomColor%
Gui, 99: +ToolWindow  ; Removes the Border and Task bar ico
Gui, 99: Show, x%WindowPosX% y%WindowPosY% w%ScreenWidthSixteenPercent%, Suggested Remarks
return 
}
}
	 
Array1:
WinGetPos, WindowPosX, WindowPosY, , , A, 
Gui, 99:Hide
SendInput % ATDate " " Array[1] " " Username
Clipboard = %PreviousClip%
Sleep 200
IniWrite, %WindowPosX%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniWrite, %WindowPosY%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
gosub RecordSuggestRemarks
Return

Array2:
WinGetPos, WindowPosX, WindowPosY, , , A, 
Gui, 99:Hide
SendInput % ATDate " " Array[2] " " Username
Clipboard = %PreviousClip%
Sleep 200
IniWrite, %WindowPosX%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniWrite, %WindowPosY%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
gosub RecordSuggestRemarks
Return

Array3:
WinGetPos, WindowPosX, WindowPosY, , , A, 
Gui, 99:Hide
SendInput % ATDate " " Array[3] " " Username
Clipboard = %PreviousClip%
Sleep 200
IniWrite, %WindowPosX%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniWrite, %WindowPosY%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
gosub RecordSuggestRemarks
Return

Array4:
WinGetPos, WindowPosX, WindowPosY, , , A, 
Gui, 99:Hide
SendInput % ATDate " " Array[4] " " Username
Clipboard = %PreviousClip%
Sleep 200
IniWrite, %WindowPosX%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniWrite, %WindowPosY%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
gosub RecordSuggestRemarks
Return

Array5:
WinGetPos, WindowPosX, WindowPosY, , , A, 
Gui, 99:Hide
SendInput % ATDate " " Array[5] " " Username
Clipboard = %PreviousClip%
Sleep 200
IniWrite, %WindowPosX%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniWrite, %WindowPosY%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
gosub RecordSuggestRemarks
Return

Array7:
Array6:
Gui, 99:Hide
WinGetPos, WindowPosX, WindowPosY, , , A, 
Clipboard = %PreviousClip%
Sleep 200
IniWrite, %WindowPosX%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosX
IniWrite, %WindowPosY%,   C:\Users\%Computername%\AHKPrefs.ini, Username, WindowPosY
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ¿                                  ;;
;;         Attorney Email Finder      ;;
;;              Ctrl + J              ;;
;;        Stores data in test.ini     ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;^j::   
;FormatTime, TimeStamp, R
;Gui, Destroy
;CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
;MouseGetPos, xpos, ypos 
;formattime, todaysdate, , MM/dd/yy 
;SendInput ^c
;ClipWait, .2
;TestString = %Clipboard%
;AttyEmailFinder()
;return

AttyEmailFinder()
{
TestString = %NewClipboard%
StringReplace, TestString, TestString, `- , , All                                        ; Removes all dashes.
StringReplace, TestString, TestString, `r`n, `, , All                                    ; Removes all hard returns. 
StringReplace, TestString, TestString, %A_Space% , , All ; Omits periods.                ; Removes all spaces, replaces with commas.
StringSplit, TestString, TestString, `, , . ; Omits periods.                             ; Splits into array at commas.

StringLeft, AttyString0, TestString0, 3  ; Stores first three characters.                ; Stores first three characters of string.
StringLeft, AttyString1, TestString1, 3  ; Stores first three characters.
StringLeft, AttyString2, TestString2, 3  ; Stores first three characters.
StringLeft, AttyString3, TestString3, 3  ; Stores first three characters.
StringLeft, AttyString4, TestString4, 3  ; Stores first three characters.
StringLeft, AttyString5, TestString5, 3  ; Stores first three characters.
StringLeft, AttyString6, TestString6, 3  ; Stores first three characters.
StringLeft, AttyString7, TestString7, 3  ; Stores first three characters.
StringLeft, AttyString8, TestString8, 3  ; Stores first three characters.
StringLeft, AttyString9, TestString9, 3  ; Stores first three characters.
StringLeft, AttyString10, TestString10,3 ; Stores first three characters.

ThreeString = %AttyString1% %AttyString2% %AttyString3% %AttyString4% %AttyString5% %AttyString6% %AttyString7% %AttyString8% %AttyString9% %AttyString10%
Sort, ThreeString, U D%A_Space% 
StringSplit, ThreeString, ThreeString, %A_Space% , . ; Omits periods.                             ; Splits into array at commas.


IniRead, AttyTest1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini,  Attorneys, %ThreeString1%      ; Compares attorney to .ini file.
IniRead, AttyTest2, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini,  Attorneys, %ThreeString2%
IniRead, AttyTest3, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini,  Attorneys, %ThreeString3%
IniRead, AttyTest4, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini,  Attorneys, %ThreeString4%
IniRead, AttyTest5, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini,  Attorneys, %ThreeString5%
IniRead, AttyTest6, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini,  Attorneys, %ThreeString6%
IniRead, AttyTest7, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini,  Attorneys, %ThreeString7%
IniRead, AttyTest8, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini,  Attorneys, %ThreeString8%
IniRead, AttyTest9, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini,  Attorneys, %ThreeString9%
IniRead, AttyTest10,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini, Attorneys, %ThreeString10%
IniRead, ATPartner, C:\Users\%Computername%\AHKPrefs.ini, Username, ATPartner

if AttyTest1 = Error                  ; If attorney is not an irregular one, sets AttyTest to 2aty team.
     AttyTest1 = 2%ThreeString1%             
if AttyTest2 = Error
     AttyTest2 = 2%ThreeString2%
if AttyTest3 = Error
     AttyTest3 = 2%ThreeString3%	 
if AttyTest4 = Error
     AttyTest4 = 2%ThreeString4%	 
if AttyTest5 = Error
     AttyTest5 = 2%ThreeString5%	 	 
if AttyTest6 = Error
     AttyTest6 = 2%ThreeString6%	 
if AttyTest7 = Error
     AttyTest7 = 2%ThreeString7%	 
if AttyTest8 = Error
     AttyTest8 = 2%ThreeString8%	 
if AttyTest9 = Error
     AttyTest9 = 2%ThreeString9%	 
if AttyTest10 = Error
     AttyTest10 = 2%ThreeString10%	
	 	 	 
StringLen, Atty1Len, AttyTest1         ; Gets the length of each string of the array.
StringLen, Atty2Len, AttyTest2
StringLen, Atty3Len, AttyTest3
StringLen, Atty4Len, AttyTest4
StringLen, Atty5Len, AttyTest5
StringLen, Atty6Len, AttyTest6
StringLen, Atty7Len, AttyTest7
StringLen, Atty8Len, AttyTest8
StringLen, Atty9Len, AttyTest9
StringLen, Atty10Len, AttyTest10

if Atty1Len > 30                       ; If string is greater than 30 characters, meaning a runaway/blank array, sets array to blank.
	AttyTest1 = ;
if Atty2Len > 30
	AttyTest2 = ;	
if Atty3Len > 30
	AttyTest3 = ;
if Atty4Len > 30
	AttyTest4 = ;
if Atty5Len > 30
	AttyTest5 = ;
if Atty6Len > 30
	AttyTest6 = ;
if Atty7Len > 30
	AttyTest7 = ;
if Atty8Len > 30
	AttyTest8 = ;
if Atty9Len > 30
	AttyTest9 = ;	
if Atty10Len > 30
	AttyTest10 = ;

if ThreeString0 == 1               ; If number of arrays is this number, only put this many in the copy/message box.
     {
TrayTip, Attorneys saved to clipboard., Paste into CC: field and drag to To: field.
;SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %ATPartner%
Sleep 2250
TrayTip
;SplashTextOff
gosub RecordAttyFinder
return
     }              
if ThreeString0 = 2
     {
TrayTip, Attorneys saved to clipboard., Paste into CC: field and drag to To: field.
;SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %ATPartner%
Sleep 2250
TrayTip
;SplashTextOff
gosub RecordAttyFinder
return
     }	
if ThreeString0 = 3
     {
	 TrayTip, Attorneys saved to clipboard., Paste into CC: field and drag to To: field.
;SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %ATPartner%
Sleep 2250
TrayTip
;SplashTextOff
gosub RecordAttyFinder
return
     }	
if ThreeString0 = 4
     {
	 TrayTip, Attorneys saved to clipboard., Paste into CC: field and drag to To: field.
;SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %ATPartner%
Sleep 2250
TrayTip
;SplashTextOff
gosub RecordAttyFinder
return
     }	
if ThreeString0 = 5
     {
	 TrayTip, Attorneys saved to clipboard., Paste into CC: field and drag to To: field.
;SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %ATPartner%
Sleep 2250
TrayTip
;SplashTextOff
gosub RecordAttyFinder
return
     }
if ThreeString0 = 6
     {
	 TrayTip, Attorneys saved to clipboard., Paste into CC: field and drag to To: field.
;SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %ATPartner%
Sleep 2250
TrayTip
;SplashTextOff
gosub RecordAttyFinder
return
     }
if ThreeString0 = 7
     {
	 TrayTip, Attorneys saved to clipboard., Paste into CC: field and drag to To: field.
;SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %ATPartner%
Sleep 2250
TrayTip
;SplashTextOff
gosub RecordAttyFinder
return
     }
if ThreeString0 = 8
     {
	 TrayTip, Attorneys saved to clipboard., Paste into CC: field and drag to To: field.
;SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %AttyTest8%, %ATPartner%
Sleep 2250
TrayTip
;SplashTextOff
gosub RecordAttyFinder
return
     }
if ThreeString0 = 9
     {
	 TrayTip, Attorneys saved to clipboard., Paste into CC: field and drag to To: field.
;SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %AttyTest8%, %AttyTest9%, %ATPartner%
Sleep 2250
TrayTip
;SplashTextOff
gosub RecordAttyFinder
return
     }
if ThreeString0 = 10
     {
	 TrayTip, Attorneys saved to clipboard., Paste into CC: field and drag to To: field.
;SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %AttyTest8%, %AttyTest9%, %AttyTest10%, %ATPartner%
Sleep 2250
TrayTip
;SplashTextOff
gosub RecordAttyFinder
return
     }
else 
TrayTip, Attorneys saved to clipboard., Paste into CC: field and drag to To: field.
;SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %ATPartner%
Sleep 2250
TrayTip
;SplashTextOff
gosub RecordAttyFinder
return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;             Quick Date             ;;
;;              Ctrl + ;              ;;
;;               Passive              ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#IfWinNotActive ahk_exe EXCEL.EXE
QuickDate()
{
FormatTime, CurrentDateTime,, MM/dd/yyyy
;MsgBox, Not in Excel window.
OldClipboard = %Clipboard%
Sleep 50
Clipboard =  ;
Clipboard = %CurrentDateTime%
Sleep 50
SendInput ^v
Sleep 250
Clipboard = %OldClipboard%
Sleep 100
gosub RecordDateShortcut
SendInput {Ctrl up}
return
}
#IfWinActive

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;           Crazy COM Stuff          ;;
;;              Who knows.            ;;
;;Record Opener/EFS Filler/Fees Login ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

EFSPayLogIn:
gosub CloseDrawer
TrayTip, Getting started..., Starting the EFS Fee Login process...
YourSearchStr := "loginLogout"
IniRead, EFSPayEmail,    C:\Users\%Computername%\AHKPrefs.ini, Username, EFSPayEmail
IniRead, EFSPayPassword, C:\Users\%Computername%\AHKPrefs.ini, Username, EFSPayPassword
EFSPayEmail = %EFSPayEmail%
EFSPayPassword  = %EFSPayPassword%
OutputVar = https://fees.uspto.gov/pay/
YourSearchStr := "loginLogout"
ie := ComObjCreate("InternetExplorer.Application")
ie.Visible := False
;params := [OutputVar, 4096]
params := [OutputVar, 32]
ie.Navigate(params*)
	While IE.Busy ; simple wait for page to load
	Sleep, 100 ; 1/10 second
ie.Document.All.loginLogout.Click()
	While IE.Busy ; simple wait for page to load
	Sleep, 100 ; 1/10 second
	;IELoad(wb)
ie.Document.All.dijit_form_Button_8_label.Click()
	While IE.Busy ; simple wait for page to load
	Sleep, 100 ; 1/10 second
	;IELoad(wb)
TrayTip, Please wait..., Signing into EFS...
ie.Quit() ; this is if you want the ie browser to close once the string as been found
Sleep 5000
ie := ComObjCreate("InternetExplorer.Application")
ie.Visible := False
;params := [OutputVar, 4096]
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ie.Document.All.headerSignInLink.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ie.Document.All.uniqName_11_9.Value := EFSPayEmail
ie.Document.All.uniqName_11_10.Value := EFSPayPassword
Sleep 250
ie.Document.All.dijit_form_Button_10.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
Sleep 5000
ie.Quit() ; this is if you want the ie browser to close once the string as been found
TrayTip, And we're done!, You should now (hopefully) be signed into EFS Fees.
gosub RecordEFSLogin
return		

EFSFill:
IniRead, EFSFirst,C:\Users\%Computername%\AHKPrefs.ini, Username, EFSFirst
IniRead, EFSLast, C:\Users\%Computername%\AHKPrefs.ini, Username, EFSLast
IniRead, EFSEmail,C:\Users\%Computername%\AHKPrefs.ini, Username, EFSEmail
EFSFirst = %EFSFirst%
EFSLast  = %EFSLast%
EFSEmail = %EFSEmail%
OutputVar = https://efs.uspto.gov/EFSWebUIRegistered/EFSWebRegistered#
ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Document.All.radiogroup2.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ie.Document.All.certname1.Value := EFSFirst
ie.Document.All.certname2.Value := EFSLast
ie.Document.All.certaddr1.Value := EFSEmail
ie.Document.getElementById("My workplace").Click()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ie.Navigate(params*)
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ie.Document.All.pkiSaveType_1.Click()
Sleep, 100 ; 1/10 second
Sleep 200
ie.Document.All.retrievepract.Click()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
SendInput {Space}
Sleep 1000
gosub RecordEFSFill
return		


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;            Achievements            ;;
;;               Passive              ;;
;;     Writes to User's .ini file     ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

RecordKeystrokes:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, Keystrokes, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, Keystrokes
IniRead, KeystrokesH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, Keystrokes
StringLen, NameLen, Username
StringLen, DateLen, ATDate
KeystrokesSaved := (NameLen + DateLen + 3)
Keystrokes+=%KeystrokesSaved%
KeystrokesSavedH := (NameLen + DateLen + 3)
KeystrokesH+=%KeystrokesSavedH%
IniWrite, %Keystrokes%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, Keystrokes
IniWrite, %KeystrokesH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, Keystrokes
return

RecordDateShortcut:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, DateShortcut, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, DateShortcut
IniRead, DateShortcutH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, DateShortcut
DateShortcut++
DateShortcutH++
IniWrite, %DateShortcut%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, DateShortcut
IniWrite, %DateShortcutH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, DateShortcut
return

RecordAttyFinder:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, AttyFinder, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AttyFinder
IniRead, AttyFinderH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AttyFinder
AttyFinder++
AttyFinderH++
IniWrite, %AttyFinder%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AttyFinder
IniWrite, %AttyFinderH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AttyFinder
return

RecordCalExtend:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, CalExtend, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CalExtend
IniRead, CalExtendH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, CalExtend
CalExtend++
CalExtendH++
IniWrite, %CalExtend%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CalExtend
IniWrite, %CalExtendH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, CalExtend
IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
return

RecordSysSwitch:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, SysSwitch, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SysSwitch
IniRead, SysSwitchH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, SysSwitch
SysSwitch++
SysSwitchH++
IniWrite, %SysSwitch%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SysSwitch
IniWrite, %SysSwitchH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, SysSwitch
return

RecordExcelHLink:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, ExcelHLink, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ExcelHLink
IniRead, ExcelHLinkH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, ExcelHLink
ExcelHLink++
ExcelHLinkH++
IniWrite, %ExcelHLink%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ExcelHLink
IniWrite, %ExcelHLinkH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, ExcelHLink
return

RecordEFSCertFinder:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, EFSCertFinder, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinderH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSCertFinder
EFSCertFinder++
EFSCertFinderH++
IniWrite, %EFSCertFinder%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSCertFinder
IniWrite, %EFSCertFinderH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSCertFinder
return

RecordCopyAction:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, CopyAction, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CopyAction
IniRead, CopyActionH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, CopyAction
CopyAction++
CopyActionH++
IniWrite, %CopyAction%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CopyAction
IniWrite, %CopyActionH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, CopyAction
return

RecordPasteAction:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, PasteAction, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, PasteAction
IniRead, PasteActionH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, PasteAction
PasteAction++
PasteActionH++
IniWrite, %PasteAction%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, PasteAction
IniWrite, %PasteActionH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, PasteAction
return

RecordSuggestRemarks:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, SuggestRemarks, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarksH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, SuggestRemarks
SuggestRemarks++
SuggestRemarksH++
IniWrite, %SuggestRemarks%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SuggestRemarks
IniWrite, %SuggestRemarksH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, SuggestRemarks
return

RecordClientCodeIE:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, ClientCodeIE, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIEH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, ClientCodeIE
ClientCodeIE++
ClientCodeIEH++
IniWrite, %ClientCodeIE%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
IniWrite, %ClientCodeIEH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, ClientCodeIE
return

RecordEFSFill:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, EFSFill, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSFill
IniRead, EFSFillH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSFill
EFSFill++
EFSFillH++
IniWrite, %EFSFill%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSFill
IniWrite, %EFSFillH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSFill
return

RecordEFSLogin:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, EFSLogin, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSLogin
IniRead, EFSLoginH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSLogin
EFSLogin++
EFSLoginH++
IniWrite, %EFSLogin%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSLogin
IniWrite, %EFSLoginH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSLogin
return

RecordHotCornerBL:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, AHotCornerBL, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBL
IniRead, AHotCornerBLH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AHotCornerBL
AHotCornerBL++
AHotCornerBLH++
IniWrite, %AHotCornerBL%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBL
IniWrite, %AHotCornerBLH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AHotCornerBL
return

RecordHotCornerTR:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, AHotCornerTR, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerTR
IniRead, AHotCornerTRH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AHotCornerTR
AHotCornerTR++
AHotCornerTRH++
IniWrite, %AHotCornerTR%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerTR
IniWrite, %AHotCornerTRH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AHotCornerTR
return

RecordHotCornerBR:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, AHotCornerBR, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBR
IniRead, AHotCornerBRH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AHotCornerBR
AHotCornerBR++
AHotCornerBRH++
IniWrite, %AHotCornerBR%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBR
IniWrite, %AHotCornerBRH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AHotCornerBR
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;       EFS Cert/Password Finder     ;;
;;              !ATY Team             ;;
;;               Passive              ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GetPassword:
	if Option7 = 1
		{
		Send ^a
		Sleep 200
		Send ^c
		Sleep 500
		IniRead, Password, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\EFS.ini, EFS, %Clipboard%
		Sleep 500
		TrayTip, %Clipboard%,%Password%
		;MsgBox, %Password%
		Send {Tab}
		Sleep 1250
		Send {Tab}
		Send ^a
		Sleep 200
		Send {Delete}
		Sleep 200
		Send %Password%
		Sleep 500		
		Clipboard = 
		Sleep 3000
		TrayTip
		gosub RecordEFSCertFinder
		return
		}
	else if Option7 = 0
		{
		MsgBox, Function disabled. Press Control+CapsLock to update settings.
		return
		}
	else
		return	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;¿                                                           ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#If WinActive("ahk_class IEFrame") || WinActive("ahk_class SunAwtFrame")

::!JPL::
SendInput H:\USPTO\Josepher.Li.epf
Clipboard = H:\USPTO\Josepher.Li.epf
gosub, GetPassword
return

::!BHL::
SendInput W:\USPTO\Ben.Liu.epf
Clipboard = W:\USPTO\Ben.Liu.epf
gosub, GetPassword
return

::!CDD::
SendInput S:\USPTO\Casey.Donahoe.epf
Clipboard = S:\USPTO\Casey.Donahoe.epf
gosub, GetPassword
return

::!JJC::
SendInput H:\USPTO\Jeremy.Carney.epf
Clipboard = H:\USPTO\Jeremy.Carney.epf
gosub, GetPassword
return

::!JZA::
SendInput H:\USPTO\Jessica.Achtsam.epf
Clipboard = H:\USPTO\Jessica.Achtsam.epf
gosub, GetPassword
return

::!NJL::
SendInput H:\USPTO\Nathan.Lee.epf
Clipboard = H:\USPTO\Nathan.Lee.epf
gosub, GetPassword
return

::!SYW::
SendInput H:\USPTO\Sabrina.Wang.epf
Clipboard = H:\USPTO\Sabrina.Wang.epf
gosub, GetPassword
return

::!AKD::
SendInput H:\USPTO\Angela.Dremann.epf
Clipboard = H:\USPTO\Angela.Dremann.epf
gosub, GetPassword
return

::!ZJH::
SendInput H:\USPTO\Zach.Hong.epf
Clipboard = H:\USPTO\Zach.Hong.epf
gosub, GetPassword
return

::!AUK::
SendInput H:\USPTO\Alexander.Kappner.epf
Clipboard = H:\USPTO\Alexander.Kappner.epf
gosub, GetPassword
return

::!AJG::
SendInput H:\USPTO\Adam.Gilbert.epf
Clipboard = H:\USPTO\Adam.Gilbert.epf
gosub, GetPassword
return

::!AXJ::
SendInput H:\USPTO\Agnes.Juang.epf
Clipboard = H:\USPTO\Agnes.Juang.epf
gosub, GetPassword
return

::!AJS::
SendInput H:\USPTO\Albert.Sueiras.epf
Clipboard = H:\USPTO\Albert.Sueiras.epf
gosub, GetPassword
return

::!AJM::
SendInput H:\USPTO\Alex.Martinez.epf
Clipboard = H:\USPTO\Alex.Martinez.epf
gosub, GetPassword
return

::!AZ4::
SendInput H:\USPTO\Allison.Weimer.epf
Clipboard = H:\USPTO\Allison.Weimer.epf
gosub, GetPassword
return

::!AGB::
SendInput H:\USPTO\Allyson.Brown.epf
Clipboard = H:\USPTO\Allyson.Brown.epf
gosub, GetPassword
return

::!ACC::
SendInput H:\USPTO\Amy.Chun.epf
Clipboard = H:\USPTO\Amy.Chun.epf
gosub, GetPassword
return

::!AMD::
SendInput H:\USPTO\Andrew.Douglas.epf
Clipboard = H:\USPTO\Andrew.Douglas.epf
gosub, GetPassword
return

::!AIK::
SendInput H:\USPTO\Andrew.Kimmel.epf
Clipboard = H:\USPTO\Andrew.Kimmel.epf
gosub, GetPassword
return

::!AWL::
SendInput H:\USPTO\Andrew.Lloyd.epf
Clipboard = H:\USPTO\Andrew.Lloyd.epf
gosub, GetPassword
return

::!AVS::
SendInput H:\USPTO\Andrew.Schwaab.epf
Clipboard = H:\USPTO\Andrew.Schwaab.epf
gosub, GetPassword
return

::!AHS::
SendInput H:\USPTO\Andrew.Simpson.epf
Clipboard = H:\USPTO\Andrew.Simpson.epf
gosub, GetPassword
return

::!ASR::
SendInput H:\USPTO\Art Rose.epf
Clipboard = H:\USPTO\Art Rose.epf
gosub, GetPassword
return

::!BJE::
SendInput H:\USPTO\Ben.Everton.epf
Clipboard = H:\USPTO\Ben.Everton.epf
gosub, GetPassword
return

::!BAK::
SendInput H:\USPTO\Benajmain.Katzenellenbogen.epf
Clipboard = H:\USPTO\Benajmain.Katzenellenbogen.epf
gosub, GetPassword
return

::!WBB::
SendInput H:\USPTO\Bill.Bunker.epf
Clipboard = H:\USPTO\Bill.Bunker.epf
gosub, GetPassword
return

::!WHS::
SendInput H:\USPTO\Bill.Shreve.epf
Clipboard = H:\USPTO\Bill.Shreve.epf
gosub, GetPassword
return

::!BRB::
SendInput H:\USPTO\Brent Babcock.epf
Clipboard = H:\USPTO\Brent Babcock.epf
gosub, GetPassword
return

::!BMD::
SendInput H:\USPTO\Brent Dougal.epf
Clipboard = H:\USPTO\Brent Dougal.epf
gosub, GetPassword
return

::!BCC::
SendInput H:\USPTO\Brian Claassen.epf
Clipboard = H:\USPTO\Brian Claassen.epf
gosub, GetPassword
return

::!BZS::
SendInput H:\USPTO\Bridget Smith.epf
Clipboard = H:\USPTO\Bridget Smith.epf
gosub, GetPassword
return

::!BSI::
SendInput H:\USPTO\Bruce.Itchkawitz.epf
Clipboard = H:\USPTO\Bruce.Itchkawitz.epf
gosub, GetPassword
return

::!BWW::
SendInput H:\USPTO\Bryan.Wahl.epf
Clipboard = H:\USPTO\Bryan.Wahl.epf
gosub, GetPassword
return

::!CKL::
SendInput H:\USPTO\Catherine.Lee.epf
Clipboard = H:\USPTO\Catherine.Lee.epf
gosub, GetPassword
return

::!CYL::
SendInput H:\USPTO\Chang.Lim.epf
Clipboard = H:\USPTO\Chang.Lim.epf
gosub, GetPassword
return

::!CSC::
SendInput H:\USPTO\Che.Chereskin.epf
Clipboard = H:\USPTO\Che.Chereskin.epf
gosub, GetPassword
return

::!CXR::
SendInput H:\USPTO\Christopher Ross.epf
Clipboard = H:\USPTO\Christopher Ross.epf
gosub, GetPassword
return

::!CSS::
SendInput H:\USPTO\Craig.Summers.epf
Clipboard = H:\USPTO\Craig.Summers.epf
gosub, GetPassword
return

::!CRH::
SendInput H:\USPTO\Curtis.Huffmire.epf
Clipboard = H:\USPTO\Curtis.Huffmire.epf
gosub, GetPassword
return

::!CCD::
SendInput H:\USPTO\Curtiss.Dosier.epf
Clipboard = H:\USPTO\Curtiss.Dosier.epf
gosub, GetPassword
return

::!DJH::
SendInput H:\USPTO\Damien.Howard.epf
Clipboard = H:\USPTO\Damien.Howard.epf
gosub, GetPassword
return

::!DEA::
SendInput H:\USPTO\Dan.Altman.epf
Clipboard = H:\USPTO\Dan.Altman.epf
gosub, GetPassword
return

::!DJF::
SendInput H:\USPTO\Dan.Fischer.epf
Clipboard = H:\USPTO\Dan.Fischer.epf
gosub, GetPassword
return

::!DVG::
SendInput H:\USPTO\Daniel.Gibson.epf
Clipboard = H:\USPTO\Daniel.Gibson.epf
gosub, GetPassword
return

::!DLO::
SendInput H:\USPTO\Darrell.Olson.epf
Clipboard = H:\USPTO\Darrell.Olson.epf
gosub, GetPassword
return

::!DSB::
SendInput H:\USPTO\David.Barnhill.epf
Clipboard = H:\USPTO\David.Barnhill.epf
gosub, GetPassword
return

::!DMD::
SendInput H:\USPTO\David.Dremann.epf
Clipboard = H:\USPTO\David.Dremann.epf
gosub, GetPassword
return

::!DGK::
SendInput H:\USPTO\David.G.Kim.epf
Clipboard = H:\USPTO\David.G.Kim.epf
gosub, GetPassword
return

::!DGJ::
SendInput H:\USPTO\David.Jankowski.epf
Clipboard = H:\USPTO\David.Jankowski.epf
gosub, GetPassword
return

::!DRS::
SendInput H:\USPTO\David.Schmidt.epf
Clipboard = H:\USPTO\David.Schmidt.epf
gosub, GetPassword
return

::!DVK::
SendInput H:\USPTO\David.T.Kim.epf
Clipboard = H:\USPTO\David.T.Kim.epf
gosub, GetPassword
return

::!DRB::
SendInput H:\USPTO\Derek.Bayles.epf
Clipboard = H:\USPTO\Derek.Bayles.epf
gosub, GetPassword
return

::!DXD::
SendInput H:\USPTO\Devanie.Dufour.epf
Clipboard = H:\USPTO\Devanie.Dufour.epf 
gosub, GetPassword
return

::!DGM::
SendInput H:\USPTO\Doug.Muehlhauser.epf
Clipboard = H:\USPTO\Doug.Muehlhauser.epf
gosub, GetPassword
return

::!DXW::
SendInput H:\USPTO\Douglas.Wentzel.epf
Clipboard = H:\USPTO\Douglas.Wentzel.epf
gosub, GetPassword
return

::!EAS::
SendInput H:\USPTO\Ed.Schlatter.epf
Clipboard = H:\USPTO\Ed.Schlatter.epf
gosub, GetPassword
return

::!GVH::
SendInput H:\USPTO\Gerard.vonHoffmann.epf
Clipboard = H:\USPTO\Gerard.vonHoffmann.epf
gosub, GetPassword
return

::!GLN::
SendInput H:\USPTO\Glen.Nuttall.epf
Clipboard = H:\USPTO\Glen.Nuttall.epf
gosub, GetPassword
return

::!HXM::
SendInput H:\USPTO\Hans.Mayer.epf
Clipboard = H:\USPTO\Hans.Mayer.epf
gosub, GetPassword
return

::!HZS::
SendInput H:\USPTO\Harnik.Shukla.epf
Clipboard = H:\USPTO\Harnik.Shukla.epf
gosub, GetPassword
return

::!HCS::
SendInput H:\USPTO\Hochan.Song.epf
Clipboard = H:\USPTO\Hochan.Song.epf
gosub, GetPassword
return

::!IAL::
SendInput H:\USPTO\Irfan.Lateef.epf
Clipboard = H:\USPTO\Irfan.Lateef.epf
gosub, GetPassword
return

::!JUP::
SendInput H:\USPTO\Jacob.Peterson.epf
Clipboard = H:\USPTO\Jacob.Peterson.epf
gosub, GetPassword
return

::!JCB::
SendInput H:\USPTO\Jared.Bunker.epf
Clipboard = H:\USPTO\Jared.Bunker.epf
gosub, GetPassword
return

::!JZK::
SendInput H:\USPTO\Jarom.Kesler.epf
Clipboard = H:\USPTO\Jarom.Kesler.epf 
gosub, GetPassword
return

::!JAG::
SendInput H:\USPTO\Jason.Gersting.epf
Clipboard = H:\USPTO\Jason.Gersting.epf
gosub, GetPassword
return

::!JCS::
SendInput H:\USPTO\Jason.Swartz.epf
Clipboard = H:\USPTO\Jason.Swartz.epf
gosub, GetPassword
return

::!JUH::
SendInput H:\USPTO\Jeffery.Hallstrom.epf
Clipboard = H:\USPTO\Jeffery.Hallstrom.epf
gosub, GetPassword
return

::!JYC::
SendInput H:\USPTO\Joan.Chan.epf
Clipboard = :\USPTO\Joan.Chan.epf
gosub, GetPassword
return

::!HSU::
SendInput H:\USPTO\Johannes.Hsu.epf
Clipboard = H:\USPTO\Johannes.Hsu.epf
gosub, GetPassword
return

::!JRK::
SendInput H:\USPTO\John King.epf
Clipboard = H:\USPTO\John King.epf
gosub, GetPassword
return

::!JMG::
SendInput H:\USPTO\John.Grover.epf
Clipboard = H:\USPTO\John.Grover.epf
gosub, GetPassword
return

::!JHS::
SendInput H:\USPTO\John.Sadlik.epf
Clipboard = H:\USPTO\John.Sadlik.epf
gosub, GetPassword
return

::!JBS::
SendInput H:\USPTO\John.Sganga.epf
Clipboard = H:\USPTO\John.Sganga.epf
gosub, GetPassword
return

::!JWG::
SendInput H:\USPTO\Jon Gurka.epf
Clipboard = H:\USPTO\Jon Gurka.epf
gosub, GetPassword
return

::!JUC::
SendInput H:\USPTO\Jordan.Cox.epf
Clipboard = H:\USPTO\Jordan.Cox.epf
gosub, GetPassword
return

::!JYS::
SendInput H:\USPTO\Joshua Stowell.epf
Clipboard = H:\USPTO\Joshua Stowell.epf
gosub, GetPassword
return

::!JDB::
SendInput H:\USPTO\Joshua.Berk.epf
Clipboard = H:\USPTO\Joshua.Berk.epf
gosub, GetPassword
return

::!JJG::
SendInput H:\USPTO\Justin.Gillett.epf
Clipboard = H:\USPTO\Justin.Gillett.epf
gosub, GetPassword
return

::!KJL::
SendInput H:\USPTO\Karen.Lenker.epf
Clipboard = H:\USPTO\Karen.Lenker.epf
gosub, GetPassword
return

::!KAD::
SendInput H:\USPTO\Karoline.Delaney.epf
Clipboard = H:\USPTO\Karoline.Delaney.epf
gosub, GetPassword
return

::!KXA::
SendInput H:\USPTO\Kazuo.Aoki.epf
Clipboard = H:\USPTO\Kazuo.Aoki.epf
gosub, GetPassword
return

::!KZL::
SendInput H:\USPTO\Keith.Lim.epf
Clipboard = H:\USPTO\Keith.Lim.epf
gosub, GetPassword
return

::!KNS::
SendInput H:\USPTO\Kent.Shum.epf
Clipboard = H:\USPTO\Kent.Shum.epf
gosub, GetPassword
return

::!LDS::
SendInput H:\USPTO\Lance.Smemoe.epf
Clipboard = H:\USPTO\Lance.Smemoe.epf
gosub, GetPassword
return

::!LXK::
SendInput H:\USPTO\Lauren.Keller.epf
Clipboard = H:\USPTO\Lauren.Keller.epf
gosub, GetPassword
return

::!LGR::
SendInput H:\USPTO\Lavanya.Rau.epf
Clipboard = H:\USPTO\Lavanya.Rau.epf
gosub, GetPassword
return

::!LHL::
SendInput H:\USPTO\Linda.Liu.epf
Clipboard = H:\USPTO\Linda.Liu.epf
gosub, GetPassword
return

::!LLX::
SendInput H:\USPTO\Linda.Xu.epf
Clipboard = H:\USPTO\Linda.Xu.epf
gosub, GetPassword
return

::!LLY::
SendInput H:\USPTO\Lori.Yamato.epf
Clipboard = H:\USPTO\Lori.Yamato.epf
gosub, GetPassword
return

::!MRB::
SendInput H:\USPTO\Mark Benedict.epf
Clipboard = H:\USPTO\Mark Benedict.epf
gosub, GetPassword
return

::!MJG::
SendInput H:\USPTO\Mark Gallagher.epf
Clipboard = H:\USPTO\Mark Gallagher.epf
gosub, GetPassword
return

::!MED::
SendInput H:\USPTO\Mark.Davis.epf
Clipboard = H:\USPTO\Mark.Davis.epf
gosub, GetPassword
return

::!MRZ::
SendInput H:\USPTO\Marko.Zoretic.epf
Clipboard = H:\USPTO\Marko.Zoretic.epf
gosub, GetPassword
return

::!MPB::
SendInput H:\USPTO\Michael.Burns.epf
Clipboard = H:\USPTO\Michael.Burns.epf
gosub, GetPassword
return

::!MRC::
SendInput H:\USPTO\Michael.Christensen.epf
Clipboard = H:\USPTO\Michael.Christensen.epf
gosub, GetPassword
return

::!MAG::
SendInput H:\USPTO\Michael.Guiliana.epf
Clipboard = H:\USPTO\Michael.Guiliana.epf
gosub, GetPassword
return

::!MCL::
SendInput H:\USPTO\Mike.Lee.epf
Clipboard = H:\USPTO\Mike.Lee.epf
gosub, GetPassword
return

::!MCK::
SendInput H:\USPTO\Mincheol.Kim.epf
Clipboard = H:\USPTO\Mincheol.Kim.epf
gosub, GetPassword
return

::!NMZ::
SendInput H:\USPTO\Nicholas.Zovko.epf
Clipboard = H:\USPTO\Nicholas.Zovko.epf
gosub, GetPassword
return

::!NXB::
SendInput H:\USPTO\Nira.Brand.epf
Clipboard = H:\USPTO\Nira.Brand.epf
gosub, GetPassword
return

::!NAM::
SendInput H:\USPTO\Nora.Marachelian.epf
Clipboard = H:\USPTO\Nora.Marachelian.epf
gosub, GetPassword
return

::!OAM::
SendInput H:\USPTO\Omar.AlMesned.epf
Clipboard = H:\USPTO\Omar.AlMesned.epf
gosub, GetPassword
return

::!PNC::
SendInput H:\USPTO\Paul.Conover.epf
Clipboard = H:\USPTO\Paul.Conover.epf
gosub, GetPassword
return

::!PDO::
SendInput H:\USPTO\Perry.Oldham.epf
Clipboard = H:\USPTO\Perry.Oldham.epf
gosub, GetPassword
return

::!PQT::
SendInput H:\USPTO\Peter.Tong.epf
Clipboard = H:\USPTO\Peter.Tong.epf
gosub, GetPassword
return

::!PMN::
SendInput H:\USPTO\Philip.Nelson.epf
Clipboard = H:\USPTO\Philip.Nelson.epf
gosub, GetPassword
return

::!RNN::
SendInput H:\USPTO\Rabi.Narula.epf
Clipboard = H:\USPTO\Rabi.Narula.epf
gosub, GetPassword
return

::!RDS::
SendInput H:\USPTO\Raymond.Smith.epf
Clipboard = H:\USPTO\Raymond.Smith.epf
gosub, GetPassword
return

::!RJR::
SendInput H:\USPTO\Robb.Roby.epf
Clipboard = H:\USPTO\Robb.Roby.epf
gosub, GetPassword
return

::!ROS::
SendInput H:\USPTO\Ron.Schoenbaum.epf
Clipboard = H:\USPTO\Ron.Schoenbaum.epf
gosub, GetPassword
return

::!RMJ::
SendInput H:\USPTO\Russell.Jeide.epf
Clipboard = H:\USPTO\Russell.Jeide.epf
gosub, GetPassword
return

::!SHL::
SendInput H:\USPTO\Sabing.Lee.epf
Clipboard = H:\USPTO\Sabing.Lee.epf
gosub, GetPassword
return

::!SAM::
SendInput H:\USPTO\Salima Merani.epf
Clipboard = H:\USPTO\Salima Merani.epf
gosub, GetPassword
return

::!SZC::
SendInput H:\USPTO\Scott.Cromar.epf
Clipboard = H:\USPTO\Scott.Cromar.epf
gosub, GetPassword
return

::!SXR::
SendInput H:\USPTO\Scott.Raevsky.epf
Clipboard = H:\USPTO\Scott.Raevsky.epf
gosub, GetPassword
return

::!SXA::
SendInput H:\USPTO\Sean.Ambrosius.epf
Clipboard = H:\USPTO\Sean.Ambrosius.epf
gosub, GetPassword
return

::!SXL::
SendInput H:\USPTO\Shannon.Lam.epf
Clipboard = H:\USPTO\Shannon.Lam.epf
gosub, GetPassword
return

::!SNS::
SendInput H:\USPTO\Sheila Swaroop.epf
Clipboard = H:\USPTO\Sheila Swaroop.epf
gosub, GetPassword
return

::!SCJ::
SendInput H:\USPTO\Steve.Jensen.epf
Clipboard = H:\USPTO\Steve.Jensen.epf
gosub, GetPassword
return

::!SPR::
SendInput H:\USPTO\Steven Ruden.epf
Clipboard = H:\USPTO\Steven Ruden.epf
gosub, GetPassword
return

::!SJN::
SendInput H:\USPTO\Steven.Nataupsky.epf
Clipboard = H:\USPTO\Steven.Nataupsky.epf
gosub, GetPassword
return

::!TXN::
SendInput H:\USPTO\Tak.Nishimura.epf
Clipboard = H:\USPTO\Tak.Nishimura.epf
gosub, GetPassword
return

::!TMC::
SendInput H:\USPTO\Ted Cannon.epf
Clipboard = H:\USPTO\Ted Cannon.epf
gosub, GetPassword
return

::!TKT::
SendInput H:\USPTO\Terry.Tullis.epf
Clipboard = H:\USPTO\Terry.Tullis.epf
gosub, GetPassword
return

::!TGP::
SendInput H:\USPTO\Theodore.Papagiannis.epf
Clipboard = H:\USPTO\Theodore.Papagiannis.epf
gosub, GetPassword
return

::!TYY::
SendInput H:\USPTO\Thomas.Yee.epf
Clipboard = H:\USPTO\Thomas.Yee.epf
gosub, GetPassword
return

::!VZB::
SendInput H:\USPTO\Vikas.Bhargava.epf
Clipboard = H:\USPTO\Vikas.Bhargava.epf
gosub, GetPassword
return

::!VSL::
SendInput H:\USPTO\Vladimir.Lozan.epf
Clipboard = H:\USPTO\Vladimir.Lozan.epf
gosub, GetPassword
return

::!JYW::
SendInput H:\USPTO\YueJoyWang.epf
Clipboard = H:\USPTO\YueJoyWang.epf
gosub, GetPassword
return

::!ZAG::
SendInput H:\USPTO\Zachary.Glantz.epf
Clipboard = H:\USPTO\Zachary.Glantz.epf
gosub, GetPassword
return

::!ABP::
SendInput S:\USPTO\Adam.Powell.epf
Clipboard = S:\USPTO\Adam.Powell.epf
gosub, GetPassword
return

::!AEM::
SendInput S:\USPTO\Andrew.Morrell.epf
Clipboard = S:\USPTO\Andrew.Morrell.epf
gosub, GetPassword
return

::!BBA::
SendInput S:\USPTO\Ben.Anger.epf
Clipboard = S:\USPTO\Ben.Anger.epf
gosub, GetPassword
return

::!BSG::
SendInput S:\USPTO\Brenden.Gingrich.epf
Clipboard = S:\USPTO\Brenden.Gingrich.epf
gosub, GetPassword
return

::!PCS::
SendInput S:\USPTO\Chris Steinhardt.epf
Clipboard = S:\USPTO\Chris Steinhardt.epf
gosub, GetPassword
return

::!CMD::
SendInput S:\USPTO\Chris.DiLeo.epf
Clipboard = S:\USPTO\Chris.DiLeo.epf
gosub, GetPassword
return

::!CLS::
SendInput S:\USPTO\Claine.Snow.epf
Clipboard = S:\USPTO\Claine.Snow.epf
gosub, GetPassword
return

::!DOH::
SendInput S:\USPTO\Dan.Hart.epf
Clipboard = S:\USPTO\Dan.Hart.epf
gosub, GetPassword
return

::!DKY::
SendInput S:\USPTO\Dan.Yarbrough.epf
Clipboard = S:\USPTO\Dan.Yarbrough.epf
gosub, GetPassword
return

::!DPH::
SendInput S:\USPTO\Daniel Hughes.epf
Clipboard = S:\USPTO\Daniel Hughes.epf
gosub, GetPassword
return

::!DAK::
SendInput S:\USPTO\Daniel.Kamkar.epf
Clipboard = S:\USPTO\Daniel.Kamkar.epf
gosub, GetPassword
return

::!DZD::
SendInput S:\USPTO\David.Dang.epf
Clipboard = S:\USPTO\David.Dang.epf
gosub, GetPassword
return

::!DPK::
SendInput S:\USPTO\David.Kujawa.epf
Clipboard = S:\USPTO\David.Kujawa.epf
gosub, GetPassword
return

::!DCD::
SendInput S:\USPTO\Derek.Dailey.epf
Clipboard = S:\USPTO\Derek.Dailey.epf
gosub, GetPassword
return

::!DSH::
SendInput S:\USPTO\Drew.Hamilton.epf
Clipboard = S:\USPTO\Drew.Hamilton.epf
gosub, GetPassword
return

::!EMN::
SendInput S:\USPTO\Eric Nelson.epf
Clipboard = S:\USPTO\Eric Nelson.epf
gosub, GetPassword
return

::!ESF::
SendInput S:\USPTO\Eric.Furman.epf
Clipboard = S:\USPTO\Eric.Furman.epf
gosub, GetPassword
return

::!FTH::
SendInput S:\USPTO\Fred.Hale.epf
Clipboard = S:\USPTO\Fred.Hale.epf
gosub, GetPassword
return

::!FAN::
SendInput S:\USPTO\Fred.Nicholson.epf
Clipboard = S:\USPTO\Fred.Nicholson.epf
gosub, GetPassword
return

::!GAH::
SendInput S:\USPTO\Greg.Hermanson.epf
Clipboard = S:\USPTO\Greg.Hermanson.epf
gosub, GetPassword
return

::!GXM::
SendInput S:\USPTO\Greg.Munchinsky.epf
Clipboard = S:\USPTO\Greg.Munchinsky.epf
gosub, GetPassword
return

::!HZC::
SendInput S:\USPTO\Heungsoo.Choi.epf
Clipboard = S:\USPTO\Heungsoo.Choi.epf
gosub, GetPassword
return

::!IWG::
SendInput S:\USPTO\Ian Gillies.epf
Clipboard = S:\USPTO\Ian Gillies.epf
gosub, GetPassword
return

::!JFH::
SendInput S:\USPTO\James.Herkenhoff.epf
Clipboard = S:\USPTO\James.Herkenhoff.epf
gosub, GetPassword
return

::!JQD::
SendInput S:\USPTO\Jane.Dai.epf
Clipboard = S:\USPTO\Jane.Dai.epf
gosub, GetPassword
return

::!JQX::
SendInput S:\USPTO\Jane.Xia.epf
Clipboard = S:\USPTO\Jane.Xia.epf
gosub, GetPassword
return

::!JJJ::
SendInput S:\USPTO\Jason Jardine.epf
Clipboard = S:\USPTO\Jason Jardine.epf
gosub, GetPassword
return

::!JZL::
SendInput S:\USPTO\Jing.Liu.epf
Clipboard = S:\USPTO\Jing.Liu.epf
gosub, GetPassword
return

::!JMC::
SendInput S:\USPTO\John Carson.epf
Clipboard = S:\USPTO\John Carson.epf
gosub, GetPassword
return

::!JEG::
SendInput S:\USPTO\Jordan.Gottdank.epf
Clipboard = S:\USPTO\Jordan.Gottdank.epf
gosub, GetPassword
return

::!JMR::
SendInput S:\USPTO\Joseph Reisman.epf
Clipboard = S:\USPTO\Joseph Reisman.epf
gosub, GetPassword
return

::!JOM::
SendInput S:\USPTO\Joseph.Mallon.epf
Clipboard = S:\USPTO\Joseph.Mallon.epf
gosub, GetPassword
return

::!KST::
SendInput S:\USPTO\Kerry.Taylor.epf
Clipboard = S:\USPTO\Kerry.Taylor.epf
gosub, GetPassword
return

::!KJM::
SendInput S:\USPTO\Kimberly Miller.epf
Clipboard = S:\USPTO\Kimberly Miller.epf
gosub, GetPassword
return

::!KXW::
SendInput S:\USPTO\Kun.Wang.epf
Clipboard = S:\USPTO\Kun.Wang.epf
gosub, GetPassword
return

::!LMF::
SendInput S:\USPTO\Larry.Firestone.epf
Clipboard = S:\USPTO\Larry.Firestone.epf
gosub, GetPassword
return

::!LEN::
SendInput S:\USPTO\Lauren.Hockett.epf
Clipboard = S:\USPTO\Lauren.Hockett.epf
gosub, GetPassword
return

::!MVS::
SendInput S:\USPTO\Maria.Stout.epf
Clipboard = S:\USPTO\Maria.Stout.epf
gosub, GetPassword
return

::!MMA::
SendInput S:\USPTO\Mark.Abumeri.epf
Clipboard = S:\USPTO\Mark.Abumeri.epf
gosub, GetPassword
return

::!MWC::
SendInput S:\USPTO\Mark.Catanese.epf
Clipboard = S:\USPTO\Mark.Catanese.epf
gosub, GetPassword
return

::!MDM::
SendInput S:\USPTO\Mark.Marsden.epf
Clipboard = S:\USPTO\Mark.Marsden.epf
gosub, GetPassword
return

::!MLF::
SendInput S:\USPTO\Michael.Fuller.epf
Clipboard = S:\USPTO\Michael.Fuller.epf
gosub, GetPassword
return

::!NRL::
SendInput S:\USPTO\Nate.Luman.epf
Clipboard = S:\USPTO\Nate.Luman.epf
gosub, GetPassword
return

::!NAI::
SendInput S:\USPTO\Ned.Israelsen.epf
Clipboard = S:\USPTO\Ned.Israelsen.epf
gosub, GetPassword
return

::!NSB::
SendInput S:\USPTO\Neil.Bartfeld.epf
Clipboard = S:\USPTO\Neil.Bartfeld.epf
gosub, GetPassword
return

::!PYC::
SendInput S:\USPTO\Paul.Chang.epf
Clipboard = S:\USPTO\Paul.Chang.epf
gosub, GetPassword
return

::!PXL::
SendInput S:\USPTO\Peter.Law.epf
Clipboard = S:\USPTO\Peter.Law.epf
gosub, GetPassword
return

::!RJS::
SendInput S:\USPTO\Ray.Salenieks.epf
Clipboard = S:\USPTO\Ray.Salenieks.epf
gosub, GetPassword
return

::!RJH::
SendInput S:\USPTO\Robert.Hilton.epf
Clipboard = S:\USPTO\Robert.Hilton.epf
gosub, GetPassword
return

::!RMT::
SendInput S:\USPTO\Rose.Thiessen.epf
Clipboard = S:\USPTO\Rose.Thiessen.epf
gosub, GetPassword
return

::!REM::
SendInput S:\USPTO\Ryan Melnick.epf
Clipboard = S:\USPTO\Ryan Melnick.epf
gosub, GetPassword
return

::!SCY::
SendInput S:\USPTO\Samantha.Markley.epf
Clipboard = S:\USPTO\Samantha.Markley.epf
gosub, GetPassword
return

::!TRA::
SendInput S:\USPTO\Tom.Arno.epf
Clipboard = S:\USPTO\Tom.Arno.epf
gosub, GetPassword
return

::!TSC::
SendInput S:\USPTO\Tom.Cowan.epf
Clipboard = S:\USPTO\Tom.Cowan.epf
gosub, GetPassword
return

::!TJH::
SendInput S:\USPTO\Travis.Hill.epf
Clipboard = S:\USPTO\Travis.Hill.epf
gosub, GetPassword
return

::!VCV::
SendInput S:\USPTO\Victor.Vassar.epf
Clipboard = S:\USPTO\Victor.Vassar.epf
gosub, GetPassword
return

::!VKG::
SendInput S:\USPTO\Vijay.Gore.epf
Clipboard = S:\USPTO\Vijay.Gore.epf
gosub, GetPassword
return

::!JXW::
SendInput S:\USPTO\Jeffrey.Wu.epf
Clipboard = S:\USPTO\Jeffrey.Wu.epf
gosub, GetPassword
return

::!DNW::
SendInput L:\USPTO\David.Weiss.epf
Clipboard = L:\USPTO\David.Weiss.epf
gosub, GetPassword
return

::!MDK::
SendInput L:\USPTO\Mark.Kachner.epf
Clipboard = L:\USPTO\Mark.Kachner.epf
gosub, GetPassword
return

::!MSO::
SendInput L:\USPTO\Mike.Okamoto.epf
Clipboard = L:\USPTO\Mike.Okamoto.epf
gosub, GetPassword
return

::!AXD::
SendInput W:\USPTO\Aaron.Davis.epf
Clipboard = W:\USPTO\Aaron.Davis.epf
gosub, GetPassword
return

::!ASA::
SendInput W:\USPTO\Adeel.Akhtar.epf
Clipboard = W:\USPTO\Adeel.Akhtar.epf
gosub, GetPassword
return

::!ANM::
SendInput W:\USPTO\Andrew.Merickel.epf
Clipboard = W:\USPTO\Andrew.Merickel.epf
gosub, GetPassword
return

::!BMG::
SendInput W:\USPTO\Brian Graham.epf
Clipboard = W:\USPTO\Brian Graham.epf
gosub, GetPassword
return

::!DRT::
SendInput W:\USPTO\David.Trossen.epf
Clipboard = W:\USPTO\David.Trossen.epf
gosub, GetPassword
return


::!ELF::
SendInput W:\USPTO\Eric.Fong.epf
Clipboard = W:\USPTO\Eric.Fong.epf
gosub, GetPassword
return

::!KZM::
SendInput W:\USPTO\Kyu.Min.epf
Clipboard = W:\USPTO\Kyu.Min.epf
gosub, GetPassword
return

::!PSS::
SendInput W:\USPTO\Paul.Stellman.epf
Clipboard = W:\USPTO\Paul.Stellman.epf
gosub, GetPassword
return

::!VXL::
SendInput W:\USPTO\V.Lakshmananepf.epf
Clipboard = W:\USPTO\V.Lakshmananepf.epf
gosub, GetPassword
return

::!ZYW::
SendInput W:\USPTO\Zi Wong.epf
Clipboard = W:\USPTO\Zi Wong.epf
gosub, GetPassword
return

::!DJG::
SendInput U:\USPTO\David.Grant.epf
Clipboard = U:\USPTO\David.Grant.epf
gosub, GetPassword
return

::!JUB::
SendInput U:\USPTO\Julie.Burke.epf
Clipboard = U:\USPTO\Julie.Burke.epf
gosub, GetPassword
return

::!MUM::
SendInput U:\USPTO\Mark.Metzke.epf
Clipboard = U:\USPTO\Mark.Metzke.epf
gosub, GetPassword
return

::!AVB::
SendInput V:\USPTO\Adam.Burks.epf
Clipboard = V:\USPTO\Adam.Burks.epf
gosub, GetPassword
return

::!AFQ::
SendInput V:\USPTO\Andrew.Quecan.epf
Clipboard = V:\USPTO\Andrew.Quecan.epf
gosub, GetPassword
return

::!BPJ::
SendInput V:\USPTO\Benjamin.Johnson.epf
Clipboard = V:\USPTO\Benjamin.Johnson.epf
gosub, GetPassword
return

::!BGM::
SendInput V:\USPTO\Bryan McWhorter.epf
Clipboard = V:\USPTO\Bryan McWhorter.epf
gosub, GetPassword
return

::!CTS::
SendInput V:\USPTO\Christopher Sweeney.epf
Clipboard = V:\USPTO\Christopher Sweeney.epf
gosub, GetPassword
return

::!CBH::
SendInput V:\USPTO\Colin Heideman.epf
Clipboard = V:\USPTO\Colin Heideman.epf
gosub, GetPassword
return

::!MCA::
SendInput V:\USPTO\Maria Anderson.epf
Clipboard = V:\USPTO\Maria Anderson.epf
gosub, GetPassword
return

::!MAU::
SendInput V:\USPTO\Mauricio Uribe.epf
Clipboard = V:\USPTO\Mauricio Uribe.epf
gosub, GetPassword
return

::!MJS::
SendInput V:\USPTO\Melanie Seelig.epf
Clipboard = V:\USPTO\Melanie Seelig.epf
gosub, GetPassword
return

::!SWF::
SendInput V:\USPTO\Scott.Forbes.epf
Clipboard = V:\USPTO\Scott.Forbes.epf
gosub, GetPassword
return

::!YXL::
SendInput V:\USPTO\Yiheng.Li.epf
Clipboard = V:\USPTO\Yiheng.Li.epf
gosub, GetPassword
return

::!ADM::
SendInput Q:\USPTO\Alejandro.Munoz.epf
Clipboard = Q:\USPTO\Alejandro.Munoz.epf
gosub, GetPassword
return

::!AVS::
SendInput Q:\USPTO\Andrew.Schwaab.epf
Clipboard = Q:\USPTO\Andrew.Schwaab.epf
gosub, GetPassword
return

::!JXV::
SendInput L:\USPTO\Josue.Villalta.epf
Clipboard = L:\USPTO\Josue.Villalta.epf
gosub, GetPassword
return

::!EAL::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gEAL1, SD - S:\USPTO
Gui, Add, Button, x112  y25 gEAL2, SF - W:\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gEAL3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

EAL1:
Gui, Submit
Sleep 200
SendInput S:\USPTO\EliLoots.epf
Clipboard = S:\USPTO\EliLoots.epf
Sleep 200
gosub, GetPassword
return

EAL2:
Gui, Submit
Sleep 200
SendInput W:\USPTO\EliLoots.epf
Clipboard = W:\USPTO\EliLoots.epf
Sleep 200
gosub, GetPassword
return

EAL3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}


::!EYZ::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gEYZ1, SV - Q:\USPTO
Gui, Add, Button, x112  y25 gEYZ2, OC - H:\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gEYZ3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

EYZ1:
Gui, Submit
Sleep 200
SendInput Q:\USPTO\Eric.Zhou.epf
Clipboard = Q:\USPTO\Eric.Zhou.epf
Sleep 200
gosub, GetPassword
return

EYZ2:
Gui, Submit
Sleep 200
SendInput H:\USPTO\Eric.Zhou.epf
Clipboard = H:\USPTO\Eric.Zhou.epf
Sleep 200
gosub, GetPassword
return

EYZ3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}


::!GRM::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gGRM1, OC - H:\USPTO
Gui, Add, Button, x112  y25 gGRM2, SF - W:\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gGRM3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

GRM1:
Gui, Submit
Sleep 200
SendInput H:\USPTO\Grant.McAdams.epf
Clipboard = H:\USPTO\Grant.McAdams.epf
Sleep 200
gosub, GetPassword
return

GRM2:
Gui, Submit
Sleep 200
SendInput W:\USPTO\Grant.McAdams.epf
Clipboard = W:\USPTO\Grant.McAdams.epf
Sleep 200
gosub, GetPassword
return

GRM3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

/*

::!JXV::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gJXV1, LA - L:\USPTO
Gui, Add, Button, x112  y25 gJXV2, OC - H:\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gJXV3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

JXV1:
Gui, Submit
Sleep 200
SendInput L:\USPTO\Josue.Villalta.epf
Sleep 200
gosub, GetPassword
return

JXV2:
Gui, Submit
Sleep 200
SendInput H:\USPTO\Josue.Villalta.epf
Sleep 200
gosub, GetPassword
return

JXV3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

*/

::!LSE::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gLSE1, OC - H:\USPTO
Gui, Add, Button, x112  y25 gLSE2, DC - U:\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gLSE3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

LSE1:
Gui, Submit
Sleep 200
SendInput H:\USPTO\Lincoln.Essig.epf
Clipboard = H:\USPTO\Lincoln.Essig.epf
Sleep 200
gosub, GetPassword
return

LSE2:
Gui, Submit
Sleep 200
SendInput U:\USPTO\Lincoln.Essig.epf
Clipboard = U:\USPTO\Lincoln.Essig.epf
Sleep 200
gosub, GetPassword
return

LSE3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

::!MHT::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gMHT1, OC - H:\USPTO
Gui, Add, Button, x112  y25 gMHT2, SV - Q:\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gMHT3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

MHT1:
Gui, Submit
Sleep 200
SendInput H:\USPTO\Michael.Trenholm.epf
Clipboard = H:\USPTO\Michael.Trenholm.epf
Sleep 200
gosub, GetPassword
return

MHT2:
Gui, Submit
Sleep 200
SendInput Q:\USPTO\Michael.Trenholm.epf
Clipboard = Q:\USPTO\Michael.Trenholm.epf
Sleep 200
gosub, GetPassword
return

MHT3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

::!MZC::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gMZC1, OC - H:\USPTO
Gui, Add, Button, x112  y25 gMZC2, SD - S:\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gMZC3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

MZC1:
Gui, Submit
Sleep 200
SendInput H:\USPTO\Morgan.Coates.epf
Clipboard = H:\USPTO\Morgan.Coates.epf
Sleep 200
gosub, GetPassword
return

MZC2:
Gui, Submit
Sleep 200
SendInput S:\USPTO\Morgan.Coates.epf
Clipboard = S:\USPTO\Morgan.Coates.epf
Sleep 200
gosub, GetPassword
return

MZC3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

::!SGS::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gSGS1, SF - W:\USPTO
Gui, Add, Button, x112  y25 gSGS2, SD - S:\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gSGS3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

SGS1:
Gui, Submit
Sleep 200
SendInput W:\USPTO\Scott.Siera.epf
Clipboard = W:\USPTO\Scott.Siera.epf
Sleep 200
gosub, GetPassword
return

SGS2:
Gui, Submit
Sleep 200
SendInput S:\USPTO\Scott.Siera.epf
Clipboard = S:\USPTO\Scott.Siera.epf
Sleep 200
gosub, GetPassword
return

SGS3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

::!VXT::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gVXT1, OC - H:\USPTO
Gui, Add, Button, x112  y25 gVXT2, SEA - V:\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gVXT3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

VXT1:
Gui, Submit
Sleep 200
SendInput H:\USPTO\Vlad.Teplitskiy.epf
Clipboard = H:\USPTO\Vlad.Teplitskiy.epf
Sleep 200
gosub, GetPassword
return

VXT2:
Gui, Submit
Sleep 200
SendInput V:\USPTO\Vlad.Teplitskiy.epf
Clipboard = V:\USPTO\Vlad.Teplitskiy.epf
Sleep 200
gosub, GetPassword
return

VXT3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

::!JLP::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gJLP1, SD - S:\USPTO
Gui, Add, Button, x112  y25 gJLP2, OC - H:\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gJLP3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

JLP1:
Gui, Submit
Sleep 200
SendInput S:\USPTO\John.Paik.epf
Clipboard = S:\USPTO\John.Paik.epf
Sleep 200
gosub, GetPassword
return

JLP2:
Gui, Submit
Sleep 200
SendInput H:\USPTO\John.Paik.epf
Clipboard = H:\USPTO\John.Paik.epf
Sleep 200
gosub, GetPassword
return

JLP3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}


#If

/*

::!308:: 
SendInput, %Today% WIPO EM PCT 308 COMMUNICATION OF INTL APPLICATION - %Clipboard%
return


$*Alt::
KeyWait, Alt
KeyWait, Alt, D T0.15
if ErrorLevel = 1
	{
	SendInput {Alt}
	return
	}
else if ErrorLevel = 0
	DateAndName()
return

$*Control::
KeyWait, Control
KeyWait, Control, D T0.15
if ErrorLevel = 1
	{
	SendInput {Ctrl}
	return
	}
else if ErrorLevel = 0
	QuickDate()
return

*/

;************Pointer to Open IE Window******************
WBGet(WinTitle="ahk_class IEFrame", Svr#=1) {               ;// based on ComObjQuery docs
   static msg := DllCall("RegisterWindowMessage", "str", "WM_HTML_GETOBJECT")
        , IID := "{0002DF05-0000-0000-C000-000000000046}"   ;// IID_IWebBrowserApp
;//     , IID := "{332C4427-26CB-11D0-B483-00C04FD90119}"   ;// IID_IHTMLWindow2
   SendMessage msg, 0, 0, Internet Explorer_Server%Svr#%, %WinTitle%

   if (ErrorLevel != "FAIL") {
      lResult:=ErrorLevel, VarSetCapacity(GUID,16,0)
      if DllCall("ole32\CLSIDFromString", "wstr","{332C4425-26CB-11D0-B483-00C04FD90119}", "ptr",&GUID) >= 0 {
         DllCall("oleacc\ObjectFromLresult", "ptr",lResult, "ptr",&GUID, "ptr",0, "ptr*",pdoc)
         return ComObj(9,ComObjQuery(pdoc,IID,IID),1), ObjRelease(pdoc)
      }
   }
}