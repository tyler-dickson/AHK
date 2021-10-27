/*
Created by Tyler Dickson using AutoHotKey.

Major Release History:

The Updated Interface/Help Section Update - 1/20/2017
The Revamped Settings Menu/Extra Improved Record Opener Update - 1/10/2017
The EFS Fee Payment Log-in Update – 1/6/2017
The EFS Fill/SideBar Update – 1/4/2017
The Customized Date/Initials and Record Opener Update - 12/30/2016 
The Improved Date/Initials and Record Opener Update - 12/29/2016
The Shortcuts Bar+EFS Merging Update - 12/12/2016 
Initial Release - v1.0 - 12/8/2016
*/

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, Force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

/*
GUI List:
Gui, 1:  Main GUI
Gui, 2:  Keybindings
Gui, 3:  Keybindings Help
Gui, 4:  Restore Keybindings
OLD Gui, 5:  Record Opener/EFS Options
Gui, 8:  Decoy Settings Button
Gui, 9:  Settings Button and Arrow
Gui, 10: Settings,/Shortcut Button
Gui, 11: Decoy Settings/Shortcut Button 
Gui, 12: Easter Egg
Gui, 13: Help
Gui, 20: EFS Fill Button

Gui, 50: SideBar

Gui, 98: Paste Extra Clipboards
Gui, 99: Store Extra Clipboards
*/

/*Table of Contents:

Look for ¿ to jump.
261
328
1253
1279
1471
1712
3031
3522
3679
3816
3879
3924
4036
4214
4423
4450
4492
4676
4759

*/


;                                                   Sets Username for Remarks 
;                                                   Multiple Things in Internet Explorer
;                                                   Multiuse:
;                                                   DateExtend()
;                                                   Persistent Box on IE 
;                                                   PersistentBar()
;                                                   Store Extra Clipboard Items 
;                                                   StoreClipboard()
;                                                   Paste Extra Stored Clipboard
;                                                   PasteClipboard()
;                                                   Hotkey for Date and Initials
;                                                   DateAndName()
;                                                   Open Hyperlink from Excel
;                                                   HyperlinkFromExcel:
;                                                   Open Opposite System
;                                                   SwitchSystem()
;                                                   Suggested Remarks 
;                                                   SuggestRemarks()
;                                                   Attorney Email Finder
;                                                   AttyEmailFinder()
;                                                   ClientCodeIE()
;                                                   QuickDate()
;													Crazy COM Stuff
;                                                   OpenSideBar()
Enabled := ComObjError(false)
              ; Custom6 is no longer in use.
			  
IniRead, Custom1, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom1
IniRead, Custom2, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom2
Custom3 = ^RButton
;IniRead, Custom3, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom3
IniRead, Custom4, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom4
IniRead, Custom5, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom5
IniRead, Custom6, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom6
IniRead, Custom7, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom7
Custom10 = !LButton
Custom11 = !RButton
IniRead, QuickRecordOpener, C:\Users\lara.hamdan\AHKPrefs.ini, Username, QuickRecordOpener
	if QuickRecordOpener = ERROR
		{
		QuickRecordOpener = Alt+RightClick / Alt+LeftClick
		IniWrite, %QuickRecordOpener%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, QuickRecordOpener
		IniRead, QuickRecordOpener, C:\Users\lara.hamdan\AHKPrefs.ini, Username, QuickRecordOpener
		}
