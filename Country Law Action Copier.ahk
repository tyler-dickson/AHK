; Created with AutoHotkey by Tyler Dickson. 

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 56


Gui, New, AlwaysOnTop +ToolWindow, Country Law Action Grabber

Gui, Add, Tab3,x0 y0 w213 h314 -Wrap, 1|2|3|4|5|6|7|8|9|10
Gui, Tab, 1
Gui, Add, Text, Center x5 yp+25  h25 w200, Action Due
Gui, Add, Edit, Center xp yp+15 vActionDue hp-5  wp, 
Gui, Add, Text, Center x5 yp+25  h25 w200, Action Type
Gui, Add, Edit, Center xp yp+15 vActionType hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Based On
Gui, Add, Edit, Center xp yp+15 vBasedOn hp-5  wp, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, Recurring
Gui, Add, Edit, Center xp yp+15 vRecurring hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w60, Year
Gui, Add, Edit, Center xp yp+15 vYear hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Month
Gui, Add, Edit, Center xp yp+15 vMonth hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Day
Gui, Add, Edit, Center xp yp+15 vDay hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w85, Indicator
Gui, Add, Edit, Center xp yp+15 vIndicator hp-5  wp, 
Gui, Add, Checkbox, Center xp+94 yp  h20 w15 vGenerateAction,
Gui, Add, Text, Center xp+22 yp-16 h25 w85, Effective Period
Gui, Add, Edit, Center xp yp+15 hp-5 vEffectivePeriod wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Made From
Gui, Add, Edit, Center xp yp+15 hp-5  wp vMadeFrom, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, To
Gui, Add, Edit, Center xp yp+15 hp-5 vTo wp, 
Gui, Add, Button, Center x5 yp+27  h40 w60 gGrab, Grab
Gui, Add, Button, Center xp+70 yp h40 w60 gInject, Inject
Gui, Add, Button, Center xp+70 yp h40 w60 gClear, Clear
Gui, Add, Text, Center x92 y185 h12 w27, Gen?


Gui, Tab, 2
Gui, Add, Text, Center x5 y25  h25 w200, Action Due
Gui, Add, Edit, Center xp yp+15 vActionDue2 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25  h25 w200, Action Type
Gui, Add, Edit, Center xp yp+15 vActionType2 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Based On
Gui, Add, Edit, Center xp yp+15 vBasedOn2 hp-5  wp, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, Recurring
Gui, Add, Edit, Center xp yp+15 vRecurring2 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w60, Year
Gui, Add, Edit, Center xp yp+15 vYear2 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Month
Gui, Add, Edit, Center xp yp+15 vMonth2 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Day
Gui, Add, Edit, Center xp yp+15 vDay2 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w85, Indicator
Gui, Add, Edit, Center xp yp+15 vIndicator2 hp-5  wp, 
Gui, Add, Checkbox, Center xp+94 yp  h20 w15 vGenerateAction2,
Gui, Add, Text, Center xp+22 yp-16 h25 w85, Effective Period
Gui, Add, Edit, Center xp yp+15 hp-5 vEffectivePeriod2 wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Made From
Gui, Add, Edit, Center xp yp+15 hp-5  wp vMadeFrom2, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, To
Gui, Add, Edit, Center xp yp+15 hp-5 vTo2 wp, 
Gui, Add, Button, Center x5 yp+27  h40 w60 gGrab2, Grab
Gui, Add, Button, Center xp+70 yp h40 w60 gInject2, Inject
Gui, Add, Button, Center xp+70 yp h40 w60 gClear2, Clear
Gui, Add, Text, Center x92 y185 h12 w27, Gen?

Gui, Tab, 3
Gui, Add, Text, Center x5 y25  h25 w200, Action Due
Gui, Add, Edit, Center xp yp+15 vActionDue3 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25  h25 w200, Action Type
Gui, Add, Edit, Center xp yp+15 vActionType3 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Based On
Gui, Add, Edit, Center xp yp+15 vBasedOn3 hp-5  wp, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, Recurring
Gui, Add, Edit, Center xp yp+15 vRecurring3 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w60, Year
Gui, Add, Edit, Center xp yp+15 vYear3 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Month
Gui, Add, Edit, Center xp yp+15 vMonth3 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Day
Gui, Add, Edit, Center xp yp+15 vDay3 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w85, Indicator
Gui, Add, Edit, Center xp yp+15 vIndicator3 hp-5  wp, 
Gui, Add, Checkbox, Center xp+94 yp  h20 w15 vGenerateAction3,
Gui, Add, Text, Center xp+22 yp-16 h25 w85, Effective Period
Gui, Add, Edit, Center xp yp+15 hp-5 vEffectivePeriod3 wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Made From
Gui, Add, Edit, Center xp yp+15 hp-5  wp vMadeFrom3, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, To
Gui, Add, Edit, Center xp yp+15 hp-5 vTo3 wp, 
Gui, Add, Button, Center x5 yp+27  h40 w60 gGrab3, Grab
Gui, Add, Button, Center xp+70 yp h40 w60 gInject3, Inject
Gui, Add, Button, Center xp+70 yp h40 w60 gClear3, Clear
Gui, Add, Text, Center x92 y185 h12 w27, Gen?

