#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
Enabled := ComObjError(false)
formattime, Today, ,  MM/dd/yyyy          ;  yyyy-MM-dd	
Menu, Tray, Icon, Shell32.dll, 41

NewRemarks = 
(
1/2020
Myanmar’s Trademark Law will be implemented in 2020 in two stages. The first stage is expected to start on 2 January 2020 with the commencement of a “soft opening” period lasting six months. The second stage which is targeted for 2 July 2020 will see the launch of the new legal framework. The new system will allow only previously registered trademarks to be re-filed within six (6) months since the opening date.

General Updates under New Trademark Law:

1. Term: 10 year term
2. The new system will have an examination process by new IP office.
3. Multi-class system
4. The practice of publishing a cautionary notice will no longer under new system.
)

Gui, New, +ToolWindow, Diana MM Remarks Injecter
Gui, Add, Button,x5 y5 w165 h40 gInjectRemarks, Click me.
Gui, Show, w175 h50
return

GuiClose:
ExitApp
return

InjectRemarks:
Gui, Submit, NoHide
ie := WBGet()
OldRemarks := ie.document.getElementById("fldstrRemarks").value 
ie.document.getElementById("fldstrRemarks").value := NewRemarks . "`n`n" . OldRemarks 
Sleep 200
ie.document.getElementById("btnSave").Click()
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
