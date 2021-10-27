#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)

#s::
ie := WBGet()
Sleep 1000
URL := ie.LocationURL

ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
BaseDate := ie.document.getElementByID("flddteBaseDate").Value
ResponseSent := ie.document.getElementByID("flddteResponseDate").Value
Remarks := ie.document.getElementByID("fldstrRemarks").Value
StringSplit, NewURL, URL, =

IfInString, 	 URL, http://oc-docketing/CPi/patfrmActionDue.aspx?key
	NewURL1 := "http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key"
else IfInString, URL, http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key
	NewURL1 := "http://oc-docketing/CPi/patfrmActionDue.aspx?key"
else IfInString, URL, http://oc-docketing/CPi/tmkfrmActionDue.aspx?Key
	NewURL1 := "http://oc-docketing/CPiAgent/tmkfrmActionDueAgent.aspx?key"
else IfInString, URL, http://oc-docketing/CPiAgent/tmkfrmActionDueAgent.aspx?key
	NewURL1 := "http://oc-docketing/CPi/tmkfrmActionDue.aspx?Key"
else
	return

UpdatedURL := NewURL1 . "=-1&bc=1&key2=" . NewURL4
Run, % UpdatedURL
Sleep 1500
ie := WBGet()

ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
ie.document.getElementByID("flddteBaseDate").Value 			 := BaseDate
ie.document.getElementByID("flddteResponseDate").Value 		 := ResponseSent
ie.document.getElementByID("fldstrRemarks").Value 			 := Remarks

ie.document.getElementByID("btnSave").Click()
URL := ""
NewURL0 := ""
NewURL1 := ""
NewURL2 := ""
NewURL3 := ""
NewURL4 := ""
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