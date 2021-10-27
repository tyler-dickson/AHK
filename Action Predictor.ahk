#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, pifmgr.dll, 12
Enabled := ComObjError(false)

;Gui, Add, Edit, w800 h500,

#s::
;GuiControl, , Edit1, 
;Gui, Show
Gui, Destroy

WinActivate, ahk_class IEFrame
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
var := ie.LocationURL ; grab current url

Offset = 1
NewOffset = 0
TDS := ie.document.GetElementsBytagname("TD").length
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
ClientCodeTM := ie.document.getElementByID("fldstrCaseNumber").Value
CountryCode := ie.document.getElementByID("fldstrCountry_TextBox").Value
Country := ie.document.getElementByID("fldstrCountryName").Value

if ClientCode = 
	Stored := ClientCodeTM
else if ClientCodeTM = 
	Stored := ClientCode
if (ClientCode := "") && (ClientCodeTM := "")
	Stored := ""

Gui, Add, Text, , % Stored " | " CountryCode " | " Country
	
	
Loop %TDS%
{
	InTEXT := ie.document.GetElementsBytagname("TD")[A_Index-1].InnerText
	if (InTEXT = "Action Taken")
		{
		ifinstring, var, CPiAgent
			{
			DocketType := "System: Audit Trail"
			FirstAction := A_Index + 3
			}
		else ifinstring, var, CPi
			{
			DocketType := "System: Live"
			FirstAction := A_Index + 4
			}
		}		
}

;GuiControl, , Edit1, %Stored% | %CountryCode% | %Country% | %DocketType%

Loop
{
	TempAction := ie.document.GetElementsBytagname("TD")[FirstAction + NewOffset + 1].InnerText
	Length := StrLen(TempAction)
	
	if (A_Index > 4 && Length > 2)
		break
	else	
		NewOffset++	
}

Offset = 1

Loop
{
	;GuiControlGet, Temp, , Edit1	
	ActOne   := ie.document.GetElementsBytagname("TD")[FirstAction + Offset + 0].InnerText
	ActTwo   := ie.document.GetElementsBytagname("TD")[FirstAction + Offset + 1].InnerText
	ActThree := ie.document.GetElementsBytagname("TD")[FirstAction + Offset + 2].InnerText
	ActFour  := ie.document.GetElementsBytagname("TD")[FirstAction + Offset + 3].InnerText
	
	if (ActFour == " ")
		OpenedStatus := "OPEN`t"
	else 
		OpenedStatus := "CLOSED"	

	Length := StrLen(ActOne)
		
	if (Length < 5)
		break
	else
		{		
		ActionData :=  OpenedStatus "`t| " ActOne " | " ActTwo " | " ActThree " | " ActFour
		Gui, Add, Text,  yp+15, % ActionData
		;GuiControl, , Edit1, % Temp "`n" ActionData
		Gui, Show, w600 h500
		Offset := Offset + NewOffset
		}	
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
