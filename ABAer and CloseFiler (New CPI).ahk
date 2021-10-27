/*

Created by Tyler Dickson using AutoHotkey.

*/

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
formattime, Today, ,  MM/dd/yyyy          ;  yyyy-MM-dd	
Menu, Tray, Icon, Shell32.dll, 132


StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}
if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder

IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
	
Sleep 500
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, RespAtty, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty

if RespAtty = ERROR
	RespAtty := ""


IniRead,  APIUses, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements,  APIUses
	if  APIUses = ERROR
		{
		APIUses = 0
		IniWrite, %APIUses%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements,  APIUses
		IniRead,  APIUses, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements,  APIUses
		}

	
; NEWCPI
global NewCPI

NewCPI = 1

if (NewCPI)
	{
;	#Include \\docs-oc\files\Docketing\AutoHotKey\Scripts\Chrome.ahk
;	FileCreateDir, C:\Users\Tyler.Dickson\Desktop\AHK Startup\ChromeProfile
;	FileCreateDir, ChromeProfile
	FileCreateShortcut, % "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe", %A_Desktop%\Chrome (AHK).lnk, , % "--remote-debugging-port=9222 -- '%1'", % "Test Description" ;,  IconFile, 

;	Run, %A_Desktop%\Chrome (AHK).lnk
	
	if (Chromes := Chrome.FindInstances())
		global ChromeInst := {"base": Chrome, "DebugPort": Chromes.MinIndex()}
	else
		global ChromeInst := new Chrome("ChromeProfile", "https://web05.computerpackages.com/knobbe/patent/patschcountryapplication.aspx" ) ; 	;	global ChromeInst := new Chrome("ChromeProfile", "--app=http://oc-docketing/CPi/patfrmCountryApplication.aspx?Key=1275806")
	
	global Page := ChromeInst.GetPage()
;	Page.Call("Page.navigate", {"url" : "https://web05.computerpackages.com/knobbe/patent/patschcountryapplication.aspx" })
;	Page.Call("Target.createTarget", {"url" : "https://web05bak.computerpackages.com/knobbeAgent/patent/patschcountryapplication.aspx" })
	Page.WaitForLoad()
	Page.Disconnect()
	}
	
	
Gui, New, AlwaysOnTop, ABAer/CloseFiler (New CPI)
Gui, Add, GroupBox, cBlue x5 y5 w151 h160, Update Case Status
Gui, Add, DropDownList, R9 x10 h20 y23 w140 +Center vNewStatus gNewStatus, Pre ABA|Abandoned|Pend Tran|Transferred|Directly to Transferred|Expired|Closed|Reactivate Patent Record|
Gui, Font, underline
Gui, Add, Text, +Center x10 y52 w70 , Closed Date:
Gui, Font
Gui, Add, Edit,+Center +ReadOnly x82 y48 w70 vCloseDate, 
Gui, Font, underline
Gui, Add, Text, +Center x10 y74 w70 , TranOut Date:
Gui, Font
Gui, Add, Edit,+Center  +ReadOnly x82 y70 w70 vTranOutDate, 		
Gui, Font, underline
Gui, Add, Text, +Center x10 y94 w140 , New Responsible Counsel:
Gui, Font
Gui, Add, Edit,+Center  +ReadOnly x10 y112 w140 vNewCounsel, 
Gui, Add, Button, +Center x10 y136 w140 gUpdateStatus, Update Case Status

Gui, Add, GroupBox, cBlue x5 y170 w151 h72, Docket Action
Gui, Font, underline
Gui, Add, Text, +Center x9 y191 w72 , TranOut Doc#:
Gui, Font
Gui, Add, Edit,+Center  +ReadOnly x82 y187 w69 vDocNumber, 
Gui, Add, Button, +Center x10 y213 w140 gDocketAction, Docket Action


Gui, Add, GroupBox, cBlue x5 y245 w151 h102, Close Action
Gui, Font, underline
Gui, Add, Text, +Center x9 y291 w72 , Closed Date:
Gui, Font
Gui, Add, Edit,+Center  -ReadOnly x82 y287 w70 vResponseSent, %Today%
Gui, Add, Button,+Center  x10 y313 w140 gCloseAction, Close Action

Gui, Add, GroupBox, cBlue x165 y5 w151 h160, Additional Options
Gui, Add, Button,+Center  x170 y23 w140 gOpenNewEmail, Open New *ABA Email

Gui, Add, GroupBox, cBlue x165 y170 w151 h177, Close Disclosure
Gui, Add, Button, +Center x170 y186 w140 h25  gCloseDisclosureAuto, Automatic
Gui, Add, Button, +Center x170 y313 w140 h25 gCloseDisclosureManual, Manual
Gui, Font, 
Gui, Add, Text, x170 y213 w140 h50 Center, `nNew Automatic method works 100`% of the time!
Gui, Add, Text, x170 y275 w140 h38 Center, If already on Invention screen, then click Manual. 
Gui, Add, Button,+Center  x170 y48 w140 gDocketAction2, INT-ABA CLIENT INSTR TO ABA RECVD
Gui, Font, underline
Gui, Add, Text, +Center x9 y266 w72 , Responsible:
Gui, Font
Gui, Add, Edit, Center Limit4 -Wrap Uppercase vRespAtty x82 y262 w70, %RespAtty%

Gui, Font, underline
Gui, Add, Text, +Center x10 y92 w140 , *CloseFile Reason
Gui, Font
Gui, Add, ComboBox, x10 y110 w140 vCloseRemarks, *CloseFile Reason||Client not opposing.|Different firm handling.|KMOB no longer attorney of record.|Not filing application.|Prosecution completed.|Matter concluded.|Settlement reached.|No instructions received from client|Client instructions to close.|Client went out of business.|Duplicate file.|Client handling in-house.|Conflict, not handling matter.

Gui, Add, Button, +Center x170 y136 w140 gSystemSwitch, System Switch
Gui, Add, Button, +Center x170 y122 w140 gDocketAction3, US-ABA INSTRUCTIONS PENDING

GuiControl, Hide, Static9	
GuiControl, Hide, Button8
GuiControl, Hide, Button12
GuiControl, Hide, Button13
GuiControl, Hide, Edit7
GuiControl, Hide, Button14


;Gui, Add, Button, +Center x10 y165 w130 gDuplicateAction, Duplicate Action
Gui, Show, w320 h350       ;w160
GuiControlGet,  ComboBox1Text, , ComboBox1
return

SystemSwitch:
SwitchSystem()
return

CloseRemarksButton:
Gui, Submit, NoHide
MsgBox, %CloseRemarks%
return

DocketAction2:
Gui, Submit, NoHide
WinActivate, ahk_exe chrome.exe

Page := ChromeInst.GetPage()
if InStr(Page.Evaluate("window.location.href").Value, "patfrm")
	OutputVar := "https://web05.computerpackages.com/knobbe/patent/patfrmActionDue.aspx?key=-1&appId=" GetAppID()
else
	OutputVar := "https://web05.computerpackages.com/knobbe/trademark/tmkfrmActionDue.aspx?key=-1&tmkId=" GetTmkID()	

Page.Call("Target.createTarget", {"url" : OutputVar })
Page.Disconnect()
Sleep 2000
Page := ChromeInst.GetPage()
Page.WaitForLoad()
Sleep 500
; "
GuiControlGet,  ComboBox1Text, , ComboBox1
if ComboBox1Text = Pre ABA
	{
	actionType := "INT-ABA CC OF ABA INSTR RECVD"
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = '" actionType "'; document.getElementById('ctl00_Detail_tplFormview_BaseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').focus();")
	Sleep 100
	SendInput, {Right}
	Sleep 100
	SendInput, {Space}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}	

	
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Evaluate("document.getElementById('ctl00_Detail_InsertButton_input').click();") 
	Page.Disconnect()
	return
	}
if ComboBox1Text = Abandoned
	{	
	actionType := "INT-ABA CLIENT INSTR TO ABA RECVD"
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = '" actionType "'; document.getElementById('ctl00_Detail_tplFormview_BaseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').focus();")
	Sleep 100
	SendInput, {Right}
	Sleep 100
	SendInput, {Space}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}	
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Evaluate("document.getElementById('ctl00_Detail_InsertButton_input').click();")
	Page.Disconnect()
	return
	}
if ComboBox1Text = Pend Tran
	{
	Page := ChromeInst.GetPage()
	if InStr(Page.Evaluate("window.location.href").Value, "patfrm")
		actionType := "US-PAT FD POA TRANOUT"
	else
		actionType := "US-TM FD POA TRANOUT"

	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = '" actionType "'; document.getElementById('ctl00_Detail_tplFormview_BaseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').focus();")
	Sleep 100
	SendInput, {Right}
	Sleep 100
	SendInput, {Space}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}	
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Evaluate("document.getElementById('ctl00_Detail_InsertButton_input').click();")
	Page.Disconnect()
	return
	}
if ComboBox1Text = Transferred
	{
	Page := ChromeInst.GetPage()
	if InStr(Page.Evaluate("window.location.href").Value, "patfrm")
		actionType := "US-PAT FD POA TRANOUT"
	else
		actionType := "US-TM FD POA TRANOUT"

	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = '" actionType "'; document.getElementById('ctl00_Detail_tplFormview_BaseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').focus();")
	Sleep 100
	SendInput, {Right}
	Sleep 100
	SendInput, {Space}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}	
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Evaluate("document.getElementById('ctl00_Detail_InsertButton_input').click();")
	Page.Disconnect()
	return
	}
if ComboBox1Text = Directly to Transferred
	{
	Page := ChromeInst.GetPage()
	if InStr(Page.Evaluate("window.location.href").Value, "patfrm")
		actionType := "US-PAT FD POA TRANOUT"
	else
		actionType := "US-TM FD POA TRANOUT"

	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = '" actionType "'; document.getElementById('ctl00_Detail_tplFormview_BaseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').focus();")
	Sleep 100
	SendInput, {Right}
	Sleep 100
	SendInput, {Space}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}	
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Evaluate("document.getElementById('ctl00_Detail_InsertButton_input').click();")
	Page.Disconnect()
	return
	}

Gui, Show

return

DocketAction3:
Gui, Submit, NoHide
WinActivate, ahk_exe chrome.exe

Page := ChromeInst.GetPage()
if InStr(Page.Evaluate("window.location.href").Value, "patfrm")
	OutputVar := "https://web05.computerpackages.com/knobbe/patent/patfrmActionDue.aspx?key=-1&appId=" GetAppID()
else
	OutputVar := "https://web05.computerpackages.com/knobbe/trademark/tmkfrmActionDue.aspx?key=-1&tmkId=" GetTmkID()	

Page.Call("Target.createTarget", {"url" : OutputVar })
Page.Disconnect()
Sleep 2000
Page := ChromeInst.GetPage()
Page.WaitForLoad()
Sleep 500

