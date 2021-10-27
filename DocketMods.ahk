#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, pifmgr.dll, 16
CoordMode, ToolTip 

global OldRemarks
global Temp
global NumberOfEdits
ShowCloseActionButtons = 0
TestInput = This is a test.
ButtonSize = 70

DocSections := []
															DocSections[1]:= "fldstrCaseNumber_TextBox"
;DocSections[2]:= "fldstrCountry_TextBox"
															DocSections[2]:= "fldstrCaseNumber"
;DocSections[4]:= "fldstrSubCase"
;DocSections[5]:= "fldstrSubCase_TextBox"
;DocSections[6]:= "fldstrCaseType"
;DocSections[7]:= "fldstrCaseType_TextBox"
;DocSections[8]:= "fldstrTrademarkName_TextBox"
;DocSections[9]:= "fldstrCountryName"
															DocSections[3]:= "fldstrApplicationStatus_TextBox"
															DocSections[4]:= "fldstrTrademarkStatus_TextBox"
;DocSections[12]:= "fldstrTrademarkName"
															DocSections[5]:= "fldstrTrademarkStatus"
															DocSections[6]:= "fldstrApplicationStatus"
;DocSections[15]:= "fldstrClientName"
; DocSections[16]:= "fldstrMarkType_TextBox"
; DocSections[17]:= "fldstrClient_TextBox"

HTMLStuff =
;(
;<button id="testButton" value2="0" onclick="alert(window.location.href);" style="width: 100`%; color: blue; font-weight: bold;">Test button. This should persist on most sites.</button>
;)

; Look into fixed positioning.

global Computername

ThisYear := 2020
; EPRenewalFees := [0, 0, 470, 585, 820, 1050, 1165, 1280, 1395, 1575, 1575, 1575, 1575, 1575, 1575, 1575, 1575, 1575, 1575, 1575]

EPRenewalFees := [ 0, 0, 490, 610, 855, 1090, 1210, 1330, 1450, 1640, 1640, 1640, 1640, 1640, 1640, 1640, 1640, 1640, 1640, 1640 ]
	
StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}

if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder	

FileCopy, \\docs-oc\files\Docketing\AutoHotKey\Scripts\Archive\TestWebsite\index.html, C:\Users\%ComputerName%\DocketModsIndex.html, 1

global CherToggle
IniRead, ChangedTopBar,C:\Users\%Computername%\DocketMods.ini, Defaults, ChangedTopBar
IniRead, LeftSection,C:\Users\%Computername%\DocketMods.ini, Defaults, LeftSection
IniRead, RightSections,C:\Users\%Computername%\DocketMods.ini, Defaults, RightSections
IniRead, FancyRemarks,C:\Users\%Computername%\DocketMods.ini, Defaults, FancyRemarks
IniRead, CustomColor, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowColor
IniRead, NumberOfEdits, C:\Users\%Computername%\DocketMods.ini, Actions, NumberOfEdits
IniRead, BottomButtons, C:\Users\%Computername%\DocketMods.ini, Defaults, BottomButtons
IniRead, HideCPILogo,   C:\Users\%Computername%\DocketMods.ini, Defaults, HideCPILogo 
IniRead, ChangeColors,C:\Users\%Computername%\DocketMods.ini, Defaults, ChangeColors 
IniRead, CustomButtons,C:\Users\%Computername%\DocketMods.ini, Defaults, CustomButtons 
IniRead, CIDMods,C:\Users\%Computername%\DocketMods.ini, Defaults, CIDMods 
IniRead, CenterSection,C:\Users\%Computername%\DocketMods.ini, Defaults, CenterSection 
IniRead, DefaultAllActions,C:\Users\%Computername%\DocketMods.ini, Defaults, DefaultAllActions 
IniRead, CherToggle,C:\Users\%Computername%\DocketMods.ini, Defaults, CherToggle 


CIDMods = 1

ABAStatus := "Abandoned"
formattime, Today, ,  dd-MMM-yyyy   ;       MM/dd/yyyy          ;  yyyy-MM-dd
ABACloseDate := Today

if NumberOfEdits = ERROR
	NumberOfEdits = 1
	
if NumberOfEdits = 0
	NumberOfEdits = 1
	
Loop %NumberOfEdits%
	{
	IniRead, mid_Option%A_Index%, C:\Users\%Computername%\DocketMods.ini, Actions, StoredAction%A_Index%
	if mid_Option%A_Index% = ERROR
		{
		mid_Option%A_Index% = 
		break
		}
	}
	
; NumberOfEdits++

FileRead, AllActions, \\docs-oc\files\Docketing\AutoHotKey\Scripts\Archive\TestWebsite\All Action Types.txt


AllActions := StrSplit(AllActions, "`n")

Loop % AllActions.Length()
	ListedActions := ListedActions "|" AllActions[A_Index]


if CustomColor = Default
	CustomColor = abcdef

Custom_Edit 	:= "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\EDIT2.png"
Custom_Save 	:= "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\SAVE2.png"
Custom_Undo		:= "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\UNDO2.png"
Custom_New 		:= "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\NEW2.png"
Custom_Copy 	:= "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\COPY2.png"
Custom_Delete 	:= "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\DELETE2.png"
Custom_Print 	:= "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\PRINT2.png"

; http://oc-docketing/CPi/controls/ComboBox.aspx?key=536 - All Patent Actions
; http://oc-docketing/CPi/controls/ComboBox.aspx?key=2476 - All TM actions

UpdateStatus =
(
UPDATE NOTES | 10/10/2021
-DocketMods doesn't work with Chrome, so it is essentially dead.
-Some stuff might still work if you're using IE, but don't hold your breath.
-If there is stuff you still need that no longer works, let me know and I can look into moving it elsewhere.
-I'm turning the restart timer off so this won't show up each morning anymore.
`t-You can still start it manually if you want.
)

Gui, New, , DocketMods 10.10.2021 (Dead/Deprecated due to CPI upgrade.)
Gui, Add, Checkbox, Section Checked1 vBottomButtons gEnableDocketMods Disabled, Top Bar + Notepad + Bottom Buttons
Gui, Font, cBlue bold
Gui, Add, Checkbox, xs+50 Checked%ChangedTopBar% vChangedTopBar, DocketMods Top Bar
Gui, Add, Checkbox, xs+50 Checked%LeftSection% vLeftSection, Notepad (Left Section)
Gui, Add, Checkbox, xs+50 Checked%RightSections% vRightSections, Right-Buttons (Right Section)
Gui, Font, 
Gui, Add, Checkbox, xs Checked%ChangeColors% vChangeColors, Custom Docketing Colors
Gui, Add, Checkbox, xs yp+20 Checked%CherToggle% vCherToggle, Open System Switch in New Window?
Gui, Add, Checkbox, xs yp+20 Checked%CenterSection% vCenterSection, Show ABAer 2.1 in the Center Section?
Gui, Add, Checkbox, xs yp+20 Checked%FancyRemarks% vFancyRemarks, Show Remarks next to Actions?
Gui, Add, Radio, vWhereRemarks Checked1 xs+175 yp, Bottom
Gui, Add, Radio,  xp+55 yp, Left
Gui, Font, bold
Gui, Add, Checkbox, xs yp+25 Checked%DefaultAllActions% vDefaultAllActions, Default to "All Actions" in Docketing?
Gui, Font,
Gui, Add, Button, 	xs yp+25 gSubmitPrefs, Submit
Gui, Add, Edit, 	xs yp+30 +ReadOnly, %UpdateStatus%
Gui, Add, Text, , ---------------Custom Actions---------------
Gui, Add, Edit, vNumberOfEdits ReadOnly w50, %NumberOfEdits%
Gui, Add, Button, yp xp+55 gAddActionSlots, +


Loop %NumberOfEdits%
	{
	if A_Index = 1
		Gui, Add, ComboBox, xs Section vmid_Option%A_Index% w250, %  mid_Option%A_Index% "||"
	else if (Mod(A_Index, 15) = 1)
		Gui, Add, ComboBox, xp+265 ys vmid_Option%A_Index% w250, % mid_Option%A_Index% "||"
	else
		Gui, Add, ComboBox, yp+25 xp vmid_Option%A_Index% w250, % mid_Option%A_Index% "||"
	}

Gui, Show, 
return

EnableDocketMods:
Gui, Submit, NoHide

if BottomButtons = 0
	{
	GuiControl, , Button2, 0
	GuiControl, , Button3, 0
	GuiControl, , Button4, 0
	GuiControl, Disable, Button2
	GuiControl, Disable, Button3
	GuiControl, Disable, Button4
	}
else
	{
	GuiControl, , Button2, 1
	GuiControl, , Button3, 1
	GuiControl, , Button4, 1
	GuiControl, Enable, Button2
	GuiControl, Enable, Button3
	GuiControl, Enable, Button4
	}

return

GuiClose:
Reload
return

AddActionSlots:
WinGetPos, , , GuiWidth, GuiHeight, DocketMods 2.8.2021
FilledActions := NumberOfEdits + 2
GuiControlGet, LastFilledAction, , Edit%FilledActions%



if LastFilledAction = 
	return
else
	{
	NumberOfEdits++
	GuiControl, , NumberOfEdits, %NumberOfEdits%
	
	if (Mod(NumberOfEdits, 15) = 1)
		{
		Gui, Add, ComboBox, xp+265 ys vmid_Option%NumberOfEdits% w250, % mid_Option%NumberOfEdits% "|" ListedActions
		GuiWidth += 265
		Gui, Show, w%GuiWidth%
		}
	else
		{
		Gui, Add, ComboBox, yp+25 xp vmid_Option%NumberOfEdits% w250, % mid_Option%NumberOfEdits% "|" ListedActions
			if NumberOfEdits < 16
				{
				GuiHeight -= 3
				Gui, Show, h%GuiHeight%
				}
		}
	}
return

SubmitPrefs:
Gui, Submit
iniWrite, %HideCPILogo%,C:\Users\%Computername%\DocketMods.ini, Defaults, HideCPILogo 
iniWrite, %ChangeColors%,C:\Users\%Computername%\DocketMods.ini, Defaults, ChangeColors 
iniWrite, %BottomButtons%,C:\Users\%Computername%\DocketMods.ini, Defaults, BottomButtons
iniWrite, %CIDMods%,C:\Users\%Computername%\DocketMods.ini, Defaults, CIDMods 
iniWrite, %CenterSection%,C:\Users\%Computername%\DocketMods.ini, Defaults, CenterSection 
iniWrite, %DefaultAllActions%,C:\Users\%Computername%\DocketMods.ini, Defaults, DefaultAllActions 
iniWrite, %CherToggle%,C:\Users\%Computername%\DocketMods.ini, Defaults, CherToggle 
iniWrite, %FancyRemarks%,C:\Users\%Computername%\DocketMods.ini, Defaults, FancyRemarks
iniWrite, %LeftSection%   ,C:\Users\%Computername%\DocketMods.ini, Defaults, LeftSection
iniWrite, %RightSections% ,C:\Users\%Computername%\DocketMods.ini, Defaults, RightSections	
iniWrite, %ChangedTopBar% ,C:\Users\%Computername%\DocketMods.ini, Defaults, ChangedTopBar	



if (WhereRemarks == "1")
	WhereRemarks := "Bottom"
else if (WhereRemarks == "2")
	WhereRemarks := "Left"

HoverColor = edefff
TextColor = blue
gosub CreateButtons
Loop %NumberOfEdits%
	{
	Temp := mid_Option%A_Index%    ; FIGURE THIS OUT LATER.
	if Temp = 
		{
		NumberOfEdits := A_Index
		IniWrite, %Temp%, C:\Users\%Computername%\DocketMods.ini, Actions, StoredAction%A_Index%
		IniWrite, %NumberOfEdits%, C:\Users\%Computername%\DocketMods.ini, Actions, NumberOfEdits
		break
		}
	else	
		IniWrite, %Temp%, C:\Users\%Computername%\DocketMods.ini, Actions, StoredAction%A_Index%
	}
IniWrite, %NumberOfEdits%, C:\Users\%Computername%\DocketMods.ini, Actions, NumberOfEdits

ie := WBGet()


;            PUT THE RESTART TIMER HERE. https://www.autohotkey.com/docs/commands/FormatTime.htm


SetTimer, UpdateCycle, 30
; SetTimer, RestartScript, -50400000
return

RestartScript:
Reload
return

CreateButtons:
formattime, Today, ,  dd-MMM-yyyy   ;       MM/dd/yyyy          ;  yyyy-MM-dd
buttontemp = 
(
&nbsp; 
<td title="AttyFinder" style="height: 100`%; width:65px; text-align:center; border:0px solid black; padding: 0px;"><button style="font: bold 10px arial, sans-serif; height:18px; width:85px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="attyFinder" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >AttyFinder</button></td>
)		

IniRead, NoteInput, C:\Users\%Computername%\DocketMods.ini, Notes, SavedNotes

if NoteInput = ERROR
	NoteInput = Welcome to DocketMods!`n`nThis notepad will persist even if you restart!`n`nClick Edit to modify your remarks.`n`nMake sure you click Save to store your changes.`n`nControl + S will let you Edit/Save too.
else	
	StringReplace, NoteInput, NoteInput, <br>, `r`n, A	

IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
IniRead, RespAtty, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
	if RespAtty = ERROR
		RespAtty := ""

location := ie.LocationURL
if instr(location, "Agent")
	{
	CountryPage := "http://oc-docketing/CPiAgent/patschCountryApplicationAgent.aspx"
	ActionDuePat := "http://oc-docketing/CPiAgent/patschActionDueAgent.aspx"
	InventionScreen := "http://oc-docketing/CPiAgent/patschInventionAgent.aspx"	
	TMPage := "http://oc-docketing/CPiAgent/tmkschTrademarkAgent.aspx"
	ActionDueTM := "http://oc-docketing/CPiAgent/tmkschActionDueAgent.aspx"
	
	if instr(location, "tmksch")
		OppositePage := "http://oc-docketing/CPi/tmkschTrademark.aspx"
	else
		OppositePage := "http://oc-docketing/CPi/patschCountryApplication.aspx"
		
	CurrentSystem = AGENT
	}
else
	{
	CountryPage := "http://oc-docketing/CPi/patschCountryApplication.aspx"
	ActionDuePat := "http://oc-docketing/CPi/patschActionDue.aspx"
	InventionScreen := "http://oc-docketing/CPi/patschInvention.aspx"	
	TMPage := "http://oc-docketing/CPi/tmkschTrademark.aspx"
	ActionDueTM := "http://oc-docketing/CPi/tmkschActionDue.aspx"
	
	if instr(location, "tmksch")
		OppositePage := "http://oc-docketing/CPiAgent/tmkschTrademarkAgent.aspx"
	else
		OppositePage := "http://oc-docketing/CPiAgent/patschCountryApplicationAgent.aspx"
	
	CurrentSystem = LIVE
	}

if instr(location, "tmk")
	{
	ActiveTM = ffe500
	ActiveTMText = 000000
	ActiveTMTextHover = C0C0C0
	
		
	ActivePAT = 006699
	ActivePATText = CCCCCC
	ActivePATTextHover = FFCC66
	}
else
	{
	ActivePAT = ffe500
	ActivePATText = 000000
	ActivePATTextHover = C0C0C0
	
	ActiveTM = 006699
	ActiveTMText = CCCCCC
	ActiveTMTextHover = FFCC66
	}
	
	
;<a title="Exception List" style="font: bold x-small Verdana; height:20px; border: 1px solid black; color:CCCCCC; background-color:006699; cursor: pointer; padding-left: 5px; padding-right: 5px;" 
;id="exceptionList" value="Exception List" value1="0"  onMouseOut="this.style.color='CCCCCC'" onMouseOver="this.style.color='FFCC66'" onclick="value1 = 1;">Exception List</a>
;&nbsp;
;<a title="Send Feedback" style="font: bold x-small Verdana; height:20px; border: 1px solid black; color:000000; background-color:ffe500; cursor: pointer; padding-left: 5px; padding-right: 5px;" 
;id="sendFeedback" value="Feedback" value1="0" href="#"  onMouseOut="this.style.color='000000'" onMouseOver="this.style.color='ff0000'" onclick="window.open('mailto:Paperboy@knobbe.com&subject=DocketMods&nbsp;Feedback');">Feedback</a>


topBar = 
(
<a title="Go to Opposite System" style="font: bold x-small Verdana; border: 1px solid black; height:20px; color:black; background-color:white; cursor: pointer; padding-left: 5px; padding-right: 5px;"
id="oppositeSystem" onMouseOut="this.style.color='black'" onMouseOver="this.style.color='red'" href="%OppositePage%">%CurrentSystem%</a>
&nbsp;
<a title="Patent Search" style="font: bold x-small Verdana; height:20px; border: 1px solid black; color:%ActivePATText%; background-color:%ActivePAT%; cursor: pointer; padding-left: 5px; padding-right: 5px;" 
id="patentSearch" onMouseOut="this.style.color='%ActivePATText%'" onMouseOver="this.style.color='%ActivePATTextHover%'" href="%CountryPage%">Patent Search</a>
<a title="Patent Action Due" style="font: bold x-small Verdana; height:20px; border: 1px solid black; color:%ActivePATText%; background-color:%ActivePAT%; cursor: pointer; padding-left: 5px; padding-right: 5px;"
id="patentActionDue" onMouseOut="this.style.color='%ActivePATText%'" onMouseOver="this.style.color='%ActivePATTextHover%'" href="%ActionDuePat%">Action Due</a>
<a title="Patent Invention" style="font: bold x-small Verdana; height:20px; border: 1px solid black; color:%ActivePATText%; background-color:%ActivePAT%; cursor: pointer; padding-left: 5px; padding-right: 5px;"
id="patentInvention" onMouseOut="this.style.color='%ActivePATText%'" onMouseOver="this.style.color='%ActivePATTextHover%'" href="%InventionScreen%">Invention</a>
&nbsp;
<a title="Trademark Search" style="font: bold x-small Verdana; height:20px; border: 1px solid black; color:%ActiveTMText%; background-color:%ActiveTM%; cursor: pointer; padding-left: 5px; padding-right: 5px;"
id="trademarkSearch" onMouseOut="this.style.color='%ActiveTMText%'" onMouseOver="this.style.color='%ActiveTMTextHover%'" href="%TMPage%">Trademark Search</a>
<a title="Trademark Action Due" style="font: bold x-small Verdana; height:20px; border: 1px solid black; color:%ActiveTMText%; background-color:%ActiveTM%; cursor: pointer; padding-left: 5px; padding-right: 5px;"
id="trademarkActionDue" onMouseOut="this.style.color='%ActiveTMText%'" onMouseOver="this.style.color='%ActiveTMTextHover%'" href="%ActionDueTM%">Action Due</a>
&nbsp;&nbsp;

<input type="button" title="Placeholder Button" style="font: bold x-small Verdana; height:22px; 
width:75px; border: 1px solid black;
color:CCCCCC; background-color:006699; cursor: pointer;" 
id="topbar" value="Extras" value1="0" onMouseOut="this.style.color='CCCCCC'" onMouseOver="this.style.color='FFCC66'" 
onclick="
var visible = document.getElementById('testDiv').style.display; 

if (visible === 'flex') { 
	document.getElementById('testDiv').style.display = 'none'; 
} else { 
	document.getElementById('testDiv').style.display = 'flex'; 
}">

<div id="testDiv" style="float: center; width: 100`%; text-align: left; display: none; border: 0px solid red; flex-direction: row">


<div style="float: center; width: 100`%;">
	<a title="Maintenance Menu" style="text-align:center; font: bold x-small Verdana; border: 1px solid black; height:20px; width: 100`%; color:black; background-color:white; cursor: pointer;" onMouseOut="this.style.color='black'" onMouseOver="this.style.color='red'" href="http://oc-docketing/CPi/maintenance.aspx">Open Maintenance</a>
</div>


<div style="float: left; width: 50`%;">
	<textarea readonly style="width: 100`%; height: 200px; font: italic;" wrap="hard">%NoteInput%</textarea>
</div>

<div style="float: center; display: inline-block; text-align: center; width: 100`%;">

	<textarea readonly style="width: 100`%; height: 100px; font: italic;" wrap="hard">Test notes.</textarea>
	<button style="width: 20`%; height: 100px; font: italic;">Test button.</button>
	<button style="width: 30`%; height: 100px; font: italic;">Test button.</button>
	<button style="width: 50`%; height: 100px; font: italic;">Test button.</button>
</div>
</div>

)	

if (LeftSection)
	{
	notesection = 
	(
		<div style="padding: 3px;"></div>
		<table id="ahkmods" style="padding:0px; border: 1px solid black; height: 165px; width:100`%; text-align: left;">
		<tr>
		<td rowspan="4" colspan="3" title="" style="width: 450px; height: 165px; text-align:center; border:1px solid black; padding: 0px;">
			<textarea readonly title="" style="
			align:middle; text-align:left; height:165px; width:450px; color: black; background:E4E4E4;" 
			id="noteArea" 
			value1="0" 
			onfocusin=""
			onfocusout=""
			onMouseOver="" 
			onMouseOut=""
			ondblclick=""
			
			wrap="hard">%NoteInput%</textarea>
			</td>
			
			<td style="border-right: 1px solid black; vertical-align: 'top'; padding-right: 3px;">
				<button id="noteEdit" onclick="
				
				if (this.value === 'Edit') {
					document.getElementById('noteArea').readOnly = false; 
					document.getElementById('noteArea').focus(); 
					document.getElementById('noteArea').style.color='black'; 
					document.getElementById('noteArea').style.backgroundColor='FFBFBF';
					this.style.backgroundColor = 'FFBFBF';
					this.value = 'Save';
				} else {
					this.value = 'Saved';
					document.getElementById('noteArea').style.backgroundColor = 'lightgreen';
					document.getElementById('noteArea').readOnly = true; 
					document.getElementById('noteArea').blur(); 
					document.getElementById('noteArea').style.color='black'; 
					document.getElementById('noteArea').value1 = 1;
					this.style.backgroundColor = 'lightgreen';
				}
				"

				style="width: 40px;">Edit</button>
			</td>
		</td>
	)
	}