Gui, Tab, 4
Gui, Add, Text, Center x5 y25  h25 w200, Action Due
Gui, Add, Edit, Center xp yp+15 vActionDue4 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25  h25 w200, Action Type
Gui, Add, Edit, Center xp yp+15 vActionType4 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Based On
Gui, Add, Edit, Center xp yp+15 vBasedOn4 hp-5  wp, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, Recurring
Gui, Add, Edit, Center xp yp+15 vRecurring4 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w60, Year
Gui, Add, Edit, Center xp yp+15 vYear4 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Month
Gui, Add, Edit, Center xp yp+15 vMonth4 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Day
Gui, Add, Edit, Center xp yp+15 vDay4 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w85, Indicator
Gui, Add, Edit, Center xp yp+15 vIndicator4 hp-5  wp, 
Gui, Add, Checkbox, Center xp+94 yp  h20 w15 vGenerateAction4,
Gui, Add, Text, Center xp+22 yp-16 h25 w85, Effective Period
Gui, Add, Edit, Center xp yp+15 hp-5 vEffectivePeriod4 wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Made From
Gui, Add, Edit, Center xp yp+15 hp-5  wp vMadeFrom4, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, To
Gui, Add, Edit, Center xp yp+15 hp-5 vTo4 wp, 
Gui, Add, Button, Center x5 yp+27  h40 w60 gGrab4, Grab
Gui, Add, Button, Center xp+70 yp h40 w60 gInject4, Inject
Gui, Add, Button, Center xp+70 yp h40 w60 gClear4, Clear
Gui, Add, Text, Center x92 y185 h12 w27, Gen?

Gui, Tab, 5
Gui, Add, Text, Center x5 y25  h25 w200, Action Due
Gui, Add, Edit, Center xp yp+15 vActionDue5 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25  h25 w200, Action Type
Gui, Add, Edit, Center xp yp+15 vActionType5 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Based On
Gui, Add, Edit, Center xp yp+15 vBasedOn5 hp-5  wp, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, Recurring
Gui, Add, Edit, Center xp yp+15 vRecurring5 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w60, Year
Gui, Add, Edit, Center xp yp+15 vYear5 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Month
Gui, Add, Edit, Center xp yp+15 vMonth5 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Day
Gui, Add, Edit, Center xp yp+15 vDay5 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w85, Indicator
Gui, Add, Edit, Center xp yp+15 vIndicator5 hp-5  wp, 
Gui, Add, Checkbox, Center xp+94 yp  h20 w15 vGenerateAction5,
Gui, Add, Text, Center xp+22 yp-16 h25 w85, Effective Period
Gui, Add, Edit, Center xp yp+15 hp-5 vEffectivePeriod5 wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Made From
Gui, Add, Edit, Center xp yp+15 hp-5  wp vMadeFrom5, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, To
Gui, Add, Edit, Center xp yp+15 hp-5 vTo5 wp, 
Gui, Add, Button, Center x5 yp+27  h40 w60 gGrab5, Grab
Gui, Add, Button, Center xp+70 yp h40 w60 gInject5, Inject
Gui, Add, Button, Center xp+70 yp h40 w60 gClear5, Clear
Gui, Add, Text, Center x92 y185 h12 w27, Gen?

Gui, Tab, 6
Gui, Add, Text, Center x5 y25  h25 w200, Action Due
Gui, Add, Edit, Center xp yp+15 vActionDue6 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25  h25 w200, Action Type
Gui, Add, Edit, Center xp yp+15 vActionType6 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Based On
Gui, Add, Edit, Center xp yp+15 vBasedOn6 hp-5  wp, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, Recurring
Gui, Add, Edit, Center xp yp+15 vRecurring6 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w60, Year
Gui, Add, Edit, Center xp yp+15 vYear6 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Month
Gui, Add, Edit, Center xp yp+15 vMonth6 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Day
Gui, Add, Edit, Center xp yp+15 vDay6 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w85, Indicator
Gui, Add, Edit, Center xp yp+15 vIndicator6 hp-5  wp, 
Gui, Add, Checkbox, Center xp+94 yp  h20 w15 vGenerateAction6,
Gui, Add, Text, Center xp+22 yp-16 h25 w85, Effective Period
Gui, Add, Edit, Center xp yp+15 hp-5 vEffectivePeriod6 wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Made From
Gui, Add, Edit, Center xp yp+15 hp-5  wp vMadeFrom6, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, To
Gui, Add, Edit, Center xp yp+15 hp-5 vTo6 wp, 
Gui, Add, Button, Center x5 yp+27  h40 w60 gGrab6, Grab
Gui, Add, Button, Center xp+70 yp h40 w60 gInject6, Inject
Gui, Add, Button, Center xp+70 yp h40 w60 gClear6, Clear
Gui, Add, Text, Center x92 y185 h12 w27, Gen?

Gui, Tab, 7
Gui, Add, Text, Center x5 y25  h25 w200, Action Due
Gui, Add, Edit, Center xp yp+15 vActionDue7 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25  h25 w200, Action Type
Gui, Add, Edit, Center xp yp+15 vActionType7 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Based On
Gui, Add, Edit, Center xp yp+15 vBasedOn7 hp-5  wp, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, Recurring
Gui, Add, Edit, Center xp yp+15 vRecurring7 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w60, Year
Gui, Add, Edit, Center xp yp+15 vYear7 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Month
Gui, Add, Edit, Center xp yp+15 vMonth7 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Day
Gui, Add, Edit, Center xp yp+15 vDay7 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w85, Indicator
Gui, Add, Edit, Center xp yp+15 vIndicator7 hp-5  wp, 
Gui, Add, Checkbox, Center xp+94 yp  h20 w15 vGenerateAction7,
Gui, Add, Text, Center xp+22 yp-16 h25 w85, Effective Period
Gui, Add, Edit, Center xp yp+15 hp-5 vEffectivePeriod7 wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Made From
Gui, Add, Edit, Center xp yp+15 hp-5  wp vMadeFrom7, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, To
Gui, Add, Edit, Center xp yp+15 hp-5 vTo7 wp, 
Gui, Add, Button, Center x5 yp+27  h40 w60 gGrab7, Grab
Gui, Add, Button, Center xp+70 yp h40 w60 gInject7, Inject
Gui, Add, Button, Center xp+70 yp h40 w60 gClear7, Clear
Gui, Add, Text, Center x92 y185 h12 w27, Gen?

