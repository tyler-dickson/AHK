;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                              ;;
;;            If you're here to fix your shortcuts,             ;;
;;       scroll all the way to the end! (hit Ctrl + End)        ;;
;;     Make sure you don't modify anything except the values    ;;
;;          at the bottom under the "Shortcuts" heading.        ;;
;;                                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;#SingleInstance, Force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;                                                   Sets Username for Remarks 
;                                                   Multiple Things in Internet Explorer
;                                                   RemarksInIE:
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
;                                                   Hotstring for Auto-Replacing 
;                                                   HotstringCreator()
;                                                   ClientCodeIE()
IniRead, Custom1, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom1
IniRead, Custom2, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom2
IniRead, Custom3, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom3
IniRead, Custom4, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom4
IniRead, Custom5, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom5
IniRead, Custom6, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom6
IniRead, Custom7, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom7
IniRead, Checkboxes, C:\Users\%A_Username%\Desktop\test.ini, Username, Checkboxes
Hotkey, %Custom1%, Custom1
Hotkey, %Custom2%, Custom2
Hotkey, %Custom3%, Custom3
Hotkey, %Custom4%, Custom4
Hotkey, %Custom5%, Custom5
Hotkey, %Custom6%, Custom6
Hotkey, %Custom7%, Custom7
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
global HotKR = 0
global HotKL = 0

goto Reopen
return

Custom1:  ;+CapsLock
if Option2 = 1
	{
	;MsgBox, %Option2% 2 is Active.
	DateAndName()
	return
	}
else if Option2 = 0
	{
	MsgBox, Function disabled. Press Control+CapsLock to update settings.
	return	
	}
else
	return

^RButton::
if Option3 = 1
	{
	;MsgBox, %Option3% 3 is Active.
	gosub, RemarksInIE
	return
	}
else if Option1 = 0
	{
	MsgBox, Function disabled. Press Control+CapsLock to update settings.
	return
	}
else	
	return

