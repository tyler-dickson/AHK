#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
Enabled := ComObjError(false)
formattime, Today, ,  MM/dd/yyyy          ;  yyyy-MM-dd	
Menu, Tray, Icon, Shell32.dll, 43

SetTimer, GrabClientCode, 1000
return

GrabClientCode:
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
	
StringSplit, Codes, Stored, .
return

F1::
IfWinActive, ahk_exe OUTLOOK.EXE
	{
	ControlSetText, RICHEDIT50W15, %Codes1%,   , , ,  ; RICHEDIT50W15
	ControlSetText, RICHEDIT50W16, %Codes2%,   , , ,  ; RICHEDIT50W16
	Sleep 500
	ControlClick, Button23,    , , , , 
	}
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