IniRead, QuickRecordOpener, C:\Users\lara.hamdan\AHKPrefs.ini, Username, QuickRecordOpener		
IniRead, CustomSideBar, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, CustomSideBar
if Custom1 = ERROR
	{
	IniWrite, +CapsLock, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom1
	IniWrite, ^``, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom2
	;IniWrite, #Space, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom3
	IniWrite, ^5, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom4
	IniWrite, ^6, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom5
	IniWrite, ^`;, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom6
	IniWrite, ^1, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom7
	Sleep 100
	IniRead, Custom1, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom1
	IniRead, Custom2, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom2
	;IniRead, Custom3, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom3
	IniRead, Custom4, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom4
	IniRead, Custom5, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom5
	IniRead, Custom6, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom6
	IniRead, Custom7, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom7
	}
if CustomSideBar = ERROR
	{
	IniWrite, https://www.google.com, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, CustomSideBar
	Sleep 100
	IniRead, CustomSideBar, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, CustomSideBar
	}
IniRead, Checkboxes, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Checkboxes
	if Checkboxes = ERROR
		{
		Checkboxes = 0,0,0,0,0,0,0,0,0
		IniWrite, %Checkboxes%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Checkboxes
		IniRead, Checkboxes, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Checkboxes
		}
IniRead, Checkboxes, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Checkboxes
IniRead, RecordBoxes, C:\Users\lara.hamdan\AHKPrefs.ini, Username, RecordBoxes
	if RecordBoxes = ERROR
		{
		RecordBoxes = 1,1,1,1,1,1
		IniWrite, %RecordBoxes%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, RecordBoxes
		IniRead, RecordBoxes, C:\Users\lara.hamdan\AHKPrefs.ini, Username, RecordBoxes
		}
IniRead, RadioChoice, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Radio
	if RadioChoice = ERROR
		{
		RadioChoice = 1,0,0
		IniWrite, %RadioChoice%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Radio
		IniRead, RadioChoice, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Radio
		}
IniRead, EFSEmail, C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSEmail
	if EFSEmail = ERROR
		{
		EFSEmail = instructions@knobbe.com
		IniWrite, %EFSEmail%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSEmail
		IniRead, EFSEmail, C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSEmail
		}
IniRead, SettingsX,     C:\Users\lara.hamdan\AHKPrefs.ini, Username, SettingsX
	if SettingsX = ERROR
		{
		SettingsX = 1
		IniWrite, %SettingsX%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, SettingsX
		IniRead,   SettingsX,  C:\Users\lara.hamdan\AHKPrefs.ini, Username, SettingsX
		}
IniRead, SettingsY,    C:\Users\lara.hamdan\AHKPrefs.ini, Username, SettingsY
	if SettingsY = ERROR	
		{
		SettingsY = 917
		IniWrite, %SettingsY%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, SettingsY
		IniRead,   SettingsY,  C:\Users\lara.hamdan\AHKPrefs.ini, Username, SettingsY
		}	
IniRead, SidebarX,    C:\Users\lara.hamdan\AHKPrefs.ini, Username, SidebarX
	if SidebarX = ERROR	
		{
		SidebarX = 2557
		IniWrite, %SidebarX%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, SidebarX
		IniRead,   SidebarX,  C:\Users\lara.hamdan\AHKPrefs.ini, Username, SidebarX
		}			
IniRead, Keystrokes, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, Keystrokes
	if Keystrokes = ERROR
		{
		Keystrokes = 0
		IniWrite, %Keystrokes%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, Keystrokes
		IniRead, Keystrokes, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, Keystrokes
		}
IniRead, DateShortcut, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, DateShortcut
	if DateShortcut = ERROR
		{
		DateShortcut = 0
		IniWrite, %DateShortcut%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, DateShortcut
		IniRead, DateShortcut, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, DateShortcut
		}
IniRead, AttyFinder, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, AttyFinder
	if AttyFinder = ERROR
		{
		AttyFinder = 0
		IniWrite, %AttyFinder%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, AttyFinder
		IniRead, AttyFinder, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, AttyFinder
		}
IniRead, CalExtend, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, CalExtend
	if CalExtend = ERROR
		{
		CalExtend = 0
		IniWrite, %CalExtend%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, CalExtend
		IniRead, CalExtend, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, CalExtend
		}
IniRead, SysSwitch, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, SysSwitch
	if SysSwitch = ERROR
		{
		SysSwitch = 0
		IniWrite, %SysSwitch%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, SysSwitch
		IniRead, SysSwitch, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, SysSwitch
		}
IniRead, ExcelHLink, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, ExcelHLink
	if ExcelHLink = ERROR
		{
		ExcelHLink = 0
		IniWrite, %ExcelHLink%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, ExcelHLink
		IniRead, ExcelHLink, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, ExcelHLink
		}
IniRead, EFSCertFinder, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, EFSCertFinder
	if EFSCertFinder = ERROR
		{
		EFSCertFinder = 0
		IniWrite, %EFSCertFinder%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, EFSCertFinder
		IniRead, EFSCertFinder, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, EFSCertFinder
		}
IniRead, CopyAction, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, CopyAction
	if CopyAction = ERROR
		{
		CopyAction = 0
		IniWrite, %CopyAction%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, CopyAction
		IniRead, CopyAction, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, CopyAction
		}
IniRead, PasteAction, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, PasteAction
	if PasteAction = ERROR
		{
		PasteAction = 0
		IniWrite, %PasteAction%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, PasteAction
		IniRead, PasteAction, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, PasteAction
		}
IniRead, SuggestRemarks, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, SuggestRemarks
	if SuggestRemarks = ERROR
		{
		SuggestRemarks = 0
		IniWrite, %SuggestRemarks%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, SuggestRemarks
		IniRead, SuggestRemarks, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, SuggestRemarks
		}
IniRead, ClientCodeIE, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, ClientCodeIE
	if ClientCodeIE = ERROR
		{
		ClientCodeIE = 0
		IniWrite, %ClientCodeIE%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, ClientCodeIE
		IniRead, ClientCodeIE, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, ClientCodeIE
		}
IniRead, EFSFill, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, EFSFill
	if EFSFill = ERROR
		{
		EFSFill = 0
		IniWrite, %EFSFill%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, EFSFill
		IniRead, EFSFill, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, EFSFill
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
goto Reopen
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;       Quick TM/Patent Opener       ;;
;;   Ctrl+K / Alt + RClick/LClick     ;;
;;     Might be unnecessary soon      ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^!RButton::
SendInput ^c
Clipwait .25
;Gui, Submit
SplashTextOn, 250, , Opening record in docketing.
OutputVar1 = http://oc-docketing/CPi/tmkschTrademark.aspx
OutputVar2 = http://oc-docketing/CPi/patschCountryApplication.aspx
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar1, 32]
   params2:= [OutputVar2, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
   ie.Visible := True
   params := [OutputVar1, 32]
   params2:= [OutputVar2, 32]
}
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
Sleep 1000
IfWinExist, ahk_class #32770                   ;Message from webpage
	{
	;WinHide
	WinClose, ahk_class #32770
	ie.Navigate(params2*)
	While IE.Busy ; simple wait for page to load
	Sleep, 100 ; 1/10 second
	;IELoad(wb)
	ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
	ie.Document.All.btnStartSearch.Click()
	While IE.Busy ; simple wait for page to load
	Sleep, 100 ; 1/10 second
	;IELoad(wb)
	}
ie.Visible := True
WinActivate, ahk_class IEFrame
SplashTextOff
gosub RecordClientCodeIE
return

Custom10:
SendInput ^c
Clipwait .25
;Gui, Submit
SplashTextOn, 250, , Opening a TM in docketing.
OutputVar = http://oc-docketing/CPi/tmkschTrademark.aspx
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
   ie.Visible := True
   params := [OutputVar, 32]
}
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
SplashTextOff
gosub RecordClientCodeIE
return

Custom11:
SendInput ^c
Clipwait .25
SplashTextOn, 250, , Opening a Patent in docketing.
OutputVar = http://oc-docketing/CPi/patschCountryApplication.aspx
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
   ie.Visible := True
   params := [OutputVar, 32]
}
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
SplashTextOff
gosub RecordClientCodeIE
return
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;            Settings Menu           ;;
;;           CTRL + CapsLock          ;;
;;   Stores data in lara.hamdan.ini  ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



^CapsLock::
Reopen:
FormatTime, TimeStamp, R
;CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
;MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
IniRead, Username, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Username
IniRead, ATPartner, C:\Users\lara.hamdan\AHKPrefs.ini, Username, ATPartner
IniRead, ATDate, C:\Users\lara.hamdan\AHKPrefs.ini, Username, ATDate
IniRead, Checkboxes, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Checkboxes
IniRead, RecordBoxes, C:\Users\lara.hamdan\AHKPrefs.ini, Username, RecordBoxes
IniRead, RadioChoice, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Radio
StringSplit, Checkboxes, Checkboxes, `, ,
StringSplit, RecordBoxes, RecordBoxes, `, ,
StringSplit, RadioChoice, RadioChoice, `, ,
IniRead, EFSFirst,       C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSFirst
IniRead, EFSLast,        C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSLast
IniRead, EFSEmail,       C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSEmail
IniRead, EFSPayEmail,    C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSPayEmail
IniRead, EFSPayPassword, C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSPayPassword
IniRead, QuickRecordOpener, C:\Users\lara.hamdan\AHKPrefs.ini, Username, QuickRecordOpener
;Msgbox %Checkboxes0%, %Checkboxes1%%Checkboxes2%%Checkboxes3%%Checkboxes4%%Checkboxes5%%Checkboxes6%%Checkboxes7%%Checkboxes8%
;Msgbox %RecordBoxes0%, %RecordBoxes1%%RecordBoxes2%%RecordBoxes3%%RecordBoxes4%%RecordBoxes5%%RecordBoxes6%
Sleep 200
Gui, 1: New, +AlwaysOnTop, Settings Menu
Gui, Add, Tab3, x1 y0 w300 h390 +Center, Miscellaneous|Multiuse|EFS/SideBar|  ;Keybindings ;
Gui, Tab, 1
Gui, 1:Add, GroupBox, x5 y30 w290 h85,
Gui, 1:Add, Checkbox, cBlue x10 y30 Checked%Checkboxes2% vOption2, Enable Quick Date and Initials (Shift + CapsLock)
Gui, 1:Font, italic
Gui, 1:Add, Text, x20 y50 w260 +Center, *Make sure you add formatting punctuation.* 
Gui, 1:Font
Gui, 1:Add, GroupBox, +Center x10 y65 w75 h45, Date
Gui, 1: Add, Edit, x15 y80 w65 h20 +Center vATDate, %ATDate%
Gui, 1: Add, Text, x86 y84 w110, Test remarks go here.
Gui, 1: Add, GroupBox, +Center x190 y65 w100 h45, Username
Gui, 1: Add, Edit, x195 y80 w90 h20 +Center vUsername, %Username%

Gui, 1:Add, GroupBox, x5 y122 w290 h40, 
Gui, 1:Add, Checkbox, cBlue x10 y122 Checked%Checkboxes4% vOption4, Enable System Switch Shortcut (Control + ~)
Gui, 1:Font, italic
Gui, 1:Add, Text, x14 y142 w270 +Center, *Allows switching between Live and Audit Trail systems.*
Gui, 1:Font

Gui, 1:Add, GroupBox, x5 y170 w290 h65, 
Gui, 1:Add, Checkbox, cBlue x10 y170  Checked%Checkboxes5% vOption5, Enable Settings/Shortcuts Bar (Control + CapsLock)
Gui, 1:Font, Italic
Gui, 1:Add, Text, x10 y188 w135 +Center, *Most enabled options will appear as optional shortcuts on the Settings Bar.*
Gui, 1:Font
Gui, 1:Add, GroupBox, +Center x150 y185 w140 h43, Settings Bar Positioning
Gui, 1:Add, Edit, x157 y200 w60 h20, gSettingsPosX,
Gui, 1:Add, UpDown, Horz 16 Left 0x80 wp vSettingsX gUpDownButton2 Range1-5000, %SettingsX%	
Gui, 1:Add, Edit, x224 y200 w60 h20, gSettingsPosY,
Gui, 1:Add, UpDown, Left 0x80 wp vSettingsY gUpDownButton Range1200-1, %SettingsY%

Gui, 1:Add, GroupBox, x5 y244 w290 h40, 
Gui, 1:Add, Checkbox, cBlue x10 y244 Checked%Checkboxes6% vOption6, Enable Store/Paste Extra Clipboards (Control + 5/6)
Gui, 1:Font, Italic
Gui, 1:Add, Text, x10 y264 w270 +Center, *See Help section for detailed usage instructions.*
Gui, 1:Font

Gui, 1:Add, GroupBox, x5 y293 w290 h50, 
Gui, 1:Add, Checkbox, cBlue x10 y293 Checked%Checkboxes8% vOption8, Enable Open Hyperlink from Excel (Control + 1)
Gui, 1:Font, Italic
Gui, 1:Add, Text, x10 y310 w270 +Center, *Most people won't need to use this function.*`n*It is used for Facing and Past Due Reports, etc.*
Gui, 1:Font
Gui, 1:Font, bold
Gui, 1: Add, Button, x5 y350 w40 h30 gOpenHelp , Help
Gui, 1:Font
Gui, 1: Add, Button, x70 y350 w80 h30 Default gaOK , Update
Gui, 1: Add, Button, x155 y350 w80 h30 gCancel , Cancel

Gui, 1: Font, s6
Gui, 1: Add, Text, x255 h10 y375, v.1.20.2017
Gui, 1: Font

Gui, Tab, 2
Gui, 1:Add, GroupBox, x5 y30 w290 h75,
Gui, 1:Add, Checkbox, cBlue x10 y30 Checked%Checkboxes3% gNoRemarks1 vOption3, Enable Multiuse (Hold Control, then Right Click.)
Gui, 1:Add, Text, x10 y50 , Includes: Calendar Extender, Remarks Suggester,`n`t`t    Attorney Finder, and Record Opener 
Gui, 1:Add, Checkbox, cGreen x65 y84 Checked%Checkboxes1% gNoRemarks2 vOption1, Auto-remarks on Calendar Extend?
Gui, 1:Add, GroupBox, cGreen  x5   y110 w290 h205, Record Opener (Select options to appear on pop-up.)
Gui, 1:Add, GroupBox, +Center x10  y130 w90 h50, Patent
Gui, 1:Add, GroupBox, +Center x105 y130 w90 h50, Trademark
Gui, 1:Add, GroupBox, +Center x200 y130 w89 h50, Invention
Gui, 1:Add, Checkbox, x18 y150  Checked%RecordBoxes1% gClearA vRecordBox1, Live
Gui, 1:Add, Checkbox, x63 y150  Checked%RecordBoxes2% gClearB vRecordBox2, AT
Gui, 1:Add, Checkbox, x113 y150 Checked%RecordBoxes5% gClearC vRecordBox5, Live
Gui, 1:Add, Checkbox, x158 y150 Checked%RecordBoxes6% gClearD vRecordBox6, AT
Gui, 1:Add, Checkbox, x208 y150 Checked%RecordBoxes3% gClearE vRecordBox3, Live
Gui, 1:Add, Checkbox, x253 y150 w30 Checked%RecordBoxes4% gClearF vRecordBox4, AT
Gui, 1:Add, GroupBox, cGreen x10 y185 w280 h50, Force Only Patent/TM? (No pop-up or AT option.)
Gui, 1:Add, Radio, x25  y205 h20 w32          Checked%RadioChoice1% vRadioChoice1, Off
Gui, 1:Add, Radio, x113 y205 h20 w50 gClear1 Checked%RadioChoice2% vRadioChoice2, Patent
Gui, 1:Add, Radio, x208 y205 h20 w70 gClear2 Checked%RadioChoice3% vRadioChoice3, Trademark
Gui, 1:Add, GroupBox, cGreen x10 y240 w280 h65, Quick Record Opener (Ignores above preferences.)
Gui, 1:Font, bold
Gui, 1: Add, Groupbox,    x40 y257 w220 h43 +Center, Patent   |   Trademark
Gui, 1: Font
	if QuickRecordOpener = Alt+LeftClick / Alt+RightClick
		Gui, 1:Add, DropDownList, R2 x70 y273 w163 h15 +Center vQuickRecordOpener, %QuickRecordOpener%||Alt+RightClick / Alt+LeftClick
	if QuickRecordOpener = Alt+RightClick / Alt+LeftClick
		Gui, 1:Add, DropDownList, R2 x70 y273 w163 h15 +Center vQuickRecordOpener, %QuickRecordOpener%||Alt+LeftClick / Alt+RightClick
Gui, 1:Add, GroupBox, cGreen x5  y320 w290 h67, Attorney Finder AT Partner (Appended to attorneys.)
Gui, 1:Add, GroupBox, +Center x40 y338 w220 h43, FirstName.LastName
Gui, 1:Add, Edit,     x70 y353 w163 h20 +Center vATPartner, %ATPartner%

Gui, Tab, 3
Gui, 1:Add, GroupBox, x5 y30 w290 h75,
Gui, 1:Add, Checkbox, cBlue x10 y30 Checked%Checkboxes7% gShowEFSButton vOption7, Enable EFS Options (!ATY in EFS + Pop-out Menu.) 
Gui, 1:Add, Text, x10 y50 , Includes: EFS Certificate and Password Finder,`n`t           EFS Information Filler, and EFS Fees Log-in 
Gui, 1:Add, Button, x65 y80 w175 h20 gPopEFSButton,Pop-out EFS Options
Gui, 1:Add, GroupBox, cGreen  x5  y110 w155 h145, EFS Filler Information
Gui, 1:Add, Text, x10 h20 y130 w144 +Center, First Name:
Gui, 1:Add, Edit, x10 h20 y145 w144 Limit +Center vEFSFirst, %EFSFirst%
Gui, 1:Add, Text, x10 h20 y170 w144 +Center, Last Name:
Gui, 1:Add, Edit, x10 h20 y185 w144 Limit +Center vEFSLast, %EFSLast%
Gui, 1:Add, Text, x10 h20 y210 w144 +Center, Filing Email Address:
	if EFSEmail = instructions@knobbe.com
		Gui, 1:Add, DropDownList, R2 x10 h20 y225 w144 +Center vEFSEmail, %EFSEmail%||efiling@knobbe.com
	else if EFSEmail = efiling@knobbe.com
		Gui, 1:Add, DropDownList, R2 x10 h20 y225 w144 +Center vEFSEmail, %EFSEmail%||instructions@knobbe.com
Gui, 1:Add, GroupBox, cGreen  x165  y110 w130 h145, EFS Fees Log-in Info
Gui, 1:Font, Italic
Gui, 1:Add, Text, x170 h40 y128 w120 +Center, *Use about two minutes prior to paying to avoid log-in screen.*
Gui, 1:Font
Gui, 1:Add, Text, x170 h20 y170 w120 +Center, Fees Email/Username:
Gui, 1:Add, Edit, x170 h20 y185 w120 +Left vEFSPayEmail, %EFSPayEmail%
Gui, 1:Font
Gui, 1:Add, Text, x170 h20 y210 w120 +Center, Fees Password:
Gui, 1:Add, Edit, x170 h20 y225 w120 +Left Password vEFSPayPassword, %EFSPayPassword%
Gui, 1:Add, GroupBox, cGreen  x85 y260 w130 h50, MapIt!
Gui, 1:Add, Button, gMapIt x90 y280 w120 h20, Map Other Drives
Gui, 1:Add, GroupBox, x5  y320 w290 h67, 
Gui, 1:Add, GroupBox, +Center x10  y338 w135 h43, SideBar Function 
Gui, 1:Add, Checkbox, cBlue x10 y320 Checked%Checkboxes9% vOption9, Enable SideBar (Custom action on edge of screen.)
	if CustomSideBar = ;
		Gui, 1: Add, ComboBox, Sort R20 x15 y355 w125 h12 +Center vCustomSideBar, calc.exe||www.google.com|calc.exe|iexplore.exe|Kronos|Settings Menu|Paste Clipboards|Copy Clipboards|Quick Date and Initials|Hyperlink from Excel|System Switch|Quick Today's Date|
	else
		Gui, 1: Add, ComboBox, Sort R20 x15 y355 w125 h12 +Center vCustomSideBar, %CustomSideBar%||www.google.com|calc.exe|iexplore.exe|Kronos|Settings Menu|Paste Clipboards|Copy Clipboards|Quick Date and Initials|Hyperlink from Excel|System Switch|Quick Today's Date|
Gui, 1:Add, GroupBox, +Center x150 y338 w140 h43, SideBar Positioning
Gui, 1:Add, Edit, x190 y355 w60 h20, gSideBarPosX,
Gui, 1:Add, UpDown, Horz 16 Left 0x80 wp vSideBarX gSideBarPos Range1-5000, %SideBarX%	
Gui, 1: Show, h390 w300

/*
Gui, Tab, 4
Gui, 1:Font, 
Gui, 1:Add, Text, +Center ,Quick Date and Initials [ Shift + CapsLock ]
Gui, 1:Add, Edit, h15 w200 +Center vCustom1, %Custom1%
Gui, 1:Add, Text, ,Quick Current Date [ Ctrl + `; ]
Gui, 1:Add, Edit, h15 w200 +Center vCustom6, %Custom6%
Gui, 1:Add, Text, +Center ,System Switch Shortcut [ Ctrl + `` ]
Gui, 1:Add, Edit, h15 w200 +Center vCustom2, %Custom2%
;Gui, 2:Font, 
;Gui, 2:Add, Text, +Center ,Settings/Shortcuts Bar [ Top of IE ]
;Gui, 2:Font, s12
;Gui, 2:Add, Edit, h25 w200 +Center vCustom3, %Custom3%
Gui, 1:Add, Text, +Center ,Store Extra Clipboard [ Ctrl + 5 ]
Gui, 1:Add, Edit, h15 w200 +Center vCustom4, %Custom4%
Gui, 1:Add, Text, +Center ,Paste Extra Clipboard [ Ctrl + 6 ]
Gui, 1:Add, Edit, h15 w200 +Center vCustom5, %Custom5%
Gui, 1:Add, Text, ,Open Hyperlink from Excel [ Ctrl + 1 ]
Gui, 1:Add, Edit, h15 w200 +Center vCustom7, %Custom7%
Gui, 1:Add, Text, w200 Center, Nothing on this tab is currently active,`nso no changes will be saved.
Gui, 1:Add, Text, w200 x10 Center ,Sorry for the inconvenience!
Gui, 1:Add, Button, x29 y360 h25 w50 gHKeySubmit, Update
Gui, 1:Add, Button, x99 y360 h25 w100 gHKeyRestore, Restore Defaults
*/

/*
Gui, 2:Add, Text, +Center ,Quick Date and Initials [ Shift + CapsLock ]
Gui, 2:Font, s12
Gui, 2:Add, Hotkey, ReadOnly h25 w200 +Center vCustom1, %Custom1%
Gui, 2:Font, 
Gui, 2:Add, Text, ,Quick Current Date [ Ctrl + `; ]
Gui, 2:Font, s12
Gui, 2:Add, Hotkey, ReadOnly h25 w200 +Center vCustom6, %Custom6%
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,System Switch Shortcut [ Ctrl + `` ]
Gui, 2:Font, s12
Gui, 2:Add, Hotkey, h25 w200 +Center vCustom2, %Custom2%
;Gui, 2:Font, 
;Gui, 2:Add, Text, +Center ,Settings/Shortcuts Bar [ Top of IE ]
;Gui, 2:Font, s12
;Gui, 2:Add, Hotkey, ReadOnly h25 w200 +Center vCustom3, %Custom3%
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,Store Extra Clipboard [ Ctrl + 5 ]
Gui, 2:Font, s12
Gui, 2:Add, Hotkey, ReadOnly h25 w200 +Center vCustom4, %Custom4%
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,Paste Extra Clipboard [ Ctrl + 6 ]
Gui, 2:Font, s12
Gui, 2:Add, Hotkey, ReadOnly h25 w200 +Center vCustom5, %Custom5%
Gui, 2:Font, 
Gui, 2:Add, Text, ,Open Hyperlink from Excel [ Ctrl + 1 ]
Gui, 2:Font, s12
Gui, 2:Add, Hotkey, ReadOnly h25 w200 +Center vCustom7, %Custom7%
Gui, 2:Font, bold
Gui, 2:Add, Text, w200 +Center,Changing these won't do anything right now
WinGetPos , X, Y, Width, Height, ahk_class AutoHotkeyGUI
NewXR := X + 300
NewYR := Y + 0
NewXL := X - 253
NewYL := Y + 0
NewXD := X + 0
NewYD := Y + 390
NewXRestore := NewXR + 0
NewYRestore := Y + 390
*/
WinGetPos , X, Y, Width, Height, ahk_class AutoHotkeyGUI
NewXR := X + 300
NewYR := Y + 0
NewXL := X - 253
NewYL := Y + 0
NewXD := X + 0
NewYD := Y + 390
NewXRestore := NewXR + 0
NewYRestore := Y + 390
Gui, 3:New, +AlwaysOnTop +Owner, Left Menu
Gui, 3:Font, s11 underline bold
Gui, 3:Add, Text, w225 +Center ,QUICK TIPS RE: SHORTCUTS
Gui, 3:Font, s12 norm
Gui, 3:Add, Text, +Center,NOTE: Modifying shortcuts can`ninterfere with system functions!`n`nYou likely can't break anything...`n...but be cautious.
Gui, 3:Font, s11 underline bold
Gui, 3:Add, Text, w225 +Center ,COMMON MODIFIER KEYS
Gui, 3:Font, s12 norm
Gui, 3:Add, Text, w225 +Center,# = Windows Key`n! = Alt`n^ = Control`n+ = Shift
Gui, 3:Add, Link, x38 w225 +Center, <a href="https://autohotkey.com/docs/Hotkeys.htm">Help on Modifier choices.</a>
Gui, 3:Add, Link, x43 w225 +Center, <a href="https://autohotkey.com/docs/KeyList.htm">Help on Button choices.</a>`n`n
Gui, 3:Add, Button, x14 y365 w225 h25 gNeedHelp,Click here to ask for help!
Gui, 3:Color, FEDCBA
Gui, 3:+ToolWindow -Caption 
Gui, 4:New, +AlwaysOnTop +Owner, Restore Defaults
Gui, 4:+ToolWindow -Caption 
Gui, 4:Add, Text, , You're about to restore all default shortcuts!
Gui, 4:Font,
Gui, 4:Add, Button, x28 y25 h25 w50 gYesRestore, Restore
Gui, 4:Add, Button, x98 y25 h25 w100 gDontRestore, Nevermind
return