Gui, Tab, 8
Gui, Add, Text, Center x5 y25  h25 w200, Action Due
Gui, Add, Edit, Center xp yp+15 vActionDue8 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25  h25 w200, Action Type
Gui, Add, Edit, Center xp yp+15 vActionType8 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Based On
Gui, Add, Edit, Center xp yp+15 vBasedOn8 hp-5  wp, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, Recurring
Gui, Add, Edit, Center xp yp+15 vRecurring8 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w60, Year
Gui, Add, Edit, Center xp yp+15 vYear8 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Month
Gui, Add, Edit, Center xp yp+15 vMonth8 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Day
Gui, Add, Edit, Center xp yp+15 vDay8 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w85, Indicator
Gui, Add, Edit, Center xp yp+15 vIndicator8 hp-5  wp, 
Gui, Add, Checkbox, Center xp+94 yp  h20 w15 vGenerateAction8,
Gui, Add, Text, Center xp+22 yp-16 h25 w85, Effective Period
Gui, Add, Edit, Center xp yp+15 hp-5 vEffectivePeriod8 wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Made From
Gui, Add, Edit, Center xp yp+15 hp-5  wp vMadeFrom8, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, To
Gui, Add, Edit, Center xp yp+15 hp-5 vTo8 wp, 
Gui, Add, Button, Center x5 yp+27  h40 w60 gGrab8, Grab
Gui, Add, Button, Center xp+70 yp h40 w60 gInject8, Inject
Gui, Add, Button, Center xp+70 yp h40 w60 gClear8, Clear
Gui, Add, Text, Center x92 y185 h12 w27, Gen?

Gui, Tab, 9
Gui, Add, Text, Center x5 y25  h25 w200, Action Due
Gui, Add, Edit, Center xp yp+15 vActionDue9 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25  h25 w200, Action Type
Gui, Add, Edit, Center xp yp+15 vActionType9 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Based On
Gui, Add, Edit, Center xp yp+15 vBasedOn9 hp-5  wp, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, Recurring
Gui, Add, Edit, Center xp yp+15 vRecurring9 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w60, Year
Gui, Add, Edit, Center xp yp+15 vYear9 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Month
Gui, Add, Edit, Center xp yp+15 vMonth9 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Day
Gui, Add, Edit, Center xp yp+15 vDay9 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w85, Indicator
Gui, Add, Edit, Center xp yp+15 vIndicator9 hp-5  wp, 
Gui, Add, Checkbox, Center xp+94 yp  h20 w15 vGenerateAction9,
Gui, Add, Text, Center xp+22 yp-16 h25 w85, Effective Period
Gui, Add, Edit, Center xp yp+15 hp-5 vEffectivePeriod9 wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Made From
Gui, Add, Edit, Center xp yp+15 hp-5  wp vMadeFrom9, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, To
Gui, Add, Edit, Center xp yp+15 hp-5 vTo9 wp, 
Gui, Add, Button, Center x5 yp+27  h40 w60 gGrab9, Grab
Gui, Add, Button, Center xp+70 yp h40 w60 gInject9, Inject
Gui, Add, Button, Center xp+70 yp h40 w60 gClear9, Clear
Gui, Add, Text, Center x92 y185 h12 w27, Gen?

Gui, Tab, 10
Gui, Add, Text, Center x5 y25  h25 w200, Action Due
Gui, Add, Edit, Center xp yp+15 vActionDue10 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25  h25 w200, Action Type
Gui, Add, Edit, Center xp yp+15 vActionType10 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Based On
Gui, Add, Edit, Center xp yp+15 vBasedOn10 hp-5  wp, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, Recurring
Gui, Add, Edit, Center xp yp+15 vRecurring10 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w60, Year
Gui, Add, Edit, Center xp yp+15 vYear10 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Month
Gui, Add, Edit, Center xp yp+15 vMonth10 hp-5  wp, 
Gui, Add, Text, Center xp+70 yp-15 h25 w60, Day
Gui, Add, Edit, Center xp yp+15 vDay10 hp-5  wp, 
Gui, Add, Text, Center x5 yp+25 h25 w85, Indicator
Gui, Add, Edit, Center xp yp+15 vIndicator10 hp-5  wp, 
Gui, Add, Checkbox, Center xp+94 yp  h20 w15 vGenerateAction10,
Gui, Add, Text, Center xp+22 yp-16 h25 w85, Effective Period
Gui, Add, Edit, Center xp yp+15 hp-5 vEffectivePeriod10 wp, 
Gui, Add, Text, Center x5 yp+25 h25 w95, Made From
Gui, Add, Edit, Center xp yp+15 hp-5  wp vMadeFrom10, 
Gui, Add, Text, Center xp+105 yp-15 h25 w95, To
Gui, Add, Edit, Center xp yp+15 hp-5 vTo10 wp, 
Gui, Add, Button, Center x5 yp+27  h40 w60 gGrab10, Grab
Gui, Add, Button, Center xp+70 yp h40 w60 gInject10, Inject
Gui, Add, Button, Center xp+70 yp h40 w60 gClear10, Clear
Gui, Add, Text, Center x92 y185 h12 w27, Gen?

Loop 110
	{
	IniRead, temp, %A_Desktop%/CountryLawCopier.ini, ActionGrabber, %A_Index%
		if temp = ERROR
			temp = 
	GuiControl, , Edit%A_Index%, %temp%
	}

IniRead, chkbox1,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 111
IniRead, chkbox2,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 112
IniRead, chkbox3,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 113
IniRead, chkbox4,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 114
IniRead, chkbox5,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 115
IniRead, chkbox6,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 116
IniRead, chkbox7,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 117
IniRead, chkbox8,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 118
IniRead, chkbox9,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 119
IniRead, chkbox10, %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 120

