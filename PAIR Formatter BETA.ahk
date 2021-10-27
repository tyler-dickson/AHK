#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, pifmgr.dll, 20
Enabled := ComObjError(false)

ComputerName = %A_Username%

$Escape::
KeyWait, Escape
KeyWait, Escape, D T0.15
if ErrorLevel = 1
	{
	SendInput Escape
	return
	}
else if ErrorLevel = 0
	{
	MsgBox, , Clerk Tools Quick Reference, Control+Windows+Alt+Space = iManage Column Remover`nControl+Windows+Alt+Space = PAIR Email Formatter`n     ----------`nWindows+LeftClick = Quick Patent Application Opener`nWindows+Alt+LeftClick = Quick Patent Number Opener`n     ----------`nWindows+RightClick = Quick Trademark Application Opener`nWindows+Alt+RightClick = Quick Trademark Registration Opener`n     ----------`nF1 = Toggle through Junior Agent Action Shortcuts`nControl+PageUp = Set Date for Junior Agent Action Shortcuts
	}
return


^#!Space::
Clipboard = 
Sleep 200
SendInput ^c
ClipWait, 1
IfinString, Clipboard, Description
	gosub iManageColumnRemover
else
	gosub PairFormatter
return

iManageColumnRemover:
FileDelete, C:\Users\%Computername%\PAIRTemp.txt
FileDelete, C:\Users\%Computername%\PAIRTempCleaned.txt
FileAppend, %Clipboard%, C:\Users\%Computername%\PAIRTemp.txt
Sleep 500
FileRead, SavedContent, C:\Users\%Computername%\PAIRTemp.txt
StringSplit, SavedContent, SavedContent, `n

MsgBox, 4, Include Document #?, Do you want to include the Document #?

Loop %SavedContent0%
{
StringSplit, Columns, SavedContent%A_Index%, `t
	ifMsgBox Yes
		CleanedColumns = % Columns1 "`t"  Columns3 "`t" Columns6 "`t" Columns7    ; "`t" Columns6 . "." . Columns7
	ifMsgBox No
		CleanedColumns = % Columns1 "`t"  Columns6 "`t" Columns7                   ; "`t" Columns6 . "." . Columns7
ifNotInString, Columns9, Edit Time
	FileAppend, %CleanedColumns%`n, C:\Users\%Computername%\PAIRTempCleaned.txt
}
FileRead, Clipboard, C:\Users\%Computername%\PAIRTempCleaned.txt
TrayTip, Columns removed!, Formatted information added to Clipboard.`nPaste into Excel template to proceed.
Sleep 3000
TrayTip
return

PairFormatter:
InputBox, CustomerNumber, Private PAIR Customer Number, Enter the Customer Number from Private PAIR., , 300, 137
FileDelete, C:\Users\%Computername%\PAIRTemp.txt
FileDelete, C:\Users\%Computername%\PAIRTempCleaned.txt
FileAppend, %Clipboard%, C:\Users\%Computername%\PAIRTemp.txt
Sleep 500
FileRead, SavedContent, C:\Users\%Computername%\PAIRTemp.txt
StringSplit, SavedContent, SavedContent, `n
Sleep 200
;LoopAmount := SavedContent0 - 1

Loop %SavedContent0%        ;%LoopAmount%
{
PreviousLoop := (A_Index - 1)
StringMid, AppNo%A_Index%,      SavedContent%A_Index%,  1, 8 
StringMid, DocType%A_Index%,    SavedContent%A_Index%, 16, 16 
StringMid, DocDate%A_Index%,    SavedContent%A_Index%, 32, 10
StringMid, ClientCode%A_Index%, SavedContent%A_Index%, 50, 50

if AppNo%A_Index% = %A_Space%%A_Space%%A_Space%%A_Space%%A_Space%%A_Space%%A_Space%%A_Space%
	AppNo%A_Index% = % AppNo%PreviousLoop%
else 
	AppNo%A_Index% = % AppNo%A_Index%
	
CleanedContent = % CustomerNumber "`t" AppNo%A_Index% "`t" DocType%A_Index% "`t" DocDate%A_Index% "`t" ClientCode%A_Index% "`n" 
FileAppend, %CleanedContent%, C:\Users\%Computername%\PAIRTempCleaned.txt
}
FileRead, Clipboard, C:\Users\%Computername%\PAIRTempCleaned.txt
TrayTip, Formatting updated!, Formatted information added to Clipboard.`nPaste into Excel template to proceed.
Sleep 3000
TrayTip
return

#RButton::
SendInput ^c
ClipWait, .2
Sleep 50
TrayTip, Quick Record Opener, Opening Trademark Application in Docketing.
goto TMApp
return

#!RButton::
SendInput ^c
ClipWait, .2
Sleep 50
TrayTip, Quick Record Opener, Opening Trademark Registration in Docketing.
goto TMReg
return

#!LButton::
SendInput ^c
ClipWait, .2
Sleep 50
TrayTip, Quick Record Opener, Opening Patent Number in Docketing.
goto PatPatent
return

#LButton::
SendInput ^c
ClipWait, .2
Sleep 50
IfInString Clipboard, PCT
	{
	TrayTip, Quick Record Opener, Opening PCT Application in Docketing.
	goto PatApp
	}
else
	{
	StringReplace, CleanedUp, Clipboard, `, ,
	StringReplace, CleanedUp, CleanedUp, / ,
	StringSplit, CleanedUp, CleanedUp
	Clipboard := % CleanedUp1 CleanedUp2 "/" CleanedUp3 CleanedUp4  CleanedUp5  CleanedUp6  CleanedUp7 CleanedUp8
	TrayTip, Quick Record Opener, Opening Patent Application in Docketing.
	goto PatApp
	}
