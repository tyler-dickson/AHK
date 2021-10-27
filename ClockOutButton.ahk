#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;#IfWinActive ahk_class IEFrame
^#Space::
global NewX
global NewY
global xpos
global ypos
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
WinActivate, ahk_class IEFrame
ClockOutButton()
return

ClockOutButton()
{
SetTitleMatchMode, 2
WinGetPos , X, Y, Width, Height, ahk_class IEFrame
NewX := x + 10
NewY := y + 2
Gui, New, +AlwaysOnTop +Owner, Test
Gui, Add, Button, x0 y5 w100 h25 g2Test, Clock In/Out
Gui, Add, Button, x120 y5 w100 h25 g2Cancel, Close
Gui, Show, ,Test
Gui, +ToolWindow -Caption                           ; Removes the Border and Task bar icon
Gui, Color, 000111                                  ; can be any colour but it's good to use a color that is NOT present in ur GUI
Gui, Show, X%X% Y%Y% h28 w225, Test
;Gui, Show, x1629 y324 h28 w225, Test
WinSet, Transcolor, 000111, Test
return
}
	
2Test:
	{
	WinActivate, ahk_class IEFrame
	Run iexplore.exe http://oc-kronos/wfc/applications/wtk/html/ess/logon.jsp, Hide
	WinMove, Kronos, x%xpos%, y%ypos%, 499, 366
	;WinSet, Color, 000111
	WinSet, Transparent, 150
	ClockOutButton()
	WinActivate, ahk_class IEFrame
	Gui, Destroy
	return
	}

2Cancel:
	{
;	Gui, Submit
	Gui, Destroy
	MsgBox, , How are you going to clock out now bro?! Windows+Space to bring it back.
	Return
	}