; Written by Tyler Dickson in AutoHotkey.

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


global Computername
	
StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}

if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder	

IniRead,  APIUses, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements,  APIUses
	if  APIUses = ERROR
		{
		APIUses = 0
		IniWrite, %APIUses%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements,  APIUses
		IniRead,  APIUses, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements,  APIUses
		}

; NEWCPI
global NewCPI

;MsgBox, 4, Are you using new CPI or old CPI?, Click YES if you're using new CPI.`n`nClick NO if you're using old CPI.
;IfMsgBox, Yes
	NewCPI = 1
;IfMsgBox, No
;	NewCPI = 0	

if (NewCPI)
	{
;	#Include \\docs-oc\files\Docketing\AutoHotKey\Scripts\Chrome.ahk
;	FileCreateDir, %  A_Desktop "\ChromeProfile"
;	FileCreateDir, ChromeProfile
	FileCreateShortcut, % "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe", %A_Desktop%\Chrome (AHK).lnk, , % "--remote-debugging-port=9222 -- '%1'", % "Test Description" ;,  IconFile, 

;	Run, %A_Desktop%\Chrome (AHK).lnk
	
	if (Chromes := Chrome.FindInstances())
		global ChromeInst := {"base": Chrome, "DebugPort": Chromes.MinIndex()}
	else
		global ChromeInst := new Chrome("ChromeProfile", "https://web05.computerpackages.com/knobbe/patent/patschcountryapplication.aspx" ) ; 	;	global ChromeInst := new Chrome("ChromeProfile", "--app=http://oc-docketing/CPi/patfrmCountryApplication.aspx?Key=1275806")
	
	Sleep 1000
	global Page := ChromeInst.GetPage()
	Page.Call("Page.navigate", {"url" : "https://web05.computerpackages.com/knobbe/patent/patschcountryapplication.aspx" })
	Page.Call("Target.createTarget", {"url" : "https://web05bak.computerpackages.com/knobbeAgent/patent/patschcountryapplication.aspx" })
	Page.WaitForLoad()
	Page.Disconnect()
	; SetTimer, InjectButton2, 1000
	}



Gui, New, 
Gui, Font, s14 Bold underline
Gui, Add, Text, x5   y5 w225 Center, Earliest Priority:
Gui, Add, Text, x250 y5 w225 Center, Mailing Date:
Gui, Font
Gui, Add, MonthCal, x5   y30 vEarliestPriority gEarliestPriority, 201910
Gui, Add, MonthCal, x250 y30 vMailingDate gMailingDate,
Gui, Add, Edit, Center ReadOnly x5   y195 w110, %EarliestPriority%
Gui, Add, Edit, Center ReadOnly x120 y195 w110, %EarliestPriorityReadable%
Gui, Add, Edit, Center ReadOnly x250 y195 w110 , %MailingDate%
Gui, Add, Edit, Center ReadOnly x365 y195 w110 , %MailingDateReadable%
Gui, Add, Button, x5 y460 w225 h37 gForeignActionRefs, ; gForeignActionRefs, 
Gui, Add, Button, x5 y499 w225 h37 gAmendsDeadline, 
Gui, Add, Button, x5 y538 w225 h37 gDemandDeadline, 
Gui, Font, underline cPurple
Gui, Add, Text, Center x250 y460 w225 h37, Changes made to the Abstract?
Gui, Add, Text, Center x250 y515 w225 h37, Changes made to the Title?
Gui, Font
Gui, Add, Button, Center x240 y475 w235 h37 gAbstractDate, ;  Abstract
Gui, Add, Text, Center x246 y530 w225 h37, Update Title on Invention and Country Pages.

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

