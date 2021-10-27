#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)

Gui, New, , AutoHotKey Tutorial
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Welcome to the AutoHotKey Tutorial!
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,AutoHotKey is a program that allows us to create all sorts`nof useful tools and shortcuts.`n`nWe're going to go through each of the functions that have`nbeen created so you can get a good idea of how to use them.`n`nI'll let you know who should typically use the functions,`nand how/where to use, and how to activate/disable them.`n`nAre you ready to start the tutorial?`nIf so, click the button below.
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 gStart , Click here to proceed!
Gui, Show, 
return

GuiClose:
Gui, Hide
return

Start:
WinGetPos, WindowPosX, WindowPosY, , , A, 
Gui, Destroy
Progress, P0, Should only be a few seconds..., Getting the AHK Tutorial ready..., Loading the AHK Tutorial., 
Sleep 2500
Progress, 30, Almost there..., Flux capacitor... fluxxing..., Loading the AHK Tutorial., 
Sleep 2500
Progress, 85, Just a little bit more..., So close!, Loading the AHK Tutorial., 
Sleep 2500
Progress, 100, Let's do this!, And we're done!, Finished loading the AHK Tutorial., , 
Sleep 2000
Progress, Off
gosub Tutorial1
return

Tutorial1:
IfNotExist, C:\Users\%A_Username%\AHKPrefs.ini
{
MsgBox, It looks like this is your first time using the AHK scripts.`n`nGive me two seconds while I create your User profile...
IniWrite, +CapsLock, C:\Users\%A_Username%\AHKPrefs.ini, Custom, Custom1
IniWrite, ^``, C:\Users\%A_Username%\AHKPrefs.ini, Custom, Custom2
;IniWrite, #Space, C:\Users\%A_Username%\AHKPrefs.ini, Custom, Custom3
IniWrite, ^5, C:\Users\%A_Username%\AHKPrefs.ini, Custom, Custom4
IniWrite, ^6, C:\Users\%A_Username%\AHKPrefs.ini, Custom, Custom5
IniWrite, ^`;, C:\Users\%A_Username%\AHKPrefs.ini, Custom, Custom6
IniWrite, ^1, C:\Users\%A_Username%\AHKPrefs.ini, Custom, Custom7
QuickRecordOpener = Alt+RightClick / Alt+LeftClick
IniWrite, %QuickRecordOpener%, C:\Users\%A_Username%\AHKPrefs.ini, Username, QuickRecordOpener
IniWrite, www.google.com, C:\Users\%A_Username%\AHKPrefs.ini, Custom, CustomSideBar
IniWrite, "" , C:\Users\%A_Username%\AHKPrefs.ini, Hotcorner, HotCornerBL
IniWrite,  "", C:\Users\%A_Username%\AHKPrefs.ini, Hotcorner, HotCornerTR
IniWrite, "" , C:\Users\%A_Username%\AHKPrefs.ini, Hotcorner, HotCornerBR
Checkboxes = 0,1,1,1,1,1,1,1,1
IniWrite, %Checkboxes%, C:\Users\%A_Username%\AHKPrefs.ini, Username, Checkboxes
RecordBoxes = 1,1,1,1,1,1
IniWrite, %RecordBoxes%, C:\Users\%A_Username%\AHKPrefs.ini, Username, RecordBoxes
RadioChoice = 1,0,0
IniWrite, %RadioChoice%, C:\Users\%A_Username%\AHKPrefs.ini, Username, Radio
EFSEmail = instructions@knobbe.com
IniWrite, %EFSEmail%, C:\Users\%A_Username%\AHKPrefs.ini, Username, EFSEmail
SettingsX = 1
IniWrite, %SettingsX%, C:\Users\%A_Username%\AHKPrefs.ini, Username, SettingsX
SettingsY = 1
IniWrite, %SettingsY%, C:\Users\%A_Username%\AHKPrefs.ini, Username, SettingsY
SidebarX = 2557
IniWrite, %SidebarX%, C:\Users\%A_Username%\AHKPrefs.ini, Username, SidebarX
Keystrokes = 0
IniWrite, %Keystrokes%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, Keystrokes
DateShortcut = 0
IniWrite, %DateShortcut%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, DateShortcut
AttyFinder = 0
IniWrite, %AttyFinder%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, AttyFinder
CalExtend = 0
IniWrite, %CalExtend%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, CalExtend
SysSwitch = 0
IniWrite, %SysSwitch%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, SysSwitch
ExcelHLink = 0
IniWrite, %ExcelHLink%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, ExcelHLink
EFSCertFinder = 0
IniWrite, %EFSCertFinder%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, EFSCertFinder
CopyAction = 0
IniWrite, %CopyAction%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, CopyAction
PasteAction = 0
IniWrite, %PasteAction%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, PasteAction
SuggestRemarks = 0
IniWrite, %SuggestRemarks%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, SuggestRemarks
ClientCodeIE = 0
IniWrite, %ClientCodeIE%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, ClientCodeIE
EFSFill = 0
IniWrite, %EFSFill%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, EFSFill
EFSLogin = 0
IniWrite, %EFSLogin%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, EFSLogin
MsgBox, OK! All set!`n`nLet's go to the first tutorial.
}
else IfExist, C:\Users\%A_Username%\AHKPrefs.ini
{
MsgBox, It looks like you've used Scripts.ahk before.`n`nThat means you've likely disabled some of options.`n`nYou won't be able to try all of the tutorials if that's the case.`n`nI'll open up the Settings Menu in the next step, so you should enable all options when it opens so you have a chance to try everything out.
}
Gui, New, , Tutorial 1 - Running Scripts.ahk
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 1 - Running Scripts.ahk
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,The first thing you need to do is run the Scripts.ahk file.
Gui, Add, Text, Center w700,This is located at H:\Docketing\AutoHotKey\Scripts\.
Gui, Add, Text, Center w700,I'll make it easy on you and add a shortcut to your Desktop,`nand also start the script this time.
Gui, Add, Text, Center w700,You'll have to do it yourself next time!
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 gCopyScript , Click here to proceed!
Gui, Font, s10
Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts||2 - Quick Date and Initials|3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse|10 - Settings Menu|11 - EFS Options|12 - HotCorners|13 - Keybindings| 
Gui, Show, x%WindowPosX% y%WindowPosY%
return

Position:
GuiControlGet,  CurrentPage, , ComboBox1
;MsgBox, %CurrentPage%
	if CurrentPage = 1
		gosub Tutorial1
	if CurrentPage = 2
		gosub Tutorial2
	if CurrentPage = 3
		gosub Tutorial3
	if CurrentPage = 4
		gosub Tutorial4
	if CurrentPage = 5
		gosub Tutorial5
	if CurrentPage = 6
		gosub Tutorial6
	if CurrentPage = 7
		gosub Tutorial7
	if CurrentPage = 8
		gosub Tutorial8	
	if CurrentPage = 9
		gosub Tutorial9	
	if CurrentPage = 10
		gosub Tutorial10
	if CurrentPage = 11
		gosub Tutorial11
	if CurrentPage = 12
		gosub Tutorial12
	if CurrentPage = 13
		gosub Tutorial13		
return

CopyScript:
WinGetPos, WindowPosX, WindowPosY, , , A, 
Gui, Destroy
FileCreateShortcut, H:\Docketing\AutoHotKey\Scripts\Scripts.ahk, C:\Users\%A_Username%\Desktop\Scripts.lnk, H:\Docketing\AutoHotKey\Scripts\Scripts.ahk
Sleep 1000
Run "H:\Docketing\AutoHotKey\Scripts\Scripts.ahk"
Sleep 1000
gosub Tutorial2
return

Tutorial2:
WinGetPos, WindowPosX, WindowPosY, , , A, 
Gui, Destroy
Gui, New, , Tutorial 2 - Quick Date and Initials
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 2 - Quick Date and Initials
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,Don't freak out! The Settings Menu should have opened up,`nand you should have a Scripts.ahk shortcut on your desktop.
Gui, Add, Text, Center w700,I've enabled all of the options for training purposes,`nbut we're only interested in "Enable Quick Date and Initials."
Gui, Add, Text, Center w700,(If you've used Scripts.ahk before, now is the time`nto enable all of the options for tutorial purposes.`nYou can always disable them again later.)
Gui, Add, Text, Center w700,This is a quick way to enter your Audit Trail date and initials,`nwhich is something we do a hundred times per day.
Gui, Add, Text, Center w700,It might show ERROR in Date and Username.`nThis is simply because the script doesn't know what day it is, or who you are.
Gui, Add, Text, Center w700,Enter your Date how you'd normally format it, like '2/21/17 -'`nthen enter your Username, like '-FLASTNAME'.
Gui, Add, Edit, ReadOnly Center w700, 2/21/17 -       |         Test remarks go here.         |        -FLASTNAME
Gui, Add, Text, Center w700,Press Update on the Settings Menu once you're done.`nWe'll come back later for the other options.
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 gTutorial2point1 , Click here to proceed!
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

Tutorial2point1:
WinGetPos, WindowPosX, WindowPosY, , , A, 
Gui, Destroy
Gui, New, , Tutorial 2 - Quick Date and Initials
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 2 - Quick Date and Initials
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: Everyone.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,There are actually three ways to use this function:
Gui, Add, Text, Center w700,Option 1 - Blank space.`nClick below, then hold Shift and press CapsLock. 
Gui, Add, Edit, w700,
Gui, Add, Text, Center w700,Note that the cursor will jump to the center for quick typing!
Gui, Add, Text, Center w700,Option 2 - Short remarks.`nClick at the beginning of the line, then do what you did before. 
Gui, Add, Edit, w700, Here is some test text.
Gui, Add, Text, Center w700,The text will be surrounded by your Date and Username!
Gui, Add, Text, Center w700,Option 3 - Long remarks.`nHighlight the below text, then do what you did before. 
Gui, Add, Edit, w700, Here is some really long text. I bet this text is long enough to go on two lines. I'd bet you a dollar it goes on two lines. It better go on two lines.
Gui, Add, Text, Center w700,This method can also remove the "* -" that defaults on some remarks.
Gui, Add, Text, Center w700, That's it! That's everything! That's the end of this tutorial. Easy enough, right? 
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 gTutorial3 , Click here to proceed!
Gui, Font, s10
Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials||3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse|10 - Settings Menu|11 - EFS Options|12 - HotCorners|13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

Tutorial3:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 3 - Quick Current Date
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 3 - Quick Current Date
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: Everyone.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,This one is really quick and easy!
Gui, Add, Text, Center w700,If you're familiar with Excel (or the old docketing system), you'll like this one.
Gui, Add, Text, Center w700,Click below, then hold Control and press `; (Semicolon).
Gui, Add, Edit, w700,
Gui, Add, Text, Center w700,This will add the current date in docketing, just like it does in Excel!
Gui, Add, Text, Center w700, That's it! We're done! That's the end of this tutorial.
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 gTutorial4 , Click here to proceed!
Gui, Font, s10
Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials|3 - Quick Current Date||4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse|10 - Settings Menu|11 - EFS Options|12 - HotCorners|13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

Tutorial4:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 4 - System Switch Shortcut
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 4 - System Switch Shortcut
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: Mostly International, Master Docket, *IntFees, and *Abandonment.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,This option let's you quickly jump from Live to Audit Trail and vice versa.
Gui, Add, Button, Center w700 gTestDocket,Click here to open a record in docketing for testing purposes.
Gui, Add, Text, Center w700,Once the record is open, hold Control, and then press ~. (It is to the left of 1.)
Gui, Add, Text, Center w700,If you did it right, the Audit Trail equivalent should have opened in a new tab.
Gui, Add, Text, Center w700,Do what you did before to switch back to the Live system.
Gui, Add, Text, Center w700,This can also be used within an action to take you to the opposite system.
Gui, Add, Button, Center w700 gTestAction,Click here to open an action in docketing for testing purposes.
Gui, Add, Text, Center w700,Do what you did before to switch to the Audit Trail system.
Gui, Add, Text, Center w700, Note that you can't jump from a Live Action to AT Action or vice versa,`nand this doesn't work on the Invention screen.
Gui, Add, Text, Center w700, That's the end of this tutorial. Are we having fun yet?
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 gTutorial5 , Click here to proceed!
Gui, Font, s10
Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials||3 - Quick Current Date|4 - System Switch Shortcut||5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse|10 - Settings Menu|11 - EFS Options|12 - HotCorners|13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

TestDocket:
Run "http://oc-docketing/CPi/patfrmCountryApplication.aspx?key=1269335"
return

TestAction:
Run "http://oc-docketing/CPi/patfrmActionDue.aspx?key=9240126&bc=1&key2=1269335"
return

Tutorial5:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 5 - Open Hyperlink from Excel
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 5 - Open Hyperlink from Excel
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: Master Docket, *IntFees, and *Abandonment*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,This option let's you open special hyperlinks from Excel directly into docketing.
Gui, Add, Text, Center w700,I won't go into the details since it is so rarely used.`n`nYou'll know if and when you'll need to use it.
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 gTutorial6 , Click here to proceed!
Gui, Font, s10
Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials|3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel||6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse|10 - Settings Menu|11 - EFS Options|12 - HotCorners|13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

Tutorial6:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 6 - Settings/Shortcuts Bar
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 6 - Settings/Shortcuts Bar
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: Everyone (Optional).*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,You may have noticed the Settings button that appeared`nin the top-left corner of your screen.`n(Or elsewhere if you previously adjusted it.)
Gui, Add, Text, Center w700,This Settings/Shortcuts Bar will have alternative buttons for any enabled options.`nSome people prefer to click the buttons instead of using key combinations.
Gui, Add, Text, Center w700,It can be repositioned to wherever you'd like on the screen. We'll get to this later.`n`nYou can temporarily hide the extra buttons when not needed using >>.`nYou can also disable the entire thing if you don't like it.
Gui, Add, Text, Center w700, That's basically everything for this option, so we'll end the tutorial here.
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 gTutorial7 , Click here to proceed!
Gui, Font, s10
Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials|3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar||7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse|10 - Settings Menu|11 - EFS Options|12 - HotCorners|13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

Tutorial7:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 7 - Store/Paste Extra Clipboards
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 7 - Store/Paste Extra Clipboards
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: Everyone.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,This option allows you to store text for later use.`nThis is helpful for redundant text that you type repeatedly.
Gui, Add, Edit, w700 Center, Highlight this text, then hold Control and press 5.
Gui, Add, Text, Center w700,You may see ERROR since you don't have anything stored yet.`nClick one of the slots to save the text for later.
Gui, Add, Text, Center w700,Highlight the above text again, and do what you did before. Select a different slot.
Gui, Add, Text, Center w700,Now, hold Control and press 6. This will open your saved options for pasting.`nClick in the below box, then click one of your stored options.
Gui, Add, Edit, w700 Center, 
Gui, Add, Text, Center w700,It should have typed your stored text in the box. Try again if it didn't work.
Gui, Add, Text, Center w700,You can clear a slot by holding Control and pressing 5 with no text selected.
Gui, Add, Text, Center w700,That's about it! Not too tough, right? That's the end of this tutorial.
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 default gTutorial8 , Click here to proceed!
Gui, Font, s10
Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials|3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards||8 - Hotstrings|9 - Multiuse|10 - Settings Menu|11 - EFS Options|12 - HotCorners|13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

Tutorial8:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 8 - Hotstrings
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 8 - Hotstrings
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: Everyone.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,Hotstrings are basically short abbreviations that expand into longer phases.`nA good example is "btw" changing into "by the way." 
Gui, Add, Text, Center w700,This is actually a separate script so you can have your own list of shortcuts.
Gui, Add, Text, Center w700,Let's go ahead and move a copy of Hotstrings.ahk to your Desktop and start it up.`nYou'll have to open it yourself next time.
Gui, Add, Button, Center w700 gMoveHotstrings,Click here to move Hotstrings.ahk to your Desktop.
Gui, Add, Text, Center w700,Click in the box below and type btw.
Gui, Add, Edit, w700 Center,
Gui, Add, Button, Center w700 gNewHotstring,Now hold Control and press =, or click here to make a new hotstring.
Gui, Add, Text, Center w700,The Hotstring interface should have opened.`nI suggest using a symbol like !, @, or # so you don't type your shortcut on accident.`n`nTry making a test one now, hit Update, and then test it in the box above.`n`nIf you make a mistake or an annoying hotstring, hold Control and press = to open the interface.`nOnce it opens, click "Need to delete a mistake?" to fix the error.
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 default gTutorial9 , Click here to proceed!
Gui, Font, s10
Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials|3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings||9 - Multiuse|10 - Settings Menu|11 - EFS Options|12 - HotCorners|13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

MoveHotstrings:
	IfExist, C:\Users\%A_Username%\Desktop\Hotstrings.ahk
		{
		MsgBox, It looks like you already have Hotstrings.ahk on your desktop.`n`nI won't move a new copy since that might overwrite any hotstrings you've created.`n`nI'll go ahead and start it now in case it isn't running already.
		Run "C:\Users\%A_Username%\Desktop\Hotstrings.ahk"
		return
		}
	else
		{
		FileCopy, H:\Docketing\AutoHotKey\Scripts\Personal Scripts. Save to Desktop. DO NOT RUN FROM HERE!\Hotstrings.ahk, C:\Users\%A_Username%\Desktop\
			Sleep 1000
		IfExist, C:\Users\%A_Username%\Desktop\Hotstrings.ahk
			Run "C:\Users\%A_Username%\Desktop\Hotstrings.ahk"
		IfNotExist, C:\Users\%A_Username%\Desktop\Hotstrings.ahk
			MsgBox, ,Something went wrong... :(, I think something went wrong. I don't think it worked.`n`nDo you have the H: drive mapped?`n`nTry again, or add the Hotstrings.ahk script directly to your desktop.
		return
		}
return 

NewHotstring:
SendInput ^{=}
return

Tutorial9:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 9 - Multiuse
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 9 - Multiuse
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: Mostly International and Master Docket.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,The Multiuse function has different uses based on what you highlight.`nHere are the four places it works:
Gui, Add, Text, Left w700,REMARKS SUGGESTER`t- an Action Type, such as INT-PAT STATUS CHECK.`nATTORNEY FINDER`t`t- a block of Attorneys, such as JWB - TMPL, SJN - Reviewing.`nCALENDAR EXTENDER`t- a date in Docketing, such as 14-Dec-2016.`nRECORD OPENER`t`t- a Client Code, such as QVID.123BR.
Gui, Add, Text, Center w700,Essentially, you highlight one of the above options, hold Control, and then Right Click.`nIt will evaluate what you highlighted and trigger a specific function.`n`nWe'll go more in-depth on the next page.
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 default gTutorial9point1 , Click here to proceed!
Gui, Font, s10
Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials|3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse||10 - Settings Menu|11 - EFS Options|12 - HotCorners|13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

Tutorial9point1:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 9.1 - Multiuse - Remarks Suggester
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 9.1 - Remarks Suggester
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: Potentially everybody.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,The Remarks Suggester provides common remarks based on an Action Type.
Gui, Font, s10 italic
Gui, Add, Text, Center w700,*Note that only Status Checks are currently implemented.
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,For example, when closing a Status Check,`nwe're often receiving an Office Action or a Notice of Allowance.
Gui, Add, Button, Center w700 gStatusCheck,Click here to open an example Status Check action.
Gui, Add, Text, Center w700,Once the docket opens, highlight the Action Type (INT-PAT STATUS CHECK),`nthen hold Control, and Right Click.
Gui, Add, Text, Center w700,A menu similar to the Copy/Paste Clipboards function will show up,`nand you can click an option to paste the suggested remarks.`n`nThis also surrounds the remarks with your Date and Username.`n`nThat's basically it. Moving on...
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 default gTutorial9point2 , Click here to proceed!
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

StatusCheck:
Run "http://oc-docketing/CPi/patfrmActionDue.aspx?key=9240126&bc=1&key2=1269335"
return

Tutorial9point2:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 9.2 - Attorney Finder
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 9.2 - Attorney Finder
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: International.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,The Attorney Finder will remove duplicate attorneys`nand automatically substitute unusual names (like AYF -> Anna.Frank).`nYou can then quickly paste the attorneys and your AT partner into your new email.`n(We'll add your AT Partner later on in the tutorial, so it will have ERROR for now.)
Gui, Add, Button, Center w700 gStatusCheck,Click here to open an example action.
Gui, Add, Text, Center w700,Once the docket opens, highlight the Attorneys (I usually triple-click to select them),`nthen hold Control and Right Click.
Gui, Add, Text, Center w700,You'll get a small prompt that the attorneys are ready to be pasted in your email.
Gui, Add, Button, Center w700 gOpenNewEmail,Click here open a new email in Outlook.
Gui, Add, Text, Center w700,Paste the attorneys into the CC: field.`nClick "Check Names" or wait a moment for the names to fill in,`nthen drag the relevant person to the To: field. Go ahead and close the email now.`n`nThis also works on Trademarks and the Invention Screen.
Gui, Add, Button, Center w700 gExampleTrademark,Click here to open an example Trademark record.
Gui, Add, Text, Center w700,Once the docket opens, highlight the Attorneys`n(start at the bottom-right and drag to the top-left),`nthen hold Control and Right Click.`n`nOpen a new email, then paste in CC: and drag to To: like you did before. Now close the email.`n`nThat's everything! You'll still need to add Invoices, *IntFees, *IntExams, etc.
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 default gTutorial9point3 , Click here to proceed!
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

ExampleTrademark:
Run "http://oc-docketing/CPi/tmkfrmTrademark.aspx?key=506079&bc=06554739-5b72-407e-bb98-014e69ddbe83&tab=13"
return

OpenNewEmail:
olMailItem := 0
o:= ComObjActive("Outlook.Application").Session()
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
MailItem.Display ;Make email visible
return

Tutorial9point3:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 9.3 - Calendar Extender
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 9.3 - Calendar Extender
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: Master Docket, but potentially others.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,The Calendar Extender allows you to quickly extend a date in docketing`nbased on an attorney's or paralegal's instructions.
Gui, Add, Button, Center w700 gTestAction,Click here to open an action in docketing for testing purposes.
Gui, Add, Text, Center w700,Once the docket opens, click the Edit button on the right side of the Due Dates tab,`nand then click Edit below Action Due in the left side of the new window.
Gui, Add, Text, Center w700,Now select the entire Due Date (or triple click), then hold Control and Right Click.`n`nA calendar will pop-up with options for common extension periods.`n(Clicking 1M will extend one month, 3M will extend three months, etc.)`n`nIf "Remarks?" is checked, remarks with`nthe extension duration and your Date and Username will populate.
Gui, Add, Text, Center w700,Try clicking 3M to extend the date three months.`n`nHighlight the date again and do what you did before. Tick Remarks? then extend the date again.`nYou'll see the remarks autofill, and all you'll need to add is the Responsible person.`n`nYou can always press Escape or hit Cancel to undo the changes you've made,`nso don't stress if it didn't work right. Go ahead and hit Cancel to undo what you did.`n`nLastly, the automatic remarks won't work on Audit Trail.
Gui, Add, Text, Center w700,That's everything! This has been super helpful for Master Docket and saves a ton of time.
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 default gTutorial9point4 , Click here to proceed!
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

Tutorial9point4:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 9.4 - Record Opener
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 9.4 - Record Opener
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: International. US doesn't seem to use it for some reason.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,The Record Opener lets you quickly open a Client Code from anywhere you're able to select it.`nThis could be an email, or in docketing, or in Excel, etc. It is VERY quick!`n`nHighlight the below Client Code, then hold Control and Right Click.
Gui, Add, Edit, w700 Center, HANBEV.5678ZTPH
Gui, Add, Text, Center w700,A small menu will pop up with different areas of docketing.`n(It can't tell a Trademark from a Patent, so you have to select the correct option.)`n`nChoose Patent Live. Note that it will open in the first tab of your active Internet Explorer window.`n`nNow highlight it again and choose Patent AT instead.
Gui, Add, Text, Center w700,You can disable some of the options if you don't need them. We'll get to this later.`nOnly handle Patents? Remove the TM ones. Never want Invention screen? Remove them!
Gui, Font, s22 underline bold
Gui, Add, Text, Center w700, Quick Record Opener
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,There is also a Quick Record Opener option that ignores the above choices.`n`nSelect the Client Code above, then hold Alt and Right Click.`nIf this was a Trademark, you would Left Click instead.`n`nIf this feels backwards, you can switch these around later.
Gui, Add, Text, Center w700,That's everything the Multiuse function does! Attorney Finder and Record Opener are quite popular!
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 default gTutorial10 , Click here to proceed!
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

Tutorial10:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 10 - Settings Menu (Miscellaneous)
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 10 - Settings Menu (Miscellaneous)
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: Everyone.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,We've covered a good chunk of the available functions at this point.`nThere are a few more to show you, but we need to update our settings first.`n`nThere are several ways to open the Settings Menu:
Gui, Add, Text, Left w700,1) Hold Control and press CapsLock.`n2) Click the Settings button on the top-left corner of your screen (unless you've moved it already).`n3) Hold Control and move your mouse to the top-left corner of the screen.`n`t-This will open the Quick Settings menu, and you can click the Settings button.`n4) Restarting Scripts.ahk. The Settings Menu will always open when (re)starting the script.
Gui, Add, Text, Center w700,Try any of the above options, and you'll end up at the Settings Menu.`nThis is where you'll start your day every day.`n`nWe've covered everything on the Miscellaneous and Multiuse Tabs so far.
Gui, Add, Text, Center w700,To start, let's try moving the Settings Bar position somewhere more convenient.`nAfter you click the Settings Bar Positioning arrow buttons,`na Test button will appear and show the new location.`n*The bottom-left corner above the Start menu is a good place to try.
Gui, Add, Text, Center w700,Also note that you can start the Hotstrings script directly from here.`nYou can also create a new hotstring or delete any errors you may have made.`n`nLastly, there is a Help menu with descriptions and pictures of every function.`nFeel free to browse that section if you have any questions beyond the tutorial.
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 default gTutorial10point1 , Click here to proceed!
Gui, Font, s10
Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials|3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse|10 - Settings Menu||11 - EFS Options|12 - HotCorners|13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

Tutorial10point1:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 10 - Settings Menu (Multiuse)
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 10 - Settings Menu (Multiuse)
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: Everyone.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,Head to the Multiuse Tab. Here are the options I mentioned earlier in the tutorial.`n`nYou can check/uncheck Calendar Extender auto-remarks here.`nThis setting also shows on the calendar pop-up when used.`n`nYou can uncheck Record Opener options you don't want, or even force Patent or Trademark.`n`nIf the Quick Record Opener felt backwards earlier, you can switch the setting here.`n`nCan't remember what you thought before?`nTry out both functions here until it looks and/or feels right.`nNote that you'll need to hit Update for any changes to take effect.
Gui, Font, s10 italic
Gui, Add, Text, Center w700,(In case you forgot, highlight the text, hold Control or Alt, then Right Click.)
Gui, Font
Gui, Font, s10
Gui, Add, Edit, w700 Center, DOCKET.002WEM
Gui, Add, Edit, w700 Center, DOCKETING.AHK

Gui, Add, Text, Center w700,Lastly, you can update your AT Partner for the Attorney Finder.`nIf you don't use the Attorney Finder, or don't have a partner, feel free to leave this blank.`n`nNow that we're done with those functions and settings,`nit's time to trudge ahead to the next ones.
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 default gTutorial10point2 , Click here to proceed!
;Gui, Font, s10
;Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials|3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse|10 - Settings Menu||11 - EFS Options|12 - HotCorners|13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

Tutorial10point2:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , POP QUIZ!
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, POP QUIZ!
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Bet you didn't see that coming!*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,I figured I'd give you a chance to review what we've gone over so far.`n`nIf you can't remember something, you can head back to that tutorial.`n`nPut Today's Date in the box below (Tutorial 3),`nthen use the hotstring to write by the way! (Tutorial 8)
Gui, Add, Edit, w700 Center,
Gui, Add, Edit, w700 Center, Now surround this text with your Date and Username! (Tutorial 2)
Gui, Add, Text, Center w700,Now copy the above text with your Store Clipboard function (Tutorial 7)...`nthen use your Paste Clipboard to paste below! (Tutorial 7)
Gui, Add, Edit, w700 Center,
Gui, Add, Text, Center w700,Now use (Quick) Record Opener to open the below record in docketing! (Tutorial 9)
Gui, Add, Edit, w700 Center, DOCKET.002WEM
Gui, Add, Text, Center w700,Once you're there, use System Switch just for the heck of it! (Tutorial 4)`n`nNow use Remarks Suggester on the below action! (Tutorial 9)
Gui, Add, Edit, w700 Center, INT-PAT STATUS CHECK
Gui, Add, Text, Center w700, That's probably good for now! Do you feel like you're understanding it?
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 default gTutorial11 , Click here to proceed!
Gui, Font, s10
Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials|3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse|10 - Settings Menu||11 - EFS Options|12 - HotCorners|13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

Tutorial11:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 11 - Settings Menu (EFS Options)
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 11 - Settings Menu (EFS Options)
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: 99`% US, 1`% International.*
Gui, Font
Gui, Font, s10 italic
Gui, Add, Text, Center w700,*If you never log into EFS or pay EFS fees, feel free to skip this tutorial.
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700, Head back to the Settings Menu and go to the third tab.`n`nThere are three components of EFS Options:
Gui, Add, Text, Left w700,1) EFS Certificate and Password Finder (Quickly locate EFS certificate location and password.)`n2) EFS Information Filler (Quickly fill in information to jump to EFS ID section.)`n3) EFS Fees Log-in (Preemptively log into EFS fees to avoid being logged out.)
Gui, Add, Text, Center w700, Go ahead and enter you first name and last name like you're doing an EFS filing.`nMake sure you choose the email address you use.`n`nNext, enter your EFS Fees email address, and your extra complicated password.`n`nClick Update to save your changes.
Gui, Add, Button, x182 w400 h30 default gTutorial11point1 , Click here to proceed!
Gui, Font, s10
Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials|3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse|10 - Settings Menu|11 - EFS Options||12 - HotCorners|13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

Tutorial11point1:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 11.1 - EFS Certificate Finder
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 11.1 - EFS Certificate Finder
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: 99`% US, 1`% International.*
Gui, Font
Gui, Font, s10
Gui, Add, Button, Center w700 gOpenEFSPage,Click here to open the EFS page.
Gui, Add, Text, Center w700,Once you're on the EFS page, you can activate the EFS Certificate Finder by typing !ATY.`nThat is, instead of 2DEA, type !DEA.`n`nClick in the Certificate textbox and type !DEA, then press Space.`n`nYou should see the certificate address autofill immediately.`nIt will then find the password and paste it in.
Gui, Font
Gui, Font, s10 italic
Gui, Add, Text, Center w700,*This sometimes can't find the password. Try again and it should work.*`n`n*You may also need to run MapIt! to map different locations.*`n`n*If the attorney doesn't work, or the password is incorrect,`nemail Tyler and he can update it right away.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,That's it for the Certificate Finder! The US side uses this all the time, but International can too.`n`nProceed to the next section of EFS, then head to the next tutorial.

Gui, Font, s16
Gui, Add, Button, x182 w400 h30 default gTutorial11point2 , Click here to proceed!
;Gui, Font, s10
;Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials|3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse|10 - Settings Menu|11 - EFS Options||12 - HotCorners|13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

OpenEFSPage:
Run "https://efs.uspto.gov/EFSWebUIRegistered/EFSWebRegistered"
return

Tutorial11point2:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 11.2 - EFS Information Filler
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 11.2 - EFS Information Filler
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: 99`% US, 1`% International.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700,You should now be on the page where you enter your First Name, Last Name, and Email Address.`n`nInstead of doing that, hold Control and move your mouse to the top-left corner of the screen.`nThis will activate the Quick Settings menu.`n`n(Note that you can get to the Settings Menu and run MapIt! from here as well!)`n`nFor best results, your EFS tab should be the only tab open.`nGo ahead and click "Fill EFS Info."`n`nIf you're lucky, this will autofill your information and jump down to let you select the EFS ID.
Gui, Font
Gui, Font, s10 italic
Gui, Add, Text, Center w700,*This can occasionally fail on the first try, especially if EFS isn't the only open tab.`n`nAccess the URL at the top of the browser, and delete everything from the ? over.`nThen hit Enter to reload the page, and try clicking "Fill EFS Info" again.`n(The Help section in the Settings Menu has pictures to help explain.)
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700, If everything went as planned, your info should have autofilled,`nand you can pick your EFS ID and proceed with your QC.`n`nThat's it for this function!`n`nThis saves a ton of time for the US side since they log into EFS so often.

Gui, Font, s16
Gui, Add, Button, x182 w400 h30 default gTutorial11point3 , Click here to proceed!
;Gui, Font, s10
;Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials|3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse|10 - Settings Menu|11 - EFS Options||12 - HotCorners|13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

Tutorial11point3:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 11.3 - EFS Fees Log-in
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 11.3 - EFS Fees Log-in
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: 99`% US, 1`% International.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700, This function allows you to preemptively log into EFS Fees.`nThis means you won't need to manually enter your information after completing a QC.
Gui, Add, Text, Center w700, When you are almost done with a QC (or if the QC will take less than fifteen minutes),`naccess the Quick Settings menu and click "Log into EFS Fees."`n`nWait a few moments, and a small pop-up will show you it is logging into EFS.`n`nOnce the pop-up goes away, you should be logged into EFS Fees,`nThis lets you skip the login screen when you go to pay.
Gui, Add, Text, Center w700, Of course, nothing is perfect, and it occasionally won't log you in.`nIt could be your password has expired, or something else interfered with the process.`n`nYou'll have to sign in the old-fashioned way this time,`nbut be sure to try this out on your next QC.`n`nThat's everything for the EFS Options!`n`nThese functions are super helpful for the US side since they use EFS so much.`nIt isn't as helpful for International, but is still nice to save some time.

Gui, Font, s16
Gui, Add, Button, x182 w400 h30 default gTutorial12 , Click here to proceed!
;Gui, Font, s10
;Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials|3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse|10 - Settings Menu|11 - EFS Options||12 - HotCorners|13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

Tutorial12:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 12 - HotCorners
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 12 - HotCorners
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: Everyone.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700, HotCorners (formerly SideBar) function just like the Quick Settings menu`n(where you hold Control and move your mouse to the top-left corner),`nexcept you can run most other AHK functions instead of doing a keyboard shortcut.`n`nHead back to the Settings Menu, and go to the third tab.`n`nYou'll see the top-left option shows Quick Settings, and the others are blank.`n`nI've added Internet Explorer, Calculator, Kronos, and Google as examples, but you can add others.
Gui, Add, Text, Center w700, Let's make "calc.exe" for the bottom-left, "Copy Clipboard" for the top-right,`nand "Paste Clipboard" for the bottom-right. Now click Update to save your changes.`n`nJust like the Quick Settings menu, hold Control, and move your mouse to the corner of the screen.`n`nHold Control, and when your mouse gets to the bottom-left corner, Calculator will open.`n`nHighlight the below text, then hold Control and move your mouse to the top-right corner.
Gui, Add, Edit, w700 Center, This is a HotCorners test.
Gui, Add, Text, Center w700, It functions as if you pressed the Store Clipboard shortcut, but just requires a mouse gesture.`n`nNow hold Control, and move to the bottom-right corner of the screen.`nClick in the box below, and paste what you just saved.
Gui, Add, Edit, w700 Center,
Gui, Add, Text, Center w700, This only works for the far corners of your screens.`nIt doesn't work with, for example, the top-right corner of your left monitor`nwhen you also have a right monitor.
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 default gTutorial13 , Click here to proceed!
Gui, Font, s10
Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials|3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse|10 - Settings Menu|11 - EFS Options|12 - HotCorners||13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

Tutorial13:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , Tutorial 13 - Keybindings
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, Tutorial 13 - Keybindings
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Used by: Everyone.*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700, That's it! You're done! We've covered every function that exists! (For now, at least.)`n`nNow that you know how to use everything (right?), you can customize HOW you want to use them.`n`nHead back to the Settings Menu, and go to the fourth tab.`nAll of these functions should look familiar, as should the way to activate them.`n`nIf you think Control and 5 is too far for Store Extra Clipboard,`nchange it to something interesting like hold Windows and press Space.`n`nDo you want to do Today's Date without taking your hands off the mouse?`nTry doing Alt and WheelUp (meaning hold Alt, then scroll the mousewheel up.)`nYou can even remap a button to do a function.`nHave you ever used F7? Why not make it do System Switch?`n`nKeep in mind that these will override your system functions,`nso don't set something to Control + C, or entirely override Space or Enter to do Today's Date.
Gui, Add, Text, Center w700, You shouldn't be able to break anything permanently.`nYou can always click "Reset to Defaults" to change everything back to the defaults,`nor "Clear All Keybindings" to start from scratch.
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 default gTutorialEnd , Click here to proceed!
Gui, Font, s10
Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts|2 - Quick Date and Initials|3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse|10 - Settings Menu|11 - EFS Options|12 - HotCorners|13 - Keybindings||
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

#1::
TutorialEnd:
WinGetPos, WindowPosX, WindowPosY, , , A,
Gui, Destroy
Gui, New, , That's the end of the AutoHotKey Tutorial!
Gui, Font, s26 underline bold
Gui, Add, Text, Center w700, End of AHK Tutorial
Gui, Font
Gui, Font, s10 cBlue bold
Gui, Add, Text, Center w700, *Congratulations! You made it!*
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700, You finished the AHK tutorial!`nI know it is a lot to take in, especially so quickly, but it will be worth it.`nHere are some final tips before I set you free:
Gui, Font, s10 underline
Gui, Add, Text, Center w700,-Write the shortcuts on a sticky note and stick it to your monitor for quick reference.`n`n-Focus on one or two functions until they are second nature. You'll quickly wonder how you lived without them.`n`n-For everybody, Quick Date and Initials can save you about 2000 keystrokes per day.`nDo your hands a favor and try it out!`n`n-For International, Record Opener and Attorney Finder will save you a ton of time on Instructions.`n`n-For US, the EFS Certificate Finder and EFS Info Filler`nwill save you a few minutes on each QC. This really adds up in the long run.`n`n-For Master Docket, Record Opener, Calendar Extender, and System Switch are great.`nThey will seriously change your life. 
Gui, Font
Gui, Font, s10
Gui, Add, Text, Center w700, Thanks for taking the time out of your busy day to check out the AHK tutorial!`nI really appreciate it, and hope it helped you understand how AHK works.`n`nIf you're still unclear on anything, feel free to revisit any of the tutorials below.
Gui, Add, Button, Center w700 gEmailTyler,You can click here to email Tyler with feedback/comments/suggestions.
Gui, Font, s16
Gui, Add, Button, x182 w400 h30 default gEndTutorial , Click here to end the tutorial!
Gui, Font, s10
Gui, Add, DropDownList, R25 w400 h30 AltSubmit gPosition vPosition, 1 - Running Scripts||2 - Quick Date and Initials|3 - Quick Current Date|4 - System Switch Shortcut|5 - Open Hyperlink from Excel|6 - Settings/Shortcuts Bar|7 - Store/Paste Clipboards|8 - Hotstrings|9 - Multiuse|10 - Settings Menu|11 - EFS Options|12 - HotCorners|13 - Keybindings|
Gui, Show, x%WindowPosX% y%WindowPosY% 
return

EmailTyler:
olMailItem := 0
o:= ComObjActive("Outlook.Application").Session()
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
MailItem.TO :="tyler.dickson@knobbe.com"
MailItem.Subject := "Feedback/Comments/Suggestions re: AHK Tutorial"
MailItem.Display ;Make email visible
return

EndTutorial:
IniRead, TutorialDone, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, TutorialDone
	if TutorialDone = ERROR
		{
		TutorialDone = 1
		IniWrite, %TutorialDone%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, TutorialDone
		}
	else if TutorialDone != ERROR
		{
		TutorialDone++
		IniWrite, %TutorialDone%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%A_Username%.ini, Achievements, TutorialDone
		}
Sleep 1000
ExitApp
return