SidebarPos:
Gui, 28:Destroy
Gui, 28:New, +Owner +AlwaysOnTop, SidebarPosition
Gui, 28:Add, Button, x0 y0 w3 h1040, 
Gui, 28:+ToolWindow -Caption 
Gui, 28:Color, 000111                           ; can be any colour but it's good to use a color that is NOT present in ur GUI
Gui, 28:Show, X%SettingsX% Y%SettingsY% h25 , SidebarPosition
WinSet, Transcolor, 000111, SidebarPosition
Gui, 28:Show, x%SidebarX% y20 w5 h1060
return

UpDownButton:
Gui, 18:Destroy
Gui, 18:New, +Owner +AlwaysOnTop, SettingsPosition
Gui, 18:Add, Button, x0 y0 h20, Test Position  
Gui, 18:+ToolWindow -Caption 
Gui, 18:Color, 000111                           ; can be any colour but it's good to use a color that is NOT present in ur GUI
Gui, 18:Show, X%SettingsX% Y%SettingsY% h25 , SettingsPosition
WinSet, Transcolor, 000111, SettingsPosition
Gui, 18:Show
return

UpDownButton2:
Gui, 18:Destroy
Gui, 18:New, +Owner +AlwaysOnTop, SettingsPosition
Gui, 18:Add, Button, x0 y0 h25, Test Position  
Gui, 18:+ToolWindow -Caption 
Gui, 18:Color, 000111                           ; can be any colour but it's good to use a color that is NOT present in ur GUI
Gui, 18:Show, X%SettingsX% Y%SettingsY% h25 , SettingsPosition
WinSet, Transcolor, 000111, SettingsPosition
Gui, 18:Show
return

MapIt:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
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


OpenHelp:
		Gui, 13:Destroy
		Gui, 13:New, AlwaysOnTop, AutoHotKey Help
		Gui, 13:Font
		Gui, 13:Add, Tab3, Buttons x5 y0 w400 h495 , Quick Date and Initials|System Switch|Settings/Shortcuts Bar|Store/Paste Clipboards|Hyperlink from Excel|Multiuse|EFS Cert Finder + Info Fill + Fee Login|Custom SideBar
		
		Gui, 13: Tab, 1
		Gui, 13:Font, bold underline
		Gui, 13:Add, Text, x10 y80 w390 +Center, Quick Date and Initials
		Gui, 13:Font
		Gui, 13:Add, Text, x10 y120 w390 +Center +Wrap, Default Keybinding (Shift + CapsLock)`n`nQuick Date and Initials will quickly add your current Remarks Date and Remarks Username into docketing.`n`nThere are three ways to use this function:`n`n1) When used on a blank line, the date and your username will be typed, and the cursor will jump to the center for quick typing.`n`n2) When placed at the beginning of a line of remarks, the text will be encapsulated by the date and your username.`n`n3) Remarks longer than one line in length can be completely selected. When the shortcut is used, the remarks will be encapsulated between the date and your username. This will also automatically remove the * - that occasionally generates automatically on actions.`n`n***Be sure to include punctuation to customize the appearance of your remarks!`n`ne.g. "12/14/16 -" and "-FLASTNAME".
		Gui, 13:Add, Button, gExample1, Examples
		
		Gui, 13: Tab, 2
		Gui, 13:Font, bold underline
		Gui, 13:Add, Text, x10 y80 w390 +Center, System Switch Shortcut
		Gui, 13:Font
		Gui, 13:Add, Text, x10 y120 w390 +Center +Wrap, Default Keybinding (Ctrl + ~ or Shortcuts Bar)`n`nSystem Switch allows you to quickly switch between the Live and Audit Trail systems with the press of a button.`n`nThis can take you from a Live Trademark or Patent main screen to an AT Trademark or AT Patent main screen and vice versa.`n`nIt can also take you from a Live Trademark or Patent Action to an AT Trademark or AT Patent main screen and vice versa.`n`nUnfortunately, switching from a Live Action to an AT Action or vice versa isn't possible. This also doesn't work from the Invention screen and would be difficult to implement. Consider using the Record Opener to jump to directly to a main screen.
		Gui, 13:Add, Button, gExample2, Examples
		
		Gui, 13: Tab, 3
		Gui, 13:Font, bold underline
		Gui, 13:Add, Text, x10 y80 w390 +Center, Settings/Shortcuts Bar
		Gui, 13:Font
		Gui, 13:Add, Text, x10 y120 w390 +Center +Wrap, Default Keybinding (Automatic, Optional)`n`nThe Settings/Shortcuts Bar is a quick way to return to the Settings Menu, and is useful as an alternate way to use the other available functions.`n`nThe position of the bar can be customized to appear wherever you’d like by adjusting the coordinate fields.`n`nThe first field controls the horizontal position, and the second field controls the vertical position. When changing the values, an example Test Button will appear to show you where the bar will appear once activated.`n`nMost enabled options will have a shortcut added to the bar for easy access. Clicking the >> button will show or hide the options when not needed.`n`nThis is an optional choice since all of the functions can be used with other shortcut methods.		
		Gui, 13:Add, Button, gExample3, Examples
		
		Gui, 13: Tab, 4
		Gui, 13:Font, bold underline
		Gui, 13:Add, Text, x10 y80 w390 +Center, Store/Paste Extra Clipboards
		Gui, 13:Font
		Gui, 13:Add, Text, x10 y120 w390 +Center +Wrap, Default Keybinding (Copy: Ctrl + 5, Paste: Ctrl + 6)`n`tAlso works from the Shortcuts Bar.`n`nThis option allows you store additional clipboards (i.e. Ctrl + C or copying text) for pasting at a later time while still utilizing the default Ctrl + C shortcut.`n`nHow to Copy:`n1) Select the desired text you would like to store.`n2) Press Ctrl + 5 (or use the Shortcuts Bar). A menu you will appear with several available slots.`n3) Choose a slot to store the selected text.`n`4) The menu will disappear and your text will be stored for later use.`n`nHow to Paste:`n1) When you're ready to paste stored text, press Ctrl + 6 (or use the Shortcuts Bar). A menu will pop-up showing you your stored text.`n2) Click where you'd like to paste the text.`n3) Click on the slot with your desired text, and it will get typed as if you pasted it with Ctrl + V.`n`nThis works best with shorter, simple text without images or hyperlinks. The text will be converted to plaintext and any formatting will be stripped.
		Gui, 13:Add, Button, gExample4, Examples
		
		Gui, 13: Tab, 5
		Gui, 13:Font, bold underline
		Gui, 13:Add, Text, x10 y80 w390	+Center, Open Hyperlink from Excel
		Gui, 13:Font
		Gui, 13:Add, Text, x10 y120 w390 +Center +Wrap, Default Keybinding (Ctrl + 1 or Shortcuts Bar)`n`nThis option allows you to open hyperlinks from Excel directly into docketing. This typically isn't possible due to limitations of Excel.`n`nThis function is mostly for Master Docket, *IntFees, and *Abandonment for running Facing and Past Due reports. Most users won't need to use this option, but it is available just in case.`n`nSee example images to see what kind of links you can open with this shortcut.
		Gui, 13:Add, Button, gExample5, Examples
		
		Gui, 13: Tab, 6
		Gui, 13:Font, bold underline
		Gui, 13:Add, Text, x10 y80 w390 +Center, Calendar Extender/Remarks Suggester/`nAttorney Finder/Record Opener
		Gui, 13:Font
		Gui, 13:Add, Text, x10 y120 w390 +Center +Wrap, Default Keybinding (Ctrl + Right Click)`n`nAll of the below functions are activated by highlighting text, and then holding Control and Right Clicking.`n`nCalendar Extender allows you to quickly extend a date in docketing by certain intervals of time (1W, 2W, 1M, 2M, 3M, 6M, 1Y). If auto-remarks are turned on, remarks will be automatically added, noting the date, the duration of the extension, and your username. Only the Responsible person's initials need to be added.`n`nRemarks Suggester is functional but barebones. Selecting an action will provide typical remarks to paste. Currently works on Status Checks.`n`nAttorney Finder allows you to select a block of attorneys in docketing, which will then remove the duplicates, substitute irregular names, and add your AT partner to your Clipboard. You can then paste into the CC field and move the responsible person to the To field. No more 2JCS/2JSC issues`n`nRecord Opener will open a Client Code directly into docketing. You can customize which menu options appear on the pop-up, or force Patent/TM only. Works anywhere you can select text and is VERY quick. See examples for possible places to select Client Codes.`n`nQuick Record Opener ignores your other settings and is always functional. You can customize which button opens Patent and which opens Trademark. Activate with Alt + RightClick/LeftClick
		Gui, 13:Add, Button, gExample6, Examples
		
		Gui, 13: Tab, 7
		Gui, 13:Font, bold underline
		Gui, 13:Add, Text, x10 y80 w390 +Center, EFS Certificate and Password Finder`nEFS Information Filler`nEFS Fees Log-in
		Gui, 13:Font
		Gui, 13:Add, Text, x10 y120 w390 +Center +Wrap, Default Keybindings (Certificate and Password Finder - !ATY)`n(EFS Information Filler/EFS Fees Log-in - Settings/Shortcuts Bar or Pop-out Menu.)`n`nEFS Certificate and Password Finder is used when signing into EFS for processing an assigned QC. Typing !ATY will auto-fill the certificate's location, and then find and enter the password into EFS. This is especially useful when the information isn't specifically provided when the QC is assigned.`n`t***This can occasionally fail. Simply try again. If you encounter a missing 2ATY team or incorrect password, email Tyler and it will be updated right away.`n`nInformation Filler will auto-fill the information to access the assigned EFS ID. Press the 'Pop-out EFS Options' button in Settings or on the Shortcuts Bar to pop-out a window. Click Fill EFS Sections. The screen will jump a bit, and it should fill in the fields.`n`t***This may fail the first time. Access the URL in IE and delete everything from the ? over. Press Enter to reload the page, then try running it again.`n`nEFS Fees Log-in allows you to premptively sign into the EFS Fees system so it won't log you out every fifteen minutes.`n`t***I suggest running this when starting a QC, or two minutes prior to completing one, so you'll be logged in when you finish and avoid the log-in screen.
		Gui, 13:Add, Button, gExample7, Examples
		
		Gui, 13: Tab, 8
		Gui, 13:Font, bold underline
		Gui, 13:Add, Text, x10 y80 w390 +Center, Custom SideBar
		Gui, 13:Font
		Gui, 13:Add, Text, x10 y120 w390 +Center +Wrap, Default Keybinding (Automatic)`n`nThe Custom SideBar places a very thin (3 pixels wide!) persistent bar on the right side of your right monitor. You can also customize the position by adjusting the coordinate field.`n`nAn example SideBar will show when adjusting the values so you can place it as desired. If positioned correctly, you can barely see it when you have other windows up.`n`nYou can customize this bar to open a website or program, and many AutoHotkey functions are available as well.`n`nDefault options include Calculator, Internet Explorer, Kronos, and Google. You could save WIPO or EPO websites if you'd like.`n`nOnly a single custom option can be saved at this time, but perhaps additional sections could be added.
		Gui, 13:Add, Button, gExample8, Examples
		
		Gui, 13:Show, w410 h500 x%NewXL% y%NewYL%
		;Gui, 3:Hide
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
	PasteClipboard()
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

ShowEFSButton:
GuiControlGet, StatusButton10, , Option7
if StatusButton10 = 0
Gui, Tab, 3
	GuiControl, 1: Hide , Button16
if StatusButton10 = 1
	GuiControl, 1: Show , Button16
Gui, Tab, 1
return

PopEFSButton:
Gui, 20: New, AlwaysOnTop Owner, EFS Functions
Gui, 20: Add, Button, x5 y2 w100 gFillEFS, Fill EFS Sections
Gui, 20: Add, Button, x107 y2 w100 gEFSPayLogIn, Log into EFS Fees
Gui, 20: +ToolWindow
Gui, 20: Show
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

NeedHelp:
Run, "mailto:tyler.dickson@knobbe.com?Subject=AutoHotKey"
return

HKeyRestore:
Gui, 4:Show, h60 w225 x%NewXRestore% y%NewYRestore%
return

YesRestore:
Gui, 1:Hide
Gui, 2:Hide
Gui, 3:Hide
Gui, 4:Hide
Gui, 13:Hide
SplashTextOn,100,, Restoring...
Sleep 1250
HotKR = 0
SplashTextOff
Gui, 2:Destroy
Gui, 2:New, +AlwaysOnTop +Owner, Remap
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,Quick Date and Initials [ Shift + Caps Lock ]
Gui, 2:Font, s12
Gui, 2:Add, Hotkey, h25 w200 +Center vCustom1, +CapsLock
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,System Switch Shortcut [ Ctrl + `` ]
Gui, 2:Font, s12
Gui, 2:Add, Hotkey, h25 w200 +Center vCustom2, ^```
;Gui, 2:Font, 
;Gui, 2:Add, Text, +Center ,System Switch Button [ Windows + Space ]
;Gui, 2:Font, s12
;Gui, 2:Add, Hotkey, h25 w200 +Center vCustom3, #Space
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,Store Extra Clipboard [ Ctrl + 5 ]
Gui, 2:Font, s12
Gui, 2:Add, Hotkey, h25 w200 +Center vCustom4, ^5
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,Paste Extra Clipboard [ Ctrl + 6 ]
Gui, 2:Font, s12
Gui, 2:Add, Hotkey, h25 w200 +Center vCustom5, ^6
Gui, 2:Font, 
Gui, 2:Add, Text, ,Create Shortcut Abbreviations [ Ctrl + `; ]
Gui, 2:Font, s12
Gui, 2:Add, Hotkey, h25 w200 +Center vCustom6, ^;
Gui, 2:Font, 
Gui, 2:Add, Text, ,Open Hyperlink from Excel [ Ctrl + 1 ]
Gui, 2:Font, s12
Gui, 2:Add, Hotkey, h25 w200 +Center vCustom7, ^1
Gui, 2:Font, 
Gui, 2:Add, Button, x29 y360 h25 w50 gHKeySubmit, Update
Gui, 2:Add, Button, x99 y360 h25 w100 gHKeyRestore, Restore Defaults
Gui, 2:Color, ABCDEF
Gui, 2:+ToolWindow -Caption
Gui, 2:Submit
IniWrite, %Custom1%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom1
IniWrite, %Custom2%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom2
;IniWrite, %Custom3%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom3
IniWrite, %Custom4%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom4
IniWrite, %Custom5%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom5
IniWrite, %Custom6%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom6
IniWrite, %Custom7%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom7
Reload
Sleep 500
MsgBox, Unable to restart script. Please restart manually.
return

DontRestore:
Gui, 4:Hide
return

HKeySubmit:
Gui, 13:Hide
Gui, 1:Hide
Gui, 2:Submit
Gui, 3:Hide
Gui, 4:Hide
MsgBox, We need to restart the script for your changes to take effect.`n`nRestarting now...`n`nUPDATE 12/7/16 - Custom hotkeys are temporarily disabled pending feedback/testing. Sorry for the inconvenience! -TYLER
;IniWrite, %Custom1%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom1
;IniWrite, %Custom2%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom2
;IniWrite, %Custom3%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom3
;IniWrite, %Custom4%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom4
;IniWrite, %Custom5%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom5
;IniWrite, %Custom6%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom6
;IniWrite, %Custom7%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom7
Reload
Sleep 500
MsgBox, Unable to restart script. Please restart manually.
return

/*
HotkeyR:
	if HotKR = 0
		{
		GuiControl, 1: , Button4, ←
		Gui, 2:Show, w225 h390 x%NewXR% y%NewYR%
		HotKR = 1
		return
		}
	if HotKR = 1
		{
		GuiControl, 1: , Button4, →
		Gui, 2:Hide
		Gui, 4:Hide
		HotKR = 0
		return
		}
return

HotkeyL:
	if HotKL = 0
		{
		Gui, 13: Hide
		GuiControl, 1: , Button5, →
		Gui, 3:Show, w253 h390 x%NewXL% y%NewYL%
		HotKL = 1
		HelpKL = 0
		return
		}
	if HotKL = 1
		{
		Gui, 13: Hide
		GuiControl, 1: , Button5, ←
		Gui, 3:Hide
		HotKL = 0
		HelpKL = 0
		return
		}
*/

return

aOK:
Gui, 1:Submit
;Gui, 5:Submit
Gui, 28:Destroy
Gui, 18:Destroy
HotKL = 0
HotKR = 0
HotKD = 0
HelpKL = 0
;MsgBox, %Option1%%Option2%%Option3%%Option4%%Option5%%Option6%%Option7%%Option8%
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%,%Option9%
RecordBoxes = %RecordBox1%,%RecordBox2%,%RecordBox3%,%RecordBox4%,%RecordBox5%,%RecordBox6%
RadioChoice = %RadioChoice1%,%RadioChoice2%,%RadioChoice3%
Gui, New, +AlwaysOnTop, Information Updated
Gui, Add, Text,Center , This is how your remarks will now appear:`n`n "%ATDate% Insert default comments here. %Username%." `n`n Your partner is set as %ATPartner%.
Gui, Add, Button, w80 h30 Default Center gDone , OK
Gui, Show
IniWrite, %Username%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Username
IniWrite, %ATPartner%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, ATPartner
IniWrite, %ATDate%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, ATDate
IniWrite, %Checkboxes%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Checkboxes
IniWrite, %RecordBoxes%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, RecordBoxes
IniWrite, %Custom1%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom1
IniWrite, %Custom2%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom2
;IniWrite, %Custom3%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom3
IniWrite, %Custom4%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom4
IniWrite, %Custom5%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom5
IniWrite, %Custom6%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom6
IniWrite, %Custom7%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, Custom7
IniWrite, %CustomSideBar%, C:\Users\lara.hamdan\AHKPrefs.ini, Custom, CustomSideBar
IniWrite, %EFSFirst%,C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSFirst
IniWrite, %EFSLast%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSLast
IniWrite, %EFSEmail%,C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSEmail
IniWrite, %RadioChoice%,C:\Users\lara.hamdan\AHKPrefs.ini, Username, Radio
IniWrite, %EFSPayEmail%,    C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSPayEmail
IniWrite, %EFSPayPassword%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSPayPassword
IniWrite, %QuickRecordOpener%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, QuickRecordOpener
IniWrite, %SettingsX%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, SettingsX
IniWrite, %SettingsY%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, SettingsY
IniWrite, %SidebarX%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, SidebarX
IniRead, SettingsX, C:\Users\lara.hamdan\AHKPrefs.ini, Username, SettingsX
IniRead, SettingsY, C:\Users\lara.hamdan\AHKPrefs.ini, Username, SettingsY
IniRead, SidebarX, C:\Users\lara.hamdan\AHKPrefs.ini, Username, SidebarX
IniWrite, %A_Now%`n, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, lara.hamdan, LastUpdated
IniWrite, v1.20.2017, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Version, Version
Gui, 8:Destroy
Gui, 9:Destroy
Gui, 10:Destroy
Gui, 11:Destroy
Hotkey, %Custom1%, Custom1, Off
Hotkey, %Custom2%, Custom2, Off
Hotkey, %Custom3%, Custom3, Off
Hotkey, %Custom4%, Custom4, Off
Hotkey, %Custom5%, Custom5, Off			
Hotkey, %Custom7%, Custom7, Off
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
return

Done:
Gui, Destroy
Return

Cancel:
{
Gui, 1:Submit
;Gui, 5:Submit
Gui, 28:Destroy
Gui, 18:Destroy
HotKL = 0
HotKR = 0
HotKD = 0
HelpKL = 0
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
PasteClipboard()
return
	
Custom6: ; This is for EFS Cert Finder now. Since there isn't a hotkey, it isn't really necessary. See way down below.
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
Gui, 50:Show, x2557 y20 w5 h1040
Gui, 50:+ToolWindow -Caption                           ; Removes the Border and Task bar icon
Gui, 50:Color, 000111, SideBar                                ; can be any colour but it's good to use a color that is NOT present in ur GUI
WinSet, Transcolor, 000111, SideBar
Gui, 50:Show, x2557 y20 w5 h1060
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
	SplashTextOn, 150, , Blank clipboard. Try again.
	Sleep 1000
	SplashTextOff
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
IniRead, RecordBoxes, C:\Users\lara.hamdan\AHKPrefs.ini, Username, RecordBoxes
IniRead, RadioChoice, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Radio
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
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
   ie.Visible := True
   params := [OutputVar, 32]
}
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
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
   ie.Visible := True
   params := [OutputVar, 32]
}
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
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
   ie.Visible := True
   params := [OutputVar, 32]
}
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
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
   ie.Visible := True
   params := [OutputVar, 32]
}
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
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
   ie.Visible := True
   params := [OutputVar, 32]
}
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
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
   ie.Visible := True
   params := [OutputVar, 32]
}
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