Custom2: ;^`::
if Option4 = 1
	{
	;MsgBox, %Option4% 4 is Active.
	FormatTime, TimeStamp, R
	Gui, Destroy
	CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
	MouseGetPos, xpos, ypos 
	formattime, todaysdate, , MM/dd/yy 
	SwitchSystem()
	return
	}
else if Option4 = 0
	{
	MsgBox, Function disabled. Press Control+CapsLock to update settings.
	return
	}
else	
	return
	
Custom3: ;#Space::
if Option5 = 1
	{
	;MsgBox, %Option5% 5 is Active.
	FormatTime, TimeStamp, R
	Gui, Destroy
	CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
	MouseGetPos, xpos, ypos 
	formattime, todaysdate, , MM/dd/yy 
	WinActivate, ahk_class IEFrame
	PersistentBar()
	return
	}
else if Option5 = 0
	{
	MsgBox, Function disabled. Press Control+CapsLock to update settings.
	return
	}
else
	return

Custom4: ;^5::
if Option6 = 1
	{
	;MsgBox, %Option6% 6 is Active. 
	FormatTime, TimeStamp, R
	Gui, Destroy
	CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
	MouseGetPos, xpos, ypos 
	formattime, todaysdate, , MM/dd/yy 
	StoreClipboard()
	return
	}
if Option6 = 0
	{
	MsgBox, Function disabled. Press Control+CapsLock to update settings.
	return
	}
else
	return	
	
Custom5: ;^6::
if Option6 = 1
	{
	;MsgBox, %Option6% 6 is Active. 
	FormatTime, TimeStamp, R
	Gui, Destroy
	CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
	MouseGetPos, xpos, ypos 
	formattime, todaysdate, , MM/dd/yy 
	PasteClipboard()
	return
	}
if Option6 = 0
	{
	MsgBox, Function disabled. Press Control+CapsLock to update settings.
	return
	}
else
	return	
	
Custom6: ;^=::
if Option7 = 1
	{
	;MsgBox, %Option7% 7 is Active.
	HotstringCreator()
	return
	}
else if Option8 = 0
	{
	MsgBox, Function disabled. Press Control+CapsLock to update settings.
	return
	}
else
	return

Custom7: ;^1::
if Option8 = 1
	{
	;MsgBox, %Option8% 8 is Active.
	gosub, HyperlinkFromExcel
	return
	}
else if Option8 = 0
	{
	MsgBox, Function disabled. Press Control+CapsLock to update settings.
	return
	}
else
	return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;     Sets Username for Remarks      ;;
;;           CTRL + CapsLock          ;;
;;       Stores data in test.ini      ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^CapsLock::
Reopen:
FormatTime, TimeStamp, R
Gui, Destroy
;CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
;MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
IniRead, Username, C:\Users\%A_Username%\Desktop\test.ini, Username, Username
IniRead, ATPartner, C:\Users\%A_Username%\Desktop\test.ini, Username, ATPartner
IniRead, ATDate, C:\Users\%A_Username%\Desktop\test.ini, Username, ATDate
IniRead, Checkboxes, C:\Users\%A_Username%\Desktop\test.ini, Username, Checkboxes
StringSplit, Checkboxes, Checkboxes, `, ,
;Msgbox %Checkboxes0%, %Checkboxes1%%Checkboxes2%%Checkboxes3%%Checkboxes4%%Checkboxes5%%Checkboxes6%%Checkboxes7%%Checkboxes8%
Sleep 200
Gui, 1: New, +AlwaysOnTop +Owner, Update Information
Gui, 1: Add, Text, x50 y9 w200 h60 +Center, AT Partner Name is %ATPartner%. `nCurrent Username is %Username%. `nCurrent Remarks Date is %ATDate%.
Gui, 1: Add, Text, x50 y60 w200 h80 +Center,Enter your AT Partner's Email Address:
Gui, 1: Add, Edit, x50 y75 w200 h20 Limit +Center vATPartner, %ATPartner%
Gui, 1: Add, Text, x50 y98 w200 h80 +Center,Enter your Username for Remarks:
Gui, 1: Add, Edit, x50 y113 w200 h20 Limit +Center vUsername, %Username%
Gui, 1: Add, Text, x50 y136 w200 h80 +Center,Enter the Date for Remarks:
Gui, 1: Add, Edit, x50 y151 w200 h20 Limit +Center vATDate, %ATDate%
Gui, 1: Add, Button, x62 y182 w80 h30 Default gaOK , Update
Gui, 1: Add, Button, x162 y182 w80 h30 gCancel , Cancel
Gui, 1: Add, Button, x255 y182 w30 h30 gHotkeyR , >>
Gui, 1: Add, Button, x15 y182 w30 h30 gHotkeyL , <<
Gui, 1: Add, Text, x22 , Control + CapsLock - Set Username/Date/AT Partner
Gui, 1: Add, Checkbox, x10 Checked%Checkboxes2% vOption2, Quick Date and Initials
Gui, 1: Add, Checkbox, x10 Checked%Checkboxes3% vOption3, Cal Extender/Atty Finder/Record Opener [Ctrl + RClick] 
Gui, 1: Add, Checkbox, x30 Checked%Checkboxes1% vOption1, Auto-remarks on Calendar Extend?
Gui, 1: Add, Checkbox, x10 Checked%Checkboxes4% vOption4, System Switch Shortcut
Gui, 1: Add, Checkbox, x10 Checked%Checkboxes5% vOption5, System Switch Button in Internet Explorer (Optional)
Gui, 1: Add, Checkbox, x10 Checked%Checkboxes6% vOption6, Store/Paste Extra Clipboards
Gui, 1: Add, Checkbox, x10 Checked%Checkboxes7% vOption7, Create Shortcut Abbreviations
Gui, 1: Add, Checkbox, x10 Checked%Checkboxes8% vOption8, Open Hyperlink from Excel (Facing, Past Due, etc.)
Gui, 1: Color, ABCDEF
Gui, 1: +ToolWindow -Caption
Gui, 1: Show, h400 w300
WinGetPos , X, Y, Width, Height, ahk_class AutoHotkeyGUI
NewXR := X + 300
NewYR := Y + 0
NewXL := X - 253
NewYL := Y + 0
NewXRestore := NewXR + 1
NewYRestore := Y + 400
Gui, 2:New, +AlwaysOnTop +Owner, Remap
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,Quick Date and Initials [ Shift + CapsLock ]
Gui, 2:Font, s12
Gui, 2:Add, Edit, h25 w200 +Center vCustom1, %Custom1%
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,System Switch Shortcut [ Ctrl + `` ]
Gui, 2:Font, s12
Gui, 2:Add, Edit, h25 w200 +Center vCustom2, %Custom2%
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,System Switch Button [ Windows + Space ]
Gui, 2:Font, s12
Gui, 2:Add, Edit, h25 w200 +Center vCustom3, %Custom3%
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,Store Extra Clipboard [ Ctrl + 5 ]
Gui, 2:Font, s12
Gui, 2:Add, Edit, h25 w200 +Center vCustom4, %Custom4%
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,Paste Extra Clipboard [ Ctrl + 6 ]
Gui, 2:Font, s12
Gui, 2:Add, Edit, h25 w200 +Center vCustom5, %Custom5%
Gui, 2:Font, 
Gui, 2:Add, Text, ,Create Shortcut Abbreviations [ Ctrl + = ]
Gui, 2:Font, s12
Gui, 2:Add, Edit, h25 w200 +Center vCustom6, %Custom6%
Gui, 2:Font, 
Gui, 2:Add, Text, ,Open Hyperlink from Excel [ Ctrl + 1 ]
Gui, 2:Font, s12
Gui, 2:Add, Edit, h25 w200 +Center vCustom7, %Custom7%
Gui, 2:Font, 
Gui, 2:Add, Button, x29 y360 h25 w50 gHKeySubmit, Update
Gui, 2:Add, Button, x99 y360 h25 w100 gHKeyRestore, Restore Defaults
Gui, 2:Color, ABCDEF
Gui, 2:+ToolWindow -Caption 
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
Gui, 4:Color, FF0000
return

NeedHelp:
Run, "mailto:tyler.dickson@knobbe.com?Subject=Help%20on%20AutoHotKey"
return

HKeyRestore:
Gui, 4:Show, h60 x%NewXRestore% y%NewYRestore%
return

