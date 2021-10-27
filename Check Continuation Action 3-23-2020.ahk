#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 41

formattime, Today, , MMddyy          ; yyyy-MM-dd
Gui, New, , Check Continuation Action (3/23/2020)
Gui, Add, Edit, Center x10 y55 w150 h400 gBackEnd vBackEnd			
Gui, Font
Gui, Add, Edit, Center x10 y25 w130 ReadOnly vNumberOfCodes ,				0
Gui, Font, s11 
Gui, Add, Text, Center x10 y5 w130, Client Code Count:
Gui, Add, ListView, x165 y55 w475 h400 Checked Right Grid vLoadedFiles , Client Code                   |Action                         |Due Date             |Date Taken
Gui, Add, Button, x165 y25 w200 h22 gAppend,Check For Continuation Action
Gui, Add, ActiveX, x0 y450 w650 h0 vie, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
; ie.Navigate("http://kmobnetold/outsidekmobnet/cid/cidold/ClientList.aspx")  ; This is specific to the web browser control.
Gui, Show, w650
return

BackEnd:
GuiControlGet, Edit1Status, , Edit1
StringSplit, Edit1Status, Edit1Status, `n, 
GuiControl, , Edit2, %Edit1Status0%
return

Append:
Gui, Submit, NoHide
StringSplit, BackEnd, BackEnd, `n, , 
LV_Delete()
Sleep 1000
Loop %BackEnd0%
{
Website := "https://oc-insideknobbe.kmob.com/intranet/forms/Patent_TM_Reports/facesheet.cfm?&casenumber=" . BackEnd%A_Index% . "&country=US"
params := [Website, 64]
ie.Navigate(params*)	
; Sleep 500
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
Info := ""
BaseNumber := ""
NewInfo := ""
var := ie.LocationURL ;grab current url	
Var2 := ie.document.GetElementsByTagName("TD").length
	Loop %Var2%
	{
	NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
	Info := Info . "`n" . NewInfo . " | " . A_Index
		if NewInfo = File Continuing Application? Patent to Issue
			{
			BaseNumber := A_Index - 1
			break
			}
		;if NewInfo = File Continuing App? IFee Due
		;	{
		;	BaseNumber := A_Index - 1
		;	break
		;	}
	}
Action1 := ie.document.GetElementsByTagName("TD")[BaseNumber].InnerText
Action2 := ie.document.GetElementsByTagName("TD")[BaseNumber + 1].InnerText
Action4 := ie.document.GetElementsByTagName("TD")[BaseNumber + 3].InnerText
LV_Add("", BackEnd%A_Index%, Action1, Action2, Action4)
}
;LV_ModifyCol(2, "Sort")
return

GuiClose:
ExitApp
return