DateExtend()
{
IniRead, Checkboxes, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Checkboxes
StringSplit, Checkboxes, Checkboxes, `, ,
CoordMode, Mouse, Screen       ;Place mouse coordinates at absolute screen coordinates (multiple monitor)
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
Gui, Add, Button, x68 y192 w37 gAdd1W, +1W
Gui, Add, Button, x111 y192 w37 gAdd2W, +2W
;Gui, Add, Button, x154 y192 w37 gAddTBD1, TBD1
;Gui, Add, Button, x197 y192 w37 gAddTBD2, TBD2
;Gui, Add, Button, x197 y192 w37 gAddTBD3, TBD3
;Gui, Add, Checkbox, x197 y192 Checked%Checkboxes1% vOption1, Remarks?
Gui, Add, Checkbox, x164 y198 Checked%Checkboxes1% vOption1, Remarks?
NewY := (ypos - 265)
NewX := (xpos - 50)
Gui, Show, x%NewX% y%NewY% , Calendar Selection
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
IniWrite, %Checkboxes%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Checkboxes
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
IniRead, Username, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\lara.hamdan\AHKPrefs.ini, Username, ATDate
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
ExtendRemarks = %ATDate% Extend 1M per . %Username% 
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
IniWrite, %Checkboxes%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Checkboxes
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
	StringReplace, MyMonthCal, MyMonthCal, May, July
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
IniRead, Username, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\lara.hamdan\AHKPrefs.ini, Username, ATDate
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
ExtendRemarks = %ATDate% Extend 2M per . %Username% 
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
IniWrite, %Checkboxes%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Checkboxes
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
IniRead, Username, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\lara.hamdan\AHKPrefs.ini, Username, ATDate
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
ExtendRemarks = %ATDate% Extend 3M per . %Username% 
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
IniWrite, %Checkboxes%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Checkboxes
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
IniRead, Username, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\lara.hamdan\AHKPrefs.ini, Username, ATDate
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
ExtendRemarks = %ATDate% Extend 6M per . %Username% 
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
IniWrite, %Checkboxes%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Checkboxes
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
IniRead, Username, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\lara.hamdan\AHKPrefs.ini, Username, ATDate
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
ExtendRemarks = %ATDate% Extend 1YR per . %Username% 
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
IniWrite, %Checkboxes%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Checkboxes
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
IniRead, Username, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\lara.hamdan\AHKPrefs.ini, Username, ATDate
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
ExtendRemarks = %ATDate% Extend 1W per . %Username% 
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
IniWrite, %Checkboxes%, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Checkboxes
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
IniRead, Username, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\lara.hamdan\AHKPrefs.ini, Username, ATDate
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
ExtendRemarks = %ATDate% Extend 2W per . %Username% 
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
IniRead, SettingsX, C:\Users\lara.hamdan\AHKPrefs.ini, Username, SettingsX
IniRead, SettingsY, C:\Users\lara.hamdan\AHKPrefs.ini, Username, SettingsY
Slot1X := 105
Slot2X := 210
Slot3X := 315
Slot4X := 420
Slot5X := 525
Slot6X := 630
Slot7X := 735
global SettingsHidden = 0
IniRead, Checkboxes, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Checkboxes
StringSplit, Checkboxes, Checkboxes, `, ,
Slots = XXX%Checkboxes4%%Checkboxes5%%Checkboxes6%%Checkboxes7%%Checkboxes8%
Gui, 9:New,  +AlwaysOnTop +Owner, Settings1
Gui, 11:New, +AlwaysOnTop +Owner, Test
Gui, 10:New, +AlwaysOnTop +Owner, Persist
Gui, 9:Add, Button,   x0 y5 w75 h20 gCustomBut1, Settings         ;    ^CapsLock - Settings
Gui, 9:Add, Button,  x78 y5 w25 h20 gHideSettings, >>
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
	Gui, 10:Add, Button, x%Slot1X% y5 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot1X% y5 w100 h20, Excel Hyperlink		         ;Option 8 - ^1 - Open Excel Hyperlink	
	}
if Slots = XXX01010
	{
	Gui, 10:Add, Button, x%Slot1X% y5 w100 h20 gCustomBut6, Fill EFS Sections		 ;Quick link to Fill EFS Sections
	Gui, 11:Add, Button, x%Slot1X% y5 w100 h20, Fill EFS Sections			 ;Quick link to Fill EFS Sections	
	}
