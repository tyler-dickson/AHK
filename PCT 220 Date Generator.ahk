#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent 
Enabled := ComObjError(false)
SysGet, ScreenWidth, 78
SysGet, ScreenHeight, 79
;DetectHiddenWindows, On  
SetTitleMatchMode, 2
Menu, Tray, Icon, netshell.dll, 85

Gui, New, 
Gui, Font, s14 Bold underline
Gui, Add, Text, x5   y5 w225 Center, Earliest Priority:
Gui, Add, Text, x250 y5 w225 Center, Mailing Date:
Gui, Font
Gui, Add, MonthCal, x5   y30 vEarliestPriority gEarliestPriority, 201510
Gui, Add, MonthCal, x250 y30 vMailingDate gMailingDate,
Gui, Add, Edit, Center ReadOnly x5   y195 w110, %EarliestPriority%
Gui, Add, Edit, Center ReadOnly x120 y195 w110, %EarliestPriorityReadable%
Gui, Add, Edit, Center ReadOnly x250 y195 w110 , %MailingDate%
Gui, Add, Edit, Center ReadOnly x365 y195 w110 , %MailingDateReadable%
Gui, Add, Button, x5 y460 w225 h37 gForeignActionRefs, ; gForeignActionRefs, 
Gui, Add, Button, x5 y499 w225 h37 gAmendsDeadline, 
Gui, Add, Button, x5 y538 w225 h37 gDemandDeadline, 
Gui, Font, underline cPurple
Gui, Add, Text, Center x250 y473 w225 h37, Changes made to the Abstract?
Gui, Add, Text, Center x250 y545 w225 h37, Changes made to the Title?
Gui, Font
Gui, Add, Button, Center x240 y490 w235 h37 gAbstractDate, ;  Abstract
Gui, Add, Text, Center x246 y561 w225 h37, Update Title on Invention and Country Pages.

Gui, Font, s14 Bold underline cBlue
Gui, Add, Text, x5 y435 w225 Center, Dates to Docket:
Gui, Add, Text, x250   y310 w225 Center, Other Options:
Gui, Add, Text, x5   y310 w225 Center, Deadlines:
Gui, Font, 

Gui, Add, Text, Center x5 y235   w110, Earliest Priority + 30M -
Gui, Add, Edit, ReadOnly Center x120 y232 w110, 

Gui, Add, Text, Center x5 y260   w110, Earliest Priority + 16M -
Gui, Add, Edit, ReadOnly Center x120 y257 w110,

Gui, Add, Text, Center x360 y260   w110,- Mailing Date + 2M
Gui, Add, Edit, ReadOnly Center x250 y257 w110,

Gui, Add, Text, Center x360 y284   w110,- Mailing Date + 3M
Gui, Add, Edit, ReadOnly Center x250 y281 w110,

Gui, Add, Text, Center x5 y284   w110, Earliest Priority + 22M -
Gui, Add, Edit, ReadOnly Center x120 y281 w110,

Gui, Add, Groupbox, x3 y249 w475 h32 +Center,
Gui, Add, Groupbox, x3 y273 w475 h32 +Center,

Gui, Font, underline
Gui, Add, Text, Center x5 y335  w225, Deadline to Amend without Demand
Gui, Add, Text, Center x5 y374  w225, Deadline to File Demand`nor Respond to Written Opinion
Gui, Font
Gui, Add, Edit, ReadOnly Center x5 y351 w225,
Gui, Add, Edit, ReadOnly Center x5 y404 w225,

Gui, Add, Text, Center x250 y235   w225, 
;Gui, Add, Groupbox, cPurple x0 y234 w290 h66 +Center,

Gui, Font, underline cPurple
Gui, Add, Text, Center x250 y370 w225 h37, PCT 203 Issued?
Gui, Font
Gui, Add, Text, Center x250 y383 w225 h37, (Non-establishment of Search Report)
Gui, Add, Text, Center x235 y402 w245 h37, Don't docket INT-PAT FOREIGN ACTION REFS.`nSee the PCT 220 Checklist for details.
Gui, Add, Button, Center x240 y433 w235 h23 gOpenChecklist, Open PCT 220 Checklist

