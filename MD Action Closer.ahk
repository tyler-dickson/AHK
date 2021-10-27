

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, Force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetWinDelay, 20  ; 20 is good for drawers.
formattime, Today, , yyyy-MM-dd		
Menu, Tray, Icon, Shell32.dll, 46

Enabled := ComObjError(false)

global ComputerName
Computername = %A_Username%

if Computername = lara.anabtawi
	Computername = lara.hamdan
;if Computername = neysa.perkins
;	Computername = neysa.cabudol
if Computername = jessica.george
	Computername = jessica.egigian
if Computername = sabrina.fleming
	Computername = sabrina.kellogg
if Computername = chelsea.veinot
	Computername = chelsea.burdeno

	
/*	
global Option1
global Option2
global Option3
global Option4
global Option5
global Option6
global Option7
global Option8
global RespAtty
global ATDate
global Username
global Today
*/

formattime, Today, ,  MM/dd/yy          ;  yyyy-MM-dd	

global toggle = 0
global CurrentURL

IniRead, Checkboxes, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
StringSplit, Checkboxes, Checkboxes, `, ,
CoordMode, Mouse, Screen       ;Place mouse coordinates at absolute screen coordinates (multiple monitor)
IniRead, RespAtty, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
	if RespAtty = ERROR
		RespAtty := ""

Gui, New, +AlwaysOnTop +Owner +ToolWindow,
Gui, Add, StatusBar, vMyStatusBar, Welcome to the Master Docket Action Closer! ;Status bar
Gui, Add, Picture, x5  y5  gButton1,  \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\EDITBUTTON.png
Gui, Add, Picture, x90 y5  gButton2,  \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\PENCILBUTTON.png
Gui, Add, Picture, x125  y5 gButton3, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\RESPONSESENT.png
Gui, Add, Checkbox, x335 y15 w15 h25 Checked%Checkboxes1% vOption1, 
Gui, Add, Button, x334 y5 w15 h10 gHideStatusBar, 
Gui, Font, s12 bold
Gui, Add, Edit, x250 y6 w80 Center Limit4 -Wrap Uppercase vRespAtty, %RespAtty%
Gui, Font
Gui, Show, w354 h60, Master Docket Action Closer
OnMessage(0x200, "AddAtty")
return

AddAtty(wParam, lParam, Msg) {
MouseGetPos,,,, OutputVarControl
IfEqual, OutputVarControl, Edit1
	AddAtty := "Add ABC/2ABC to include in Auto-remarks.`nLeave blank to type manually."
else IfEqual, OutputVarControl, Button1
	AddAtty := "Check this box to use Auto-remarks."
else IfEqual, OutputVarControl, Button2
	AddAtty := "Check this button to hide/show the Status Bar."
else IfEqual, OutputVarControl, Static1
	AddAtty := "Closes an action when inside the Edit window."
else IfEqual, OutputVarControl, Static2
	AddAtty := "Closes an action when inside the Pencil window."
else IfEqual, OutputVarControl, Static3
	AddAtty := "Closes an action via Response Sent."
else IfEqual, OutputVarControl, msctls_statusbar321
	AddAtty := "This is the Status Bar. It shows what buttons do."	

;ToolTip % AddAtty
SB_SetText(AddAtty)
}

HideStatusBar:
toggle := !toggle
if !toggle 
	{
	GuiControl, Show, MyStatusBar
	Gui, Show, h60
	}
else
	{
	GuiControl, Hide, MyStatusBar
	Gui, Show, h40
	}
return

GuiClose:
ExitApp


;#If WinActive("ahk_class IEFrame") || WinActive("ahk_class Internet Explorer_TridentDlgFrame") 

;#z::gosub Button1
;#x::gosub Button2
;#c::gosub Button3

;#If

Button1:   ; Close from EDIT
Gui, Submit
ie := WBGet()
CurrentURL := ie.LocationURL
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
IniWrite, %Checkboxes%, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes

if Option1 = 0
	{
	SendInput %Today%                 ; I think it is 5 TABS. Could be 6.
		SendInput {Shift down}
		Sleep 200
		SendInput {TAB 5} 
		Sleep 200
		SendInput {Shift up}
		SendInput {Enter}  
	}