else
	{
	notesection = 
	(
		<table id="ahkmods" style="padding:0px; border: 1px solid black; height: 165px; width:100`%; text-align: left;">
		<tr>
			<td>	
				<div style="height:165px; width:500px; border: 0px black solid;" id="noteArea" value1="0" onscroll="">
				</div>	
			</td>
	)
	}

  
mid_Button1 = 
/*
(
<table>
	<tr><td title="" style="valign: top; height: 100`%; width:100px; text-align:center; border:0px solid black; padding: 0px;"><button title="Inject selection into Action Type." style="height:50px; width:100px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;"  id="ahkBut30" value1="0" onclick="var temp = document.getElementById('actionMulti').value; document.getElementById('fldstrActionType_TextBox').value = temp; document.getElementById('btnEdit').click();" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Inject into<br>Action Type</button></td></tr>
	<tr><td title="" style="valign: top; height: 100`%; width:100px; text-align:center; border:0px solid black; padding: 0px;"><button title="Inject selection into Remarks.&#10;&#10;Will include Date and Initials." style="height:50px; width:100px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;"  id="ahkBut30" value1="0" onclick="var temp = document.getElementById('actionMulti').value; var temp2 = document.getElementById('fldstrRemarks').value; document.getElementById('fldstrRemarks').value = '%ATDate% ' + temp + ' %Username%\r\n' + temp2; document.getElementById('btnEdit').click();" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Inject into<br>Remarks</button></td></tr>
	<tr><td title="" style="valign: top; height: 100`%; width:100px; text-align:center; border:0px solid black; padding: 0px;"><button  title="%title_mid_Button1%" style="height:50px; width:100px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;"  id="ahkBut30" value1="0" onclick="test();" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Docket</button></td></tr>
	<tr><td title="" style="valign: top; height: 100`%; width:100px; text-align:center; border:0px solid black; padding: 0px;"><button disabled title="%title_mid_Button1%" style="height:50px; width:100px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;"  id="ahkBut30" value1="0" onclick="var temp = document.getElementById('actionMulti').value; document.getElementById('fldstrActionType_TextBox').value = temp;" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Docket</button></td></tr>
</table>
)
*/

mid_Actions = <option>----- STORED ACTIONS -----</option> 
NewIndex = 1

Loop %NumberOfEdits%
	{
	Temp := mid_Option%A_Index%

	if instr(Temp, "INT-") || instr(Temp, "US-") || instr(Temp, "DKT-") || instr(Temp, "DND-") || instr(Temp, "STM-") || instr(Temp, "HTTP-") 
		{
		mid_Actions = %mid_Actions% <option value="%Temp%">%NewIndex%. %Temp%</option>
		NewIndex++
		}
	}

mid_Actions2 = <option>----- STORED REMARKS -----</option> 
NewIndex = 1
Loop %NumberOfEdits%
	{
	Temp := mid_Option%A_Index%
	if instr(Temp, "INT-") || instr(Temp, "US-") || instr(Temp, "DKT-") || instr(Temp, "DND-") || instr(Temp, "STM-") || instr(Temp, "HTTP-") 
		{
		}
	else if Temp =
		{
		}		
	else
		{
		mid_Actions2 = %mid_Actions2% <option value="%Temp%">%NewIndex%. %Temp%</option>
		NewIndex++
		}
	}

;	<input type="button" id="tempbutton" value="Closed for Maintenance" style="width: 100`%; height: 198px;" onclick="this.style.fontSize = '28px'; this.style.color = 'red'; this.value = 'I\'m a big button.';">
; 	<div style="overflow-x:scroll; height:200px; width:400px; border: 1px black solid;" 

if ABAStatus = Abandoned
	{
	ABAOptions =
	(
	<option value="Pre ABA">Pre ABA</option>
	<option selected value="Abandoned">Abandoned</option>
	<option value="Confirm ABA">Confirm ABA</option>
	<option value="Reactivate">Reactivate</option>
	)
	
	ABAExtraButton = 
	(
	<button id="ABAClientInstr" style="display: none; width: 204px; height: 24px; font-size: 11px;"  onclick="this.value1 = 1;">INT-ABA CLIENT INSTR TO ABA RECVD</button>						
	)
	
	ActionButtons = 
	(
	<td>
		<button style="display: block; width: 100px; height: 24px; font-size: 12px;"  id="ABADocketAction" 	 value1="0" onclick="this.value1 = 1;">Docket Action</button>
	</td>
	<td>
		<button style="display: block; width: 100px; height: 24px; font-size: 12px;"  id="ABACloseAction" 	 value1="0" onclick="this.value1 = 1;">Close Action</button>
	</td>
	)
	
	StatusAndDisclosure = 
	(
	<td>
		<button id="ABAUpdateStatus" style="width: 100px; height: 24px; font-size: 12px;"  onclick="this.value1 = 1;">Update Status</button>						
	</td>
	<td>
		<button style="width: 100px; height: 24px; font-size: 12px;" id="ABACloseDisclosure" value1="0" onclick="this.value1 = 1;">Close Disclosure</button><br>
	</td>
	)
	}
else if ABAStatus = Pre ABA
	{
	ABAOptions =
	(
	<option selected value="Pre ABA">Pre ABA</option>
	<option value="Abandoned">Abandoned</option>
	<option value="Confirm ABA">Confirm ABA</option>
	<option value="Reactivate">Reactivate</option>
	)	
	
	ABAExtraButton = 
	(
	<button id="ABAClientInstr" style="display: block; width: 204px; height: 24px; font-size: 11px;"  onclick="this.value1 = 1;">INT-ABA CLIENT INSTR TO ABA RECVD</button>						
	)
	
	ActionButtons = 
	(
	<td>
		<button style="display: block; width: 100px; height: 24px; font-size: 12px;"  id="ABADocketAction" 	 value1="0" onclick="this.value1 = 1;">Docket Action</button>
	</td>
	<td>
		<button style="display: block; width: 100px; height: 24px; font-size: 12px;"  id="ABACloseAction" 	 value1="0" onclick="this.value1 = 1;">Close Action</button>
	</td>
	)
	
	StatusAndDisclosure = 
	(
	<td>
		<button id="ABAUpdateStatus" style="width: 100px; height: 24px; font-size: 12px;"  onclick="this.value1 = 1;">Update Status</button>						
	</td>
	<td>
		<button style="width: 100px; height: 24px; font-size: 12px;" id="ABACloseDisclosure" value1="0" onclick="this.value1 = 1;">Close Disclosure</button><br>
	</td>
	)
	}
else if ABAStatus = Confirm ABA
	{
	ABAOptions =
	(
	<option value="Pre ABA">Pre ABA</option>
	<option value="Abandoned">Abandoned</option>
	<option selected value="Confirm ABA">Confirm ABA</option>
	<option value="Reactivate">Reactivate</option>
	)	
	
	ABAExtraButton = 
	(
	<button id="ABAClientInstr" style="display: none; width: 204px; height: 24px; font-size: 11px;"  onclick="this.value1 = 1;">INT-ABA CLIENT INSTR TO ABA RECVD</button>						
	)
	
	ActionButtons = 
	(
	<td>
		<button style="display: block; width: 100px; height: 24px; font-size: 12px;"  id="ABADocketAction" 	 value1="0" onclick="this.value1 = 1;">Docket Action</button>
	</td>
	<td>
		<button style="display: block; width: 100px; height: 24px; font-size: 12px;"  id="ABACloseAction" 	 value1="0" onclick="this.value1 = 1;">Close Action</button>
	</td>
	)
	
	StatusAndDisclosure = 
	(
	<td>
		<button id="ABAUpdateStatus" style="width: 100px; height: 24px; font-size: 12px;"  onclick="this.value1 = 1;">Update Status</button>						
	</td>
	<td>
		<button style="width: 100px; height: 24px; font-size: 12px;" id="ABACloseDisclosure" value1="0" onclick="this.value1 = 1;">Close Disclosure</button><br>
	</td>
	)
	}
else if ABAStatus = Reactivate
	{
	ABAOptions =
	(
	<option value="Pre ABA">Pre ABA</option>
	<option value="Abandoned">Abandoned</option>
	<option value="Confirm ABA">Confirm ABA</option>
	<option selected value="Reactivate">Reactivate</option>
	)	
	
	ABAExtraButton = 
	(
	<button id="ABAClientInstr" style="display: none; width: 204px; height: 24px; font-size: 11px;"  onclick="this.value1 = 1;">INT-ABA CLIENT INSTR TO ABA RECVD</button>						
	)
	
	ActionButtons = 
	(
	<td>
		<button style="display: none; width: 100px; height: 24px; font-size: 12px;"  id="ABADocketAction" 	 value1="0" onclick="this.value1 = 1;">Docket Action</button>
	</td>
	<td>
		<button style="display: none; width: 100px; height: 24px; font-size: 12px;"  id="ABACloseAction" 	 value1="0" onclick="this.value1 = 1;">Close Action</button>
	</td>
	)
	
	StatusAndDisclosure = 
	(
	<td>
		<button id="ABAUpdateStatus" style="width: 100px; height: 24px; font-size: 12px;"  onclick="this.value1 = 1;">Update Status</button>						
	</td>
	<td>
		<button style="width: 100px; height: 24px; font-size: 12px;" id="ABACloseDisclosure" value1="0" onclick="this.value1 = 1;">Open Disclosure</button><br>
	</td>
	)
	}	
	
IniRead, RespAtty, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty


if (CenterSection)
	{
	midsection =
	(
	<td style="width: 100`%; padding:0px; ">
		
<table>
	<tr>
		<td>
		
		<div style="height:165px; width:195px; border: 1px black solid; background-color: lightgray;" onscroll=""	>
			<table style="width: 100`%; vertical-align: 'top'; ">
				<tr>
				
					<td colspan="2"style="border-right: 0px solid black; width: 100`%;">
						<button disabled style="width: 100px; height: 24px; color: red;">ABAer 2.1</button>&nbsp;&nbsp;&nbsp;&nbsp;

						<input type="text" onfocus="this.style.backgroundColor = 'FFBFBF';" onblur="this.value1 = 1;" value1="0" id="ABARespAtty" value="%RespAtty%" style="width: 50px; height: 23px; text-align: center;">
						
					</td>
					<td style="">
					</td>
					
				</tr>
				<tr>
					<td style="border-right: 0px solid black; width: 100`%">	
						
						<select id="ABAStatus" value1="0" size="1" 
							style="border-right: 0px black solid; width: 100px; font: bold;" 
							onchange="this.value1 = 1;
							if (this.value === 'Pre ABA') {
								document.getElementById('ABAClientInstr').style.display = 'block';
								document.getElementById('ABADocketAction').style.display = 'block';
								document.getElementById('ABACloseAction').style.display = 'block';
								document.getElementById('ABACloseDisclosure').value = 'Close Disclosure';
							} else if (this.value === 'Reactivate')  {
								document.getElementById('ABAClientInstr').style.display = 'none';
								document.getElementById('ABADocketAction').style.display = 'none';
								document.getElementById('ABACloseAction').style.display = 'none';
								document.getElementById('ABACloseDisclosure').value = 'Open Disclosure';
							} else { 
								document.getElementById('ABAClientInstr').style.display = 'none';
								document.getElementById('ABADocketAction').style.display = 'block';
								document.getElementById('ABACloseAction').style.display = 'block';
								document.getElementById('ABACloseDisclosure').value = 'Close Disclosure';
							}"
							>
							
							%ABAOptions%
							
						</select>
					</td>
					<td>
						<input type="text" style="width: 100px; text-align: center;" id="ABACloseDate" value1="0" value="%ABACloseDate%">
					</td>
					
					
				</tr>
				<tr>
				
				%ActionButtons%
				
				</tr>
				<tr>

				%StatusAndDisclosure%
		
				</tr>
				<tr>
					<td colspan="2">
						%ABAExtraButton%
					</td>
					<td>

					</td>
				</tr>				
				
				
				
			</table>
		</div>
		
		</td>

		<td>
		
		<div style="overflow-y: scroll;height:165px; width:180px; border: 1px black solid;" onscroll=""	>
			<table style="width: 100`%; vertical-align: 'top';">
				<tr>

					<td style="border-right: 0px solid black; width: 100`%">
					
						<button disabled style="width: 100`%">Test</button><br><br>
						<button disabled style="width: 100`%">Test</button><br><br>
						<button disabled style="width: 100`%">Test</button><br><br>
						<button disabled style="width: 100`%">Test</button><br><br>
						<button disabled style="width: 100`%">Test</button><br><br>
						<button disabled style="width: 100`%">Test</button><br><br>
						


					</td>
				</tr>
			</table>
		</div>
		
		</td>		
	</tr>		
</table>

	</td>	
	)
	
midsection2 =
(
<div id="testID" style="position: absolute; left: 420px; right: 0; top: 300px; margin-left: auto; margin-right: auto;">
<table id="tbl1" style="border: 2px solid black; border-collapse: collapse; text-align: center;">
<tbody>
<tr>
  <td id="rowtitle" colspan="3" 
	  style="width: 400px; text-align: center; font-weight: bold; font-size: 20px; color: blue; border-bottom: 1px solid black;  background-color: #DDDDDD">This is a custom AHK notification.
  </td>
  <td style="background-color: #DDDDDD; border-bottom: 1px solid black; ">
	<button onclick="document.getElementById('tbl1').style.visibility = 'hidden';" 
			style="background-color: red; height: 25px; width: 25px; border: 2px solid black;" 
			onmouseover="this.style.backgroundColor = '#FF8888';"
			onmouseout="this.style.backgroundColor = 'red';">X</button></td>
</tr>
		<tr>
  <td id="" 
	  colspan="4" 
	  style="background-color: #EEEEEE">&nbsp; 
  </td>
</tr>
 <tr>
  <td id="row1" 
	  colspan="4" 
	  style="background-color: #EEEEEE">This is the first row of text.
  </td>
</tr>
<tr>
  <td id="row2" 
	  colspan="4" 
	  style="background-color: #EEEEEE">This is the second row of text.
  </td>
</tr>
<tr>
  <td id="row3" 
	  colspan="4" 
	  style="background-color: #EEEEEE">This is the third row of text.
  </td>
</tr>
	<tr>
  <td id="" 
	  colspan="4" 
	  style="background-color: #EEEEEE">&nbsp; 
  </td>
</tr>
 <tr>
   <td id="row4" 
	  colspan="4" 
	  style="background-color: #EEEEEE">
	 <button>OK, sounds good.</button>
&nbsp;   &nbsp;   &nbsp;   
	 <button onclick="Fine();">No thanks!</button>
&nbsp;   &nbsp;   &nbsp;   
	  <button onclick="Fine();">button3</button>        
   </td>
</tr>   
		<tr>
  <td id="" 
	  colspan="4" 
	  style="background-color: #EEEEEE">&nbsp; 
  </td>
</tr>

</tbody>
</table>
</div>
)	
	
} else {

midsection =
	(
	<td style="width: 100`%; padding:0px; ">
		

	</td>	
	)

}

/*
	{
	midsection =
	(
	<td style="width: 100`%; padding:0px; ">
		<div style="overflow-y: scroll;height:165px; width:400px; border: 0px black solid;" 
		onscroll=""	>
			<table style="width: 100`%;">
				<tr>
				<td style="text-align:center; border:1px solid black; padding: 0px; width: 100`%;" colspan="1" rowspan="1">
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>
					<button style="height: 80px; width: 20`%;"> test </button>

				</td>

				</tr>
			</table>
		</div>
	</td>	
	)
	}
else
	{
*/	
;	}
	


/*
<td colspan="3" rowspan="4" style="width: 100`%; padding:2px; ">
	<div  style="overflow-y:scroll; height:200px; width:100`%;">
		<table>
			<tr>
				<td title="" style="height: 100`%; width:150px; text-align:center; border:0px solid black; padding: 0px;">
					<select id="actionMulti" size="13" style="width: 200px;" >
						%mid_Actions%
					</select>
				</td>
				<td>
				
				%mid_Button1%
				
				</td>
			</tr>				
		</table>
	</div>
</td>	
*/	

;		<td title="" style="valign: top; height: 100`%; width:100px; text-align:center; border:0px solid black; padding: 0px;"><button title="Inject Action" style="font: bold 10px; height:20px; width:100px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;"  id="ahkBut30" value1="0" onclick="var temp = document.getElementById('newActionBar').value; document.getElementById('fldstrActionType_TextBox').value = temp; document.getElementById('btnEdit').click();" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Inject Action</button></td>
;		<td title="" style="valign: top; height: 100`%; width:100px; text-align:center; border:0px solid black; padding: 0px;"><button title="Inject Remarks" style="font: bold 10px; height:20px; width:100px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;"  id="ahkBut30" value1="0" onclick="var temp = document.getElementById('newActionBar').value; var temp2 = document.getElementById('fldstrRemarks').value; document.getElementById('fldstrRemarks').value = '%ATDate% ' + temp + ' %Username%\r\n' + temp2; document.getElementById('btnEdit').click();" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Inject Remarks</button></td>

;		dropdownWidth := ie.document.getElementById('fldstrActionType_TextBox').style.width

if ShowCloseActionButtons = 0
	QuickCloseStatus := "Turn Quick Close ON"
else
	QuickCloseStatus := "Turn Quick Close OFF"	


ATActionSearchButton =
(
<input id="findATaction" type="button" value1="0" value="Click to find AT action." style="font: bold 12px arial, sans-serif; height:21px; width:100`%; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;"
onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" 
onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%TextColor%'" 
onclick="this.value1 = 1;">
)

if instr(location, "Agent")
	{
	ATActionSearchButton =
	(
	<input disabled id="findATaction" type="button" value1="0" value="Audit Trail - Disabled" style="font: bold 12px arial, sans-serif; height:21px; width:100`%; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;"
	onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" 
	onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%TextColor%'" 
	)	
	}

;		<select style="border-right: 1px black solid; width: 100`%; font: bold; " onchange="var temp = document.getElementById('newActionBar').value; document.getElementById('fldstrActionType_TextBox').value = temp; document.getElementById('btnEdit').click();" id="newActionBar" value1="0" size="1" style="width: 378px;" >
;			%mid_Actions%
;		</select>

;		<select style="border-right: 1px black solid; width: 100`%; font: bold;" onchange="var temp = document.getElementById('newRemarksBar').value; var temp2 = document.getElementById('fldstrRemarks').value; document.getElementById('fldstrRemarks').value = '%ATDate% ' + temp + ' %Username%\r\n' + temp2; document.getElementById('btnEdit').click();" id="newRemarksBar" value1="0" size="1" style="width: 378px;" >
;			%mid_Actions2%
;		</select>

newActions = 
(
<table style="width: 100`%; border: 1px solid black;">
	<tr>
		<td style="border-right: 1px black solid; width: 20`%; ">
		<select style="border-right: 1px black solid; width: 100`%; font: bold; " onchange="var temp = document.getElementById('newActionBar').value; document.getElementById('fldstrActionType_TextBox').value = temp; document.getElementById('btnEdit').click();" id="newActionBar" value1="0" size="1" style="width: 378px;" >
			%mid_Actions%
		</select>
		</td>	

		<td style="border-right: 1px black solid; width: 20`%">
		<select style="border-right: 1px black solid; width: 100`%; font: bold;" onchange="var temp = document.getElementById('newRemarksBar').value; var temp2 = document.getElementById('fldstrRemarks').value; document.getElementById('fldstrRemarks').value = temp + ' %Username%\r\n' + temp2; document.getElementById('btnEdit').click();" id="newRemarksBar" value1="0" size="1" style="width: 378px;" >
			%mid_Actions2%
		</select>
		</td>
		
		<td style="border-right: 1px black solid; width: 15`%">	
			%ATActionSearchButton%
		</td>		

		<td style="border-left: 1px black solid; border-right: 1px black solid; width: 7`%;">
			<input type="text" id="respAtty" value="%RespAtty%" style="width: 100`%; padding: 0px; text-align: center;">
		</td>
			
		<td style="border-right: 1px black solid; width: 12`%;">			
			<input title="SUPEResponse" type="button" style="font: bold 12px arial, sans-serif; height:21px; width:100`%; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="supeResponse" value="SUPEResponse" value1="0" 
			onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" 
			onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%TextColor%'" 
			onclick="this.value1 = 1;">
		</td>
		
		<td style="border-right: 1px black solid; width: 12`%;">
			<input type="button" style="font: bold 12px arial, sans-serif; height:21px; width:100`%; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="closeActionButs" value1="0" onclick="this.value1 = 1;" value="%QuickCloseStatus%"
			onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" 
			onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%TextColor%'" 
			> 
		</td>
		
		<td style="border-right: 1px black solid; width: 12`%;">
			<input type="button" style="font: bold 12px arial, sans-serif; height:21px; width:100`%; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="setDocketModsDate" value1="0" onclick="this.value1 = 1;" value="Quick Close Settings" 
			onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" 
			onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%TextColor%'" 
			> 
		</td>
	</tr>
</table>
)	
; window.open('http://kmobnetold/outsidekmobnet/cid/cidold/ClientList.aspx', '_blank');

