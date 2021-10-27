/*
Created by Tyler Dickson using AutoHotkey.

Major Release History:

The Integrated Improved WorkSpace Opener Update - 3/30/2018
The PCT Form Hotstring Update - 3/15/2018 - Thanks to Eddie Monroy for making the script!
The Opposition Remarks Update - 2/22/2018
The Updated EFS Certificate Finder Update - 2/9/2018
The BETA Section Update - 8/22/2017
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
Option9 = Unused

*/

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, Force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetWinDelay, 20  ; 20 is good for drawers.
formattime, Today, , yyyy-MM-dd		
Menu, Tray, Icon, Shell32.dll, 45
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
; Computername = %A_Username%

;if Computername = lara.anabtawi
;	Computername = lara.hamdan
;if Computername = neysa.perkins
;	Computername = neysa.cabudol
;if Computername = jessica.george
;	Computername = jessica.egigian
;if Computername = sabrina.fleming
;	Computername = sabrina.kellogg
;if Computername = chelsea.veinot
;	Computername = chelsea.burdeno
	
StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}

if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder	
	
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
IniRead, Keystrokes, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, Keystrokes
	if Keystrokes = ERROR
		{
		Keystrokes = 0
		IniWrite, %Keystrokes%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, Keystrokes
		IniRead, Keystrokes, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, Keystrokes
		}
IniRead, DateShortcut, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, DateShortcut
	if DateShortcut = ERROR
		{
		DateShortcut = 0
		IniWrite, %DateShortcut%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, DateShortcut
		IniRead, DateShortcut, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, DateShortcut
		}
IniRead, AttyFinder, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AttyFinder
	if AttyFinder = ERROR
		{
		AttyFinder = 0
		IniWrite, %AttyFinder%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AttyFinder
		IniRead, AttyFinder, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AttyFinder
		}
IniRead, CalExtend, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CalExtend
	if CalExtend = ERROR
		{
		CalExtend = 0
		IniWrite, %CalExtend%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CalExtend
		IniRead, CalExtend, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CalExtend
		}
IniRead, SysSwitch, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SysSwitch
	if SysSwitch = ERROR
		{
		SysSwitch = 0
		IniWrite, %SysSwitch%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SysSwitch
		IniRead, SysSwitch, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SysSwitch
		}
IniRead, ExcelHLink, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ExcelHLink
	if ExcelHLink = ERROR
		{
		ExcelHLink = 0
		IniWrite, %ExcelHLink%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ExcelHLink
		IniRead, ExcelHLink, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ExcelHLink
		}
IniRead, EFSCertFinder, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSCertFinder
	if EFSCertFinder = ERROR
		{
		EFSCertFinder = 0
		IniWrite, %EFSCertFinder%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSCertFinder
		IniRead, EFSCertFinder, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSCertFinder
		}
IniRead, CopyAction, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CopyAction
	if CopyAction = ERROR
		{
		CopyAction = 0
		IniWrite, %CopyAction%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CopyAction
		IniRead, CopyAction, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CopyAction
		}
IniRead, PasteAction, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, PasteAction
	if PasteAction = ERROR
		{
		PasteAction = 0
		IniWrite, %PasteAction%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, PasteAction
		IniRead, PasteAction, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, PasteAction
		}
IniRead, SuggestRemarks, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SuggestRemarks
	if SuggestRemarks = ERROR
		{
		SuggestRemarks = 0
		IniWrite, %SuggestRemarks%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SuggestRemarks
		IniRead, SuggestRemarks, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SuggestRemarks
		}
IniRead, ClientCodeIE, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
	if ClientCodeIE = ERROR
		{
		ClientCodeIE = 0
		IniWrite, %ClientCodeIE%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
		IniRead, ClientCodeIE, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
		}
IniRead, EFSFill, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSFill
	if EFSFill = ERROR
		{
		EFSFill = 0
		IniWrite, %EFSFill%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSFill
		IniRead, EFSFill, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSFill
		}
IniRead, EFSLogin, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSLogin
	if EFSLogin = ERROR
		{
		EFSLogin = 0
		IniWrite, %EFSLogin%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSLogin
		IniRead, EFSLogin, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSLogin
		}
IniRead, AHotCornerBL, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBL
	if AHotCornerBL = ERROR
		{
		AHotCornerBL = 0
		IniWrite, %AHotCornerBL%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBL
		IniRead, AHotCornerBL, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBL
		}		
IniRead, AHotCornerTR, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerTR
	if AHotCornerTR = ERROR
		{
		AHotCornerTR = 0
		IniWrite, %AHotCornerTR%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerTR
		IniRead, AHotCornerTR, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerTR
		}			
IniRead, AHotCornerBR, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBR
	if AHotCornerBR = ERROR
		{
		AHotCornerBR = 0
		IniWrite, %AHotCornerBR%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBR
		IniRead, AHotCornerBR, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBR
		}
