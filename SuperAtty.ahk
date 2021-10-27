#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, pifmgr.dll, 31
Enabled := ComObjError(false)

; https://www.slipstick.com/developer/working-vba-nondefault-outlook-folders/

; https://docs.microsoft.com/en-us/office/vba/api/outlook.folder

; https://docs.microsoft.com/en-us/office/vba/api/outlook.explorer.currentfolder

; https://docs.microsoft.com/en-us/office/vba/api/outlook.mailitem

global Option1
global Option2
global Option3
global Option4
global Option5
global Option6
global Option7
global Option8
global Option9
global RespAtty
global FolderNumber
global ie2
global AutoExtendOn


ClickSave:
ie := WBGet()
AS := ie.document.GetElementsBytagname("A").length
Loop %AS%
	{
	Temp:= ie.document.GetElementsBytagname("A")[A_Index-1].OuterHTML

	ifinstring, Temp , save
		{
		ie.document.GetElementsBytagname("A")[A_Index-1].Click()
		break
		}
	}
return

#3::
ie2 := WBGet()

Test := ie2.document.GetElementsBytagname("OPTION").Length
Test1 := ie2.document.GetElementsBytagname("OPTION")
Test2 := ie2.document.GetElementsBytagname("OPTION").InnerText

MsgBOx, % Test " | " Test1[0] " | " Test2

Loop %Test%
{
Temp := ie2.document.GetElementsBytagname("OPTION")[A_Index-1].InnerText

MsgBox, %Temp%

ifinstring, Temp,  ABT      ; % ie2.document.GetElementsBytagname("INPUT")[3].Value
	{
	
	MsgBox, Match.
	ie2.document.GetElementsBytagname("INPUT")[3].Value :=  ie2.document.GetElementsBytagname("OPTION")[A_Index-1].InnerText
	Sleep 500
	ie2.document.GetElementsBytagname("OPTION")[A_Index-1].selectedindex := A_Index - 1
	Sleep 500

	
	break

	}
}


return


Loop % ie2.document.GetElementsBytagname("IMG").length
	{
	Temp := ie2.document.GetElementsBytagname("IMG")[A_Index-1].OuterHTML

	ifinstring, Temp, cboAttorneyType
		{
		TypeDropdown := A_Index - 1
		}
	else ifinstring, Temp, cboAttorney
		AttyDropdown := A_Index - 1
	}

ie2.document.GetElementsBytagname("INPUT")[3].Focus()
ie2.document.GetElementsBytagname("INPUT")[3].Value := "000"
Sleep 1000
ie2.document.GetElementsBytagname("IMG")[AttyDropdown].Click()
Sleep 200
;SendInput, {Enter}
ControlSend, Internet Explorer_Server1, {Enter}
Sleep 200
ie2.document.GetElementsBytagname("INPUT")[5].Focus()
ie2.document.GetElementsBytagname("INPUT")[5].Value := "Responsible"
Sleep 200
ie2.document.GetElementsBytagname("IMG")[TypeDropdown].Click()
Sleep 200
;SendInput, {Enter}
ControlSend, Internet Explorer_Server1, {Enter}
Sleep 200
gosub ClickSave
return


#4::
SuperAtty()
{
global ExtendDays
global MyMonthCal

WinGetPos, winposX, winposY, winposW, winposH, A  ; "A" to get the active window's pos.

Gui, 2: Destroy
ie := WBGet()
var := ie.LocationURL ; grab current url

; http://oc-docketing/CPi/tmkfrmTrademark.aspx?key=464460
; http://oc-docketing/CPi/sysfrmSysAttorney.aspx?Key=464460&sys=1

; http://oc-docketing/CPi/patfrmInvInventor.aspx?Key=818395

; http://oc-docketing/CPi/sysfrmAttorney.aspx?Attorney=000&pop=1

ifinstring, var, patfrmActionDueAgent
	newvar := StrReplace(var, "patfrmActionDueAgent", "patfrmActDueDateAgent", , 1)
else ifinstring, var, CPi/patfrmActionDue
	newvar := StrReplace(var, "patfrmActionDue", "patfrmActDueDate", , 1)
else ifinstring, var, tmkfrmTrademark
	newvar := StrReplace(var, "tmkfrmTrademark", "sysfrmSysAttorney", , 1) . "&sys=1"
else ifinstring, var, tmkfrmActionDue
	newvar := StrReplace(var, "tmkfrmActionDue", "tmkfrmActDueDate", , 1)	
else
	{
	;TrayTip, Not in a docketing action., Not in a docketing action.
	return
	}
	
Gui, 2: New, ToolWindow AlwaysOnTop, Docketing SuperAtty
Gui, 2: Add, Button, x5 y5 w33 h50 gCloseButtonnew, Fast Close
Gui, 2: Add, ActiveX, w800 h500 x41 y5 vie2, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
ie2.Navigate(newvar)  ; This is specific to the web browser control.
Gui, 2: Color, ABCDEF

OnMessage(0x100, "gui_KeyDown", 2) ; [color=green]; This when the GUI is initialized.[/color]
ComObjConnect(ie2, ie_events)  ; Connect ie's events to the ie_events class object.

newheight := winposY + (winposH/2 - 225)
newwidth := winposX + (winposW/2 - 423)

Gui, 2: Show, x%newwidth% y%newheight% w845 h533 ; yCenter
SetTimer, RefreshGUI, 500
return



RefreshGUI:
AS := ie2.document.GetElementsBytagname("A").length
INPUTS := ie2.document.GetElementsBytagname("INPUT").length
SPANS := ie2.document.GetElementsBytagname("SPAN").length
TEXTAREAS := ie2.document.GetElementsBytagname("TEXTAREA").length

return

CloseButtonnew:
Gui, 2: Submit, NoHide
formattime, Today, ,  dd-MMM-yyyy   ;       MM/dd/yyyy          ;  yyyy-MM-dd	
ie2.document.GetElementsBytagname("INPUT")[7].Value := Today
;ie2.document.GetElementsBytagname("INPUT")[8].Value := "EXT"
CurrentRemarks := ie2.document.GetElementsBytagname("TEXTAREA")[0].Value

if (RespAtty != "") 
	{
	ExtendRemarks = %ATDate% Date closed per %RespAtty%. %Username% 
	ie2.document.GetElementsBytagname("TEXTAREA")[0].Value := ExtendRemarks "`n" CurrentRemarks
	}
else 
	{
	ExtendRemarks = %ATDate% %Username% 
	ie2.document.GetElementsBytagname("TEXTAREA")[0].Value := ExtendRemarks "`n" CurrentRemarks
	}
gosub ClickSave
return

2GuiClose:
ie.Navigate(var)
Gui, 2: Submit
Gui, 2: Destroy
return


}



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