if Slots = XXX01011
	{
	Gui, 10:Add, Button, x%Slot1X% y5 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot1X% y5 w100 h20, Excel Hyperlink		 ;Option 8 - ^1 - Open Excel Hyperlink	
	Gui, 10:Add, Button, x%Slot2X% y5 w100 h20 gCustomBut6, Fill EFS Sections		 ;Quick link to Fill EFS Sections
	Gui, 11:Add, Button, x%Slot2X% y5 w100 h20, Fill EFS Sections			 ;Quick link to Fill EFS Sections	
	}
if Slots = XXX01100
	{
	Gui, 10:Add, Button, x%Slot1X% y5 w100 h20 gCustomBut3, Copy++		 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot1X% y5 w100 h20, Copy++		   	 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot2X% y5 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y5 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards
	}
if Slots = XXX01101
	{
	Gui, 10:Add, Button, x%Slot1X% y5 w100 h20 gCustomBut3, Copy++		 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot1X% y5 w100 h20, Copy++		   	 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot2X% y5 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y5 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 10:Add, Button, x%Slot3X% y5 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot3X% y5 w100 h20, Excel Hyperlink		 ;Option 8 - ^1 - Open Excel Hyperlink	
	}
if Slots = XXX01110
	{
	Gui, 10:Add, Button, x%Slot1X% y5 w100 h20 gCustomBut3, Copy++		 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot1X% y5 w100 h20, Copy++		   	 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot2X% y5 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y5 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 10:Add, Button, x%Slot3X% y5 w100 h20 gCustomBut6, Fill EFS Sections		 ;Quick link to Fill EFS Sections
	Gui, 11:Add, Button, x%Slot3X% y5 w100 h20, Fill EFS Sections			 ;Quick link to Fill EFS Sections	
	}
if Slots = XXX01111
	{
	Gui, 10:Add, Button, x%Slot1X% y5 w100 h20 gCustomBut3, Copy++		 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot1X% y5 w100 h20, Copy++		   	 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot2X% y5 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y5 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards	
	Gui, 10:Add, Button, x%Slot3X% y5 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot3X% y5 w100 h20, Excel Hyperlink		 ;Option 8 - ^1 - Open Excel Hyperlink	
	Gui, 10:Add, Button, x%Slot4X% y5 w100 h20 gCustomBut6, Fill EFS Sections		 ;Quick link to Fill EFS Sections
	Gui, 11:Add, Button, x%Slot4X% y5 w100 h20, Fill EFS Sections			 ;Quick link to Fill EFS Sections	
	}
if Slots = XXX11000
	{
	Gui, 10:Add, Button, x%Slot1X% y5 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y5 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	}
if Slots = XXX11001
	{
	Gui, 10:Add, Button, x%Slot1X% y5 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y5 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y5 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot2X% y5 w100 h20, Excel Hyperlink		 ;Option 8 - ^1 - Open Excel Hyperlink	
	}
if Slots = XXX11010
	{
	Gui, 10:Add, Button, x%Slot1X% y5 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y5 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y5 w100 h20 gCustomBut6, Fill EFS Sections		 ;Quick link to Fill EFS Sections
	Gui, 11:Add, Button, x%Slot2X% y5 w100 h20, Fill EFS Sections			 ;Quick link to Fill EFS Sections	
	}
if Slots = XXX11011
	{
	Gui, 10:Add, Button, x%Slot1X% y5 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y5 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y5 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot2X% y5 w100 h20, Excel Hyperlink		 ;Option 8 - ^1 - Open Excel Hyperlink	
	Gui, 10:Add, Button, x%Slot3X% y5 w100 h20 gCustomBut6, Fill EFS Sections		 ;Quick link to Fill EFS Sections
	Gui, 11:Add, Button, x%Slot3X% y5 w100 h20, Fill EFS Sections			 ;Quick link to Fill EFS Sections	
	}
if Slots = XXX11100
	{
	Gui, 10:Add, Button, x%Slot1X% y5 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y5 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y5 w100 h20 gCustomBut3, Copy++		 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y5 w100 h20, Copy++		   	 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot3X% y5 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot3X% y5 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards
	}
if Slots = XXX11101
	{
	Gui, 10:Add, Button, x%Slot1X% y5 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y5 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y5 w100 h20 gCustomBut3, Copy++		 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y5 w100 h20, Copy++		   	 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot3X% y5 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot3X% y5 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards	
	Gui, 10:Add, Button, x%Slot4X% y5 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot4X% y5 w100 h20, Excel Hyperlink		 ;Option 8 - ^1 - Open Excel Hyperlink	
	}
if Slots = XXX11110
	{
	Gui, 10:Add, Button, x%Slot1X% y5 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y5 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y5 w100 h20 gCustomBut3, Copy++		 ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y5 w100 h20, Copy++		   	 ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot3X% y5 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot3X% y5 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards	
	Gui, 10:Add, Button, x%Slot4X% y5 w100 h20 gCustomBut6, Fill EFS Sections		 ;Quick link to Fill EFS Sections
	Gui, 11:Add, Button, x%Slot4X% y5 w100 h20, Fill EFS Sections			 ;Quick link to Fill EFS Sections	
	}
if Slots = XXX11111
	{
	Gui, 10:Add, Button, x%Slot1X% y5 w100 h20 gCustomBut2, Switch System    ;Option 4 - ^` - System Switch
	Gui, 11:Add, Button, x%Slot1X% y5 w100 h20, Switch System                ;Option 4 - ^` - System Switch
	Gui, 10:Add, Button, x%Slot2X% y5 w100 h20 gCustomBut3, Copy++		     ;Option 6 - ^5 - Copy Extra Clipboards
	Gui, 11:Add, Button, x%Slot2X% y5 w100 h20, Copy++		   			     ;Option 6 - ^5 - Copy Extra Clipboards	
	Gui, 10:Add, Button, x%Slot3X% y5 w100 h20 gCustomBut4, Paste++          ;Option 6 - ^6 - Paste Extra Clipboards
	Gui, 11:Add, Button, x%Slot3X% y5 w100 h20, Paste++                      ;Option 6 - ^6 - Paste Extra Clipboards	
	Gui, 10:Add, Button, x%Slot4X% y5 w100 h20 gCustomBut5, Excel Hyperlink	 ;Option 8 - ^1 - Open Excel Hyperlink
	Gui, 11:Add, Button, x%Slot4X% y5 w100 h20, Excel Hyperlink		         ;Option 8 - ^1 - Open Excel Hyperlink	
	Gui, 10:Add, Button, x%Slot5X% y5 w100 h20 gCustomBut6, Fill EFS Sections			 ;Quick link to Fill EFS Sections
	Gui, 11:Add, Button, x%Slot5X% y5 w100 h20, Fill EFS Sections			             ;Quick link to Fill EFS Sections	
	}
Gui, 9: +ToolWindow -Caption                           ; Removes the Border and Task bar icon
Gui, 10:+ToolWindow -Caption                           ; Removes the Border and Task bar icon
Gui, 11:+ToolWindow -Caption 
Gui, 8: Color, 000111 
Gui, 9: Color, 000111 
Gui, 10:Color, 000111                           ; Removes the Border and Task bar icon
Gui, 11:Color, 000111                           ; can be any colour but it's good to use a color that is NOT present in ur GUI
Gui, 9:Show, X%SettingsX% Y%SettingsY% h25 , Settings1
;Gui, 11:Show, X%NewX% Y%NewY% h25 , Test
;Gui, 10:Show, X%NewX% Y%NewY% h25 , Persist
WinSet, Transcolor, 000111, Settings2
WinSet, Transcolor, 000111, Settings1
WinSet, Transcolor, 000111, Test
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
	Gui, 11:Show, X%SettingsX% Y%SettingsY% h25 , Test
	Gui, 10:Show, X%SettingsX% Y%SettingsY% h25 , Persist
	Gui, 9:Show, X%SettingsX% Y%SettingsY% h25 , Settings1
	WinSet, Transcolor, 000111, Test
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
	PasteClipboard()
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
	Gui, 20: New, AlwaysOnTop Owner, EFS Functions
	Gui, 20: Add, Button, x5 y2 w100 gFillEFS, Fill EFS Sections
	Gui, 20: Add, Button, x107 y2 w100 gEFSPayLogIn, Log into EFS Fees
	Gui, 20: +ToolWindow
	Gui, 20: Show
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
Gui, 20: Hide
Progress, P0, Just getting started..., Filling EFS Information..., Filling EFS Information, 
Sleep 1000
gosub EFSFill
Progress, P100,If it didn't work`, try accessing the URL and removing everything from the ? over. Press Enter to refresh the page and try again!, And we're done!, Filling EFS Information, 
Sleep 3000
Progress, Off
Gui, 20: Show
return
		
;2Cancel:
;	{
;	Gui, Submit
;	Gui, Destroy
;	Sleep 100
;	Gui, 2Gui:Destroy
;	;MsgBox, , You closed the System Switch button! ,You removed the button!`n`nNow you can't easily switch systems!`n`nPress %Custom3% to reopen it!
;	Return
;	}
	
QCType:
global QC
;global QC2
WinGetPos , X, Y, Width, Height, ahk_class IEFrame
NewX := x + 10
NewY := y + 2
NewNewY := NewY + 25
Gui, Submit, NoHide

IniRead, QCAction, C:\Users\lara.hamdan\AHKPrefs.ini, QC, %QC%
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
;;IniRead, Username, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Username
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
Gui, 99: Destroy
Gui, 98: Destroy
FormatTime, TimeStamp, R
IniRead, Username, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Username 
CoordMode, Mouse, Screen       ;Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
OldClipboard = %Clipboard%
Clipboard = ;
IniRead, Clip1, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip1
IniRead, Clip2, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip2
IniRead, Clip3, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip3
IniRead, Clip4, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip4
IniRead, Clip5, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip5
SendInput ^c
ClipWait, .2
NewClipboard = %Clipboard%
StringReplace, NewClipboard, NewClipboard, `r`n, %A_Space%, All    ; Replace any hard returns with a space. 
StringReplace, NewClipboard, NewClipboard, `r, %A_Space%, All      ; Replace any hard returns with a space. 
StringReplace, NewClipboard, NewClipboard, `n, %A_Space%, All      ; Replace any hard returns with a space. 
StringReplace, NewClipboard, NewClipboard, %A_Space%%A_Space%, %A_Space%, All      ; Replace any hard returns with a space. 
Gui, 99: New, +AlwaysOnTop +Owner, Multiple Clipboard Slots
Gui, 99: Font, s12 bold, Verdana
Gui, 99: Add, Button, w400 h30, Where would you like to store the text?
Gui, 99: Font, s10 w500, Verdana
Gui, 99: Add, Button, w400 Wrap gBut1, %Clip1%
Gui, 99: Add, Button, w400 Wrap gBut2, %Clip2%
Gui, 99: Add, Button, w400 Wrap gBut3, %Clip3%
Gui, 99: Add, Button, w400 Wrap gBut4, %Clip4%
Gui, 99: Add, Button, w400 Wrap gBut5, %Clip5%
Gui, 99: Font, s12 bold, Verdana
Gui, 99: Add, Button, gBut6, Cancel
 
if (xpos > 2150) & (ypos > 800)     
     {
     newypos := (ypos - 500)
     newxpos := (xpos - 420)
     Gui, 99: Show, x%newxpos% y%newypos%  w911, 
	 Gui, 99: +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, 99: Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, 99: Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }
else if (ypos > 800)     
     {
     newypos := (ypos - 500)
     Gui, 99: Show, x%xpos% y%newypos%  w911,
	 Gui, 99: +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, 99: Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, 99: Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return
     }
else if (xpos > 2150)      
     {
     newxpos := (xpos - 420)
     Gui, 99: Show, x%newxpos% y%ypos%  w911, 
	 Gui, 99: +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, 99: Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, 99: Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }
else 
     {
     Gui, 99: Show, x%xpos% y%ypos% w911, 
	 Gui, 99: +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, 99: Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, 99: Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return
	 }
Return

But1:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip1
Sleep 200
IniRead, Clip1, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip1
Clipboard = %OldClipboard%
gosub RecordCopyAction
Return
}

But2:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip2
Sleep 200
IniRead, Clip2, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip2
Clipboard = %OldClipboard%
gosub RecordCopyAction
Return
}

But3:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip3
Sleep 200
IniRead, Clip3, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip3
Clipboard = %OldClipboard%
gosub RecordCopyAction
Return
}

But4:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip4
Sleep 200
IniRead, Clip4, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip4
Clipboard = %OldClipboard%
gosub RecordCopyAction
Return
}

But5:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip5
Sleep 200
IniRead, Clip5, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip5
Clipboard = %OldClipboard%
gosub RecordCopyAction
Return
}

But6:
{
Gui, Destroy
Clipboard = %OldClipboard%
Return
}
Return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;    Paste Extra Stored Clipboard    ;;
;;             CTRL + 6               ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;^6::
;PasteClipboard()
;return

