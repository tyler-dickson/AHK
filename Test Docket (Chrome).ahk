; Created by Tyler Dickson using AutoHotkey.

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases. ; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, pifmgr.dll, 12
Enabled := ComObjError(false)
SetBatchLines, -1
#SingleInstance, Force

; Process, Close, chrome.exe

#Include Chrome - Working.ahk ; #Include \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Chrome.ahk

FileCreateDir, ChromeProfile
; global ChromeInst := new Chrome("ChromeProfile", "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplication.aspx?key=225602") ; global ChromeInst := new Chrome("ChromeProfile", "--app=http://oc-docketing/CPi/patfrmCountryApplication.aspx?Key=1275806")
global ChromeInst := new Chrome("ChromeProfile") ; global ChromeInst := new Chrome("ChromeProfile", "--app=http://oc-docketing/CPi/patfrmCountryApplication.aspx?Key=1275806")
PageInstance.WaitForLoad()
PageInstance.Disconnect()

#Include NewGui.txt



gosub InjectButton
return

#Include Updated Scripts.ahk




GuiClose:
PageInstance := ChromeInst.GetPage()
PageInstance.Call("Browser.close")
ExitApp
return


CheckVar:
Page := ChromeInst.GetPage()

tester = 
(
var clientCode = document.getElementById("ctl00_Detail_CaseNumber_Input").value;
var country = document.getElementById("ctl00_Detail_Country_Input").value;
var testtest = document.getElementById("testButton").value;
var location = window.location.href;

)

Page.Evaluate(tester)

MsgBox, % Page.Evaluate("clientCode").Value " | " Page.Evaluate("country").Value " | " Page.Evaluate("testtest").Value " | " Page.Evaluate("location").Value 
PageInstance.Disconnect()
return




InjectButton:
Page := ChromeInst.GetPage()
;Page.Evaluate("var colcol = 'red'; try { var test = document.getElementById('testButton').value;} catch (ex) {	var test = '';}")

SetTimer, InjectButton2, 50

return


InjectButton2:
Page := ChromeInst.GetPage()


; Page.Evaluate("document.getElementById('logo_status').style.display = 'none';")

;Page.Evaluate("var hiddenValue = document.getElementById('hiddenButton').value;")
;hiddenValue 		:= Page.Evaluate("hiddenValue").Value 
;Page.Evaluate("var sysSwitch = document.getElementById('systemSwitch').value;")
;systemSwitchValue 	:= Page.Evaluate("sysSwitch").value
; <input type='button' value='Test Button' onclick='this.value = 1' id='' style='width: 100px; height: 50px; font-weight: normal;'>")


/*

if (hiddenValue == "")
	{
	
	if InStr(Page.Evaluate("window.location.href").Value, "ActionDue")
		{	
		buttonBar = 
		(
		"<input type='button' style='width:0px; height: 0px; display: none;' id='hiddenButton' value=0><input type='button' value='System Switch' onclick='this.value = 1' id='systemSwitch' style='width: 110px; height: 50px; font-weight: normal;'>&nbsp;<input type='button' value='Find AT Action' onclick='this.value = 1' id='' style='width: 100px; height: 50px; font-weight: normal;'><input type='button' value='Clone to AT' onclick='this.value = 1' id='' style='width: 100px; height: 50px; font-weight: normal;'><input type='button' value='Grab Data' onclick='this.value = 1' id='' style='width: 100px; height: 50px; font-weight: normal;'>")
		)
		}
	else
		{
		buttonBar = 
		(
		"<input type='button' style='width:0px; height: 0px; display: none;' id='hiddenButton' value=0><input type='button' value='System Switch' onclick='this.value = 1' id='systemSwitch' style='width: 110px; height: 50px; font-weight: normal;'>")
		)		
		
		}

	
	
	Page.Evaluate("document.getElementsByTagName('HR')[1].insertAdjacentHTML('beforebegin'," buttonBar)
	}
	
*/

	
if (Page.Evaluate("document.getElementById('testButton').value").Value == "1")
	{
	MsgBox, worked.
	Page.Evaluate("document.getElementById('testButton').value = 'Test button'")
	Sleep 100
	SystemSwitch(Page.Evaluate("window.location.href").Value) 
	}

Page.Disconnect()
return