if ComputerName = tyler.dickson
	right_Button1 =		<td title="Test Injector" style="height: 100`%; width:50`%; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:50px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="testInject" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Test<br>Injector</button><button disabled style="height:50px; width:50px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut22" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Button</button></td>
else
	right_Button1 =		<td title="" style="height: 100`%; width:50`%; text-align:center; border:0px solid black; padding: 0px;"><button disabled style="height:50px; width:50px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="testInject" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Test<br>Injector</button><button disabled style="height:50px; width:50px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut22" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Button</button></td>
	
	right_Button2 = 	<td title="HANBEV it!" style="height: 100`%; width:150px; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:100px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair; " id="ahkBut3" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'; this.style.fontWeight='normal'; this.style.fontSize= '10pt';" onMouseOver="this.style.backgroundColor='green'; this.style.color='black'; this.style.fontWeight='bold'; this.style.fontSize= '13pt' ">HANBEV it!</button></td>
	right_Button3 =		<td title="Open CID" style="height: 100`%; width:150px; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:100px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="cidButton" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Open CID</button></td>
	right_Button4 =		<td title="PCT 220 Date Generator" style="height: 100`%; width:150px; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:100px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut4" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >PCT 220<br>Date Generator</button></td>
	
	; right_Button5 =		<td title="Copy Action to Audit Trail" style="height: 100`%; width: 150px; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:100px; color:%TextColor%; background-color:yellow; cursor:crosshair;" id="copyActionToAT" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='yellow'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='red'" >Copy Action<br>to Audit Trail</button></td>
	right_Button5 =		<td title="IntFees" style="height: 100`%; width: 150px; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:100px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut5" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='red'" >*IntFees<br>Exception List</button></td>
	
	
	right_Button6 =		<td title="Set Button Size" style="height: 100`%; width:150px; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:100px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut2" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Set Button Size</button></td>
	right_Button7 =		<td title="Create New Email" style="height: 100`%; width:150px; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:100px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut7" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Create<br>New Email</button></td>
	right_Button8 = 	blank
	right_Button9 =		<td title="Insert Opposition Remarks" style="height: 100`%; width:150px; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:100px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut18" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Insert<br>Opp Remarks</button></td>
	;right_Button10 =	<td title="" style="height: 100`%; width:33`%; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:50px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut22" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Button</button><button disabled style="height:50px; width:50px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut22" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Button</button></td>
	;right_Button11 =	<td title="" style="height: 100`%; width:33`%; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:50px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut23" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Button</button><button disabled style="height:50px; width:50px; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut22" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Button</button></td>
	right_Button12 =	<td title="Restart DocketMods" style="height: 100`%; width:33`%; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:100px; color:red; background-color:%CustomColor%; cursor:not-allowed;" id="ahkRestart" value1="0" onclick="if (this.value1 === '0') {this.value1 = '2'; this.value = 'You sure?';}; else if (this.value1 === '2') {this.value = 'Alright,<br>restarting!'; this.value1 = '1';};" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='red'" onMouseOver="this.style.backgroundColor='red'; this.style.color='black'" >Restart<br>DocketMods</button></td>
	; right_Button13 =	<td title="" rowspan="1"  colspan="2" style="height: 50px; width:50`%; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:100`%; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut22" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Button</button></td>
	; right_Button14 =	<td title="" rowspan="1"  style="height: 50px; width:50`%; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:100`%; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut22" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Button</button></td>
	; right_Button16 =	<td title="" rowspan="1" style="height: 50px; width:100`%; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:100`%; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut22" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Button</button></td>
	; right_Button17 =	<td title="" rowspan="1" colspan="2" style="height: 50px; width:100`%; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:100`%; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut22" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Button</button></td>
	; right_Button19 =	<td title="" rowspan="1" colspan="3" style="height: 50px; width:100`%; text-align:center; border:0px solid black; padding: 0px;"><button style="height:50px; width:100`%; color:%TextColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut22" value1="0" onclick="this.value1 = '1';" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='%HoverColor%'; this.style.color='%CustomColor%'" >Button</button></td>


if (RightSections)
	{
	rightsection = 
	(
	<td colspan="3" rowspan="4" style="width: 100`%; padding:2px; ">
		<div  style="overflow-y:scroll; height:165px; width:100`%; border: 1px black solid;">
			<table>
					%right_Button1%
					%right_Button2%
					%right_Button3%
				</tr>
				
				<tr>					
					%right_Button4%
					%right_Button5%
					%right_Button6%
				</tr>					
				
				<tr>
					%right_Button7%
					<td title="Date and Initials&#10;------------------&#10;Click: Stack&#10;Ctrl + Click: Surround" style="height: 100`%; width:150px; text-align:center; border:0px solid black; padding: 0px;">
					
					<button style="height:50px; width:100px; color:%HoverColor%; background-color:%CustomColor%; cursor:crosshair;" id="ahkBut17" value1="0" 
					onclick="this.value2 = '1';"
					onfocusout="this.value1 = '0'; this.style.backgroundColor='%CustomColor%'; this.style.color='%HoverColor%'; this.value = 'Date & Initials';" 
					onfocusin="this.value1 = '1';"
					
					onMouseOut="this.value1 = '0'; this.style.backgroundColor='%CustomColor%'; this.style.color='%HoverColor%'; this.value = 'Date & Initials';" 
					onMouseOver="this.value1 = '1';">Date & Initials</button>
					</td>								
					
					%right_Button9%
				</tr>
				
				<tr>
					%right_Button10%
					%right_Button11%
					%right_Button12%
				</tr>
			</table>
		</div>
	</td>		
	</tr>
	</table>
	)	
	}
else
	{
	rightsection = 
	(
	<td colspan="3" rowspan="4" style="width: 100`%; padding:2px; ">
		<div  style="height:165px; width:100`%; border: 0px black solid;">

		</div>
	</td>		
	</tr>
	</table>
	)	
}


	; <button id="annuityTips" style="height: 21px; width: 125px;" value1="0" onclick="this.value1 = 1;">Calculate Annuities</button>
	;	myWindow.document.write('<p>This is 'MsgWindow'. I am 200px wide and 100px tall!</p>');}"

	; onclick="var myWindow = window.open('C:\Users\Tyler.Dickson\DocketModsIndex.html', 'MsgWindow', 'toolbar=no,scrollbars=no,resizable=no,top=500,left=500,width=200,height=100');  
	; myWindow.document.write('<button>test</button>');
	

if Instr(Computername, "cher") || Instr(Computername, "tyler")
	{
	annuityTips = 
		(
		&nbsp;
		<button id="annuityTips" style="height: 21px; width: 125px;" value1="0" onclick="this.value1 = 1;">Calculate Annuities</button>
		)
	} 
else
	annuityTips = 
	
if (DefaultAllActions == 1)
	ie.document.getElementById("optAll").Click()

return

CloseActionButtons:
actionIframes = 
ie := WBGet()
location := ie.LocationURL

if InStr(location, "Action")
	{
	WhereWeAt := "InsideAction"
	NumberOfInputs  := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR").length
	}
else
	{
	WhereWeAt := "MainScreen"	
	NumberOfInputs  := ie.document.getElementById("dgdAction").getElementsByTagName("TBODY")[0].getElementsByTagName("TR").length
	}

Loop %NumberOfInputs%
	{
	if WhereWeAt = InsideAction
		{
		temppos  := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index-1].getElementsByTagName("INPUT")[0]
		position := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index-1].getElementsByTagName("INPUT")[1]
		}
	else
		{
		temppos  := ie.document.getElementById("dgdAction").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index-1].getElementsByTagName("INPUT")[0]
		position := ie.document.getElementById("dgdAction").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index-1].getElementsByTagName("INPUT")[1]
		}
	temptemp := temppos.OuterHTML
	
	isVisible := ie.document.getElementById("dgdAction").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index-1].style.display

	if isVisible = none
		{
		}
	else	
		{
		middleSection := SubStr(temptemp, 38, 8)
		StringReplace, middleSection, middleSection, ),  , A

		if InStr(location, "patfrmCountryApplicationAgent")	|| InStr(location, "patfrmActionDueAgent")	
			NewSource := "http://oc-docketing/CPiAgent/patfrmActDateTakenAgent.aspx?key=" . middleSection
		else if InStr(location, "patfrmCountryApplication") ||  InStr(location, "patfrmActionDue")
			NewSource := "http://oc-docketing/CPi/patfrmActDateTaken.aspx?key=" . middleSection
		else if InStr(location, "tmkfrmTrademarkAgent")	|| InStr(location, "tmkfrmActionDueAgent")	
			NewSource := "http://oc-docketing/CPiAgent/tmkfrmActDateTakenAgent.aspx?key=" . middleSection
		else if InStr(location, "tmkfrmTrademark") || InStr(location, "tmkfrmActionDue")	
			NewSource := "http://oc-docketing/CPi/tmkfrmActDateTaken.aspx?key=" . middleSection
			

			actionIframes = 
			(
			<button title="Quick Close" id="%middleSection%" value1="%middleSection%" style="border: 1px solid black; cursor: pointer; font: 12px; font-weight: bold; background-color: beige; width: 20px; height: 20px; visibility: hidden;"  
			onclick="document.parentWindow.frames('closeAction%A_Index%').document.getElementById('flddteDateTaken').value = '%QuickCloseDate%'; 
			var tempRemarks = document.parentWindow.frames('closeAction%A_Index%').document.getElementById('fldstrRemarks').value; 
			document.parentWindow.frames('closeAction%A_Index%').document.getElementById('fldstrRemarks').value = '%NewRemarks%\r\n' + tempRemarks; 
			document.parentWindow.frames('closeAction%A_Index%').document.getElementById('btnSave').click(); 
			this.value = 'OK';
			
			try {
				document.getElementById('dgdAction').getElementsByTagName('TBODY')[0].getElementsByTagName('TR')[%A_Index% - 1].style.backgroundColor = 'lightgreen'; 
			} catch (ex) {
				document.getElementById('dgdDueDate').getElementsByTagName('TBODY')[0].getElementsByTagName('TR')[%A_Index% - 1].style.backgroundColor = 'lightgreen'; 
				document.getElementById('fldstrActionType_TextBox').value = 'I CLOSED SOME ACTIONS. REFRESH PAGE TO SEE.';
				document.getElementById('fldstrActionType_TextBox').style.backgroundColor = 'lightgreen';
				document.getElementById('fldstrActionType_TextBox').style.fontWeight = 'bold';
			}
			
			this.style.color = 'green';">✔️</button>
			)
			<iframe id="closeAction%A_Index%" value1="0" width="0" height="0" src="%NewSource%" onload="document.getElementById('%middleSection%').style.visibility = 'visible';"></iframe>
		
		}
		if WhereWeAt = InsideAction
			position.insertAdjacentHTML("afterend", "&nbsp;" . actionIframes)
		else
			temppos.insertAdjacentHTML("afterend", "&nbsp;" . actionIframes)	
		}
return


; "afterend","<div style='overflow: auto; width: 49%; height: 200px; display: inline;'> <button style='width: 100%; height: 100%'>test</button></div>"

global TempTempHTML

F11::

TempTempHTML := ie.document.getElementById("dgdDueDate").outerHTML

EmailBodyContents := TempTempHTML
olMailItem := 0
o:= ComObjActive("Outlook.Application").Session()
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
MailItem.SentOnBehalfOfName := SendOnBehalfOf
MailItem.BodyFormat := olFormatHTML

if ClientCode = 
	ClientCode := ClientCode2

EmailSubject := ClientCode
MailItem.Subject := EmailSubject 	;change to whatever your subject is.

MailItem.HTMLBody := EmailBodyContents

MailItem.Bcc := "INTFEES.Mailbox"

MailItem.Display 						; Make email visible


return



;	<button id="remarksDateClosed" style="height: 26px; width: 100px;" 
;	onclick="document.getElementById('btnEdit').click(); document.getElementById('remarksSave').disabled = false; document.getElementById('remarksUndo').disabled = false; var tempRemarks = document.getElementById('fldstrRemarks').value; document.getElementById('fldstrRemarks').value = '\r\n' + tempRemarks; document.getElementById('fldstrRemarks').focus(); "
;	>Date Closed</button>
;	&nbsp;
	

GetRemarksBar:
remarksBar = 
(

<div id="blahblahblah" value1="0" style="border: 1px solid black; position: relative; overflow: hidden; width: 100`%; height: 30px; vertical-align: middle; text-align: left; display: inline; background-color: lightgray; border: 1px solid black;">
	<div style="position: absolute;">
	&nbsp;
	<button id="remarksEdit" style="height: 26px; width: 60px;" 
	onclick="document.getElementById('btnEdit').click(); this.disabled = true; document.getElementById('remarksSave').disabled = false; document.getElementById('remarksUndo').disabled = false; var tempRemarks = document.getElementById('fldstrRemarks').value; document.getElementById('fldstrRemarks').value = '\r\n' + tempRemarks; document.getElementById('fldstrRemarks').focus(); "
	>Edit</button>
	&nbsp;
	<button id="remarksSave" disabled style="height: 26px; width: 60px;" 
	onclick="document.getElementById('btnSave').click();"
	>Save</button>
	&nbsp;
	<button id="remarksUndo" disabled style="height: 26px; width: 60px;" 
	onclick="document.getElementById('btnUndo').click(); document.getElementById('remarksEdit').disabled = false; this.disabled = true; document.getElementById('remarksSave').disabled = true; document.getElementById('fldstrActionType_TextBox').focus();"
	>Undo</button>
	&nbsp;
	
	
	
	</div>
</div>

<div id="commentDiv" value1=0 style="border: 1px solid black; position: relative; top: -1px; overflow: hidden; width: 100`%; height: 100`%; display: inline;">		
)	
return

;	<input disabled type="text" style="height: 26px; text-align: center; width: 225px;" value="Seems good now? Maybe I fixed it?">
;	&nbsp;
;	<button id="fixNewRemarks" value1="0" onclick="value1 = 1;">Messed up? Click to fix, or reload the page.</button>

ExpandActionHeight:
Counter = 0
ALLDIVS := ie.document.getElementsByTagName("DIV").length

Loop % ALLDIVS
	{
	tempDIV := ie.document.getElementsByTagName("DIV")[A_Index - 1].innerText " | " A_Index - 1
	if InStr(tempDIV, "Due Date") || InStr(tempDIV, "Final") || InStr(tempDIV, "Reminder")
		Counter++

	if Counter = 2
		{
		ie.document.getElementsByTagName("DIV")[A_Index - 1].style.height := "272px"
		break
		}
	}
return

DoFancyRemarks:
ief := WBGet()
if (ief.document.getElementById("blahblahblah").value1 != "0")
	{
;while ie.busy or ie.ReadyState != 4 						;Wait for page to load
;	Sleep, 100

	;ie.document.getElementById("fldstrRemarks").style.height := "200px"
	;ie.document.getElementById("fldstrRemarks").style.border := "1px solid black"
	;ie.document.getElementById("fldstrRemarks").style.top := "0px"
	 grabbedRemarks := ief.document.getElementById("fldstrRemarks").outerHTML
	grabbedWords := ief.document.getElementById("fldstrRemarks").value 	
	ief.document.getElementById("fldstrRemarks").id := "fldstrRemarksOLD"
	ief.document.getElementById("fldstrRemarksOLD").name := ""
	;ie.document.getElementById("fldstrRemarksOLD").value := ""
	;ie.document.getElementById("fldstrRemarksOLD").disabled := "true"
;	ie.document.getElementById("fldstrRemarksOLD").style.width := "25px"
	;ie.document.getElementById("fldstrRemarks").style.width := "0px"


	if (WhereRemarks == "Left")
		{
		ief.document.getElementById("mpgMain").getElementsByTagName("DIV")[0].style.display := "inline" ; 
		ief.document.getElementById("mpgMain").getElementsByTagName("DIV")[0].style.width := "62.4%" ; 59.8%
	;	ie.document.getElementById("mpgMain").style.height := "100%"
	;	ie.document.getElementById("mpgMain").getElementsByTagName("DIV")[0].style.height := "100%"
		ief.document.getElementById("mpgMain").getElementsByTagName("DIV")[0].style.height := "200px"
		
	;	grabbedRemarks =
	;	(
	;	<textarea name="fldstrRemarks" id="fldstrRemarks" readonly style="height: 200px; width: 100`%;">%grabbedWords%</textarea>
;
;		)
		
		if (ief.document.getElementById("blahblahblah").value1 != "0" && (InStr(location, "tmkfrmActionDue") || InStr(location, "patfrmActionDue")))
			ief.document.getElementById("mpgMain").getElementsByTagName("DIV")[0].insertAdjacentHtml("beforebegin","<div id='blahblahblah' value1=0 style='border: 1px solid black; position: relative; top: -1px; overflow: hidden; width: 37.1%; vertical-align: top; display: inline;'>" grabbedRemarks "</div>") ; <div id='commentDiv' value1=0 style='border: 1px solid black; position: relative; top: -1px; overflow: hidden; width: 3%; vertical-align: top; display: inline;'>
		}
	else if (WhereRemarks == "Bottom")
		{
		ief.document.getElementById("mpgMain").getElementsByTagName("DIV")[0].style.display := "inline" ; 
		ief.document.getElementById("mpgMain").getElementsByTagName("DIV")[0].style.height := "100%"
		ief.document.getElementById("mpgMain").style.height := "100%"
	;	ie.document.getElementById("fldstrRemarks").style.height := "150px"		


		;<div id="blahblahblah" value1=0 style="border: 1px solid black; position: relative; top: 0px; overflow: hidden; width: 100%; height: 20px; text-align: center; vertical-align: top; display: inline; background-color: lightgray; border: 1px solid black;"><center><b>REMARKS<b><button style="height: 15px; font-size: 10px; text-align: center; vertical-align: center;">test</button></center></div><div id="commentDiv" value1=0 style="border: 1px solid black; position: relative; top: -1px; overflow: hidden; width: 100%; height: 100%; display: inline;">		

		;	grabbedWords := ie.document.getElementById("fldstrRemarks").value 		


	;	grabbedRemarks =
	;	(
	;	<textarea name="fldstrRemarks" id="fldstrRemarks" readonly style="height: 150px; width: 100`%;">%grabbedWords%</textarea>
;
;		)

		gosub GetRemarksBar		

		if (ief.document.getElementById("blahblahblah").value1 != "0" && (InStr(location, "tmkfrmActionDue") || InStr(location, "patfrmActionDue")))
			ief.document.getElementById("mpgMain").getElementsByTagName("DIV")[0].insertAdjacentHtml("afterend",remarksBar . grabbedRemarks "</div>")
		
		; ie.document.getElementById("mpgMain").getElementsByTagName("DIV")[0].insertAdjacentHtml("afterend",remarksBar . "<input type='textarea' value='" grabbedWords "' style='width: 100%; height: 200px;' name='fldstrRemarks'></div>")


		ief.document.getElementById("fldstrRemarks").style.height := "150px"				
		;ie.document.getElementById("fldstrRemarks").style.width := "100%"				

		}
		ief.document.getElementById("fldstrRemarksOLD").style.width := "0px"
	}
else	
	{

	}


return

UpdateCycle:
ie := WBGet()

;if (FancyRemarks && WhereRemarks == "Bottom")
;	{
;	if (ie.document.getElementById("fldstrRemarks").style.height != "150px")
;		ie.document.getElementById("fldstrRemarks").style.height := "150px"
;	
;	}