PasteClipboard()
{
global Clip1
global Clip2
global Clip3
global Clip4
global Clip5
Gui, 99: Destroy
Gui, 98: Destroy
FormatTime, TimeStamp, R
IniRead, Username, C:\Users\lara.hamdan\AHKPrefs.ini, Username, key
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
IniRead, Clip1, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip1
IniRead, Clip2, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip2
IniRead, Clip3, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip3
IniRead, Clip4, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip4
IniRead, Clip5, C:\Users\lara.hamdan\AHKPrefs.ini, Clips, Clip5
Gui, 98: New, +AlwaysOnTop +Owner, Multiple Clipboard Slots
Gui, 98: Font, s12 bold, Verdana
Gui, 98: Add, Button, w400 h30, What would you like to paste?
Gui, 98: Font, s10 w500, Verdana
Gui, 98: Add, Button, w400 Wrap gPaste1, %Clip1%
Gui, 98: Add, Button, w400 Wrap gPaste2, %Clip2%
Gui, 98: Add, Button, w400 Wrap gPaste3, %Clip3%
Gui, 98: Add, Button, w400 Wrap gPaste4, %Clip4%
Gui, 98: Add, Button, w400 Wrap gPaste5, %Clip5%
Gui, 98: Font, s12 bold, Verdana
Gui, 98: Add, Button, gPaste6, Cancel
if (xpos > 2150) & (ypos > 800)  
     {
     newypos := (ypos - 500)
     newxpos := (xpos - 420)
     Gui, 98: Show, x%newxpos% y%newypos% w911
     Gui, 98: +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, 98: Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, 98: Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }
else if (ypos > 800)
     {
     newypos := (ypos - 500)
     ;Msgbox, %newypos%
     Gui, 98: Show, x%xpos% y%newypos% w911, 
     Gui, 98: +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, 98: Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, 98: Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }
else if (xpos > 2150) 
     {
     newxpos := (xpos - 420)
     ;Msgbox, %newxpos%
     Gui, 98: Show, x%newxpos% y%ypos% w911, 
     Gui, 98: +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, 98: Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, 98: Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }
else
     {
     Gui, 98: Show, x%xpos% y%ypos% w911, 
	 Gui, 98: +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, 98: Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, 98: Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }

Paste1:
{
Gui, Submit
;IniRead, Clip1, C:\Users\lara.hamdan\AHKPrefs.ini, Clip1, key
SendInput %Clip1%
gosub RecordPasteAction
Return
}

Paste2:
{
Gui, Submit
;IniRead, Clip2, C:\Users\lara.hamdan\AHKPrefs.ini, Clip2, key
SendInput %Clip2%
gosub RecordPasteAction
Return
}

Paste3:
{
Gui, Submit
;IniRead, Clip3, C:\Users\lara.hamdan\AHKPrefs.ini, Clip3, key
SendInput %Clip3%
gosub RecordPasteAction
Return
}

Paste4:
{
Gui, Submit
;IniRead, Clip4, C:\Users\lara.hamdan\AHKPrefs.ini, Clip4, key
SendInput %Clip4%
gosub RecordPasteAction
Return
}

Paste5:
{
Gui, Submit
;IniRead, Clip5, C:\Users\lara.hamdan\AHKPrefs.ini, Clip5, key
SendInput %Clip5%
gosub RecordPasteAction
Return
}

Paste6:
{
Gui, Destroy
Return
}
Return
}

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
IniRead, Username, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\lara.hamdan\AHKPrefs.ini, Username, ATDate
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
IniRead, Username, C:\Users\lara.hamdan\AHKPrefs.ini, Username, key
OldClipboard := Clipboard                         ; This saves clipboard content for later.
Clipboard = ;                                     ; This empties the clipboard.
URLString = ;                                     ; Sets MyString to blank.
DocketingString = oc-docketing ;
SendInput ^c
ClipWait, .2
URLString := clipboard                            ; Fetch URL into variable
if InStr(URLString, DocketingString)
     {
     SplashTextOn, 300,,Opening in docketing now.,
     Run %URLString%
     Sleep 1000
     SplashTextOff
     Clipboard = %oldClipboard%
     gosub RecordExcelHLink
     Return
     }
else
     {
     SplashTextOn, 300,,Not a docketing URL. Unable to open link.,
     Sleep 1000
     SplashTextOff
     Clipboard = %oldClipboard%
     Return
     }
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
FormatTime, TimeStamp, R
IniRead, Username, C:\Users\lara.hamdan\AHKPrefs.ini, Username, key
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
SendInput ^l
Sleep 200
SendInput ^c
ClipWait, .2      
MyString := clipboard                            ; Fetch URL into variable
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
     SplashTextOn, 400,,Not on a Live or AT docketing page. Unable to open page.,
     Sleep 1500
     SplashTextOff
     Clipboard = %OldClipboard%
     Return
     }
MyString := FrontString . AppString
SplashTextOn, 300,,Opening in opposite system now.,
Run %MyString%
Sleep 1000
SplashTextOff
;MsgBox, %MyString%
;Run iexplore.exe, max
;WinWait,
Clipboard = %OldClipboard%
AppString = ;
FrontString = ;
gosub RecordSysSwitch
Return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;         Suggested Remarks          ;;
;;             CTRL + 9               ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;^9::
;FormatTime, TimeStamp, R
;Gui, Destroy
;CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
;MouseGetPos, xpos, ypos 
;formattime, todaysdate, , MM/dd/yy 
;SuggestRemarks()
;return