Gui, Font, underline cRed bold
Gui, Add, Text, Center x250 y548 w225 h37, Confirmation of Search Fees Paid?
Gui, Font, 
Gui, Font, cRed
Gui, Add, Text, Center x246 y565 w225 h37, Box III on PCT 210 mentions search fees paid?`nClose Confirm ISA Recvd Fees / IPP 



Gui, Show, w480 h600
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

		if PriorityDay = 29
			{
			if (Priority22Year == "2020") || (Priority22Year == "2024") || (Priority22Year == "2028")
				Priority22Day  = 29
			else 
				Priority22Day  = 28
			}
		else if PriorityDay = 30
			{
			if (Priority22Year == "2020") || (Priority22Year == "2024") || (Priority22Year == "2028")
				Priority22Day  = 29
			else 
				Priority22Day  = 28
			}
		else 
			Priority22Day  := PriorityDay
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
GuiControlGet, ForeignActionRefsControl, , Button1
StringRight, ForeignActionRefsControlDate, ForeignActionRefsControl, 11

if (NewCPI)
	{
	WinActivate, ahk_exe chrome.exe
	Page := ChromeInst.GetPage()
	
	if InStr(Page.Evaluate("window.location.href").Value, "ActionDueAgent")
		OutputVar := "https://web05.computerpackages.com/knobbe/patent/patfrmActionDueAgent.aspx?key=-1&appId=" GetAppID()
	else
		OutputVar := "https://web05.computerpackages.com/knobbe/patent/patfrmActionDue.aspx?key=-1&appId=" GetAppID()	
	
	Page.Call("Page.navigate", {"url" : OutputVar })
	Page.WaitForLoad()
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = 'INT-PAT FOREIGN ACTION REFS'")
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_BaseDate_dateInput').value = '" ForeignActionRefsControlDate "'")
	Sleep 500
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 1000
	Page.Evaluate("document.getElementById('ctl00_Detail_InsertButton_input').click();")
	Page.Disconnect()
	WinActivate, ahk_exe chrome.exe
	}
else
	{
	WinActivate, ahk_class IEFrame
	gosub CopyAction
	Sleep 100
	ModifiedSwitchSystem2()
	WinActivate, ahk_class IEFrame
	While IE.Busy
	Sleep, 100
	ie.document.getElementByID("fldstrCountry_TextBox").Value := Country
	ie.document.getElementByID("flddteBaseDate").Value := ForeignActionRefsControlDate
	ActionType := "INT-PAT FOREIGN ACTION REFS"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType	
	Sleep 100
	}
; Gui, Show
return

AmendsDeadline:
GuiControlGet, AmendsControl, , Button2
StringRight, AmendsControlDate, AmendsControl, 11

if (NewCPI)
	{
	WinActivate, ahk_exe chrome.exe
	Page := ChromeInst.GetPage()
	if InStr(Page.Evaluate("window.location.href").Value, "ActionDueAgent")
		OutputVar := "https://web05.computerpackages.com/knobbe/patent/patfrmActionDueAgent.aspx?key=-1&appId=" GetAppID()
	else
		OutputVar := "https://web05.computerpackages.com/knobbe/patent/patfrmActionDue.aspx?key=-1&appId=" GetAppID()	
	Page.Call("Page.navigate", {"url" : OutputVar })
	Page.WaitForLoad()
	IfInString, AmendsControl, 2M
		Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = 'INT-PAT PCT ART.19 2M DEADLINE'")
	else IfInString, AmendsControl, 16M
		Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = 'INT-PAT PCT ART.19 16M DEADLINE'")
	
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_BaseDate_dateInput').value = '" AmendsControlDate "'")
	Sleep 500
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 1000
	Page.Evaluate("document.getElementById('ctl00_Detail_InsertButton_input').click();")
	Page.Disconnect()
	WinActivate, ahk_exe chrome.exe
	}
else
	{
	WinActivate, ahk_class IEFrame
	gosub CopyAction
	Sleep 100
	ModifiedSwitchSystem2()
	WinActivate, ahk_class IEFrame
	While IE.Busy 
	Sleep, 100 
	ie.document.getElementByID("fldstrCountry_TextBox").Value := Country
	ie.document.getElementByID("flddteBaseDate").Value := AmendsControlDate
	IfInString, AmendsControl, 2M
		ActionType := "INT-PAT PCT ART.19 2M DEADLINE"
	else IfInString, AmendsControl, 16M
		ActionType := "INT-PAT PCT ART.19 16M DEADLINE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType	
	Sleep 100
	}
Gui, Show
return

DemandDeadline:
GuiControlGet, DemandControl, , Button3
StringRight, DemandControlDate, DemandControl, 11

if (NewCPI)
	{
	WinActivate, ahk_exe chrome.exe
	Page := ChromeInst.GetPage()
	if InStr(Page.Evaluate("window.location.href").Value, "ActionDueAgent")
		OutputVar := "https://web05.computerpackages.com/knobbe/patent/patfrmActionDueAgent.aspx?key=-1&appId=" GetAppID()
	else
		OutputVar := "https://web05.computerpackages.com/knobbe/patent/patfrmActionDue.aspx?key=-1&appId=" GetAppID()	
	Page.Call("Page.navigate", {"url" : OutputVar })
	Page.WaitForLoad()
	IfInString, DemandControl, 3M
		Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = 'INT-PAT PCT DEMAND 3M DEADLINE'")
	else IfInString, DemandControl, 22M
		Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = 'INT-PAT PCT DEMAND 22M DEADLINE'")

	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_BaseDate_dateInput').value = '" DemandControlDate "'")
	Sleep 500
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 1000
	Page.Evaluate("document.getElementById('ctl00_Detail_InsertButton_input').click();")
	Page.Disconnect()
	WinActivate, ahk_exe chrome.exe
	}
else
	{
	WinActivate, ahk_class IEFrame
	gosub CopyAction
	Sleep 100
	ModifiedSwitchSystem2()
	WinActivate, ahk_class IEFrame
	While IE.Busy
	Sleep, 100
	ie.document.getElementByID("fldstrCountry_TextBox").Value := Country
	ie.document.getElementByID("flddteBaseDate").Value := DemandControlDate
	IfInString, DemandControl, 3M
		ActionType := "INT-PAT PCT DEMAND 3M DEADLINE"
	else IfInString, DemandControl, 22M
		ActionType := "INT-PAT PCT DEMAND 22M DEADLINE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType	
	Sleep 100	
	}
Gui, Show
return

AbstractDate:
GuiControlGet, ForeignActionRefsControl, , Button1
StringRight, ForeignActionRefsControlDate, ForeignActionRefsControl, 11

if (NewCPI)
	{
	WinActivate, ahk_exe chrome.exe
	Page := ChromeInst.GetPage()
	if InStr(Page.Evaluate("window.location.href").Value, "ActionDueAgent")
		OutputVar := "https://web05.computerpackages.com/knobbe/patent/patfrmActionDueAgent.aspx?key=-1&appId=" GetAppID()
	else
		OutputVar := "https://web05.computerpackages.com/knobbe/patent/patfrmActionDue.aspx?key=-1&appId=" GetAppID()	
	Page.Call("Page.navigate", {"url" : OutputVar })
	Page.WaitForLoad()
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Input').value = 'INT-PAT PCT/ISA/210 COMMENT ABSTRACT'")
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_BaseDate_dateInput').value = '" ForeignActionRefsControlDate "'")
	Sleep 500
	Page.Evaluate("document.getElementById('ctl00_Detail_tplFormview_ActionType_Arrow').click();")
	WinActivate, ahk_exe chrome.exe
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 100
	SendInput, {Tab}
	Sleep 1000
	Page.Evaluate("document.getElementById('ctl00_Detail_InsertButton_input').click();")
	Page.Disconnect()
	WinActivate, ahk_exe chrome.exe
	}
else
	{
	WinActivate, ahk_class IEFrame
	gosub CopyAction
	Sleep 100
	ModifiedSwitchSystem2()
	WinActivate, ahk_class IEFrame
	While IE.Busy
	Sleep, 100
	ie.document.getElementByID("fldstrCountry_TextBox").Value := Country
	ie.document.getElementByID("flddteBaseDate").Value := ForeignActionRefsControlDate
	ActionType := "INT-PAT PCT/ISA/210 COMMENT ABSTRACT"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType	
	Sleep 100
	}
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
CPIClientCode2 := Page.Evaluate("document.getElementById('ctl00_Detail_CaseNumber_Input').value").Value

if (CPIClientCode == "")
	CPIClientCode := CPIClientCode2

; MsgBox, % CPIClientCode

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

; MsgBox, % http.Responsetext
gosub RecordAPIUses
return % value.Table[1].appid
}

RecordAPIUses:	
IniRead, APIUses, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, APIUses
APIUses++
IniWrite, %APIUses%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, APIUses
return	

; Chrome.ahk v1.2
; Copyright GeekDude 2018
; https://github.com/G33kDude/Chrome.ahk

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