location := ie.LocationURL
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
ClientCode2 := ie.document.getElementByID("fldstrCaseNumber").Value
; ifinstring, location, docketing

	if instr(location, "oc-docketing") ; ###2
		{
		ifinstring, location, tmkfrmTrademark.aspx
			{
			ie.document.getElementById("tblTrademarkDetail").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[0].style.display := "none"
			newPosition := ie.document.getElementById("tblTrademarkDetail").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[2].getElementsByTagName("TD")[0]
			ie.document.getElementById("lblCaseNumber").style.display := "none"		
			checktmClientCode := ie.document.getElementById("tmClientCode").value1
			if checktmClientCode =
				newPosition.insertAdjacentHTML("afterbegin", "<span value1='0' id='tmClientCode' style='color: 990000; font-weight: bold;'>Client Code:</span>")			
			}
		else ifinstring, location, tmkfrmTrademarkAgent.aspx
			{
			ie.document.getElementById("tblTrademarkDetail").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[0].style.display := "none"
			}
		}
		
	if ChangeColors = 1 ; ###3
		{
		ifinstring, location, docketing
			{
			ie.document.getElementById("mpgMain").style.backgroundColor := CustomColor
			ifnotinstring, location, Agent
				{
				ie.document.getElementsByTagName("body")[0].style.backgroundColor := CustomColor
				ie.document.GetElementsByTagName("TABLE")[8].className := clsInfoBoxWarning
				;ie.document.getElementById("mpgMain").style.backgroundColor := CustomColor
				}
			else
				{
				;ie.document.getElementById("mpgMain").style.backgroundColor := CustomColor
				 ie.document.GetElementsByTagName("TABLE")[7].className := clsInfoBoxWarning
				}

			ie.document.getElementById("tspMain").tabHoverStyle := "background:white;color:" CustomColor ";cursor:crosshair"
			ie.document.getElementById("tspMain").tabSelectedStyle := "background:" CustomColor ";color:black;cursor:crosshair"
			}
		}

	if BottomButtons = 1  ; ###1        ; Figure out how to inject JQUERY?
		{
		ie := WBGet()
		location := ie.LocationURL
		TempID := ie.document.getElementById("noteArea").value1		
	
		if TempID = 
			{
			DocketModsAnchorEnd2 := ie.document.getElementById("_tblRecordSelector_")
			gosub CreateButtons
			DocketModsAnchorEnd2.insertAdjacentHTML("afterend",notesection . midsection . rightsection)		; midsection2

			; DocketModsAnchorEnd2.style.width := "100`%"
			
			;ie.document.getElementById("_tblRecordSelector_").insertAdjacentHTML("beforeend","<td><button>test</button></td>")

			if (InStr(location, "CountryApplication") || InStr(location, "tmkfrmTrademark"))
				gosub ExpandActionHeight
		
			checknewActionBar := ie.document.getElementById("findATaction").value1
			checkTopBar := ie.document.getElementById("topBar").value1		
					
				if checknewActionBar  = 
					{
					if (InStr(location, "tmkfrmActionDue") || InStr(location, "patfrmActionDue"))
						{

						ie.document.getElementById("mpgMain").insertAdjacentHTML("afterend", newActions) ; Above Action Type in actions
						;ie.document.getElementById("mpgMain").style.display := "hidden"
						if (FancyRemarks)
							SetTimer, DoFancyRemarks, -500
						}
					}

				if checkTopBar  = 
					{
					CheckPage := ie.document.getElementsByTagName("H1")[0].innerText
		
						if CheckPage != 
							{
							}
						else if instr(location, "Print")
							{
							}					
						else if instr(location, "docketing")
							{
							if (ChangedTopBar)
							{
							ie.document.getElementsByTagName("img")[0].insertAdjacentHTML("beforebegin", topBar) ; Above Action Type in actions
							ie.document.getElementById("tblMenuBar").style.display := "none"
							ie.document.getElementById("tblMenuPatent").style.display := "none"
							ie.document.getElementById("tblMenuTrademark").style.display := "none"
							ie.document.getElementById("tblSubMenuPatent___Search").style.display := "none"
							ie.document.getElementById("tblSubMenuPatent___Reports").style.display := "none"
							ie.document.getElementById("tblSubMenuTrademark___Search").style.display := "none"
							ie.document.getElementById("tblSubMenuTrademark___Reports").style.display := "none"				
							ie.document.getElementById("tblMenuBar").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[0].getElementsByTagName("TD")[0].getElementsByTagName("IMG")[0].height := 0
							numimg := ie.document.getElementsByTagName("IMG").length
							
							Loop % numimg
								{
								tempimg := ie.document.getElementsByTagName("IMG")[A_Index-1].src

								if (tempimg == "http://oc-docketing/CPi/images/spacer_10.gif") || (tempimg == "http://oc-docketing/CPiAgent/images/spacer_10.gif")
									{
									ie.document.getElementsByTagName("IMG")[A_Index-1].height := 0
									break
									}
								}
							}
						}	
					; gosub CheckDocketTips     ### need to add this somewhere else

					if ShowCloseActionButtons = 1
						{
						gosub CloseActionButtons

						}
					
					}

				; if (ie.document.getElementById("fldstrCountry_TextBox").value  == "EP") && (ie.document.getElementById("fldstrCaseType_TextBox").value == "DIV") && (ie.document.getElementById("annuityTips").value1 == "")
				if (ie.document.getElementById("fldstrCountry_TextBox").value  == "EP") && (ie.document.getElementById("annuityTips").value1 == "")
					ie.document.getElementById("flddteParentPCTDate").insertAdjacentHTML("afterend", annuityTips)	
			
				if (ie.document.getElementById("fldstrCaseType_TextBox").value == "OPP") && InStr(location, "tmkfrm")
					ie.document.getElementById("lblApplicant").innerText := "Opposed Party"
					
				
					
	if (ie.document.getElementById("fldstrCountry_TextBox").value == "WO") && (ie.document.getElementById("fldstrPubNumber").value != "") && (ie.document.getElementById("temptemp").value1 == "")
		{
		temptemp = 
		(
		&nbsp;
		<button id="temptemp" title="temptemp!" style="height: 21px; width: 88px;" value1="0" onclick="">temptemp</button>
		)
		
		eventTest = 
		(
		
		{alert();}
		)

	;	document.getElementById("fldstrAppTitle").addEventListener("click", function() {alert();}, false)
		
		ie.document.getElementById("flddtePubDate").insertAdjacentHTML("afterend", temptemp)
		
		; ie.document.getElementById("fldstrAppTitle").addEventListener("click", "alert();", false)
		
		;ie.document.getElementById("fldstrAppTitle").onclick := "document.getElementById('fldstrAppTitle').style.color = red;"

		}
		}
	
	
		
			
		;	tempcloseaction := ie.document.getElementById("actionIframes").value1
		;	if tempcloseaction = 
		;		ie.document.getElementById("btn_edtDueDate").insertAdjacentHTML("beforebegin", actionIframes . "&nbsp;")
			
			

			
			
			
			ahkRestartValue := ie.document.getElementById("ahkRestart").value1
			CheckNoteInput := ie.document.getElementById("noteArea").value1	
			SupeResponseValue := ie.document.getElementById("supeResponse").value1	
			exceptionListCheck := ie.document.getElementById("exceptionList").value1	
			checkcloseActionButs :=	ie.document.getElementById("closeActionButs").value1
			checkfindATaction := ie.document.getElementById("findATaction").value1
			checkSetDocketModsDate := ie.document.getElementById("setDocketModsDate").value1
			checkCopyActionToAT := ie.document.getElementById("copyActionToAT").value1
			checkCIDButton := ie.document.getElementById("cidButton").value1
			checkAnnuityTips := ie.document.getElementById("annuityTips").value1
			checktestInject := ie.document.getElementById("testInject").value1
			
			checkABAStatus := ie.document.getElementById("ABAStatus").value1
			checkABADocketAction := ie.document.getElementById("ABADocketAction").value1
			checkABACloseAction := ie.document.getElementById("ABACloseAction").value1
			checkABACloseDisclosure := ie.document.getElementById("ABACloseDisclosure").value1
			checkABAUpdateStatus := ie.document.getElementById("ABAUpdateStatus").value1
			checkABAClientInstr := ie.document.getElementById("ABAClientInstr").value1
			checkABARespAtty := ie.document.getElementById("ABARespAtty").value1
			checkfixNewRemarks := ie.document.getElementById("fixNewRemarks").value1

			AHKButStatus := []
			
		Loop 23
			{
			Temp := "ahkBut" . A_Index
			AHKButStatus.push(ie.document.getElementById(Temp).value1)
			}
		
		if checkfixNewRemarks = 1
			{
			checkfixNewRemarks := ie.document.getElementById("fixNewRemarks").value1 := 0
			ie := WBGet()
			grabbedWords := ie.document.getElementById("fldstrRemarksOLD").value 	
			ie.document.getElementById("fldstrRemarksOLD").name := ""
			Sleep 500
			ie.document.getElementById("fldstrRemarks").value := grabbedWords
			}
		else if checkABAStatus = 1
			{
			ie.document.getElementById("ABAStatus").value1 := 0
			ABAStatus := ie.document.getElementById("ABAStatus").value
			}
		else if checkABARespAtty = 1
			{
			ie.document.getElementById("ABARespAtty").value1 := 0
			RespAtty := ie.document.getElementById("ABARespAtty").value
			ie.document.getElementById("ABARespAtty").style.backgroundColor := "lightgreen"
			Sleep 200
			IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
			}
		else if checkABAUpdateStatus = 1
			{
			ie.document.getElementById("ABAUpdateStatus").value1 := 0
			gosub UpdateStatus
			}
		else if checkABAClientInstr = 1
			{
			ie.document.getElementById("ABAClientInstr").value1 := 0
			gosub DocketABAAction
			}
			
		else if checkABADocketAction = 1
			{
			ie.document.getElementById("ABADocketAction").value1 := 0
			gosub DocketAction
			}			
		else if checkABACloseAction = 1
			{
			ie.document.getElementById("ABACloseAction").value1 := 0
			gosub CloseAction
			}	
		else if checkABACloseDisclosure = 1
			{
			ie.document.getElementById("ABACloseDisclosure").value1 := 0
			gosub CloseDisclosureAuto
			}				
		else if CheckNoteInput = 1
			{
			ie.document.getElementById("noteArea").value1 := 0
			ie.document.getElementById("noteEdit").style.backgroundColor := "lightgreen"
			ie.document.getElementById("noteEdit").value := "Saved"
			NoteInput := ie.document.getElementById("noteArea").value
			StringReplace, NoteInput, NoteInput, `r`n, <br>, A
			IniWrite, %NoteInput%, C:\Users\%Computername%\DocketMods.ini, Notes, SavedNotes
			RespAtty := ie.document.getElementById("respAtty").value
			IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
			SetTimer, changeButtonColor, -2000
			}
		else if checktestInject = 1
			{
			ie.document.getElementById("testInject").value1 := 0
			gosub InjectActionDue
			}
		else if checkCopyActionToAT = 1
			{
			ie.document.getElementById("copyActionToAT").value1 := 0
			location := ie.LocationURL
			
			if instr(location, "ActionDue")
				gosub CopyActionToAT
			else
				{
				ie.document.getElementById("copyActionToAT").value := "You aren't on<br>an action!"
				ie.document.getElementById("copyActionToAT").style.backgroundColor := "red"				
				ie.document.getElementById("copyActionToAT").style.color := "black"				
				}
			}
		else if	checkCIDButton = 1
			{
			ie.document.getElementById("cidButton").value1 := 0
			
			global ClientCodeNew
			global ClientCodeNew2
			ClientCodeNew := ie.document.getElementById("fldstrCaseNumber").value
			ClientCodeNew2 := ie.document.getElementById("fldstrCaseNumber_TextBox").value
			
			if ClientCodeNew = 
				ClientCodeNew := ClientCodeNew2
			
			if ClientCode2 != 
				ClientCode := ClientCode2

			ClientPart := StrSplit(ClientCode, ".")
			oldlocation := ie.LocationURL
			Run, % "http://kmobnetold/outsidekmobnet/cid/cidold/ClientList.aspx"
			Sleep 1500
			ie := WBGet()
			while ie.busy or ie.ReadyState != 4 						;Wait for page to load
				Sleep, 100
			
			ie.document.getElementById("uwTB_Item_3").Focus() 
			Sleep 500
			SendInput, % ClientPart[1]
			Sleep 500
			gosub CIDEnter
			}
		else if checkfindATaction = 1
			{
			ie.document.getElementById("findATaction").value1 := 0
			butATstatus := ie.document.getElementById("findATaction").value
			
			if butATstatus = Click to find AT action.
				{
				ie.document.getElementById("findATaction").value := "Searching AT actions..."
				ie.document.getElementById("findATaction").disabled := true
				gosub SearchForATAction		
				}
			else if butATstatus = Match found! Click to open.
				{
				if CherToggle = 1
					Run iexplore.exe  %NewNewURL% 
				else
					Run %NewNewURL%
				}
			}
		else if exceptionListCheck = 1
			{
			ie.document.getElementById("exceptionList").value1 := 0
		;	if ClientCode2 != 
		;		ClientCode := ClientCode2
		;	ClientPart := StrSplit(ClientCode, ".")
		;	CleanedClient := RegExReplace(ClientPart[1], "[0-9]")
		;	oldlocation := ie.LocationURL
			Run, C:\Users\%ComputerName%\DocketModsIndex.html
		;	Sleep 1500
		;	ie := WBGet()
		;	NumTRs := ie.document.getElementsByTagName("TR").length
		;	Loop %NumTRs%
		;		{	
		;		Temp := ie.document.getElementsByTagName("TR")[A_Index - 1]
		;		FirstTD := Temp.getElementsByTagName("TD")[0].innerText
		;		if instr(FirstTD, CleanedClient)
		;			{
		;			Temp.style.backgroundColor := "yellow"
		;			Temp.scrollIntoView(false)
		;			SendInput, {Down 4}
		;			return
		;			}
		;		}
		;		ie.document.getElementsByTagName("I")[0].innerText := "[I didn't find it... Try searching manually.]"
		;		ie.document.getElementsByTagName("I")[0].style.backgroundColor := "red"
			}
		else if checkSetDocketModsDate = 1
			{
			ie.document.getElementById("setDocketModsDate").value1 := 0
			RespAtty := ie.document.getElementById("respAtty").value
			IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
			gosub SetDocketModsDate
			}		
		else if SupeResponseValue = 1
			{
			SupeResponseValue := ie.document.getElementById("supeResponse").value1	:= 0
			if QuickCloseDate =
				{
				gosub SetDocketModsDate
				return
				}
			else
				{
				IniRead, RespAtty, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
				ie.document.getElementById("supeResponse").value1 := 0
				tempRemarks := ie.document.getElementById("fldstrRemarks").value
				ie.document.getElementById("flddteResponseDate").value := QuickCloseDate
				ie.document.getElementById("btnEdit").Click()
				RespAtty := ie.document.getElementById("respAtty").value
				if instr(QuickCloseRemarks, "Date closed")
					QuickCloseRemarks := "Date closed per " RespAtty "."
				ie.document.getElementById("fldstrRemarks").value := ATDate . " " . QuickCloseRemarks . " " Username "`r`n" . tempRemarks
				IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
				}
			}
		else if checkcloseActionButs = 1
			{
			ie.document.getElementById("closeActionButs").value1 := 0
			if QuickCloseDate =
				{
				gosub SetDocketModsDate
				return
				}
			else 
				{
				ie.document.getElementById("closeActionButs").value1 := 0
				ShowCloseActionButtons := !ShowCloseActionButtons
				
				ie := WBGet()
				var := ie.LocationURL
				INPUTS 		:= ie.document.GetElementsBytagname("INPUT").length
				Loop %INPUTS%
					{
					Temp := ie.document.GetElementsBytagname("INPUT")[A_Index-1].OuterHTML
					ifInString, Temp, ActDueDate
						break
					}
				StringSplit, Temp, Temp, `'
				StringSplit, ActionKey, Temp2, =
				
				IfInString, var, -1
					StringReplace, location, var, -1, %ActionKey2%	
			
				ie.Navigate(location)
				}
			}
		else if ahkRestartValue = 1	
			{
			ie.document.getElementById("ahkRestart").value1 := 0
			TrayTip, Restarting DocketMods, Restarting DocketMods in two seconds.
			Sleep 2000
			Reload
			}
			
		else if	checkAnnuityTips = 1
			{
			ie.document.getElementById("annuityTips").value1 := 0
			gosub CalculateEPDivAnnuities
			}
		else if AHKButStatus[1] = 1
			{
			ie.document.getElementById("ahkBut1").value1 := 0
			SwitchSystem()
			}	
		else if AHKButStatus[2] = 1
			{
			ie.document.getElementById("ahkBut2").value1 := 0
			temp := ie.document.getElementById.getBoundingClientRect()
			Gui +LastFound +OwnDialogs +AlwaysOnTop
			WinGetPos, mX, mY, mW, mH, A
			InputBox, ButtonSize, How big should the buttons be?, 50 = Small`, 70 = Default`, 100 = Big`, 120 = Real Big`n        220 is probably as big as you should go., , 324, 145, mX + mW/2 - 162, mH / 4 , , , %ButtonSize%
			}	
		else if AHKButStatus[3] = 1
			{
			ie.document.getElementById("ahkBut3").value1 := 0
			ie.document.getElementById("fldstrClient_TextBox").value := "HANBEV"
			ie.document.getElementById("fldstrOwner_TextBox").value := "HANBEV"
			ie.document.getElementById("fldstrApplicant").value := "Monster Energy Company"
			ie.document.getElementById("fldstrTrademarkStatus_TextBox").value := "Instructed"
			ie.document.getElementById("btnEdit").Click()
			}
		else if AHKButStatus[4] = 1
			{
			ie.document.getElementById("ahkBut4").value1 := 0
			TrayTip, Running PCT 220 Date Generator, It should open in a second.
			Run, % "\\docs-oc\files\Docketing\AutoHotKey\Scripts\PCT 220 Date Generator.ahk"
			}
		else if AHKButStatus[5] = 1
			{
			ie.document.getElementById("ahkBut5").value1 := 0
			
IntFeesException =
(
CLIENT Specific Exception Details

EXPERIAN 
- EXP, EXPTM, EXP2 - The Intfees team is able to provide annuity provider costs, estimates and other details as requested. The request should be completed as soon as possible each time.

ICU MEDICAL, INC.
- ICUH, ICUMM - No letters to be prepared per AIK

GENDX 
- Owner is GenomeDx/Deciper Biosciences; some matters licensed to Veracyte with ,Wilson Sonsini Goodrich & Rosati (WSGR) handling the annuity fees instead of Black Hills

NKT	
- Do not respond to annuity notices before checking with the attys

SBUX1
- CPA pays all annuity fees even during validation for all EP matters

MLEAP 
- Israel: Default to instructing the payment of the accumulated annuity fees due always.

UCAP
- Notify MLF when detail to be reported for annuity purposes, i.e, FR,PUBLICATION,GRANT
)

MsgBox, 0 , IntFees Exception List, % IntFeesException	
			
			;it's currently doc # 19795794
			
			
			
			
			
			
			
			}
		; But6 is used for Open CID for now.
			else if AHKButStatus[7] = 1
				{
				ie.document.getElementById("ahkBut7").value1 := 0 

				EmailBodyContents := ""
				olMailItem := 0
				o:= ComObjActive("Outlook.Application").Session()
				MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
				MailItem.SentOnBehalfOfName := SendOnBehalfOf
				MailItem.BodyFormat := olFormatHTML
				
				if ClientCode = 
					ClientCode := ClientCode2
				
				
				EmailSubject := ClientCode
				MailItem.Subject := EmailSubject ;change to whatever your subject is.
				OldClipboard := ClipboardAll
				GetKeyState, IsCtrlDown, Ctrl , P

				if IsCtrlDown = D
					{
					WorkingAtty := ""
					AttyClipboard := ""
					AttorneyArray := []
					NewClipboard := ie.document.getElementByID("fldstrAttorneys").innerText
					AttorneyArray := StrSplit(NewClipboard, ",")
					
					Loop % AttorneyArray.Length()
						AttorneyArray[A_Index] := Trim(AttorneyArray[A_Index])

					Loop % AttorneyArray.Length()
						{
						QuickTemp := AttorneyArray[A_Index]
						if instr(AttorneyArray[A_Index], "Working")
							StringMid, WorkingAtty, QuickTemp, 1, 3
						}
						
					Loop % AttorneyArray.Length()
						{
						if instr(AttorneyArray[A_Index], "IPP")
							continue
					;	else if instr(AttorneyArray[A_Index], "CLSP")
				;			continue	
						else if instr(AttorneyArray[A_Index], "USPS")
							continue
						else if instr(AttorneyArray[A_Index], "FPA")
							continue
						else
							{
							Temp := Trim(AttorneyArray[A_Index])
							StringMid, Temp, Temp, 1, 3
							
							IniRead, NewTemp, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini,  Attorneys, % Temp
							if NewTemp = ERROR   
								Temp := "2" . Temp
							else
								Temp := NewTemp
							
							if instr(Temp, WorkingAtty)
								{
								MailItem.To := Temp
								}
							else if AttyClipboard = 
								AttyClipboard := Temp
							else
								{
								if instr(AttyClipboard, Temp)
									continue
								else
									AttyClipboard := AttyClipboard . "; " . Temp 									
								}
							}
						}
						MailItem.Cc := AttyClipboard
						MailItem.Bcc := "INTFEES.Mailbox"
					}
				else if (InStr(location, "action")) || (InStr(location, "Trademark")) || (InStr(location, "Invention")) 
					{
					if instr(location, "tmkfrmTrademark") || instr(location, "patfrmInvention") || instr(location, "tmkfrmActionDue")
						AttyEmailFinder(ie.document.getElementByID("attyTM").value)
					else
						AttyEmailFinder(ie.document.getElementByID("fldstrAttorneys").innerText)

					MailItem.Cc := Clipboard
					Clipboard := OldClipboard
					}
					
				ABAStatus 	 := ie.document.getElementById("ABAStatus").value

				if (ABAStatus == "Reactivate")
					MailItem.Cc := MailItem.Cc . "; KBI.Intake; KBIAccountingFinalReview"

					
				MailItem.Display ; Make email visible
				}
				else if AHKButStatus[17] = 1
				{
				IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
				IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
				;ie.document.getElementById("ahkBut17").value1 := 0
				
				KeyIsDown := GetKeyState("Control")
				newtemp :=	ie.document.getElementById("ahkBut17").value2
				temp := ie.document.getElementById("fldstrRemarks").value			
				if KeyIsDown = 0
					{
					ie.document.getElementById("ahkBut17").style.backgroundColor := "%HoverColor%"
					ie.document.getElementById("ahkBut17").style.color := "%CustomColor%"
					ie.document.getElementById("ahkBut17").value := "Date & Initials<br>(Stacked)"
					
					if newtemp = 1
						{
						ie.document.getElementById("ahkBut17").value2 := 0
						ie.document.getElementById("fldstrRemarks").value := ATDate . " " . Username . "`n" . temp
						Sleep 100
						ie.document.getElementById("btnSave").Click()
						}
					}
				else
					{
					ie.document.getElementById("ahkBut17").style.backgroundColor := "green"				
					ie.document.getElementById("ahkBut17").style.color := "%CustomColor%"
					ie.document.getElementById("ahkBut17").value := "Date & Initials<br>(Surround)"

					if newtemp = 1
						{
						ie.document.getElementById("ahkBut17").value2 := 0	
						
						IfInString, temp, * -
							{
							StringReplace, temp, temp, % "* -",, 
							ie.document.getElementById("fldstrRemarks").value := ATDate . temp . " " . Username		
							}
						else
							ie.document.getElementById("fldstrRemarks").value := ATDate . " " . temp . " " . Username			
						Sleep 100
						ie.document.getElementById("btnSave").Click()
						}
					}
				
			;	this.value2 = '1'; if (event.ctrlKey) {this.style.backgroundColor='green'; this.value = 'Date &amp; Initials<BR>(Surround)'; } else {this.style.backgroundColor='%HoverColor%'; this.value = 'Date & Initials<br>(Stack)';}; this.style.color='%CustomColor%';
				
				}
				else if AHKButStatus[18] = 1
					{
					ie.document.getElementById("ahkBut18").value1 := 0 
					OutgoingOppActions()
					}
				
					ie.document.getElementById("btnEdit").width 	:= ButtonSize
					ie.document.getElementById("btnSave").width 	:= ButtonSize
					ie.document.getElementById("btnUndo").width 	:= ButtonSize
					ie.document.getElementById("btnNew").width 		:= ButtonSize
					ie.document.getElementById("btnCopy").width 	:= ButtonSize
					ie.document.getElementById("btnDelete").width 	:= ButtonSize
					ie.document.getElementById("btnPrint").width 	:= ButtonSize
					

			;	if (WhereRemarks == "Left")
			;		{
			;		ie.document.getElementById("mpgMain").getElementsByTagName("DIV")[0].insertAdjacentHtml("beforebegin","<div id='commentDiv' value1=0 style='border: 1px solid black; position: relative; top: -1px; overflow: hidden; width: 37.1%; vertical-align: top; display: inline;'>" grabbedRemarks "</div><div id='commentDiv' value1=0 style='border: 1px solid black; position: relative; top: -1px; overflow: hidden; width: 3%; vertical-align: top; display: inline;'><button style='width: 100%;' onclick='alert();';>?</button><button style='width: 100%;' onclick='alert();';>?</button><button style='width: 100%;' onclick='alert();';>?</button><button style='width: 100%;' onclick='alert();';>?</button><button style='width: 100%;' onclick='alert();';>?</button><button style='width: 100%;' onclick='alert();';>?</button><button style='width: 100%;' onclick='alert();';>?</button><button style='width: 100%; height: 33px;' onclick='alert();'>?</button></div>")
			;		
			;		}
			;	else if (WhereRemarks == "Top")
			;		{
			;		ie.document.getElementById("mpgMain").getElementsByTagName("DIV")[0].insertAdjacentHtml("beforebegin","<div id='commentDiv' value1=0 style='border: 1px solid black; position: relative; top: -1px; overflow: hidden; width: 100%; height: 100%; display: inline;'>" grabbedRemarks "</div>")
			;		ie.document.getElementById("fldstrRemarks").style.height := "150px"
			;		}
			;	else if (WhereRemarks == "Right")	
			;		{
			;		ie.document.getElementById("mpgMain").getElementsByTagName("DIV")[0].insertAdjacentHtml("afterend","<div id='commentDiv' value1=0 style='border: 1px solid black; position: relative; top: -1px; overflow: hidden; width: 3%; vertical-align: top; display: inline;'><button style='width: 100%;' onclick='alert();';>?</button><button style='width: 100%;' onclick='alert();';>?</button><button style='width: 100%;' onclick='alert();';>?</button><button style='width: 100%;' onclick='alert();';>?</button><button style='width: 100%;' onclick='alert();';>?</button><button style='width: 100%;' onclick='alert();';>?</button><button style='width: 100%;' onclick='alert();';>?</button><button style='width: 100%; height: 33px;' onclick='alert();'>?</button></div><div id='commentDiv' value1=0 style='border: 1px solid black; position: relative; top: -1px; overflow: hidden; width: 37.1%; vertical-align: top; display: inline;'>" grabbedRemarks "</div>")
	;
	;				}
	;			else if (WhereRemarks == "Bottom")	
	;				{
	;				ie.document.getElementById("mpgMain").getElementsByTagName("DIV")[0].insertAdjacentHtml("afterend","<div id='blahblahblah' value1=0 style='border: 1px solid black; position: relative; top: 0px; overflow: hidden; width: 100%; height: 20px; vertical-align: top; display: inline; background-color: lightgray; border: 1px solid black;'><center><b>REMARKS<b></center></div><div id='commentDiv' value1=0 style='border: 1px solid black; position: relative; top: -1px; overflow: hidden; width: 100%; height: 100%; display: inline;'>" grabbedRemarks "</div>")
	;				ie.document.getElementById("fldstrRemarks").style.height := "150px"				
	;				}
					

				;	ie.document.getElementById("tspMain").onSelectedIndexChange:= "alert()"
					
					
				;	ie.document.getElementById("mpgMain").getElementsByTagName("pageview")[1].outerHTML := ie.document.getElementById("mpgMain").getElementsByTagName("pageview")[0].outerHTML
				;	ie.document.getElementById("mpgMain").getElementsByTagName("pageview")[1].innerHTML := ""

						;	ie.document.getElementById("dgdDueDate").style.border := "1px solid black"
						;	ie.document.getElementById("lblActionDue").innerText := " Remarks"
						;	ie.document.getElementById("lblDueDate").innerText := "Action Due                    Due Date       "
							
							
						;	Loop % ie.document.getElementById("dgdDueDate").getElementsByTagName("TD").length
						;		{
						;		ie.document.getElementById("dgdDueDate").getElementsByTagName("TD")[A_Index - 1].style.borderBottom := "1px solid black"					
						;		ie.document.getElementById("dgdDueDate").getElementsByTagName("TD")[A_Index - 1].style.borderTop := "1px solid black"					
						;		}					

