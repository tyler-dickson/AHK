#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Enabled := ComObjError(false)
Menu, Tray, Icon, shell32.dll , 240
#SingleInstance, Force

Gui, New, , Metastorm Helper
Gui, Add, ActiveX, x0   y0   w500 h500 vie,   Shell.Explorer  ; The final parameter is the name of the ActiveX component.
;Gui, Add, ActiveX, x500   y0   w500 h500 vie2,  Shell.Explorer  ; The final parameter is the name of the ActiveX component.
;Gui, Add, ActiveX, x0   y500   w500 h500 vie3,  Shell.Explorer  ; The final parameter is the name of the ActiveX component.
;Gui, Add, ActiveX, x500   y500   w500 h500 vie4,  Shell.Explorer  ; The final parameter is the name of the ActiveX component.
Gui, Add, Edit, vURL1 w500, URL
Gui, Add, Button, gGoToURL, Click here.

ie.Navigate("http://oc-metastorm/Metastorm/default.aspx")

Gui, Show
return


GoToUrl:
Gui, Submit, NoHide
MsgBox, %URL1%


ie.Navigate(URL1)
return