GuiControl, , Button1,  %chkbox1%
GuiControl, , Button5,  %chkbox2%
GuiControl, , Button9,  %chkbox3%
GuiControl, , Button13, %chkbox4%
GuiControl, , Button17, %chkbox5%
GuiControl, , Button21, %chkbox6%
GuiControl, , Button25, %chkbox7%
GuiControl, , Button29, %chkbox8%
GuiControl, , Button33, %chkbox9%
GuiControl, , Button37, %chkbox10%
Gui, Show, w210 h314
return


Grab:
ie := WBGet()
ActionDue  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label3").innerText
ActionType 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label5").innerText
BasedOn  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label4").innerText
Recurring  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label6").innerText
;;;;; Terms ;;;;;
Year 		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label8").innerText
Month		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label9").innerText
Day		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label10").innerText
Indicator 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label7").innerText
GenerateAction := "can't select"  ;;; CHECKED
EffectivePeriod := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label12").innerText
MadeFrom := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label13").innerText
To := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label14").innerText

IMGS := ie.document.getElementsByTagName("IMG").length

Loop % IMGS
	{
	temp := ie.document.getElementsByTagName("IMG")[A_Index-1].src
	if Instr(temp, "icon_checkbox_true") ;<IMG src="images/icon_checkbox_true.gif">
		{
		GenerateAction := 1
		break
		}
	if Instr(temp, "icon_checkbox_false") ;<IMG src="images/icon_checkbox_false.gif">
		{
		GenerateAction := 0
		break
		}		
	}

GuiControl, , Edit1, %ActionDue%
GuiControl, , Edit2, %ActionType%
GuiControl, , Edit3, %BasedOn%
GuiControl, , Edit4, %Recurring%
GuiControl, , Edit5, %Year%
GuiControl, , Edit6, %Month%
GuiControl, , Edit7, %Day%
GuiControl, , Edit8, %Indicator%
GuiControl, , Edit9, %EffectivePeriod%
GuiControl, , Edit10, %MadeFrom%
GuiControl, , Edit11, %To%
GuiControl, , Button1, %GenerateAction%
return

Clear:
GuiControl, , Edit1,
GuiControl, , Edit2, 
GuiControl, , Edit3,
GuiControl, , Edit4, 
GuiControl, , Edit5, 
GuiControl, , Edit6, 
GuiControl, , Edit7, 
GuiControl, , Edit8, 
GuiControl, , Edit9,
GuiControl, , Edit10, 
GuiControl, , Edit11, 
GuiControl, , Button1, 0
return

Grab2:
ie := WBGet()
ActionDue2  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label3").innerText
ActionType2 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label5").innerText
BasedOn2  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label4").innerText
Recurring2  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label6").innerText
;;;;; Terms ;;;;;
Year2 		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label8").innerText
Month2		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label9").innerText
Day2		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label10").innerText
Indicator2 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label7").innerText
GenerateAction2 := "can't select"  ;;; CHECKED
EffectivePeriod2 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label12").innerText
MadeFrom2 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label13").innerText
To2 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label14").innerText

IMGS := ie.document.getElementsByTagName("IMG").length

Loop % IMGS
	{
	temp := ie.document.getElementsByTagName("IMG")[A_Index-1].src
	if Instr(temp, "icon_checkbox_true") ;<IMG src="images/icon_checkbox_true.gif">
		{
		GenerateAction2 := 1
		break
		}
	if Instr(temp, "icon_checkbox_false") ;<IMG src="images/icon_checkbox_false.gif">
		{
		GenerateAction2 := 0
		break
		}		
	}

GuiControl, , Edit12, %ActionDue2%
GuiControl, , Edit13, %ActionType2%
GuiControl, , Edit14, %BasedOn2%
GuiControl, , Edit15, %Recurring2%
GuiControl, , Edit16, %Year2%
GuiControl, , Edit17, %Month2%
GuiControl, , Edit18, %Day2%
GuiControl, , Edit19, %Indicator2%
GuiControl, , Edit20, %EffectivePeriod2%
GuiControl, , Edit21, %MadeFrom2%
GuiControl, , Edit22, %To2%
GuiControl, , Button5, %GenerateAction2%
return

Clear2:
GuiControl, , Edit12,
GuiControl, , Edit13,
GuiControl, , Edit14,
GuiControl, , Edit15, 
GuiControl, , Edit16, 
GuiControl, , Edit17,
GuiControl, , Edit18,
GuiControl, , Edit19,
GuiControl, , Edit20, 
GuiControl, , Edit21, 
GuiControl, , Edit22,
GuiControl, , Button5, 0
return

Grab3:
ie := WBGet()
ActionDue3  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label3").innerText
ActionType3 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label5").innerText
BasedOn3  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label4").innerText
Recurring3  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label6").innerText
;;;;; Terms ;;;;;
Year3 		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label8").innerText
Month3		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label9").innerText
Day3	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label10").innerText
Indicator3 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label7").innerText
GenerateAction3 := "can't select"  ;;; CHECKED
EffectivePeriod3 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label12").innerText
MadeFrom3 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label13").innerText
To3 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label14").innerText

IMGS := ie.document.getElementsByTagName("IMG").length

Loop % IMGS
	{
	temp := ie.document.getElementsByTagName("IMG")[A_Index-1].src
	if Instr(temp, "icon_checkbox_true") ;<IMG src="images/icon_checkbox_true.gif">
		{
		GenerateAction3 := 1
		break
		}
	if Instr(temp, "icon_checkbox_false") ;<IMG src="images/icon_checkbox_false.gif">
		{
		GenerateAction3 := 0
		break
		}		
	}

