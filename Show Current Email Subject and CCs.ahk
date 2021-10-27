#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, pifmgr.dll, 32
Enabled := ComObjError(false)


global Address
global From
global Subj
global Body
global CCs


Gui, 2: New, AlwaysOnTop -ToolWindow, Current Email Information

;Gui, 2: Font, s8 bold, Verdana
;Gui, 2: Add, Text, +ReadOnly x0 y8 h20 w40 Center, From:
;Gui, 2: Add, Text, +ReadOnly x0 y35 h20 w40 Center, To:
;Gui, 2: Add, Text, +ReadOnly x0 y76 h20 w40 Center, Cc:
;Gui, 2: Add, Text, x0 y140 h20 w40 Center, Sub:
;Gui, 2: Add, Text, x0 y0 h20 w40 Center, Sub:

Gui, 2: Font, s9 cBlue bold, Verdana

;Gui, 2: Add, Edit, +ReadOnly x40 y5 h20 w450, From:
;Gui, 2: Add, Edit, +ReadOnly x40 yp+25 h20 w450, To:
;Gui, 2: Add, Edit, +Wrap +ReadOnly x40 yp+25 h60 w450, Cc:
;Gui, 2: Add, Edit, +Wrap +ReadOnly x40 yp+65 h60 w450, Subject:
Gui, 2: Add, Edit, +Wrap +ReadOnly x0 yp h40 w740, Subject:
Gui, 2: Show, w740 h40

SetTimer, GrabOutlookInfo, 100
return 

GrabOutlookInfo:
if WinActive("ahk_exe OUTLOOK.EXE") || WinActive("Current Email Information")
	Gui, 2: Show, NoActivate w740
else
	{
	;Gui, 2: Hide
	; return
	}
GuiControlGet, OldSubject, 2: , Edit4, 

if instr((Name := ComObjType(ComObjActive("Outlook.Application").ActiveWindow, "Name")), "Inspector")
   OpenEmail := COMObjActive("Outlook.Application").ActiveInspector.CurrentItem
else if instr(Name, "Explorer")
   OpenEmail := COMObjActive("Outlook.Application").ActiveExplorer.Selection.Item(1)
;else
;  msgbox Active Outlook window is a %name% window

Address := OpenEmail.SenderEmailAddress
From := OpenEmail.SenderName
Subj := OpenEmail.Subject
Body := OpenEmail.Body
CCs := OpenEmail.CC
To := OpenEmail.To

if (OldSubject == Subj)
	return
else
	{
	;GuiControl, 2: , Edit1, %From%
	;GuiControl, 2: , Edit2, %To%
	;GuiControl, 2: , Edit3, %CCs%
	;GuiControl, 2: , Edit4, %Subj%
	GuiControl, 2: , Edit1, %Subj%
	Gui, 2: Show, NoActivate w740, Current Email Information
	}
return

2GuiClose:
ExitApp
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