if (CIDMods = 1) && (instr(location, "EditContact"))  ; ###5
	{
	
	CIDAnchor := ie.document.GetElementsBytagname("HR")[0]
	CIDReadOnly := CIDAnchor.value
	
	ifinstring, location, EditContact
		{
		if CIDReadOnly = hide
		{
			ie.document.GetElementsBytagname("DIV")[1].style.display := "none"
			ie.document.GetElementsBytagname("DIV")[2].style.display := "none"  ;1px
			ie.document.getElementById("lblCreated").style.display:= "none"
			ie.document.getElementById("tblHeader").style.display:= "none"
			ie.document.getElementById("lblModified").style.display:= "none"
			ie.document.getElementById("cidmods").style.display:= "inline"
			}
		else if CIDReadOnly = show
			{
			ie.document.GetElementsBytagname("DIV")[1].style.display := "inline"
			ie.document.GetElementsBytagname("DIV")[2].style.display := "inline"  ;1px
			ie.document.GetElementsBytagname("DIV")[2].style.height:= "700px"  ;1px
			ie.document.getElementById("lblCreated").style.display:= "inline"
			ie.document.getElementById("tblHeader").style.display:= "inline"
			ie.document.getElementById("lblModified").style.display:= "inline"
			ie.document.getElementById("cidmods").style.display:= "none"
			}
		else
			{
			if CIDAnchor.value1 != "cidAnchor"
			{
			CIDAnchor.value1 := "cidAnchor"
			CIDAnchor.value  := "show"
			CIDAnchor.id  := "cidAnchor"
			
			Titles := []
			IDs := []
			
			TempIndex = 1
			Loop 50
				{
				if TempIndex = 8
					Titles.push(ie.document.getElementsByTagName("FONT")[3 + TempIndex].innerText)
				else if TempIndex = 9
					{
					Titles.push(ie.document.getElementsByTagName("FONT")[3 + TempIndex].innerText . "\n" . ie.document.getElementsByTagName("FONT")[4 + TempIndex].innerText )
					TempIndex++
					}
				else			
					Titles.push(ie.document.getElementsByTagName("FONT")[3 + TempIndex].innerText)
				TempIndex++
				}

			IDs[1] := ie.document.GetElementByID("txtClientCode").value
			IDs[2] := ie.document.GetElementByID("txtAttyBilling").value
			IDs[3] := ie.document.GetElementByID("txtAttyAssigned").value
			IDs[4] := ie.document.GetElementByID("txtAttyWorking").value
			IDs[5] := ie.document.GetElementByID("txtContactName").value
			IDs[6] := ie.document.GetElementByID("txtTitleJob").value
			IDs[7] := ie.document.GetElementByID("txtCompany").value
			IDs[8] := ie.document.GetElementByID("txtAddress").value
			IDs[9] := ie.document.GetElementByID("txtAddressBilling").value
			IDs[10] := ie.document.GetElementByID("txtAddressMailing").value
			IDs[11] := ie.document.GetElementByID("txtCity").value
			IDs[12] := ie.document.GetElementByID("txtState").value
			IDs[13] := ie.document.GetElementByID("txtStateofInc").value
			IDs[14] := ie.document.GetElementByID("txtCountry").value
			IDs[15] := ie.document.GetElementByID("txtZip").value
			IDs[16] := ie.document.GetElementByID("txtBusinessPhone").value
			IDs[17] := ie.document.GetElementByID("txtFax").value
			IDs[18] := ie.document.GetElementByID("txtEmail").value
			IDs[19] := ie.document.GetElementByID("txtWebPageDecription").value
			IDs[20] := ie.document.GetElementByID("txtOtherPhone").value
			IDs[21] := ie.document.GetElementByID("txtMobilePhone").value
			IDs[22] := abs(ie.document.GetElementByID("chkForeignAssoc").checked)
			IDs[23] := abs(ie.document.GetElementByID("chkINTA").checked)
			IDs[24] := abs(ie.document.GetElementByID("chkHoliday").checked)
			IDs[25] := abs(ie.document.GetElementByID("chkINTSeminar").checked)
			IDs[26] := abs(ie.document.GetElementByID("chkCASeminar").checked)
			IDs[27] := ie.document.GetElementByID("txtOtherContacts").value
			IDs[28] := ie.document.GetElementByID("txtNotes").value	
			IDs[29] := ie.document.GetElementByID("txtRefNum").value
			IDs[30] := ie.document.GetElementByID("txtContactPA").value
			IDs[31] := ie.document.GetElementByID("txtAddressPA").value
			IDs[32] := ie.document.GetElementByID("txtRespAttyPA").value
			IDs[33] := ie.document.GetElementByID("txtWrkAttyPA").value
			IDs[34] := ie.document.GetElementByID("txtContactTM").value
			IDs[35] := ie.document.GetElementByID("txtAddressTM").value
			IDs[36] := ie.document.GetElementByID("txtRespAttyTM").value
			IDs[37] := ie.document.GetElementByID("txtWrkAttyTM").value
			IDs[38] := ie.document.GetElementByID("txtContactLit").value
			IDs[39] := ie.document.GetElementByID("txtAddressLit").value
			IDs[40] := ie.document.GetElementByID("txtRespAttyLit").value
			IDs[41] := ie.document.GetElementByID("txtWrkAttyLit").value
			IDs[42] := ie.document.GetElementByID("txtWrkAttyLit").value
			IDs[43] := abs(ie.document.GetElementByID("chkInactive").checked)
			IDs[44] := ie.document.GetElementByID("txtInactiveReason").value
			IDs[45] := abs(ie.document.GetElementByID("chkFlag").checked)
			IDs[46] := ie.document.GetElementByID("txtFlagDescription").value
			IDs[47] := abs(ie.document.GetElementByID("chkEngAgree").checked)
			IDs[48] := ie.document.GetElementByID("txtAnnuities").value

			Loop 48
			{
			if IDs[A_Index] = 0
				IDs[A_Index] := "No"
			if IDs[A_Index] = 1
				IDs[A_Index] := "Yes"			
			}

			Titles[1] := "Client Code"
			Titles[9] := "Billing Address"
			Titles.RemoveAt(42)
			IDs.RemoveAt(42)

			cidtemp = <table id="cidmods" style="padding:0px; width:100`%; border: 1px black solid; display: hidden;">
			
			ClientSearch = 
			(
			<td style="text-align:center; border:1px solid black; padding: 0px;" colspan="3" rowspan="2">
				<iframe width="450" height="200" src="http://kmobnet/insidekmobnet/ClientID_Search/ClientID.cfm?Client=Qualcomm&submit=Search"></iframe>
			</td>
			)

			if instr(oldlocation, "patfrm")
				FacingPageFrame = <iframe id="facingPage" width="1020" height="750" src="http://kmobnet/insidekmobnet/Patent_TM_Reports/facesheet.cfm?&casenumber=%ClientCodeNew%&country="></iframe>
			else
				FacingPageFrame = <iframe id="facingPage" width="1020" height="750" src="http://kmobnet/insidekmobnet/Patent_TM_Reports/TMfacesheet.cfm?&casenumber=%ClientCodeNew%&country="></iframe>

			FacingPage = 
			(
			<tr></tr><tr><tr>
			
			<td style="text-align:center; border:1px solid black; padding: 0px;" colspan="7">

				If you got here via the DocketMods button, it <i>should</i> have the record you came from below.
				<br>
				<strong>Enter Client Code to Open Facing Page</strong><br>
				
				<input type="button" style="height: 22px; width: 100px;" onclick="var newURLvar = document.getElementById('newURL').value; 
				document.getElementById('facingPage').src = 'http://kmobnet/insidekmobnet/Patent_TM_Reports/facesheet.cfm?&casenumber=' + newURLvar + '&country=';"
				value="Patent">
				<input type="text" style="height: 22px; width: 150px;" id="newURL" value="%ClientCode%">
				<input type="button" style="height: 22px; width: 100px;" onclick="var newURLvar = document.getElementById('newURL').value; 
				document.getElementById('facingPage').src = 'http://kmobnet/insidekmobnet/Patent_TM_Reports/TMfacesheet.cfm?&casenumber=' + newURLvar + '&country=';"
				value="Trademark">

			</td>
			
			
			</tr>
				<td style="text-align:center; border:1px solid black; padding: 0px;" colspan="7" rowspan="1">
					%FacingPageFrame%
				</td>
			</tr>
			)

			Consolidated = 
			(
			<td></td>
			
			<td style="text-align: center; border: 1px solid black;" >
				<input type="button" value="Grab City/State/ZIP" style="width: 200px; height: 50px;" 
				onclick="this.value = 'City/State/ZIP added!';
				var address = document.getElementById('consolidated').value; 
				var cityStateZip = 	document.getElementById('cidtext11').value + ', ' +	document.getElementById('cidtext12').value + ' ' +	document.getElementById('cidtext15').value;
				document.getElementById('consolidated').value = address + cityStateZip + '\r\n';"
				onmouseout="this.value='Grab City/State/ZIP'">
					
				<input type="button" value="Copy to Clipboard" style="width: 200px; height: 50px;" onclick="document.getElementById('consolidated').select(); document.execCommand('copy'); this.value='Copied to Clipboard!'; document.selection.empty();" onmouseout="this.value='Copy to Clipboard'">

				<input type="button" value="Clear All" style="width: 200px; height: 50px;" onclick="document.getElementById('consolidated').value = ''; this.value='Cleared!';" onmouseout="this.value='Clear All'">

		
			<input type="button" value="Test" style="width: 200px; height: 50px;" onmouseout="this.value='Test'" onclick="this.value='Clicked!';">

			</td>
			
			<td title="" colspan="2" style="text-align:center; border:1px solid black; padding: 0px;">
				<textarea value="" style="height:200px; width:100`%; color:black; background-color:white;" id="consolidated" value1="0" onclick="" ></textarea>
			<td>
			)

			HideCIDButton = 
			(
			<tr><td title="Toggle CID Mods" style="text-align:center; border:1px solid black; padding: 2px;"><button style="height:34px; width:125px; border: 1px black solid; color:%HoverColor%; background-color:%CustomColor%; cursor:crosshair;" id="CIDHide" value1="show" onclick="	if (this.value1 === 'show') {this.value1 = 'hide';} else {	this.value1 = 'show';} ;	document.getElementById('cidAnchor').value = this.value1;" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='lightgreen'; this.style.color='black'" >Toggle CID Mods</button></td>
			<td title="CID Home Page" style="text-align:center; border:1px solid black; padding: 2px;"><button style="height:34px; width:125px; border: 1px black solid; color:%HoverColor%; background-color:%CustomColor%; cursor:crosshair;" id="CIDHide" value1="show" onclick="window.open('http://kmobnetold/outsidekmobnet/cid/cidold/ClientList.aspx', '_self');" onMouseOut="this.style.backgroundColor='%CustomColor%'; this.style.color='%TextColor%'" onMouseOver="this.style.backgroundColor='lightgreen'; this.style.color='black'" >CID Home Page</button></td>
			</tr>
			)

			Loop 25
			{
			TempTitle := Titles[A_Index]
			TempInput := IDs[A_Index]	
			TempTitle2 := Titles[A_Index + 24]
			TempInput2 := IDs[A_Index + 24]

			TempText := "cidtext" . A_Index 
			TempBut := "cidbut" . A_Index
			TempText2 := "cidtext" . (A_Index + 24)
			TempBut2 := "cidbut" . (A_Index + 24)

			Temp := "<tr>"

			if (A_Index = 8) || (A_Index = 9) || (A_Index = 10)
				Column1 =  <td style="text-align:center; border:0px solid black; padding: 0px; width: 200px"><input readonly style="border:1px solid black; width:100`%; height:100`%;" type="text"  value="%TempTitle%"></td><td style="text-align:center; border:0px solid black; padding: 1px;"><textarea readonly rows="5" style="border:1px solid black; width:300px; height:100`%; color:blue;" id="%TempText%">%TempInput%</textarea></td><td title="" style="text-align:center; border:0px solid black; padding: 1px;"><button style="border:1px solid black; border-radius: 10px; height:100`%; width:100`%; color:blue; background-color:%CustomColor%;" id="%TempBut%" onclick="document.getElementById('consolidated').value += document.getElementById('%TempText%').value + '\r\n';" onMouseOut="this.style.backgroundColor='%CustomColor%';" onMouseOver="this.style.backgroundColor='%HoverColor%';" >Grab</button></td>
			else if (A_Index = 25)
				Column1 :=  ClientSearch
			else
				Column1 =  <td style="text-align:center; border:0px solid black; padding: 1px; width: 200px"><input readonly style="border:1px solid black; width:100`%; height:100`%;" type="text"  value="%TempTitle%"></td><td style="text-align:center; border:0px solid black; padding: 1px;"><input readonly style="border:1px solid black; width:300px; height:100`%;" type="text" style="color:blue;" id="%TempText%" value="%TempInput%"></td><td title="" style="text-align:center; border:0px solid black; padding: 1px;"><button style="border:1px solid black; border-radius: 10px; height:100`%; width:100`%; color:blue; background-color:%CustomColor%;" id="%TempBut%" onclick="document.getElementById('consolidated').value += document.getElementById('%TempText%').value + '\r\n';" onMouseOut="this.style.backgroundColor='%CustomColor%';" onMouseOver="this.style.backgroundColor='%HoverColor%';" >Grab</button></td>

			if A_Index = 25
				Column2 := Consolidated
			else if A_Index = 24
				Column2 := <td></td><td></td><td></td>
			else if (A_Index = 4) || (A_Index = 7) || (A_Index = 11) || (A_Index = 15) || (A_Index = 21)
				Column2 =  <td style="padding:10px; width: 200px;"></td><td style="text-align:center; border:0px solid black; padding: 1px; width: 200px;"><input readonly style="border:1px solid black;  width:200px; height:100`%;" type="text" value="%TempTitle2%"</td><td style="text-align:center; border:0px solid black; padding: 1px;"><textarea readonly rows="5" style="border:1px solid black; width:300px; height:100`%; color:blue;" id="%TempText2%">%TempInput2%</textarea></td><td title="" style="text-align:center; border:0px solid black; padding: 1px;"><button style="border:1px solid black; border-radius: 10px; height:100`%; width:100`%; color:blue; background-color:%CustomColor%;" id="%TempBut2%" onclick="document.getElementById('consolidated').value += document.getElementById('%TempText2%').value + '\r\n';" onMouseOut="this.style.backgroundColor='%CustomColor%'; " onMouseOver="this.style.backgroundColor='%HoverColor%'; " >Grab</button></td>
			else
				Column2 =  <td style="padding:10px; width: 200px;"></td><td style="text-align:center; border:0px solid black; padding: 1px; width: 200px;"><input readonly style="border:1px solid black;  width:200px; height:100`%;" type="text" value="%TempTitle2%"</td><td style="text-align:center; border:0px solid black; padding: 1px;"><input readonly style="border:1px solid black; width:300px; height:100`%;" type="text" style="color:blue;" id="%TempText2%" value="%TempInput2%"</td><td title="" style="text-align:center; border:0px solid black; padding: 1px;"><button style="border:1px solid black; border-radius: 10px; height:100`%; width:100`%; color:blue; background-color:%CustomColor%;" id="%TempBut2%" onclick="document.getElementById('consolidated').value += document.getElementById('%TempText2%').value + '\r\n';" onMouseOut="this.style.backgroundColor='%CustomColor%';" onMouseOver="this.style.backgroundColor='%HoverColor%';" >Grab</button></td>
			Temp := Temp . Column1 . Column2 . "</tr>"
			cidtemp := cidtemp . Temp
			}

			CIDAnchor.insertAdjacentHTML("afterend",HideCIDButton . cidtemp . FacingPage . "</table>" )					
			}	
		}
	}
	}