GuiControl, , Edit23, %ActionDue3%
GuiControl, , Edit24, %ActionType3%
GuiControl, , Edit25, %BasedOn3%
GuiControl, , Edit26, %Recurring3%
GuiControl, , Edit27, %Year3%
GuiControl, , Edit28, %Month3%
GuiControl, , Edit29, %Day3%
GuiControl, , Edit30, %Indicator3%
GuiControl, , Edit31, %EffectivePeriod3%
GuiControl, , Edit32, %MadeFrom3%
GuiControl, , Edit33, %To3%
GuiControl, , Button9, %GenerateAction3%
return

Clear3:
GuiControl, , Edit23, 
GuiControl, , Edit24, 
GuiControl, , Edit25,
GuiControl, , Edit26, 
GuiControl, , Edit27, 
GuiControl, , Edit28,
GuiControl, , Edit29, 
GuiControl, , Edit30, 
GuiControl, , Edit31,
GuiControl, , Edit32, 
GuiControl, , Edit33, 
GuiControl, , Button9, 0
return

Grab4:
ie := WBGet()
ActionDue4  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label3").innerText
ActionType4 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label5").innerText
BasedOn4  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label4").innerText
Recurring4  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label6").innerText
;;;;; Terms ;;;;;
Year4		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label8").innerText
Month4		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label9").innerText
Day4	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label10").innerText
Indicator4 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label7").innerText
GenerateAction4 := "can't select"  ;;; CHECKED
EffectivePeriod4 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label12").innerText
MadeFrom4 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label13").innerText
To4 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label14").innerText

IMGS := ie.document.getElementsByTagName("IMG").length

Loop % IMGS
	{
	temp := ie.document.getElementsByTagName("IMG")[A_Index-1].src
	if Instr(temp, "icon_checkbox_true") ;<IMG src="images/icon_checkbox_true.gif">
		{
		GenerateAction4 := 1
		break
		}
	if Instr(temp, "icon_checkbox_false") ;<IMG src="images/icon_checkbox_false.gif">
		{
		GenerateAction4 := 0
		break
		}		
	}

GuiControl, , Edit34, %ActionDue4%
GuiControl, , Edit35, %ActionType4%
GuiControl, , Edit36, %BasedOn4%
GuiControl, , Edit37, %Recurring4%
GuiControl, , Edit38, %Year4%
GuiControl, , Edit39, %Month4%
GuiControl, , Edit40, %Day4%
GuiControl, , Edit41, %Indicator4%
GuiControl, , Edit42, %EffectivePeriod4%
GuiControl, , Edit43, %MadeFrom4%
GuiControl, , Edit44, %To4%
GuiControl, , Button13, %GenerateAction4%
return

Clear4:
GuiControl, , Edit34,
GuiControl, , Edit35,
GuiControl, , Edit36,
GuiControl, , Edit37,
GuiControl, , Edit38,
GuiControl, , Edit39, 
GuiControl, , Edit40,
GuiControl, , Edit41, 
GuiControl, , Edit42,
GuiControl, , Edit43, 
GuiControl, , Edit44, 
GuiControl, , Button13, 0
return

Grab5:
ie := WBGet()
ActionDue5  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label3").innerText
ActionType5 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label5").innerText
BasedOn5  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label4").innerText
Recurring5  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label6").innerText
;;;;; Terms ;;;;;
Year5		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label8").innerText
Month5		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label9").innerText
Day5	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label10").innerText
Indicator5 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label7").innerText
GenerateAction5 := "can't select"  ;;; CHECKED
EffectivePeriod5 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label12").innerText
MadeFrom5 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label13").innerText
To5 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label14").innerText

IMGS := ie.document.getElementsByTagName("IMG").length

Loop % IMGS
	{
	temp := ie.document.getElementsByTagName("IMG")[A_Index-1].src
	if Instr(temp, "icon_checkbox_true") ;<IMG src="images/icon_checkbox_true.gif">
		{
		GenerateAction5 := 1
		break
		}
	if Instr(temp, "icon_checkbox_false") ;<IMG src="images/icon_checkbox_false.gif">
		{
		GenerateAction5 := 0
		break
		}		
	}

GuiControl, , Edit45, %ActionDue5%
GuiControl, , Edit46, %ActionType5%
GuiControl, , Edit47, %BasedOn5%
GuiControl, , Edit48, %Recurring5%
GuiControl, , Edit49, %Year5%
GuiControl, , Edit50, %Month5%
GuiControl, , Edit51, %Day5%
GuiControl, , Edit52, %Indicator5%
GuiControl, , Edit53, %EffectivePeriod5%
GuiControl, , Edit54, %MadeFrom5%
GuiControl, , Edit55, %To5%
GuiControl, , Button17, %GenerateAction5%
return

Clear5:
GuiControl, , Edit45, 
GuiControl, , Edit46, 
GuiControl, , Edit47, 
GuiControl, , Edit48, 
GuiControl, , Edit49, 
GuiControl, , Edit50, 
GuiControl, , Edit51, 
GuiControl, , Edit52, 
GuiControl, , Edit53, 
GuiControl, , Edit54, 
GuiControl, , Edit55, 
GuiControl, , Button17, 0
return


Grab6:
ie := WBGet()
ActionDue6  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label3").innerText
ActionType6 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label5").innerText
BasedOn6  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label4").innerText
Recurring6  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label6").innerText
;;;;; Terms ;;;;;
Year6		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label8").innerText
Month6		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label9").innerText
Day6	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label10").innerText
Indicator6 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label7").innerText
GenerateAction6 := "can't select"  ;;; CHECKED
EffectivePeriod6 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label12").innerText
MadeFrom6 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label13").innerText
To6 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label14").innerText

IMGS := ie.document.getElementsByTagName("IMG").length

Loop % IMGS
	{
	temp := ie.document.getElementsByTagName("IMG")[A_Index-1].src
	if Instr(temp, "icon_checkbox_true") ;<IMG src="images/icon_checkbox_true.gif">
		{
		GenerateAction6 := 1
		break
		}
	if Instr(temp, "icon_checkbox_false") ;<IMG src="images/icon_checkbox_false.gif">
		{
		GenerateAction6 := 0
		break
		}		
	}

