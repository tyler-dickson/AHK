#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, pifmgr.dll, 1
Enabled := ComObjError(false)
SetBatchLines, -1
#SingleInstance, Force
#Include Edge.ahk										; https://www.autohotkey.com/boards/viewtopic.php?f=6&t=42890

; "C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\MicrosoftEdge.exe"
;Run, "C:\Program Files (x86)\Microsoft\Edge Beta\Application\msedge.exe" " --remote-debugging-port=9222"
;Sleep 5000


#Include NewGui.txt

url  := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplication.aspx?key=225602"
Chrome := new Chrome("","","","C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")


if (Chromes := Chrome.FindInstances("msEdge.exe"))
	ChromeInst := {"base": Chrome, "DebugPort": Chromes.MinIndex()}	; or if you know the port:  ChromeInst := {"base": Chrome, "DebugPort": 9222}
else
	msgbox That didn't work. Please check if Chrome is running in debug mode.`n(use, for example, http://localhost:9222/json/version )


; --- Connect to the page ---
if !(Page := ChromeInst.GetPage( ))		
	{
	MsgBox, Could not retrieve page!
	ChromeInst.Kill()
	}
else
	Page.WaitForLoad()

Page.Call("Page.navigate", {"url": url})			; Navigate to url
; Page.WaitForLoad()
; Page.Evaluate("alert('This ie open in Edge???');")

; Page:= ChromeInst.GetPage()
; Page.Evaluate("var test = 'inserted'; document.getElementsByTagName('H1')[0].innerText = test;")
Page.Disconnect()
return

; https://www.youtube.com/watch?v=XdY0H8voHg0&feature=youtu.be

#Include Updated Scripts.ahk



InjectButton:
Page := ChromeInst.GetPage()
;Page.Evaluate("var colcol = 'red'; try { var test = document.getElementById('testButton').value;} catch (ex) {	var test = '';}")

SetTimer, InjectButton2, 50

return


InjectButton2:
Page := ChromeInst.GetPage()

Page.Evaluate("var hiddenValue = document.getElementById('hiddenButton').value;")
hiddenValue 		:= Page.Evaluate("hiddenValue").Value 
Page.Evaluate("var sysSwitch = document.getElementById('systemSwitch').value;")
systemSwitchValue 	:= Page.Evaluate("sysSwitch").value

if (hiddenValue == "")
	{
	testButton = document.getElementById("footerText").insertAdjacentHTML("beforebegin", "<input type='button' style='width:0px; height: 0px; display: none;' id='hiddenButton' value=0><input type='button' value='System Switch' onclick='this.value = 1' id='systemSwitch' style='width: 100px; height: 50px; font-weight: normal;'><input type='button' value='Test Button' onclick='this.value = 1' id='' style='width: 100px; height: 50px; font-weight: normal;'>")
	Page.Evaluate(testButton)
	}
	
if (systemSwitchValue == "1")
	{
	Page.Evaluate("document.getElementById('systemSwitch').value = 'System Switch'")
	Sleep 100
	url2 := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplication.aspx?key=225602"

	Page.Call("Target.createTarget", {"url" : url2 })

	}
	


Page.Evaluate(hideElements)
Page.Disconnect()
return