IfWinExist, Message from webpage, Record has successfully been saved.                ;  ahk_class #32770                   ;Message from webpage
	WinClose, Message from webpage, Record has successfully been saved.
IfWinExist, Message from webpage, The specified search criteria did not match any records.               ;  ahk_class #32770                   ;Message from webpage
	WinClose, Message from webpage, The specified search criteria did not match any records.
IfWinActive, Opening Mail Attachment, You should only open attachments from a trustworthy source.                ;  ahk_class #32770                   ;Message from webpage
	ControlSend,  , {Alt down}O{Alt up}, Opening Mail Attachment
IfWinActive, WorkSite, The version of this document                
	ControlSend,  , {Alt down}Y{Alt up}, WorkSite
IfWinActive, Microsoft Excel Security Notice
	ControlSend,  , {Alt down}Y{Alt up}, Microsoft Excel Security Notice
;IfWinExist, Web Browser              ;  ahk_class #32770                   ;Message from webpage
;	WinClose, Web Browser
return
}	
else {
MsgBox, test?

}
	
#If WinActive("ClientList - Internet Explorer")
Enter::
NumpadEnter::
CIDEnter:
ie.Navigate("javascript:__doPostBack('uwTB','uwTB_Item_4:DOWN')")
Sleep 1500
ie.document.getElementById("uwContactsrc_0_1").getElementsBytagname("A")[1].Click()
return

#If 

SetDocketModsDate:
WinGetPos, mX, mY, mW, mH, A
Sleep 250
Gui, 2: New, +AlwaysOnTop +LastFound +OwnDialogs ToolWindow, Quick Close Settings
Gui, 2: Add, Text, w225 Center , Select the date to use when closing actions.
Gui, 2: Add, MonthCal, vQuickCloseDate, %QuickCloseDate%
Gui, 2: Add, Text, w225 Center , Enter your SUPEResponse remarks.
Gui, 2: Add, Edit, w225 Center vQuickCloseRemarks, % "Date closed per %RespAtty%."
Gui, 2: Add, Button,  w225 gUpdateQuickCloseDate, Submit
NewX := mX + mW/2 - 120
NewY := mY + mH/2 - 65
Gui, 2: Show, x%NewX% y%NewY%
return	

UpdateQuickCloseDate:
Gui, 2: Submit
StringMid, NewYear, QuickCloseDate, 1, 4
StringMid, NewMonth, QuickCloseDate, 5, 2
StringMid, NewDay, QuickCloseDate, 7, 2
QuickCloseDate := NewMonth "/" NewDay "/" NewYear
if instr(QuickCloseRemarks, "%RespAtty%")
	StringReplace, QuickCloseRemarks, QuickCloseRemarks, % "%RespAtty%", %RespAtty%

ie.Refresh
return

; #Include \\docs-oc\files\Docketing\AutoHotKey\Scripts\Scripts.ahk

SwitchSystem()
{
WinActivate, ahk_class IEFrame

CheckClipboard := Clipboard
Clipboard := OldClipboard

ie := WBGet()
var := ie.LocationURL ; grab current url
	IfInstring, var, CPiAgent
		var := "Agent"
	else IfInstring, var, CPi
		var := "Live"
	else
		{
		TrayTip, System Switch, Not on a docketing page.
		return
		}
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value	

if (ClientCode == "")
	ClientCode := ie.document.getElementByID("fldstrCaseNumber").Value	

qry := "SELECT * FROM dbo.vwAHKMatterInfo WHERE Matter = '" ClientCode "'"
result := ADOSQL(qry)
Sleep 100
liveUrl := result[2,5] 		; url in live docketing system
agentUrl := result[2,6] 	; url in agent docketing system

if (liveURL != "")
	{
	if (var == "Agent")
		NewURL := liveUrl
	else if (var == "Live")
		NewURL := agentUrl
	}
else
	{
	TrayTip, System Switch, Not on a docketing page.
	ClientCode := ""
	liveUrl := ""
	agentUrl := ""
	result := ""
	qry := ""
	NewURL := ""
	return
	}
	if CherToggle = 1
		{
		Run iexplore.exe  %NewURL% 
		}
	else
		{
		Run %NewURL%
		}

Sleep 300
NewNewURL := ""
params:= ""
TempHTML := ""
TempHTML1 := ""
TempHTML2 := ""
NewURL := ""
NewURL1 := ""
NewURL2 := ""
NewURLSplit := ""
NewURLSplit1 := ""
ClientCode := ""
liveUrl := ""
agentUrl := ""
result := ""
qry := ""
NewURL := ""
OldClipboard := ""
CheckClipboard := ""
gosub RecordSysSwitch
SendInput {Ctrl up}
FirstAction := ""
return
}

RecordSysSwitch:
IniRead, SysSwitch, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SysSwitch
SysSwitch++
IniWrite, %SysSwitch%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, SysSwitch
return

RecordAttyFinder:
IniRead, AttyFinder, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AttyFinder
AttyFinder++
IniWrite, %AttyFinder%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AttyFinder
return

AttyEmailFinder(Attys)
{
ie := WBGet()
location := ie.LocationURL
global inventCountry
ClientCode := ""
ClientCode2 := ""
Country := ""
ThreeString := ""
TestString := ""
IniRead, ATPartner, C:\Users\%Computername%\AHKPrefs.ini, Username, ATPartner
Loop 10
{
AttyTest%A_Index% := ""
AttyString%A_Index% := ""
ThreeString%A_Index% := "" 
TestString%A_Index% := ""
}

Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
ClientCode2 := ie.document.getElementByID("fldstrCaseNumber").Value

StringReplace, ClientCode, ClientCode, %A_Space%, , A
StringReplace, ClientCode2, ClientCode2, %A_Space%, , A

if Country = ; Meaning we're on the Invention screen, probably.
	{
	newvar := "http://kmobnet/insidekmobnet/Patent_TM_Reports/facesheet.cfm?&casenumber=" . ClientCode2
	Gui, InventionCountry: Add, ActiveX, w800 h500 vinventCountry, Shell.Explorer  	; The final parameter is the name of the ActiveX component.
	inventCountry.Navigate(newvar)  												; This is specific to the web browser control.
	while inventCountry.busy or inventCountry.ReadyState != 4 						;Wait for page to load
		Sleep, 100
	Temp := % inventCountry.document.GetElementsByTagName("TR")[4].innerText
	ifinstring, Temp, US
		Country = US
	else
		Country = Not US
	Gui, InventionCountry: Destroy	
	}
	
if (instr(location, "tmkfrmTrademark") || instr(location, "patfrmInvention"))
	{
	attyRows := ie.document.getElementByID("dgdAttorneys").getElementsByTagName("tbody")[0].getElementsByTagName("tr")
	
	Loop % attyRows.length - 1  
		{
		if TestString = 
			TestString := attyRows[A_Index].getElementsByTagName("TD")[0].getElementsByTagName("A")[0].innerText
		else
			TestString := TestString . ", " . attyRows[A_Index].getElementsByTagName("TD")[0].getElementsByTagName("A")[0].innerText
		}
	} 
else	
	TestString := Attys

StringReplace, TestString, TestString, `- , , All                        ; Removes all dashes.
StringReplace, TestString, TestString, `r`n, `, , All                    ; Removes all hard returns. 
StringReplace, TestString, TestString, %A_Space% , , All ;               ; Removes all spaces, replaces with commas.
StringSplit, TestString, TestString, `, , . ; Omits periods.             ; Splits into array at commas.

if TestString%TestString0% = 
	TestString0--

Loop %TestString0%
{
StringLeft, AttyString%A_Index%, TestString%A_Index%, 3				; Stores first three characters of string.
	if ThreeString = 
		ThreeString := AttyString%A_Index%
	else
		ThreeString := ThreeString . " " . AttyString%A_Index%
}
Sort, ThreeString, U D%A_Space% 
StringSplit, ThreeString, ThreeString, %A_Space% , . ; Omits periods.     ; Splits into array at commas.

Loop %TestString0%
{
IniRead, AttyTest%A_Index%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini,  Attorneys, % ThreeString%A_Index% 
if AttyTest%A_Index% = ERROR                  ; If attorney is not an irregular one, sets AttyTest to 2aty team.
     AttyTest%A_Index% := "2" . ThreeString%A_Index%

StringLen, Atty%A_Index%Len, AttyTest%A_Index%	 
if Atty%A_Index%Len > 30                       ; If string is greater than 30 characters, meaning a runaway/blank array, sets array to blank.
	AttyTest%A_Index% = ;
}

Clipboard := ""
Loop %ThreeString0%
{
if Clipboard = 
	Clipboard := AttyTest%A_Index%
else
	Clipboard := Clipboard . "; " . AttyTest%A_Index%
}
if ClientCode = 
	ClientCode := ClientCode2

if Country = US
	{
	if ATPartner = -none-
		Clipboard := Clipboard . "; *FORUS, " . ClientCode . ".kmob@iwcs.kmob.com" 
	else
		Clipboard := Clipboard . "; " ATPartner . ", *FORUS, " . ClientCode . ".kmob@iwcs.kmob.com" 	
	}
else if Country != 
	{
	if ATPartner = -none-
		Clipboard := Clipboard
	else
		Clipboard := Clipboard . "; " ATPartner
	}
/*
else if Country = 
	{
	MsgBox, 0, Is this *FORUS?,Click OK if it is.`n`nOtherwise`, I'll assume it isn't., 3
		ifMsgBox OK
			{
			if ATPartner = -none-
				Clipboard := Clipboard . ", *FORUS, " . ClientCode . ".kmob@iwcs.kmob.com" 
			else
				Clipboard := Clipboard . ", " ATPartner . ", *FORUS, " . ClientCode . ".kmob@iwcs.kmob.com" 	
			}
		ifMsgBox TIMEOUT		
			{
			if ATPartner = -none-
				Clipboard := Clipboard
			else
				Clipboard := Clipboard . ", " ATPartner
			}
	}
*/

TrayTip, Attorneys saved to clipboard., Paste into CC: field and drag to To: field.
Sleep 2250
TrayTip
gosub RecordAttyFinder
return
}

/*
###############################################################################################################
######                                      ADOSQL v5.04L - By [VxE]                                     ######
###############################################################################################################

	Wraps the utility of ADODB to connect to a database, submit a query, and read the resulting recordset.
	Returns the result as a new object (or array of objects, if the query has multiple statements).
	To instead have this function return a string, include a delimiter option in the connection string.

	For AHK-L (v1.1 or later).
	Freely available @ http://www.autohotkey.com/community/viewtopic.php?p=558323#p558323

	IMPORTANT! Before you can use this library, you must have access to a database AND know the connection
	string to connect to your database.

	Varieties of databases will have different connection string formats, and different drivers (providers).
	Use the mighty internet to discover the connection string format and driver for your type of database.

	Example connection string for SQLServer (2005) listening on port 1234 and with a static IP:
	DRIVER={SQL SERVER};SERVER=192.168.0.12,1234\SQLEXPRESS;DATABASE=mydb;UID=admin;PWD=12345;APP=AHK
*/

Global ADOSQL_LastError, ADOSQL_LastQuery ; These super-globals are for debugging your SQL queries.


ADOSQL(Query_Statement) {
; Uses an ADODB object to connect to a database, submit a query and read the resulting recordset.
; By default, this function returns an object. If the query generates exactly one result set, the object is
; a 2-dimensional array containing that result (the first row contains the column names). Otherwise, the
; returned object is an array of all the results. To instead have this function return a string, append either
; ";RowDelim=`n" or ";ColDelim=`t" to the connection string (substitute your preferences for "`n" and "`t").
; If there is more than one table in the output string, they are separated by 3 consecutive row-delimiters.
; ErrorLevel is set to "Error" if ADODB is not available, or the COM error code if a COM error is encountered.
; Otherwise ErrorLevel is set to zero.

Connection_String := "Provider=sqloledb;Data Source=DB-Portal;Initial Catalog=KMOBPortal;Integrated Security=SSPI;"

coer := "", txtout := 0, rd := "`n", cd := "CSV", str := Connection_String ; 'str' is shorter.

; Examine the connection string for output formatting options.
	If ( 9 < oTbl := 9 + InStr( ";" str, ";RowDelim=" ) )
	{
		rd := SubStr( str, oTbl, 0 - oTbl + oRow := InStr( str ";", ";", 0, oTbl ) )
		str := SubStr( str, 1, oTbl - 11 ) SubStr( str, oRow )
		txtout := 1
	}
	If ( 9 < oTbl := 9 + InStr( ";" str, ";ColDelim=" ) )
	{
		cd := SubStr( str, oTbl, 0 - oTbl + oRow := InStr( str ";", ";", 0, oTbl ) )
		str := SubStr( str, 1, oTbl - 11 ) SubStr( str, oRow )
		txtout := 1
	}

	;ComObjError( 0 ) ; We'll manage COM errors manually.

; Create a connection object. > http://www.w3schools.com/ado/ado_ref_connection.asp
; If something goes wrong here, return blank and set the error message.
	If !( oCon := ComObjCreate( "ADODB.Connection" ) )
		Return "", ComObjError( 1 ), ErrorLevel := "Error"
		, ADOSQL_LastError := "Fatal Error: ADODB is not available."


	oCon.ConnectionTimeout := 3 ; Allow 3 seconds to connect to the server.
	oCon.CursorLocation := 3 ; Use a client-side cursor server.
	oCon.CommandTimeout := 900 ; A generous 15 minute timeout on the actual SQL statement.
	oCon.Open( str ) ; open the connection.

; Execute the query statement and get the recordset. > http://www.w3schools.com/ado/ado_ref_recordset.asp
	If !( coer := A_LastError )
		oRec := oCon.execute( ADOSQL_LastQuery := Query_Statement )

	If !( coer := A_LastError ) ; The query executed OK, so examine the recordsets.
	{
		o3DA := [] ; This is a 3-dimensional array.
		While IsObject( oRec )
			If !oRec.State ; Recordset.State is zero if the recordset is closed, so we skip it.
				oRec := oRec.NextRecordset()
			Else ; A row-returning operation returns an open recordset
			{
				oFld := oRec.Fields
				o3DA.Insert( oTbl := [] )
				oTbl.Insert( oRow := [] )

				Loop % cols := oFld.Count ; Put the column names in the first row.
					oRow[ A_Index ] := oFld.Item( A_Index - 1 ).Name

				While !oRec.EOF ; While the record pointer is not at the end of the recordset...
				{
					oTbl.Insert( oRow := [] )
					oRow.SetCapacity( cols ) ; Might improve performance on huge tables??
					Loop % cols
						oRow[ A_Index ] := oFld.Item( A_Index - 1 ).Value	
					oRec.MoveNext() ; move the record pointer to the next row of values
				}

				oRec := oRec.NextRecordset() ; Get the next recordset.
			}

		If (txtout) ; If the user wants plaintext output, copy the results into a string
		{
			Query_Statement := "x"
			Loop % o3DA.MaxIndex()
			{
				Query_Statement .= rd rd
				oTbl := o3DA[ A_Index ]
				Loop % oTbl.MaxIndex()
				{
					oRow := oTbl[ A_Index ]
					Loop % oRow.MaxIndex()
						If ( cd = "CSV" )
						{
							str := oRow[ A_Index ]
							StringReplace, str, str, ", "", A                   ; "
							If !ErrorLevel || InStr( str, "," ) || InStr( str, rd )
								str := """" str """"
							Query_Statement .= ( A_Index = 1 ? rd : "," ) str
						}
						Else
							Query_Statement .= ( A_Index = 1 ? rd : cd ) oRow[ A_Index ]
				}
			}
			Query_Statement := SubStr( Query_Statement, 2 + 3 * StrLen( rd ) )
		}
	}
	Else ; Oh NOES!! Put a description of each error in 'ADOSQL_LastError'.
	{
		oErr := oCon.Errors ; > http://www.w3schools.com/ado/ado_ref_error.asp
		Query_Statement := "x"
		Loop % oErr.Count
		{
			oFld := oErr.Item( A_Index - 1 )
			str := oFld.Description
			Query_Statement .= "`n`n" SubStr( str, 1 + InStr( str, "]", 0, 2 + InStr( str, "][", 0, 0 ) ) )
				. "`n   Number: " oFld.Number
				. ", NativeError: " oFld.NativeError
				. ", Source: " oFld.Source
				. ", SQLState: " oFld.SQLState
		}
		ADOSQL_LastError := SubStr( Query_Statement, 4 )
		Query_Statement := ""
		txtout := 1
	}

; Close the connection and return the result. Local objects are cleaned up as the function returns.
	oCon.Close()
	;ComObjError( 1 )
	ErrorLevel := coer
	Return txtout ? Query_Statement : o3DA.MaxIndex() = 1 ? o3DA[1] : o3DA
} ; END - ADOSQL( Connection_String, Query_Statement )


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

/*


<!-- <table style="width: 100`%; padding: 5px;">
	<tr style="height: 200px;">
		<td style="width: 50`%; border: 1px solid black; padding: 0px;">
		<textarea readonly style="width: 100`%; height: 200px; font: italic;" wrap="hard">%NoteInput%</textarea>
		</td>

		<td style="width: 50`%; border: 1px solid black; vertical-align: top;">
			<table style="width: 100`%">
				<tr>	
					<td style="width: 25`%"><input type="text" style="width: 100`%" value="Client Code:"></td>
					<td style="width: 75`%"><input type="text" id="noteClientCode" style="width: 100`%" value=""></td>
				</tr>
				<tr>					
					<td style="width: 25`%"><input type="text" style="width: 100`%" value="Country:"></td>
					<td style="width: 75`%"><input type="text" id="noteCountry" style="width: 100`%" value=""></td>
				</tr>
				<tr>
					<td style="width: 25`%"><input type="text" style="width: 100`%" value="Case Type:"></td>
					<td style="width: 75`%"><input type="text" id="noteCaseType" style="width: 100`%" value=""></td>
				</tr>
				<tr>
					<td style="width: 25`%"><input type="text" style="width: 100`%" value="Application #:"></td>
					<td style="width: 75`%"><input type="text" id="noteAppNumber" style="width: 100`%" value=""></td>
				<tr>
			</table>
		</td>

	</tr>
</table> -->


if CustomButtons = 1 ; ###4 
	{
	ie.document.getElementById("btnEdit").width 	:= ButtonSize
	ie.document.getElementById("btnSave").width 	:= ButtonSize
	ie.document.getElementById("btnUndo").width 	:= ButtonSize
	ie.document.getElementById("btnNew").width 		:= ButtonSize
	ie.document.getElementById("btnCopy").width 	:= ButtonSize
	ie.document.getElementById("btnDelete").width 	:= ButtonSize
	ie.document.getElementById("btnPrint").width 	:= ButtonSize
	
	ie.document.getElementById("btnEdit").src := Custom_Edit
	ie.document.getElementById("btnSave").src := Custom_Save
	ie.document.getElementById("btnUndo").src := Custom_Undo
	ie.document.getElementById("btnNew").src := Custom_New
	ie.document.getElementById("btnCopy").src := Custom_Copy
	ie.document.getElementById("btnDelete").src := Custom_Delete
	ie.document.getElementById("btnPrint").src := Custom_Print

	;;;;;;;; ADD BORDERS TO BUTTONS ;;;;;;;;;;

	;ie.document.getElementById("btnEdit").style.border := "thick dotted " CustomColor 
	;ie.document.getElementById("btnSave").style.border := "thick dashed " CustomColor 
	;ie.document.getElementById("btnUndo").style.border := "thick groove " CustomColor 
	;ie.document.getElementById("btnNew").style.border := "thick dashed " CustomColor 
	;ie.document.getElementById("btnCopy").style.border := "thick inset " CustomColor 
	;ie.document.getElementById("btnDelete").style.border := "thick outset " CustomColor 
	;ie.document.getElementById("btnPrint").style.border := "thick solid" ; CustomColor 
	;ie.document.getElementById("btnPrint").style.borderColor := "red green %HoverColor% %CustomColor%" ; CustomColor 
	}

global QuickClose

!Space::
SuperEdit:
ieNew := WBget()
currentLocation := ieNew.LocationURL

Gui, QuickClose: Add, Button, gTestButton, TestTestTest
Gui, QuickClose: Add, ActiveX, w800 h500 vQuickClose, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
QuickClose.navigate("http://oc-docketing/CPi/patfrmActDateTaken.aspx?key=20274148")
;Gui, QuickClose: Show
SetTimer, CloseWindow, 30
Sleep 2000
gosub TestButton
return


CloseWindow:
SetTitleMatchMode, 2
IfWinExist, Web Browser, The webpage you are viewing is trying to close the window.              ;  ahk_class #32770                   ;Message from webpage
	{
	ControlSend,  , {Alt down}Y{Alt up}, Web Browser
	SetTimer, CloseWindow, Off
	Gui, QuickClose: Destroy
	ieNew.Navigate(currentLocation)
	}
return


QuickCloseGuiClose:
Gui, QuickClose: Destroy
return

TestButton:
QuickClose.document.getElementById("flddteDateTaken").value := "3/27/19"
TempRemarks := QuickClose.document.getElementById("fldstrRemarks").value
QuickClose.document.getElementById("fldstrRemarks").value := "Test Remarks`r`n" . TempRemarks
QuickClose.document.getElementById("btnSave").Click()
return
*/

