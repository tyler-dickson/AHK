#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

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

PageInstance.Call("Target.createTarget", {"url" : OutputVar })

PageInstance.Disconnect()
return



;ie := WBGet()
while ie.busy or ie.ReadyState != 4 ; Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Navigate(params*)
while ie.busy
	Sleep, 100
ie.document.getElementById("ctl00_Detail_CaseNumber_TextBox").value := Clipboard . "*"
ie.document.getElementById("ctl00_Detail_tplSearchButton_input").Click()
ie.visible := true
WinActivate, ahk_class IEFrame
return