return


PatApp:
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
Sleep 500
ie.Document.All.schstrAppNumber_TextBox.Value := Clipboard
CheckValue := ie.Document.All.schstrAppNumber_TextBox.Value
	if (CheckValue = Clipboard)
		ie.Document.All.btnStartSearch.Click()
	else
		{
		ie.Document.All.schstrAppNumber_TextBox.Value := Clipboard
		Sleep 500
		ie.Document.All.btnStartSearch.Click()
		}		
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
TrayTip
return


PatPatent:
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
Sleep 500
ie.Document.All.schstrPatNumber_TextBox.Value := Clipboard
CheckValue := ie.Document.All.schstrPatNumber_TextBox.Value
	if (CheckValue = Clipboard)
		ie.Document.All.btnStartSearch.Click()
	else
		{
		ie.Document.All.schstrPatNumber_TextBox.Value := Clipboard
		Sleep 500
		ie.Document.All.btnStartSearch.Click()
		}		
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
TrayTip
return

TMApp:
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
Sleep 500
ie.Document.All.schstrAppNumber_TextBox.Value := Clipboard
CheckValue := ie.Document.All.schstrAppNumber_TextBox.Value
	if (CheckValue = Clipboard)
		ie.Document.All.btnStartSearch.Click()
	else
		{
		ie.Document.All.schstrAppNumber_TextBox.Value := Clipboard
		Sleep 500
		ie.Document.All.btnStartSearch.Click()
		}		
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
TrayTip
return

TMReg:
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
Sleep 500
ie.Document.All.schstrRegNumber_TextBox.Value := Clipboard
CheckValue := ie.Document.All.schstrRegNumber_TextBox.Value.Value
	if (CheckValue = Clipboard)
		ie.Document.All.btnStartSearch.Click()
	else
		{
		ie.Document.All.schstrRegNumber_TextBox.Value := Clipboard	
		Sleep 500
		ie.Document.All.btnStartSearch.Click()
		}		
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
TrayTip
return


^PgUp::
Gui, New, ,Base Date for F1 Shortcut
Gui, Add, MonthCal, vBaseDate, 
Gui, Add, Button, gUpdateBaseDate w225, Update Base Date
Gui, Show
return

UpdateBaseDate:
Gui, Submit
FormatTime, BaseDate, %BaseDate%, dd-MMM-yyyy
return

GrabHandle:
;ObjRelease(ie)
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
return

F1::
gosub GrabHandle
BaseDate := BaseDate
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = "US-PAT PROOF DISCREPANCIES")
	{
	ActionType := "US-PAT FILING RECEIPT RECEIVED"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	ie.document.getElementByID("flddteBaseDate").Value := BaseDate
	ie.document.getElementByID("flddteResponseDate").Value := ""
	return
	}
if ActionType = US-PAT FILING RECEIPT RECEIVED
	{
	ActionType := "US-PAT FD IDS"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	ie.document.getElementByID("flddteBaseDate").Value := BaseDate
	ie.document.getElementByID("flddteResponseDate").Value := BaseDate
	return
	}	
if ActionType = US-PAT FD IDS
	{
	ActionType := "US-PAT FD MFEE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	ie.document.getElementByID("flddteBaseDate").Value := BaseDate
	ie.document.getElementByID("flddteResponseDate").Value := ""
	return
	}	
if ActionType = US-PAT FD MFEE
	{
	ActionType := "US-PAT PROJECTED PUB DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	ie.document.getElementByID("flddteBaseDate").Value := BaseDate
	ie.document.getElementByID("flddteResponseDate").Value := ""
	return
	}		
