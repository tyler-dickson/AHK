#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, pifmgr.dll, 21
CoordMode, ToolTip 
#Persistent

SetTimer, UpdateTabTitle, 500
return

Cycle = 17

UpdateTabTitle:
FormatTime, CurrentTime, , h:mm:ss
ie := WBGet()
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
ClientCode2 := ie.document.getElementByID("fldstrCaseNumber").Value
if ClientCode = 
	ClientCode := ClientCode2
SplitClient := StrSplit(ClientCode)
NewTitle := 
if Cycle = 1
	NewTitle :=	SplitClient[1]	SplitClient[2]	SplitClient[3]	SplitClient[4]	SplitClient[5]	SplitClient[6]	SplitClient[7]	SplitClient[8]	SplitClient[9]	SplitClient[10]	SplitClient[11]	SplitClient[12]	SplitClient[13]	SplitClient[14]	SplitClient[15]	SplitClient[16]	" " 
if Cycle = 2
	NewTitle :=	" " 	SplitClient[1]	SplitClient[2]	SplitClient[3]	SplitClient[4]	SplitClient[5]	SplitClient[6]	SplitClient[7]	SplitClient[8]	SplitClient[9]	SplitClient[10]	SplitClient[11]	SplitClient[12]	SplitClient[13]	SplitClient[14]	SplitClient[15]	SplitClient[16]
if Cycle = 3
	NewTitle :=	SplitClient[16]	" " 	SplitClient[1]	SplitClient[2]	SplitClient[3]	SplitClient[4]	SplitClient[5]	SplitClient[6]	SplitClient[7]	SplitClient[8]	SplitClient[9]	SplitClient[10]	SplitClient[11]	SplitClient[12]	SplitClient[13]	SplitClient[14]	SplitClient[15]
if Cycle = 4
	NewTitle :=	SplitClient[15]	SplitClient[16]	" " 	SplitClient[1]	SplitClient[2]	SplitClient[3]	SplitClient[4]	SplitClient[5]	SplitClient[6]	SplitClient[7]	SplitClient[8]	SplitClient[9]	SplitClient[10]	SplitClient[11]	SplitClient[12]	SplitClient[13]	SplitClient[14]
if Cycle = 5
	NewTitle :=	SplitClient[14]	SplitClient[15]	SplitClient[16]	" " 	SplitClient[1]	SplitClient[2]	SplitClient[3]	SplitClient[4]	SplitClient[5]	SplitClient[6]	SplitClient[7]	SplitClient[8]	SplitClient[9]	SplitClient[10]	SplitClient[11]	SplitClient[12]	SplitClient[13]
if Cycle = 6
	NewTitle :=	SplitClient[13]	SplitClient[14]	SplitClient[15]	SplitClient[16]	" " 	SplitClient[1]	SplitClient[2]	SplitClient[3]	SplitClient[4]	SplitClient[5]	SplitClient[6]	SplitClient[7]	SplitClient[8]	SplitClient[9]	SplitClient[10]	SplitClient[11]	SplitClient[12]
if Cycle = 7
	NewTitle :=	SplitClient[12]	SplitClient[13]	SplitClient[14]	SplitClient[15]	SplitClient[16]	" " 	SplitClient[1]	SplitClient[2]	SplitClient[3]	SplitClient[4]	SplitClient[5]	SplitClient[6]	SplitClient[7]	SplitClient[8]	SplitClient[9]	SplitClient[10]	SplitClient[11]
if Cycle = 8
	NewTitle :=	SplitClient[11]	SplitClient[12]	SplitClient[13]	SplitClient[14]	SplitClient[15]	SplitClient[16]	" " 	SplitClient[1]	SplitClient[2]	SplitClient[3]	SplitClient[4]	SplitClient[5]	SplitClient[6]	SplitClient[7]	SplitClient[8]	SplitClient[9]	SplitClient[10]