Gui, Add, Groupbox, x2 y300 w232 h282 +Center,
Gui, Add, Groupbox, x236 y300 w243 h282 +Center,

Gui, Font, italic
Gui, Add, Text, Center x250 y335 w225 h37, The below options are uncommon`nand are not frequently used.
Gui, Font
Gui, Show, w480 h585
gosub EarliestPriority
return

EarliestPriority:
MailingDate:
Gui, Submit, NoHide
FormatTime, EarliestPriorityReadable, %EarliestPriority%, MMMM dd, yyyy
FormatTime, MailingDateReadable, %MailingDate%, MMMM dd, yyyy
FormatTime, EarliestPriority, %EarliestPriority%, dd-MMM-yyyy
FormatTime, MailingDateNumbers, %MailingDate%, yyyyMMdd
FormatTime, MailingDate, %MailingDate%, dd-MMM-yyyy
FormatTime, TodaysDate, , yyyyMMdd

Gui, Submit, NoHide

FormatTime, PriorityDay,   %EarliestPriority%, dd
FormatTime, PriorityMonth, %EarliestPriority%, M
FormatTime, PriorityYear,  %EarliestPriority%, yyyy

FormatTime, MailingDay,   %MailingDate%, dd
FormatTime, MailingMonth, %MailingDate%, M
FormatTime, MailingYear,  %MailingDate%, yyyy

;MsgBox, %PriorityDay% %PriorityMonth% %PriorityYear% `n`n %MailingDay% %MailingMonth% %MailingYear%
Gui, Font
GuiControl, Font, Edit5,
GuiControl, Font, Edit10,
GuiControl, Font, Edit11,
GuiControl, Font, Static16
GuiControl, Enable, Button2
GuiControl, Enable, Button3
GuiControl, ,Static16,

if PriorityMonth = 01
	{
	Priority16Month = 05
	Priority22Month = 11
	Priority30Month = 07
	Priority16Year := PriorityYear + 1
	Priority22Year := PriorityYear + 1
	Priority30Year := PriorityYear + 2
	Priority16Day  := PriorityDay
		if PriorityDay = 31
			Priority22Day  = 30
		else 
			Priority22Day  := PriorityDay
	}
else if PriorityMonth = 02
	{
	Priority16Month = 06
	Priority22Month = 12
	Priority30Month = 08
	Priority16Year := PriorityYear + 1
	Priority22Year := PriorityYear + 1
	Priority30Year := PriorityYear + 2
	Priority16Day  := PriorityDay
	Priority22Day  := PriorityDay
	Priority30Day  := PriorityDay	
	}
else if PriorityMonth = 03
	{
	Priority16Month = 07
	Priority22Month = 01
	Priority30Month = 09
	Priority16Year := PriorityYear + 1
	Priority22Year := PriorityYear + 2
	Priority30Year := PriorityYear + 2
	Priority16Day  := PriorityDay
	Priority22Day  := PriorityDay
		if PriorityDay = 31
			PriorityDay30 = 30
		else
			PriorityDay30 = PriorityDay
	}	
else if PriorityMonth = 04
	{
	Priority16Month = 08
	Priority22Month = 02
	Priority30Month = 10
	Priority16Year := PriorityYear + 1
	Priority22Year := PriorityYear + 2
	Priority30Year := PriorityYear + 2
	Priority16Day  := PriorityDay
	Priority30Day  := PriorityDay	
		if (PriorityDay = 29)
			Priority22Day  = 28
		else if (PriorityDay = 30)
			Priority22Day  = 28
		else 
			Priority22Day  := PriorityDay
		if (Priority22Year = 2020) || (Priority22Year = 2024) || (Priority22Year = 2028)
			Priority22Day  = 29
	}	
else if PriorityMonth = 05
	{
	Priority16Month = 09
	Priority22Month = 03
	Priority30Month = 11
	Priority16Year := PriorityYear + 1
	Priority22Year := PriorityYear + 2
	Priority30Year := PriorityYear + 2
		if PriorityDay = 31
			{
			Priority16Day = 30
			Priority30Day = 30
			}
		else 
			{
			Priority16Day  := PriorityDay
			Priority30Day  := PriorityDay
			}
	Priority22Day  := PriorityDay
	}	
else if PriorityMonth = 06
	{
	Priority16Month = 10
	Priority22Month = 04
	Priority30Month = 12
	Priority16Year := PriorityYear + 1
	Priority22Year := PriorityYear + 2
	Priority30Year := PriorityYear + 2
	Priority16Day  := PriorityDay
	Priority22Day  := PriorityDay
	Priority30Day  := PriorityDay
	}
else if PriorityMonth = 07
	{
	Priority16Month = 11
	Priority22Month = 05
	Priority30Month = 01
	Priority16Year := PriorityYear + 1
	Priority22Year := PriorityYear + 2
	Priority30Year := PriorityYear + 3
		if PriorityDay = 31
			Priority16Day = 30
		else 
			Priority16Day  := PriorityDay
	Priority22Day  := PriorityDay
	Priority30Day  := PriorityDay
	}
else if PriorityMonth = 08
	{
	Priority16Month = 12
	Priority22Month = 06
	Priority30Month = 02
	Priority16Year := PriorityYear + 1
	Priority22Year := PriorityYear + 2
	Priority30Year := PriorityYear + 3
	Priority16Day  := PriorityDay
		if PriorityDay = 31
			{
			Priority22Day = 30
			Priority30Day = 28
			}
		else if PriorityDay = 30
			{
			Priority22Day = 30
			Priority30Day = 28	
			}
		else if PriorityDay = 29
			{
			Priority22Day = 29
			Priority30Day = 28			
			}
		else 
			{
			Priority22Day  := PriorityDay
			Priority30Day  := PriorityDay
			}
	}
else if PriorityMonth = 09
	{
	Priority16Month = 01
	Priority22Month = 07
	Priority30Month = 03
	Priority16Year := PriorityYear + 2
	Priority22Year := PriorityYear + 2
	Priority30Year := PriorityYear + 3
	Priority16Day  := PriorityDay
		if PriorityDay = 31
			{
			Priority22Day = 31
			Priority30Day = 30
			}
		else 
			{
			Priority22Day  := PriorityDay
			Priority30Day  := PriorityDay
			}			
	}
else if PriorityMonth = 10
	{
	Priority16Month = 02	
	Priority22Month = 08
	Priority30Month = 04
	Priority16Year := PriorityYear + 2
	Priority22Year := PriorityYear + 2
	Priority30Year := PriorityYear + 3
		if PriorityDay = 29
			{
			Priority16Day = 28
			Priority30Day := PriorityDay
			Priority22Day := PriorityDay
			}
		else if PriorityDay = 30
			{
			Priority16Day = 28
			Priority30Day := PriorityDay
			Priority22Day  := PriorityDay
			}			
		else if PriorityDay = 31
			{
			Priority16Day = 28
			Priority30Day = 30	
			Priority22Day  := PriorityDay			
			}
		else 
			{
			Priority16Day  := PriorityDay
			Priority30Day  := PriorityDay
			Priority22Day  := PriorityDay
			}
	}
else if PriorityMonth = 11
	{
	Priority16Month = 03
	Priority22Month = 09
	Priority30Month = 05
	Priority16Year := PriorityYear + 2	
	Priority22Year := PriorityYear + 2
	Priority30Year := PriorityYear + 3
	Priority16Day  := PriorityDay
	Priority22Day  := PriorityDay
	Priority30Day  := PriorityDay
	}
else if PriorityMonth = 12
	{
	Priority16Month = 04
	Priority22Month = 10
	Priority30Month = 06
	Priority16Year := PriorityYear + 2	
	Priority22Year := PriorityYear + 2
	Priority30Year := PriorityYear + 3
		if PriorityDay = 31
			{
			Priority16Day = 30
			Priority30Day = 30			
			}
		else 
			Priority16Day  := PriorityDay
	Priority22Day  := PriorityDay
	}
	
if MailingMonth = 01
	{
	Mailing2Month = 03
	Mailing3Month = 04
	Mailing2Year := MailingYear
	Mailing3Year := MailingYear
	Mailing2Day  := MailingDay
		if MailingDay = 31
			Mailing3Day  = 30
		else 
			Mailing3Day  := MailingDay
	}
else if MailingMonth = 02
	{
	Mailing2Month = 04
	Mailing3Month = 05
	Mailing2Year := MailingYear
	Mailing3Year := MailingYear
	Mailing2Day  := MailingDay
	Mailing3Day  := MailingDay	
	}
else if MailingMonth = 03
	{
	Mailing2Month = 05
	Mailing3Month = 06
	Mailing2Year := MailingYear
	Mailing3Year := MailingYear
	Mailing2Day  := MailingDay
		if MailingDay = 31
			Mailing3Day  = 30
		else 
			Mailing3Day  := MailingDay
	}	
else if MailingMonth = 04
	{
	Mailing2Month = 06
	Mailing3Month = 07
	Mailing2Year := MailingYear 
	Mailing3Year := MailingYear
	Mailing2Day  := MailingDay
	Mailing3Day  := MailingDay	
	}	
else if MailingMonth = 05
	{
	Mailing2Month = 07
	Mailing3Month = 08
	Mailing2Year := MailingYear
	Mailing3Year := MailingYear
	Mailing2Day  := MailingDay
	Mailing3Day  := MailingDay	
	}	
else if MailingMonth = 06
	{
	Mailing2Month = 08
	Mailing3Month = 09
	Mailing2Year := MailingYear
	Mailing3Year := MailingYear
	Mailing2Day  := MailingDay
	Mailing3Day  := MailingDay
	}
else if MailingMonth = 07
	{
	Mailing2Month = 09
	Mailing3Month = 10
	Mailing2Year := MailingYear
	Mailing3Year := MailingYear
	if (MailingDay = 31)
		Mailing2Day = 30
	else
		Mailing2Day  := MailingDay
	Mailing3Day  := MailingDay
	}
else if MailingMonth = 08
	{
	Mailing2Month = 10
	Mailing3Month = 11
	Mailing2Year := MailingYear
	Mailing3Year := MailingYear
	Mailing2Day  := MailingDay
		if MailingDay = 31
			Mailing3Day  = 30
		else 
			Mailing3Day  := MailingDay
	}
else if MailingMonth = 09
	{
	Mailing2Month = 11
	Mailing3Month = 12
	Mailing2Year := MailingYear
	Mailing3Year := MailingYear
	Mailing2Day  := MailingDay
	Mailing3Day  := MailingDay
	}
else if MailingMonth = 10
	{
	Mailing2Month = 12
	Mailing3Month = 01
	Mailing2Year := MailingYear
	Mailing3Year := MailingYear + 1
	Mailing2Day  := MailingDay
	Mailing3Day  := MailingDay
	}
else if MailingMonth = 11
	{
	Mailing2Month = 01
	Mailing3Month = 02
	Mailing2Year := MailingYear + 1
	Mailing3Year := MailingYear + 1
	Mailing2Day  := MailingDay
		if ((MailingDay = 29 ) || (MailingDay = 30 ) || (MailingDay = 31 )) && ((Mailing2Year = 2020) || (Mailing2Year = 2024) || (Mailing2Year = 2028)) 
			Mailing3Day = 29
		else if (MailingDay = 29 ) || (MailingDay = 30 ) || (MailingDay = 31 )
			Mailing3Day = 28
		else 
			Mailing3Day  := MailingDay
	}
else if MailingMonth = 12
	{
	Mailing2Month = 02
	Mailing3Month = 03
	Mailing2Year := MailingYear + 1
	Mailing3Year := MailingYear + 1
	Mailing2Day  := MailingDay
		if ((MailingDay = 29 ) || (MailingDay = 30 ) || (MailingDay = 31 )) && ((Mailing2Year = 2020) || (Mailing2Year = 2024) || (Mailing2Year = 2028)) 
			Mailing2Day = 29
		else if (MailingDay = 29 ) || (MailingDay = 30 ) || (MailingDay = 31 )
			Mailing2Day = 28
		else 
			Mailing2Day  := MailingDay
	Mailing3Day  := MailingDay
	}
	
FormatTime, EarliestPriority, %EarliestPriority%, dd-MMM-yyyy
FormatTime, MailingDate, %MailingDate%, dd-MMM-yyyy
	
GuiControl, ,Edit1, %EarliestPriority%
GuiControl, ,Edit2, %EarliestPriorityReadable%
GuiControl, ,Edit3, %MailingDate%
GuiControl, ,Edit4, %MailingDateReadable%

MailingDate2 := Mailing2Year . Mailing2Month . Mailing2Day
PriorityDate16 := Priority16Year .  Priority16Month . Priority16Day 
PriorityDate30 := Priority30Year . Priority30Month . Priority30Day
PriorityDate30Numbers := Priority30Year . Priority30Month . Priority30Day

MailingDate3 := Mailing3Year . Mailing3Month . Mailing3Day
PriorityDate22 := Priority22Year .  Priority22Month . Priority22Day 

;MsgBox, Mailing Date + 2 = %MailingDate2%`nPriority Date + 16 = %PriorityDate16%`n`nMailing Date + 3 = %MailingDate3%`nPriority Date + 22 = %PriorityDate22%

FormatTime, MailingDate2Readable, %MailingDate2%, MMMM d, yyyy
FormatTime, MailingDate3Readable, %MailingDate3%, MMMM d, yyyy
FormatTime, PriorityDate16Readable, %PriorityDate16%, MMMM d, yyyy
FormatTime, PriorityDate22Readable, %PriorityDate22%, MMMM d, yyyy
FormatTime, PriorityDate30Readable, %PriorityDate30%, MMMM d, yyyy

	if (MailingDate2 > PriorityDate16)
		{
		GuiControl, ,Button2, INT-PAT PCT ART.19 2M DEADLINE`n with %MailingDate%
		Gui, Font, cGreen
		GuiControl, Font, Edit7,
		Gui, Font
		Gui, Font, cRed
		GuiControl, Font, Edit6,
		Gui, Font
		GuiControl, ,Edit10, %MailingDate2Readable%
			if (MailingDate2 < TodaysDate)
				{
				Gui, Font, cRed
				GuiControl, Font, Edit10,
				Gui, Font
				TrayTip, Dates Generating in the Past!, It looks like some of your dates might be generating in the past.`n`nConsider asking the Prosecution Team if the past due dates should be docketed.
				}
		}
	else if (PriorityDate16 > MailingDate2)
		{
		GuiControl, ,Button2, INT-PAT PCT ART.19 16M DEADLINE`n with %EarliestPriority%
		Gui, Font, cGreen
		GuiControl, Font, Edit6,
		Gui, Font
		Gui, Font, cRed
		GuiControl, Font, Edit7,
		Gui, Font
		GuiControl, ,Edit10, %PriorityDate16Readable%
			if (PriorityDate16 < TodaysDate)
				{
				Gui, Font, cRed
				GuiControl, Font, Edit10,
				Gui, Font
				TrayTip, Dates Generating in the Past!, It looks like some of your dates might be generating in the past.`n`nConsider asking the Prosecution Team if the past due dates should be docketed.
				}
		}
		
		
	if (MailingDate3 > PriorityDate22)
		{
		GuiControl, ,Button3, INT-PAT PCT DEMAND 3M DEADLINE`n with %MailingDate%
		Gui, Font, cGreen
		GuiControl, Font, Edit8,
		Gui, Font
		Gui, Font, cRed
		GuiControl, Font, Edit9,
		Gui, Font
		GuiControl, ,Edit11, %MailingDate3Readable%
			if (MailingDate3 < TodaysDate)
				{
				Gui, Font, cRed
				GuiControl, Font, Edit11,
				Gui, Font
				TrayTip, Dates Generating in the Past!, It looks like some of your dates might be generating in the past.`n`nConsider asking the Prosecution Team if the past due dates should be docketed.
				}
		}
	else if (PriorityDate22 > MailingDate3)
		{
		GuiControl, ,Button3, INT-PAT PCT DEMAND 22M DEADLINE`n with %EarliestPriority%	
		Gui, Font, cGreen
		GuiControl, Font, Edit9,
		Gui, Font
		Gui, Font, cRed
		GuiControl, Font, Edit8,
		Gui, Font
		GuiControl, ,Edit11, %PriorityDate22Readable%
			if (PriorityDate22 < TodaysDate)
				{
				Gui, Font, cRed
				GuiControl, Font, Edit11,
				Gui, Font
				TrayTip, Dates Generating in the Past!, It looks like some of your dates might be generating in the past.`n`nConsider asking the Prosecution Team if the past due dates should be docketed.
				}
		}
		
GuiControl, ,Button1, INT-PAT FOREIGN ACTION REFS`n with %MailingDate%
GuiControl, ,Button4, INT-PAT PCT/ISA/210 COMMENT ABSTRACT`n with %MailingDate%

FormatTime, MailingDate2Docket, %MailingDate2%, dd-MMM-yyyy
FormatTime, PriorityDate16Docket, %PriorityDate16%, dd-MMM-yyyy
FormatTime, MailingDate3Docket, %MailingDate3%, dd-MMM-yyyy
FormatTime, PriorityDate22Docket, %PriorityDate22%, dd-MMM-yyyy
FormatTime, PriorityDate30Docket, %PriorityDate30%, dd-MMM-yyyy
FormatTime, TodaysDateReadable, , yyyyMMdd
	
GuiControl, , Edit5, %PriorityDate30Docket%	
GuiControl, , Edit6, %PriorityDate16Docket%	
GuiControl, , Edit7, %MailingDate2Docket%
GuiControl, , Edit8,  %MailingDate3Docket%
GuiControl, , Edit9,  %PriorityDate22Docket%

if (PriorityDate30Numbers < TodaysDateReadable)
	{
	Gui, Font
	Gui, Font, cRed
	GuiControl, Font, Edit5,
	GuiControl, Disable, Button2
	GuiControl, Disable, Button3
	Gui, Font, cRed bold underline
	GuiControl, Font, Static16
	GuiControl, ,Static16, More than 30M since Earliest Priority!
	Gui, Font
	;MsgBox, % PriorityDate30Numbers " | " TodaysDateReadable
	TrayTip, More than 30M from Earliest Priority!, More than 30M from the earliest priority has passed!`n`nYou should only docket INT-PAT FOREIGN ACTION REFS (assuming a PCT 203 wasn't issued)`, and then confirm with the Prosecution Team if any other dates should be docketed!
	;TrayTip, test, this is a test.
	;MsgBox, 4 , More than 30M from Earliest Priority!, More than 30M from the earliest priority has passed!`n`nYou should only docket INT-PAT FOREIGN ACTION REFS (assuming a PCT 203 wasn't issued), and then confirm with the Prosecution Team if any other dates should be docketed!`n`nOpen the PCT 220 Checklist for further details?
	;	ifMsgBox Yes
	;		Run "iwl:dms=OC-IDMS&&lib=KMOB&&num=13253938&&latest=1"
	}
else if (PriorityDate30Numbers > MailingDateNumbers)
	{
	Gui, Font
	Gui, Font, cGreen
	GuiControl, Font, Edit5,
	Gui, Font, cGreen bold underline
	GuiControl, Font, Static16
	GuiControl, ,Static16, Less than 30M since Earliest Priority.
	Gui, Font
	}
return


ForeignActionRefs:
;Gui, Submit
GuiControlGet, ForeignActionRefsControl, , Button1
StringRight, ForeignActionRefsControlDate, ForeignActionRefsControl, 11
ForeignActionRefsControlDate := ForeignActionRefsControlDate
WinActivate, ahk_class IEFrame
gosub CopyAction
Sleep 100
ModifiedSwitchSystem2()
WinActivate, ahk_class IEFrame
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := ClientCode
ie.document.getElementByID("fldstrCountry_TextBox").Value := Country
ie.document.getElementByID("flddteBaseDate").Value := ForeignActionRefsControlDate
;NewRemarks = %ATDate% Matter is going abandoned. %Username%   ;%Remarks% 
ActionType := "INT-PAT FOREIGN ACTION REFS"
;ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType	
Sleep 100
Gui, Show
return

AmendsDeadline:
;Gui, Submit
GuiControlGet, AmendsControl, , Button2
StringRight, AmendsControlDate, AmendsControl, 11
AmendsControlDate := AmendsControlDate
WinActivate, ahk_class IEFrame
gosub CopyAction
Sleep 100
ModifiedSwitchSystem2()
WinActivate, ahk_class IEFrame
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := ClientCode
ie.document.getElementByID("fldstrCountry_TextBox").Value := Country
ie.document.getElementByID("flddteBaseDate").Value := AmendsControlDate
;NewRemarks = %ATDate% Matter is going abandoned. %Username%   ;%Remarks% 
	IfInString, AmendsControl, 2M
		ActionType := "INT-PAT PCT ART.19 2M DEADLINE"
	else IfInString, AmendsControl, 16M
		ActionType := "INT-PAT PCT ART.19 16M DEADLINE"
;ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType	
Sleep 100
Gui, Show
return

DemandDeadline:
;Gui, Submit
GuiControlGet, DemandControl, , Button3
StringRight, DemandControlDate, DemandControl, 11
DemandControlDate := DemandControlDate
WinActivate, ahk_class IEFrame
gosub CopyAction
Sleep 100
ModifiedSwitchSystem2()
WinActivate, ahk_class IEFrame
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := ClientCode
ie.document.getElementByID("fldstrCountry_TextBox").Value := Country
ie.document.getElementByID("flddteBaseDate").Value := DemandControlDate
;NewRemarks = %ATDate% Matter is going abandoned. %Username%   ;%Remarks% 
	IfInString, DemandControl, 3M
		ActionType := "INT-PAT PCT DEMAND 3M DEADLINE"
	else IfInString, DemandControl, 22M
		ActionType := "INT-PAT PCT DEMAND 22M DEADLINE"
;ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType	
Sleep 100
Gui, Show
return

AbstractDate:
;Gui, Submit
GuiControlGet, ForeignActionRefsControl, , Button1
StringRight, ForeignActionRefsControlDate, ForeignActionRefsControl, 11
ForeignActionRefsControlDate := ForeignActionRefsControlDate
WinActivate, ahk_class IEFrame
gosub CopyAction
Sleep 100
ModifiedSwitchSystem2()
WinActivate, ahk_class IEFrame
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := ClientCode
ie.document.getElementByID("fldstrCountry_TextBox").Value := Country
ie.document.getElementByID("flddteBaseDate").Value := ForeignActionRefsControlDate
;NewRemarks = %ATDate% Matter is going abandoned. %Username%   ;%Remarks% 
ActionType := "INT-PAT PCT/ISA/210 COMMENT ABSTRACT"
;ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType	
Sleep 100
Gui, Show
return

OpenChecklist:
Run "iwl:dms=OC-IDMS&&lib=KMOB&&num=13253938&&latest=1"
return

CopyAction:
;Gui, Hide
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
;ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
BaseDate := ie.document.getElementByID("flddteBaseDate").Value
;Remarks := ie.document.getElementByID("fldstrRemarks").Value
Sleep 200
;SplashTextOn, 400, 400, Information Copied,Client Code: %ClientCode%`n`nCountry: %Country%`n`nAction Type: %ActionType%`n`nBase Date: %BaseDate%`n`nGeneral Remarks: %Remarks%
;Sleep 2000
;SplashTextOff
;Gui, Show
return

ModifiedSwitchSystem2()
{
IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
IniRead, ATPartner, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATPartner
IniRead, ATDate, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATDate

ie := WBGet()
	if IsObject(ie) = 0
		{
		Run "iexplore.exe"
		Sleep 3000
		ie := WBGet()
		return
		}
	else

var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
WinActivate, ahk_class IEFrame
Sleep 200
;		OldClipboard := Clipboard                                                                ; This saves clipboard content for later.
 ;       Clipboard = ;                                                                            ; This empties the clipboard.
        MyString = ;                                                                             ; Sets MyString to blank.
        AppString = ;
        FrontString = ;
        
        PatentString = http://oc-docketing/CPi/patfrmCountryApplication.aspx?Key=                ; Prefix section of a Live Patent (58 Characters).
        PatentATString = http://oc-docketing/CPiAgent/patfrmCountryApplicationAgent.aspx?Key=    ; Prefix section of a AT Patent (68 Characters).

				
        PatentActionString = http://oc-docketing/CPi/patfrmActionDue.aspx?key=                   ; Patent Action (49 + 7)
        PatentATActionString = http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=       ; Patent AT Action (60 + 7)
		
		NewPATLiveAction = http://oc-docketing/CPi/patfrmActionDue.aspx?key=-1&key2=             ;57 characters + 7 = 64
		NewPATATAction   = http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=-1&key2=   ;67 characters + 7 = 74
					
;SendInput ^l
Sleep 200
;SendInput ^c
;ClipWait, .2      
;MyString := clipboard                            ; Fetch URL into variable
if Instr(var, PatentString)
     {
     StringLeft, FrontString, var, 65       ; Stores first 67+7=74 characters of URL for Live Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     ;FrontString = %NewPATATAction%
     FrontString = %NewPATLiveAction%
     }
else if Instr(var, PatentATString)
     {
     StringLeft, FrontString, var, 75       ; Stores first 78+7=85 characters of URL for AT Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     ;FrontString = %NewPATLiveAction%
	 FrontString = %NewPATATAction%
     }
else if Instr(var, PatentActionString)
     {
     StringLeft, FrontString, var, 74       ; Stores first 67+7=74 characters of URL for Live Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     ;FrontString = %NewPATATAction%
     FrontString = %NewPATLiveAction%
     }
else if Instr(var, PatentATActionString)
     {
     StringLeft, FrontString, var, 85       ; Stores first 78+7=85 characters of URL for AT Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     ;FrontString = %NewPATLiveAction%
	 FrontString = %NewPATATAction%
     }
else
     {
     SplashTextOn, 430,,Not on a Live or AT action. Unable to docket action.,
     Sleep 1500
     SplashTextOff
     Clipboard = %OldClipboard%
     Return
     }
MyString := FrontString . AppString
;MsgBox, %MyString%
;TrayTip,Docketing Action, Docketing action now.
MyString = %MyString%
OutputVar = %MyString%
;ie := ComObjCreate("InternetExplorer.Application")
params := [OutputVar, 16384]
ie.Navigate(params*)
;Sleep 3000
;TrayTip
Sleep 200
Clipboard = %OldClipboard%
AppString = ;
FrontString = ;
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
Gui, Show
Return
}


GuiClose:
ExitApp

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