SystemSwitch(URL) 
{
if InStr(URL, "Invention")
	{
	MsgBox, Need to use API from Invention screen, probably.
	
	
	
	}
else if InStr(URL, "ActionDue") ; Inside Actions
	{
	; AT Patent Action to Live Page	
	if InStr(URL, "patfrmActionDueAgent")
		{
		appId := SubStr(URL, -5, 6)
		newURL := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplication.aspx?key=" appId	
		}
	; Live Patent Action to AT Page	
	else if InStr(URL, "patfrmActionDue")
		{
		appId := SubStr(URL, -5, 6)
		newURL := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplicationAgent.aspx?key=" appId	
		}	
	; AT TM Action to Live Page	
	else if InStr(URL, "tmkfrmActionDueAgent")
		{
		appId := SubStr(URL, -5, 6)
		newURL := "https://web05.computerpackages.com/knobbe/trademark/tmkfrmTrademark.aspx?nkey=" appId	
		}
	; Live TM Action to AT Page	
	else if InStr(URL, "tmkfrmActionDue")
		{
		appId := SubStr(URL, -5, 6)
		newURL := "https://web05.computerpackages.com/knobbe/trademark/tmkfrmTrademarkAgent.aspx?nkey=" appId	
		}	
	}
else  ; On Main Pages
	{
	if InStr(URL, "patfrmCountryApplicationAgent")
		{
		tempApp := StrSplit(URL, "key=")
		appId := SubStr(tempApp[2], 1, 6)
		newURL := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplication.aspx?key=" appId			
		}
	else if InStr(URL, "patfrmCountryApplication")
		{
		tempApp := StrSplit(URL, "key=")
		appId := SubStr(tempApp[2], 1, 6)
		newURL := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplicationAgent.aspx?key=" appId			
		}
	else if InStr(URL, "tmkfrmTrademarkAgent")
		{
		tempApp := StrSplit(URL, "key=")
		appId := SubStr(tempApp[2], 1, 6)
		newURL := "https://web05.computerpackages.com/knobbe/trademark/tmkfrmTrademark.aspx?nkey=" appId			
		}
	else if InStr(URL, "tmkfrmTrademark")
		{
		tempApp := StrSplit(URL, "key=")
		appId := SubStr(tempApp[2], 1, 6)
		newURL := "https://web05.computerpackages.com/knobbe/trademark/tmkfrmTrademarkAgent.aspx?nkey=" appId			
		}
	}

; Page.Call("Target.createTarget", {"url" : newURL })
MsgBox, % newURL	; Run, % newURL	

}




























;if InStr(LocationURL, "tmkfrmActionDue")
;	document.getElementById("ctl00_Detail_tplFormview_ActionType").style.width = "400px"


; Patent related.
;if InStr(LocationURL, "patfrm")
;	document.getElementById("ctl00_Detail_CaseNumber").style.width = "180px"
;else
;	document.getElementById("ctl00_Detail_CaseNumber").style.width = "175px"	


StopTimer:
SetTimer, InjectButton2, Off

return

/*

; Record Opener
!LButton:: 
!RButton::
Clipboard := ""
SendInput, ^c
ClipWait, 1

PageInstance := ChromeInst.GetPage()

if (A_ThisHotKey == "!RButton")
	OutputVar := "https://web05.computerpackages.com/knobbe/patent/patschcountryapplication.aspx"
else if (A_ThisHotKey == "!LButton")
	OutputVar := "https://web05.computerpackages.com/knobbe/trademark/tmkschTrademark.aspx"

; PageInstance.Call("Target.createTarget", {"url" : OutputVar })
PageInstance.Call("Page.navigate", {"url" : OutputVar })
PageInstance.WaitForLoad()

Attribute := "ctl00_Detail_CaseNumber_TextBox"
NewValue := Clipboard "*"

AllAsVariable := "document.getElementById('" Attribute "').value = '" NewValue "';"
PageInstance.Evaluate(AllAsVariable)

PageInstance.Evaluate("document.getElementById('ctl00_Detail_tplSearchButton_input').click();")

PageInstance.Disconnect()
return

*/


InjectX:
PageInstance := ChromeInst.GetPage()

; Attribute := "fldstrCaseNumber_TextBox"
Attribute := "ctl00_Detail_CaseNumber_Input"
NewValue := "WHATS.UP"

; AllAsVariable = document.getElementById("fldstrCaseNumber_TextBox").value = "Test.Value";
; AllAsVariable = document.getElementById("%Attribute%").value = "%NewValue%";
AllAsVariable := "document.getElementById('" Attribute "').value = '" NewValue "';"

; BOTH AS VARIABLES 
; PageInstance.Evaluate("document.getElementById('" Attribute "').value='" NewValue "'")

; ID HARD CODED 
; PageInstance.Evaluate("document.getElementById('fldstrCaseNumber_TextBox').value='" NewValue "'")

; BOTH HARD CODED 
; PageInstance.Evaluate("document.getElementById('fldstrCaseNumber_TextBox').value = 'Test.Value';")

; ALL AS VARIABLE, EASIEST TO TYPE OUT
 PageInstance.Evaluate(AllAsVariable)

PageInstance.Disconnect()
return