IniRead, WorkSpaceOpener, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, WorkSpaceOpener
	if WorkSpaceOpener = ERROR
		{
		WorkSpaceOpener = 0
		IniWrite, %WorkSpaceOpener%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, WorkSpaceOpener
		IniRead, WorkSpaceOpener, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, WorkSpaceOpener
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
;MsgBox, 64, PLEASE READ! - Update to EFS Certificate Finder + Help/Beta Sections, Hi everyone,`n`nI've made some pretty significant changes to the EFS Certificate Finder, so I figured I'd put a quick note here so you aren't scared if/when you use it. Functionally, it works the same way it always has, except it will look a little different.`n`nLong story short, you won't see H: or S: anymore. Instead, you'll see \\docs-oc\files\USPTO\*.epf or \\docs-sd\files\USPTO\*.epf, etc.`n`nThis works identically to the old way, except YOU WON'T NEED TO USE MAPIT ANYMORE. This can access the certificates without mapping the drives first. For those in remote locations, you'll still need to map the H: drive for now.`n`nI've removed the attorneys with multiple locations from the script. If you encounter one with the incorrect location, let me know and I can update the script.`n`nIf using the Old EFS option (which you really should), it should be a bit faster now, and it will now click the checkbox for you. Yay! It should also make it impossible to have any Task Folder issues in Outlook.`n`nIf using the New EFS option, you'll have to click it yourself... Sorry!`n`nA quick reminder to check out the Help Section at the bottom-left corner of the Settings Menu. There is some good information there if you want to consider expanding your script usage to increase efficiency.`n`nLastly, you should take a look at the BETA Scripts section on the EFS/HotCorners tab. There are some neat scripts in there that might be helpful for you.`n`nI guess that's it. I'll leave this pop-up in here for a week to make sure everyone has a chance to see it.`n`nLet me know if you encounter any issues or have any comments.`n`nThanks!`n-Tyler
goto Reopen
return
;return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;                                    ;;
;;         Quick EFS Shortcuts         ;;
;;                                    ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#E::
gosub FillEFS
return

#F::
gosub EFSPayLogIn
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;                                    ;;
;;       Quick TM/Patent Opener       ;;
;;                                    ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^o::
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
ie.document.getElementByID("btnEdit").Click()
Sleep 250
;ie.document.getElementByID("btnSave").Click()
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
Remarks := ie.document.getElementByID("fldstrRemarks").Value
Sleep 250
StringMid, AppNo, ActionType, 29, 50 
Sleep 250
Default := ATDate . " Possible opposition against`nApplication number: " . AppNo . "`n' [MARK] '`nby *`nOur Mark(s):`nRcvd via * " . Username . "`n" . Remarks
ie.document.getElementByID("fldstrRemarks").Value := Default
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
;;                                    ;;
;;            Settings Menu           ;;
;;                                    ;;
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
Gui, 1:Add, Text, x255 h10 y375 gCherSystemSwitch vCherSystemSwitch, v.3.30.2018   ; Version: change to 1.23.2017 when released
Gui, 1:Font

Gui, 1:Tab, 2
Gui, 1:Add, GroupBox, x5 y30 w290 h75,
Gui, 1:Add, Checkbox, cBlue x10 y30 Checked%Checkboxes3% gNoRemarks1 vOption3, Enable Multiuse (Hold Control, then Right Click.)
Gui, 1:Add, Text, x10 y50 , Includes: Calendar Extender, Remarks Suggester,`n      Attorney Finder, Record Opener, WorkSpace Opener 
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
Gui, 1:Add, Radio, x25  y190 h20 w32         Checked%RadioChoice1% vRadioChoice1, Off
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
Gui, 1: Tab, 1
Gui, 1:Add, Button, gFixWindows x268 y274 w25 h15 +Center, FIX

Gui, 1: Tab
Gui, 1:Add, Edit, ReadOnly h60 w300 x0 y390, UPDATE 3/30/2018:`n-Added WorkSpace Opener to Multiuse (Ctrl + Right Click).`n-Removed WorkSpace Opener from BETA section.`n-Added this update section.

Gui, 1: Show, h450 w300     ;h390 w300
global CherToggle = 0
return


RunBetaScripts:
Gui, New, , BETA Scripts
Gui, Add, Groupbox, cBlue x5 y5 w400 h80, -NONE-
Gui, Add, Button, +Center xp+5 yp+20 w100 h50, -NONE-
Gui, Add, Text, xp+105 yp+10 w285 +Center, -NONE-
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

RunDoubleTap:
Run "\\docs-oc\files\Docketing\AutoHotKey\Scripts\BETA Scripts\DoubleTap.ahk"
return

RunActionInjector:
Run "\\docs-oc\files\Docketing\AutoHotKey\Scripts\BETA Scripts\F-Keys Action Injector.ahk"
return

RunWoWbar:
Run "\\docs-oc\files\Docketing\AutoHotKey\Scripts\BETA Scripts\WoWbar.ahk"
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
				FileCopy, \\docs-oc\files\Docketing\AutoHotKey\Scripts\Personal Scripts. Save to Desktop. DO NOT RUN FROM HERE!\Hotstrings.ahk, C:\Users\%Computername%\Desktop\
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
			FileCopy, \\docs-oc\files\Docketing\AutoHotKey\Scripts\Personal Scripts. Save to Desktop. DO NOT RUN FROM HERE!\Hotstrings.ahk, C:\Users\%Computername%\Desktop\
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
			FileCopy, \\docs-oc\files\Docketing\AutoHotKey\Scripts\Personal Scripts. Save to Desktop. DO NOT RUN FROM HERE!\Hotstrings.ahk, C:\Users\%Computername%\Desktop\
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

OpenHelp:
FileCopy, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HTML\AHK Instructions.html, C:\Users\%ComputerName%\AHK Instructions.html, 1
Sleep 2000
Run "C:\Users\%ComputerName%\AHK Instructions.html"
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
IniWrite, %A_Now%`n, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, %Computername%, LastUpdated
IniWrite, v.3.30.2018, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Version, Version
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
;SetTimer, UpdateReady, 3600000
;SetTimer, UpdateReady, 5000
return

UpdateReady:
IniRead, Version, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Version, Version
IniRead, NewestVersion, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Update\Update.ini, Update, UpdateReady
	if (Version = NewestVersion)
		return
	else
		MsgBox, 515, Update Available!, Updates have been made to the script.`n`nYour Version:`t%Version%`nNewest Version:`t%NewestVersion%`n`nClick Yes to restart now, or click No to postpone until later.`n`nIf you postpone, you'll be reminded in an hour.
			{
			ifMsgBox Yes
				{
				Run "\\docs-oc\files\Docketing\AutoHotKey\Scripts\Scripts.ahk"
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

SettingsDrawer:
PosFound = 0
IniRead, CustomColor, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowColor
Gui, 20: Destroy
Gui, 20: New, Owner AlwaysOnTop , Drawer
Gui, 20: Add, Text, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% +Center , --------------------------
Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gdSettings, Settings
Gui, 20: Add, Text, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% +Center , --------------------------
Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gCalculator, Open Calculator
Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gGoogle, Open Google
Gui, 20: Add, Text, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% +Center , --------------------------
Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gPCT220, Open PCT 220 Date Generator
Gui, 20: Add, Text, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% +Center , --------------------------


if Option7 = 1
	{
	Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gMapIt2, Run MapIt!
	Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gFillEFS, Fill EFS Info
	Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gEFSPayLogIn, Log into EFS Fees
	}
Gui, 20: +ToolWindow -Caption
Gui, 20: Color, %CustomColor%
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
Run "\\docs-oc\files\Docketing\AutoHotKey\Scripts\PCT 220 Date Generator.ahk"
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
Gui, Add, Button, x100 y30 w100 h55 gOpenWorkSpace, Open WorkSpace
if ClipLength < 9
	Gui, Add, Button, x100 y0 h25 w100 gCancelOpen, %Clipboard%
else
	Gui, Add, Button, x50 y0 h25 w200 gCancelOpen, %Clipboard%
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

OpenWorkSpace:
Gui, Submit
IniRead, FolderNumber, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\WorkSpaceOpener.ini, Miscellaneous, %Clipboard%
Sleep 200

if (FolderNumber == "ERROR")
	{
	TrayTip, Unable to open WorkSpace, I couldn't open the WorkSpace.`nIt was probably created very recently`, or it doesn't exist.`nPlease open it manually.
	return
	}
else 
	{
	TrayTip, Opening WorkSpace in iManage,`n`nPlease wait...
	DocumentText := "OC-iDMS`n!nrtdms:0:!session:OC-iDMS:!database:KMOB:!folder:ordinary," . FolderNumber
	Sleep 200
	FileDelete, C:\Users\%Computername%\KMOB_%FolderNumber%.nrl
	Sleep 250
	FileAppend, %DocumentText%, C:\Users\%Computername%\KMOB_%FolderNumber%.nrl
	Sleep 250
	WinActivate, ahk_exe OUTLOOK.EXE  ;  ahk_class rctrl_renwnd32
	Sleep 100
	Run, C:\Users\%Computername%\KMOB_%FolderNumber%.nrl
	Sleep 500
	FileDelete, C:\Users\%Computername%\KMOB_%FolderNumber%.nrl
	gosub RecordWorkSpaceOpener
	return
	}
return

;;;;;;;;;;;
;¿


;#IfWinActive , Calendar Selection, +1M
;{
AddAtty(wParam, lParam, Msg) {
MouseGetPos,,,, OutputVarControl
IfEqual, OutputVarControl, Edit1
	AddAtty := "Add ABC or 2ABC to include in Auto-remarks.`nLeave blank to type manually."
else IfEqual, OutputVarControl, Button10
	AddAtty := "Check this box to use Auto-remarks."

ToolTip % AddAtty
}
;}
;#If

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
Gui, Add, Button, x12   y2 w32 gAdd1, +1M
Gui, Add, Button, xp+38 y2 w32 gAdd2, +2M
Gui, Add, Button, xp+38 y2 w32 gAdd3, +3M
Gui, Add, Button, xp+38 y2 w32 gAdd4, +4M
Gui, Add, Button, xp+38 y2 w32 gAdd6, +6M
Gui, Add, Button, xp+38 y2 w33 gAdd12, +1Y
Gui, Add, MonthCal, x11 vMyMonthCal, %formattedTime%
Gui, Add, Button, x11  y192 w50 gExtend, Extend
Gui, Add, Button, x71  y192 w37 gAdd1W, +1W
Gui, Add, Button, x119 y192 w37 gAdd2W, +2W
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
	
Add4:
Gui, Submit
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
IniWrite, %Checkboxes%, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes
FormatTime, MyMonthCal, %MyMonthCal%, dd-MMM-yyyy
ifInString, MyMonthCal, Jan                                   
	StringReplace, MyMonthCal, MyMonthCal, Jan, May
else ifInString, MyMonthCal, Feb
	StringReplace, MyMonthCal, MyMonthCal, Feb, Jun
else ifInString, MyMonthCal, Mar
	StringReplace, MyMonthCal, MyMonthCal, Mar, Jul
else ifInString, MyMonthCal, Apr
	StringReplace, MyMonthCal, MyMonthCal, Apr, Aug
else ifInString, MyMonthCal, May
	{
	StringReplace, MyMonthCal, MyMonthCal, May, Sep
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Jun
	StringReplace, MyMonthCal, MyMonthCal, Jun, Oct
else ifInString, MyMonthCal, Jul
	{
	StringReplace, MyMonthCal, MyMonthCal, Jul, Nov
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Aug
	StringReplace, MyMonthCal, MyMonthCal, Aug, Dec
else ifInString, MyMonthCal, Sep
	{
	StringReplace, MyMonthCal, MyMonthCal, Sep, Jan
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
	StringReplace, MyMonthCal, MyMonthCal, Oct, Feb
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 28	
	ifInString, MyMonthCal, 30
		StringReplace, MyMonthCal, MyMonthCal, 30, 28		
	ifInString, MyMonthCal, 29
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
else ifInString, MyMonthCal, Nov
	{
	StringReplace, MyMonthCal, MyMonthCal, Nov, Mar
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
	StringReplace, MyMonthCal, MyMonthCal, Dec, Apr
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
ExtendRemarks = %ATDate% Extend 4M per %RespAtty%. %Username% 
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

GuiClose:
Gui, Submit
IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
Clipboard = %OldClipboard%
Gui, Destroy
return
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;                                    ;;
;;        Persistent Box on IE        ;;
;;                                    ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut6, Open EFS Options ;Quick link to Open EFS Options      
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Open EFS Options			 ;Quick link to Open EFS Options	  
	}
if Slots = XXX01011
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink 
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Excel Hyperlink		 	 	 ;Option 8 - ^1 - Open Excel Hyperlink 
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut6, Open EFS Options ;Quick link to Open EFS Options       
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Open EFS Options			 ;Quick link to Open EFS Options	   
	}
if Slots = XXX01100
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut3, Copy++		 	 ;Option 6 - ^5 - Copy Extra Clipboards 
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Copy++		   	 			 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards
	}
if Slots = XXX01101
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut3, Copy++		 	 ;Option 6 - ^5 - Copy Extra Clipboards 
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Copy++		   	 			 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 10:Add, Button, x%Slot3X% y0 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink  
	Gui, 11:Add, Button, x%Slot3X% y0 w100 h20, Excel Hyperlink				 ;Option 8 - ^1 - Open Excel Hyperlink	
	}
if Slots = XXX01110
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut3, Copy++		 	 ;Option 6 - ^5 - Copy Extra Clipboards 
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Copy++		   	 			 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 10:Add, Button, x%Slot3X% y0 w100 h20 gCustomBut6, Open EFS Options ;Quick link to Open EFS Options        
	Gui, 11:Add, Button, x%Slot3X% y0 w100 h20, Open EFS Options			 ;Quick link to Open EFS Options	    
	}
if Slots = XXX01111
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut3, Copy++		 	 ;Option 6 - ^5 - Copy Extra Clipboards  
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Copy++		   	 			 ;Option 6 - ^5 - Copy Extra Clipboards	 
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards 
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards 
	Gui, 10:Add, Button, x%Slot3X% y0 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink   
	Gui, 11:Add, Button, x%Slot3X% y0 w100 h20, Excel Hyperlink		 		 ;Option 8 - ^1 - Open Excel Hyperlink	 
	Gui, 10:Add, Button, x%Slot4X% y0 w100 h20 gCustomBut6, Open EFS Options ;Quick link to Open EFS Options         
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
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Excel Hyperlink		 	 	 ;Option 8 - ^1 - Open Excel Hyperlink	
	}
if Slots = XXX11010
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut6, Open EFS Options ;Quick link to Open EFS Options
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Open EFS Options			 ;Quick link to Open EFS Options	
	}