YesRestore:
Gui, 1:Hide
Gui, 2:Hide
Gui, 3:Hide
Gui, 4:Hide
SplashTextOn,100,, Restoring...
Sleep 1250
HotKR = 0
SplashTextOff
Gui, 2:Destroy
Gui, 2:New, +AlwaysOnTop +Owner, Remap
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,Quick Date and Initials [ Shift + CapsLock ]
Gui, 2:Font, s12
Gui, 2:Add, Edit, h25 w200 +Center vCustom1, +CapsLock
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,System Switch Shortcut [ Ctrl + `` ]
Gui, 2:Font, s12
Gui, 2:Add, Edit, h25 w200 +Center vCustom2, ^```
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,System Switch Button [ Windows + Space ]
Gui, 2:Font, s12
Gui, 2:Add, Edit, h25 w200 +Center vCustom3, #Space
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,Store Extra Clipboard [ Ctrl + 5 ]
Gui, 2:Font, s12
Gui, 2:Add, Edit, h25 w200 +Center vCustom4, ^5
Gui, 2:Font, 
Gui, 2:Add, Text, +Center ,Paste Extra Clipboard [ Ctrl + 6 ]
Gui, 2:Font, s12
Gui, 2:Add, Edit, h25 w200 +Center vCustom5, ^6
Gui, 2:Font, 
Gui, 2:Add, Text, ,Create Shortcut Abbreviations [ Ctrl + = ]
Gui, 2:Font, s12
Gui, 2:Add, Edit, h25 w200 +Center vCustom6, ^=
Gui, 2:Font, 
Gui, 2:Add, Text, ,Open Hyperlink from Excel [ Ctrl + 1 ]
Gui, 2:Font, s12
Gui, 2:Add, Edit, h25 w200 +Center vCustom7, ^1
Gui, 2:Font, 
Gui, 2:Add, Button, x29 y360 h25 w50 gHKeySubmit, Update
Gui, 2:Add, Button, x99 y360 h25 w100 gHKeyRestore, Restore Defaults
Gui, 2:Color, ABCDEF
Gui, 2:+ToolWindow -Caption
Gui, 2:Submit
IniWrite, %Custom1%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom1
IniWrite, %Custom2%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom2
IniWrite, %Custom3%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom3
IniWrite, %Custom4%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom4
IniWrite, %Custom5%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom5
IniWrite, %Custom6%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom6
IniWrite, %Custom7%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom7
Reload
Sleep 500
MsgBox, Unable to restart script. Please restart manually.
return

DontRestore:
Gui, 4:Hide
return

HKeySubmit:
Gui, 1:Hide
Gui, 2:Submit
Gui, 3:Hide
Gui, 4:Hide
MsgBox, We need to restart the script for your changes to take effect.`n`nRestarting now...
IniWrite, %Custom1%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom1
IniWrite, %Custom2%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom2
IniWrite, %Custom3%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom3
IniWrite, %Custom4%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom4
IniWrite, %Custom5%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom5
IniWrite, %Custom6%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom6
IniWrite, %Custom7%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom7
Reload
Sleep 500
MsgBox, Unable to restart script. Please restart manually.
return

HotkeyR:
	if HotKR = 0
		{
		Gui, 2:Show, w225 h400 x%NewXR% y%NewYR%
		HotKR = 1
		return
		}
	if HotKR = 1
		{
		Gui, 2:Hide
		Gui, 4:Hide
		HotKR = 0
		return
		}
return

HotkeyL:
	if HotKL = 0
		{
		Gui, 3:Show, w253 h400 x%NewXL% y%NewYL%
		HotKL = 1
		return
		}
	if HotKL = 1
		{
		Gui, 3:Hide
		HotKL = 0
		return
		}
return

aOK:
Gui, 1:Submit
Gui, 2:Submit
Gui, 3:Submit
HotKL = 0
HotKR = 0
;MsgBox, %Option1%%Option2%%Option3%%Option4%%Option5%%Option6%%Option7%%Option8%
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
Gui, New, +AlwaysOnTop, Information Updated
Gui, Add, Text,Center , This is how your remarks will now appear:`n`n "%ATDate% - Insert default comments here. -%Username%." `n`n Your partner is set as %ATPartner%.
Gui, Add, Button, w80 h30 Default Center gDone , OK
Gui, Show
IniWrite, %Username%, C:\Users\%A_Username%\Desktop\test.ini, Username, Username
IniWrite, %ATPartner%, C:\Users\%A_Username%\Desktop\test.ini, Username, ATPartner
IniWrite, %ATDate%, C:\Users\%A_Username%\Desktop\test.ini, Username, ATDate
IniWrite, %Checkboxes%, C:\Users\%A_Username%\Desktop\test.ini, Username, Checkboxes
IniWrite, %Custom1%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom1
IniWrite, %Custom2%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom2
IniWrite, %Custom3%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom3
IniWrite, %Custom4%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom4
IniWrite, %Custom5%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom5
IniWrite, %Custom6%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom6
IniWrite, %Custom7%, C:\Users\%A_Username%\Desktop\test.ini, Custom, Custom7
return

Done:
Gui, Destroy
Return

Cancel:
{
Gui, 1:Destroy
Gui, 2:Destroy
Gui, 3:Destroy
Gui, 4:Destroy
HotKL = 0
HotKR = 0
Return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                      ;;
;; Multiple Things in Internet Explorer ;;
;;           CTRL + RightClick          ;;
;;   DateExtend,AttyFind,SuggestRemark  ;;
;;                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;#IfWinActive ahk_class IEFrame

RemarksInIE:
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
OldClipboard = %clipboard%
SendInput ^c
Sleep 200
NewClipboard = %Clipboard%

if NewClipboard = ;
	MsgBox, blank clipboard
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
else if InStr(NewClipboard, 20)
	{
	;SplashTextOn, 300, ,Running DateExtend()
	;Sleep 1000
	;SplashTextOff
	DateExtend()
	return
	}
else if (%A_CaretX% > 0) and (%A_CaretY% > 0)
	{
	SplashTextOn, 300, ,Running DateExtend()
	Sleep 1000
	SplashTextOff
	DateExtend()
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
else if InStr(NewClipboard, ".")
	{
	;SplashTextOn, 300, ,Running SuggestRemarks()
	;Sleep 1000
	;SplashTextOff
	ClientCodeIE()
	return
	}
else
	MsgBox, Valid text not selected.`n`nValid options include:`n`na) block of Attorneys `nb) Action Type`nc) a date in Docketing
return

ClientCodeIE()
{
CoordMode, Pixel, Relative       ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
SendInput ^c
Gui, New
Gui, Add, Button, , %Clipboard%
Gui, Add, Button, gOpenTMLive, TM Live
Gui, Add, Button, gOpenTMAT, TM AT
Gui, Add, Button, gOpenPATLive, Patent Live
Gui, Add, Button, gOpenPATAT, Patent AT
Gui, Add, Button, gOpenInventionLive, Invention Live
Gui, Add, Button, gOpenInventionAT, Invention AT
Gui, Show
return

OpenTMLive:
Gui, Submit
Run "http://oc-docketing/CPi/tmkschTrademark.aspx"
SplashTextOff
Loop
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, *TransWhite C:\Users\%A_Username%\Desktop\ImageSearch\Client Code.PNG
	If ErrorLevel = 1
			{
			}
	If ErrorLevel = 0
		break
}
;msgbox, Client Code found at: %CoordsX%, %CoordsY%
CoordMode, Mouse, Relative      ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
PushX := CoordsX + 100
PushY := CoordsY + 8
MouseMove, %PushX%, %PushY%, 0 ; [, Speed, R]
SendInput {Click}
Sleep 200
SendInput %Clipboard%
Sleep 200
SendInput {Enter}
return

OpenTMAT:
Gui, Submit
Run "http://oc-docketing/CPiAgent/tmkschTrademarkAgent.aspx"
SplashTextOff
Loop
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, *TransWhite C:\Users\%A_Username%\Desktop\ImageSearch\Client Code.PNG
	If ErrorLevel = 1
			{
			}
	If ErrorLevel = 0
		break
}
;msgbox, Client Code found at: %CoordsX%, %CoordsY%
CoordMode, Mouse, Relative      ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
PushX := CoordsX + 100
PushY := CoordsY + 8
MouseMove, %PushX%, %PushY%, 0 ; [, Speed, R]
SendInput {Click}
Sleep 200
SendInput %Clipboard%
Sleep 200
SendInput {Enter}
return

OpenPATLive:
Gui, Submit
Run "http://oc-docketing/CPi/patschCountryApplication.aspx"
SplashTextOff
Loop
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, *TransWhite C:\Users\%A_Username%\Desktop\ImageSearch\Client Code.PNG
	If ErrorLevel = 1
			{
			}
	If ErrorLevel = 0
		break
}
;msgbox, Client Code found at: %CoordsX%, %CoordsY%
CoordMode, Mouse, Relative      ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
PushX := CoordsX + 100
PushY := CoordsY + 8
MouseMove, %PushX%, %PushY%, 0 ; [, Speed, R]
SendInput {Click}
Sleep 200
SendInput %Clipboard%
Sleep 200
SendInput {Enter}
return

OpenPATAT:
Gui, Submit
Run "http://oc-docketing/CPiAgent/patschCountryApplicationAgent.aspx"
SplashTextOff
Loop
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, *TransWhite C:\Users\%A_Username%\Desktop\ImageSearch\Client Code.PNG
	If ErrorLevel = 1
			{
			}
	If ErrorLevel = 0
		break
}
;msgbox, Client Code found at: %CoordsX%, %CoordsY%
CoordMode, Mouse, Relative      ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
PushX := CoordsX + 100
PushY := CoordsY + 8
MouseMove, %PushX%, %PushY%, 0 ; [, Speed, R]
SendInput {Click}
Sleep 200
SendInput %Clipboard%
Sleep 200
SendInput {Enter}
return

OpenInventionLive:
Gui, Submit
Run "http://oc-docketing/CPi/patschInvention.aspx"
SplashTextOff
Loop
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, *TransWhite C:\Users\%A_Username%\Desktop\ImageSearch\Client Code.PNG
	If ErrorLevel = 1
			{
			}
	If ErrorLevel = 0
		break
}
;msgbox, Client Code found at: %CoordsX%, %CoordsY%
CoordMode, Mouse, Relative      ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
PushX := CoordsX + 100
PushY := CoordsY + 8
MouseMove, %PushX%, %PushY%, 0 ; [, Speed, R]
SendInput {Click}
Sleep 200
SendInput %Clipboard%
Sleep 200
SendInput {Enter}
return

OpenInventionAT:
Gui, Submit
Run "http://oc-docketing/CPiAgent/patschInventionAgent.aspx"
SplashTextOff
Loop
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, *TransWhite C:\Users\%A_Username%\Desktop\ImageSearch\Client Code.PNG
	If ErrorLevel = 1
			{
			}
	If ErrorLevel = 0
		break
}
;msgbox, Client Code found at: %CoordsX%, %CoordsY%
CoordMode, Mouse, Relative      ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
PushX := CoordsX + 100
PushY := CoordsY + 8
MouseMove, %PushX%, %PushY%, 0 ; [, Speed, R]
SendInput {Click}
Sleep 200
SendInput %Clipboard%
Sleep 200
SendInput {Enter}
return

}

DateExtend()
{
IniRead, Checkboxes, C:\Users\%A_Username%\Desktop\test.ini, Username, Checkboxes
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
Gui, Add, Button, y2 w49 gAdd1, +1M
Gui, Add, Button, y2 w49 gAdd3, +3M
Gui, Add, Button, y2 w49 gAdd6, +6M
Gui, Add, Button, y2 w49 gAdd12, +1Y
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
Gui, Destroy
return

Add1:
Gui, Submit
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
IniWrite, %Checkboxes%, C:\Users\%A_Username%\Desktop\test.ini, Username, Checkboxes
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
	Gui, Destroy
	return
	}
else if Option1 = 1
	{
	IniRead, Username, C:\Users\%A_Username%\Desktop\test.ini, Username, Username
	IniRead, ATDate, C:\Users\%A_Username%\Desktop\test.ini, Username, ATDate
	StringLen, NameLen, Username
	NameLen3 := NameLen + 3
	SendInput %MyMonthCal%
	SendInput {TAB 5} ; I think it is 5 TABS. Could be 6.
	;SendInput {ENTER}
	SendInput {PGUP} {ENTER} {PGUP} ; This might need to be PAGE UP instead of HOME.
	SendInput %ATDate%{Space}-{Space}Extend 1M per .{Space}-%Username%
	SendInput {Left %NameLen3%} 
	Clipboard = %OldClipboard%
	return
	}
else
	return
}

Add3:
Gui, Submit
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
IniWrite, %Checkboxes%, C:\Users\%A_Username%\Desktop\test.ini, Username, Checkboxes
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
	Gui, Destroy
	return
	}
else if Option1 = 1
	{
	IniRead, Username, C:\Users\%A_Username%\Desktop\test.ini, Username, Username
	IniRead, ATDate, C:\Users\%A_Username%\Desktop\test.ini, Username, ATDate
	StringLen, NameLen, Username
	NameLen3 := NameLen + 3
	SendInput %MyMonthCal%
	SendInput {TAB 5} ; I think it is 5 TABS. Could be 6.
	;SendInput {ENTER}
	SendInput {PGUP} {ENTER} {PGUP} ; This might need to be PAGE UP instead of HOME.
	SendInput %ATDate%{Space}-{Space}Extend 3M per .{Space}-%Username%
	SendInput {Left %NameLen3%} 
	Clipboard = %OldClipboard%
	return
	}
else
	return

Add6:
Gui, Submit
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
IniWrite, %Checkboxes%, C:\Users\%A_Username%\Desktop\test.ini, Username, Checkboxes
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
	Gui, Destroy
	return
	}
else if Option1 = 1
	{
	IniRead, Username, C:\Users\%A_Username%\Desktop\test.ini, Username, Username
	IniRead, ATDate, C:\Users\%A_Username%\Desktop\test.ini, Username, ATDate
	StringLen, NameLen, Username
	NameLen3 := NameLen + 3
	SendInput %MyMonthCal%
	SendInput {TAB 5} ; I think it is 5 TABS. Could be 6.
	;SendInput {ENTER}
	SendInput {PGUP} {ENTER} {PGUP} ; This might need to be PAGE UP instead of HOME.
	SendInput %ATDate%{Space}-{Space}Extend 6M per .{Space}-%Username%
	SendInput {Left %NameLen3%} 
	Clipboard = %OldClipboard%
	return
	}
else
	return

Add12:
Gui, Submit
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
IniWrite, %Checkboxes%, C:\Users\%A_Username%\Desktop\test.ini, Username, Checkboxes
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
	Gui, Destroy
	return
	}
else if Option1 = 1
	{
	IniRead, Username, C:\Users\%A_Username%\Desktop\test.ini, Username, Username
	IniRead, ATDate, C:\Users\%A_Username%\Desktop\test.ini, Username, ATDate
	StringLen, NameLen, Username
	NameLen3 := NameLen + 3
	SendInput %MyMonthCal%
	SendInput {TAB 5} ; I think it is 5 TABS. Could be 6.
	;SendInput {ENTER}
	SendInput {PGUP} {ENTER} {PGUP} ; This might need to be PAGE UP instead of HOME.
	SendInput %ATDate%{Space}-{Space}Extend 1YR per .{Space}-%Username%
	SendInput {Left %NameLen3%} 
	Clipboard = %OldClipboard%
	return
	}
else
	return

Add1W:
Gui, Submit
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
IniWrite, %Checkboxes%, C:\Users\%A_Username%\Desktop\test.ini, Username, Checkboxes
MyMonthCal += 7, days
FormatTime, MyMonthCal, %MyMonthCal%, dd-MMM-yyyy
if Option1 = 0
	{
	SendInput %MyMonthCal%
	Clipboard = %OldClipboard%
	Gui, Destroy
	return
	}
else if Option1 = 1
	{
	IniRead, Username, C:\Users\%A_Username%\Desktop\test.ini, Username, Username
	IniRead, ATDate, C:\Users\%A_Username%\Desktop\test.ini, Username, ATDate
	StringLen, NameLen, Username
	NameLen3 := NameLen + 3
	SendInput %MyMonthCal%
	SendInput {TAB 5} ; I think it is 5 TABS. Could be 6.
	;SendInput {ENTER}
	SendInput {PGUP} {ENTER} {PGUP} ; This might need to be PAGE UP instead of HOME.
	SendInput %ATDate%{Space}-{Space}Extend 1W per .{Space}-%Username%
	SendInput {Left %NameLen3%} 
	Clipboard = %OldClipboard%
	return
	}
else
	return

Add2W:
Gui, Submit
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
IniWrite, %Checkboxes%, C:\Users\%A_Username%\Desktop\test.ini, Username, Checkboxes
MyMonthCal += 14, days
FormatTime, MyMonthCal, %MyMonthCal%, dd-MMM-yyyy
if Option1 = 0
	{
	SendInput %MyMonthCal%
	Clipboard = %OldClipboard%
	Gui, Destroy
	return
	}
else if Option1 = 1
	{
	IniRead, Username, C:\Users\%A_Username%\Desktop\test.ini, Username, Username
	IniRead, ATDate, C:\Users\%A_Username%\Desktop\test.ini, Username, ATDate
	StringLen, NameLen, Username
	NameLen3 := NameLen + 3
	SendInput %MyMonthCal%
	SendInput {TAB 5} ; I think it is 5 TABS. Could be 6.
	;SendInput {ENTER}
	SendInput {PGUP} {ENTER} {PGUP} ; This might need to be PAGE UP instead of HOME.
	SendInput %ATDate%{Space}-{Space}Extend 2W per .{Space}-%Username%
	SendInput {Left %NameLen3%} 
	Clipboard = %OldClipboard%
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
;;                                    ;;
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
WinGetPos , X, Y, Width, Height, ahk_class IEFrame
NewX := x + 10
NewY := y + 2
Gui, New, +AlwaysOnTop +Owner, Test
Gui, Add, Button, x0 y5 w100 h20 g2Test, Switch System
;Gui, Add, DropDownList,x110 y5 w100 h20 R8 Sort gQCType vQC,|PCT|NPhase|Direct|Design|Trademark|Madrid|Divisional|
;Gui, Add, DropDownList,x220 y5 w100 h20 R6 gQCType vQC2,
Gui, Add, Button, x105 y5 h20 g2Cancel, Close
Gui, Show, ,Test
Gui, +ToolWindow -Caption                           ; Removes the Border and Task bar icon
Gui, Color, 000111                                  ; can be any colour but it's good to use a color that is NOT present in ur GUI
;Gui, Show, X%X% Y%Y% h28 w225, Test
Gui, Show, X%NewX% Y%NewY% h25 w500, Test
WinSet, Transcolor, 000111, Test
return
}
	
2Test:
	{
	WinActivate, ahk_class IEFrame
	SwitchSystem()
	;Send ^``
	PersistentBar()
	WinActivate, ahk_class IEFrame
	Gui, Destroy
	return
	}

2Cancel:
	{
;	Gui, Submit
	Gui, Destroy
	Sleep 100
	Gui, 2Gui:Destroy
	MsgBox, , You closed the System Switch button! ,You removed the button!`n`nNow you can't easily switch systems!`n`nPress %Custom3% to reopen it!
	Return
	}
	
QCType:
global QC
;global QC2
WinGetPos , X, Y, Width, Height, ahk_class IEFrame
NewX := x + 10
NewY := y + 2
NewNewY := NewY + 25
Gui, Submit, NoHide

IniRead, QCAction, C:\Users\%A_Username%\Desktop\test.ini, QC, %QC%
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
		
	

	

return
	
		
	
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
;;IniRead, Username, C:\Users\%A_Username%\Desktop\test.ini, Username, Username
;SplashTextOn,350 ,310, Quick Shortcuts                                         (Press Enter/ESC to close.), Ctrl+`` = Open Docketing in Opposite System `n Ctrl+1 = Open Hyperlink from Excel `n`n Ctrl+5 = Store Extra Clipboard Items `n Ctrl+6 = Paste Stored Clipboard Items `n`n Ctrl+3 = Set Username for Remarks `n Shift+CapsLock = Paste current date and initials. `n`n Ctrl+= = Create Shortcut Abbreviations `n`n Highlight text, then Ctrl+RightClick:`n     Suggest Action Remarks`n     Extend Docketing Date`n     Generate Attorney Emails
;WinMove, Quick Shortcuts , , 0, 0 ; Move the splash window to the top left corner.
;Msgbox
;Sleep 4000
;SplashTextOff
;Return
;}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
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
Gui, Destroy
FormatTime, TimeStamp, R
IniRead, Username, C:\Users\%A_Username%\Desktop\test.ini, Username, Username 
CoordMode, Mouse, Screen       ;Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
OldClipboard = %Clipboard%
IniRead, Clip1, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip1
IniRead, Clip2, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip2
IniRead, Clip3, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip3
IniRead, Clip4, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip4
IniRead, Clip5, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip5
SendInput ^c
Sleep 100
NewClipboard = %Clipboard%
StringReplace, NewClipboard, NewClipboard, `r`n, %A_Space%, All    ; Replace any hard returns with a space. 
StringReplace, NewClipboard, NewClipboard, `r, %A_Space%, All      ; Replace any hard returns with a space. 
StringReplace, NewClipboard, NewClipboard, `n, %A_Space%, All      ; Replace any hard returns with a space. 
StringReplace, NewClipboard, NewClipboard, %A_Space%%A_Space%, %A_Space%, All      ; Replace any hard returns with a space. 
Gui, New, +AlwaysOnTop +Owner, Multiple Clipboard Slots
Gui, Font, s12 bold, Verdana
Gui, Add, Button, w400 h30, Where would you like to store the text?
Gui, Font, s10 w500, Verdana
Gui, Add, Button, gBut1, %Clip1%
Gui, Add, Button, gBut2, %Clip2%
Gui, Add, Button, gBut3, %Clip3%
Gui, Add, Button, gBut4, %Clip4%
Gui, Add, Button, gBut5, %Clip5%
Gui, Font, s12 bold, Verdana
Gui, Add, Button, gBut6, Cancel
 
if (xpos > 2150) & (ypos > 800)     
     {
     newypos := (ypos - 200)
     newxpos := (xpos - 400)
     Gui, Show, x%newxpos% y%newypos% h300 w911, New GUI Window
	 Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }
else if (ypos > 800)     
     {
     newypos := (ypos - 200)
     Gui, Show, x%xpos% y%newypos% h300 w911, New GUI Window
	 Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return
     }
else if (xpos > 2150)      
     {
     newxpos := (xpos - 400)
     Gui, Show, x%newxpos% y%ypos% 3200 w911, New GUI Window
	 Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }
else 
     {
     Gui, Show, x%xpos% y%ypos% h300 w911, New GUI Window
	 Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return
	 }
Return

But1:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip1
Sleep 200
IniRead, Clip1, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip1
Clipboard = %OldClipboard%
Return
}

But2:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip2
Sleep 200
IniRead, Clip2, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip2
Clipboard = %OldClipboard%
Return
}

But3:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip3
Sleep 200
IniRead, Clip3, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip3
Clipboard = %OldClipboard%
Return
}

But4:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip4
Sleep 200
IniRead, Clip4, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip4
Clipboard = %OldClipboard%
Return
}

But5:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip5
Sleep 200
IniRead, Clip5, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip5
Clipboard = %OldClipboard%
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
;;                                    ;;
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
Gui, Destroy
FormatTime, TimeStamp, R
IniRead, Username, C:\Users\%A_Username%\Desktop\test.ini, Username, key
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
IniRead, Clip1, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip1
IniRead, Clip2, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip2
IniRead, Clip3, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip3
IniRead, Clip4, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip4
IniRead, Clip5, C:\Users\%A_Username%\Desktop\test.ini, Clips, Clip5
Gui, New, +AlwaysOnTop +Owner, Multiple Clipboard Slots
Gui, Font, s12 bold, Verdana
Gui, Add, Button, w300 h30, What would you like to paste?
Gui, Font, s10 w500, Verdana
Gui, Add, Button, gPaste1, %Clip1%
Gui, Add, Button, gPaste2, %Clip2%
Gui, Add, Button, gPaste3, %Clip3%
Gui, Add, Button, gPaste4, %Clip4%
Gui, Add, Button, gPaste5, %Clip5%
Gui, Font, s12 bold, Verdana
Gui, Add, Button, gPaste6, Cancel
if (xpos > 2150) & (ypos > 800)
     {
     newypos := (ypos - 200)
     newxpos := (xpos - 400)
     Gui, Show, x%newxpos% y%newypos%
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
     Gui, Show, x%newxpos% y%ypos%
     Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }
else
     {
     Gui, Show, x%xpos% y%ypos%
	 Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }

Paste1:
{
Gui, Submit
;IniRead, Clip1, C:\Users\%A_Username%\Desktop\test.ini, Clip1, key
SendInput %Clip1%
Return
}

Paste2:
{
Gui, Submit
;IniRead, Clip2, C:\Users\%A_Username%\Desktop\test.ini, Clip2, key
SendInput %Clip2%
Return
}

Paste3:
{
Gui, Submit
;IniRead, Clip3, C:\Users\%A_Username%\Desktop\test.ini, Clip3, key
SendInput %Clip3%
Return
}

Paste4:
{
Gui, Submit
;IniRead, Clip4, C:\Users\%A_Username%\Desktop\test.ini, Clip4, key
SendInput %Clip4%
Return
}

Paste5:
{
Gui, Submit
;IniRead, Clip5, C:\Users\%A_Username%\Desktop\test.ini, Clip5, key
SendInput %Clip5%
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
;;                                    ;;
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
IniRead, Username, C:\Users\%A_Username%\Desktop\test.ini, Username, Username
IniRead, ATDate, C:\Users\%A_Username%\Desktop\test.ini, Username, ATDate
StringLen, NameLen, Username
NameLen2 := NameLen + 2
SendInput %ATDate%            ; Pastes current date.
SendInput {Space}-{Space}         ; Adds space after date.
SendInput {End}{Space}-%Username% ; Jumps to end of line and pastes Username.
SendInput {Left %NameLen2%}              ; Positions cursor in middle of text by taking length of Username and adding 2.
Return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;     Open Hyperlink from Excel      ;;
;;             CTRL + 1               ;;
;; For Past Due/IntFees/Facing Report ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;^1::
HyperlinkFromExcel:
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
IniRead, Username, C:\Users\%A_Username%\Desktop\test.ini, Username, key
OldClipboard := Clipboard                         ; This saves clipboard content for later.
Clipboard = ;                                     ; This empties the clipboard.
URLString = ;                                     ; Sets MyString to blank.
DocketingString = oc-docketing ;
SendInput ^c
Sleep 200
URLString := clipboard                            ; Fetch URL into variable
if InStr(URLString, DocketingString)
     {
     SplashTextOn, 300,,Opening in docketing now.,
     Run %URLString%
     Sleep 1000
     SplashTextOff
     Clipboard = %oldClipboard%
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
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
IniRead, Username, C:\Users\%A_Username%\Desktop\test.ini, Username, key
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
Sleep 200        
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
Return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;         Suggested Remarks          ;;
;;             CTRL + 9               ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^9::
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
SuggestRemarks()
return

SuggestRemarks()
{
FormatTime, TimeStamp, R
formattime, TodaysDate, , MM/dd/yy  
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos
IniRead, Username, C:\Users\%A_Username%\Desktop\test.ini, Username, Username
IniRead, ATDate, C:\Users\%A_Username%\Desktop\test.ini, Username, ATDate
Array = ;
IntPat = INT-PAT
IntTM = INT-TM
PreviousClip := Clipboard
SendInput ^c
Sleep 200
CopiedAction := Clipboard                                                    ; This saves clipboard content for later.
Clipboard = ;
Sleep 200
InStr(CopiedAction, IntPat) OR InStr(CopiedAction, IntTM)
IniRead, CopiedAction, C:\Users\%A_Username%\Desktop\test.ini, Actions, %CopiedAction%
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
SendInput % ATDate " - " Array[1] " -" Username
Clipboard = %PreviousClip%
Return
}

Array2:
{
Gui, Submit
SendInput % ATDate " - " Array[2] " -" Username
Clipboard = %PreviousClip%
Return
}

Array3:
{
Gui, Submit
SendInput % ATDate " - " Array[3] " -" Username
Clipboard = %PreviousClip%
Return
}

Array4:
{
Gui, Submit
SendInput % ATDate " - " Array[4] " -" Username
Clipboard = %PreviousClip%
Return
}

Array5:
{
Gui, Submit
SendInput % ATDate " - " Array[5] " -" Username
Clipboard = %PreviousClip%
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
;;                                    ;;
;;         Attorney Email Finder      ;;
;;              Ctrl + J              ;;
;;        Stores data in test.ini     ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^j::   
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
SendInput ^c
Sleep 200
TestString = %Clipboard%
AttyEmailFinder()
return

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


IniRead, AttyTest1, C:\Users\%A_Username%\Desktop\test.ini,  Attorneys, %ThreeString1%      ; Compares attorney to .ini file.
IniRead, AttyTest2, C:\Users\%A_Username%\Desktop\test.ini,  Attorneys, %ThreeString2%
IniRead, AttyTest3, C:\Users\%A_Username%\Desktop\test.ini,  Attorneys, %ThreeString3%
IniRead, AttyTest4, C:\Users\%A_Username%\Desktop\test.ini,  Attorneys, %ThreeString4%
IniRead, AttyTest5, C:\Users\%A_Username%\Desktop\test.ini,  Attorneys, %ThreeString5%
IniRead, AttyTest6, C:\Users\%A_Username%\Desktop\test.ini,  Attorneys, %ThreeString6%
IniRead, AttyTest7, C:\Users\%A_Username%\Desktop\test.ini,  Attorneys, %ThreeString7%
IniRead, AttyTest8, C:\Users\%A_Username%\Desktop\test.ini,  Attorneys, %ThreeString8%
IniRead, AttyTest9, C:\Users\%A_Username%\Desktop\test.ini,  Attorneys, %ThreeString9%
IniRead, AttyTest10, C:\Users\%A_Username%\Desktop\test.ini, Attorneys, %ThreeString10%
IniRead, ATPartner, C:\Users\%A_Username%\Desktop\test.ini, Username, ATPartner

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
return
     }              
if ThreeString0 = 2
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %ATPartner%
Sleep 2250
SplashTextOff
return
     }	
if ThreeString0 = 3
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %ATPartner%
Sleep 2250
SplashTextOff
return
     }	
if ThreeString0 = 4
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %ATPartner%
Sleep 2250
SplashTextOff
return
     }	
if ThreeString0 = 5
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %ATPartner%
Sleep 2250
SplashTextOff
return
     }
if ThreeString0 = 6
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %ATPartner%
Sleep 2250
SplashTextOff
return
     }
if ThreeString0 = 7
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %ATPartner%
Sleep 2250
SplashTextOff
return
     }
if ThreeString0 = 8
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %AttyTest8%, %ATPartner%
Sleep 2250
SplashTextOff
return
     }
if ThreeString0 = 9
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %AttyTest8%, %AttyTest9%, %ATPartner%
Sleep 2250
SplashTextOff
return
     }
if ThreeString0 = 10
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %AttyTest8%, %AttyTest9%, %AttyTest10%, %ATPartner%
Sleep 2250
SplashTextOff
return
     }
else 
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed.
Clipboard = %AttyTest1%, %ATPartner%
Sleep 2250
SplashTextOff
return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;    Hotstring for Auto-Replacing    ;;
;;              Passive               ;;
;;     Stores data in Scripts.ahk     ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;^=::
;HotstringCreator()
;return

HotstringCreator()
{
#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy  
IniRead, Username, C:\Users\%A_Username%\Desktop\test.ini, Username, key
Sleep 200
Gui, New, +AlwaysOnTop, Create Shortcut
Gui, Add, Text, w180 h50 +Center, Create a shortcut for longer text. `n (e.g. btw => by the way) `n`n Shortened version...
Gui, Add, Edit, w180 h20 Limit +Center vHotstring,
Gui, Add, Text, w180 h14 +Center,...will turn into...
Gui, Add, Edit, w180 h20 Limit +Center vExtended,
Gui, Add, Button, x22 y140 w50 h30 Default gHotupdate , Update
Gui, Add, Button, x130 y140 w50 h30 gHotcancel , Cancel
Gui, Add, Button, x22 y190 w160 h30 +Center gHotFix , Need to delete a mistake?
if (xpos > 2150) & (ypos > 500)     
     {
     newypos := (ypos - 155)
     newxpos := (xpos - 230)
     Gui, Show, x%newxpos% y%newypos% h230 w200
     return 
     }
