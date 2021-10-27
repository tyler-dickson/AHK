#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
Enabled := ComObjError(false)

global ComputerName
Computername = %A_Username%

if Computername = lara.anabtawi
	Computername = lara.hamdan
if Computername = neysa.perkins
	Computername = neysa.cabudol
if Computername = jessica.george
	Computername = jessica.egigian
if Computername = sabrina.fleming
	Computername = sabrina.kellogg
return
	
#4::
ie := WBGet()
URL := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
;MsgBox, %URL%

	ifinstring, URL, patfrmActionDueAgent
		{
		TrayTip, Unable to continue.,Not on a Live action`, or cross reference not available.`n`nConsider using System Switch instead.
		SetTimer, SleepTimer, 2500
		return		
		}
	else ifinstring, URL, tmkfrmActionDueAgent
		{
		TrayTip, Unable to continue.,Not on a Live action`, or cross reference not available.`n`nConsider using System Switch instead.
		SetTimer, SleepTimer, 2500
		return		
		}
	else ifinstring, URL, tmkfrmActionDue
		{
		StringSplit, URL, URL, =,
		StringReplace, ActionID, URL2, &bc, , 
		;MsgBox, %ActionID%
		Sleep 200
		IniRead, ATAction, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Action Cross Reference.ini, TMSwitch, %ActionID%
		Sleep 200
			if ATAction = ERROR
				{
				TrayTip, Unable to continue.,Not on a Live action`, or cross reference not available.`n`nConsider using System Switch instead.
				SetTimer, SleepTimer, 2500
				return
				}
			else
				;MsgBox, Live ActionID: %ActionID% `nAT ActionID: %ATAction%
				Run, % "http://oc-docketing/CPiAgent/tmkfrmActionDueAgent.aspx?Key=" ATAction
		return
		}
	else ifinstring, URL, patfrmActionDue
		{
		StringSplit, URL, URL, =,
		StringReplace, ActionID, URL2, &bc, , 
		;MsgBox, %ActionID%
		Sleep 200
		IniRead, ATAction, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Action Cross Reference.ini, PatentSwitch, %ActionID%
		Sleep 200
			if ATAction = ERROR
				{
				TrayTip, Unable to continue.,Not on a Live action`, or cross reference not available.`n`nConsider using System Switch instead.
				SetTimer, SleepTimer, 2500
				return
				}
			else
				;MsgBox, Live ActionID: %ActionID% `nAT ActionID: %ATAction%
				Run, % "http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=" ATAction
		return
		}
	else
		{
		TrayTip, Unable to continue.,Not on a Live action`, or cross reference not available.`n`nConsider using System Switch instead.
		SetTimer, SleepTimer, 2500
		return
		}
return

SleepTimer:
TrayTip
return

;       http://oc-docketing/CPi/tmkfrmActionDue.aspx?Key=3403642              ;&bc=1&Key2=509931
;		http://oc-docketing/CPiAgent/tmkfrmActionDueAgent.aspx?Key=5232864    ;&bc=1&Key2=509931
;		http://oc-docketing/CPi/patfrmActionDue.aspx?key=9359860              ;&bc=1&key2=1234597
;		http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=10625895   ;&bc=1&key2=1234597






















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
