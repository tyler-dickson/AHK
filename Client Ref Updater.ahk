#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
formattime, Today, ,  MM/dd/yyyy          ;  yyyy-MM-dd	
Menu, Tray, Icon, Shell32.dll, 115

IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATDate
Gui, New, AlwaysOnTop
Gui, Add, GroupBox, cBlue x5 y5 w151 h147, Update Invention Client Ref
Gui, Add, Button, +Center x10 y21 w140 h25  gUpdateClientRefAuto, Automatic
Gui, Add, Button, +Center x10 y121 w140 h25 gUpdateClientRefManual, Manual
Gui, Font, 
Gui, Add, Text, x10 y49 w140 h25 Center, Automatic should work unless similar client codes exist. 
Gui, Add, Text, x10 y79 w140 h38 Center, If Automatic yields multiple results, select correct matter, then click Manual. 
Gui, Show, w160       ;w160
GuiControlGet,  ComboBox1Text, , ComboBox1
return

UpdateClientRefAuto:
Gui, Submit
WinActivate, ahk_class IEFrame
gosub CopyAction
OutputVar = http://oc-docketing/CPi/patschInvention.aspx
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 16384]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
   ie.Visible := True
   params := [OutputVar, 16384]
}
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ie.Document.All.schstrCaseNumber_TextBox.Value := ClientCode
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
Sleep 1000
ie.document.getElementByID("btnEdit").Click()
ie.document.All.fldstrClientRef.Value := ClientRef
IniWrite, %ClientRef%, C:\Users\%A_Username%\Temp.ini, ClientRef, ClientRef
Gui, Show
return

UpdateClientRefManual:
Gui, Submit
IniRead, ClientRef, C:\Users\%A_Username%\Temp.ini, ClientRef, ClientRef
WinActivate, ahk_class IEFrame
ClientRef := ClientRef
OutputVar = http://oc-docketing/CPi/patschInvention.aspx
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 16384]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
   ie.Visible := True
   params := [OutputVar, 16384]
}
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
Sleep 1000
ie.document.getElementByID("btnEdit").Click()
ie.document.All.fldstrClientRef.Value := ClientRef
Gui, Show
return

CopyAction:
Gui, Hide
WinActivate, ahk_class IEFrame
OutputVar = http://oc-docketing/CPi/tmkfrmTrademark.aspx?key=430607
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
  ie.Visible := True
   params := [OutputVar, 32]
}
;ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
ClientRef := ie.document.getElementByID("fldstrAppClientRef").Value
Sleep 200
return

GuiClose:
ExitApp
return