GuiControl, , Edit56, %ActionDue6%
GuiControl, , Edit57, %ActionType6%
GuiControl, , Edit58, %BasedOn6%
GuiControl, , Edit59, %Recurring6%
GuiControl, , Edit60, %Year6%
GuiControl, , Edit61, %Month6%
GuiControl, , Edit62, %Day6%
GuiControl, , Edit63, %Indicator6%
GuiControl, , Edit64, %EffectivePeriod6%
GuiControl, , Edit65, %MadeFrom6%
GuiControl, , Edit66, %To6%
GuiControl, , Button21, %GenerateAction6%
return

Clear6:
GuiControl, , Edit56, 
GuiControl, , Edit57, 
GuiControl, , Edit58, 
GuiControl, , Edit59, 
GuiControl, , Edit60, 
GuiControl, , Edit61, 
GuiControl, , Edit62, 
GuiControl, , Edit63, 
GuiControl, , Edit64, 
GuiControl, , Edit65, 
GuiControl, , Edit66, 
GuiControl, , Button21, 0
return

Grab7:
ie := WBGet()
ActionDue7  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label3").innerText
ActionType7 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label5").innerText
BasedOn7 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label4").innerText
Recurring7  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label6").innerText
;;;;; Terms ;;;;;
Year7		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label8").innerText
Month7		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label9").innerText
Day7	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label10").innerText
Indicator7 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label7").innerText
GenerateAction7 := "can't select"  ;;; CHECKED
EffectivePeriod7 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label12").innerText
MadeFrom7 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label13").innerText
To7 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label14").innerText

IMGS := ie.document.getElementsByTagName("IMG").length

Loop % IMGS
	{
	temp := ie.document.getElementsByTagName("IMG")[A_Index-1].src
	if Instr(temp, "icon_checkbox_true") ;<IMG src="images/icon_checkbox_true.gif">
		{
		GenerateAction7 := 1
		break
		}
	if Instr(temp, "icon_checkbox_false") ;<IMG src="images/icon_checkbox_false.gif">
		{
		GenerateAction7 := 0
		break
		}		
	}

GuiControl, , Edit67, %ActionDue7%
GuiControl, , Edit68, %ActionType7%
GuiControl, , Edit69, %BasedOn7%
GuiControl, , Edit70, %Recurring7%
GuiControl, , Edit71, %Year7%
GuiControl, , Edit72, %Month7%
GuiControl, , Edit73, %Day7%
GuiControl, , Edit74, %Indicator7%
GuiControl, , Edit75, %EffectivePeriod7%
GuiControl, , Edit76, %MadeFrom7%
GuiControl, , Edit77, %To7%
GuiControl, , Button25, %GenerateAction7%
return

Clear7:
GuiControl, , Edit67, 
GuiControl, , Edit68, 
GuiControl, , Edit69, 
GuiControl, , Edit70, 
GuiControl, , Edit71, 
GuiControl, , Edit72, 
GuiControl, , Edit73, 
GuiControl, , Edit74, 
GuiControl, , Edit75, 
GuiControl, , Edit76, 
GuiControl, , Edit77, 
GuiControl, , Button25, 0
return


Grab8:
ie := WBGet()
ActionDue8  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label3").innerText
ActionType8 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label5").innerText
BasedOn8 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label4").innerText
Recurring8  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label6").innerText
;;;;; Terms ;;;;;
Year8		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label8").innerText
Month8		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label9").innerText
Day8	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label10").innerText
Indicator8 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label7").innerText
GenerateAction8 := "can't select"  ;;; CHECKED
EffectivePeriod8 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label12").innerText
MadeFrom8 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label13").innerText
To8 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label14").innerText

IMGS := ie.document.getElementsByTagName("IMG").length

Loop % IMGS
	{
	temp := ie.document.getElementsByTagName("IMG")[A_Index-1].src
	if Instr(temp, "icon_checkbox_true") ;<IMG src="images/icon_checkbox_true.gif">
		{
		GenerateAction8 := 1
		break
		}
	if Instr(temp, "icon_checkbox_false") ;<IMG src="images/icon_checkbox_false.gif">
		{
		GenerateAction8 := 0
		break
		}		
	}

GuiControl, , Edit78, %ActionDue8%
GuiControl, , Edit79, %ActionType8%
GuiControl, , Edit80, %BasedOn8%
GuiControl, , Edit81, %Recurring8%
GuiControl, , Edit82, %Year8%
GuiControl, , Edit83, %Month8%
GuiControl, , Edit84, %Day8%
GuiControl, , Edit85, %Indicator8%
GuiControl, , Edit86, %EffectivePeriod8%
GuiControl, , Edit87, %MadeFrom8%
GuiControl, , Edit88, %To8%
GuiControl, , Button29, %GenerateAction8%
return

Clear8:
GuiControl, , Edit78,
GuiControl, , Edit79,
GuiControl, , Edit80, 
GuiControl, , Edit81, 
GuiControl, , Edit82, 
GuiControl, , Edit83, 
GuiControl, , Edit84,
GuiControl, , Edit85, 
GuiControl, , Edit86,
GuiControl, , Edit87, 
GuiControl, , Edit88,
GuiControl, , Button29, 0
return



Grab9:
ie := WBGet()
ActionDue9  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label3").innerText
ActionType9 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label5").innerText
BasedOn9 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label4").innerText
Recurring9  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label6").innerText
;;;;; Terms ;;;;;
Year9		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label8").innerText
Month9		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label9").innerText
Day9	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label10").innerText
Indicator9 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label7").innerText
GenerateAction9 := "can't select"  ;;; CHECKED
EffectivePeriod9 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label12").innerText
MadeFrom9 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label13").innerText
To9 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label14").innerText