SuggestRemarks()
{
FormatTime, TimeStamp, R
formattime, TodaysDate, , MM/dd/yy  
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos
IniRead, Username, C:\Users\lara.hamdan\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\lara.hamdan\AHKPrefs.ini, Username, ATDate
Array = ;
;IntPat = INT-PAT
;IntTM = INT-TM
PreviousClip := Clipboard
SendInput ^c
ClipWait, .2
CopiedAction := Clipboard                                                    ; This saves clipboard content for later.
Clipboard = ;
Sleep 200
;InStr(CopiedAction, IntPat) OR InStr(CopiedAction, IntTM)
IniRead, CopiedAction, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Actions (BETA).ini, Actions, %CopiedAction%
Sleep 200
Array := StrSplit(CopiedAction, "|", A_Space)
if % Array[1] == "ERROR"  OR (StringLen, CopiedAction > 50)
     {
     Sleep 200
     SplashTextOn, 360,, Action not found`, or not copied correctly (perhaps extra spaces?).
	 Sleep 2500
	 Clipboard = %PreviousClip%
	 SplashTextOff
	 Return
	 }	 
else 
     {
     Gui, New, +AlwaysOnTop +Owner, Username Updated, Remarks Suggestions
     Gui, Font, s12 w700, Verdana
     Gui, Add, Button, w350 h30, Here are some suggested remarks:
     Gui, Font, s10 w500, Verdana
     Gui, Add, Button, gArray1, % Array[1]
if % Array[2] = ""{
}
else  
     Gui, Add, Button, gArray2, % Array[2] 
if % Array[3] = ""{
}
else	 
     Gui, Add, Button, gArray3, % Array[3]
if % Array[4] = ""{
}
else	 
     Gui, Add, Button, gArray4, % Array[4]
if % Array[5] = ""{
}
else	
     Gui, Add, Button, gArray5, % Array[5]  
if (xpos > 2150) & (ypos > 800)     
     {
     newypos := (ypos - 200)
     newxpos := (xpos - 400)
     Gui, Show, x%newxpos% y%newypos%
	 Gui, Font, s12 bold, Verdana
	 Gui, Add, Button, gArray6, Cancel
     Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return  
     }
else if (ypos > 800)     
     {
     newypos := (ypos - 200)
     ;Msgbox, %newypos%
     Gui, Show, x%xpos% y%newypos%
	 Gui, Font, s12 bold, Verdana
	 Gui, Add, Button, gArray6, Cancel
     Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return     
     }
else if (xpos > 2150)      
     {
     newxpos := (xpos - 400)
     ;Msgbox, %newxpos%
	 Gui, Font, s12 bold, Verdana
	 Gui, Add, Button, gArray6, Cancel
     Gui, Show, x%newxpos% y%ypos%
     Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return      
     }
else
     Gui, Show, x%xpos% y%ypos%
	 Gui, Font, s12 bold, Verdana
	 Gui, Add, Button, gArray6, Cancel
     Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }
Clipboard = %PreviousClip%
return
	 
Array1:
{
Gui, Submit
SendInput % ATDate " " Array[1] " " Username
Clipboard = %PreviousClip%
gosub RecordSuggestRemarks
Return
}

Array2:
{
Gui, Submit
SendInput % ATDate " " Array[2] " " Username
Clipboard = %PreviousClip%
gosub RecordSuggestRemarks
Return
}

Array3:
{
Gui, Submit
SendInput % ATDate " " Array[3] " " Username
Clipboard = %PreviousClip%
gosub RecordSuggestRemarks
Return
}

Array4:
{
Gui, Submit
SendInput % ATDate " " Array[4] " " Username
Clipboard = %PreviousClip%
gosub RecordSuggestRemarks
Return
}

Array5:
{
Gui, Submit
SendInput % ATDate " " Array[5] " " Username
Clipboard = %PreviousClip%
gosub RecordSuggestRemarks
Return
}

Array6:
{
Gui, Destroy
Clipboard = %PreviousClip%
Return
}

Clipboard = %PreviousClip%
Return
}

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
IniRead, ATPartner, C:\Users\lara.hamdan\AHKPrefs.ini, Username, ATPartner

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
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %ATPartner%
Sleep 2250
SplashTextOff
gosub RecordAttyFinder
return
     }              
if ThreeString0 = 2
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %ATPartner%
Sleep 2250
SplashTextOff
gosub RecordAttyFinder
return
     }	
if ThreeString0 = 3
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %ATPartner%
Sleep 2250
SplashTextOff
gosub RecordAttyFinder
return
     }	
if ThreeString0 = 4
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %ATPartner%
Sleep 2250
SplashTextOff
gosub RecordAttyFinder
return
     }	
if ThreeString0 = 5
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %ATPartner%
Sleep 2250
SplashTextOff
gosub RecordAttyFinder
return
     }
if ThreeString0 = 6
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %ATPartner%
Sleep 2250
SplashTextOff
gosub RecordAttyFinder
return
     }
if ThreeString0 = 7
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %ATPartner%
Sleep 2250
SplashTextOff
gosub RecordAttyFinder
return
     }
if ThreeString0 = 8
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %AttyTest8%, %ATPartner%
Sleep 2250
SplashTextOff
gosub RecordAttyFinder
return
     }
if ThreeString0 = 9
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %AttyTest8%, %AttyTest9%, %ATPartner%
Sleep 2250
SplashTextOff
gosub RecordAttyFinder
return
     }
if ThreeString0 = 10
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %AttyTest8%, %AttyTest9%, %AttyTest10%, %ATPartner%
Sleep 2250
SplashTextOff
gosub RecordAttyFinder
return
     }
else 
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %ATPartner%
Sleep 2250
SplashTextOff
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
^;::
QuickDate()
{
;MsgBox, Not in Excel window.
OldClipboard = %Clipboard%
Sleep 50
FormatTime, CurrentDateTime,, MM/dd/yyyy
Clipboard = %CurrentDateTime%
Sleep 50
SendInput ^v
Sleep 100
Clipboard = %OldClipboard%
Sleep 100
gosub RecordDateShortcut
return
}
#IfWinActive

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
		OldClipboard = %Clipboard%
		Send ^a
		Sleep 200
		Send ^c
		Sleep 500
		IniRead, Password, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\EFS.ini, EFS, %Clipboard%
		Sleep 500
		SplashTextOn, 65,, %Password%
		;MsgBox, %Password%
		Send {Tab}
		Sleep 1250
		SplashTextOff
		Send {Tab}
		Send ^a
		Sleep 200
		Send {Delete}
		Sleep 200
		Send %Password%
		Sleep 200
		Clipboard = %OldClipboard%
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
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;           Crazy COM Stuff          ;;
;;              Who knows.            ;;
;;Record Opener/EFS Filler/Fees Login ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

EFSPayLogIn:
YourSearchStr := "loginLogout"
IniRead, EFSPayEmail,    C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSPayEmail
IniRead, EFSPayPassword, C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSPayPassword
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
SplashTextOn, 200, , Signing into EFS...
ie.Quit() ; this is if you want the ie browser to close once the string as been found
Sleep 5000
ie := ComObjCreate("InternetExplorer.Application")
ie.Visible := False
;params := [OutputVar, 4096]
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.headerSignInLink.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.uniqName_11_9.Value := EFSPayEmail
ie.Document.All.uniqName_11_10.Value := EFSPayPassword
Sleep 250
ie.Document.All.dijit_form_Button_10.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
Sleep 10000
;ie.Visible := True
ie.Quit() ; this is if you want the ie browser to close once the string as been found
SplashTextOff
return		

EFSFill:
IniRead, EFSFirst,C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSFirst
IniRead, EFSLast, C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSLast
IniRead, EFSEmail,C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSEmail
EFSFirst = %EFSFirst%
EFSLast  = %EFSLast%
EFSEmail = %EFSEmail%
OutputVar = https://efs.uspto.gov/EFSWebUIRegistered/EFSWebRegistered#
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
   ie.Visible := True
   params := [OutputVar, 32]
}
;ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.radiogroup2.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.certname1.Value := EFSFirst
ie.Document.All.certname2.Value := EFSLast
ie.Document.All.certaddr1.Value := EFSEmail
ie.Document.getElementById("My workplace").Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
Progress, P50, ...living on a prayer..., We're halfway there..., Filling EFS Information, 
ie.Navigate(params*)
                                        ;    SendInput ^l
;   This one works on the other method. ;    Sleep 200
                                        ;    SendInput, https://efs.uspto.gov/EFSWebUIRegistered/EFSWebRegistered#
                                        ;    SendInput {Enter}
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.pkiSaveType_1.Click()
Sleep, 100 ; 1/10 second
;IELoad(wb)
Sleep 200
ie.Document.All.retrievepract.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
SendInput {Space}
Sleep 1000
gosub RecordEFSFill
return		

;EFSFill: ; This one actually works...
;IniRead, EFSFirst,C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSFirst
;IniRead, EFSLast, C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSLast
;IniRead, EFSEmail,C:\Users\lara.hamdan\AHKPrefs.ini, Username, EFSEmail
;EFSFirst = %EFSFirst%
;EFSLast  = %EFSLast%
;EFSEmail = %EFSEmail%
;For IE in ComObjCreate("Shell.Application").Windows ; for each open window
;If InStr(IE.FullName, "iexplore.exe") ; check if it's an ie window
;break ; keep that window's handle
;ie.Navigate("https://efs.uspto.gov/EFSWebUIRegistered/EFSWebRegistered")
;While IE.Busy ; simple wait for page to load
;Sleep, 100 ; 1/10 second
;IELoad(wb)
;ie.Document.All.radiogroup2.Click()
;While IE.Busy ; simple wait for page to load
;Sleep, 100 ; 1/10 second
;IELoad(wb)
;ie.Document.All.certname1.Value := EFSFirst
;ie.Document.All.certname2.Value := EFSLast
;ie.Document.All.certaddr1.Value := EFSEmail
;ie.Document.getElementById("My workplace").Click()
;While IE.Busy ; simple wait for page to load
;Sleep, 100 ; 1/10 second
;Progress, P50, ...living on a prayer..., We're halfway there..., Filling EFS Information, 
;SendInput ^l
;Sleep 200
;SendInput, https://efs.uspto.gov/EFSWebUIRegistered/EFSWebRegistered#
;SendInput {Enter}
;While IE.Busy ; simple wait for page to load
;Sleep, 100 ; 1/10 second
;IELoad(wb)
;ie.Document.All.pkiSaveType_1.Click()
;Sleep, 100 ; 1/10 second
;IELoad(wb)
;Sleep 200
;ie.Document.All.retrievepract.Click()
;While IE.Busy ; simple wait for page to load
;Sleep, 100 ; 1/10 second
;SendInput {Space}
;Sleep 1000
;gosub RecordEFSFill
;return		

/*
IEGet(Name="")        ;Retrieve pointer to existing IE window/tab
{
    IfEqual, Name,, WinGetTitle, Name, ahk_class IEFrame
        Name := ( Name="New Tab - Windows Internet Explorer" ) ? "about:Tabs"
        : RegExReplace( Name, " - (Windows|Microsoft) Internet Explorer" )
    For ie in ComObjCreate( "Shell.Application" ).Windows
        If ( ie.LocationName = Name ) && InStr( wb.FullName, "iexplore.exe" )
            Return ie
} ;written by Jethrow

IELoad(ie)    ;You need to send the IE handle to the function unless you define it as global.
{
    If !ie    ;If wb is not a valid pointer then quit
        Return False
    Loop    ;Otherwise sleep for .1 seconds untill the page starts loading
        Sleep,250
    Until (ie.busy)
    Loop    ;Once it starts loading wait until completes
        Sleep,250
    Until (!ie.busy)
    Loop    ;optional check to wait for the page to completely load
        Sleep,250
    Until (ie.Document.Readystate = "Complete")
Return True
}	
*/

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;            Achievements            ;;
;;               Passive              ;;
;;     Writes to User's .ini file     ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

RecordKeystrokes:
IniRead, Keystrokes, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, Keystrokes
StringLen, NameLen, Username
StringLen, DateLen, ATDate
KeystrokesSaved := (NameLen + DateLen + 3)
Keystrokes+=%KeystrokesSaved%
IniWrite, %Keystrokes%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, Keystrokes
return

RecordDateShortcut:
IniRead, DateShortcut, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, DateShortcut
DateShortcut++
IniWrite, %DateShortcut%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, DateShortcut
return

RecordAttyFinder:
IniRead, AttyFinder, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, AttyFinder
AttyFinder++
IniWrite, %AttyFinder%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, AttyFinder
return

RecordCalExtend:
IniRead, CalExtend, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, CalExtend
CalExtend++
IniWrite, %CalExtend%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, CalExtend
return

RecordSysSwitch:
IniRead, SysSwitch, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, SysSwitch
SysSwitch++
IniWrite, %SysSwitch%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, SysSwitch
return

RecordExcelHLink:
IniRead, ExcelHLink, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, ExcelHLink
ExcelHLink++
IniWrite, %ExcelHLink%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, ExcelHLink
return

RecordEFSCertFinder:
IniRead, EFSCertFinder, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, EFSCertFinder
EFSCertFinder++
IniWrite, %EFSCertFinder%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, EFSCertFinder
return

RecordCopyAction:
IniRead, CopyAction, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, CopyAction
CopyAction++
IniWrite, %CopyAction%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, CopyAction
return

RecordPasteAction:
IniRead, PasteAction, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, PasteAction
PasteAction++
IniWrite, %PasteAction%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, PasteAction
return

RecordSuggestRemarks:
IniRead, SuggestRemarks, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, SuggestRemarks
SuggestRemarks++
IniWrite, %SuggestRemarks%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, SuggestRemarks
return

RecordClientCodeIE:
IniRead, ClientCodeIE, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, ClientCodeIE
ClientCodeIE++
IniWrite, %ClientCodeIE%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, ClientCodeIE
return

RecordEFSFill:
IniRead, EFSFill, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, EFSFill
EFSFill++
IniWrite, %EFSFill%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.hamdan.ini, Achievements, EFSFill
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;¿                                                           ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

::!AJG::
SendInput H:\USPTO\Adam.Gilbert.epf
gosub, GetPassword
return

::!AXJ::
SendInput H:\USPTO\Agnes.Juang.epf
gosub, GetPassword
return

::!AJS::
SendInput H:\USPTO\Albert.Sueiras.epf
gosub, GetPassword
return

::!AJM::
SendInput H:\USPTO\Alex.Martinez.epf
gosub, GetPassword
return

::!AZ4::
SendInput H:\USPTO\Allison.Weimer.epf
gosub, GetPassword
return

::!AGB::
SendInput H:\USPTO\Allyson.Brown.epf
gosub, GetPassword
return

::!ACC::
SendInput H:\USPTO\Amy.Chun.epf
gosub, GetPassword
return

::!AMD::
SendInput H:\USPTO\Andrew.Douglas.epf
gosub, GetPassword
return

::!AIK::
SendInput H:\USPTO\Andrew.Kimmel.epf
gosub, GetPassword
return

::!AWL::
SendInput H:\USPTO\Andrew.Lloyd.epf
gosub, GetPassword
return

::!AVS::
SendInput H:\USPTO\Andrew.Schwaab.epf
gosub, GetPassword
return

::!AHS::
SendInput H:\USPTO\Andrew.Simpson.epf
gosub, GetPassword
return

::!ASR::
SendInput H:\USPTO\Art Rose.epf
gosub, GetPassword
return

::!BJE::
SendInput H:\USPTO\Ben.Everton.epf
gosub, GetPassword
return

::!BAK::
SendInput H:\USPTO\Benajmain.Katzenellenbogen.epf
gosub, GetPassword
return

::!WBB::
SendInput H:\USPTO\Bill.Bunker.epf
gosub, GetPassword
return

::!WHS::
SendInput H:\USPTO\Bill.Shreve.epf
gosub, GetPassword
return

::!BRB::
SendInput H:\USPTO\Brent Babcock.epf
gosub, GetPassword
return

::!BMD::
SendInput H:\USPTO\Brent Dougal.epf
gosub, GetPassword
return

::!BCC::
SendInput H:\USPTO\Brian Claassen.epf
gosub, GetPassword
return

::!BZS::
SendInput H:\USPTO\Bridget Smith.epf
gosub, GetPassword
return

::!BSI::
SendInput H:\USPTO\Bruce.Itchkawitz.epf
gosub, GetPassword
return

::!BWW::
SendInput H:\USPTO\Bryan.Wahl.epf
gosub, GetPassword
return

::!CKL::
SendInput H:\USPTO\Catherine.Lee.epf
gosub, GetPassword
return

::!CYL::
SendInput H:\USPTO\Chang.Lim.epf
gosub, GetPassword
return

::!CSC::
SendInput H:\USPTO\Che.Chereskin.epf
gosub, GetPassword
return

::!CXR::
SendInput H:\USPTO\Christopher Ross.epf
gosub, GetPassword
return

::!CSS::
SendInput H:\USPTO\Craig.Summers.epf
gosub, GetPassword
return

::!CRH::
SendInput H:\USPTO\Curtis.Huffmire.epf
gosub, GetPassword
return

::!CCD::
SendInput H:\USPTO\Curtiss.Dosier.epf
gosub, GetPassword
return

::!DJH::
SendInput H:\USPTO\Damien.Howard.epf
gosub, GetPassword
return

::!DEA::
SendInput H:\USPTO\Dan.Altman.epf
gosub, GetPassword
return

::!DJF::
SendInput H:\USPTO\Dan.Fischer.epf
gosub, GetPassword
return

::!DVG::
SendInput H:\USPTO\Daniel.Gibson.epf
gosub, GetPassword
return

::!DLO::
SendInput H:\USPTO\Darrell.Olson.epf
gosub, GetPassword
return

::!DSB::
SendInput H:\USPTO\David.Barnhill.epf
gosub, GetPassword
return

::!DMD::
SendInput H:\USPTO\David.Dremann.epf
gosub, GetPassword
return

::!DGK::
SendInput H:\USPTO\David.G.Kim.epf
gosub, GetPassword
return

::!DGJ::
SendInput H:\USPTO\David.Jankowski.epf
gosub, GetPassword
return

::!DRS::
SendInput H:\USPTO\David.Schmidt.epf
gosub, GetPassword
return

::!DVK::
SendInput H:\USPTO\David.T.Kim.epf
gosub, GetPassword
return

::!DRB::
SendInput H:\USPTO\Derek.Bayles.epf
gosub, GetPassword
return

::!DXD::
SendInput H:\USPTO\Devanie.Dufour.epf
gosub, GetPassword
return

::!DGM::
SendInput H:\USPTO\Doug.Muehlhauser.epf
gosub, GetPassword
return

::!DXW::
SendInput H:\USPTO\Douglas.Wentzel.epf
gosub, GetPassword
return

::!EAS::
SendInput H:\USPTO\Ed.Schlatter.epf
gosub, GetPassword
return

::!GVH::
SendInput H:\USPTO\Gerard.vonHoffmann.epf
gosub, GetPassword
return

::!GLN::
SendInput H:\USPTO\Glen.Nuttall.epf
gosub, GetPassword
return

::!HXM::
SendInput H:\USPTO\Hans.Mayer.epf
gosub, GetPassword
return

::!HZS::
SendInput H:\USPTO\Harnik.Shukla.epf
gosub, GetPassword
return

::!HCS::
SendInput H:\USPTO\Hochan.Song.epf
gosub, GetPassword
return

::!IAL::
SendInput H:\USPTO\Irfan.Lateef.epf
gosub, GetPassword
return

::!JUP::
SendInput H:\USPTO\Jacob.Peterson.epf
gosub, GetPassword
return

::!JCB::
SendInput H:\USPTO\Jared.Bunker.epf
gosub, GetPassword
return

::!JZK::
SendInput H:\USPTO\Jarom.Kesler.epf
gosub, GetPassword
return

::!JAG::
SendInput H:\USPTO\Jason.Gersting.epf
gosub, GetPassword
return

::!JCS::
SendInput H:\USPTO\Jason.Swartz.epf
gosub, GetPassword
return

::!JUH::
SendInput H:\USPTO\Jeffery.Hallstrom.epf
gosub, GetPassword
return

::!JYC::
SendInput H:\USPTO\Joan.Chan.epf
gosub, GetPassword
return

::!HSU::
SendInput H:\USPTO\Johannes.Hsu.epf
gosub, GetPassword
return

::!JRK::
SendInput H:\USPTO\John King.epf
gosub, GetPassword
return

::!JMG::
SendInput H:\USPTO\John.Grover.epf
gosub, GetPassword
return

::!JHS::
SendInput H:\USPTO\John.Sadlik.epf
gosub, GetPassword
return

::!JBS::
SendInput H:\USPTO\John.Sganga.epf
gosub, GetPassword
return

::!JWG::
SendInput H:\USPTO\Jon Gurka.epf
gosub, GetPassword
return

::!JUC::
SendInput H:\USPTO\Jordan.Cox.epf
gosub, GetPassword
return

::!JYS::
SendInput H:\USPTO\Joshua Stowell.epf
gosub, GetPassword
return

::!JDB::
SendInput H:\USPTO\Joshua.Berk.epf
gosub, GetPassword
return

::!JJG::
SendInput H:\USPTO\Justin.Gillett.epf
gosub, GetPassword
return

::!KJL::
SendInput H:\USPTO\Karen.Lenker.epf
gosub, GetPassword
return

::!KAD::
SendInput H:\USPTO\Karoline.Delaney.epf
gosub, GetPassword
return

::!KXA::
SendInput H:\USPTO\Kazuo.Aoki.epf
gosub, GetPassword
return

::!KZL::
SendInput H:\USPTO\Keith.Lim.epf
gosub, GetPassword
return

::!KNS::
SendInput H:\USPTO\Kent.Shum.epf
gosub, GetPassword
return

::!LDS::
SendInput H:\USPTO\Lance.Smemoe.epf
gosub, GetPassword
return

::!LXK::
SendInput H:\USPTO\Lauren.Keller.epf
gosub, GetPassword
return

::!LGR::
SendInput H:\USPTO\Lavanya.Rau.epf
gosub, GetPassword
return

::!LHL::
SendInput H:\USPTO\Linda.Liu.epf
gosub, GetPassword
return

::!LLX::
SendInput H:\USPTO\Linda.Xu.epf
gosub, GetPassword
return

::!LLY::
SendInput H:\USPTO\Lori.Yamato.epf
gosub, GetPassword
return

::!MRB::
SendInput H:\USPTO\Mark Benedict.epf
gosub, GetPassword
return

::!MJG::
SendInput H:\USPTO\Mark Gallagher.epf
gosub, GetPassword
return

::!MED::
SendInput H:\USPTO\Mark.Davis.epf
gosub, GetPassword
return

::!MRZ::
SendInput H:\USPTO\Marko.Zoretic.epf
gosub, GetPassword
return

::!MPB::
SendInput H:\USPTO\Michael.Burns.epf
gosub, GetPassword
return

::!MRC::
SendInput H:\USPTO\Michael.Christensen.epf
gosub, GetPassword
return

::!MAG::
SendInput H:\USPTO\Michael.Guiliana.epf
gosub, GetPassword
return

::!MCL::
SendInput H:\USPTO\Mike.Lee.epf
gosub, GetPassword
return

::!MCK::
SendInput H:\USPTO\Mincheol.Kim.epf
gosub, GetPassword
return

::!NMZ::
SendInput H:\USPTO\Nicholas.Zovko.epf
gosub, GetPassword
return

::!NXB::
SendInput H:\USPTO\Nira.Brand.epf
gosub, GetPassword
return

::!NAM::
SendInput H:\USPTO\Nora.Marachelian.epf
gosub, GetPassword
return

::!OAM::
SendInput H:\USPTO\Omar.AlMesned.epf
gosub, GetPassword
return

::!PNC::
SendInput H:\USPTO\Paul.Conover.epf
gosub, GetPassword
return

::!PDO::
SendInput H:\USPTO\Perry.Oldham.epf
gosub, GetPassword
return

::!PQT::
SendInput H:\USPTO\Peter.Tong.epf
gosub, GetPassword
return

::!PMN::
SendInput H:\USPTO\Philip.Nelson.epf
gosub, GetPassword
return

::!RNN::
SendInput H:\USPTO\Rabi.Narula.epf
gosub, GetPassword
return

::!RDS::
SendInput H:\USPTO\Raymond.Smith.epf
gosub, GetPassword
return

::!RJR::
SendInput H:\USPTO\Robb.Roby.epf
gosub, GetPassword
return

::!ROS::
SendInput H:\USPTO\Ron.Schoenbaum.epf
gosub, GetPassword
return

::!RMJ::
SendInput H:\USPTO\Russell.Jeide.epf
gosub, GetPassword
return

::!SHL::
SendInput H:\USPTO\Sabing.Lee.epf
gosub, GetPassword
return

::!SAM::
SendInput H:\USPTO\Salima Merani.epf
gosub, GetPassword
return

::!SZC::
SendInput H:\USPTO\Scott.Cromar.epf
gosub, GetPassword
return

::!SXR::
SendInput H:\USPTO\Scott.Raevsky.epf
gosub, GetPassword
return

::!SXA::
SendInput H:\USPTO\Sean.Ambrosius.epf
gosub, GetPassword
return

::!SXL::
SendInput H:\USPTO\Shannon.Lam.epf
gosub, GetPassword
return

::!SNS::
SendInput H:\USPTO\Sheila Swaroop.epf
gosub, GetPassword
return

::!SCJ::
SendInput H:\USPTO\Steve.Jensen.epf
gosub, GetPassword
return

::!SPR::
SendInput H:\USPTO\Steven Ruden.epf
gosub, GetPassword
return

::!SJN::
SendInput H:\USPTO\Steven.Nataupsky.epf
gosub, GetPassword
return

::!TXN::
SendInput H:\USPTO\Tak.Nishimura.epf
gosub, GetPassword
return

::!TMC::
SendInput H:\USPTO\Ted Cannon.epf
gosub, GetPassword
return

::!TKT::
SendInput H:\USPTO\Terry.Tullis.epf
gosub, GetPassword
return

::!TGP::
SendInput H:\USPTO\Theodore.Papagiannis.epf
gosub, GetPassword
return

::!TYY::
SendInput H:\USPTO\Thomas.Yee.epf
gosub, GetPassword
return

::!VZB::
SendInput H:\USPTO\Vikas.Bhargava.epf
gosub, GetPassword
return

::!VSL::
SendInput H:\USPTO\Vladimir.Lozan.epf
gosub, GetPassword
return

::!JYW::
SendInput H:\USPTO\YueJoyWang.epf
gosub, GetPassword
return

::!ZAG::
SendInput H:\USPTO\Zachary.Glantz.epf
gosub, GetPassword
return

::!ABP::
SendInput S:\USPTO\Adam.Powell.epf
gosub, GetPassword
return

::!AEM::
SendInput S:\USPTO\Andrew.Morrell.epf
gosub, GetPassword
return

::!BBA::
SendInput S:\USPTO\Ben.Anger.epf
gosub, GetPassword
return

::!BSG::
SendInput S:\USPTO\Brenden.Gingrich.epf
gosub, GetPassword
return

::!PCS::
SendInput S:\USPTO\Chris Steinhardt.epf
gosub, GetPassword
return

::!CMD::
SendInput S:\USPTO\Chris.DiLeo.epf
gosub, GetPassword
return

::!CLS::
SendInput S:\USPTO\Claine.Snow.epf
gosub, GetPassword
return

::!DOH::
SendInput S:\USPTO\Dan.Hart.epf
gosub, GetPassword
return

::!DKY::
SendInput S:\USPTO\Dan.Yarbrough.epf
gosub, GetPassword
return

::!DPH::
SendInput S:\USPTO\Daniel Hughes.epf
gosub, GetPassword
return

::!DAK::
SendInput S:\USPTO\Daniel.Kamkar.epf
gosub, GetPassword
return

::!DZD::
SendInput S:\USPTO\David.Dang.epf
gosub, GetPassword
return

::!DPK::
SendInput S:\USPTO\David.Kujawa.epf
gosub, GetPassword
return

::!DCD::
SendInput S:\USPTO\Derek.Dailey.epf
gosub, GetPassword
return

::!DSH::
SendInput S:\USPTO\Drew.Hamilton.epf
gosub, GetPassword
return

::!EMN::
SendInput S:\USPTO\Eric Nelson.epf
gosub, GetPassword
return

::!ESF::
SendInput S:\USPTO\Eric.Furman.epf
gosub, GetPassword
return

::!FTH::
SendInput S:\USPTO\Fred.Hale.epf
gosub, GetPassword
return

::!FAN::
SendInput S:\USPTO\Fred.Nicholson.epf
gosub, GetPassword
return

::!GAH::
SendInput S:\USPTO\Greg.Hermanson.epf
gosub, GetPassword
return

::!GXM::
SendInput S:\USPTO\Greg.Munchinsky.epf
gosub, GetPassword
return

::!HZC::
SendInput S:\USPTO\Heungsoo.Choi.epf
gosub, GetPassword
return

::!IWG::
SendInput S:\USPTO\Ian Gillies.epf
gosub, GetPassword
return

::!JFH::
SendInput S:\USPTO\James.Herkenhoff.epf
gosub, GetPassword
return

::!JQD::
SendInput S:\USPTO\Jane.Dai.epf
gosub, GetPassword
return

::!JQX::
SendInput S:\USPTO\Jane.Xia.epf
gosub, GetPassword
return

::!JJJ::
SendInput S:\USPTO\Jason Jardine.epf
gosub, GetPassword
return

::!JZL::
SendInput S:\USPTO\Jing.Liu.epf
gosub, GetPassword
return

::!JMC::
SendInput S:\USPTO\John Carson.epf
gosub, GetPassword
return

::!JEG::
SendInput S:\USPTO\Jordan.Gottdank.epf
gosub, GetPassword
return

::!JMR::
SendInput S:\USPTO\Joseph Reisman.epf
gosub, GetPassword
return

::!JOM::
SendInput S:\USPTO\Joseph.Mallon.epf
gosub, GetPassword
return

::!KST::
SendInput S:\USPTO\Kerry.Taylor.epf
gosub, GetPassword
return

::!KJM::
SendInput S:\USPTO\Kimberly Miller.epf
gosub, GetPassword
return

::!KXW::
SendInput S:\USPTO\Kun.Wang.epf
gosub, GetPassword
return

::!LMF::
SendInput S:\USPTO\Larry.Firestone.epf
gosub, GetPassword
return

::!LEN::
SendInput S:\USPTO\Lauren.Hockett.epf
gosub, GetPassword
return

::!MVS::
SendInput S:\USPTO\Maria.Stout.epf
gosub, GetPassword
return

::!MMA::
SendInput S:\USPTO\Mark.Abumeri.epf
gosub, GetPassword
return

::!MWC::
SendInput S:\USPTO\Mark.Catanese.epf
gosub, GetPassword
return

::!MDM::
SendInput S:\USPTO\Mark.Marsden.epf
gosub, GetPassword
return

::!MLF::
SendInput S:\USPTO\Michael.Fuller.epf
gosub, GetPassword
return

::!NRL::
SendInput S:\USPTO\Nate.Luman.epf
gosub, GetPassword
return

::!NAI::
SendInput S:\USPTO\Ned.Israelsen.epf
gosub, GetPassword
return

::!NSB::
SendInput S:\USPTO\Neil.Bartfeld.epf
gosub, GetPassword
return

::!PYC::
SendInput S:\USPTO\Paul.Chang.epf
gosub, GetPassword
return

::!PXL::
SendInput S:\USPTO\Peter.Law.epf
gosub, GetPassword
return

::!RJS::
SendInput S:\USPTO\Ray.Salenieks.epf
gosub, GetPassword
return

::!RJH::
SendInput S:\USPTO\Robert.Hilton.epf
gosub, GetPassword
return

::!RMT::
SendInput S:\USPTO\Rose.Thiessen.epf
gosub, GetPassword
return

::!REM::
SendInput S:\USPTO\Ryan Melnick.epf
gosub, GetPassword
return

::!SCY::
SendInput S:\USPTO\Samantha.Markley.epf
gosub, GetPassword
return

::!TRA::
SendInput S:\USPTO\Tom.Arno.epf
gosub, GetPassword
return

::!TSC::
SendInput S:\USPTO\Tom.Cowan.epf
gosub, GetPassword
return

::!TJH::
SendInput S:\USPTO\Travis.Hill.epf
gosub, GetPassword
return

::!VCV::
SendInput S:\USPTO\Victor.Vassar.epf
gosub, GetPassword
return

::!VKG::
SendInput S:\USPTO\Vijay.Gore.epf
gosub, GetPassword
return

::!DNW::
SendInput L:\USPTO\David.Weiss.epf
gosub, GetPassword
return

::!MDK::
SendInput L:\USPTO\Mark.Kachner.epf
gosub, GetPassword
return

::!MSO::
SendInput L:\USPTO\Mike.Okamoto.epf
gosub, GetPassword
return

::!AXD::
SendInput W:\USPTO\Aaron.Davis.epf
gosub, GetPassword
return

::!ASA::
SendInput W:\USPTO\Adeel.Akhtar.epf
gosub, GetPassword
return

::!ANM::
SendInput W:\USPTO\Andrew.Merickel.epf
gosub, GetPassword
return

::!BMG::
SendInput W:\USPTO\Brian Graham.epf
gosub, GetPassword
return

::!DRT::
SendInput W:\USPTO\David.Trossen.epf
gosub, GetPassword
return


::!ELF::
SendInput W:\USPTO\Eric.Fong.epf
gosub, GetPassword
return

::!KZM::
SendInput W:\USPTO\Kyu.Min.epf
gosub, GetPassword
return

::!PSS::
SendInput W:\USPTO\Paul.Stellman.epf
gosub, GetPassword
return

::!VXL::
SendInput W:\USPTO\V.Lakshmananepf.epf
gosub, GetPassword
return

::!ZYW::
SendInput W:\USPTO\Zi Wong.epf
gosub, GetPassword
return

::!DJG::
SendInput U:\USPTO\David.Grant.epf
gosub, GetPassword
return

::!JUB::
SendInput U:\USPTO\Julie.Burke.epf
gosub, GetPassword
return

::!MUM::
SendInput U:\USPTO\Mark.Metzke.epf
gosub, GetPassword
return

::!AVB::
SendInput V:\USPTO\Adam.Burks.epf
gosub, GetPassword
return

::!AFQ::
SendInput V:\USPTO\Andrew.Quecan.epf
gosub, GetPassword
return

::!BPJ::
SendInput V:\USPTO\Benjamin.Johnson.epf
gosub, GetPassword
return

::!BGM::
SendInput V:\USPTO\Bryan McWhorter.epf
gosub, GetPassword
return

::!CTS::
SendInput V:\USPTO\Christopher Sweeney.epf
gosub, GetPassword
return

::!CBH::
SendInput V:\USPTO\Colin Heideman.epf
gosub, GetPassword
return

::!MCA::
SendInput V:\USPTO\Maria Anderson.epf
gosub, GetPassword
return

::!MAU::
SendInput V:\USPTO\Mauricio Uribe.epf
gosub, GetPassword
return

::!MJS::
SendInput V:\USPTO\Melanie Seelig.epf
gosub, GetPassword
return

::!SWF::
SendInput V:\USPTO\Scott.Forbes.epf
gosub, GetPassword
return

::!YXL::
SendInput V:\USPTO\Yiheng.Li.epf
gosub, GetPassword
return

::!ADM::
SendInput Q:\USPTO\Alejandro.Munoz.epf
gosub, GetPassword
return

::!AVS::
SendInput Q:\USPTO\Andrew.Schwaab.epf
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
Sleep 200
gosub, GetPassword
return

EAL2:
Gui, Submit
Sleep 200
SendInput W:\USPTO\EliLoots.epf
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
Sleep 200
gosub, GetPassword
return

EYZ2:
Gui, Submit
Sleep 200
SendInput H:\USPTO\Eric.Zhou.epf
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
Sleep 200
gosub, GetPassword
return

GRM2:
Gui, Submit
Sleep 200
SendInput W:\USPTO\Grant.McAdams.epf
Sleep 200
gosub, GetPassword
return

GRM3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

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
Sleep 200
gosub, GetPassword
return

LSE2:
Gui, Submit
Sleep 200
SendInput U:\USPTO\Lincoln.Essig.epf
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
Sleep 200
gosub, GetPassword
return

MHT2:
Gui, Submit
Sleep 200
SendInput Q:\USPTO\Michael.Trenholm.epf
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
Sleep 200
gosub, GetPassword
return

MZC2:
Gui, Submit
Sleep 200
SendInput S:\USPTO\Morgan.Coates.epf
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
Sleep 200
gosub, GetPassword
return

SGS2:
Gui, Submit
Sleep 200
SendInput S:\USPTO\Scott.Siera.epf
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
Sleep 200
gosub, GetPassword
return

VXT2:
Gui, Submit
Sleep 200
SendInput V:\USPTO\Vlad.Teplitskiy.epf
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
Sleep 200
gosub, GetPassword
return

JLP2:
Gui, Submit
Sleep 200
SendInput H:\USPTO\John.Paik.epf
Sleep 200
gosub, GetPassword
return

JLP3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

