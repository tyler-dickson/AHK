#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, pifmgr.dll, 8

Gui, New, AlwaysOnTop ToolWindow, HANBEV.000ZCN Action Mover
Gui, Font, bold s10
Gui, Add, Button, x0 y0 w200 h100 gDoIt, I like to move it, move it!`n`nI like to move it, move it!
Gui, Show, w200 h100
return

DoIt:
ie := WBGet()
var := ie.LocationURL
Sleep 250
ie.Navigate(var)
while ie.busy or ie.ReadyState != 4
	Sleep, 100
ie.document.getElementByID("btnEdit").Click()
Sleep 500
ie.document.getElementByID("fldstrCaseNumber_TextBox").InnerText := "HANBEV.000ZCN"
Sleep 500
ie.document.getElementByID("btnSave").Click()
while ie.busy or ie.ReadyState != 4
	Sleep, 1000
SendInput, {Control down}w{Control up}
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

GuiClose:
ExitApp
return