if Slots = XXX11011
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Excel Hyperlink		         ;Option 8 - ^1 - Open Excel Hyperlink	
	Gui, 10:Add, Button, x%Slot3X% y0 w100 h20 gCustomBut6, Open EFS Options ;Quick link to Open EFS Options
	Gui, 11:Add, Button, x%Slot3X% y0 w100 h20, Open EFS Options			 ;Quick link to Open EFS Options	
	}
if Slots = XXX11100
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut3, Copy++		 	 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Copy++		   	 	 	 	 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot3X% y0 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot3X% y0 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards
	}
if Slots = XXX11101
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut3, Copy++		 	 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Copy++		   	 	 		 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot3X% y0 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot3X% y0 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards	
	Gui, 10:Add, Button, x%Slot4X% y0 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot4X% y0 w100 h20, Excel Hyperlink		 		 ;Option 8 - ^1 - Open Excel Hyperlink	
	}
if Slots = XXX11110
	{
	Gui, 10:Add, Button, x%Slot1X% y0 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y0 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y0 w100 h20 gCustomBut3, Copy++		 	 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y0 w100 h20, Copy++		   	 			 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot3X% y0 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot3X% y0 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards	
	Gui, 10:Add, Button, x%Slot4X% y0 w100 h20 gCustomBut6, Open EFS Options ;Quick link to Open EFS Options
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;     Store Extra Clipboard Items    ;;
;;             CTRL + 5               ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
		Clipboard = %ATDate%%NewClipboard%%Username% 
		Sleep 75
		SendInput ^v
		SendInput {Left %NameLen%}              ; Positions cursor in middle of text by taking length of Username and adding 2.
		SendInput {Space}
		}
	else
		{
		Sleep 75
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
     Sleep 2500
	 TrayTip     
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
;;                                    ;;
;;         Suggested Remarks          ;;
;;                                    ;;
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
IniRead, CopiedAction, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Actions (BETA).ini, Actions, %CopiedAction%
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
;;                                    ;;
;;         Attorney Email Finder      ;;
;;                                    ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AttyEmailFinder()
{
ClientCode := ""
ClientCode2 := ""
Country := ""
ThreeString := ""
TestString := ""
IniRead, ATPartner, C:\Users\%Computername%\AHKPrefs.ini, Username, ATPartner
Loop 10
{
AttyTest%A_Index% := ""
AttyString%A_Index% := ""
ThreeString%A_Index% := ""
TestString%A_Index% := ""
}

ie := WBGet()
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
ClientCode2 := ie.document.getElementByID("fldstrCaseNumber").Value

StringReplace, ClientCode, ClientCode, %A_Space%, , A
StringReplace, ClientCode2, ClientCode2, %A_Space%, , A
	
TestString = %Clipboard%
StringReplace, TestString, TestString, `- , , All                        ; Removes all dashes.
StringReplace, TestString, TestString, `r`n, `, , All                    ; Removes all hard returns. 
StringReplace, TestString, TestString, %A_Space% , , All ;               ; Removes all spaces, replaces with commas.
StringSplit, TestString, TestString, `, , . ; Omits periods.             ; Splits into array at commas.

if TestString%TestString0% = 
	TestString0--

Loop %TestString0%
{
StringLeft, AttyString%A_Index%, TestString%A_Index%, 3				; Stores first three characters of string.
	if ThreeString = 
		ThreeString := AttyString%A_Index%
	else
		ThreeString := ThreeString . " " . AttyString%A_Index%
}
Sort, ThreeString, U D%A_Space% 
StringSplit, ThreeString, ThreeString, %A_Space% , . ; Omits periods.     ; Splits into array at commas.

Loop %TestString0%
{
IniRead, AttyTest%A_Index%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini,  Attorneys, % ThreeString%A_Index% 
if AttyTest%A_Index% = ERROR                  ; If attorney is not an irregular one, sets AttyTest to 2aty team.
     AttyTest%A_Index% := "2" . ThreeString%A_Index%

StringLen, Atty%A_Index%Len, AttyTest%A_Index%	 
if Atty%A_Index%Len > 30                       ; If string is greater than 30 characters, meaning a runaway/blank array, sets array to blank.
	AttyTest%A_Index% = ;
}

Clipboard := ""
Loop %ThreeString0%
{
if Clipboard = 
	Clipboard := AttyTest%A_Index%
else
	Clipboard := Clipboard . ", " . AttyTest%A_Index%
}
if ClientCode = 
	ClientCode := ClientCode2

if Country = US
	Clipboard := Clipboard . ", " ATPartner . ", *FORUS, " . ClientCode . ".kmob@iwcs.kmob.com" 
else if Country != 
	Clipboard := Clipboard . ", " ATPartner
else if Country = 
	{
	MsgBox, 0, Is this *FORUS?,Click OK if it is.`n`nOtherwise`, I'll assume it isn't., 3
		ifMsgBox OK
			Clipboard := Clipboard . ", " ATPartner . ", *FORUS, " . ClientCode2 . ".kmob@iwcs.kmob.com" 
		ifMsgBox TIMEOUT		
			Clipboard := Clipboard . ", " ATPartner
	}

TrayTip, Attorneys saved to clipboard., Paste into CC: field and drag to To: field.
Sleep 2250
TrayTip
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
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ie.Document.All.loginLogout.Click()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ie.Document.All.dijit_form_Button_8_label.Click()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
	
	
TrayTip, Please wait..., Signing into EFS...
ie.Quit() ; this is if you want the ie browser to close once the string as been found
Sleep 5000
ie := ComObjCreate("InternetExplorer.Application")
ie.Visible := False
;params := [OutputVar, 4096]
params := [OutputVar, 32]
ie.Navigate(params*)
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ie.Document.All.headerSignInLink.Click()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ie.Document.All.uniqName_11_9.Value := EFSPayEmail
ie.Document.All.uniqName_11_10.Value := EFSPayPassword
Sleep 250
ie.Document.All.dijit_form_Button_10.Click()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
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
IniRead, Keystrokes, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, Keystrokes
StringLen, NameLen, Username
StringLen, DateLen, ATDate
KeystrokesSaved := (NameLen + DateLen + 3)
Keystrokes+=%KeystrokesSaved%
IniWrite, %Keystrokes%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, Keystrokes
return

RecordDateShortcut:
IniRead, DateShortcut, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, DateShortcut
DateShortcut++
IniWrite, %DateShortcut%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, DateShortcut
return

RecordAttyFinder:
IniRead, AttyFinder, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AttyFinder
AttyFinder++
IniWrite, %AttyFinder%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AttyFinder
return

RecordCalExtend:
IniRead, CalExtend, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CalExtend
CalExtend++
IniWrite, %CalExtend%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CalExtend
IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
SendInput, ^0
return

RecordSysSwitch:
IniRead, SysSwitch, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SysSwitch
SysSwitch++
IniWrite, %SysSwitch%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SysSwitch
return

RecordExcelHLink:
IniRead, ExcelHLink, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ExcelHLink
ExcelHLink++
IniWrite, %ExcelHLink%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ExcelHLink
return

RecordEFSCertFinder:
IniRead, EFSCertFinder, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSCertFinder
EFSCertFinder++
IniWrite, %EFSCertFinder%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSCertFinder
return

RecordCopyAction:
IniRead, CopyAction, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CopyAction
CopyAction++
IniWrite, %CopyAction%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, CopyAction
return

RecordPasteAction:
IniRead, PasteAction, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, PasteAction
PasteAction++
IniWrite, %PasteAction%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, PasteAction
return

RecordSuggestRemarks:
IniRead, SuggestRemarks, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SuggestRemarks
SuggestRemarks++
IniWrite, %SuggestRemarks%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SuggestRemarks
return

RecordClientCodeIE:
IniRead, ClientCodeIE, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
ClientCodeIE++
IniWrite, %ClientCodeIE%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
return

RecordEFSFill:
IniRead, EFSFill, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSFill
EFSFill++
IniWrite, %EFSFill%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSFill
return

RecordEFSLogin:
IniRead, EFSLogin, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSLogin
EFSLogin++
IniWrite, %EFSLogin%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSLogin
return

RecordHotCornerBL:
IniRead, AHotCornerBL, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBL
AHotCornerBL++
IniWrite, %AHotCornerBL%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBL
return

RecordHotCornerTR:
IniRead, AHotCornerTR, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerTR
AHotCornerTR++
IniWrite, %AHotCornerTR%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerTR
return

RecordHotCornerBR:
IniRead, AHotCornerBR, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBR
AHotCornerBR++
IniWrite, %AHotCornerBR%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AHotCornerBR
return

RecordWorkSpaceOpener:
IniRead, WorkSpaceOpener, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, WorkSpaceOpener
WorkSpaceOpener++
IniWrite, %WorkSpaceOpener%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, WorkSpaceOpener
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;       EFS Cert/Password Finder     ;;
;;              !ATY Team             ;;
;;               Passive              ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GetPassword:
ie := WBGet()
IniRead, Password, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\EFS - UNC.ini, EFS, %AttyCert%
Sleep 1000
TrayTip, %AttyCert%, Password: %Password%
ie.document.parentWindow.frames("entrustTruePassGuiFrame").document.GetElementsBytagname("INPUT")[0].Value := AttyCert ; Username
ie.document.parentWindow.frames("entrustTruePassGuiFrame").document.GetElementsBytagname("INPUT")[2].Value := Password ; Password
ie.document.parentWindow.frames("entrustTruePassGuiFrame").document.GetElementsBytagname("INPUT")[3].Click()  ; Checkbox
if WinActive("ahk_class SunAwtFrame") || WinActive("ahk_class ApplicationFrameWindow")
	{
	SendInput %AttyCert%
	Send {Tab}
	Sleep 1250
	Send {Tab}
	Send ^+{Left}
	Sleep 500
	Send {BackSpace}
	Sleep 200
	Send %Password%
	}
AttyCert := ""
Password := ""
Sleep 3000
TrayTip
gosub RecordEFSCertFinder
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;¿                                                           ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#If WinActive("ahk_class IEFrame") || WinActive("ahk_class SunAwtFrame") || WinActive("ahk_class ApplicationFrameWindow")


::!ASJ::
global AttyCert := "\\docs-oc\files\USPTO\Aaron.Johnson.epf"
gosub, GetPassword
return

::!ADZ::
global AttyCert := "\\docs-oc\files\USPTO\Alexander.Zeng.epf"
gosub, GetPassword
return

::!MXR::
global AttyCert := "\\docs-sd\files\USPTO\Mark.Rubinshtein.epf"
gosub, GetPassword
return

::!NIG::
global AttyCert := "\\docs-oc\files\USPTO\Noorean.Gill.epf"
gosub, GetPassword
return

::!DXC::
global AttyCert := "\\docs-oc\files\USPTO\David.Cohen.epf"
gosub, GetPassword
return

::!DWK::
global AttyCert := "\\docs-sf\files\USPTO\David.Kellogg.epf"
gosub, GetPassword
return

::!LLS::
global AttyCert := "\\docs-sd\files\USPTO\Loni.Morrow.epf"
gosub, GetPassword
return

::!MBH::
global AttyCert := "\\ny-docs\files\USPTO\Mitch.Hadley.epf"
gosub, GetPassword
return

::!DCT::
global AttyCert := "\\docs-sd\files\USPTO\Dylan.Turner.epf"
gosub, GetPassword
return

::!RHP::
global AttyCert := "\\docs-sd\files\USPTO\Rick.Park.epf"
gosub, GetPassword
return


::!SGS::
global AttyCert := "\\docs-sf\files\USPTO\Scott.Siera.epf"
gosub, GetPassword
return

::!VXT::
global AttyCert := "\\docs-oc\files\USPTO\Vlad.Teplitskiy.epf"
gosub, GetPassword
return

::!JPL::
global AttyCert := "\\docs-oc\files\USPTO\Josepher.Li.epf"
gosub, GetPassword
return

::!BHL::
global AttyCert := "\\docs-sf\files\USPTO\Ben.Liu.epf"
gosub, GetPassword
return

::!CDD::
global AttyCert := "\\docs-sd\files\USPTO\Casey.Donahoe.epf"
gosub, GetPassword
return

::!JJC::
global AttyCert := "\\docs-oc\files\USPTO\Jeremy.Carney.epf"
gosub, GetPassword
return

::!JZA::
global AttyCert := "\\docs-oc\files\USPTO\Jessica.Achtsam.epf"
gosub, GetPassword
return

::!NJL::
global AttyCert := "\\docs-oc\files\USPTO\Nathan.Lee.epf"
gosub, GetPassword
return

::!SYW::
global AttyCert := "\\docs-oc\files\USPTO\Sabrina.Wang.epf"
gosub, GetPassword
return

::!AKD::
global AttyCert := "\\docs-oc\files\USPTO\Angela.Dremann.epf"
gosub, GetPassword
return

::!ZJH::
global AttyCert := "\\docs-oc\files\USPTO\Zach.Hong.epf"
gosub, GetPassword
return

::!AUK::
global AttyCert := "\\docs-oc\files\USPTO\Alexander.Kappner.epf"
gosub, GetPassword
return

::!AJG::
global AttyCert := "\\docs-oc\files\USPTO\Adam.Gilbert.epf"
gosub, GetPassword
return

::!AXJ::
global AttyCert := "\\docs-oc\files\USPTO\Agnes.Juang.epf"
gosub, GetPassword
return

::!AJS::
global AttyCert := "\\docs-oc\files\USPTO\Albert.Sueiras.epf"
gosub, GetPassword
return

::!AJM::
global AttyCert := "\\docs-oc\files\USPTO\Alex.Martinez.epf"
gosub, GetPassword
return

::!AZ4::
global AttyCert := "\\docs-oc\files\USPTO\Allison.Weimer.epf"
gosub, GetPassword
return

::!AGB::
global AttyCert := "\\docs-oc\files\USPTO\Allyson.Brown.epf"
gosub, GetPassword
return

::!ACC::
global AttyCert := "\\docs-oc\files\USPTO\Amy.Chun.epf"
gosub, GetPassword
return

::!AMD::
global AttyCert := "\\docs-oc\files\USPTO\Andrew.Douglas.epf"
gosub, GetPassword
return

::!AIK::
global AttyCert := "\\docs-oc\files\USPTO\Andrew.Kimmel.epf"
gosub, GetPassword
return

::!AWL::
global AttyCert := "\\docs-oc\files\USPTO\Andrew.Lloyd.epf"
gosub, GetPassword
return

::!AVS::
global AttyCert := "\\docs-oc\files\USPTO\Andrew.Schwaab.epf"
gosub, GetPassword
return

::!AHS::
global AttyCert := "\\docs-oc\files\USPTO\Andrew.Simpson.epf"
gosub, GetPassword
return

::!ASR::
global AttyCert := "\\docs-oc\files\USPTO\Art Rose.epf"
gosub, GetPassword
return

::!BJE::
global AttyCert := "\\docs-oc\files\USPTO\Ben.Everton.epf"
gosub, GetPassword
return

::!BAK::
global AttyCert := "\\docs-oc\files\USPTO\Benajmain.Katzenellenbogen.epf"
gosub, GetPassword
return

::!WBB::
global AttyCert := "\\docs-oc\files\USPTO\Bill.Bunker.epf"
gosub, GetPassword
return

::!WHS::
global AttyCert := "\\docs-oc\files\USPTO\Bill.Shreve.epf"
gosub, GetPassword
return

::!BRB::
global AttyCert := "\\docs-oc\files\USPTO\Brent Babcock.epf"
gosub, GetPassword
return

::!BMD::
global AttyCert := "\\docs-oc\files\USPTO\Brent Dougal.epf"
gosub, GetPassword
return

::!BCC::
global AttyCert := "\\docs-oc\files\USPTO\Brian Claassen.epf"
gosub, GetPassword
return

::!BZS::
global AttyCert := "\\docs-oc\files\USPTO\Bridget Smith.epf"
gosub, GetPassword
return

::!BSI::
global AttyCert := "\\docs-oc\files\USPTO\Bruce.Itchkawitz.epf"
gosub, GetPassword
return

::!BWW::
global AttyCert := "\\docs-oc\files\USPTO\Bryan.Wahl.epf"
gosub, GetPassword
return

::!CKL::
global AttyCert := "\\docs-oc\files\USPTO\Catherine.Lee.epf"
gosub, GetPassword
return

::!CYL::
global AttyCert := "\\docs-oc\files\USPTO\Chang.Lim.epf"
gosub, GetPassword
return

::!CSC::
global AttyCert := "\\docs-oc\files\USPTO\Che.Chereskin.epf"
gosub, GetPassword
return

::!CXR::
global AttyCert := "\\docs-oc\files\USPTO\Christopher Ross.epf"
gosub, GetPassword
return

::!CSS::
global AttyCert := "\\docs-oc\files\USPTO\Craig.Summers.epf"
gosub, GetPassword
return

::!CRH::
global AttyCert := "\\docs-oc\files\USPTO\Curtis.Huffmire.epf"
gosub, GetPassword
return

::!CCD::
global AttyCert := "\\docs-oc\files\USPTO\Curtiss.Dosier.epf"
gosub, GetPassword
return

::!DJH::
global AttyCert := "\\docs-oc\files\USPTO\Damien.Howard.epf"
gosub, GetPassword
return

::!DEA::
global AttyCert := "\\docs-oc\files\USPTO\Dan.Altman.epf"
gosub, GetPassword
return

::!DJF::
global AttyCert := "\\docs-oc\files\USPTO\Dan.Fischer.epf"
gosub, GetPassword
return

::!DVG::
global AttyCert := "\\docs-oc\files\USPTO\Daniel.Gibson.epf"
gosub, GetPassword
return

::!DLO::
global AttyCert := "\\docs-oc\files\USPTO\Darrell.Olson.epf"
gosub, GetPassword
return

::!DSB::
global AttyCert := "\\docs-oc\files\USPTO\David.Barnhill.epf"
gosub, GetPassword
return

::!DMD::
global AttyCert := "\\docs-oc\files\USPTO\David.Dremann.epf"
gosub, GetPassword
return

::!DGK::
global AttyCert := "\\docs-oc\files\USPTO\David.G.Kim.epf"
gosub, GetPassword
return

::!DGJ::
global AttyCert := "\\docs-oc\files\USPTO\David.Jankowski.epf"
gosub, GetPassword
return

::!DRS::
global AttyCert := "\\docs-oc\files\USPTO\David.Schmidt.epf"
gosub, GetPassword
return

::!DVK::
global AttyCert := "\\docs-oc\files\USPTO\David.T.Kim.epf"
gosub, GetPassword
return

::!DRB::
global AttyCert := "\\docs-oc\files\USPTO\Derek.Bayles.epf"
gosub, GetPassword
return

::!DXD::
global AttyCert := "\\docs-oc\files\USPTO\Devanie.Dufour.epf"
gosub, GetPassword
return

::!DGM::
global AttyCert := "\\docs-oc\files\USPTO\Doug.Muehlhauser.epf"
gosub, GetPassword
return

::!DXW::
global AttyCert := "\\docs-oc\files\USPTO\Douglas.Wentzel.epf"
gosub, GetPassword
return

::!EAS::
global AttyCert := "\\docs-oc\files\USPTO\Ed.Schlatter.epf"
gosub, GetPassword
return

::!GVH::
global AttyCert := "\\docs-oc\files\USPTO\Gerard.vonHoffmann.epf"
gosub, GetPassword
return

::!GLN::
global AttyCert := "\\docs-oc\files\USPTO\Glen.Nuttall.epf"
gosub, GetPassword
return

::!HXM::
global AttyCert := "\\docs-oc\files\USPTO\Hans.Mayer.epf"
gosub, GetPassword
return

::!HZS::
global AttyCert := "\\docs-oc\files\USPTO\Harnik.Shukla.epf"
gosub, GetPassword
return

::!HCS::
global AttyCert := "\\docs-oc\files\USPTO\Hochan.Song.epf"
gosub, GetPassword
return

::!IAL::
global AttyCert := "\\docs-oc\files\USPTO\Irfan.Lateef.epf"
gosub, GetPassword
return

::!JUP::
global AttyCert := "\\docs-oc\files\USPTO\Jacob.Peterson.epf"
gosub, GetPassword
return

::!JCB::
global AttyCert := "\\docs-oc\files\USPTO\Jared.Bunker.epf"
gosub, GetPassword
return

::!JZK::
global AttyCert := "\\docs-oc\files\USPTO\Jarom.Kesler.epf"
gosub, GetPassword
return

::!JAG::
global AttyCert := "\\docs-oc\files\USPTO\Jason.Gersting.epf"
gosub, GetPassword
return

::!JCS::
global AttyCert := "\\docs-oc\files\USPTO\Jason.Swartz.epf"
gosub, GetPassword
return

::!JUH::
global AttyCert := "\\docs-oc\files\USPTO\Jeffery.Hallstrom.epf"
gosub, GetPassword
return

::!JYC::
global AttyCert := "\\docs-oc\files\USPTO\Joan.Chan.epf"
gosub, GetPassword
return

::!HSU::
global AttyCert := "\\docs-oc\files\USPTO\Johannes.Hsu.epf"
gosub, GetPassword
return

::!JRK::
global AttyCert := "\\docs-oc\files\USPTO\John King.epf"
gosub, GetPassword
return

::!JMG::
global AttyCert := "\\docs-oc\files\USPTO\John.Grover.epf"
gosub, GetPassword
return

::!JHS::
global AttyCert := "\\docs-oc\files\USPTO\John.Sadlik.epf"
gosub, GetPassword
return

::!JBS::
global AttyCert := "\\docs-oc\files\USPTO\John.Sganga.epf"
gosub, GetPassword
return

::!JWG::
global AttyCert := "\\docs-oc\files\USPTO\Jon Gurka.epf"
gosub, GetPassword
return

::!JUC::
global AttyCert := "\\docs-oc\files\USPTO\Jordan.Cox.epf"
gosub, GetPassword
return

::!JYS::
global AttyCert := "\\docs-oc\files\USPTO\Joshua Stowell.epf"
gosub, GetPassword
return

::!JDB::
global AttyCert := "\\docs-oc\files\USPTO\Joshua.Berk.epf"
gosub, GetPassword
return

::!JJG::
global AttyCert := "\\docs-oc\files\USPTO\Justin.Gillett.epf"
gosub, GetPassword
return

::!KJL::
global AttyCert := "\\docs-oc\files\USPTO\Karen.Lenker.epf"
gosub, GetPassword
return

::!KAD::
global AttyCert := "\\docs-oc\files\USPTO\Karoline.Delaney.epf"
gosub, GetPassword
return

::!KXA::
global AttyCert := "\\docs-oc\files\USPTO\Kazuo.Aoki.epf"
gosub, GetPassword
return

::!KZL::
global AttyCert := "\\docs-oc\files\USPTO\Keith.Lim.epf"
gosub, GetPassword
return

::!KNS::
global AttyCert := "\\docs-oc\files\USPTO\Kent.Shum.epf"
gosub, GetPassword
return

::!LDS::
global AttyCert := "\\docs-oc\files\USPTO\Lance.Smemoe.epf"
gosub, GetPassword
return

::!LXK::
global AttyCert := "\\docs-oc\files\USPTO\Lauren.Keller.epf"
gosub, GetPassword
return

::!LGR::
global AttyCert := "\\docs-oc\files\USPTO\Lavanya.Rau.epf"
gosub, GetPassword
return

::!LHL::
global AttyCert := "\\docs-oc\files\USPTO\Linda.Liu.epf"
gosub, GetPassword
return

::!LLX::
global AttyCert := "\\docs-oc\files\USPTO\Linda.Xu.epf"
gosub, GetPassword
return

::!LLY::
global AttyCert := "\\docs-oc\files\USPTO\Lori.Yamato.epf"
gosub, GetPassword
return

::!MRB::
global AttyCert := "\\docs-oc\files\USPTO\Mark Benedict.epf"
gosub, GetPassword
return

::!MJG::
global AttyCert := "\\docs-oc\files\USPTO\Mark Gallagher.epf"
gosub, GetPassword
return

::!MED::
global AttyCert := "\\docs-oc\files\USPTO\Mark.Davis.epf"
gosub, GetPassword
return

::!MRZ::
global AttyCert := "\\docs-oc\files\USPTO\Marko.Zoretic.epf"
gosub, GetPassword
return

::!MPB::
global AttyCert := "\\docs-oc\files\USPTO\Michael.Burns.epf"
gosub, GetPassword
return

::!MRC::
global AttyCert := "\\docs-oc\files\USPTO\Michael.Christensen.epf"
gosub, GetPassword
return

::!MAG::
global AttyCert := "\\docs-oc\files\USPTO\Michael.Guiliana.epf"
gosub, GetPassword
return

::!MCL::
global AttyCert := "\\docs-oc\files\USPTO\Mike.Lee.epf"
gosub, GetPassword
return

::!MCK::
global AttyCert := "\\docs-oc\files\USPTO\Mincheol.Kim.epf"
gosub, GetPassword
return

::!NMZ::
global AttyCert := "\\docs-oc\files\USPTO\Nicholas.Zovko.epf"
gosub, GetPassword
return

::!NXB::
global AttyCert := "\\docs-oc\files\USPTO\Nira.Brand.epf"
gosub, GetPassword
return

::!NAM::
global AttyCert := "\\docs-oc\files\USPTO\Nora.Marachelian.epf"
gosub, GetPassword
return

::!OAM::
global AttyCert := "\\docs-oc\files\USPTO\Omar.AlMesned.epf"
gosub, GetPassword
return

::!PNC::
global AttyCert := "\\docs-oc\files\USPTO\Paul.Conover.epf"
gosub, GetPassword
return

::!PDO::
global AttyCert := "\\docs-oc\files\USPTO\Perry.Oldham.epf"
gosub, GetPassword
return

::!PQT::
global AttyCert := "\\docs-oc\files\USPTO\Peter.Tong.epf"
gosub, GetPassword
return

::!PMN::
global AttyCert := "\\docs-oc\files\USPTO\Philip.Nelson.epf"
gosub, GetPassword
return

::!RNN::
global AttyCert := "\\docs-oc\files\USPTO\Rabi.Narula.epf"
gosub, GetPassword
return

::!RDS::
global AttyCert := "\\docs-oc\files\USPTO\Raymond.Smith.epf"
gosub, GetPassword
return

::!RJR::
global AttyCert := "\\docs-oc\files\USPTO\Robb.Roby.epf"
gosub, GetPassword
return

::!ROS::
global AttyCert := "\\docs-oc\files\USPTO\Ron.Schoenbaum.epf"
gosub, GetPassword
return

::!RMJ::
global AttyCert := "\\docs-oc\files\USPTO\Russell.Jeide.epf"
gosub, GetPassword
return

::!SHL::
global AttyCert := "\\docs-oc\files\USPTO\Sabing.Lee.epf"
gosub, GetPassword
return

::!SAM::
global AttyCert := "\\docs-oc\files\USPTO\Salima Merani.epf"
gosub, GetPassword
return

::!SZC::
global AttyCert := "\\docs-oc\files\USPTO\Scott.Cromar.epf"
gosub, GetPassword
return

::!SXR::
global AttyCert := "\\docs-oc\files\USPTO\Scott.Raevsky.epf"
gosub, GetPassword
return

::!SXA::
global AttyCert := "\\docs-oc\files\USPTO\Sean.Ambrosius.epf"
gosub, GetPassword
return

::!SXL::
global AttyCert := "\\docs-oc\files\USPTO\Shannon.Lam.epf"
gosub, GetPassword
return

::!SNS::
global AttyCert := "\\docs-oc\files\USPTO\Sheila Swaroop.epf"
gosub, GetPassword
return

::!SCJ::
global AttyCert := "\\docs-oc\files\USPTO\Steve.Jensen.epf"
gosub, GetPassword
return

::!SPR::
global AttyCert := "\\docs-oc\files\USPTO\Steven Ruden.epf"
gosub, GetPassword
return

::!SJN::
global AttyCert := "\\docs-oc\files\USPTO\Steven.Nataupsky.epf"
gosub, GetPassword
return

::!TXN::
global AttyCert := "\\docs-oc\files\USPTO\Tak.Nishimura.epf"
gosub, GetPassword
return

::!TMC::
global AttyCert := "\\docs-oc\files\USPTO\Ted Cannon.epf"
gosub, GetPassword
return

::!TKT::
global AttyCert := "\\docs-oc\files\USPTO\Terry.Tullis.epf"
gosub, GetPassword
return

::!TGP::
global AttyCert := "\\docs-oc\files\USPTO\Theodore.Papagiannis.epf"
gosub, GetPassword
return

::!TYY::
global AttyCert := "\\docs-oc\files\USPTO\Thomas.Yee.epf"
gosub, GetPassword
return

::!VZB::
global AttyCert := "\\docs-oc\files\USPTO\Vikas.Bhargava.epf"
gosub, GetPassword
return

::!VSL::
global AttyCert := "\\docs-oc\files\USPTO\Vladimir.Lozan.epf"
gosub, GetPassword
return

::!JYW::
global AttyCert := "\\docs-oc\files\USPTO\YueJoyWang.epf"
gosub, GetPassword
return

::!ZAG::
global AttyCert := "\\docs-oc\files\USPTO\Zachary.Glantz.epf"
gosub, GetPassword
return

::!ABP::
global AttyCert := "\\docs-sd\files\USPTO\Adam.Powell.epf"
gosub, GetPassword
return

::!AEM::
global AttyCert := "\\docs-sd\files\USPTO\Andrew.Morrell.epf"
gosub, GetPassword
return

::!BBA::
global AttyCert := "\\docs-sd\files\USPTO\Ben.Anger.epf"
gosub, GetPassword
return

::!BSG::
global AttyCert := "\\docs-sd\files\USPTO\Brenden.Gingrich.epf"
gosub, GetPassword
return

::!PCS::
global AttyCert := "\\docs-sd\files\USPTO\Chris Steinhardt.epf"
gosub, GetPassword
return

::!CMD::
global AttyCert := "\\docs-sd\files\USPTO\Chris.DiLeo.epf"
gosub, GetPassword
return

::!CLS::
global AttyCert := "\\docs-sd\files\USPTO\Claine.Snow.epf"
gosub, GetPassword
return

::!DOH::
global AttyCert := "\\docs-sd\files\USPTO\Dan.Hart.epf"
gosub, GetPassword
return

::!DKY::
global AttyCert := "\\docs-sd\files\USPTO\Dan.Yarbrough.epf"
gosub, GetPassword
return

::!DPH::
global AttyCert := "\\docs-sd\files\USPTO\Daniel Hughes.epf"
gosub, GetPassword
return

::!DAK::
global AttyCert := "\\docs-sd\files\USPTO\Daniel.Kamkar.epf"
gosub, GetPassword
return

::!DZD::
global AttyCert := "\\docs-sd\files\USPTO\David.Dang.epf"
gosub, GetPassword
return

::!DPK::
global AttyCert := "\\docs-sd\files\USPTO\David.Kujawa.epf"
gosub, GetPassword
return

::!DCD::
global AttyCert := "\\docs-sd\files\USPTO\Derek.Dailey.epf"
gosub, GetPassword
return

::!DSH::
global AttyCert := "\\docs-sd\files\USPTO\Drew.Hamilton.epf"
gosub, GetPassword
return

::!EMN::
global AttyCert := "\\docs-sd\files\USPTO\Eric Nelson.epf"
gosub, GetPassword
return

::!ESF::
global AttyCert := "\\docs-sd\files\USPTO\Eric.Furman.epf"
gosub, GetPassword
return

::!FTH::
global AttyCert := "\\docs-sd\files\USPTO\Fred.Hale.epf"
gosub, GetPassword
return

::!FAN::
global AttyCert := "\\docs-sd\files\USPTO\Fred.Nicholson.epf"
gosub, GetPassword
return

::!GAH::
global AttyCert := "\\docs-sd\files\USPTO\Greg.Hermanson.epf"
gosub, GetPassword
return

::!GXM::
global AttyCert := "\\docs-sd\files\USPTO\Greg.Munchinsky.epf"
gosub, GetPassword
return

::!HZC::
global AttyCert := "\\docs-sd\files\USPTO\Heungsoo.Choi.epf"
gosub, GetPassword
return

::!IWG::
global AttyCert := "\\docs-sd\files\USPTO\Ian Gillies.epf"
gosub, GetPassword
return

::!JFH::
global AttyCert := "\\docs-sd\files\USPTO\James.Herkenhoff.epf"
gosub, GetPassword
return

::!JQD::
global AttyCert := "\\docs-sd\files\USPTO\Jane.Dai.epf"
gosub, GetPassword
return

::!JQX::
global AttyCert := "\\docs-sd\files\USPTO\Jane.Xia.epf"
gosub, GetPassword
return

::!JJJ::
global AttyCert := "\\docs-sd\files\USPTO\Jason Jardine.epf"
gosub, GetPassword
return

::!JZL::
global AttyCert := "\\docs-sd\files\USPTO\Jing.Liu.epf"
gosub, GetPassword
return

::!JMC::
global AttyCert := "\\docs-sd\files\USPTO\John Carson.epf"
gosub, GetPassword
return

::!JEG::
global AttyCert := "\\docs-sd\files\USPTO\Jordan.Gottdank.epf"
gosub, GetPassword
return

::!JMR::
global AttyCert := "\\docs-sd\files\USPTO\Joseph Reisman.epf"
gosub, GetPassword
return

::!JOM::
global AttyCert := "\\docs-sd\files\USPTO\Joseph.Mallon.epf"
gosub, GetPassword
return

::!KST::
global AttyCert := "\\docs-sd\files\USPTO\Kerry.Taylor.epf"
gosub, GetPassword
return

::!KJM::
global AttyCert := "\\docs-sd\files\USPTO\Kimberly Miller.epf"
gosub, GetPassword
return

::!KXW::
global AttyCert := "\\docs-sd\files\USPTO\Kun.Wang.epf"
gosub, GetPassword
return

::!LMF::
global AttyCert := "\\docs-sd\files\USPTO\Larry.Firestone.epf"
gosub, GetPassword
return

::!LEN::
global AttyCert := "\\docs-sd\files\USPTO\Lauren.Hockett.epf"
gosub, GetPassword
return

::!MVS::
global AttyCert := "\\docs-sd\files\USPTO\Maria.Stout.epf"
gosub, GetPassword
return

::!MMA::
global AttyCert := "\\docs-sd\files\USPTO\Mark.Abumeri.epf"
gosub, GetPassword
return

::!MWC::
global AttyCert := "\\docs-sd\files\USPTO\Mark.Catanese.epf"
gosub, GetPassword
return

::!MDM::
global AttyCert := "\\docs-sd\files\USPTO\Mark.Marsden.epf"
gosub, GetPassword
return

::!MLF::
global AttyCert := "\\docs-sd\files\USPTO\Mike.Fuller.epf"
gosub, GetPassword
return

::!NRL::
global AttyCert := "\\docs-sd\files\USPTO\Nate.Luman.epf"
gosub, GetPassword
return

::!NAI::
global AttyCert := "\\docs-sd\files\USPTO\Ned.Israelsen.epf"
gosub, GetPassword
return

::!NSB::
global AttyCert := "\\docs-sd\files\USPTO\Neil.Bartfeld.epf"
gosub, GetPassword
return

::!PYC::
global AttyCert := "\\docs-sd\files\USPTO\Paul.Chang.epf"
gosub, GetPassword
return

::!PXL::
global AttyCert := "\\docs-sd\files\USPTO\Peter.Law.epf"
gosub, GetPassword
return

::!RJS::
global AttyCert := "\\docs-sd\files\USPTO\Ray.Salenieks.epf"
gosub, GetPassword
return

::!RJH::
global AttyCert := "\\docs-sd\files\USPTO\Robert.Hilton.epf"
gosub, GetPassword
return

::!RMT::
global AttyCert := "\\docs-sd\files\USPTO\Rose.Thiessen.epf"
gosub, GetPassword
return

::!REM::
global AttyCert := "\\docs-sd\files\USPTO\Ryan Melnick.epf"
gosub, GetPassword
return

::!SCY::
global AttyCert := "\\docs-sd\files\USPTO\Samantha.Markley.epf"
gosub, GetPassword
return

::!TRA::
global AttyCert := "\\docs-sd\files\USPTO\Tom.Arno.epf"
gosub, GetPassword
return

::!TSC::
global AttyCert := "\\docs-sd\files\USPTO\Tom.Cowan.epf"
gosub, GetPassword
return

::!TJH::
global AttyCert := "\\docs-sd\files\USPTO\Travis.Hill.epf"
gosub, GetPassword
return

::!VCV::
global AttyCert := "\\docs-sd\files\USPTO\Victor.Vassar.epf"
gosub, GetPassword
return

::!VKG::
global AttyCert := "\\docs-sd\files\USPTO\Vijay.Gore.epf"
gosub, GetPassword
return

::!JXW::
global AttyCert := "\\docs-sd\files\USPTO\Jeffrey.Wu.epf"
gosub, GetPassword
return

::!DNW::
global AttyCert := "\\docs-la\files\USPTO\David.Weiss.epf"
gosub, GetPassword
return

::!MDK::
global AttyCert := "\\docs-la\files\USPTO\Mark.Kachner.epf"
gosub, GetPassword
return

::!MSO::
global AttyCert := "\\docs-la\files\USPTO\Mike.Okamoto.epf"
gosub, GetPassword
return

::!AXD::
global AttyCert := "\\docs-sf\files\USPTO\Aaron.Davis.epf"
gosub, GetPassword
return

::!ASA::
global AttyCert := "\\docs-sf\files\USPTO\Adeel.Akhtar.epf"
gosub, GetPassword
return

::!ANM::
global AttyCert := "\\docs-sf\files\USPTO\Andrew.Merickel.epf"
gosub, GetPassword
return

::!BMG::
global AttyCert := "\\docs-sf\files\USPTO\Brian Graham.epf"
gosub, GetPassword
return

::!DRT::
global AttyCert := "\\docs-sf\files\USPTO\David.Trossen.epf"
gosub, GetPassword
return

::!ELF::
global AttyCert := "\\docs-sf\files\USPTO\Eric.Fong.epf"
gosub, GetPassword
return

::!KZM::
global AttyCert := "\\docs-sf\files\USPTO\Kyu.Min.epf"
gosub, GetPassword
return

::!PSS::
global AttyCert := "\\docs-sf\files\USPTO\Paul.Stellman.epf"
gosub, GetPassword
return

::!VXL::
global AttyCert := "\\docs-sf\files\USPTO\V.Lakshmananepf.epf"
gosub, GetPassword
return

::!ZYW::
global AttyCert := "\\docs-sf\files\USPTO\Zi Wong.epf"
gosub, GetPassword
return

::!DJG::
global AttyCert := "\\dc-docs\files\USPTO\David.Grant.epf"
gosub, GetPassword
return

::!JUB::
global AttyCert := "\\dc-docs\files\USPTO\Julie.Burke.epf"
gosub, GetPassword
return

::!MUM::
global AttyCert := "\\dc-docs\files\USPTO\Mark.Metzke.epf"
gosub, GetPassword
return

::!AVB::
global AttyCert := "\\sea-docs\files\USPTO\Adam.Burks.epf"
gosub, GetPassword
return

::!AFQ::
global AttyCert := "\\sea-docs\files\USPTO\Andrew.Quecan.epf"
gosub, GetPassword
return

::!BPJ::
global AttyCert := "\\sea-docs\files\USPTO\Benjamin.Johnson.epf"
gosub, GetPassword
return

::!BGM::
global AttyCert := "\\sea-docs\files\USPTO\Bryan McWhorter.epf"
gosub, GetPassword
return

::!CTS::
global AttyCert := "\\sea-docs\files\USPTO\Christopher Sweeney.epf"
gosub, GetPassword
return

::!CBH::
global AttyCert := "\\sea-docs\files\USPTO\Colin Heideman.epf"
gosub, GetPassword
return

::!MCA::
global AttyCert := "\\sea-docs\files\USPTO\Maria Anderson.epf"
gosub, GetPassword
return

::!MAU::
global AttyCert := "\\sea-docs\files\USPTO\Mauricio Uribe.epf"
gosub, GetPassword
return

::!MJS::
global AttyCert := "\\sea-docs\files\USPTO\Melanie Seelig.epf"
gosub, GetPassword
return

::!SWF::
global AttyCert := "\\sea-docs\files\USPTO\Scott.Forbes.epf"
gosub, GetPassword
return

::!YXL::
global AttyCert := "\\sea-docs\files\USPTO\Yiheng.Li.epf"
gosub, GetPassword
return

::!ADM::
global AttyCert := "\\sv-docs\files\USPTO\Alejandro.Munoz.epf"
gosub, GetPassword
return

::!AVS::
global AttyCert := "\\sv-docs\files\USPTO\Andrew.Schwaab.epf"
gosub, GetPassword
return

::!JXV::
global AttyCert := "\\docs-la\files\USPTO\Josue.Villalta.epf"
gosub, GetPassword
return

::!EAL::
global AttyCert := "\\docs-sf\files\USPTO\EliLoots.epf"
gosub, GetPassword
return

;::!EYZ::
;REMOVED

;::!GRM::
;REMOVED

::!LSE::
global AttyCert := "\\dc-docs\files\USPTO\Lincoln.Essig.epf"
gosub, GetPassword
return

::!MHT::
global AttyCert := "\\sv-docs\files\USPTO\Michael.Trenholm.epf"
gosub, GetPassword
return

::!MZC::
global AttyCert := "\\docs-oc\files\USPTO\Morgan.Coates.epf"
gosub, GetPassword
return

::!JLP::
global AttyCert := "\\docs-oc\files\USPTO\John.Paik.epf"
gosub, GetPassword
return

#If

::PCT1201:: 
SendInput, %Today% WIPO EM PCT EP FORM 1201 - Notification of European Patent Application Number -
return

::PCT301:: 
SendInput, %Today% WIPO EM PCT/IB/301 - Notification of Receipt of Record Copy by International Bureau -
return

::PCT304:: 
SendInput, %Today% WIPO EM PCT/IB/304 - Notification Concerning Priority Documents -
return

::PCT306:: 
SendInput, %Today% WIPO EM PCT/IB/306 - Notification of Recording of Change -
return

::PCT307:: 
SendInput, %Today% WIPO EM PCT/IB/307 - Notification of Withdrawal of Applications or Designations -
return

::PCT308:: 
SendInput, %Today% WIPO EM PCT/IB/308 - Notification Concerning Transmission of Application to Designated Offices -
return

::PCT311:: 
SendInput, %Today% WIPO EM PCT/IB/311 - Notice of Publication/Republication -
return

::PCT313:: 
SendInput, %Today% WIPO EM PCT/IB/313 - Notification of Defects in International Application -
return

::PCT316:: 
SendInput, %Today% WIPO EM PCT/IB/316 - Invitation to Correct Priority Claim -
return

::PCT318:: 
SendInput, %Today% WIPO EM PCT/IB/318 - Notification Relating to Priority Claim -
return

::PCT326:: 
SendInput, %Today% WIPO EM PCT/IB/326 – Transmittal of International Preliminary Report on Patentability (IPRP) -
return

::PCT373:: 
SendInput, %Today% PCT/IB/373 237 - International Preliminary Report on Patentability (IPRP) & Written Opinion of the ISA -
Return

::PCT332:: 
SendInput, %Today% WIPO EM PCT/IB/332 - Information Concerning Elected Offices -
return

::PCT345:: 
SendInput, %Today% WIPO EM PCT/IB/345 - Miscellaneous Communication from the International Bureau -
return

::PCT368:: 
SendInput, %Today% WIPO EM PCT/IB/368 - Notification of Transmittal of Demand to IPEA -
return

::PCT370:: 
SendInput, %Today% WIPO EM PCT/IB/370 - Invitation to Correct Declarations -
return

::PCT371:: 
SendInput, %Today% WIPO EM PCT/IB/371 - Notification Relating to Declaration under PCT Rule 4.17 -
return

::PCT402:: 
SendInput, %Today% WIPO EM PCT/IPEA/402 - Notification of Receipt of Demand -
return

::PCT403:: 
SendInput, %Today% WIPO EM PCT/IPEA/403 - Notification Concerning Payment of Preliminary Exam Fees -
return

::PCT404:: 
SendInput, %Today% WIPO EM PCT/IPEA/404 - Invitation to Correct Defects in the Demand -
return

::PCT405:: 
SendInput, %Today% WIPO EM PCT/IPEA/405 - Invitation to Restrict or Pay Additional Fees -
return

::PCT408:: 
SendInput, %Today% WIPO EM PCT/IPEA/408 - Written Opinion of the Examining Authority -
return

::PCT416:: 
SendInput, %Today% WIPO EM PCT/IPEA/416 409 - International Preliminary Report on Patentability (IPRP) -
return

::PCT424:: 
SendInput, %Today% WIPO EM PCT/IPEA/424 - IPEA Miscellaneous Request -
return

::PCT427:: 
SendInput, %Today% WIPO EM PCT/IPEA/427 - Communication Regarding Extension of Time Limit -
return

::PCT429:: 
SendInput, %Today% WIPO EM PCT/IPEA/429 - Notice from IPEA Concerning Informal Communication with Applicant -
return

::PCT440:: 
SendInput, %Today% WIPO EM PCT/IPEA/440 - Invitation to Pay Late Fees -
return

::PCT441:: 
SendInput, %Today% WIPO EM PCT/IPEA/441 - Invitation to Furnish Sequence Listing -
return

::PCT202:: 
SendInput, %Today% WIPO EM PCT/ISA/202 - Notification of Receipt of Record Copy by Search Authority -
return

::PCT205:: 
SendInput, %Today% WIPO EM PCT/ISA/205 - Notification of Modification of Abstract -
return

::PCT206:: 
SendInput, %Today% WIPO EM PCT/ISA/206 - Invitation to Pay Additional Search Fees -
return

::PCT207:: 
SendInput, %Today% WIPO EM PCT/ISA/207 - Informal Clarification – Note/Invitation – from ISA -
return

::PCT220:: 
SendInput, %Today% WIPO EM PCT/ISA/220 - Transmittal of Search Report/Written Opinion -
return

::PCT210:: 
SendInput, %Today% WIPO EM PCT/ISA/210 - International Search Report -
return

::PCT237:: 
SendInput, %Today% WIPO EM PCT/ISA/237 - Written Opinion -
return

::PCT224:: 
SendInput, %Today% WIPO EM PCT/ISA/224 - Form When No Other Form Is Applicable -
return

::PCT225:: 
SendInput, %Today% WIPO EM PCT/ISA/225 - Invitation to Furnish Sequence Listing -
return

::PCT102:: 
SendInput, %Today% WIPO EM PCT/RO/102 - Notification Concerning Payment of Prescribed Fee -
return

::PCT105:: 
SendInput, %Today% WIPO EM PCT/RO/105 - Filing Receipt -
return

::PCT106:: 
SendInput, %Today% WIPO EM PCT/RO/106 - PCT Invitation to Correct Defects -
return

::PCT107:: 
SendInput, %Today% WIPO EM PCT/RO/107 - Invitation Relating to Multiple Parts -
return

::PCT110:: 
SendInput, %Today% WIPO EM PCT/RO/110 - Invitation to Correct Priority Claim -
return

::PCT111:: 
SendInput, %Today% WIPO EM PCT/RO/111 - Notification Relating to Priority Claim -
return

::PCT117:: 
SendInput, %Today% WIPO EM PCT/RO/117 - Notification of Withdrawal of Intl Application -
return

::PCT119:: 
SendInput, %Today% WIPO EM PCT/RO/119 - Notification of Refund of Fees -
return

::PCT132:: 
SendInput, %Today% WIPO EM PCT/RO/132 - Miscellaneous Communication from the PCT Receiving Office -
return

::PCT133:: 
SendInput, %Today% WIPO EM PCT/RO/133 - Invitation to Pay Prescribed Fees with Surcharge -
return

::PCT151:: 
SendInput, %Today% WIPO EM PCT/RO/151 - Notification of Transmission to the International Bureau and Invitation to Pay Fee -
return

::PCT199:: 
SendInput, %Today% WIPO EM PCT/RO/199 - Ack Receipt for 19.4 Applications -
return


/*

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