IMGS := ie.document.getElementsByTagName("IMG").length

Loop % IMGS
	{
	temp := ie.document.getElementsByTagName("IMG")[A_Index-1].src
	if Instr(temp, "icon_checkbox_true") ;<IMG src="images/icon_checkbox_true.gif">
		{
		GenerateAction9 := 1
		break
		}
	if Instr(temp, "icon_checkbox_false") ;<IMG src="images/icon_checkbox_false.gif">
		{
		GenerateAction9 := 0
		break
		}		
	}

GuiControl, , Edit89, %ActionDue9%
GuiControl, , Edit90, %ActionType9%
GuiControl, , Edit91, %BasedOn9%
GuiControl, , Edit92, %Recurring9%
GuiControl, , Edit93, %Year9%
GuiControl, , Edit94, %Month9%
GuiControl, , Edit95, %Day9%
GuiControl, , Edit96, %Indicator9%
GuiControl, , Edit97, %EffectivePeriod9%
GuiControl, , Edit98, %MadeFrom9%
GuiControl, , Edit99, %To9%
GuiControl, , Button33, %GenerateAction9%
return

Clear9:
GuiControl, , Edit89, 
GuiControl, , Edit90, 
GuiControl, , Edit91,
GuiControl, , Edit92, 
GuiControl, , Edit93, 
GuiControl, , Edit94, 
GuiControl, , Edit95, 
GuiControl, , Edit96, 
GuiControl, , Edit97, 
GuiControl, , Edit98, 
GuiControl, , Edit99, 
GuiControl, , Button33, 0
return


Grab10:
ie := WBGet()
ActionDue10  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label3").innerText
ActionType10 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label5").innerText
BasedOn10 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label4").innerText
Recurring10  	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label6").innerText
;;;;; Terms ;;;;;
Year10		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label8").innerText
Month10		:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label9").innerText
Day10	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label10").innerText
Indicator10 	:= ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label7").innerText
GenerateAction10 := "can't select"  ;;; CHECKED
EffectivePeriod10 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label12").innerText
MadeFrom10 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label13").innerText
To10 := ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_Label14").innerText

IMGS := ie.document.getElementsByTagName("IMG").length

Loop % IMGS
	{
	temp := ie.document.getElementsByTagName("IMG")[A_Index-1].src
	if Instr(temp, "icon_checkbox_true") ;<IMG src="images/icon_checkbox_true.gif">
		{
		GenerateAction10 := 1
		break
		}
	if Instr(temp, "icon_checkbox_false") ;<IMG src="images/icon_checkbox_false.gif">
		{
		GenerateAction10 := 0
		break
		}		
	}

GuiControl, , Edit100, %ActionDue10%
GuiControl, , Edit101, %ActionType10%
GuiControl, , Edit102, %BasedOn10%
GuiControl, , Edit103, %Recurring10%
GuiControl, , Edit104, %Year10%
GuiControl, , Edit105, %Month10%
GuiControl, , Edit106, %Day10%
GuiControl, , Edit107, %Indicator10%
GuiControl, , Edit108, %EffectivePeriod10%
GuiControl, , Edit109, %MadeFrom10%
GuiControl, , Edit110, %To10%
GuiControl, , Button37, %GenerateAction10%
return

Clear10:
GuiControl, , Edit100, 
GuiControl, , Edit101, 
GuiControl, , Edit102, 
GuiControl, , Edit103, 
GuiControl, , Edit104, 
GuiControl, , Edit105, 
GuiControl, , Edit106, 
GuiControl, , Edit107, 
GuiControl, , Edit108, 
GuiControl, , Edit109,
GuiControl, , Edit110, 
GuiControl, , Button37, 0
return

Inject:
Gui, Submit, NoHide
ie := WBGet()
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionDue_TextBox").value := ActionDue
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionType_TextBox").value := ActionType
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboBasedOn_TextBox").value := BasedOn
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboRecurring_TextBox").value := Recurring
;;;;; Terms ;;;;;
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtYr").value := Year
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtMo").value := Month
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtDy").value := Day 
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboIndicator_TextBox").value := Indicator
if GenerateAction = 0
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := false
else
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := true
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboEffBasedOn_TextBox").value := EffectivePeriod
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffStartDate").value := MadeFrom
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffEndDate").value := To
return

Inject2:
Gui, Submit, NoHide
ie := WBGet()
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionDue_TextBox").value := ActionDue2
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionType_TextBox").value := ActionType2
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboBasedOn_TextBox").value := BasedOn2
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboRecurring_TextBox").value := Recurring2
;;;;; Terms ;;;;;
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtYr").value := Year2
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtMo").value := Month2
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtDy").value := Day2
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboIndicator_TextBox").value := Indicator2
if GenerateAction2 = 0
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := false
else
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := true
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboEffBasedOn_TextBox").value := EffectivePeriod2
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffStartDate").value := MadeFrom2
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffEndDate").value := To2
return


Inject3:
Gui, Submit, NoHide
ie := WBGet()
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionDue_TextBox").value := ActionDue3
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionType_TextBox").value := ActionType3
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboBasedOn_TextBox").value := BasedOn3
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboRecurring_TextBox").value := Recurring3
;;;;; Terms ;;;;;
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtYr").value := Year3
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtMo").value := Month3
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtDy").value := Day3
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboIndicator_TextBox").value := Indicator3
if GenerateAction3 = 0
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := false
else
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := true
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboEffBasedOn_TextBox").value := EffectivePeriod3
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffStartDate").value := MadeFrom3
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffEndDate").value := To3
return








