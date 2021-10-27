#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)

;::#opp::
;SendInput %ATDate% Possible opposition against`nApplication number:`n" [MARK] "`nby *`nOur Mark(s):`nRcvd via * . %Username%
;return

;Possible opposition against
;Application number: 
;" [MARK] "
;by *
;Our Mark(s):
;Rcvd via * 

Computername = %A_Username%


^o::
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
ie.document.getElementByID("btnEdit").Click()
Sleep 250
;ie.document.getElementByID("btnSave").Click()
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
Remarks := ie.document.getElementByID("fldstrRemarks").Value
Sleep 250
StringMid, AppNo, ActionType, 29, 60
Sleep 250
Default := ATDate . " Possible opposition against`nApplication number: " . AppNo . "`n' [MARK] '`nby *`nOur Mark(s):`nRcvd via * " . Username . "`n" . Remarks
ie.document.getElementByID("fldstrRemarks").Value := Default
return

#If WinActive("ahk_class IEFrame") || WinActive("ahk_class SunAwtFrame")

::!ABC::
global AttyCert := "\\docs-oc\files\USPTO\Alexander.Zeng.epf"
gosub, GetPassword
return

;ie.document.parentWindow.frames("entrustTruePassGuiFrame").document.GetElementsBytagname("INPUT")[0].Value := "0" ; Username
;ie.document.parentWindow.frames("entrustTruePassGuiFrame").document.GetElementsBytagname("INPUT")[1].Value := "1" ; Browse...
;ie.document.parentWindow.frames("entrustTruePassGuiFrame").document.GetElementsBytagname("INPUT")[2].Value := "2" ; Password
;ie.document.parentWindow.frames("entrustTruePassGuiFrame").document.GetElementsBytagname("INPUT")[3].Value := "3" ; Checkbox
;ie.document.parentWindow.frames("entrustTruePassGuiFrame").document.GetElementsBytagname("INPUT")[4].Value := "4" ; Authenticate
;ie.document.parentWindow.frames("entrustTruePassGuiFrame").document.GetElementsBytagname("INPUT")[5].Value := "5" ; Reset

GetPassword:
ie := WBGet()
IniRead, Password, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\EFS - UNC.ini, EFS, %AttyCert%
Sleep 1000
TrayTip, %AttyCert%, Password: %Password%
ie.document.parentWindow.frames("entrustTruePassGuiFrame").document.GetElementsBytagname("INPUT")[0].Value := AttyCert ; Username
ie.document.parentWindow.frames("entrustTruePassGuiFrame").document.GetElementsBytagname("INPUT")[2].Value := Password ; Password
Sleep 3000
AttyCert := ""
TrayTip
;gosub RecordEFSCertFinder
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;        EFS CERT FINDER HOTSTRINGS         ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#If WinActive("ahk_class IEFrame") || WinActive("ahk_class SunAwtFrame")

::!ADZ::
SendInput H:\USPTO\Alexander.Zeng.epf
Clipboard = H:\USPTO\Alexander.Zeng.epf
Sleep 200
gosub, GetPassword
return





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