if ActionType = US-PAT PROJECTED PUB DATE
	{
	ActionType := "US-PAT CORRECT PUBLICATION?"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	ie.document.getElementByID("flddteBaseDate").Value := BaseDate
	ie.document.getElementByID("flddteResponseDate").Value := ""
	return
	}	
if ActionType = US-PAT CORRECT PUBLICATION?
	{
	ActionType := "US-PAT PROOF DISCREPANCIES"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	ie.document.getElementByID("flddteBaseDate").Value := BaseDate
	ie.document.getElementByID("flddteResponseDate").Value := ""
	return
	}	
		
if (ActionType != "US-PAT FILING RECEIPT RECEIVED") || (ActionType != "US-PAT FD IDS") || (ActionType != "US-PAT FD MFEE") || (ActionType != "US-PAT PROJECTED PUB DATE") || (ActionType != "US-PAT PROOF DISCREPANCIES")
	{
	ActionType := "US-PAT FILING RECEIPT RECEIVED"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	ie.document.getElementByID("flddteBaseDate").Value := BaseDate
	ie.document.getElementByID("flddteResponseDate").Value := ""
	return
	}
return

/*

US-PAT FILING RECEIPT RECEIVED
US-PAT FD IDS
US-PAT FD MFEE
US-PAT PROJECTED PUB DATE
US-PAT CORRECT PUBLICATION?
US-PAT PROOF DISCREPANCIES




StringLen, ClipLength, Clipboard
NewMousePosX := (xpos - 150)
NewMousePosY := (ypos - 50)
Gui, New, +Owner +AlwaysOnTop, OpenAppOrPatentNumber
Gui, Font, s10 w500, Verdana
Gui, Font, bold
Gui, Add, Button, x100 y30 w100 h55, Open Record in Docketing
if ClipLength < 9
	Gui, Add, Button, x100 y0 h25 w100 vClipboard, %Clipboard%
else
	Gui, Add, Button, x50 y0 h25 w200 vClipboard, %Clipboard%
Gui, Font, s10 w500 normal, Verdana
;Gui, Add, Button, x100 y0 w100 h25, %Clipboard%

Gui, Font, bold underline
Gui, Add, Button, x0  y30   w100 h25 , Patent		                       ;RecordBox5	
Gui, Add, Button, x200 y30  w100 h25 , Trademark	               ;RecordBox1
Gui, Font	

Gui, Add, Button, x0  y60   w100 h25 gPatApp, Application #	                           ;RecordBox6		
Gui, Add, Button, x0  y90   w100 h25 gPatPub, Publication #		                       ;RecordBox5			
Gui, Add, Button, x0  y120  w100 h25 gPatPatent, Patent #	                           ;RecordBox6	

Gui, Add, Button, x200 y60  w100 h25 gTMApp, Application #		                   ;RecordBox2				
Gui, Add, Button, x200 y90  w100 h25 gTMPub, Publication #		       ;RecordBox3	
Gui, Add, Button, x200 y120 w100 h25 gTMReg, Registration #		           ;RecordBox4			 




	Gui, Add, Button, x100 y90 w100 h25 gCancelOpen, Cancel
	Gui, Show, x%NewMousePosX% y%NewMousePosY%
	Gui, +ToolWindow -Caption                           ; Removes the Border and Task bar icon
	Gui, Color, 000111, OpenAppOrPatentNumber                                 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	WinSet, Transcolor, 000111, OpenAppOrPatentNumber
	Gui, Show, x%NewMousePosX% y%NewMousePosY%
return



PatPub:
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
Sleep 500
ie.Document.All.schstrPubNumber_TextBox.Value := Clipboard
CheckValue := ie.Document.All.schstrPubNumber_TextBox.Value
	if (CheckValue = Clipboard)
		ie.Document.All.btnStartSearch.Click()
	else
		{
		ie.Document.All.schstrPubNumber_TextBox.Value := Clipboard
		Sleep 500
		ie.Document.All.btnStartSearch.Click()
		}		
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
return



TMPub:
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
Sleep 500
ie.Document.All.schstrPubNumber_TextBox.Value := Clipboard
CheckValue := ie.Document.All.schstrPubNumber_TextBox.Value.Value
	if (CheckValue = Clipboard)
		ie.Document.All.btnStartSearch.Click()
	else
		{
		ie.Document.All.schstrPubNumber_TextBox.Value := Clipboard		
		Sleep 500
		ie.Document.All.btnStartSearch.Click()
		}		
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
return

*/
















RecordClientCodeIE:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, ClientCodeIE, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIEH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, ClientCodeIE
ClientCodeIE++
ClientCodeIEH++
IniWrite, %ClientCodeIE%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
IniWrite, %ClientCodeIEH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, ClientCodeIE
return

Escape:
ExitApp