Inject4:
Gui, Submit, NoHide
ie := WBGet()
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionDue_TextBox").value := ActionDue4
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionType_TextBox").value := ActionType4
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboBasedOn_TextBox").value := BasedOn4
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboRecurring_TextBox").value := Recurring4
;;;;; Terms ;;;;;
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtYr").value := Year4
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtMo").value := Month4
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtDy").value := Day4
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboIndicator_TextBox").value := Indicator4
if GenerateAction4 = 0
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := false
else
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := true
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboEffBasedOn_TextBox").value := EffectivePeriod4
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffStartDate").value := MadeFrom4
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffEndDate").value := To4
return

Inject5:
Gui, Submit, NoHide
ie := WBGet()
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionDue_TextBox").value := ActionDue5
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionType_TextBox").value := ActionType5
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboBasedOn_TextBox").value := BasedOn5
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboRecurring_TextBox").value := Recurring5
;;;;; Terms ;;;;;
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtYr").value := Year5
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtMo").value := Month5
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtDy").value := Day5
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboIndicator_TextBox").value := Indicator5
if GenerateAction5 = 0
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := false
else
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := true
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboEffBasedOn_TextBox").value := EffectivePeriod5
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffStartDate").value := MadeFrom5
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffEndDate").value := To5
return

Inject6:
Gui, Submit, NoHide
ie := WBGet()
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionDue_TextBox").value := ActionDue6
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionType_TextBox").value := ActionType6
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboBasedOn_TextBox").value := BasedOn6
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboRecurring_TextBox").value := Recurring6
;;;;; Terms ;;;;;
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtYr").value := Year6
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtMo").value := Month6
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtDy").value := Day6
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboIndicator_TextBox").value := Indicator6
if GenerateAction6 = 0
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := false
else
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := true
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboEffBasedOn_TextBox").value := EffectivePeriod6
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffStartDate").value := MadeFrom6
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffEndDate").value := To6
return

Inject7:
Gui, Submit, NoHide
ie := WBGet()
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionDue_TextBox").value := ActionDue7
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionType_TextBox").value := ActionType7
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboBasedOn_TextBox").value := BasedOn7
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboRecurring_TextBox").value := Recurring7
;;;;; Terms ;;;;;
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtYr").value := Year7
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtMo").value := Month7
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtDy").value := Day7
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboIndicator_TextBox").value := Indicator7
if GenerateAction7 = 0
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := false
else
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := true
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboEffBasedOn_TextBox").value := EffectivePeriod7
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffStartDate").value := MadeFrom7
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffEndDate").value := To7
return


Inject8:
Gui, Submit, NoHide
ie := WBGet()
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionDue_TextBox").value := ActionDue8
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionType_TextBox").value := ActionType8
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboBasedOn_TextBox").value := BasedOn8
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboRecurring_TextBox").value := Recurring8
;;;;; Terms ;;;;;
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtYr").value := Year8
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtMo").value := Month8
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtDy").value := Day8
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboIndicator_TextBox").value := Indicator8
if GenerateAction8 = 0
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := false
else
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := true
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboEffBasedOn_TextBox").value := EffectivePeriod8
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffStartDate").value := MadeFrom8
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffEndDate").value := To8
return

Inject9:
Gui, Submit, NoHide
ie := WBGet()
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionDue_TextBox").value := ActionDue9
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionType_TextBox").value := ActionType9
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboBasedOn_TextBox").value := BasedOn9
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboRecurring_TextBox").value := Recurring9
;;;;; Terms ;;;;;
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtYr").value := Year9
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtMo").value := Month9
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtDy").value := Day9
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboIndicator_TextBox").value := Indicator9
if GenerateAction9 = 0
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := false
else
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := true
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboEffBasedOn_TextBox").value := EffectivePeriod9
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffStartDate").value := MadeFrom9
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffEndDate").value := To9
return

Inject10:
Gui, Submit, NoHide
ie := WBGet()
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionDue_TextBox").value := ActionDue10
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboActionType_TextBox").value := ActionType10
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboBasedOn_TextBox").value := BasedOn10
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboRecurring_TextBox").value := Recurring10
;;;;; Terms ;;;;;
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtYr").value := Year10
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtMo").value := Month10
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtDy").value := Day10
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboIndicator_TextBox").value := Indicator10
if GenerateAction10 = 0
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := false
else
	ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_chkCalculate").checked := true
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_cboEffBasedOn_TextBox").value := EffectivePeriod10
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffStartDate").value := MadeFrom10
ie.document.getElementById("dlCountryLawAction__ctl0__ctl0_txtEffEndDate").value := To10
return







GuiClose:
Loop 110
	{
	GuiControlGet, temp, , Edit%A_Index%
	IniWrite, %temp%, %A_Desktop%/CountryLawCopier.ini, ActionGrabber, %A_Index%
	}

GuiControlGet, chkbox1,  , Button1
GuiControlGet, chkbox2,  , Button5
GuiControlGet, chkbox3,  , Button9
GuiControlGet, chkbox4,  , Button13
GuiControlGet, chkbox5,  , Button17
GuiControlGet, chkbox6,  , Button21
GuiControlGet, chkbox7,  , Button25
GuiControlGet, chkbox8,  , Button29
GuiControlGet, chkbox9,  , Button33
GuiControlGet, chkbox10, , Button37


IniWrite, %chkbox1%,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 111
IniWrite, %chkbox2%,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 112
IniWrite, %chkbox3%,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 113
IniWrite, %chkbox4%,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 114
IniWrite, %chkbox5%,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 115
IniWrite, %chkbox6%,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 116
IniWrite, %chkbox7%,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 117
IniWrite, %chkbox8%,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 118
IniWrite, %chkbox9%,  %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 119
IniWrite, %chkbox10%, %A_Desktop%/CountryLawCopier.ini, ActionGrabber, 120
	
ExitApp
return

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