#If WinActive("ahk_class IEFrame")
LAlt & RAlt::
ie := WBGet()
ie.document.getElementByID("supeResponse").Click()
return

RAlt & LAlt::
ie := WBGet()
gosub CopyActionToAT
return

#If

SearchForATAction:
Gui, 10: Add, ActiveX, w0 h0 x-1000 y-1000 vie3, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
ie := WBGet()
NumberOfInputs := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR").length
temptemp := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[NumberOfInputs - 1].getElementsByTagName("TD")[0].innerText
StringSplit, temptemp, temptemp, `r`n   ; temptemp1 is the Action Due., temptemp3 is the Action Due Remarks.
FirstAction := temptemp1
ie.document.getElementById("findATaction").value := "Action grabbed..."
var := ie.LocationURL ; grab current url
	IfInstring, var, CPiAgent
		var := "Agent"
	else IfInstring, var, CPi
		var := "Live"
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value	

if (ClientCode == "")
	ClientCode := ie.document.getElementByID("fldstrCaseNumber").Value	

qry := "SELECT * FROM dbo.vwAHKMatterInfo WHERE Matter = '" ClientCode "'"
result := ADOSQL(qry)
Sleep 100
liveUrl := result[2,5] 		; url in live docketing system
agentUrl := result[2,6] 	; url in agent docketing system

if (liveURL != "")
	{
	if (var == "Agent")
		NewURL := liveUrl
	else if (var == "Live")
		NewURL := agentUrl
	}

ie.document.getElementById("findATaction").value := "Checking AT system..."
ie3.silent := true
ie3.navigate(NewURL) 
GuiControl, 2:, Button27, Looking for match...
while ie3.busy or ie3.ReadyState != 4 ;Wait for page to load
	Sleep, 100
var := ie3.LocationURL ; grab current url

Loop 20
{
NewAS := ie3.document.GetElementsBytagname("A").length
	if NewAS = 0 
		Sleep 250
	else
		break
}
ie.document.getElementById("findATaction").value := "Looking through actions..."
NewNewURL := ""
Loop %NewAS%
	{
	TempAction := ie3.document.GetElementsBytagname("A")[A_Index-1].InnerText
	
	ifinstring, TempAction, %FirstAction%
		{
		TempHTML := ie3.document.GetElementsBytagname("A")[A_Index-1].OuterHTML
	
		StringSplit, TempHTML, TempHTML, ",    ;"
		StringSplit, NewURL, TempHTML2, =, 
		StringSplit, NewUrlSplit, NewUrl2, &
		
		if instr(var, "http://oc-docketing/CPi/")
			NewNewURL := "http://oc-docketing/CPi/" . NewURL1 . "=" . NewUrlSplit1
		else if instr(var, "http://oc-docketing/CPiAgent/")
			NewNewURL := "http://oc-docketing/CPiAgent/" . NewURL1 . "=" . NewUrlSplit1
		;GuiControl, 2:, Button27, Match found! Click to open.
		;GuiControl, 2: Enable, Button27
		;SetTimer, TurnOffToolTip, -5000
		}
	}

if NewNewURL != 
	{
	ie.document.getElementById("findATaction").disabled := false
	ie.document.getElementById("findATaction").value := "Match found! Opening record."
	if CherToggle = 1
		Run iexplore.exe  %NewNewURL% 
	else
		Run %NewNewURL%
	ie.document.getElementById("findATaction").value := "Match found! Click to open."	
	}
else	
	ie.document.getElementById("findATaction").value := "Didn't find it :("
Gui, 10: Destroy
return

LControl & RControl::
AttyClipboard := ""
AttorneyArray := []
AttyEsq := []
EsqClipboard := ""
Clipboard = ;
SendInput ^c
ClipWait, .2
NewClipboard = %Clipboard%

if instr(NewClipboard, 20)
	{
	year := SubStr(NewClipboard, 8,4)
	month := SubStr(NewClipboard, 4, 3) 
	day := SubStr(NewClipboard, 1,2)
	if month = Jan
		newmonth = January
	else if month = Feb
		newmonth = February
	else if month = Mar
		newmonth = March
	else if month = Apr
		newmonth = April
	else if month = May
		newmonth = May
	else if month = Jun
		newmonth = June
	else if month = Jul
		newmonth = July
	else if month = Aug
		newmonth = August
	else if month = Sep
		newmonth = September
	else if month = Oct
		newmonth = October
	else if month = Nov
		newmonth = November
	else if month = Dec
		newmonth = December

	if SubStr(day, 1, 1) = 0
		day := SubStr(day, 2, 1)
		
	Clipboard := newmonth " " day ", " year
	TrayTip, Date reformatted., %NewClipboard% | %Clipboard%
	}
else
	{
	AttorneyArray := StrSplit(NewClipboard, ",")
	Loop % AttorneyArray.Length()
		{
		if instr(AttorneyArray[A_Index], "IPP")
			continue
		else if instr(AttorneyArray[A_Index], "CLSP")
			continue		
		else if instr(AttorneyArray[A_Index], "USPS")
			continue
		else if instr(AttorneyArray[A_Index], "FPA")
			continue
		else
			{
			Temp := Trim(AttorneyArray[A_Index])
			StringMid, Temp, Temp, 1, 3
			if AttyClipboard = 
				AttyClipboard := Temp ; ", Esq."
			else
				AttyClipboard := AttyClipboard  . "," Temp ; . ", " . Temp ", Esq."
			}
		}
		Sort, AttyClipboard, U D,
		
		AttyEsq := StrSplit(AttyClipboard, ",")
		
		Loop % AttyEsq.Length()
			EsqClipboard := EsqClipboard . AttyEsq[A_Index] . ", Esq. "

	TrayTip, Attorneys reformatted., % EsqClipboard
	Clipboard := EsqClipboard
	}	
return

CopyActionToAT:
ClientCode := ""
SubCase := ""
ActionType := ""
Country := ""
BaseDate := ""
ResponseSent := ""
Remarks := ""
NewURL1 :=
URL := ""
ie := WBGet()
URL := ie.LocationURL

ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
SubCase := ie.document.getElementByID("fldstrSubCase_TextBox").Value
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
BaseDate := ie.document.getElementByID("flddteBaseDate").Value
ResponseSent := ie.document.getElementByID("flddteResponseDate").Value
Remarks := ie.document.getElementByID("fldstrRemarks").Value

IfInString, 	 URL, http://oc-docketing/CPi/patfrmActionDue.aspx?key
	NewURL := "http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?Key=-1"
else IfInString, URL, http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key
	NewURL := "http://oc-docketing/CPi/patfrmActionDue.aspx?Key=-1"
else IfInString, URL, http://oc-docketing/CPi/tmkfrmActionDue.aspx?Key
	NewURL := "http://oc-docketing/CPiAgent/tmkfrmActionDueAgent.aspx?Key=-1"
else IfInString, URL, http://oc-docketing/CPiAgent/tmkfrmActionDueAgent.aspx?key
	NewURL := "http://oc-docketing/CPi/tmkfrmActionDue.aspx?Key=-1"
else
	return

Run, % NewURL
Sleep 1500
ie := WBGet()
ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := ClientCode
ie.document.getElementByID("fldstrSubCase_TextBox").Value 	 := SubCase
ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
ie.document.getElementByID("flddteBaseDate").Value 			 := BaseDate
ie.document.getElementByID("flddteResponseDate").Value 		 := ResponseSent
ie.document.getElementByID("fldstrRemarks").Value 			 := Remarks
ie.document.getElementByID("fldstrCountry_TextBox").Value	 := Country
return