if Cycle = 9
	NewTitle :=	SplitClient[10]	SplitClient[11]	SplitClient[12]	SplitClient[13]	SplitClient[14]	SplitClient[15]	SplitClient[16]	" " 	SplitClient[1]	SplitClient[2]	SplitClient[3]	SplitClient[4]	SplitClient[5]	SplitClient[6]	SplitClient[7]	SplitClient[8]	SplitClient[9]
if Cycle = 10
	NewTitle :=	SplitClient[9]	SplitClient[10]	SplitClient[11]	SplitClient[12]	SplitClient[13]	SplitClient[14]	SplitClient[15]	SplitClient[16]	" " 	SplitClient[1]	SplitClient[2]	SplitClient[3]	SplitClient[4]	SplitClient[5]	SplitClient[6]	SplitClient[7]	SplitClient[8]
if Cycle = 11
	NewTitle :=	SplitClient[8]	SplitClient[9]	SplitClient[10]	SplitClient[11]	SplitClient[12]	SplitClient[13]	SplitClient[14]	SplitClient[15]	SplitClient[16]	" " 	SplitClient[1]	SplitClient[2]	SplitClient[3]	SplitClient[4]	SplitClient[5]	SplitClient[6]	SplitClient[7]
if Cycle = 12
	NewTitle :=	SplitClient[7]	SplitClient[8]	SplitClient[9]	SplitClient[10]	SplitClient[11]	SplitClient[12]	SplitClient[13]	SplitClient[14]	SplitClient[15]	SplitClient[16]	" " 	SplitClient[1]	SplitClient[2]	SplitClient[3]	SplitClient[4]	SplitClient[5]	SplitClient[6]
if Cycle = 13
	NewTitle :=	SplitClient[6]	SplitClient[7]	SplitClient[8]	SplitClient[9]	SplitClient[10]	SplitClient[11]	SplitClient[12]	SplitClient[13]	SplitClient[14]	SplitClient[15]	SplitClient[16]	" " 	SplitClient[1]	SplitClient[2]	SplitClient[3]	SplitClient[4]	SplitClient[5]
if Cycle = 14
	NewTitle :=	SplitClient[5]	SplitClient[6]	SplitClient[7]	SplitClient[8]	SplitClient[9]	SplitClient[10]	SplitClient[11]	SplitClient[12]	SplitClient[13]	SplitClient[14]	SplitClient[15]	SplitClient[16]	" " 	SplitClient[1]	SplitClient[2]	SplitClient[3]	SplitClient[4]
if Cycle = 15
	NewTitle :=	SplitClient[4]	SplitClient[5]	SplitClient[6]	SplitClient[7]	SplitClient[8]	SplitClient[9]	SplitClient[10]	SplitClient[11]	SplitClient[12]	SplitClient[13]	SplitClient[14]	SplitClient[15]	SplitClient[16]	" " 	SplitClient[1]	SplitClient[2]	SplitClient[3]
if Cycle = 16
	NewTitle :=	SplitClient[3]	SplitClient[4]	SplitClient[5]	SplitClient[6]	SplitClient[7]	SplitClient[8]	SplitClient[9]	SplitClient[10]	SplitClient[11]	SplitClient[12]	SplitClient[13]	SplitClient[14]	SplitClient[15]	SplitClient[16]	" " 	SplitClient[1]	SplitClient[2]
if Cycle = 17
	NewTitle :=	SplitClient[2]	SplitClient[3]	SplitClient[4]	SplitClient[5]	SplitClient[6]	SplitClient[7]	SplitClient[8]	SplitClient[9]	SplitClient[10]	SplitClient[11]	SplitClient[12]	SplitClient[13]	SplitClient[14]	SplitClient[15]	SplitClient[16]	" " 	SplitClient[1]

locate := ie.LocationURL
ie.document.title := NewTitle

if Cycle > 2
	Cycle--
else
	Cycle = 17
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
