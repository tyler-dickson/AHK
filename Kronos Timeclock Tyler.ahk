#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Enabled := ComObjError(false)
Menu, Tray, Icon, shell32.dll , 240

Username := "tyler.dickson"
Password := "054229!AAAA"

Gui, New, , Clocking In/Out...
Gui, Add, ActiveX, x0 y0 w500 h300 vie, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
ie.Navigate("http://oc-kronos/wfc/applications/wtk/html/ess/logon.jsp")
Gui, Show, x-1000 y0
Sleep 1000
ie.document.getElementByID("UserName").Value := Username
ie.document.getElementByID("Password").Value := Password
INPUTS := ie.document.GetElementsByTagName("INPUT").length
Sleep 1000
ie.document.GetElementsByTagName("INPUT")[2].Click()
Sleep 1000
SPANS := ie.document.parentWindow.frames("homebody").document.GetElementsBytagname("SPAN")[0].InnerText ; Use for multi-level & change array value
ie.document.parentWindow.frames("homebody").document.GetElementsBytagname("INPUT")[0].Click()
Sleep 2000
RecordedTime := ie.document.parentWindow.frames("homebody").document.GetElementsBytagname("CITE")[1].InnerText ; Use for multi-level & change array value
Sleep 1000
if SPANS != 
	TrayTip, You just clocked in or out!, Recorded Time: %RecordedTime%
else
	TrayTip, Something went wrong., I'm guessing it didn't work.`nCheck your timecard to verify.
ExitApp