else if (ypos > 500)     
     {
     newypos := (ypos - 155)
     ;Msgbox, %newypos%
     Gui, Show, x%xpos% y%newypos% h230 w200
     return     
     }
else if (xpos > 2150)      
     {
     newxpos := (xpos - 230)
     ;Msgbox, %newxpos%
     Gui, Show, x%newxpos% y%ypos% h230 w200
     return     
     }
else
     Gui, Show, x%xpos% y%ypos% h230 w200
return

Hotupdate:
{
Gui, Submit
MsgBox, New shortcut added!`n`nNote: This will remove your selections from the Update Information Tab.`n`nPress Control+CapsLock to re-enable your preferred options.
FileAppend, ::%Hotstring%::%Extended%`n, C:\Users\%A_Username%\Desktop\Scripts.ahk
Reload
Sleep 500 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, The script could not be reloaded. 
return
}

Hotcancel:
{
Gui, Destroy
MsgBox, Shortcut NOT saved.
Return
}

Hotfix:
{
Gui, Destroy
MsgBox, OK, let's open the file so you can fix any mistakes.
Run, C:\Windows\Notepad.exe "C:\Users\%A_Username%\Desktop\Scripts.ahk"
Sleep 200
SendInput ^{End} ; Takes the user to the bottom of the document.
Return
}
Return
}

;Format = ;
;MsgBox, %Arrayed0% %AttysAdded% %AttysNotAdded%

;Gui, New,  	
;Gui, Add, Text, x10 y40 w190 h20 +Center, Directory to Search:  
;Gui, Add, Button, x1 y55 w20 h20 +Center gDirectSelect, ...
;Gui, Add, Edit, x21 y55 w180 h20 +Center vSmash,  
;Gui, Add, Text, x10 y80 w200 h20 +Center, File Format to Include:                                            
;Gui, Add, Edit, x21 y95 w180 h20 +Center vFormat, 
;Gui, Add, Button, Default gUpdateSearch, Submit 
;Gui, Show
;return

;DirectSelect:
;FileSelectFolder, Smash, *C:\Users\%A_Username%\Desktop\ROMS
;SendInput {Tab}
;SendInput %Smash%
;return

;UpdateSearch:
;Gui, Submit















































































;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                              ;;
;;                           SHORTCUTS                          ;;
;;                                                              ;;
;;            If you're here to fix your shortcuts,             ;;
;;       delete the line(s) with the erroneous shortcuts.       ;;
;;   You can also add new ones if you follow the format below.  ;;
;;                                                              ;;  
;;            EXAMPLE - ::test::this is a test.                 ;;
;;                                                              ;;
;;     Make sure you don't modify anything above this box!      ;;
;;                                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

::btw::by the way

::#ndd::No new dates docketed.

::#pp::Previously processed.
