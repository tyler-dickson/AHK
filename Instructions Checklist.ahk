#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force


; https://www.reddit.com/r/AutoHotkey/comments/6btd9c/draw_5_video_poker/dhqjnw0/



Gui, New, AlwaysOnTop, Instructions Checklist
Gui, Add, Tab3, ,Instructions|To be determined...
Gui, Font, underline
Gui, Tab, 1
Gui, Add, Checkbox, gStep1 vStep1, Open Client Code.
Gui, Add, Checkbox, gStep2 vStep2, Check as much bibliographic data`nas possible to confirm on correct record. 
Gui, Add, Checkbox, gStep3 vStep3, Read email to determine next step. 
Gui, Add, Checkbox, gStep4 vStep4, Update docket as needed. 
Gui, Add, Checkbox, gStep5 vStep5, Save email and attachments to WorkSpace. 
Gui, Add, Checkbox, gStep6 vStep6, Attach saved documents to email.
Gui, Add, Checkbox, gStep7 vStep7, Add prosecution team and AT partner to email.
Gui, Add, Checkbox, gStep8 vStep8, Double-check your work and send your email.
Gui, Add, Button, gClear, Clear
Gui, Tab, 2
Gui, Font,
Gui, Add, Text, , Nothing here yet... except some test stuff.
Gui, Add, Edit, Center ReadOnly vEditText w100, 50000
Gui, Add, Slider, ToolTip Buddy2EditText vSlider Range1-100000 gSliderRel AltSubmit, 50000
Gui, Add, Edit, Section vUpDownEdit w100 Center, 
Gui, Add, UpDown, Wrap Right vUpDown gUpDown Range1-100, 50
Gui, Add, Button, xp+115 yp gRandomNumber, Generate Random Number
Gui, Add, Edit, xp yp+25 wp Center vRandomNumber, 0
Gui, Add, Checkbox, xs, This is a checkbox.
Gui, Add, Checkbox, xs+115 yp, Another checkbox.
Gui, Add, Radio, xs yp+25 Group Center, 1st Radio Button.
Gui, Add, Radio, xp+115 yp Center, 2nd Radio Button.
Gui, Add, Radio, xs yp+25 Center, 3rd Radio Button.
Gui, Add, Radio, xp+115 yp Center, 3rd Radio Button.
OnMessage(0x200, "Help")
Gui, Show
Return 

RandomNumber:
Random, RandomNumber, 1, 100000
GuiControl, , RandomNumber, %RandomNumber%
return

SliderRel: 
Gui, Submit, NoHide 
GuiControl,, EditText, %Slider% 
Return 

UpDown:
Gui, Submit, NoHide 
GuiControl,, UpDownEdit, %UpDown%
return


Step1:
Step2:
Step3:
Step4:
Step5:
Step6:
Step7:
Step8:
Gui, Submit, NoHide
Loop 8
{
if Step%A_Index% = 1
	{
	Gui, Font, strike underline
	GuiControl, Font, Button%A_Index%
	Gui, Font, norm
	}
else if Step%A_Index% = 0
	{
	Gui, Font, norm underline
	GuiControl, Font, Button%A_Index%
	Gui, Font, norm
	}
}
return

Clear:
Loop 8
{
Gui, Font, norm underline
GuiControl, , Button%A_Index%, 0
GuiControl, Font, Button%A_Index%
}
return

Help(wParam, lParam, Msg) {
MouseGetPos,,,, OutputVarControl
IfEqual, OutputVarControl, Button1
	Help := "You can use the AHK Record Opener to quickly open a Client Code in docketing."
else IfEqual, OutputVarControl, Button2
	Help := "You should check the Client Code, Application Number, Agent Reference, and/or the Patent/PCT Number."
else IfEqual, OutputVarControl, Button3
	Help := "You should check which actions are currently open for a hint of what you need to do next."
else IfEqual, OutputVarControl, Button4
	Help := "This could include closing and/or opening actions on the docket.`nKeep an eye out for formal documents like POA, Assignment, or Priority Documents."
else IfEqual, OutputVarControl, Button5
	Help := "Naming conventions are pretty loose. Name the document something that easily conveys the contents."
else IfEqual, OutputVarControl, Button6
	Help := "Make sure you attach your saved documents to your email! If you forget, your AT partner will let you know."	
else IfEqual, OutputVarControl, Button7
	Help := "You can use the AHK Attorney Finder to quickly add the prosecution teams.`nMake sure to add *IntFees, *IntExams, *Invoices, or any other groups."			
else IfEqual, OutputVarControl, Button8
	Help := "This is the point of no return! Make sure you've covered every other step before sending your email."			
	
	
	
TrayTip,  , % Help, 
Sleep 500
}

GuiClose:
ExitApp
return