Display(WB,html_str) {
	Count:=0
	while % FileExist(f:=A_Temp "\" A_TickCount A_NowUTC "-tmp" Count ".DELETEME.html")
		Count+=1
	FileAppend,%html_str%,%f%
	WB.Navigate("file://" . f)
}

CheckDocketTips:
gosub AHKTipsGuiClose
tempCountry 	:= ie.document.getElementById("fldstrCountry_TextBox").value
tempActionType 	:= ie.document.getElementById("fldstrActionType_TextBox").value
tempBaseDate	:= ie.document.getElementById("flddteBaseDate").value
location		:= ie.LocationURL

if (tempCountry == "CA") && ((tempActionType == "INT-TM CA REG FEE / DECL USE") || (tempActionType == "INT-TM CA EXT CONFIRMED - REG FEE / DECL USE"))
	ShowTipsGUI("CARegFee/Declaration of Use")
else if (tempCountry == "WO") 
	{
	if instr(location, "CountryApplication")
		{
		ExpirationDate := ie.document.getElementById("flddteExpDate").value
		if ExpirationDate =
			ShowTipsGUI("PCTAppNoExpirationDate")
		}
	}
else if (tempCountry == "MY") 	
	{
	if instr(location, "tmkfrmTrademark")
		{
		tempPriorityDate := ie.document.getElementById("flddtePriDate").value
		tempCaseType	 := ie.document.getElementById("fldstrCaseType_TextBox").value
		if (tempPriorityDate != "") && (tempCaseType != "TCP")
			ShowTipsGUI("MYWithPriorityTCP")
		}
	}
return

ShowTipsGUI(whichTip)
{
height = 0
global interface
MYAPP_PROTOCOL:="myapp"

if whichTip = CARegFee/Declaration of Use
	{
	header := "CA Reg Fee/Declaration of Use"
	description := "If your base date is later than 6/17/2019, a Declaration of Use is no longer required for registration in Canada.<br><br>Confirm with the TMPL if a Declaration of Use is needed.<br><br>If not, you should use the standard Registration Fee action."
	height := 155
	}
else if whichTip = PCTAppNoExpirationDate
	{
	header := "PCT App: No Expiration Date"
	description := "It looks like the Expiration Date didn't generate on this PCT app. To fix it:<br><br>1) Copy the Filing Date.<br>2) Remove the Filing Date and click Save.<br>3) Paste it back in and Save again.<br><br> The Expiration Date should now generate."
	height := 145
	}
else if whichTip = MYWithPriorityTCP
	{
	header := "MY TM w/ Priority Should Be TCP"
	description := "A trademark claiming priority in Malaysia should have TCP Case Type.<br><br>If this Malaysian trademark claims priority, you should update the Case Type to TCP so the dates generate correctly."
	height := 120
	}	
else 
	{
	header := "Test Header"
	description := "There would be some text here."
	height := 60
	}
	

HTML_page =
( 
<!DOCTYPE html>
<html>
	<head>
		<style>
			body {
			  font-family:sans-serif;
			  background-color:#eeeeee;
			  line-height: 1.1;
			}
			
			div {
			  position: fixed; 
			  top: 1px;
			  left: 1px;
			  unselectable: on;
			}
			
			table {
			  width: 298px; 
			  text-align: center;
			}

			td {
			  color: blue;
			  font-size: 12px;
			  font-weight: bold;
			  width: 100`%;
			  cursor: default;
				}	

			h4 {
			  color: black;
			  text-align: center;
			  font-style: italic;
			  margin-bottom: 3px;
			  border-bottom: 1px solid black
			}
		</style>
			<script>
			function testFunction() {
				alert("This is a test function.");
			}
		</script>
	</head>

	<body>
		<div>
			<table >
				<tr>
					<td>
						<h4 unselectable="on">%header%</h4>
					</td>
				</tr>
				<tr>
					<td style="padding-left: 20px; padding-right: 20px;" unselectable="on">
						%description%
					</td>
				</tr>
			</table>		
		</div>
	</body>
	
</html>
)

;ie.Navigate("javascript: alert('It looks like you\'re on a CA Reg Fee/Declaration of Use action.\r\n\r\nIf your base date is later than 6/17/2019, a Declaration of Use is no longer required for registration in Canada.\r\n\r\nConfirm with the TMPL if a Declaration of Use is needed.\r\n\r\nIf not, you should use the standard Registration Fee action.');")
WinGetPos, mX, mY, mW, mH, A
Sleep 250
Gui, AHKTips: New, ToolWindow Border +AlwaysOnTop +LastFound +OwnDialogs, %header%
Gui, AHKTips: Add, ActiveX, vInterface w320 h250 x0 y0, Shell.Explorer
OnMessage(0x100, "WB_OnKeyPress", 2) 
ComObjConnect(Interface, Interface_events)  ; Connect ie's events to the ie_events class object.
Interface.silent := true
Display(Interface,HTML_page)
NewX := mX + mW/2 - 155
NewY := mY + mH/2 - 120
WinSet, Transparent, 0, %header%
Sleep 100
Gui, AHKTips: Show, x%NewX% y%NewY% w300 h%height%
WinSet, Transparent, 51, %header%
Sleep 100
WinSet, Transparent, 102, %header%
Sleep 100
WinSet, Transparent, 153, %header%
Sleep 100
WinSet, Transparent, 204, %header%
Sleep 100				
WinSet, Transparent, 255, %header%

return
}

AHKTipsGuiClose:
; Reload
WinSet, Transparent, 255, %header%
Sleep 100
WinSet, Transparent, 204, %header%
Sleep 100
WinSet, Transparent, 153, %header%
Sleep 100
WinSet, Transparent, 102, %header%
Sleep 100
WinSet, Transparent, 51, %header%
Sleep 100
Gui, AHKTips: Destroy
return

CalculateEPDivAnnuities:
global ParentPCTDate := ""
global annuityMsg := ""
ie := WBGet()
ParentPCTDate := ie.document.getElementbyId("flddteParentPCTDate").value
PCTYear := SubStr(ParentPCTDate, 8, 4)

YearsDue := ThisYear - PCTYear
AmountDue := 0
Loop 20 ; %YearsDue%
	{
	AmountDue += EPRenewalFees[A_Index]
	TotalDue%A_Index% := AmountDue
	}
	
MinusOne := YearsDue - 1
PlusOne := YearsDue + 1
AmountDueGuessMinusOne := TotalDue%MinusOne%
AmountDueGuess := TotalDue%YearsDue%
AmountDueGuessPlusOne := TotalDue%PlusOne%


annuityMsg =
(
Parent/PCT Date:`t%ParentPCTDate%
Today's Date:`t`t%Today%
---------------------------

Probable Years Due: 3 - %YearsDue%

Accumulated Years 3 - %MinusOne% | €%AmountDueGuessMinusOne%
Accumulated Years 3 - %YearsDue% | €%AmountDueGuess%
Accumulated Years 3 - %PlusOne% | €%AmountDueGuessPlusOne%

---------------------------

Year 3:`t`t€%TotalDue3%.00
Year 3 - 4:`t€%TotalDue4%.00
Year 3 - 5:`t€%TotalDue5%.00
Year 3 - 6:`t€%TotalDue6%.00
Year 3 - 7:`t€%TotalDue7%.00
Year 3 - 8:`t€%TotalDue8%.00
Year 3 - 9:`t€%TotalDue9%.00
Year 3 - 10:`t€%TotalDue10%.00
Year 3 - 11:`t€%TotalDue11%.00
Year 3 - 12:`t€%TotalDue12%.00
Year 3 - 13:`t€%TotalDue13%.00
Year 3 - 14:`t€%TotalDue14%.00
Year 3 - 15:`t€%TotalDue15%.00
Year 3 - 16:`t€%TotalDue16%.00
Year 3 - 17:`t€%TotalDue17%.00
Year 3 - 18:`t€%TotalDue18%.00
Year 3 - 19:`t€%TotalDue19%.00
Year 3 - 20:`t€%TotalDue20%.00

---------------------------

Year 3:`t`t€490.00
Year 4:`t`t€610.00
Year 5:`t`t€855.00
Year 6:`t`t€1090.00
Year 7:`t`t€1210.00
Year 8:`t`t€1330.00
Year 9:`t`t€1450.00
Year 10:`t€1640.00
Year 11:`t€1640.00
Year 12:`t€1640.00
Year 13:`t€1640.00
Year 14:`t€1640.00
Year 15:`t€1640.00
Year 16:`t€1640.00
Year 17:`t€1640.00
Year 18:`t€1640.00
Year 19:`t€1640.00
Year 20:`t€1640.00
)	
	
WinGetPos, mX, mY, mW, mH, A
Sleep 250
NewX := mX + mW/2 - 100
NewY := mY + mH/2 - 350
Sleep 100
Gui, Annuities: New, AlwaysOnTop, EP Annuities
Gui, Annuities: Add, Text, , %annuityMsg%
Gui, Annuities: Show, x%NewX% y%NewY% w200, EP Annuities

; MsgBox, 0,  EP Annuities Calculation, % annuityMsg
return

AnnuitiesGuiClose:
Gui, Annuities: Destroy
return

;
;!Space::
;ie := WBGet()
;MsgBox, % ie.LocationURL
;
;MsgBox, % ie.document.getElementsByTagName("A").length
;return

changeButtonColor:
ie.document.getElementById("noteEdit").style.backgroundColor := "A6F4FF"
ie.document.getElementById("noteArea").style.backgroundColor := "E4E4E4"
ie.document.getElementById("noteEdit").value := "Edit"
return


#If WinActive("ahk_exe iexplore.exe")
^s::
ie.document.getElementById("noteEdit").Click()
return
#If


OutgoingOppActions()
{
global ie
global ie2
global ackDate := ""
global CNevidenceDate := ""
global AppNo := ""
global ActionType := "" 
global newvar := ""
global var := ""
WinGetPos, winposX, winposY, winposW, winposH, A  ; "A" to get the active window's pos.
ie := WBGet()
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value

if instr(ActionType, "Deadline to File Opposition")
	{
	ie := WBGet()
	while ie.busy or ie.ReadyState != 4 ;Wait for page to load
		Sleep, 100
	IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
	IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
	ie.document.getElementByID("btnEdit").Click()
	Sleep 250
	ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
	Remarks := ie.document.getElementByID("fldstrRemarks").Value
	Sleep 250
	StringMid, AppNo, ActionType, 29, 50 
	StringReplace, AppNo, AppNo, (, , A
	StringReplace, AppNo, AppNo, ), , A
	Sleep 250
	Default := ATDate . " Possible opposition against:`nApplication number: " . AppNo . "`nMark: *`nApplicant: *`nClass: *`nOur Mark(s):`nRcvd via instr. " . Username . "`n" . Remarks
	ie.document.getElementByID("fldstrRemarks").Value := Default
	}
else if instr(ActionType, "Opposition Filed")
	{
	TrayTip, Adding Opposition Actions, Please wait a few seconds...
	ie.document.getElementByID("fldstrActionType_TextBox").Value := "ADDING OPP DUE DATES. PLEASE HOLD."
	ie.document.getElementByID("fldstrActionType_TextBox").style.color := "red"
	ie.document.getElementByID("fldstrActionType_TextBox").style.fontWeight := "bold"
	
	location := ie.LocationURL
	
	
	StringMid, AppNo, ActionType, 19, 50 
	StringReplace, AppNo, AppNo, (, , A
	StringReplace, AppNo, AppNo, ), , A
	INPUTS := ie.document.GetElementsBytagname("INPUT").length

	SelectedDate := ie.document.getElementById("flddteBaseDate").value
	year  := SubStr(SelectedDate, 8,4)
	month := SubStr(SelectedDate, 4,3) 
	day   := SubStr(SelectedDate, 1,2)
	if month = Jan
		newmonth := 01
	else if month = Feb
		newmonth := 02
	else if month = Mar
		newmonth := 03
	else if month = Apr
		newmonth := 04
	else if month = May
		newmonth := 05
	else if month = Jun
		newmonth := 06
	else if month = Jul
		newmonth := 07
	else if month = Aug
		newmonth := 08
	else if month = Sep
		newmonth := 09
	else if month = Oct
		newmonth := 10
	else if month = Nov
		newmonth := 11
	else if month = Dec
		newmonth := 12

	ackDate := year . newmonth . day
	CNevidenceDate := year . newmonth . day
	ackDate += -7, days
	CNevidenceDate += 14, days
	FormatTime, ackDate, %ackDate%, dd-MMM-yyyy	
	FormatTime, CNevidenceDate, %CNevidenceDate%, dd-MMM-yyyy	

	Loop %INPUTS%
		{
		Temp := ie.document.GetElementsBytagname("INPUT")[A_Index-1].OuterHTML
		ifInString, Temp, ActDueDate
			break
		}
		
	StringSplit, Temp, Temp, `'
	StringSplit, ActionKey, Temp2, =

	var := ie.LocationURL ; grab current url
	
	ifinstring, var, patfrmActionDueAgent
		newvar := StrReplace(var, "patfrmActionDueAgent", "patfrmActDueDateAgent", , 1)
	else ifinstring, var, CPi/patfrmActionDue
		newvar := StrReplace(var, "patfrmActionDue", "patfrmActDueDate", , 1)
	else ifinstring, var, tmkfrmActionDueAgent
		newvar := StrReplace(var, "tmkfrmActionDueAgent", "tmkfrmActDueDateAgent", , 1)	
	else ifinstring, var, tmkfrmActionDue
		newvar := StrReplace(var, "tmkfrmActionDue", "tmkfrmActDueDate", , 1)	
	else
		return

	if instr(var, ActionKey2)
		{
		}
	else
		{
		StringSplit, newUrl, newvar, =
		newvar := newUrl1 . "=" . ActionKey2 . "&bc=" . newUrl3 . "=" . newUrl4
		}
		
	Gui, Opp: New, ToolWindow AlwaysOnTop, Outgoing Opposition Actions
	Gui, Opp: Add, ActiveX, w800 h500 x0 y0 vie2, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
	ie2.Navigate(newvar)  ; This is specific to the web browser control.
	IniRead, CustomColor, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowColor
	Gui, Opp: Color, %CustomColor%
	OnMessage(0x100, "gui_KeyDown", 2) ; [color=green]; This when the GUI is initialized.[/color]
	ComObjConnect(ie2, ie_events)  ; Connect ie's events to the ie_events class object.
	newheight := winposY + (winposH/2 - 225)
	newwidth  := winposX + (winposW/2 - 423)
	; Gui, Opp: Show, x%newwidth% y%newheight% w790 h500 ; yCenter w845 h533

	SetTimer, RefreshGUIOpp, 500
	while ie2.busy or ie2.ReadyState != 4 						;Wait for page to load
		Sleep, 100
	gosub AdjustToDueDate
	Sleep 1000	
	gosub DocketOppAck
	Sleep 1000
	gosub DocketOppCNEvidence
	Sleep 1000
	gosub OppGuiClose
	return

	RefreshGUIOpp:
	AS := ie2.document.GetElementsBytagname("A").length
	INPUTS := ie2.document.GetElementsBytagname("INPUT").length
	SPANS := ie2.document.GetElementsBytagname("SPAN").length
	TEXTAREAS := ie2.document.GetElementsBytagname("TEXTAREA").length
	return

	AdjustToDueDate:
	ie.document.getElementByID("fldstrActionType_TextBox").Value := "ADJUSTING OPP FILED TO DUE DATE..."
	while ie2.busy or ie2.ReadyState != 4 						;Wait for page to load
		Sleep, 100
	ie2.document.getElementsByTagName("IMG")[2].Click()
	Sleep 750
	ie2.document.GetElementsBytagname("INPUT")[5].Value := "Due Date"
	gosub ClickSaveOpp
	return

	DocketOppAck:
	ie.document.getElementByID("fldstrActionType_TextBox").Value := "ADDING THE ACKNOWLEDGMENT..."
	while ie2.busy or ie2.ReadyState != 4 						;Wait for page to load
		Sleep, 100
	ie2.document.getElementById("btnNew").Click()
	Sleep 750
	ie2.document.GetElementsBytagname("INPUT")[3].Value := "Ack of Opposition Instructions Recvd? (" AppNo ")"
	ie2.document.GetElementsBytagname("INPUT")[4].Value := ackDate
	gosub ClickSaveOpp
	return

	DocketOppCNEvidence:
	ie.document.getElementByID("fldstrActionType_TextBox").Value := "ADDING CHECK EVIDENCE DATE..."
	while ie2.busy or ie2.ReadyState != 4 						;Wait for page to load
		Sleep, 100
	ie2.document.getElementById("btnNew").Click()
	Sleep 750
	ie2.document.GetElementsBytagname("INPUT")[3].Value := "Check with FA to Confirm Evidence Deadline?"
	ie2.document.GetElementsBytagname("INPUT")[4].Value := CNevidenceDate
	gosub ClickSaveOpp
	return

	ClickSaveOpp:
	Loop %AS%
		{
		Temp%A_Index% := ie2.document.GetElementsBytagname("A")[A_Index-1].OuterHTML
		ifinstring, Temp%A_Index% , save
			{
			ie2.document.GetElementsBytagname("A")[A_Index-1].Click()
			break
			}
		}
	return

	OppGuiClose:
	Gui, Opp: Destroy
	ifinstring, newvar, patfrmActDueDateAgent
		newvar := StrReplace(newvar, "patfrmActDueDateAgent", "patfrmActionDueAgent", , 1)
	else ifinstring, newvar, CPi/patfrmActDueDate
		newvar := StrReplace(newvar, "patfrmActDueDate", "patfrmActionDue", , 1)
	else ifinstring, newvar, tmkfrmActDueDateAgent
		newvar := StrReplace(newvar, "tmkfrmActDueDateAgent", "tmkfrmActionDueAgent", , 1)	
	else ifinstring, newvar, tmkfrmActDueDate
		newvar := StrReplace(newvar, "tmkfrmActDueDate", "tmkfrmActionDue", , 1)	
	SetTimer, RefreshGUIOpp, Off
	ie.Navigate(newvar)
	while ie.busy or ie.ReadyState != 4 						;Wait for page to load
		Sleep, 100
	;ie.document.getElementByID("fldstrActionType_TextBox").Value := "YOU'RE DONE! (ASSUMING IT WORKED)"
	ie.document.getElementByID("fldstrActionType_TextBox").style.color := "green"
	ie.document.getElementByID("fldstrActionType_TextBox").style.fontWeight := "bold"
	TrayTip, Opposition Actions Added!, You may need to adjust them a bit.	
	SetTimer, ChangeActionType, -2000
	return
	}
else
	{
	MsgBox, This shortcut only works on "Deadline to File Opposition (" and "Opposition Filed? (" actions.
	return
	}
	return
	
	ChangeActionType:
	Gui, Opp: Destroy
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	ie.document.getElementByID("fldstrActionType_TextBox").style.color := "black"
	ie.document.getElementByID("fldstrActionType_TextBox").style.fontWeight := "normal"
	ie.document.getElementById("fldstrRemarks").value := ATDate . " Instructions to file opposition in China sent to FA. FA must provide an evidence deadline following filing of the opposition. " . Username . "`n`nApplication Number: " AppNo
	ie.document.getElementById("btnSave").Click()
	return
}


#1::
CleanRemarks:
ie := WBGet()
numActions := cleanedActionDue := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR").length

Loop % numActions
{
Z_Index := A_Index - 1
cleanedActionDue := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[Z_Index].getElementsByTagName("TD")[0].innerHTML  ;getElementsByTagName("font").length
cleanedDueDate 	 := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[Z_Index].getElementsByTagName("TD")[1].innerHTML  ;getElementsByTagName("font").length
cleanedIndicator := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[Z_Index].getElementsByTagName("TD")[2].innerHTML  ;getElementsByTagName("font").length
cleanedDateTaken := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[Z_Index].getElementsByTagName("TD")[3].innerHTML  ;getElementsByTagName("font").length

if (cleanedDateTaken == "&nbsp;")
	cleanedDateTaken := ""
	
cleanedActionDue := StrSplit(cleanedActionDue, "<BR>")

Length1 := StrLen(cleanedActionDue[1])
Length2 := StrLen(cleanedDueDate)
Length3 := StrLen(cleanedIndicator)
Length4 := StrLen(cleanedDateTaken)

Loop % 60 - Length1
	cleanedActionDue[1] .= " "

MsgBox, % cleanedActionDue[1] "`t" cleanedDueDate "`t" cleanedIndicator "`t" cleanedDateTaken

cleanedStuff .= cleanedActionDue[1] "`t" cleanedDueDate "`t" cleanedIndicator "`t" cleanedDateTaken "`n"
}
MsgBox, % cleanedStuff
Clipboard := cleanedStuff
return

; https://www.autohotkey.com/boards/viewtopic.php?t=48322
; https://www.autohotkey.com/boards/viewtopic.php?f=7&t=8978&start=60

#F12::
	olApp := ComObjActive("Outlook.Application")
	olMailItem := olApp.ActiveWindow.CurrentItem
	wdApp := olApp.ActiveInspector.WordEditor.Application
	wdDoc := wdApp.ActiveDocument
	wdTable := wdDoc.Tables.Add(wdDoc.Range(wdApp.Selection.Start,wdApp.Selection.Start), 3, 4, 1, 0) ; Range, NumRows, NumColumns, DefaultTableBehavior, AutoFitBehavior
	wdTable.Cell(1,1).Range.Text := "First Cell"
	wdTable.Cell(3,2).Range.Text := "Three Down, Two Over"
	Clipboard := wdTable
return

#F10::
ie.document.body.insertAdjacentHTML("beforeend", midsection2)
return

InjectActionDue:
WinGetPos, mX, mY, mW, mH, A
ie := WBGet()
INPUTS 	:= ie.document.GetElementsBytagname("INPUT").length
	
Loop %INPUTS%
	{
	Temp := ie.document.GetElementsBytagname("INPUT")[A_Index-1].OuterHTML
	ifInString, Temp, ActDueDate
		break
	}
StringSplit, Temp, Temp, `'
StringSplit, ActionKey, Temp2, =

var := ie.LocationURL ; grab current url
ifinstring, var, patfrmActionDueAgent
	newvar := StrReplace(var, "patfrmActionDueAgent", "patfrmActDueDateAgent", , 1)
else ifinstring, var, CPi/patfrmActionDue
	newvar := StrReplace(var, "patfrmActionDue", "patfrmActDueDate", , 1)
else ifinstring, var, tmkfrmActionDueAgent
	newvar := StrReplace(var, "tmkfrmActionDueAgent", "tmkfrmActDueDateAgent", , 1)	
else ifinstring, var, tmkfrmActionDue
	newvar := StrReplace(var, "tmkfrmActionDue", "tmkfrmActDueDate", , 1)	
else
	{
	;TrayTip, Not in a docketing action., Not in a docketing action.
	return
	}
IfInString, newvar, -1
	StringReplace, newvar, newvar, -1, %newvar%

ActionType := ie.document.getElementById("fldstrActionType_TextBox").value 
BaseDate := ie.document.getElementById("flddteBaseDate").value

	
Gui, blah: New, +AlwaysOnTop +LastFound +OwnDialogs ToolWindow, Action Due Injector
Gui, blah: Add, Button, x5 w210 gNew_Button, ACK (Base Date - 7)
Gui, blah: Add, Button, x5 w210 gNew_Button, CONFIRM (Base Date - 2)
Gui, blah: Add, Button, x5 w210 gNew_Button, FURTHER (Base Date - 2)
Gui, blah: Add, Text, 	x5 w210, `nAction Type: %ActionType%`nBase Date: %BaseDate%	
Gui, blah: Add, ActiveX, x-100 y-100 w10 h10 vblah, Shell.Explorer  	; The final parameter is the name of the ActiveX component.
blah.Navigate(newvar) 
NewX := mX + mW/2 - 120
NewY := mY + mH/2 - 65 
Gui, blah: Show, x%NewX% y%NewY% w220 h150


return

blahGuiClose:
Gui, blah: Destroy

ie.Refresh

return

New_Button:
Gui, blah: Submit
year  := SubStr(BaseDate, 8,4)
month := SubStr(BaseDate, 4,3) 
day   := SubStr(BaseDate, 1,2)
if month = Jan
	newmonth := 01
else if month = Feb
	newmonth := 02
else if month = Mar
	newmonth := 03
else if month = Apr
	newmonth := 04
else if month = May
	newmonth := 05
else if month = Jun
	newmonth := 06
else if month = Jul
	newmonth := 07
else if month = Aug
	newmonth := 08
else if month = Sep
	newmonth := 09
else if month = Oct
	newmonth := 10
else if month = Nov
	newmonth := 11
else if month = Dec
	newmonth := 12

ackDate := year . newmonth . day
blah.document.getElementById("btnNew").Click()
Sleep 1000

if instr(A_GuiControl, "ACK")
	{
	ackDate += -7, days
	FormatTime, BaseDate, %ackDate%, dd-MMM-yyyy
	
	blah.document.getElementsByTagName("INPUT")[3].value 	:= "FA Ack Receipt of Response? / Asst"
	blah.document.getElementsByTagName("INPUT")[4].value 	:= BaseDate
	blah.document.getElementsByTagName("INPUT")[5].value 	:= "Due Date"
	blah.document.getElementsByTagName("TEXTAREA")[0].value := "Docketed 7 days before base date."
	}
else if instr(A_GuiControl, "CONFIRM")
	{
	ackDate += -2, days
	FormatTime, BaseDate, %ackDate%, dd-MMM-yyyy		
	
	blah.document.getElementsByTagName("INPUT")[3].value 	:= "FA Filing Confirmation of Response? / Asst"
	blah.document.getElementsByTagName("INPUT")[4].value 	:= BaseDate
	blah.document.getElementsByTagName("INPUT")[5].value 	:= "Due Date"
	blah.document.getElementsByTagName("TEXTAREA")[0].value := "Docketed 2 days before base date."
	}
else if instr(A_GuiControl, "FURTHER")
	{
	ackDate += -2, days
	FormatTime, BaseDate, %ackDate%, dd-MMM-yyyy	
	blah.document.getElementsByTagName("INPUT")[3].value 	:= "Provide FA with Further Instructions / Atty"
	blah.document.getElementsByTagName("INPUT")[4].value 	:= BaseDate
	blah.document.getElementsByTagName("INPUT")[5].value 	:= "Final"
	blah.document.getElementsByTagName("TEXTAREA")[0].value := "Docketed 2 days before base date."
	}
; blah.document.getElementsByTagName("INPUT")[7].value 	:= ResponseSentDate ; 6 and 9 don't do anything.
; blah.document.getElementsByTagName("INPUT")[8].value 	:= "000"
blah.document.getElementsByTagName("INPUT")[10].checked := true
Sleep 1000

AS := blah.document.GetElementsBytagname("A").length
Loop %AS%
	{
	lookSave:= blah.document.GetElementsBytagname("A")[A_Index-1].OuterHTML
	ifinstring, lookSave , save
		{
		blah.document.GetElementsBytagname("A")[A_Index-1].Click()
		break
		}
	}
while blah.document.getElementById("btnNew").alt == ""					;Wait for page to load
	Sleep, 100
Gui, blah: Destroy

ie.Refresh
return


; http://oc-docketing/CPi/patfrmActDueDate.aspx?key=9947286&bc=1&key2=1275806




CloseDisclosureAuto:
ie := WBGet()
RespAtty := ie.document.getElementById("ABARespAtty").value
ABACloseDate := ie.document.getElementById("ABACloseDate").value
var := ie.LocationURL ; grab current url
	IfInstring, var, CPiAgent
		var := "Agent"
	else IfInstring, var, CPi
		var := "Live"
	else
		{
		TrayTip, Close Disclosure, Not on a docketing page.
		return
		}
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value	

if (ClientCode == "")
	ClientCode := ie.document.getElementByID("fldstrCaseNumber").Value	

qry := "SELECT * FROM dbo.vwAHKMatterInfo WHERE Matter = '" ClientCode "'"
result := ADOSQL(qry)
Sleep 200
invUrl := result[2,7] ;invention url if patent, otherwise black
NewURL := invUrl
Sleep 100
ie.Navigate(NewURL, 32) 
Sleep 500
while ie.busy ; or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
Sleep 1500

if (ie.document.getElementById("fldstrDisclosureStatus_TextBox").Value == "Closed")
	{
	ie.document.getElementById("fldstrDisclosureStatus_TextBox").Value := "Filed"
	ie.document.getElementById("flddteDisclosureDate1").Value := ""	
	}
else
	{
	ie.document.getElementById("fldstrDisclosureStatus_TextBox").Value := "Closed"
;	ie.document.getElementById("flddteDisclosureDate1").Value := ABACloseDate	
	}
ie.document.getElementById("btnSave").Click()
return


CloseAction:
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ABAStatus := ie.document.getElementById("ABAStatus").value
ABACloseDate := ie.document.getElementById("ABACloseDate").value
RespAtty := ie.document.getElementById("ABARespAtty").value
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
ie.document.getElementByID("flddteResponseDate").Value := ABACloseDate
Remarks := ie.document.getElementByID("fldstrRemarks").Value
	if ABAStatus = Pre ABA
		{
		if RespAtty = 
			{
			}
		else
			{
			NewRemarks = %ATDate% Case going abandoned per %RespAtty%. %Username%`n%Remarks% 
			ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
			}
		}
	else if ABAStatus = Abandoned
		{
		if RespAtty = 
			{
			}
		else
			{
			NewRemarks = %ATDate% Case going abandoned per %RespAtty%. %Username%`n%Remarks% 
			ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
			}
		}
	else if ABAStatus = Confirm ABA
		{

		}

ie.document.getElementById("btnSave").Click()
IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
return

UpdateStatus:
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ABAStatus := ie.document.getElementById("ABAStatus").value
ABACloseDate := ie.document.getElementById("ABACloseDate").value
RespAtty := ie.document.getElementById("ABARespAtty").value

if ABAStatus = Pre ABA
	{
	ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := "Pre ABA"
	}
else if ABAStatus = Abandoned
	{
	ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := "Abandoned"
	ie.document.getElementByID("flddteClosedDate").Value := ABACloseDate
	if RespAtty = 
		{
		NewRemarks = %ATDate% Case going abandoned. %Username%`n%Remarks% 
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
		}
	else
		{
		NewRemarks = %ATDate% Case going abandoned per %RespAtty%. %Username%`n%Remarks% 
		ie.document.getElementByID("fldstrRemarks").Value := NewRemar
		}
	}
else if ABAStatus = Confirm ABA
	{
	ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := "Confirm ABA"
	}	
else if ABAStatus = Reactivate
	{
	IsFiledPat := ie.document.getElementByID("flddteFilDate").Value
	IsPublishedPat := ie.document.getElementByID("flddtePubDate").Value		
	IsIssuedPat := ie.document.getElementByID("flddteIssDate").Value	
	
	if (IsIssuedPat != "")
		ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := "Issued"   		; For Patent.
	else if (IsPublishedPat != "")
		ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := "Published"   	; For Patent.	
	else if (IsFiledPat != "")
		ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := "Pending"   		; For Patent.				

	ie.document.getElementByID("flddteClosedDate").Value := ""
	}
ie.document.getElementByID("btnSave").Click()
IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
return

DocketAction:
ie := WBGet()
ABAStatus 	 := ie.document.getElementById("ABAStatus").value
ABACloseDate := ie.document.getElementById("ABACloseDate").value
RespAtty := ie.document.getElementById("ABARespAtty").value
IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
ModifiedSwitchSystem2()
WinActivate, ahk_class IEFrame
gosub DocketNewAction
return


DocketABAAction:
ie := WBGet()
ABAStatus 	 := ie.document.getElementById("ABAStatus").value
ABACloseDate := ie.document.getElementById("ABACloseDate").value
RespAtty := ie.document.getElementById("ABARespAtty").value
IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
ModifiedSwitchSystem2()
WinActivate, ahk_class IEFrame
gosub DocketABAAction2
return

DocketABAAction2:
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
Sleep 1000

IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, RespAtty, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
ActionType := "INT-ABA CLIENT INSTR TO ABA RECVD"

ie.document.getElementByID("flddteBaseDate").Value := ABACloseDate
ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType	
return

DocketNewAction:
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
Sleep 1000

IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, RespAtty, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty

if ABAStatus = Pre ABA
	{
	ActionType := "INT-ABA CC OF ABA INSTR RECVD"
	NewRemarks = %RespAtty%`n
	ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
	}
else if ABAStatus = Abandoned
	{
	ActionType := "INT-ABA INSTRUCTIONS CONFIRMED"
	ie.document.getElementByID("flddteResponseDate").Value := ABACloseDate
	}
else if ABAStatus = Confirm ABA
	{
	ActionType := "INT-ABA CONF REPORTED STATUS"
	}	

ie.document.getElementByID("flddteBaseDate").Value := ABACloseDate
ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType	
return

ModifiedSwitchSystem2()
{
ie := WBGet()
var := ie.LocationURL ; grab current url
;MsgBox, %var%
	IfInstring, var, CPiAgent
		var := "Agent"
	else IfInstring, var, CPi
		var := "Live"
	else
		{
		TrayTip, System Switch, Not on a docketing page.
		return
		}
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value	

if (ClientCode == "")
	ClientCode := ie.document.getElementByID("fldstrCaseNumber").Value	

qry := "SELECT * FROM dbo.vwAHKMatterInfo WHERE Matter = '" ClientCode "'"
result := ADOSQL(qry)
Sleep 100
liveUrl := result[2,5] 		; url in live docketing system
agentUrl := result[2,6] 	; url in agent docketing system

matterId := result[2,2] ;countryapp id or trademark id
system := result[2,4] ;matter type: patent or trademark

if (liveURL != "")
	{
	if (var == "Agent")
		{
		if (system == "Patent")
			NewURL := "http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=-1&key2=" matterId
		else
			NewURL := "http://oc-docketing/CPiAgent/tmkfrmActionDueAgent.aspx?key=-1&key2=" matterId
		}
	else if (var == "Live")
		{
		if (system == "Patent")
			NewURL := "http://oc-docketing/CPi/patfrmActionDue.aspx?key=-1&key2=" matterId
		else
			NewURL := "http://oc-docketing/CPi/tmkfrmActionDue.aspx?key=-1&key2=" matterId
		}
	}
params := [NewURL, 16384]
ie.Navigate(params*)
}

F12::
rowsrows := ie.document.getElementById("dlCountryLaw__ctl0__ctl0_dgLawActions").getElementsByTagName("TR").length
Loop % rowsrows
	{
	source := ie.document.getElementById("dlCountryLaw__ctl0__ctl0_dgLawActions").getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("IMG")[1].src
	
	if InStr(source, "false")
		ie.document.getElementById("dlCountryLaw__ctl0__ctl0_dgLawActions").getElementsByTagName("TR")[A_Index - 1].style.display := "none"
	}
return


Pause::
 GrabAction := ie.document.getElementById("fldstrActionType_TextBox").value
 GrabAction := StrReplace(GrabAction, " ", "+")
 Run, % "http://oc-docketing/CPi/patfrmActionType.aspx?ActionType=" GrabAction

; ie.document.getElementById("DGLocked00").style.width := "300px"
; ie.document.getElementById("mpgMain").style.height := "100%"

return






