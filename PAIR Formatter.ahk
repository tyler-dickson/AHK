; Created with AutoHotkey by Tyler Dickson. 

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, pifmgr.dll, 20
Enabled := ComObjError(false)
ComputerName = %A_Username%

if Computername = lara.anabtawi
	Computername = lara.hamdan
if Computername = neysa.perkins
	Computername = neysa.cabudol
if Computername = jessica.george
	Computername = jessica.egigian
if Computername = sabrina.fleming
	Computername = sabrina.kellogg


^Space::
Clipboard = 
Sleep 200
SendInput ^c
ClipWait, 1
gosub iManageColumnRemover
return

!Space::
Clipboard = 
Sleep 200
SendInput ^c
ClipWait, 1
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
		CleanedColumns = % Columns1 "`t"  Columns3 "`t" Columns6 . "." . Columns7
	ifMsgBox No
		CleanedColumns = % Columns1 "`t"  Columns6 . "." . Columns7
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
Sleep 100
FileDelete, C:\Users\%Computername%\PAIRTempCleaned.txt
Sleep 100
FileAppend, %Clipboard%, C:\Users\%Computername%\PAIRTemp.txt
Sleep 3000
FileRead, SavedContent, C:\Users\%Computername%\PAIRTemp.txt
Sleep 500
StringSplit, SavedContent, SavedContent, `n
Sleep 1000


Loop %SavedContent0%        ; %LoopAmount%
{
PreviousLoop := (A_Index - 1)
StringReplace, SavedContent%A_Index%, SavedContent%A_Index%, %A_Space%, `t, UseErrorLevel

StringSplit, SplitUp, SavedContent%A_Index%, `t	

if (SplitUp0 = 3) 
	{
	SavedContent%A_Index% := "`t" SplitUp1 "`t" SplitUp2 "`t" SplitUp3
	}

CleanedContent := CustomerNumber "`t" SavedContent%A_Index%
FileAppend, %CleanedContent%, C:\Users\%Computername%\PAIRTempCleaned.txt
SplitUp0 := ""
SplitUp1 := ""
SplitUp2 := ""
SplitUp3 := ""
SplitUp4 := ""
}

FileRead, Clipboard, C:\Users\%Computername%\PAIRTempCleaned.txt
Sleep 2000
if Clipboard !=
	TrayTip, Formatting updated!, Formatted information added to Clipboard.`nPaste into Excel template to proceed.
else
	TrayTip, Clipboard blank..., I think something went wrong.`nTry again and see if it works.	
Sleep 3000
TrayTip
return

OpenAppOrPatentNumber:
CleanedUp  := ""
CleanedUp0 := ""
CleanedUp1 := ""
CleanedUp2 := ""
CleanedUp3 := ""
CleanedUp4 := ""
CleanedUp5 := ""
CleanedUp6 := ""
CleanedUp7 := ""
CleanedUp8 := ""
Clipboard =
;NewClipboard = %Clipboard%
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
SendInput ^c
ClipWait, .5
IfInString Clipboard, PCT
	{
	}
else
	{
	StringReplace, CleanedUp, Clipboard, `, ,
	StringReplace, CleanedUp, CleanedUp, / ,
	StringSplit, CleanedUp, CleanedUp
	CleanedUp := % CleanedUp1 CleanedUp2 "/" CleanedUp3 CleanedUp4  CleanedUp5  CleanedUp6  CleanedUp7 CleanedUp8
	}
Sleep 50
StringLen, ClipLength, Clipboard
NewMousePosX := (xpos - 150)
NewMousePosY := (ypos - 50)
Gui, New, +Owner +AlwaysOnTop, OpenAppOrPatentNumber
Gui, Font, bold
Gui, Add, Button,   Center x5     y0 w130 h18  , Application #
Gui, Add, Button,   Center x165   y0 w130 h18  , Patent/Reg/Opp #
Gui, Font
Gui, Add, Button, x5   y20 w130 h25  vCleanedUp, %CleanedUp%
Gui, Add, Button, x165 y20 w130 h25 vClipboardTest, %Clipboard%

Gui, Add, Button, x5 y50 w130 h25 gPatApp, Patent Application #	                           ;RecordBox6	
Gui, Add, Button, x5 y80 w130 h25 gTMApp, Trademark Application #		                   ;RecordBox2		
	
Gui, Add, Button, x165 y50 w130 h25 gPatPatent , Patent #		                       ;RecordBox5		
Gui, Add, Button, x165 y80 w130 h25 gTMReg, Trademark Registration #		           ;RecordBox4	

	
Gui, Add, Button, x165 y110 w130 h25 gTMOpp, Opposition #	                           ;RecordBox6	
Gui, Font, bold
Gui, Add, Button, x40 y110 w65 h25 gCancelOpen, Cancel	                           ;RecordBox6	
Gui, Font
		 
Gui, Show, x%NewMousePosX% y%NewMousePosY%
Gui, +ToolWindow  -Caption                           ; Removes the Border and Task bar icon
Gui, Color, 000111, OpenAppOrPatentNumber                                 ; can be any colour but it's good to use a color that is NOT present in ur GUI
WinSet, Transcolor, 000111, OpenAppOrPatentNumber
Gui, Show, x%NewMousePosX% y%NewMousePosY%
return

GuiClose:
Gui, Destroy
return

CancelOpen:
Gui, Destroy
return


PatApp:
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
ie.Document.All.schstrAppNumber_TextBox.Value := CleanedUp
CheckValue := ie.Document.All.schstrAppNumber_TextBox.Value
	if (CheckValue = Clipboard)
		ie.Document.All.btnStartSearch.Click()
	else
		{
		ie.Document.All.schstrAppNumber_TextBox.Value := CleanedUp
		Sleep 500
		ie.Document.All.btnStartSearch.Click()
		}		
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
return

PatPatent:
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
return

TMApp:
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
Sleep 500
ie.Document.All.schstrAppNumber_TextBox.Value := CleanedUp
CheckValue := ie.Document.All.schstrAppNumber_TextBox.Value
	if (CheckValue = Clipboard)
		ie.Document.All.btnStartSearch.Click()
	else
		{
		ie.Document.All.schstrAppNumber_TextBox.Value := CleanedUp
		Sleep 500
		ie.Document.All.btnStartSearch.Click()
		}		
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
return

TMOpp:
Gui, Submit
OutputVar = http://oc-docketing/CPi/tmkschConflicts.aspx
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
ie.Document.All.schstrConflictOpposition_TextBox.Value := Clipboard
CheckValue := ie.Document.All.schstrRegNumber_TextBox.Value
	if (CheckValue = Clipboard)
		ie.Document.All.btnStartSearch.Click()
	else
		{
		ie.Document.All.schstrConflictOpposition_TextBox.Value := Clipboard	
		Sleep 500
		ie.Document.All.btnStartSearch.Click()
		}		
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
return

TMReg:
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
Sleep 500
ie.Document.All.schstrRegNumber_TextBox.Value := Clipboard
CheckValue := ie.Document.All.schstrRegNumber_TextBox.Value
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
	ActionType := "US-PAT CORRECT PUBLICATION?"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	ie.document.getElementByID("flddteBaseDate").Value := BaseDate
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