GuiControlGet,  ComboBox1Text, , ComboBox1
actionType := "US-ABA INSTRUCTIONS PENDING"
Page := ChromeInst.GetPage()
Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = '" actionType "'; document.getElementById('ctl00_Detail_tplFormview_BaseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
WinActivate, ahk_exe chrome.exe
Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').focus();")
Sleep 100
SendInput, {Right}
Sleep 100
SendInput, {Space}
Sleep 100
SendInput, {Tab}
Sleep 100
SendInput, {Tab}	
Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
Page.Evaluate("document.getElementById('ctl00_Detail_InsertButton_input').click();")
Page.Disconnect()
return

OpenNewEmail:
Abandonment := "Abandonment.Inbox@knobbe.com"
olMailItem := 0
o:= ComObjActive("Outlook.Application").Session()
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
MailItem.SentOnBehalfOfName := Abandonment
MailItem.Display ;Make email visible
return

DocketAction:
Gui, Submit, NoHide
if ComboBox1Text = 
	{
	MsgBox, Choose a new Status in the top field if you want to docket an action.
	Gui, Show
	return
	}
else
	{
	gosub DocketNewAction
	}
return

CloseDisclosureAuto:
Gui, Submit, NoHide
Page := ChromeInst.GetPage()

value := ""
user := "Paperboy@knobbe.com"
pass := "knobbedocket"
EndPoint1 := "https://web05.computerpackages.com/knobbews/api/Knobbe?queryString="
EndPoint2 = SELECT InvId FROM tblPatInvention WHERE CaseNumber

CCode := Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_CaseNumber').value").Value
CCode2 := Page.Evaluate("document.getElementById('ctl00_Detail_CaseNumber').value").Value

if (CCode == "")
	CCode := CCode2

EndPoint3 := "= '" CCode "';"
http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http.Open("GET", EndPoint1 . EndPoint2 . EndPoint3, true)
http.SetRequestHeader("Authorization", "Basic "  Base64Encode(user ":" pass) )
http.Send()

while (http.Responsetext == "")
	Sleep 100

value := JSON.Load(http.Responsetext)
gosub RecordAPIUses

Page.Call("Page.navigate", {"url" : "https://web05.computerpackages.com/knobbe/patent/patfrmInvention.aspx?key=" value.Table[1].InvId })
Page.WaitForLoad()
Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
Sleep 1500

GuiControlGet,  ComboBox1Text, , ComboBox1

if (ComboBox1Text == "Reactivate Patent Record")
	NewDisclosure := "Filed"
else
	NewDisclosure := "Closed"

hiddenValue = {"logEntries":[],"value":"","text":"%NewDisclosure%","enabled":true,"checkedIndices":[],"checkedItemsTextOverflows":false}
Page.Evaluate("document.getElementById('ctl00_Detail_DisclosureStatus_Input').value = '" NewDisclosure "'; document.getElementById('ctl00_Detail_DisclosureStatus_ClientState').value = '" hiddenValue "';")
Sleep 1500
Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
Page.Disconnect()
return

CloseDisclosureManual:
Gui, Submit, NoHide
Page := ChromeInst.GetPage()
Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
Sleep 1500

GuiControlGet,  ComboBox1Text, , ComboBox1

if (ComboBox1Text == "Reactivate Patent Record")
	NewDisclosure := "Filed"
else
	NewDisclosure := "Closed"

hiddenValue = {"logEntries":[],"value":"","text":"%NewDisclosure%","enabled":true,"checkedIndices":[],"checkedItemsTextOverflows":false}
Page.Evaluate("document.getElementById('ctl00_Detail_DisclosureStatus_Input').value = '" NewDisclosure "'; document.getElementById('ctl00_Detail_DisclosureStatus_ClientState').value = '" hiddenValue "';")
Sleep 1500
Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
Page.Disconnect()
return

DocketNewAction:
Gui, Submit, NoHide
WinActivate, ahk_exe chrome.exe

Page := ChromeInst.GetPage()

if InStr(Page.Evaluate("window.location.href").Value, "-1")
	goto SkipStep
else if InStr(Page.Evaluate("window.location.href").Value, "patfrm")
	{
	IsIssuedPat := Page.Evaluate("document.getElementById('ctl00_Detail_IssDate_dateInput').value").Value
	OutputVar := "https://web05.computerpackages.com/knobbe/patent/patfrmActionDue.aspx?key=-1&appId=" GetAppID()
	}
else
	OutputVar := "https://web05.computerpackages.com/knobbe/trademark/tmkfrmActionDue.aspx?key=-1&tmkId=" GetTmkID()	

Page.Call("Target.createTarget", {"url" : OutputVar })
Page.Disconnect()
Sleep 2000
Page := ChromeInst.GetPage()
Page.WaitForLoad()
Sleep 500

SkipStep:
if ComboBox1Text = Pre ABA
	{
	actionType := "INT-ABA CC OF ABA INSTR RECVD"
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = '" actionType "'; document.getElementById('ctl00_Detail_tplFormview_BaseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').focus();")
	Sleep 100
	SendInput, {Right}
	Sleep 100
	SendInput, {Space}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}	
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Evaluate("document.getElementById('ctl00_Detail_InsertButton_input').click();")
	Page.Disconnect()
	return
	}
if ComboBox1Text = Abandoned
	{
	actionType := "INT-ABA INSTRUCTIONS CONFIRMED"
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = '" actionType "'; document.getElementById('ctl00_Detail_tplFormview_ResponseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_BaseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').focus();")
	Sleep 100
	SendInput, {Right}
	Sleep 100
	SendInput, {Space}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}	
	
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Evaluate("document.getElementById('ctl00_Detail_InsertButton_input').click();")
	Page.Disconnect()
	return
	}
if ComboBox1Text = Pend Tran
	{
	Page := ChromeInst.GetPage()
	Country := Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_Country_Input').value").Value

	if InStr(Page.Evaluate("window.location.href").Value, "patfrm")
		{
		if (Country == "US")
			{
			if (IsIssuedPat != "")
				actionType := "US-PAT TRANOUT ISSUED"
			else
				actionType := "US-PAT TRANOUT PENDING"				
			}
		else if (Country == "WO")
			actionType := "INT-PAT PCT TRANOUT PENDING"	
		else		
			actionType := "INT-PAT TRANOUT PENDING"	
		}
	else
		{
		if (Country != "US")
			actionType := "INT-TM TRANOUT PENDING"
		else
			actionType := "US-TM TRANOUT"			
		}

;	if RespAtty = 
;		Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - Matter transferred out to " NewCounsel " (" DocNumber ") " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value;")
;	else
;		Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - Matter transferred out to " NewCounsel " per " RespAtty ". (" DocNumber ") " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value;")

	Page.Disconnect()
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = '" actionType "'; document.getElementById('ctl00_Detail_tplFormview_BaseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').focus();")
	Sleep 100
	SendInput, {Right}
	Sleep 100
	SendInput, {Space}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}	
	
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Evaluate("document.getElementById('ctl00_Detail_InsertButton_input').click();")
	Page.Disconnect()
	return
	}	

if ComboBox1Text = Transferred
	{
	Page := ChromeInst.GetPage()
	Country := Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_Country_Input').value").Value

	if InStr(Page.Evaluate("window.location.href").Value, "patfrm")
		{
		if (Country == "US")
			{
			if (IsIssuedPat != "")
				actionType := "US-PAT TRANOUT ISSUED"
			else
				actionType := "US-PAT TRANOUT PENDING"				
			}
		else if (Country == "WO")
			actionType := "INT-PAT PCT TRANOUT PENDING"	
		else		
			actionType := "INT-PAT TRANOUT PENDING"	
		}
	else
		{
		if (Country != "US")
			actionType := "INT-TM TRANOUT PENDING"
		else
			actionType := "US-TM TRANOUT"			
		}

;	if RespAtty = 
;		Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - Matter transferred out to " NewCounsel " (" DocNumber ") " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value;")
;	else
;		Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - Matter transferred out to " NewCounsel " per " RespAtty ". (" DocNumber ") " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value;")

	Page.Disconnect()
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = '" actionType "'; document.getElementById('ctl00_Detail_tplFormview_BaseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').focus();")
	Sleep 100
	SendInput, {Right}
	Sleep 100
	SendInput, {Space}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}	
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Evaluate("document.getElementById('ctl00_Detail_InsertButton_input').click();")
	Page.Disconnect()
	return
	}
if ComboBox1Text = Directly to Transferred
	{
	Page := ChromeInst.GetPage()
	Country := Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_Country_Input').value").Value

	if InStr(Page.Evaluate("window.location.href").Value, "patfrm")
		{
		if (Country == "US")
			{
			if (IsIssuedPat != "")
				actionType := "US-PAT TRANOUT ISSUED"
			else
				actionType := "US-PAT TRANOUT PENDING"				
			}
		else if (Country == "WO")
			actionType := "INT-PAT PCT TRANOUT PENDING"	
		else		
			actionType := "INT-PAT TRANOUT PENDING"	
		}
	else
		{
		if (Country != "US")
			actionType := "INT-TM TRANOUT PENDING"
		else
			actionType := "US-TM TRANOUT"			
		}

;	if RespAtty = 
;		Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - Matter transferred out to " NewCounsel " (" DocNumber ") " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value;")
;	else
;		Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - Matter transferred out to " NewCounsel " per " RespAtty ". (" DocNumber ") " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value;")

	Page.Disconnect()
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = '" actionType "'; document.getElementById('ctl00_Detail_tplFormview_BaseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').focus();")
	Sleep 100
	SendInput, {Right}
	Sleep 100
	SendInput, {Space}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}	
	
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Evaluate("document.getElementById('ctl00_Detail_InsertButton_input').click();")
	Page.Disconnect()
	return
	}
Sleep 100
RespAtty := ""
NewRemarks := ""
return

