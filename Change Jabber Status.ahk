#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
Menu, Tray, Icon, pifmgr.dll, 8
Enabled := ComObjError(false)

#IfWinActive, ahk_class wcl_manager1 

esc:: 
IfWinActive, Cisco Jabber 
	{
	ControlClick, wcl_manager14, Cisco Jabber, , , 
	Sleep 500
	ControlSetText, Edit4, test123, Cisco Jabber, , , 
	Sleep 500
	ControlFocus, Edit3, Cisco Jabber, , , 
	}
return 


#IfWinActive, ahk_class rctrl_renwnd32

!F12::
ie := WBGet()
URL := ie.LocationURL ;grab current url
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
ClientCodeTM := ie.document.getElementByID("fldstrCaseNumber").Value

if ClientCode = 
	Stored := ClientCodeTM
else if ClientCodeTM = 
	Stored := ClientCode
if (ClientCode := "") && (ClientCodeTM := "")
	Stored := ""


; ControlClick, WindowsForms10.EDIT.app.0.9585cb_r112_ad11, , , , , 
ControlFocus, WindowsForms10.EDIT.app.0.9585cb_r112_ad11, , , , 
Sleep 200
ControlSetText, WindowsForms10.EDIT.app.0.9585cb_r112_ad11, %Stored%\Scanned File History\, , , , 


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