if Option1 = 1
	{
	IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
	IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
	StringLen, NameLen, Username
	NameLen3 := NameLen + 2
	SendInput %Today%                 ; I think it is 5 TABS. Could be 6.
	ifInString, CurrentURL, Agent	
		{
		SendInput {Shift down}
		Sleep 200
		SendInput {TAB 5} 
		Sleep 200
		SendInput {Shift up}
		SendInput {Enter}  
		}
	ifNotInString, CurrentURL, Agent	
		{
		SendInput {TAB 3}   
		Clipboard = ;
		SendInput ^a
		Sleep 50
		SendInput ^c
		ClipWait, .2
		SavedRemarks = %Clipboard%
		ExtendRemarks = %ATDate% Date closed per %RespAtty%. %Username% 
		Clipboard =%ExtendRemarks%`n%SavedRemarks%
		Sleep 50
		SendInput ^v
		;Sleep 50
		;SendInput {PgUp}{END}
		;Sleep 50
		;SendInput {PgUp}{END}{Left %NameLen3%} 
		Sleep 200
		SendInput {Shift down}
		Sleep 200
		SendInput {TAB 8} 
		Sleep 200
		SendInput {Shift up}
		SendInput {Enter} 
		}
	}
Clipboard = %OldClipboard%
;gosub RecordCalExtend
CurrentURL := ""
Gui, Show
IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
return

Button2:   ; Close from PENCIL
Gui, Submit
ie := WBGet()
CurrentURL := ie.LocationURL
Checkboxes = %Option1%,%Option2%,%Option3%,%Option4%,%Option5%,%Option6%,%Option7%,%Option8%
IniWrite, %Checkboxes%, C:\Users\%Computername%\AHKPrefs.ini, Username, Checkboxes


if Option1 = 0
	{
	StringRight, RespAtty, RespAtty, 3
	ifInString, CurrentURL, Agent	
		{
		SendInput %Today%   
		SendInput {TAB 2} 
		Sleep 200
		SendInput {Enter} 
		Sleep 200
		}
	ifNotInString, CurrentURL, Agent	
		{
		SendInput %Today%   
		SendInput {TAB} 
		Sleep 200
		SendInput %RespAtty%
		Sleep 100
		SendInput {TAB 2} 	
		SendInput {Enter} 
		Sleep 200
		}
	}
if Option1 = 1
	{
	IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
	IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
	StringLen, NameLen, Username
	NameLen3 := NameLen + 2
	SendInput %Today%                 ; I think it is 5 TABS. Could be 6.
	ifInString, CurrentURL, Agent	
		{
		SendInput {TAB 2} 
		Sleep 200
		SendInput {Enter}  
		}
	ifNotInString, CurrentURL, Agent	
		{
		SendInput {TAB 2}   
		Clipboard = ;
		SendInput ^a
		Sleep 50
		SendInput ^c
		ClipWait, .2
		SavedRemarks = %Clipboard%
		ExtendRemarks = %ATDate% Date closed per %RespAtty%. %Username% 
		Clipboard =%ExtendRemarks%`n%SavedRemarks%
		Sleep 50
		SendInput ^v
		;Sleep 50
		;SendInput {PgUp}{END}
		;Sleep 50
		;SendInput {PgUp}{END}{Left %NameLen3%} 
		Sleep 200
		SendInput {TAB} 
		Sleep 200
		SendInput {Enter} 
		}
	}
Clipboard = %OldClipboard%
;gosub RecordCalExtend
CurrentURL := ""
IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
Gui, Show
return

Button3:            ; Response Sent
Gui, Submit, NoHide
ie := WBGet()
CurrentURL := ie.LocationURL
ResponseSent := Today
ie.document.getElementByID("btnEdit").Click()
Remarks := ie.document.getElementByID("fldstrRemarks").Value
Sleep 250
ie.document.getElementByID("flddteResponseDate").Value := ResponseSent
CurrentAction := ie.document.getElementByID("fldstrActionType_TextBox").Value
ifNotInString, CurrentURL, Agent
	{
	IfInString, CurrentAction, INT-PAT STATUS CHECK
		NewRemarks = %ATDate% Status inquiry sent to FA per %RespAtty%. %Username%`n%Remarks% 
	else IfInString, CurrentAction, INT-TM STATUS ACTION
		NewRemarks = %ATDate% Status inquiry sent to FA per %RespAtty%. %Username%`n%Remarks%
 	else IfInString, CurrentAction, INT-PAT OFFICE ACTION
		NewRemarks = %ATDate% OA response instructions sent to FA per %RespAtty%. %Username%`n%Remarks% 		
	else IfInString, CurrentAction, INT-TM OFFICE ACTION
		NewRemarks = %ATDate% OA response instructions sent to FA per %RespAtty%. %Username%`n%Remarks% 	
	else
		NewRemarks = %ATDate% Dates closed per %RespAtty%. %Username%`n%Remarks% 	
		
	ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
	}
IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty

return


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