NewStatus:
GuiControlGet,  ComboBox1Text, , ComboBox1
	if ComboBox1Text = Pre ABA
		{
		GuiControl, , Edit1, 	         ;Closed Date
		GuiControl, +ReadOnly, Edit1
		GuiControl, , Edit2,             ;TranOut Date
		GuiControl, +ReadOnly, Edit2
		GuiControl, , Edit3,             ;TranOut LC
		GuiControl, +ReadOnly, Edit3
		GuiControl, , Edit4,             ;TranOut LC
		GuiControl, +ReadOnly, Edit4
		GuiControl, Hide, Edit1
		GuiControl, Hide, Static1
		GuiControl, Hide, Edit2
		GuiControl, Hide, Static2
		GuiControl, Hide, Edit3
		GuiControl, Hide, Static3
		GuiControl, Hide, Edit4
		GuiControl, Hide, Static4
		GuiControl, Show, Button4
		GuiControl, Show, Button6
		GuiControl, Show, Button8
		GuiControl, , Button12, INT-ABA CLIENT INSTR TO ABA RECVD
		GuiControl, Show, Button12

		GuiControl, Hide, Static9	
		GuiControl, Hide, Button13
		GuiControl, Show, Button14	
		GuiControl, Hide, Edit7
		
		GuiControl, Show, Edit5	
		GuiControl, Show, Static5	
		
		GuiControl, Show, Edit6
		GuiControl, Show, Static8
		
		GuiControl, , Button9, Close Disclosure
		GuiControl, , Static6, `nNew Automatic method works 100`% of the time!
		
		;GuiControl, , Edit5,  %Today%    ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
	if ComboBox1Text = ABA Intent (Qualcomm)
		{
		GuiControl, , Edit1, 	         ;Closed Date
		GuiControl, +ReadOnly, Edit1
		GuiControl, , Edit2,             ;TranOut Date
		GuiControl, +ReadOnly, Edit2
		GuiControl, , Edit3,             ;TranOut LC
		GuiControl, +ReadOnly, Edit3
		GuiControl, , Edit4,             ;TranOut LC
		GuiControl, +ReadOnly, Edit4
		GuiControl, Hide, Edit1
		GuiControl, Hide, Static1
		GuiControl, Hide, Edit2
		GuiControl, Hide, Static2
		GuiControl, Hide, Edit3
		GuiControl, Hide, Static3
		GuiControl, Hide, Edit4
		GuiControl, Hide, Static4
		GuiControl, Show, Button4
		GuiControl, Show, Button6
		GuiControl, Show, Button8
		GuiControl, , Button12, INT-ABA CLIENT INSTR TO ABA RECVD
		GuiControl, Show, Button12
	
		GuiControl, Hide, Static9		
		GuiControl, Hide, Button13
		GuiControl, Hide, Button14	
		GuiControl, Hide, Edit7

		GuiControl, Show, Edit5	
		GuiControl, Show, Static5	

		GuiControl, Show, Edit6
		GuiControl, Show, Static8
		
		GuiControl, , Button9, Close Disclosure
		GuiControl, , Static6, `nNew Automatic method works 100`% of the time!
		
		;GuiControl, , Edit5,  %Today%    ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
	if ComboBox1Text = Abandoned
		{
		GuiControl, , Edit1,  %Today%    ;Closed Date
		GuiControl, -ReadOnly, Edit1
		GuiControl, , Edit2,             ;TranOut Date
		GuiControl, +ReadOnly, Edit2
		GuiControl, , Edit3,             ;TranOut LC
		GuiControl, +ReadOnly, Edit3
		GuiControl, , Edit4,             ;TranOut LC
		GuiControl, +ReadOnly, Edit4
		GuiControl, Show, Edit1
		GuiControl, Show, Static1
		GuiControl, Hide, Edit2
		GuiControl, Hide, Static2
		GuiControl, Hide, Edit3
		GuiControl, Hide, Static3
		GuiControl, Hide, Edit4
		GuiControl, Hide, Static4
		GuiControl, Show, Button4
		GuiControl, Show, Button6
		GuiControl, Show, Button8
		GuiControl, Hide, Button12

		GuiControl, Hide, Static9			
		GuiControl, Hide, Button13
		GuiControl, Hide, Button14	
		GuiControl, Hide, Edit7

		GuiControl, Show, Edit5	
		GuiControl, Show, Static5	
		
		GuiControl, Show, Edit6
		GuiControl, Show, Static8
		
		GuiControl, , Button9, Close Disclosure
		GuiControl, , Static6, `nNew Automatic method works 100`% of the time!
		
		;GuiControl, , Edit5,  %Today%            ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
	if ComboBox1Text = Pend Tran
		{
		GuiControl, , Edit1,     	  	 ;Closed Date
		GuiControl, +ReadOnly, Edit1
		GuiControl, , Edit2,  %Today% 	 ;TranOut Date
		GuiControl, -ReadOnly, Edit2
		;GuiControl, , Edit3,             ;TranOut LC
		GuiControl, -ReadOnly, Edit3
		;GuiControl, , Edit4,             ;TranOut LC
		GuiControl, -ReadOnly, Edit4
		GuiControl, Hide, Edit1
		GuiControl, Hide, Static1
		GuiControl, Show, Edit2
		GuiControl, Show, Static2
		GuiControl, Show, Edit3
		GuiControl, Show, Static3
		GuiControl, Show, Edit4
		GuiControl, Show, Static4
		GuiControl, Show, Button4
		GuiControl, Show, Button6
		GuiControl, Hide, Button8
		GuiControl, , Button12, US-* FD POA TRANOUT
		GuiControl, Show, Button12

		

		GuiControl, Hide, Static9			
		GuiControl, Hide, Button13
		GuiControl, Hide, Button14	
		GuiControl, Hide, Edit7

		GuiControl, Show, Edit5	
		GuiControl, Show, Static5	
		
		GuiControl, Show, Edit6
		GuiControl, Show, Static8
		
		GuiControl, , Button9, Close Disclosure
		GuiControl, , Static6, `nNew Automatic method works 100`% of the time!
		
		;GuiControl, , Edit5,  %Today%            ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
	if ComboBox1Text = Transferred
		{
		GuiControl, , Edit1,  %Today%    ;Closed Date
		GuiControl, -ReadOnly, Edit1
		GuiControl, , Edit2,      		 ;TranOut Date
		GuiControl, -ReadOnly, Edit2
		;GuiControl, , Edit3,             ;TranOut LC
		GuiControl, -ReadOnly, Edit3
		;GuiControl, , Edit4,             ;TranOut LC
		GuiControl, -ReadOnly, Edit4
		GuiControl, Show, Edit1
		GuiControl, Show, Static1
		GuiControl, Hide, Edit2
		GuiControl, Hide, Static2
		GuiControl, Show, Edit3
		GuiControl, Show, Static3
		GuiControl, Show, Edit4
		GuiControl, Show, Static4
		GuiControl, Show, Button4
		GuiControl, Show, Button6
		GuiControl, Hide, Button8
		GuiControl, , Button12, US-* FD POA TRANOUT
		GuiControl, Show, Button12


		GuiControl, Hide, Static9			
		GuiControl, Hide, Button13
		GuiControl, Hide, Button14	
		GuiControl, Hide, Edit7
		
		GuiControl, Show, Edit5	
		GuiControl, Show, Static5	

		GuiControl, Show, Edit6
		GuiControl, Show, Static8
		
		GuiControl, , Button9, Close Disclosure
		GuiControl, , Static6, `nNew Automatic method works 100`% of the time!
		
		;GuiControl, , Edit5,  %Today%           ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
	if ComboBox1Text = Expired
		{
		GuiControl, , Edit1,  %Today%    ;Closed Date
		GuiControl, -ReadOnly, Edit1
		GuiControl, , Edit2,      		 ;TranOut Date
		GuiControl, +ReadOnly, Edit2
		GuiControl, , Edit3,             ;TranOut LC
		GuiControl, +ReadOnly, Edit3
		GuiControl, , Edit4,             ;TranOut LC
		GuiControl, +ReadOnly, Edit4
		GuiControl, Show, Edit1
		GuiControl, Show, Static1
		GuiControl, Hide, Edit2
		GuiControl, Hide, Static2
		GuiControl, Hide, Edit3
		GuiControl, Hide, Static3
		GuiControl, Hide, Edit4
		GuiControl, Hide, Static4
		GuiControl, Hide, Button4
		GuiControl, Show, Button6
		GuiControl, Hide, Button8
		GuiControl, Hide, Button12

		GuiControl, Hide, Static9	
		GuiControl, Hide, Button13
		GuiControl, Hide, Button14	
		GuiControl, Hide, Edit7

		GuiControl, Show, Edit5	
		GuiControl, Show, Static5	
		
		GuiControl, Show, Edit6
		GuiControl, Show, Static8

		GuiControl, , Button9, Close Disclosure
		GuiControl, , Static6, `nNew Automatic method works 100`% of the time!
		
		;GuiControl, , Edit5,  %Today%           ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
	if ComboBox1Text = Closed
		{
		GuiControl, , Edit1,  %Today%    ;Closed Date
		GuiControl, -ReadOnly, Edit1
		GuiControl, , Edit2,      		 ;TranOut Date
		GuiControl, +ReadOnly, Edit2
		GuiControl, , Edit3,             ;TranOut LC
		GuiControl, +ReadOnly, Edit3
		GuiControl, , Edit4,             ;TranOut LC
		GuiControl, +ReadOnly, Edit4
		GuiControl, Show, Edit1
		GuiControl, Show, Static1
		GuiControl, Hide, Edit2
		GuiControl, Hide, Static2
		GuiControl, Hide, Edit3
		GuiControl, Hide, Static3
		GuiControl, Hide, Edit4
		GuiControl, Hide, Static4
		GuiControl, Hide, Button4
		GuiControl, Show, Button6
		GuiControl, Hide, Button8
		GuiControl, Hide, Button12
		
		GuiControl, Show, Static9		
		GuiControl, Show, Button13
		GuiControl, Hide, Button14	
		GuiControl, Show, Edit7
		
		GuiControl, Show, Edit5	
		GuiControl, Show, Static5	

		GuiControl, Show, Edit6
		GuiControl, Show, Static8	
		
		GuiControl, , Button9, Close Disclosure
		GuiControl, , Static6, `nNew Automatic method works 100`% of the time!
	
		;GuiControl, , Edit5,  %Today%           ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
	if ComboBox1Text = Reactivate Patent Record
		{
		GuiControl, , Edit1, 	         ;Closed Date
		GuiControl, +ReadOnly, Edit1
		GuiControl, , Edit2,             ;TranOut Date
		GuiControl, +ReadOnly, Edit2
		GuiControl, , Edit3,             ;TranOut LC
		GuiControl, +ReadOnly, Edit3
		GuiControl, , Edit4,             ;TranOut LC
		GuiControl, +ReadOnly, Edit4
		GuiControl, Hide, Edit1
		GuiControl, Hide, Static1
		GuiControl, Hide, Edit2
		GuiControl, Hide, Static2
		GuiControl, Hide, Edit3
		GuiControl, Hide, Static3
		GuiControl, Hide, Edit4
		GuiControl, Hide, Static4
		GuiControl, Hide, Button4
		GuiControl, Hide, Button6
		GuiControl, Hide, Button8
		GuiControl, , Button12, INT-ABA CLIENT INSTR TO ABA RECVD
		GuiControl, Hide, Button12

		GuiControl, Hide, Static9	
		GuiControl, Hide, Button13
		GuiControl, Hide, Button14	
		GuiControl, Hide, Edit7

		GuiControl, Hide, Edit5	
		GuiControl, Hide, Static5		

		GuiControl, Hide, Edit6
		GuiControl, Hide, Static8			
		
		GuiControl, , Button9, Reopen Disclosure
		GuiControl, , Static6, `nNew Automatic method works 100`% of the time!
		
		;GuiControl, , Edit5,  %Today%    ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
	if ComboBox1Text = Directly to Transferred
		{
		GuiControl, , Edit1,     	  	 ;Closed Date
		GuiControl, +ReadOnly, Edit1
		GuiControl, , Edit2,  %Today% 	 ;TranOut Date
		GuiControl, -ReadOnly, Edit2
		;GuiControl, , Edit3,             ;TranOut LC
		GuiControl, -ReadOnly, Edit3
		;GuiControl, , Edit4,             ;TranOut LC
		GuiControl, -ReadOnly, Edit4
		GuiControl, Hide, Edit1
		GuiControl, Hide, Static1
		GuiControl, Show, Edit2
		GuiControl, Show, Static2
		GuiControl, Show, Edit3
		GuiControl, Show, Static3
		GuiControl, Show, Edit4
		GuiControl, Show, Static4
		GuiControl, Show, Button4
		GuiControl, Show, Button6
		GuiControl, Hide, Button8
		GuiControl, , Button12, US-* FD POA TRANOUT
		GuiControl, Show, Button12

		

		GuiControl, Hide, Static9			
		GuiControl, Hide, Button13
		GuiControl, Hide, Button14	
		GuiControl, Hide, Edit7

		GuiControl, Show, Edit5	
		GuiControl, Show, Static5	
		
		GuiControl, Show, Edit6
		GuiControl, Show, Static8
		
		GuiControl, , Button9, Close Disclosure
		GuiControl, , Static6, `nNew Automatic method works 100`% of the time! 
		
		;GuiControl, , Edit5,  %Today%            ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
return

ModifiedSwitchSystem2() {


}

CopyAction:

return

CloseAction:
Gui, Submit, NoHide
;Gui, Hide
GuiControlGet,  ComboBox1Text, , ComboBox1
IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username

if ComboBox1Text = 
	{
	TrayTip, No Case Status Selected, Choose a new Status in the top field if you want to auto-add remarks.
	Gui, Show
	Sleep 2000
	TrayTIp
	return
	}
if ComboBox1Text = Pre ABA
	{
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
	Sleep 2000
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ResponseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100		
	Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - Case going abandoned per " RespAtty ". " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value; document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Disconnect()
	return
	}
if ComboBox1Text = Abandoned
	{
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
	Sleep 2000
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ResponseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100		
	Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - Case going abandoned per " RespAtty ". " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value; document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Disconnect()
	return
	}
if ComboBox1Text = Pend Tran
	{
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
	Sleep 2000
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ResponseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100		
	
	if RespAtty = 
		Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - Matter transferred out to " NewCounsel " (" DocNumber ") " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value;")
	else
		Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - Matter transferred out to " NewCounsel " per " RespAtty ". (" DocNumber ") " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value;")

	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Disconnect()
	return
	}
if ComboBox1Text = Transferred
	{
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
	Sleep 2000
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ResponseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100		
	Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - Confirmation of transfer received. (" DocNumber ") " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value;")
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Disconnect()
	return
	}
if ComboBox1Text = Directly to Transferred
	{
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
	Sleep 2000
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ResponseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100		
	
	if RespAtty = 
		Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - Matter transferred out to " NewCounsel " (" DocNumber ") " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value;")
	else
		Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - Matter transferred out to " NewCounsel " per " RespAtty ". (" DocNumber ") " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value;")

	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Disconnect()
	return
	}
if ComboBox1Text = Expired
	{
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
	Sleep 2000
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ResponseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100		
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Disconnect()
	return
	}	
if ComboBox1Text = Closed
	{
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
	Sleep 2000
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ResponseDate_dateInput').value = '" ResponseSent "'; document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100		
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Disconnect()
	return
	}	
return

UpdateStatus:
Gui, Submit, NoHide
GuiControlGet,  ComboBox1Text, , ComboBox1
IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
IniRead, ATPartner, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATPartner
IniRead, ATDate, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATDate


Sleep 250
if ComboBox1Text = 
	{
	MsgBox, No status selected. Please select a new status and try again.
	}
if ComboBox1Text = Pre ABA
	{
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
	Sleep 2000
	hiddenValue = {"logEntries":[],"value":"15","text":"%NewStatus%","enabled":true,"checkedIndices":[],"checkedItemsTextOverflows":false}
	Page.Evaluate("document.getElementById('ctl00_Detail_ApplicationStatus_Input').value = '" NewStatus "'; document.getElementById('ctl00_Detail_ApplicationStatus_ClientState').value = '" hiddenValue "';")
	Sleep 500
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Disconnect()	
	}
if ComboBox1Text = Abandoned
	{
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
	Sleep 2000
	Page.Evaluate("document.getElementById('ctl00_Detail_ApplicationStatus_Input').value = '" NewStatus "';")
	hiddenValue = {"logEntries":[],"value":"1","text":"%NewStatus%","enabled":true,"checkedIndices":[],"checkedItemsTextOverflows":false}
	Page.Evaluate("document.getElementById('ctl00_Detail_ApplicationStatus_ClientState').value = '" hiddenValue "';")
	Sleep 500
	newYear := SubStr(CloseDate, -3, 4)
	newMonth := SubStr(CloseDate, 1, 2)
	newDay := SubStr(CloseDate, 4, 2)
	newDate := newYear "-" newMonth "-" newDay
	Page.Evaluate("document.getElementById('ctl00_Detail_ClosedDate_dateInput').value = '" CloseDate "';")
	hiddenValue2 = {"enabled":true,"emptyMessage":"","validationText":"%newDate%-00-00-00","valueAsString":"%newDate%-00-00-00","minDateStr":"1000-01-01-00-00-00","maxDateStr":"9999-12-31-00-00-00","lastSetTextBoxValue":"%CloseDate%"}
	Page.Evaluate("document.getElementById('ctl00_Detail_ClosedDate_dateInput_ClientState').value = '" hiddenValue2 "';")
	Sleep 500
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Disconnect()
	}
if ComboBox1Text = Reactivate Patent Record
	{		
	Page := ChromeInst.GetPage()
	IsFiledPat := Page.Evaluate("document.getElementById('ctl00_Detail_FilDate_dateInput').value").Value
	IsPublishedPat := Page.Evaluate("document.getElementById('ctl00_Detail_PubDate_dateInput').value").Value
	IsIssuedPat := Page.Evaluate("document.getElementById('ctl00_Detail_IssDate_dateInput').value").Value

	Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
	Sleep 2000		
	
	if (IsIssuedPat != "")
		{
		NewStatus := "Issued" 		; For Patent.
		hiddenValue = {"logEntries":[],"value":"24","text":"%NewStatus%","enabled":true,"checkedIndices":[],"checkedItemsTextOverflows":false}
		}
	else if (IsPublishedPat != "")
		{
		NewStatus := "Published" 		; For Patent.	
		hiddenValue = {"logEntries":[],"value":"9","text":"%NewStatus%","enabled":true,"checkedIndices":[],"checkedItemsTextOverflows":false}
		}
	else if (IsFiledPat != "")
		{
		NewStatus := "Pending"   		; For Patent.				
		hiddenValue = {"logEntries":[],"value":"8","text":"%NewStatus%","enabled":true,"checkedIndices":[],"checkedItemsTextOverflows":false}
		}
	Page.Evaluate("document.getElementById('ctl00_Detail_ApplicationStatus_Input').value = '" NewStatus "'; document.getElementById('ctl00_Detail_ApplicationStatus_ClientState').value = '" hiddenValue "';")
	Page.Evaluate("document.getElementById('ctl00_Detail_ClosedDate_dateInput').value = '';")
	Sleep 500
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Disconnect()
	}		
if ComboBox1Text = Pend Tran
	{
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
	Sleep 2000
	newYear := SubStr(TranOutDate, -3, 4)
	newMonth := SubStr(TranOutDate, 1, 2)
	newDay := SubStr(TranOutDate, 4, 2)
	newDate := newYear "-" newMonth "-" newDay
	Page.Evaluate("document.getElementById('ctl00_Detail_TranOutDate_dateInput').value = '" TranOutDate "';")
	hiddenValue2 = {"enabled":true,"emptyMessage":"","validationText":"%newDate%-00-00-00","valueAsString":"%newDate%-00-00-00","minDateStr":"1000-01-01-00-00-00","maxDateStr":"9999-12-31-00-00-00","lastSetTextBoxValue":"%TranOutDate%"}
	Page.Evaluate("document.getElementById('ctl00_Detail_TranOutDate_dateInput_ClientState').value = '" hiddenValue2 "';")
	Sleep 500
	Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - Matter transferred out to " NewCounsel " (" DocNumber ") " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value; document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Disconnect()	
	}	
if ComboBox1Text = Transferred
	{
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
	Sleep 2000
	newYear := SubStr(CloseDate, -3, 4)
	newMonth := SubStr(CloseDate, 1, 2)
	newDay := SubStr(CloseDate, 4, 2)
	newDate := newYear "-" newMonth "-" newDay
	Page.Evaluate("document.getElementById('ctl00_Detail_ClosedDate_dateInput').value = '" CloseDate "';")
	hiddenValue2 = {"enabled":true,"emptyMessage":"","validationText":"%newDate%-00-00-00","valueAsString":"%newDate%-00-00-00","minDateStr":"1000-01-01-00-00-00","maxDateStr":"9999-12-31-00-00-00","lastSetTextBoxValue":"%CloseDate%"}
	Page.Evaluate("document.getElementById('ctl00_Detail_ClosedDate_dateInput_ClientState').value = '" hiddenValue2 "';")
	Sleep 500
	Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - Confirmation of transfer received. (" DocNumber ") " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value; document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Disconnect()	
	}	
if ComboBox1Text = Directly to Transferred
	{
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
	Sleep 2000
	newYear := SubStr(TranOutDate, -3, 4)
	newMonth := SubStr(TranOutDate, 1, 2)
	newDay := SubStr(TranOutDate, 4, 2)
	newDate := newYear "-" newMonth "-" newDay
	Page.Evaluate("document.getElementById('ctl00_Detail_ClosedDate_dateInput').value = '" TranOutDate "';")
	hiddenValue2 = {"enabled":true,"emptyMessage":"","validationText":"%newDate%-00-00-00","valueAsString":"%newDate%-00-00-00","minDateStr":"1000-01-01-00-00-00","maxDateStr":"9999-12-31-00-00-00","lastSetTextBoxValue":"%TranOutDate%"}
	Page.Evaluate("document.getElementById('ctl00_Detail_ClosedDate_dateInput_ClientState').value = '" hiddenValue2 "';")
	Page.Disconnect()	
	Page := ChromeInst.GetPage()		
	Page.Evaluate("document.getElementById('ctl00_Detail_TranOutDate_dateInput').value = '" TranOutDate "';")
	hiddenValue3 = {"enabled":true,"emptyMessage":"","validationText":"%newDate%-00-00-00","valueAsString":"%newDate%-00-00-00","minDateStr":"1000-01-01-00-00-00","maxDateStr":"9999-12-31-00-00-00","lastSetTextBoxValue":"%TranOutDate%"}
	Page.Evaluate("document.getElementById('ctl00_Detail_TranOutDate_dateInput_ClientState').value = '" hiddenValue3 "';")
	Sleep 500
	Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - Confirmation of transfer received. (" DocNumber ") " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value; document.getElementById('ctl00_Detail_UpdateButton_input').click();")

	Page.Disconnect()		
	}
if ComboBox1Text = Expired
	{
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
	Sleep 2000
	Page.Evaluate("document.getElementById('ctl00_Detail_ApplicationStatus_Input').value = '" NewStatus "';")
	hiddenValue = {"logEntries":[],"value":"1","text":"%NewStatus%","enabled":true,"checkedIndices":[],"checkedItemsTextOverflows":false}
	Page.Evaluate("document.getElementById('ctl00_Detail_ApplicationStatus_ClientState').value = '" hiddenValue "';")
	Sleep 500
	newYear := SubStr(CloseDate, -3, 4)
	newMonth := SubStr(CloseDate, 1, 2)
	newDay := SubStr(CloseDate, 4, 2)
	newDate := newYear "-" newMonth "-" newDay
	Page.Evaluate("document.getElementById('ctl00_Detail_ClosedDate_dateInput').value = '" CloseDate "';")
	hiddenValue2 = {"enabled":true,"emptyMessage":"","validationText":"%newDate%-00-00-00","valueAsString":"%newDate%-00-00-00","minDateStr":"1000-01-01-00-00-00","maxDateStr":"9999-12-31-00-00-00","lastSetTextBoxValue":"%CloseDate%"}
	Page.Evaluate("document.getElementById('ctl00_Detail_ClosedDate_dateInput_ClientState').value = '" hiddenValue2 "';")
	Sleep 500
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Disconnect()
	}
if ComboBox1Text = Closed
	{
	Page := ChromeInst.GetPage()
	Page.Evaluate("document.getElementById('ctl00_Detail_EditButton_input').click();")
	Sleep 2000
	Page.Evaluate("document.getElementById('ctl00_Detail_ApplicationStatus_Input').value = '" NewStatus "';")
	hiddenValue = {"logEntries":[],"value":"1","text":"%NewStatus%","enabled":true,"checkedIndices":[],"checkedItemsTextOverflows":false}
	Page.Evaluate("document.getElementById('ctl00_Detail_ApplicationStatus_ClientState').value = '" hiddenValue "';")
	Sleep 500
	newYear := SubStr(CloseDate, -3, 4)
	newMonth := SubStr(CloseDate, 1, 2)
	newDay := SubStr(CloseDate, 4, 2)
	newDate := newYear "-" newMonth "-" newDay
	Page.Evaluate("document.getElementById('ctl00_Detail_ClosedDate_dateInput').value = '" CloseDate "';")
	hiddenValue2 = {"enabled":true,"emptyMessage":"","validationText":"%newDate%-00-00-00","valueAsString":"%newDate%-00-00-00","minDateStr":"1000-01-01-00-00-00","maxDateStr":"9999-12-31-00-00-00","lastSetTextBoxValue":"%CloseDate%"}
	Page.Evaluate("document.getElementById('ctl00_Detail_ClosedDate_dateInput_ClientState').value = '" hiddenValue2 "';")
	Sleep 500
	Page.Evaluate("document.getElementById('ctl00_Detail_Remarks').value = '" ResponseSent " - " CloseRemarks " " Username "\r\n' + document.getElementById('ctl00_Detail_Remarks').value; document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Evaluate("document.getElementById('ctl00_Detail_UpdateButton_input').click();")
	Page.Disconnect()
	}
return

GuiClose:
ExitApp
return

/* 
#v::
ie := ""
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
Country :=  ie.document.getElementByID("fldstrCountry_TextBox").Value
AppNumber :=  ie.document.getElementByID("fldstrAppNumber").Value
	StringReplace, AppNumber, AppNumber, EP, , 
PubNumber := ie.document.getElementByID("fldstrPubNumber").Value
EPAppNumber := "EP" . AppNumber
StringLeft, FirstEight, AppNumber, 8
EPFirstEight := "EP" . FirstEight
EPPubNumber := "EP" . PubNumber
Sleep 500
if Country = AT
	{
	OutputVar := "http://seeip.patentamt.at/EPatentSuche/EPRegister/" PubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = CZ
	{
	OutputVar := "http://isdv.upv.cz/portal/pls/portal/portlets.pta.det?pskup=5&pciod=" PubNumber "&plang=en"
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = LT
	{
	OutputVar := "http://www.vpb.lt/db_eu_patentai/rezult-singl.php?db=vpb_europat&extidpatent=" PubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = RO
	{
	OutputVar := "http://rnb.osim.ro/?pn=" PubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = SI
	{
	OutputVar := "http://www2.uil-sipo.si/ds1.htm?A=107100&Q=PN%3D" PubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = SK
	{
	OutputVar := "http://www.upv.sk/patentView/?id=" PubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = BE
	{
	OutputVar := "http://bpp.economie.fgov.be/fo-eregister-view/application?lng=fr&number=" EPPubNumber "&table=EInvention"
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = CH
	{
	OutputVar := "https://www.swissreg.ch/srclient/en/pat/" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = FR
	{
	OutputVar := "http://bases-brevets.inpi.fr/en/document-en/" EPPubNumber ".html"	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = GB
	{
	OutputVar := "http://www.ipo.gov.uk/p-ipsum/Case/PublicationNumber/" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = GR
	{
	OutputVar := "http://www.obi.gr/dl/emtservice/regviewer_pn?pn=" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = IS
	{
	OutputVar := "http://els.is/einkaleyfi/leit-i-gagnabonkum?application-number=" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = IT
	{
	OutputVar := "http://www.uibm.gov.it/uibm/dati/Tmview.aspx?load=espacenet&PubblicationNumber=" EPPubNumber "&table=EInvention"	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = LU
	{
	OutputVar := "http://patent.public.lu/fo-eregister-view/application?lng=en&number=" EPPubNumber	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = NL
	{
	OutputVar := "http://mijnoctrooi.rvo.nl/fo-eregister-view/application?lng=en&number=" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = PT
	{
	OutputVar := "http://servicosonline.inpi.pt/pesquisas/main/patentesdirecto.jsp?lang=en&fpubnumber=" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = TR
	{
	OutputVar := "http://online.turkpatent.gov.tr/EPATENT/epo_search.jsp?param=" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = SE
	{
	OutputVar := "http://was.prv.se/spd/ep/an/" FirstEight	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = BG
	{
	OutputVar := "https://portal.bpo.bg/en/rd?epo_key=" EPFirstEight
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = PL
	{
	OutputVar := "http://regserv.uprp.pl/register/application?number=" EPFirstEight "&lng=en"	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = ES
	{
	EFirstEight := "E" . FirstEight
	OutputVar := "http://sitadex.oepm.es/SitadexWS/index.jsp?numExp=" EFirstEight ; E04753697
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = HU
	{
	EFirstEight := "E" . FirstEight
	OutputVar := "http://epub.hpo.hu/e-kutatas/index.html?lang=en&service=ADATLAP&appId=" EFirstEight	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = DK
	{
	OutputVar := "http://onlineweb.dkpto.dk/pvsonline/Patent?action=102&language=gb&sagID=" AppNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = IE
	{
	OutputVar := "https://eregister.patentsoffice.ie/register/PTRegister.aspx?idappli=" AppNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = EE
	{
	OutputVar := "http://www1.epa.ee/ep/data.asp?NroParam=" EPAppNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = FI
	{
	OutputVar := "http://patent.prh.fi/FiEp/tiedot.asp?NroParam=" EPAppNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = DE
	{
	EAppNumber := "E" . AppNumber
	StringReplace, ENoPeriod, EAppNumber, ., , 
	OutputVar := "http://register.dpma.de/DPMAregister/pat/register?lang=en&AKZ=" ENoPeriod ; E047536974 
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
	
if Country = CY
	gosub NoWebsite
if Country = LI
	gosub NoWebsite
if Country = LV
	gosub NoWebsite
if Country = AL
	gosub NoWebsite	
if Country = BA
	gosub NoWebsite	
if Country = HR
	gosub NoWebsite
if Country = ME
	gosub NoWebsite
if Country = MK
	gosub NoWebsite
if Country = MT
	gosub NoWebsite
if Country = RS
	gosub NoWebsite
if Country = SM
	gosub NoWebsite
	
if Country = EP
	{
	Gui, New, , Where on the EPO website do you want to go?
	Gui, Add, Button, gOption1, About This File
	Gui, Add, Button, gOption1, Federated Register	
	Gui, Add, Button, gOption1, All Documents	
	Gui, Show, NoActivate
	Gui, Flash
	return
	}
else
	MsgBox, , Not on an EP or Validation record., You aren't on an EP or Validation record.`n`nCheck your Client Code and try again.
return

NoWebsite:
MsgBox, , No website information., No website information available.`n`nKnow the right website? Let Tyler know.
return

Option1:
Gui, Submit, NoHide
if A_GuiControl = About This File
	{
	OutputVar := "https://register.epo.org/application?number=" EPFirstEight "&lng=en&tab=main"
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if A_GuiControl = Federated Register
	{
	OutputVar := "https://register.epo.org/application?number=" EPFirstEight "&lng=en&tab=federated"
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if A_GuiControl = All Documents
	{
	OutputVar := "https://register.epo.org/application?number=" EPFirstEight "&lng=en&tab=doclist"
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
return
*/

SwitchSystem()
{
	Page := ChromeInst.GetPage()
	SystemSwitch(Page.Evaluate("window.location.href").Value) 
	SendInput {Ctrl up}
	Page.Disconnect()
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

/*
###############################################################################################################
######                                      ADOSQL v5.04L - By [VxE]                                     ######
###############################################################################################################

	Wraps the utility of ADODB to connect to a database, submit a query, and read the resulting recordset.
	Returns the result as a new object (or array of objects, if the query has multiple statements).
	To instead have this function return a string, include a delimiter option in the connection string.

	For AHK-L (v1.1 or later).
	Freely available @ http://www.autohotkey.com/community/viewtopic.php?p=558323#p558323

	IMPORTANT! Before you can use this library, you must have access to a database AND know the connection
	string to connect to your database.

	Varieties of databases will have different connection string formats, and different drivers (providers).
	Use the mighty internet to discover the connection string format and driver for your type of database.

	Example connection string for SQLServer (2005) listening on port 1234 and with a static IP:
	DRIVER={SQL SERVER};SERVER=192.168.0.12,1234\SQLEXPRESS;DATABASE=mydb;UID=admin;PWD=12345;APP=AHK
*/

Global ADOSQL_LastError, ADOSQL_LastQuery ; These super-globals are for debugging your SQL queries.


ADOSQL(Query_Statement) {
; Uses an ADODB object to connect to a database, submit a query and read the resulting recordset.
; By default, this function returns an object. If the query generates exactly one result set, the object is
; a 2-dimensional array containing that result (the first row contains the column names). Otherwise, the
; returned object is an array of all the results. To instead have this function return a string, append either
; ";RowDelim=`n" or ";ColDelim=`t" to the connection string (substitute your preferences for "`n" and "`t").
; If there is more than one table in the output string, they are separated by 3 consecutive row-delimiters.
; ErrorLevel is set to "Error" if ADODB is not available, or the COM error code if a COM error is encountered.
; Otherwise ErrorLevel is set to zero.

Connection_String := "Provider=sqloledb;Data Source=DB-Portal;Initial Catalog=KMOBPortal;Integrated Security=SSPI;"

coer := "", txtout := 0, rd := "`n", cd := "CSV", str := Connection_String ; 'str' is shorter.

; Examine the connection string for output formatting options.
	If ( 9 < oTbl := 9 + InStr( ";" str, ";RowDelim=" ) )
	{
		rd := SubStr( str, oTbl, 0 - oTbl + oRow := InStr( str ";", ";", 0, oTbl ) )
		str := SubStr( str, 1, oTbl - 11 ) SubStr( str, oRow )
		txtout := 1
	}
	If ( 9 < oTbl := 9 + InStr( ";" str, ";ColDelim=" ) )
	{
		cd := SubStr( str, oTbl, 0 - oTbl + oRow := InStr( str ";", ";", 0, oTbl ) )
		str := SubStr( str, 1, oTbl - 11 ) SubStr( str, oRow )
		txtout := 1
	}

	;ComObjError( 0 ) ; We'll manage COM errors manually.

; Create a connection object. > http://www.w3schools.com/ado/ado_ref_connection.asp
; If something goes wrong here, return blank and set the error message.
	If !( oCon := ComObjCreate( "ADODB.Connection" ) )
		Return "", ComObjError( 1 ), ErrorLevel := "Error"
		, ADOSQL_LastError := "Fatal Error: ADODB is not available."


	oCon.ConnectionTimeout := 3 ; Allow 3 seconds to connect to the server.
	oCon.CursorLocation := 3 ; Use a client-side cursor server.
	oCon.CommandTimeout := 900 ; A generous 15 minute timeout on the actual SQL statement.
	oCon.Open( str ) ; open the connection.

; Execute the query statement and get the recordset. > http://www.w3schools.com/ado/ado_ref_recordset.asp
	If !( coer := A_LastError )
		oRec := oCon.execute( ADOSQL_LastQuery := Query_Statement )

	If !( coer := A_LastError ) ; The query executed OK, so examine the recordsets.
	{
		o3DA := [] ; This is a 3-dimensional array.
		While IsObject( oRec )
			If !oRec.State ; Recordset.State is zero if the recordset is closed, so we skip it.
				oRec := oRec.NextRecordset()
			Else ; A row-returning operation returns an open recordset
			{
				oFld := oRec.Fields
				o3DA.Insert( oTbl := [] )
				oTbl.Insert( oRow := [] )

				Loop % cols := oFld.Count ; Put the column names in the first row.
					oRow[ A_Index ] := oFld.Item( A_Index - 1 ).Name

				While !oRec.EOF ; While the record pointer is not at the end of the recordset...
				{
					oTbl.Insert( oRow := [] )
					oRow.SetCapacity( cols ) ; Might improve performance on huge tables??
					Loop % cols
						oRow[ A_Index ] := oFld.Item( A_Index - 1 ).Value	
					oRec.MoveNext() ; move the record pointer to the next row of values
				}

				oRec := oRec.NextRecordset() ; Get the next recordset.
			}

		If (txtout) ; If the user wants plaintext output, copy the results into a string
		{
			Query_Statement := "x"
			Loop % o3DA.MaxIndex()
			{
				Query_Statement .= rd rd
				oTbl := o3DA[ A_Index ]
				Loop % oTbl.MaxIndex()
				{
					oRow := oTbl[ A_Index ]
					Loop % oRow.MaxIndex()
						If ( cd = "CSV" )
						{
							str := oRow[ A_Index ]
							StringReplace, str, str, ", "", A                   ; "
							If !ErrorLevel || InStr( str, "," ) || InStr( str, rd )
								str := """" str """"
							Query_Statement .= ( A_Index = 1 ? rd : "," ) str
						}
						Else
							Query_Statement .= ( A_Index = 1 ? rd : cd ) oRow[ A_Index ]
				}
			}
			Query_Statement := SubStr( Query_Statement, 2 + 3 * StrLen( rd ) )
		}
	}
	Else ; Oh NOES!! Put a description of each error in 'ADOSQL_LastError'.
	{
		oErr := oCon.Errors ; > http://www.w3schools.com/ado/ado_ref_error.asp
		Query_Statement := "x"
		Loop % oErr.Count
		{
			oFld := oErr.Item( A_Index - 1 )
			str := oFld.Description
			Query_Statement .= "`n`n" SubStr( str, 1 + InStr( str, "]", 0, 2 + InStr( str, "][", 0, 0 ) ) )
				. "`n   Number: " oFld.Number
				. ", NativeError: " oFld.NativeError
				. ", Source: " oFld.Source
				. ", SQLState: " oFld.SQLState
		}
		ADOSQL_LastError := SubStr( Query_Statement, 4 )
		Query_Statement := ""
		txtout := 1
	}

; Close the connection and return the result. Local objects are cleaned up as the function returns.
	oCon.Close()
	;ComObjError( 1 )
	ErrorLevel := coer
	Return txtout ? Query_Statement : o3DA.MaxIndex() = 1 ? o3DA[1] : o3DA
} ; END - ADOSQL( Connection_String, Query_Statement )

/*
The version for AHK-Basic can be found here.

Here's a sample showing the use of microsoft's ODBC text driver with a csv file.SetWorkingDir, % A_ScriptDir
IfNotExist, products.csv
	FileAppend,
(
P_CODE,P_DESCRIPT,P_INDATE,P_QOH,P_MIN,P_PRICE,P_DISCOUNT,V_CODE
"11QER/31","Power painter,15 psi.,3-nozzle","03-NOV-2011",8,5,109.99,0.00,25595
"13-Q2/P2","7.25-in. pwr. saw blade","13-DEC-2011",32,15,14.99,0.05,21344
"14-Q1/L3","9.00-in. pwr. saw blade","13-NOV-2011",18,12,17.49,0.00,21344
"1546-QQ2","Hrd. cloth,1/4-in.,2x50","15-JAN-2012",15,8,39.95,0.00,23119
"1558-QW1","Hrd. cloth,1/2-in.,3x50","15-JAN-2012",23,5,43.99,0.00,23119
"2232/QTY","B\&D jigsaw,12-in. blade","30-DEC-2011",8,5,109.92,0.05,24288
"2232/QWE","B\&D jigsaw,8-in. blade","24-DEC-2011",6,5,99.87,0.05,24288
"2238/QPD","B\&D cordless drill,1/2-in.","20-JAN-2012",12,5,38.95,0.05,25595
"23109-HB","Claw hammer","20-JAN-2012",23,10,9.95,0.10,21225
"23114-AA","Sledge hammer,12 lb.","02-JAN-2012",8,5,14.40,0.05,NULL 
"54778-2T","Rat-tail file,1/8-in. fine","15-DEC-2011",43,20,4.99,0.00,21344
"89-WRE-Q","Hicut chain saw,16 in.","07-FEB-2012",11,5,256.99,0.05,24288
"PVC23DRT","PVC pipe,3.5-in.,8-ft","20-FEB-2011",188,75,5.87,0.00,NULL 
"SM-18277","1.25-in. metal screw,25","01-MAR-2012",172,75,6.99,0.00,21225
"SW-23116","2.5-in. wd. screw,50","24-FEB-2012",237,100,8.45,0.00,21231
"WR3/TT3","Steel matting,4""x8""x1/6",.5" mesh","17-JAN-2012",18,5,119.95,0.10,25595
), products.csv

connection_string =
( ltrim join;
	Driver={Microsoft Text Driver (*.txt; *.csv)}
	Extensions=asc,csv,tab,txt
	Persist Security Info=False
)

MsgBox % ADOSQL( connection_string ";coldelim=   `t", "
(
	SELECT P_CODE, P_PRICE, P_DESCRIPT
	FROM products.csv
	WHERE P_PRICE > ( SELECT AVG( P_PRICE ) FROM products.csv )
)")

filedelete, products.csv
*/


/*
#F3:: ;windowskey+F3
Send, ^c
ClipWait, .5
selText := Clipboard

qry := "SELECT * FROM dbo.vwAHKWorkspace WHERE WorkspaceName = '" selText "'"

result := ADOSQL(qry)

workspaceName := result[2,1] ;workspace name
miscId := result[2,2] ;miscellaneous folder Id

display := % miscId "`n" workspaceName

MsgBox, 0, Workspace Opener, % display
Return


#F4::
Send, ^c
ClipWait, .5
selText := Clipboard

qry := "SELECT * FROM dbo.vwAHKMatterInfo WHERE Matter = '" selText "'"

result := ADOSQL(qry)

matter := result[2,1] ;matter name
matterId := result[2,2] ;countryapp id or trademark id
invId := result[2,3] ;if matter is a patent, otherwise 0 is returned
system := result[2,4] ;matter type: patent or trademark
liveUrl := result[2,5] ;url in live docketing system
agentUrl := result[2,6] ;url in agent docketing system
invUrl := result[2,7] ;invention url if patent, otherwise black

display := % matter "`n" matterId "`n" invId "`n" system "`n" liveUrl "`n" agentUrl "`n" invUrl

MsgBox, 0, Matter Urls, % display
Return
*/


class Chrome
{
	static DebugPort := 9222
	
	/*
		Escape a string in a manner suitable for command line parameters
	*/
	CliEscape(Param)
	{
		return """" RegExReplace(Param, "(\\*)""", "$1$1\""") """"
	}
	
	/*
		Finds instances of chrome in debug mode and the ports they're running
		on. If no instances are found, returns a false value. If one or more
		instances are found, returns an associative array where the keys are
		the ports, and the values are the full command line texts used to start
		the processes.
		
		One example of how this may be used would be to open chrome on a
		different port if an instance of chrome is already open on the port
		you wanted to used.
		
		```
		; If the wanted port is taken, use the largest taken port plus one
		DebugPort := 9222
		if (Chromes := Chrome.FindInstances()).HasKey(DebugPort)
			DebugPort := Chromes.MaxIndex() + 1
		ChromeInst := new Chrome(ProfilePath,,,, DebugPort)
		```
		
		Another use would be to scan for running instances and attach to one
		instead of starting a new instance.
		
		```
		if (Chromes := Chrome.FindInstances())
			ChromeInst := {"base": Chrome, "DebugPort": Chromes.MinIndex()}
		else
			ChromeInst := new Chrome(ProfilePath)
		```
	*/
	FindInstances()
	{
		static Needle := "--remote-debugging-port=(\d+)"
		Out := {}
		for Item in ComObjGet("winmgmts:")
			.ExecQuery("SELECT CommandLine FROM Win32_Process"
			. " WHERE Name = 'chrome.exe'")
			if RegExMatch(Item.CommandLine, Needle, Match)
				Out[Match1] := Item.CommandLine
		return Out.MaxIndex() ? Out : False
	}
	
	/*
		ProfilePath - Path to the user profile directory to use. Will use the standard if left blank.
		URLs        - The page or array of pages for Chrome to load when it opens
		Flags       - Additional flags for chrome when launching
		ChromePath  - Path to chrome.exe, will detect from start menu when left blank
		DebugPort   - What port should Chrome's remote debugging server run on
	*/
	__New(ProfilePath:="", URLs:="about:blank", Flags:="", ChromePath:="", DebugPort:="")
	{
		; Verify ProfilePath
		if (ProfilePath != "" && !InStr(FileExist(ProfilePath), "D"))
			throw Exception("The given ProfilePath does not exist")
		this.ProfilePath := ProfilePath
		
		; Verify ChromePath
		if (ChromePath == "")
			FileGetShortcut, %A_StartMenuCommon%\Programs\Google Chrome.lnk, ChromePath
		if (ChromePath == "")
			RegRead, ChromePath, HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Pahs\chrome.exe
		if !FileExist(ChromePath)
			throw Exception("Chrome could not be found")
		this.ChromePath := ChromePath
		
		; Verify DebugPort
		if (DebugPort != "")
		{
			if DebugPort is not integer
				throw Exception("DebugPort must be a positive integer")
			else if (DebugPort <= 0)
				throw Exception("DebugPort must be a positive integer")
			this.DebugPort := DebugPort
		}
		
		; Escape the URL(s)
		for Index, URL in IsObject(URLs) ? URLs : [URLs]
			URLString .= " " this.CliEscape(URL)
		
		Run, % this.CliEscape(ChromePath)
		. " --remote-debugging-port=" this.DebugPort
		. (ProfilePath ? " --user-data-dir=" this.CliEscape(ProfilePath) : "")
		. (Flags ? " " Flags : "")
		. URLString
		,,, OutputVarPID
		this.PID := OutputVarPID
	}
	
	/*
		End Chrome by terminating the process.
	*/
	Kill()
	{
		Process, Close, % this.PID
	}
	
	/*
		Queries chrome for a list of pages that expose a debug interface.
		In addition to standard tabs, these include pages such as extension
		configuration pages.
	*/
	GetPageList()
	{
		http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
		http.open("GET", "http://127.0.0.1:" this.DebugPort "/json")
		http.send()
		return this.Jxon_Load(http.responseText)
	}
	
	/*
		Returns a connection to the debug interface of a page that matches the
		provided criteria. When multiple pages match the criteria, they appear
		ordered by how recently the pages were opened.
		
		Key        - The key from the page list to search for, such as "url" or "title"
		Value      - The value to search for in the provided key
		MatchMode  - What kind of search to use, such as "exact", "contains", "startswith", or "regex"
		Index      - If multiple pages match the given criteria, which one of them to return
		fnCallback - A function to be called whenever message is received from the page
	*/
	GetPageBy(Key, Value, MatchMode:="exact", Index:=1, fnCallback:="")
	{
		Count := 0
		for n, PageData in this.GetPageList()
		{
			if (((MatchMode = "exact" && PageData[Key] = Value) ; Case insensitive
				|| (MatchMode = "contains" && InStr(PageData[Key], Value))
				|| (MatchMode = "startswith" && InStr(PageData[Key], Value) == 1)
				|| (MatchMode = "regex" && PageData[Key] ~= Value))
				&& ++Count == Index)
				return new this.Page(PageData.webSocketDebuggerUrl, fnCallback)
		}
	}
	
	/*
		Shorthand for GetPageBy("url", Value, "startswith")
	*/
	GetPageByURL(Value, MatchMode:="startswith", Index:=1, fnCallback:="")
	{
		return this.GetPageBy("url", Value, MatchMode, Index, fnCallback)
	}
	
	/*
		Shorthand for GetPageBy("title", Value, "startswith")
	*/
	GetPageByTitle(Value, MatchMode:="startswith", Index:=1, fnCallback:="")
	{
		return this.GetPageBy("title", Value, MatchMode, Index, fnCallback)
	}
	
	/*
		Shorthand for GetPageBy("type", Type, "exact")
		
		The default type to search for is "page", which is the visible area of
		a normal Chrome tab.
	*/
	GetPage(Index:=1, Type:="page", fnCallback:="")
	{
		return this.GetPageBy("type", Type, "exact", Index, fnCallback)
	}
	
	/*
		Connects to the debug interface of a page given its WebSocket URL.
	*/
	class Page
	{
		Connected := False
		ID := 0
		Responses := []
		
		/*
			wsurl      - The desired page's WebSocket URL
			fnCallback - A function to be called whenever message is received
		*/
		__New(wsurl, fnCallback:="")
		{
			this.fnCallback := fnCallback
			this.BoundKeepAlive := this.Call.Bind(this, "Browser.getVersion",, False)
			
			; TODO: Throw exception on invalid objects
			if IsObject(wsurl)
				wsurl := wsurl.webSocketDebuggerUrl
			
			wsurl := StrReplace(wsurl, "localhost", "127.0.0.1")
			this.ws := {"base": this.WebSocket, "_Event": this.Event, "Parent": this}
			this.ws.__New(wsurl)
			
			while !this.Connected
				Sleep, 50
		}
		
		/*
			Calls the specified endpoint and provides it with the given
			parameters.
			
			DomainAndMethod - The endpoint domain and method name for the
			endpoint you would like to call. For example:
			PageInst.Call("Browser.close")
			PageInst.Call("Schema.getDomains")
			
			Params - An associative array of parameters to be provided to the
			endpoint. For example:
			PageInst.Call("Page.printToPDF", {"scale": 0.5 ; Numeric Value
			, "landscape": Chrome.Jxon_True() ; Boolean Value
			, "pageRanges: "1-5, 8, 11-13"}) ; String value
			PageInst.Call("Page.navigate", {"url": "https://autohotkey.com/"})
			
			WaitForResponse - Whether to block until a response is received from
			Chrome, which is necessary to receive a return value, or whether
			to continue on with the script without waiting for a response.
		*/
		Call(DomainAndMethod, Params:="", WaitForResponse:=True)
		{
			;if !this.Connected
			;	throw Exception("Not connected to tab")
			
			;;;;; MAYBE TURN BACK ON LATER I DUNNO
			
			
			; Use a temporary variable for ID in case more calls are made
			; before we receive a response.
			ID := this.ID += 1
			this.ws.Send(Chrome.Jxon_Dump({"id": ID
			, "params": Params ? Params : {}
			, "method": DomainAndMethod}))
			
			if !WaitForResponse
				return
			
			; Wait for the response
			this.responses[ID] := False
			while !this.responses[ID]
				Sleep, 50
			
			; Get the response, check if it's an error
			response := this.responses.Delete(ID)
			if (response.error)
				throw Exception("Chrome indicated error in response",, Chrome.Jxon_Dump(response.error))
			
			return response.result
		}
		
		/*
			Run some JavaScript on the page. For example:
			
			PageInst.Evaluate("alert(""I can't believe it's not IE!"");")
			PageInst.Evaluate("document.getElementsByTagName('button')[0].click();")
		*/
		Evaluate(JS)
		{
			response := this.Call("Runtime.evaluate",
			( LTrim Join
			{
				"expression": JS,
				"objectGroup": "console",
				"includeCommandLineAPI": Chrome.Jxon_True(),
				"silent": Chrome.Jxon_False(),
				"returnByValue": Chrome.Jxon_False(),
				"userGesture": Chrome.Jxon_True(),
				"awaitPromise": Chrome.Jxon_False()
			}
			))
			
			; if (response.exceptionDetails)
			;	throw Exception(response.result.description,, Chrome.Jxon_Dump(response.exceptionDetails))
			
						
			;;;;; MAYBE TURN BACK ON LATER I DUNNO
			
			return response.result
		}
		
		/*
			Waits for the page's readyState to match the DesiredState.
			
			DesiredState - The state to wait for the page's ReadyState to match
			Interval     - How often it should check whether the state matches
		*/
		WaitForLoad(DesiredState:="complete", Interval:=100)
		{
			while this.Evaluate("document.readyState").value != DesiredState
				Sleep, Interval
		}
		
		/*
			Internal function triggered when the script receives a message on
			the WebSocket connected to the page.
		*/
		Event(EventName, Event)
		{
			; If it was called from the WebSocket adjust the class context
			if this.Parent
				this := this.Parent
			
			; TODO: Handle Error events
			if (EventName == "Open")
			{
				this.Connected := True
				BoundKeepAlive := this.BoundKeepAlive
				SetTimer, %BoundKeepAlive%, 15000
			}
			else if (EventName == "Message")
			{
				data := Chrome.Jxon_Load(Event.data)
				
				; Run the callback routine
				fnCallback := this.fnCallback
				if (newData := %fnCallback%(data))
					data := newData
				
				if this.responses.HasKey(data.ID)
					this.responses[data.ID] := data
			}
			else if (EventName == "Close")
			{
				this.Disconnect()
			}
			else if (EventName == "Error")
			{
				; throw Exception("Websocket Error!")
				
							
			;;;;; MAYBE TURN BACK ON LATER I DUNNO
			}
		}
		
		/*
			Disconnect from the page's debug interface, allowing the instance
			to be garbage collected.
			
			This method should always be called when you are finished with a
			page or else your script will leak memory.
		*/
		Disconnect()
		{
			if !this.Connected
				return
			
			this.Connected := False
			this.ws.Delete("Parent")
			this.ws.Disconnect()
			
			BoundKeepAlive := this.BoundKeepAlive
			SetTimer, %BoundKeepAlive%, Delete
			this.Delete("BoundKeepAlive")
		}
		
		class WebSocket
		{
			__New(WS_URL)
			{
				static wb
				
				; Create an IE instance
				Gui, +hWndhOld
				Gui, New, +hWndhWnd
				this.hWnd := hWnd
				Gui, Add, ActiveX, vWB, Shell.Explorer
				Gui, %hOld%: Default
				

				; Write an appropriate document
				WB.Navigate("about:<!DOCTYPE html><meta http-equiv='X-UA-Compatible'"
				. "content='IE=edge'><body></body>")
				while (WB.ReadyState < 4)
					sleep, 50
				this.document := WB.document
				
				; Add our handlers to the JavaScript namespace
				this.document.parentWindow.ahk_savews := this._SaveWS.Bind(this)
				this.document.parentWindow.ahk_event := this._Event.Bind(this)
				this.document.parentWindow.ahk_ws_url := WS_URL
				
				; Add some JavaScript to the page to open a socket
				Script := this.document.createElement("script")
				Script.text := "ws = new WebSocket(ahk_ws_url);`n"
				. "ws.onopen = function(event){ ahk_event('Open', event); };`n"
				. "ws.onclose = function(event){ ahk_event('Close', event); };`n"
				. "ws.onerror = function(event){ ahk_event('Error', event); };`n"
				. "ws.onmessage = function(event){ ahk_event('Message', event); };"
				this.document.body.appendChild(Script)
			}
			
			; Called by the JS in response to WS events
			_Event(EventName, Event)
			{
				this["On" EventName](Event)
			}
			
			; Sends data through the WebSocket
			Send(Data)
			{
				this.document.parentWindow.ws.send(Data)
			}
			
			; Closes the WebSocket connection
			Close(Code:=1000, Reason:="")
			{
				this.document.parentWindow.ws.close(Code, Reason)
			}
			
			; Closes and deletes the WebSocket, removing
			; references so the class can be garbage collected
			Disconnect()
			{
				if this.hWnd
				{
					this.Close()
					Gui, % this.hWnd ": Destroy"
					this.hWnd := False
				}
			}
		}
	}
	
	Jxon_Load(ByRef src, args*)
	{
		static q := Chr(34)
		
		key := "", is_key := false
		stack := [ tree := [] ]
		is_arr := { (tree): 1 }
		next := q . "{[01234567890-tfn"
		pos := 0
		while ( (ch := SubStr(src, ++pos, 1)) != "" )
		{
			if InStr(" `t`n`r", ch)
				continue
			if !InStr(next, ch, true)
			{
				ln := ObjLength(StrSplit(SubStr(src, 1, pos), "`n"))
				col := pos - InStr(src, "`n",, -(StrLen(src)-pos+1))
				
				msg := Format("{}: line {} col {} (char {})"
				,   (next == "")      ? ["Extra data", ch := SubStr(src, pos)][1]
				: (next == "'")     ? "Unterminated string starting at"
				: (next == "\")     ? "Invalid \escape"
				: (next == ":")     ? "Expecting ':' delimiter"
				: (next == q)       ? "Expecting object key enclosed in double quotes"
				: (next == q . "}") ? "Expecting object key enclosed in double quotes or object closing '}'"
				: (next == ",}")    ? "Expecting ',' delimiter or object closing '}'"
				: (next == ",]")    ? "Expecting ',' delimiter or array closing ']'"
				: [ "Expecting JSON value(string, number, [true, false, null], object or array)"
				, ch := SubStr(src, pos, (SubStr(src, pos)~="[\]\},\s]|$")-1) ][1]
				, ln, col, pos)
				
				throw Exception(msg, -1, ch)
			}
			
			is_array := is_arr[obj := stack[1]]
			
			if i := InStr("{[", ch)
			{
				val := (proto := args[i]) ? new proto : {}
				is_array? ObjPush(obj, val) : obj[key] := val
				ObjInsertAt(stack, 1, val)
				
				is_arr[val] := !(is_key := ch == "{")
				next := q . (is_key ? "}" : "{[]0123456789-tfn")
			}
			
			else if InStr("}]", ch)
			{
				ObjRemoveAt(stack, 1)
				next := stack[1]==tree ? "" : is_arr[stack[1]] ? ",]" : ",}"
			}
			
			else if InStr(",:", ch)
			{
				is_key := (!is_array && ch == ",")
				next := is_key ? q : q . "{[0123456789-tfn"
			}
			
			else ; string | number | true | false | null
			{
				if (ch == q) ; string
				{
					i := pos
					while i := InStr(src, q,, i+1)
					{
						val := StrReplace(SubStr(src, pos+1, i-pos-1), "\\", "\u005C")
						static end := A_AhkVersion<"2" ? 0 : -1
						if (SubStr(val, end) != "\")
							break
					}
					if !i ? (pos--, next := "'") : 0
						continue
					
					pos := i ; update pos
					
					val := StrReplace(val,    "\/",  "/")
					, val := StrReplace(val, "\" . q,    q)
					, val := StrReplace(val,    "\b", "`b")
					, val := StrReplace(val,    "\f", "`f")
					, val := StrReplace(val,    "\n", "`n")
					, val := StrReplace(val,    "\r", "`r")
					, val := StrReplace(val,    "\t", "`t")
					
					i := 0
					while i := InStr(val, "\",, i+1)
					{
						if (SubStr(val, i+1, 1) != "u") ? (pos -= StrLen(SubStr(val, i)), next := "\") : 0
							continue 2
						
						; \uXXXX - JSON unicode escape sequence
						xxxx := Abs("0x" . SubStr(val, i+2, 4))
						if (A_IsUnicode || xxxx < 0x100)
							val := SubStr(val, 1, i-1) . Chr(xxxx) . SubStr(val, i+6)
					}
					
					if is_key
					{
						key := val, next := ":"
						continue
					}
				}
				
				else ; number | true | false | null
				{
					val := SubStr(src, pos, i := RegExMatch(src, "[\]\},\s]|$",, pos)-pos)
					
					; For numerical values, numerify integers and keep floats as is.
					; I'm not yet sure if I should numerify floats in v2.0-a ...
					static number := "number", integer := "integer"
					if val is %number%
					{
						if val is %integer%
							val += 0
					}
					; in v1.1, true,false,A_PtrSize,A_IsUnicode,A_Index,A_EventInfo,
					; SOMETIMES return strings due to certain optimizations. Since it
					; is just 'SOMETIMES', numerify to be consistent w/ v2.0-a
					else if (val == "true" || val == "false")
						val := %value% + 0
					; AHK_H has built-in null, can't do 'val := %value%' where value == "null"
					; as it would raise an exception in AHK_H(overriding built-in var)
					else if (val == "null")
						val := ""
					; any other values are invalid, continue to trigger error
					else if (pos--, next := "#")
						continue
					
					pos += i-1
				}
				
				is_array? ObjPush(obj, val) : obj[key] := val
				next := obj==tree ? "" : is_array ? ",]" : ",}"
			}
		}
		
		return tree[1]
	}
	
	Jxon_Dump(obj, indent:="", lvl:=1)
	{
		static q := Chr(34)
		
		if IsObject(obj)
		{
			static Type := Func("Type")
			if Type ? (Type.Call(obj) != "Object") : (ObjGetCapacity(obj) == "")
				throw Exception("Object type not supported.", -1, Format("<Object at 0x{:p}>", &obj))
			
			prefix := SubStr(A_ThisFunc, 1, InStr(A_ThisFunc, ".",, 0))
			fn_t := prefix "Jxon_True",  obj_t := this ? %fn_t%(this) : %fn_t%()
			fn_f := prefix "Jxon_False", obj_f := this ? %fn_f%(this) : %fn_f%()
			
			if (&obj == &obj_t)
				return "true"
			else if (&obj == &obj_f)
				return "false"
			
			is_array := 0
			for k in obj
				is_array := k == A_Index
			until !is_array
			
			static integer := "integer"
			if indent is %integer%
			{
				if (indent < 0)
					throw Exception("Indent parameter must be a postive integer.", -1, indent)
				spaces := indent, indent := ""
				Loop % spaces
					indent .= " "
			}
			indt := ""
			Loop, % indent ? lvl : 0
				indt .= indent
			
			this_fn := this ? Func(A_ThisFunc).Bind(this) : A_ThisFunc
			lvl += 1, out := "" ; Make #Warn happy
			for k, v in obj
			{
				if IsObject(k) || (k == "")
					throw Exception("Invalid object key.", -1, k ? Format("<Object at 0x{:p}>", &obj) : "<blank>")
				
				if !is_array
					out .= ( ObjGetCapacity([k], 1) ? %this_fn%(k) : q . k . q ) ;// key
				.  ( indent ? ": " : ":" ) ; token + padding
				out .= %this_fn%(v, indent, lvl) ; value
				.  ( indent ? ",`n" . indt : "," ) ; token + indent
			}
			
			if (out != "")
			{
				out := Trim(out, ",`n" . indent)
				if (indent != "")
					out := "`n" . indt . out . "`n" . SubStr(indt, StrLen(indent)+1)
			}
			
			return is_array ? "[" . out . "]" : "{" . out . "}"
		}
		
		; Number
		else if (ObjGetCapacity([obj], 1) == "")
			return obj
		
		; String (null -> not supported by AHK)
		if (obj != "")
		{
			obj := StrReplace(obj,  "\",    "\\")
			, obj := StrReplace(obj,  "/",    "\/")
			, obj := StrReplace(obj,    q, "\" . q)
			, obj := StrReplace(obj, "`b",    "\b")
			, obj := StrReplace(obj, "`f",    "\f")
			, obj := StrReplace(obj, "`n",    "\n")
			, obj := StrReplace(obj, "`r",    "\r")
			, obj := StrReplace(obj, "`t",    "\t")
			
			static needle := (A_AhkVersion<"2" ? "O)" : "") . "[^\x20-\x7e]"
			while RegExMatch(obj, needle, m)
				obj := StrReplace(obj, m[0], Format("\u{:04X}", Ord(m[0])))
		}
		
		return q . obj . q
	}
	
	Jxon_True()
	{
		static obj := {}
		return obj
	}
	
	Jxon_False()
	{
		static obj := {}
		return obj
	}
}

Base64Encode(String) ;by Uberi @ https://autohotkey.com/board/topic/5545-base64-coderdecoder/page-3#entry690930
{
    static CharSet := "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    VarSetCapacity(Output,Ceil(Length / 3) << 2)
    Index := 1, Length := StrLen(String)
    Loop, % Length // 3
    {
        Value := Asc(SubStr(String,Index,1)) << 16
            | Asc(SubStr(String,Index + 1,1)) << 8
            | Asc(SubStr(String,Index + 2,1))
        Index += 3
        Output .= SubStr(CharSet,(Value >> 18) + 1,1)
            . SubStr(CharSet,((Value >> 12) & 63) + 1,1)
            . SubStr(CharSet,((Value >> 6) & 63) + 1,1)
            . SubStr(CharSet,(Value & 63) + 1,1)
    }
    Length := Mod(Length,3)
    If Length = 0 ;no characters remain
        Return, Output
    Value := Asc(SubStr(String,Index,1)) << 10
    If Length = 1
    {
        Return, Output ;one character remains
            . SubStr(CharSet,(Value >> 12) + 1,1)
            . SubStr(CharSet,((Value >> 6) & 63) + 1,1) . "=="
    }
    Value |= Asc(SubStr(String,Index + 1,1)) << 2 ;insert the third character
    Return, Output ;two characters remain
        . SubStr(CharSet,(Value >> 12) + 1,1)
        . SubStr(CharSet,((Value >> 6) & 63) + 1,1)
        . SubStr(CharSet,(Value & 63) + 1,1) . "="
}


/**
 * Lib: JSON.ahk
 *     JSON lib for AutoHotkey.
 * Version:
 *     v2.1.3 [updated 04/18/2016 (MM/DD/YYYY)]
 * License:
 *     WTFPL [http://wtfpl.net/]
 * Requirements:
 *     Latest version of AutoHotkey (v1.1+ or v2.0-a+)
 * Installation:
 *     Use #Include JSON.ahk or copy into a function library folder and then
 *     use #Include <JSON>
 * Links:
 *     GitHub:     - https://github.com/cocobelgica/AutoHotkey-JSON
 *     Forum Topic - http://goo.gl/r0zI8t
 *     Email:      - cocobelgica <at> gmail <dot> com
 */


/**
 * Class: JSON
 *     The JSON object contains methods for parsing JSON and converting values
 *     to JSON. Callable - NO; Instantiable - YES; Subclassable - YES;
 *     Nestable(via #Include) - NO.
 * Methods:
 *     Load() - see relevant documentation before method definition header
 *     Dump() - see relevant documentation before method definition header
 */
class JSON
{
	/**
	 * Method: Load
	 *     Parses a JSON string into an AHK value
	 * Syntax:
	 *     value := JSON.Load( text [, reviver ] )
	 * Parameter(s):
	 *     value      [retval] - parsed value
	 *     text    [in, ByRef] - JSON formatted string
	 *     reviver   [in, opt] - function object, similar to JavaScript's
	 *                           JSON.parse() 'reviver' parameter
	 */
	class Load extends JSON.Functor
	{
		Call(self, ByRef text, reviver:="")
		{
			this.rev := IsObject(reviver) ? reviver : false
		; Object keys(and array indices) are temporarily stored in arrays so that
		; we can enumerate them in the order they appear in the document/text instead
		; of alphabetically. Skip if no reviver function is specified.
			this.keys := this.rev ? {} : false

			static quot := Chr(34), bashq := "\" . quot
			     , json_value := quot . "{[01234567890-tfn"
			     , json_value_or_array_closing := quot . "{[]01234567890-tfn"
			     , object_key_or_object_closing := quot . "}"

			key := ""
			is_key := false
			root := {}
			stack := [root]
			next := json_value
			pos := 0

			while ((ch := SubStr(text, ++pos, 1)) != "") {
				if InStr(" `t`r`n", ch)
					continue
				if !InStr(next, ch, 1)
					this.ParseError(next, text, pos)

				holder := stack[1]
				is_array := holder.IsArray

				if InStr(",:", ch) {
					next := (is_key := !is_array && ch == ",") ? quot : json_value

				} else if InStr("}]", ch) {
					ObjRemoveAt(stack, 1)
					next := stack[1]==root ? "" : stack[1].IsArray ? ",]" : ",}"

				} else {
					if InStr("{[", ch) {
					; Check if Array() is overridden and if its return value has
					; the 'IsArray' property. If so, Array() will be called normally,
					; otherwise, use a custom base object for arrays
						static json_array := Func("Array").IsBuiltIn || ![].IsArray ? {IsArray: true} : 0
					
					; sacrifice readability for minor(actually negligible) performance gain
						(ch == "{")
							? ( is_key := true
							  , value := {}
							  , next := object_key_or_object_closing )
						; ch == "["
							: ( value := json_array ? new json_array : []
							  , next := json_value_or_array_closing )
						
						ObjInsertAt(stack, 1, value)

						if (this.keys)
							this.keys[value] := []
					
					} else {
						if (ch == quot) {
							i := pos
							while (i := InStr(text, quot,, i+1)) {
								value := StrReplace(SubStr(text, pos+1, i-pos-1), "\\", "\u005c")

								static tail := A_AhkVersion<"2" ? 0 : -1
								if (SubStr(value, tail) != "\")
									break
							}

							if (!i)
								this.ParseError("'", text, pos)

							  value := StrReplace(value,  "\/",  "/")
							, value := StrReplace(value, bashq, quot)
							, value := StrReplace(value,  "\b", "`b")
							, value := StrReplace(value,  "\f", "`f")
							, value := StrReplace(value,  "\n", "`n")
							, value := StrReplace(value,  "\r", "`r")
							, value := StrReplace(value,  "\t", "`t")

							pos := i ; update pos
							
							i := 0
							while (i := InStr(value, "\",, i+1)) {
								if !(SubStr(value, i+1, 1) == "u")
									this.ParseError("\", text, pos - StrLen(SubStr(value, i+1)))

								uffff := Abs("0x" . SubStr(value, i+2, 4))
								if (A_IsUnicode || uffff < 0x100)
									value := SubStr(value, 1, i-1) . Chr(uffff) . SubStr(value, i+6)
							}

							if (is_key) {
								key := value, next := ":"
								continue
							}
						
						} else {
							value := SubStr(text, pos, i := RegExMatch(text, "[\]\},\s]|$",, pos)-pos)

							static number := "number", integer :="integer"
							if value is %number%
							{
								if value is %integer%
									value += 0
							}
							else if (value == "true" || value == "false")
								value := %value% + 0
							else if (value == "null")
								value := ""
							else
							; we can do more here to pinpoint the actual culprit
							; but that's just too much extra work.
								this.ParseError(next, text, pos, i)

							pos += i-1
						}

						next := holder==root ? "" : is_array ? ",]" : ",}"
					} ; If InStr("{[", ch) { ... } else

					is_array? key := ObjPush(holder, value) : holder[key] := value

					if (this.keys && this.keys.HasKey(holder))
						this.keys[holder].Push(key)
				}
			
			} ; while ( ... )

			return this.rev ? this.Walk(root, "") : root[""]
		}

		ParseError(expect, ByRef text, pos, len:=1)
		{
			static quot := Chr(34), qurly := quot . "}"
			
			line := StrSplit(SubStr(text, 1, pos), "`n", "`r").Length()
			col := pos - InStr(text, "`n",, -(StrLen(text)-pos+1))
			msg := Format("{1}`n`nLine:`t{2}`nCol:`t{3}`nChar:`t{4}"
			,     (expect == "")     ? "Extra data"
			    : (expect == "'")    ? "Unterminated string starting at"
			    : (expect == "\")    ? "Invalid \escape"
			    : (expect == ":")    ? "Expecting ':' delimiter"
			    : (expect == quot)   ? "Expecting object key enclosed in double quotes"
			    : (expect == qurly)  ? "Expecting object key enclosed in double quotes or object closing '}'"
			    : (expect == ",}")   ? "Expecting ',' delimiter or object closing '}'"
			    : (expect == ",]")   ? "Expecting ',' delimiter or array closing ']'"
			    : InStr(expect, "]") ? "Expecting JSON value or array closing ']'"
			    :                      "Expecting JSON value(string, number, true, false, null, object or array)"
			, line, col, pos)

			static offset := A_AhkVersion<"2" ? -3 : -4
			throw Exception(msg, offset, SubStr(text, pos, len))
		}

		Walk(holder, key)
		{
			value := holder[key]
			if IsObject(value) {
				for i, k in this.keys[value] {
					; check if ObjHasKey(value, k) ??
					v := this.Walk(value, k)
					if (v != JSON.Undefined)
						value[k] := v
					else
						ObjDelete(value, k)
				}
			}
			
			return this.rev.Call(holder, key, value)
		}
	}

	/**
	 * Method: Dump
	 *     Converts an AHK value into a JSON string
	 * Syntax:
	 *     str := JSON.Dump( value [, replacer, space ] )
	 * Parameter(s):
	 *     str        [retval] - JSON representation of an AHK value
	 *     value          [in] - any value(object, string, number)
	 *     replacer  [in, opt] - function object, similar to JavaScript's
	 *                           JSON.stringify() 'replacer' parameter
	 *     space     [in, opt] - similar to JavaScript's JSON.stringify()
	 *                           'space' parameter
	 */
	class Dump extends JSON.Functor
	{
		Call(self, value, replacer:="", space:="")
		{
			this.rep := IsObject(replacer) ? replacer : ""

			this.gap := ""
			if (space) {
				static integer := "integer"
				if space is %integer%
					Loop, % ((n := Abs(space))>10 ? 10 : n)
						this.gap .= " "
				else
					this.gap := SubStr(space, 1, 10)

				this.indent := "`n"
			}

			return this.Str({"": value}, "")
		}

		Str(holder, key)
		{
			value := holder[key]

			if (this.rep)
				value := this.rep.Call(holder, key, ObjHasKey(holder, key) ? value : JSON.Undefined)

			if IsObject(value) {
			; Check object type, skip serialization for other object types such as
			; ComObject, Func, BoundFunc, FileObject, RegExMatchObject, Property, etc.
				static type := A_AhkVersion<"2" ? "" : Func("Type")
				if (type ? type.Call(value) == "Object" : ObjGetCapacity(value) != "") {
					if (this.gap) {
						stepback := this.indent
						this.indent .= this.gap
					}

					is_array := value.IsArray
				; Array() is not overridden, rollback to old method of
				; identifying array-like objects. Due to the use of a for-loop
				; sparse arrays such as '[1,,3]' are detected as objects({}). 
					if (!is_array) {
						for i in value
							is_array := i == A_Index
						until !is_array
					}

					str := ""
					if (is_array) {
						Loop, % value.Length() {
							if (this.gap)
								str .= this.indent
							
							v := this.Str(value, A_Index)
							str .= (v != "") ? v . "," : "null,"
						}
					} else {
						colon := this.gap ? ": " : ":"
						for k in value {
							v := this.Str(value, k)
							if (v != "") {
								if (this.gap)
									str .= this.indent

								str .= this.Quote(k) . colon . v . ","
							}
						}
					}

					if (str != "") {
						str := RTrim(str, ",")
						if (this.gap)
							str .= stepback
					}

					if (this.gap)
						this.indent := stepback

					return is_array ? "[" . str . "]" : "{" . str . "}"
				}
			
			} else ; is_number ? value : "value"
				return ObjGetCapacity([value], 1)=="" ? value : this.Quote(value)
		}

		Quote(string)
		{
			static quot := Chr(34), bashq := "\" . quot

			if (string != "") {
				  string := StrReplace(string,  "\",  "\\")
				; , string := StrReplace(string,  "/",  "\/") ; optional in ECMAScript
				, string := StrReplace(string, quot, bashq)
				, string := StrReplace(string, "`b",  "\b")
				, string := StrReplace(string, "`f",  "\f")
				, string := StrReplace(string, "`n",  "\n")
				, string := StrReplace(string, "`r",  "\r")
				, string := StrReplace(string, "`t",  "\t")

				static rx_escapable := A_AhkVersion<"2" ? "O)[^\x20-\x7e]" : "[^\x20-\x7e]"
				while RegExMatch(string, rx_escapable, m)
					string := StrReplace(string, m.Value, Format("\u{1:04x}", Ord(m.Value)))
			}

			return quot . string . quot
		}
	}

	/**
	 * Property: Undefined
	 *     Proxy for 'undefined' type
	 * Syntax:
	 *     undefined := JSON.Undefined
	 * Remarks:
	 *     For use with reviver and replacer functions since AutoHotkey does not
	 *     have an 'undefined' type. Returning blank("") or 0 won't work since these
	 *     can't be distnguished from actual JSON values. This leaves us with objects.
	 *     Replacer() - the caller may return a non-serializable AHK objects such as
	 *     ComObject, Func, BoundFunc, FileObject, RegExMatchObject, and Property to
	 *     mimic the behavior of returning 'undefined' in JavaScript but for the sake
	 *     of code readability and convenience, it's better to do 'return JSON.Undefined'.
	 *     Internally, the property returns a ComObject with the variant type of VT_EMPTY.
	 */
	Undefined[]
	{
		get {
			static empty := {}, vt_empty := ComObject(0, &empty, 1)
			return vt_empty
		}
	}

	class Functor
	{
		__Call(method, ByRef arg, args*)
		{
		; When casting to Call(), use a new instance of the "function object"
		; so as to avoid directly storing the properties(used across sub-methods)
		; into the "function object" itself.
			if IsObject(method)
				return (new this).Call(method, arg, args*)
			else if (method == "")
				return (new this).Call(arg, args*)
		}
	}
}


GetAppID() {
user := "Paperboy@knobbe.com"
pass := "knobbedocket"
Page := ChromeInst.GetPage()
CPIClientCode := Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_CaseNumber').value").Value
CPIClientCode2 := Page.Evaluate("document.getElementById('ctl00_Detail_CaseNumber').value").Value

if (CPIClientCode == "")
	CPIClientCode := CPIClientCode2

EndPoint1 := "https://web05.computerpackages.com/knobbews/api/Knobbe?queryString="
EndPoint2 := "select appid from tblpatcountryapplication WHERE casenumber "
EndPoint3 := "= '" CPIClientCode "';"
http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http.Open("GET", EndPoint1 . EndPoint2 . EndPoint3, true)
http.SetRequestHeader("Authorization", "Basic "  Base64Encode(user ":" pass) )
http.Send()
while (http.Responsetext == "")
	Sleep 100
value := JSON.Load(http.Responsetext)
gosub RecordAPIUses
return % value.Table[1].appid
}

GetTmkID() {
user := "Paperboy@knobbe.com"
pass := "knobbedocket"
Page := ChromeInst.GetPage()
CPIClientCode := Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_CaseNumber').value").Value
CPIClientCode2 := Page.Evaluate("document.getElementById('ctl00_Detail_CaseNumber').value").Value

if (CPIClientCode == "")
	CPIClientCode := CPIClientCode2

EndPoint1 := "https://web05.computerpackages.com/knobbews/api/Knobbe?queryString="
EndPoint2 := "select tmkid from tblTmkTrademark WHERE casenumber "
EndPoint3 := "= '" CPIClientCode "';"
http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http.Open("GET", EndPoint1 . EndPoint2 . EndPoint3, true)
http.SetRequestHeader("Authorization", "Basic "  Base64Encode(user ":" pass) )
http.Send()
while (http.Responsetext == "")
	Sleep 100
value := JSON.Load(http.Responsetext)
gosub RecordAPIUses
return % value.Table[1].tmkId
}

SystemSwitch(URL) 
{
if InStr(URL, "Invention")
	{
	if InStr(URL, "knobbeagent/patent/patfrmInvention")
		newURL := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplication.aspx?key=" GetAppID()	
	else if InStr(URL, "knobbe/patent/patfrmInvention")
		newURL := "https://web05bak.computerpackages.com/knobbeAgent/patent/patfrmCountryApplication.aspx?key=" GetAppID()	
	}
else if InStr(URL, "ActionDue") ; Inside Actions
	{
	; AT Patent Action to Live Page	
	if InStr(URL, "KnobbeAgent/patent/patfrmActionDue")
		newURL := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplication.aspx?key=" GetAppID()
	; Live Patent Action to AT Page	
	else if InStr(URL, "knobbe/patent/patfrmActionDue")
		newURL := "https://web05bak.computerpackages.com/knobbeAgent/patent/patfrmCountryApplication.aspx?key=" GetAppID()	
	; AT TM Action to Live Page	
	else if InStr(URL, "knobbeAgent/trademark/tmkfrmActionDue")
		newURL := "https://web05.computerpackages.com/knobbe/trademark/tmkfrmTrademark.aspx?nkey=" GetTmkID()	
	; Live TM Action to AT Page	
	else if InStr(URL, "knobbe/trademark/tmkfrmActionDue")
		newURL := "https://web05bak.computerpackages.com/knobbeAgent/trademark/tmkfrmTrademark.aspx?nkey=" GetTmkID()	
	}
else  ; On Main Pages
	{
	if InStr(URL, "knobbeagent/patent/patfrmCountryApplication")
		newURL := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplication.aspx?key=" GetAppID()			
	else if InStr(URL, "knobbe/patent/patfrmCountryApplication")
		newURL := "https://web05bak.computerpackages.com/knobbeAgent/patent/patfrmCountryApplication.aspx?key=" GetAppID()		
	else if InStr(URL, "KnobbeAgent/trademark/tmkfrmTrademark")
		newURL := "https://web05.computerpackages.com/knobbe/trademark/tmkfrmTrademark.aspx?nkey=" GetTmkID()			
	else if InStr(URL, "Knobbe/trademark/tmkfrmTrademar")
		newURL := "https://web05bak.computerpackages.com/knobbeAgent/trademark/tmkfrmTrademark.aspx?nkey=" GetTmkID()			
	}
Page.Disconnect()
Page := ChromeInst.GetPage()
Page.Call("Target.createTarget", {"url" : newURL })
Page.Disconnect()
}

RecordAPIUses:	
IniRead, APIUses, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, APIUses
APIUses++
IniWrite, %APIUses%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, APIUses
return	