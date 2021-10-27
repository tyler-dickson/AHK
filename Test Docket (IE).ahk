; Created with AutoHotkey by Tyler Dickson. 

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases. ; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, pifmgr.dll, 14
Enabled := ComObjError(false)
SetBatchLines, -1
#SingleInstance, Force
#Persistent

; https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplication.aspx?key=225602

; DOCKETING.AHK

SuperEditAutoExtend := ""
isDisabled := ""
respAtty := ""
FormatTime, Today, , yyyyMMdd
FormatTime, TodayStyled, , MM/dd/yyyy
FormatTime, TodayDocket, , dd-MMM-yyyy

HideCPILogo = 1
AddSearchPageLinks = 1
HideExtraButtons = 1
HideExtraTabs = 1
HideCalendarButtons = 1
ResizeBiblioFields = 1
CustomColorBackground = 1
ChangeTabTitle = 1
ColorPastDueDates = 1
ColorCaseStatus = 1
MoveRemarksSection = 1
DocketingQuickTips = 1
NotesSection = 1
EnableSuperEdit = 1
QuickMDActions = 1
ActionInjectors = 1


lastClickedCountry := "EP"

tabNumber = 0
ABAStatus = Abandoned
ABACloseDate := "3/1/2021"

IniRead, NoteInput, C:\Users\%A_Username%\DocketMods.ini, Notes, SavedNotes

if NoteInput = ERROR
	NoteInput = Welcome to DocketMods!`n`nThis notepad will persist even if you restart!`n`nClick Edit to modify your remarks.`n`nMake sure you click Save to store your changes.`n`nControl + S will let you Edit/Save too.
else	
	StringReplace, NoteInput, NoteInput, <br>, `r`n, A	

StoredData := []

Gui, New, AlwaysOnTop ToolWindow, Docketing Scripts 2.0
Gui, Add, Checkbox, vHideCPILogo Checked1, Hide CPI Logo
Gui, Add, Checkbox, vAddSearchPageLinks Checked1, Add Search Page Links
Gui, Add, Checkbox, vHideExtraButtons Checked1, Hide Extra Buttons
Gui, Add, Checkbox, vHideExtraTabs Checked1, Hide Extra Tabs
Gui, Add, Checkbox, vHideCalendarButtons Checked1, Hide Calendar Buttons
Gui, Add, Checkbox, vResizeBiblioFields Checked1, Resize Biblio Fields
Gui, Add, Checkbox, vCustomColorBackground Checked1, Custom Background Color
Gui, Add, Checkbox, vChangeTabTitle Checked1, Change Tab Titles
Gui, Add, Checkbox, vColorPastDueDates Checked1, Highlight Past Due Dates
Gui, Add, Checkbox, vColorCaseStatus Checked1, Color Case Statuses
Gui, Add, Checkbox, vMoveRemarksSection Checked1, Move Remarks Section
Gui, Add, Checkbox, vDocketingQuickTips Checked1, Insert Quick Tips
Gui, Add, Checkbox, vNotesSection Checked1, Insert Notes Section
Gui, Add, Checkbox, vEnableSuperEdit Checked1, Enable SuperEdit 2.0
Gui, Add, Checkbox, xp+25 yp+20 vQuickMDActions Checked1, Quick MD Options
Gui, Add, Checkbox, xp yp+20 vActionInjectors Checked1, Action Injectors
Gui, Add, Button, xp-25 yp+20 w150 gStartScript, Submit
Gui, Show
return


StartScript:
Gui, Submit
SetTimer, ModifyPage, 16
return

ModifyPage:
ie := WBGet()
hiddenValue := ie.document.getElementById("hiddenButton").value
shortcutBarCheck := ie.document.getElementById("systemSwitch").value

shortcutBar =
(
<input type="button" id="systemSwitch"    value1="0" value="System Switch" onclick="this.value1 = 1" style="white-space: normal; word-wrap: break-word; width: 70px; height: 60px;">
<input type="button" id="createNewAction" value1="0" value="Create Action" onclick="this.value1 = 1" style="white-space: normal; word-wrap: break-word; width: 70px; height: 60px;">
<input type="button" id="insertNewAction" value1="0" value="Insert Action" onclick="this.value1 = 1" style="white-space: normal; word-wrap: break-word; width: 70px; height: 60px;">
<input type="button" id="" disabled value1="0" value="TBD TBD" onclick="this.value1 = 1" style="text-align: center; white-space: normal; word-wrap: break-word; width: 70px; height: 60px;">


)

; <input type="button" id="moveRemarks" value1="0" value="Hide Remarks" onclick="this.value1 = 1" style="white-space: normal; word-wrap: break-word; width: 80px; height: 60px;">

remarksBar =
(
<table width="100`%">
	<td>
		<input type="button" id="editRemarks" value1="0" value="Edit" style="width:60px; height: 30px;" onclick="document.getElementById('ctl00_Detail_EditButton_input').click();">
		<input type="button" id="saveRemarks" value1="0" value="Save" style="width:60px; height: 30px;" onclick="try{document.getElementById('ctl00_Detail_InsertButton_input').click();} catch(err){document.getElementById('ctl00_Detail_UpdateButton_input').click();}">
		<input type="button" id="undoRemarks" value1="0" value="Undo" style="width:60px; height: 30px;" onclick="document.getElementById('ctl00_Detail_UpdateCancelButton_input').click();">
		
		&nbsp; &nbsp;
		
		<input type="button" id="insertRemarks" value1="0" value="Insert Space" style="width:95px; height: 30px;" onclick="var temp = document.getElementById('ctl00_Detail_Remarks').value; document.getElementById('ctl00_Detail_Remarks').value = '\r\n' + temp; getElementById('ctl00_Detail_Remarks').focus();">

		&nbsp; &nbsp;

		<input type="button" id="appFiledRemarks" value1="0" value="App Filed" style="width:80px; height: 30px;" onclick="var temp = document.getElementById('ctl00_Detail_Remarks').value; document.getElementById('ctl00_Detail_Remarks').value = '%TodayStyled% - FA confirm app filed. -TDICKSON\r\n' + temp; getElementById('ctl00_Detail_Remarks').focus();">
		<input type="button" id="filingReceiptRemarks" value1="0" value="Filing Receipt" style="width:105px; height: 30px;" onclick="var temp = document.getElementById('ctl00_Detail_Remarks').value; document.getElementById('ctl00_Detail_Remarks').value = '%TodayStyled% - Filing receipt recvd. -TDICKSON\r\n' + temp; getElementById('ctl00_Detail_Remarks').focus();">
		<input type="button" id="responseInstrSentRemarks" value1="0" value="Instr Sent to FA" style="width:115px; height: 30px;" onclick="var temp = document.getElementById('ctl00_Detail_Remarks').value; document.getElementById('ctl00_Detail_Remarks').value = '%TodayStyled% - Response instructions sent to FA. -TDICKSON\r\n' + temp; getElementById('ctl00_Detail_Remarks').focus();">

		&nbsp; &nbsp;
		
		<input type="button" id="POASentRemarks" value1="0" value="POA" style="width:50px; height: 30px;" onclick="var temp = document.getElementById('ctl00_Detail_Remarks').value; document.getElementById('ctl00_Detail_Remarks').value = '%TodayStyled% - POA sent to FA. -TDICKSON\r\n' + temp; getElementById('ctl00_Detail_Remarks').focus();">
		<input type="button" id="AssignmentSentRemarks" value1="0" value="Assignment" style="width:90px; height: 30px;" onclick="var temp = document.getElementById('ctl00_Detail_Remarks').value; document.getElementById('ctl00_Detail_Remarks').value = '%TodayStyled% - Assignment sent to FA. -TDICKSON\r\n' + temp; getElementById('ctl00_Detail_Remarks').focus();">
		<input type="button" id="PriorityDocsSentRemarks" value1="0" value="P.D." style="width:45px; height: 30px;" onclick="var temp = document.getElementById('ctl00_Detail_Remarks').value; document.getElementById('ctl00_Detail_Remarks').value = '%TodayStyled% - Priority Docs sent to FA. -TDICKSON\r\n' + temp; getElementById('ctl00_Detail_Remarks').focus();">
		
	
	</td>
	<td align="right">
		<input type="button" id="insertResponseDate" value1="0" value="Quick Close" style="width:90px; height: 30px;" onclick="this.value1 = '1';">
		<input type="button" id="hideRemarks" value1="0" value="Hide Remarks" style="width:110px; height: 30px;" onclick="this.value1 = 1;">
	</td>
</table>
)



if (ie.document.getElementById("ctl00_Detail_UpdateButton_input").value == "Save")
	{
	ie.document.getElementById("editRemarks").disabled := true
	ie.document.getElementById("insertRemarks").disabled := false
	ie.document.getElementById("saveRemarks").disabled := false
	ie.document.getElementById("undoRemarks").disabled := false
	ie.document.getElementById("appFiledRemarks").disabled := false
	ie.document.getElementById("filingReceiptRemarks").disabled := false
	ie.document.getElementById("responseInstrSentRemarks").disabled := false
	ie.document.getElementById("insertResponseDate").disabled := false
	ie.document.getElementById("POASentRemarks").disabled := false
	ie.document.getElementById("AssignmentSentRemarks").disabled := false 
	ie.document.getElementById("PriorityDocsSentRemarks").disabled := false
	}
else if (ie.document.getElementById("ctl00_Detail_EditButton_input").value == "Edit")
	{
	ie.document.getElementById("editRemarks").disabled := false
	ie.document.getElementById("insertRemarks").disabled := true
	ie.document.getElementById("saveRemarks").disabled := true
	ie.document.getElementById("undoRemarks").disabled := true
	ie.document.getElementById("appFiledRemarks").disabled := true
	ie.document.getElementById("filingReceiptRemarks").disabled := true	
	ie.document.getElementById("responseInstrSentRemarks").disabled := true
	ie.document.getElementById("insertResponseDate").disabled := true
	ie.document.getElementById("POASentRemarks").disabled := true
	ie.document.getElementById("AssignmentSentRemarks").disabled := true
	ie.document.getElementById("PriorityDocsSentRemarks").disabled := true
	}

checkInsertResponseSentDate := ie.document.getElementById("insertResponseDate").value1
if (checkInsertResponseSentDate == "1")
	{
	ie.document.getElementById("insertResponseDate").value1 := 0
	ie.document.getElementById("ctl00_Detail_tplFormview_ResponseDate_dateInput").value := TodayStyled
	ie.document.getElementById("ctl00_Detail_tplFormview_ResponseDate_dateInput").focus()
	ie.document.getElementById("ctl00_Detail_tplFormview_ResponseDate_dateInput").click()
	InsertResponseSentDate(TodayStyled)
	ie.document.getElementById("ctl00_Detail_UpdateButton_input").focus()
	ie.document.getElementById("ctl00_Detail_UpdateButton_input").click()
	}

/*

countryLink =
(
<a id="countryLink" href="patfrmCountryApplication.aspx?key=225602">Country Application</a>
)

; <input type="button" id="inventionScreen" value="Invention" value1="0" onclick="this.value1 = 1;" style="background: none!important; border: none; padding: 0!important; color:#069; text-decoration: underline; cursor: pointer;">
; <input type="button" id="countryApp" value="Country Application" value1="0" onclick="this.value1 = 1;" style="background: none!important; border: none; padding: 0!important; color:#069; text-decoration: underline; cursor: pointer;">

; https://web05.computerpackages.com/knobbe/patent/patfrmActionDue.aspx?key=3155192&appId=225602
; https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplication.aspx?key=225602&tab=actions

*/

; Check if AttyFinder button exists.
checkAttyFinder := ie.document.getElementById("attyFinder").value
if (checkAttyFinder == "")
	{
	attyFinder = 
	(
	&nbsp;
	<input type="button" id="attyFinder" style="height: 20px;" value="AttyFinder" value1="0" onclick="this.value1 = 1;">
	)
	ie.document.getElementById("ctl00_Detail_tplFormview_Attorneys").insertAdjacentHTML("afterend", attyFinder)
	ie.document.getElementById("ctl00_Detail_rgdAttorney_ctl00_ctl02_ctl00_InitInsertButton").insertAdjacentHTML("afterend", attyFinder)
	
	;currentAction := ie.document.getElementById("ctl00_Detail_tplFormview_ActionType_Input").value
	
	;newHTML =
	;(
	;<input name="ctl00$Detail$tplFormview$ActionType" value="%currentAction%" class="rcbInput radPreventDecorate" id="ctl00_Detail_tplFormview_ActionType_Input" type="text" maxlength="60" oninput="this.value = this.value.toUpperCase();" autocomplete="off">
	;)
	
	;if (!CopyingAction)
		; ie.document.getElementById("ctl00_Detail_tplFormview_ActionType_Input").outerHTML := newHTML
	}
	
; Hide CPI logo
if (HideCPILogo)
	ie.document.getElementById("logo_status").outerHTML := ""

if (hiddenValue == "")
	{
	if InStr(ie.LocationURL, "pat")
		{
		colorPat := "yellow"
		colorTM  := "white"
		}
	else if InStr(ie.LocationURL, "tmk")	
		{
		colorPat := "white"
		colorTM  := "yellow"
		}		
	
	
	if InStr(ie.LocationURL, "web05bak")
		{
		searchPageLinks =
		(
		<input type="button" id="hiddenButton" value1="0" value="0" style="width:0px; height: 0px; display: none;">
		&nbsp;&nbsp;&nbsp;
		<a style="color: black; font-weight: bold;" href="https://web05.computerpackages.com/knobbe/patent/patschcountryapplication.aspx">AGENT</a>
		&nbsp;&nbsp;&nbsp;	
		<a style="color: %colorPat%; font-weight: bold;" href="https://web05bak.computerpackages.com/knobbeAgent/patent/patschcountryapplication.aspx">Patent Search</a>
		&nbsp;
		<a style="color: %colorPat%; font-weight: bold;" href="https://web05bak.computerpackages.com/knobbeAgent/patent/patschActionDue.aspx">Patent Actions Due Search</a>
		&nbsp;
		<a style="color: %colorPat%; font-weight: bold;" href="https://web05bak.computerpackages.com/knobbeAgent/patent/patschInvention.aspx">Patent Invention Search</a>

		&nbsp;&nbsp;&nbsp;
		<a style="color: %colorTM%; font-weight: bold;" href="https://web05bak.computerpackages.com/knobbeAgent/trademark/tmkschTrademark.aspx">Trademark Search</a>
		&nbsp;
		<a style="color: %colorTM%; font-weight: bold;" href="https://web05bak.computerpackages.com/knobbeAgent/trademark/tmkschActionDue.aspx">Trademark Actions Due Search</a>
		)
		}
	else
		{
		searchPageLinks =
		(
		<input type="button" id="hiddenButton" value1="0" value="0" style="width:0px; height: 0px; display: none;">
		&nbsp;&nbsp;&nbsp;
		<a style="color: black; font-weight: bold;" href="https://web05bak.computerpackages.com/knobbeAgent/patent/patschcountryapplication.aspx">LIVE</a>
		&nbsp;&nbsp;&nbsp;
		<a style="color: %colorPat%; font-weight: bold;" href="https://web05.computerpackages.com/knobbe/patent/patschcountryapplication.aspx">Patent Search</a>
		&nbsp;
		<a style="color: %colorPat%; font-weight: bold;" href="https://web05.computerpackages.com/knobbe/patent/patschActionDue.aspx">Patent Actions Due Search</a>
		&nbsp;
		<a style="color: %colorPat%; font-weight: bold;" href="https://web05.computerpackages.com/knobbe/patent/patschInvention.aspx">Patent Invention Search</a>

		&nbsp;&nbsp;&nbsp;
		<a style="color: %colorTM%; font-weight: bold;" href="https://web05.computerpackages.com/knobbe/trademark/tmkschTrademark.aspx">Trademark Search</a>
		&nbsp;
		<a style="color: %colorTM%; font-weight: bold;" href="https://web05.computerpackages.com/knobbe/trademark/tmkschActionDue.aspx">Trademark Actions Due Search</a>
		)
		}	

	if (AddSearchPageLinks)
		{
		ie.document.getElementById("ctl00_mainMenu").getElementsByTagName("UL")[0].insertAdjacentHTML("afterbegin", searchPageLinks)
		tabNumber = 0
		}
	}
	
if (shortcutBarCheck == "")
	{
	ie.document.getElementsByTagName("HR")[1].insertAdjacentHTML("beforebegin", shortcutBar)
	}
	
; Hide extra buttons.
if (HideExtraButtons)
	{
	ie.document.getElementById("ctl00_Detail_QuickEmailButton").style.display := "none"
	ie.document.getElementById("ctl00_Detail_LetterButton").style.display := "none"	
	ie.document.getElementById("ctl00_Detail_PrePrintButton").style.display := "none"	
	ie.document.getElementById("ctl00_Detail_SearchButton").style.display := "none"	
	}

; Hide calendar buttons.
if (HideCalendarButtons)
	{
	Loop % ie.document.getElementsByClassName("rcCalPopup").length
		{
		ie.document.getElementsByClassName("rcCalPopup")[A_Index - 1].style.display := "none"
		}
	}

; Resize bibliographic fields.
	;TM related
if (ResizeBiblioFields)
	{
	gosub FixBiblio
	}

	; Hide extra tabs.
if (HideExtraTabs)
	{
	Loop % ie.document.getElementsByClassName("rtsLI").length
		{
		if InStr(ie.document.getElementsByClassName("rtsLI")[A_Index - 1].textContent, "Licenses")
			ie.document.getElementsByClassName("rtsLI")[A_Index - 1].style.display := "none"
		if InStr(ie.document.getElementsByClassName("rtsLI")[A_Index - 1].textContent, "Images/Links")
			ie.document.getElementsByClassName("rtsLI")[A_Index - 1].style.display := "none"		
		if InStr(ie.document.getElementsByClassName("rtsLI")[A_Index - 1].textContent, "Docs Out")
			ie.document.getElementsByClassName("rtsLI")[A_Index - 1].style.display := "none"
		if InStr(ie.document.getElementsByClassName("rtsLI")[A_Index - 1].textContent, "Public Data")
			ie.document.getElementsByClassName("rtsLI")[A_Index - 1].style.display := "none"
		if InStr(ie.document.getElementsByClassName("rtsLI")[A_Index - 1].textContent, "Keywords")
			ie.document.getElementsByClassName("rtsLI")[A_Index - 1].style.display := "none"		
		if InStr(ie.document.getElementsByClassName("rtsLI")[A_Index - 1].textContent, "Costs")
			ie.document.getElementsByClassName("rtsLI")[A_Index - 1].style.display := "none"			
		if InStr(ie.document.getElementsByClassName("rtsLI")[A_Index - 1].textContent, "Conflicts")
			ie.document.getElementsByClassName("rtsLI")[A_Index - 1].style.display := "none"	
		if InStr(ie.document.getElementsByClassName("rtsLI")[A_Index - 1].textContent, "Images")
			ie.document.getElementsByClassName("rtsLI")[A_Index - 1].style.display := "none"
		if InStr(ie.document.getElementsByClassName("rtsLI")[A_Index - 1].textContent, "Assignments")
			ie.document.getElementsByClassName("rtsLI")[A_Index - 1].style.display := "none"		
		if InStr(ie.document.getElementsByClassName("rtsLI")[A_Index - 1].textContent, "Related Matter")
			ie.document.getElementsByClassName("rtsLI")[A_Index - 1].style.display := "none"	
		if InStr(ie.document.getElementsByClassName("rtsLI")[A_Index - 1].textContent, "Web Links")
			ie.document.getElementsByClassName("rtsLI")[A_Index - 1].style.display := "none"	
		if InStr(ie.document.getElementsByClassName("rtsLI")[A_Index - 1].textContent, "Weblinks")
			ie.document.getElementsByClassName("rtsLI")[A_Index - 1].style.display := "none"
		}
		
	remarksSpace =
	(		
	<div style="text-align: left;">
	<input type="button" id="editRemarksMain" value1="0" value="Edit" style="width:60px; height: 30px;" onclick="document.getElementById('ctl00_Detail_EditButton_input').click();">
	<input type="button" id="insertRemarksMain" value1="0" value="Insert Space" style="width:95px; height: 30px;" onclick="var temp = document.getElementById('ctl00_Detail_Remarks').value; document.getElementById('ctl00_Detail_Remarks').value = '\r\n' + temp; getElementById('ctl00_Detail_Remarks').focus();">
	</div>
	)
	
	checkRemarksButton := ie.document.getElementById("insertRemarksMain").id
	if (checkRemarksButton == "" && !InStr(ie.LocationURL, "ActionDue"))
		{
		ie.document.getElementById("ctl00_Detail_Remarks").insertAdjacentHTML("afterend", remarksSpace)
		ie.document.getElementById("ctl00_Detail_Remarks").style.fontSize := "20px"
		ie.document.getElementById("ctl00_Detail_Remarks").rows := "11"
		}
	}

; Insert Docketing Quick Tips
if (DocketingQuickTips)
	{
	checkDocketingQuickTips := ie.document.getElementById("docketingQuickTips").id
	if (checkDocketingQuickTips == "")
		{
		Country := ie.document.getElementById("ctl00_Detail_Country_Input").value
		QuickTips := "Quick Tips: None currently. Have any good tips for this particular country?"
		if InStr(ie.LocationURL, "CountryApplication")
			{

			
			
			
			}
		else if InStr(ie.LocationURL, "tmkfrmTrademark")
			{
			if (Country == "NZ")
				QuickTips := "NZ - If claiming priority, the Filing Date should match the Priority Date."		
			
			
			
			}	
		else if InStr(ie.LocationURL, "Invention")	
			{
			QuickTips := "Invention Screen - Can't tell what country you're on..."
			}

		quickTips =
		(
		<input type="text" unselectable="on" readonly id="docketingQuickTips" style="text-align: center; height: 25px; width: 99`%; color: black; background-color: #E4E4E4; border: 1px solid black;" value="%QuickTips%">
		)
		
	;	if InStr(ie.LocationURL, "CountryApplication") || InStr(ie.LocationURL, "tmkfrmTrademark")
	;		ie.document.getElementById("ctl00_Detail_Buttons").getElementsByTagName("TABLE")[0].getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[0].getElementsByTagname("TD")[0].insertAdjacentHTML("beforebegin", quickTips)
		}
	}
	
	
; Change color of docketing background.
if (CustomColorBackground)
	{
	if InStr(ie.LocationURL, "web05bak")
		ie.document.getElementById("content").style.backgroundColor := "lemonchiffon"
	else
		ie.document.getElementById("content").style.backgroundColor := "#abcdef"	
	}

; Change title of tab.
if (ChangeTabTitle)
	{
	if InStr(ie.LocationURL, "ActionDueAgent")
		ie.document.title := ie.document.getElementById("ctl00_Detail_tplFormview_CaseNumber").Value " | AT"	
	else 	if InStr(ie.LocationURL, "ActionDue")
		ie.document.title := ie.document.getElementById("ctl00_Detail_tplFormview_CaseNumber").Value " | Live"	
	else if InStr(ie.LocationURL, "patfrmCountryApplicationAgent")
		ie.document.title := ie.document.getElementById("ctl00_Detail_CaseNumber").Value " | AT"
	else if InStr(ie.LocationURL, "patfrmCountryApplication")
		ie.document.title := ie.document.getElementById("ctl00_Detail_CaseNumber").Value " | Live"
	else if InStr(ie.LocationURL, "patfrmInventionAgent")
		ie.document.title := ie.document.getElementById("ctl00_Detail_CaseNumber").Value " | AT"
	else if InStr(ie.LocationURL, "patfrmInvention")
		ie.document.title := ie.document.getElementById("ctl00_Detail_CaseNumber").Value " | Live"	
	else if InStr(ie.LocationURL, "tmkfrmtrademarkAgent")
		ie.document.title := ie.document.getElementById("ctl00_Detail_CaseNumber").Value " | AT"
	else if InStr(ie.LocationURL, "tmkfrmtrademark")
		ie.document.title := ie.document.getElementById("ctl00_Detail_CaseNumber").Value " | Live"
	else
		{
		
		}
	}
		
; Color past due dates.
if (ColorPastDueDates)
	{
	if InStr(ie.LocationURL, "ActionDue")
		{
		dueDateRows := ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00").getElementsByTagName("TBODY")[0].getElementsByTagName("TR").length
		Loop % dueDateRows
			{
			temp := ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("TD")[1].innerText
			temp := ReplaceMonth(temp)

			if (temp < Today)
				ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("TD")[1].style.color := "red"
			}
		}
	else if InStr(ie.LocationURL, "CountryApplication") || InStr(ie.LocationURL, "Trademark")
		{
		dueDateRows := ie.document.getElementById("ctl00_Detail_rgdAction_ctl00").getElementsByTagName("TBODY")[0].getElementsByTagName("TR").length
		Loop % dueDateRows
			{
			temp := ie.document.getElementById("ctl00_Detail_rgdAction_ctl00").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("TD")[1].innerText
			temp := ReplaceMonth(temp)

			if (temp < Today)
				ie.document.getElementById("ctl00_Detail_rgdAction_ctl00").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("TD")[1].style.color := "red"
			}
		}
	}
	
; Color the case status.
if (ColorCaseStatus)
	{
	if InStr(ie.LocationURL, "patfrm")
		{
		if (ie.document.getElementById("ctl00_Detail_ApplicationStatus_Input").value == "Issued")
			{
			ie.document.getElementById("ctl00_Detail_ApplicationStatus_Input").style.backgroundColor := "#40e350"
			ie.document.getElementById("ctl00_Detail_CaseNumber_Input").style.backgroundColor := "#40e350"
			}
		else if (ie.document.getElementById("ctl00_Detail_ApplicationStatus_Input").value == "Pend Tran")
			{
			ie.document.getElementById("ctl00_Detail_ApplicationStatus_Input").style.backgroundColor := "#fffa5e"
			ie.document.getElementById("ctl00_Detail_CaseNumber_Input").style.backgroundColor := "#fffa5e"
			}
		else if (ie.document.getElementById("ctl00_Detail_tplFormview_ApplicationStatus").value == "Issued")
			{
			ie.document.getElementById("ctl00_Detail_tplFormview_ApplicationStatus").style.backgroundColor := "#40e350"
			ie.document.getElementById("ctl00_Detail_tplFormview_CaseNumber").style.backgroundColor := "#40e350"
			}
		else if (ie.document.getElementById("ctl00_Detail_tplFormview_ApplicationStatus").value == "Pend Tran")
			{
			ie.document.getElementById("ctl00_Detail_tplFormview_ApplicationStatus").style.backgroundColor := "#fffa5e"
			ie.document.getElementById("ctl00_Detail_tplFormview_CaseNumber").style.backgroundColor := "#fffa5e"
			}		
		}
	else if InStr(ie.LocationURL, "tmkfrm")
		{
		if (ie.document.getElementById("ctl00_Detail_TrademarkStatus_Input").value == "Registered")
			{
			ie.document.getElementById("ctl00_Detail_TrademarkStatus_Input").style.backgroundColor := "#40e350"
			ie.document.getElementById("ctl00_Detail_CaseNumber").style.backgroundColor := "#40e350"
			}
		else if (ie.document.getElementById("ctl00_Detail_TrademarkStatus_Input").value == "Pend Tran")
			{
			ie.document.getElementById("ctl00_Detail_TrademarkStatus_Input").style.backgroundColor := "#fffa5e"
			ie.document.getElementById("ctl00_Detail_CaseNumber").style.backgroundColor := "#fffa5e"
			}
		else if (ie.document.getElementById("ctl00_Detail_tplFormview_TrademarkStatus").value == "Registered")
			{
			ie.document.getElementById("ctl00_Detail_tplFormview_TrademarkStatus").style.backgroundColor := "#40e350"
			ie.document.getElementById("ctl00_Detail_tplFormview_CaseNumber").style.backgroundColor := "#40e350"
			}
		else if (ie.document.getElementById("ctl00_Detail_tplFormview_TrademarkStatus").value == "Pend Tran")
			{
			ie.document.getElementById("ctl00_Detail_tplFormview_TrademarkStatus").style.backgroundColor := "#fffa5e"
			ie.document.getElementById("ctl00_Detail_tplFormview_CaseNumber").style.backgroundColor := "#fffa5e"
			}
		}
	}
	
; Check if AttyFinder was clicked.
attyFinderCheck := ie.document.getElementById("attyFinder").value1
if (attyFinderCheck == "1")
	{
	ie.document.getElementById("attyFinder").value1 := "0"
	
	Attorneys := []
	if InStr(ie.LocationURL, "ActionDue")
		{
		Attorneys := ie.document.getElementById("ctl00_Detail_tplFormview_Attorneys").value
		Attorneys := StrReplace(Attorneys, " ", "")
		Attorneys := StrSplit(Attorneys, ",")
		}
	else
		{
		Loop % ie.document.getElementById("ctl00_Detail_rgdAttorney_ctl00").getElementsByTagName("TBODY")[0].getElementsByTagName("TR").length
			Attorneys.Push(ie.document.getElementById("ctl00_Detail_rgdAttorney_ctl00").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("TD")[0].innerText)
		}

	Loop % Attorneys.Length()
		{
		Attorneys[A_Index] := SubStr(Attorneys[A_Index], 1, 3)
		
		}
	AttyFinder(Attorneys)
	}
	
attyInjectorCheck := ie.document.getElementById("attyInjector").value1
if (attyInjectorCheck == "1")
	{
	ie.document.getElementById("attyInjector").value1 := "0"

	NewAtty := "LXH"
	NewType := "TMPL"
	

	ie.document.getElementById("ctl00_Detail_rgdAttorney_ctl00_ctl02_ctl02_AttorneyName_Input").value := NewAtty
	ie.document.getElementById("ctl00_Detail_rgdAttorney_ctl00_ctl02_ctl02_AttorneyName_ClientState").value := "{'logEntries':[],'value':'" NewAtty "','text':'" NewAtty "','enabled':true,'checkedIndices':[],'checkedItemsTextOverflows':false}"

	ie.document.getElementById("ctl00_Detail_rgdAttorney_ctl00_ctl02_ctl02_AttorneyType_Input").value := NewType
	ie.document.getElementById("ctl00_Detail_rgdAttorney_ctl00_ctl02_ctl02_AttorneyType_ClientState").value := "{'logEntries':[],'value':'" NewType "','text':'" NewType "','enabled':true,'checkedIndices':[],'checkedItemsTextOverflows':false}"


	}

	
; Check if System Switch was clicked.	
sysSwitchCheck := ie.document.getElementById("systemSwitch").value1
if (sysSwitchCheck == "1")
	{
	ie.document.getElementById("systemSwitch").value1 := "0"
	SystemSwitch(ie.LocationURL)
	}
	
createNewActionCheck := ie.document.getElementById("createNewAction").value1
if (createNewActionCheck == "1")
	{
	ie.document.getElementById("createNewAction").value1 := "0"
	StoredData := []
	StoredData.Push(ie.document.getElementById("ctl00_Detail_tplFormview_CaseNumber").value)
	StoredData.Push(ie.document.getElementById("ctl00_Detail_tplFormview_Country").value)
	StoredData.Push(ie.document.getElementById("ctl00_Detail_tplFormview_SubCase").value)
	StoredData.Push(ie.document.getElementById("ctl00_Detail_tplFormview_ActionType").value)
	StoredData.Push(ie.document.getElementById("ctl00_Detail_tplFormview_BaseDate").value)
	StoredData.Push(ie.document.getElementById("ctl00_Detail_tplFormview_ResponseDate").value)
	StoredData.Push(ie.document.getElementById("ctl00_Detail_Remarks").value)
	
	
	temp := ie.LocationURL
	temp := StrSplit(temp, "&")

	if InStr(ie.LocationURL, "patfrm")	
		OutputVar := "https://web05bak.computerpackages.com/knobbeAgent/patent/patfrmActionDue.aspx?key=-1&" temp[2]
	else
		OutputVar := "https://web05bak.computerpackages.com/knobbeAgent/trademark/tmkfrmActionDue.aspx?key=-1&" temp[2]	
		
	params := [OutputVar, 2048]
	ie.Navigate(params*)
	return
	}

insertNewActionCheck := ie.document.getElementById("insertNewAction").value1
if (insertNewActionCheck == "1")
	{
	ie.document.getElementById("insertNewAction").value1 := "0"
	ie.document.getElementById("ctl00_Detail_tplFormview_CaseNumber_Input").value := StoredData[1]
	ie.document.getElementById("ctl00_Detail_tplFormview_Country_Input").value := StoredData[2]
	ie.document.getElementById("ctl00_Detail_tplFormview_SubCase_Input").value := StoredData[3]
	ie.document.getElementById("ctl00_Detail_tplFormview_ActionType_Input").value := StoredData[4]
	ie.document.getElementById("ctl00_Detail_tplFormview_BaseDate_dateInput").value := StoredData[5]
	ie.document.getElementById("ctl00_Detail_tplFormview_BaseDate_dateInput").focus()
	ie.document.getElementById("ctl00_Detail_tplFormview_ResponseDate_dateInput").value := StoredData[6]
	ie.document.getElementById("ctl00_Detail_Remarks").value := StoredData[7]

	ie.document.getElementById("ctl00_Detail_tplFormview_ActionType_Input").click()
	Sleep 200
	ActionType := ie.document.getElementById("ctl00_Detail_tplFormview_ActionType_Input").value
	Sleep 200
	ie.document.getElementById("ctl00_Detail_tplFormview_ActionType_ClientState").value := "{'logEntries':[],'value':'" ActionType "','text':" ActionType ",'enabled':true,'checkedIndices':[],'checkedItemsTextOverflows':false}"  ; GRAB value
	ie.document.getElementById("ctl00_Detail_tplFormview_ActionType_Arrow").click()
	ie.document.getElementById("ctl00_Detail_tplFormview_BaseDate_dateInput").focus()
	}	

; Check if remarks hider was clicked.
hideRemarksCheck := ie.document.getElementById("hideRemarks").value1
if (hideRemarksCheck == "1")
	{
	ie.document.getElementById("hideRemarks").value1 := "0"
	
	; Hide Remarks text.
	Loop % ie.document.getElementsByClassName("DetailRemarks").length
		ie.document.getElementsByClassName("DetailRemarks")[A_Index - 1].innerText := ""

	; Hide attorney initials.
	Loop % ie.document.getElementsByClassName("rgRow").length
		ie.document.getElementsByClassName("rgRow")[A_Index - 1].getElementsByTagName("TD")[4].innerText := ""
	
	Loop % ie.document.getElementsByClassName("rgAltRow").length
		ie.document.getElementsByClassName("rgAltRow")[A_Index - 1].getElementsByTagName("TD")[4].innerText := ""
	
	; Hide checkboxes.
;	Loop % ie.document.querySelectorAll("input[type=checkbox]").length
;		ie.document.querySelectorAll("input[type=checkbox]")[A_Index - 1].style.display := "none"
	
	; Hide images.
;	Loop % ie.document.querySelectorAll("input[type=image]").length - 4
;		ie.document.querySelectorAll("input[type=image]")[A_Index - 1].style.display := "none"

	; Hide images and checkbox TDs.
	Loop % ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00").getElementsByTagName("TR").length
		{
		ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00").getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("TD")[6].outerHTML := ""
		ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00").getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("TD")[6].outerHTML := ""
		ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00").getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("TD")[6].outerHTML := ""
		ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00").getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("TD")[1].style.width := "125px"
		ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00").getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("TD")[3].style.width := "125px"
		}
		
	}

	
; Move the Remarks section under the Actions Due.
if (MoveRemarksSection)
	{
	if InStr(ie.LocationURL, "ActionDue")	
		{
		; Modify the Remarks HTML for grabbing later.
		ie.document.getElementById("ctl00_Detail_Remarks").style.border := "1px solid black"
		ie.document.getElementById("ctl00_Detail_Remarks").className := ""
		ie.document.getElementById("ctl00_Detail_Remarks").style.height := "100px"	
		
		; These change the Actions Due grid to fit better.
		ie.document.getElementById("ctl00_Detail_DueDatesView").className := "rmpView"
		ie.document.getElementById("ctl00_Detail_DueDatesView").getElementsByTagName("DIV")[0].className := ""
		ie.document.getElementById("ctl00_Detail_DueDatesView").style.height := "100%"
		ie.document.getElementById("ctl00_Detail_DueDatesView").style.width := "100%"
		ie.document.getElementById("ctl00_Detail_DueDatesView").style.overflow := "hidden"
		ie.document.getElementById("ctl00_Detail_rgdActionDueDate_GridData").style.height := "100%"
		ie.document.getElementById("ctl00_Detail_rgdActionDueDate_GridData").style.width := "100%"
		ie.document.getElementById("ctl00_Detail_rgdActionDueDate").style.height := "100%"
		ie.document.getElementById("ctl00_Detail_rgdActionDueDate").style.width := "100%"
		ie.document.getElementById("ctl00_Detail_tplMultiPageMain").style.border := "1px solid black"
		
		if (ie.document.getElementById("ctl00_Detail_Remarks").value1 == "")
			{
			remarksHTML := ie.document.getElementById("ctl00_Detail_Remarks").outerHTML
			ie.document.getElementById("ctl00_Detail_Remarks").outerHTML := ""
			ie.document.getElementById("ctl00_Detail_DueDatesView").insertAdjacentHTML("afterend", remarksBar . remarksHTML)
			ie.document.getElementById("ctl00_Detail_Remarks").value1 := "0"
			ie.document.getElementById("ctl00_Detail_Remarks").style.width := "99.8%"
			
			; Hide Remarks tab. Maybe not since sometimes the Remarks don't move correctly.	
			Loop % ie.document.getElementsByClassName("rtsLI").length
				{
				if InStr(ie.document.getElementsByClassName("rtsLI")[A_Index - 1].innerText, "Remarks")
					ie.document.getElementsByClassName("rtsLI")[A_Index - 1].style.display := "none"
				}
			}
		}
	else
		{
		ie.document.getElementById("ctl00_Detail_ActionsView").getElementsByTagName("DIV")[0].className := ""
		ie.document.getElementById("ctl00_Detail_ActionsView").getElementsByTagName("DIV")[0].style.paddingLeft := "0px"
		ie.document.getElementById("ctl00_Detail_ActionsView").style.height := "100%"
		ie.document.getElementById("ctl00_Detail_rgdAction").style.width := "99.8%"
		ie.document.getElementById("ctl00_Detail_rgdAction_GridData").style.overflowx := "hidden"
		}
	}

	
	
if (NotesSection) ; Exception List
	{
	URL := ie.LocationURL 
	if InStr(URL, "ActionDue")
		ClientCodeNew := ie.document.getElementById("ctl00_Detail_tplFormview_CaseNumber").Value
	else
		ClientCodeNew := ie.document.getElementById("ctl00_Detail_CaseNumber").Value
	
	if InStr(ClientCodeNew, "DOCKETING")
		exceptionInfo := "DOCKETING: This is some text exception list info."
	else
		exceptionInfo := "No exception found."	
	

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
	<input type="button" id="ABAClientInstr" style="display: none; width: 217px; height: 24px; font-size: 10px; text-align: center;"  onclick="this.value1 = 1;" value="INT-ABA CLIENT INSTR TO ABA RECVD">						
	)
	
	ActionButtons = 
	(
	<td>
		<input type="button" style="display: block; width: 100px; height: 24px; font-size: 12px;"  id="ABADocketAction"  value1="0" onclick="this.value1 = 1;" value="Docket Action">
	</td>
	<td>
		<input type="button" style="display: block; width: 107px; height: 24px; font-size: 12px;"  id="ABACloseAction" 	 value1="0" onclick="this.value1 = 1;" value="Close Action">
	</td>
	)
	
	StatusAndDisclosure = 
	(
	<td>
		<input type="button" value1="0" id="ABAUpdateStatus" style="width: 100px; height: 24px; font-size: 12px;"  onclick="
		try {
			document.getElementById('ctl00_Detail_EditButton_input').click();	
			this.value1 = '0';
		}	
		catch(err) {
			if (this.value1 == '0') {
				document.getElementById('ctl00_Detail_ApplicationStatus_Arrow').click();
				document.getElementById('ctl00_Detail_ApplicationStatus_Input').focus();
				var status = document.getElementById('ABAStatus').value;
				document.getElementById('ctl00_Detail_ApplicationStatus_Input').value = status;
				var temp = {logEntries:[],value:'27',text:'Abandoned',enabled:true,checkedIndices:[],checkedItemsTextOverflows:false};
				document.getElementById('ctl00_Detail_ApplicationStatus_ClientState').value = temp;			
				this.value1 = '1';
			}
			else if (this.value1 == '1') {
				document.getElementsByClassName('rcbHovered')[0].click()
				document.getElementById('ctl00_Detail_UpdateButton_input').click();
				this.value1 = '0';
			}		
		}	
		" value="Update Status">				
	</td>
	<td>
		<input type="button" style="width: 107px; height: 24px; font-size: 12px;" id="ABACloseDisclosure" value1="0" onclick="this.value1 = 1;" value="Close Disclosure"><br>
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
	<input type="button" id="ABAClientInstr" style="display: none; width: 217px; height: 24px; font-size: 10px; text-align: center;"  onclick="this.value1 = 1;" value="INT-ABA CLIENT INSTR TO ABA RECVD">						
	)
	
	ActionButons = 
	(
	<td>
		<input type="button" style="display: block; width: 100px; height: 24px; font-size: 12px;"  id="ABADocketAction" 	 value1="0" onclick="this.value1 = 1;" value="Docket Action">
	</td>
	<td>
		<input type="button" style="display: block; width: 107px; height: 24px; font-size: 12px;"  id="ABACloseAction" 	 value1="0" onclick="this.value1 = 1;" value="Close Action">
	</td>
	)
	
	StatusAndDisclosure = 
	(
	<td>
		<input type="button" value1="0" id="ABAUpdateStatus" style="width: 100px; height: 24px; font-size: 12px;"  onclick="
		try {
			document.getElementById('ctl00_Detail_EditButton_input').click();	
			this.value1 = '1';
		}	
		catch(err) {
			if (this.value1 == '0') {
				document.getElementById('ctl00_Detail_ApplicationStatus_Arrow').click();
				document.getElementById('ctl00_Detail_ApplicationStatus_Input').focus();
				var status = document.getElementById('ABAStatus').value;
				document.getElementById('ctl00_Detail_ApplicationStatus_Input').value = status;
				var temp = {logEntries:[],value:'27',text:'Pre ABA',enabled:true,checkedIndices:[],checkedItemsTextOverflows:false};
				document.getElementById('ctl00_Detail_ApplicationStatus_ClientState').value = temp;			
				this.value1 = '1';
			}
			else if (this.value1 == '1') {
				document.getElementsByClassName('rcbHovered')[0].click()
				document.getElementById('ctl00_Detail_UpdateButton_input').click();
			}		
		}	
		" value="Update Status">				
	</td>
	<td>
		<input type="button" style="width: 107px; height: 24px; font-size: 12px;" id="ABACloseDisclosure" value1="0" onclick="this.value1 = 1;" value="Close Disclosure"><br>
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
	<input type="button" id="ABAClientInstr" style="display: none; width: 217px; height: 24px; font-size: 10px; text-align: center;"  onclick="this.value1 = 1;" value="INT-ABA CLIENT INSTR TO ABA RECVD">						
	)
	
	ActionButtons = 
	(
	<td>
		<input type="button" style="display: block; width: 100px; height: 24px; font-size: 12px;"  id="ABADocketAction"  value1="0" onclick="this.value1 = 1;" value="Docket Action">
	</td>
	<td>
		<input type="button" style="display: block; width: 107px; height: 24px; font-size: 12px;"  id="ABACloseAction" 	 value1="0" onclick="this.value1 = 1;" value="Close Action">
	</td>
	)
	
	StatusAndDisclosure = 
	(
	<td>
		<input type="button" value1="0" id="ABAUpdateStatus" style="width: 100px; height: 24px; font-size: 12px;"  onclick="
		try {
			document.getElementById('ctl00_Detail_EditButton_input').click();	
			this.value1 = '1';
		}	
		catch(err) {
			if (this.value1 == '0') {
				document.getElementById('ctl00_Detail_ApplicationStatus_Arrow').click();
				document.getElementById('ctl00_Detail_ApplicationStatus_Input').focus();
				var status = document.getElementById('ABAStatus').value;
				document.getElementById('ctl00_Detail_ApplicationStatus_Input').value = status;
				var temp = {logEntries:[],value:'27',text:'Confirm ABA',enabled:true,checkedIndices:[],checkedItemsTextOverflows:false};
				document.getElementById('ctl00_Detail_ApplicationStatus_ClientState').value = temp;			
				this.value1 = '1';
			}
			else if (this.value1 == '1') {
				document.getElementsByClassName('rcbHovered')[0].click()
				document.getElementById('ctl00_Detail_UpdateButton_input').click();
			}		
		}	
		" value="Update Status">				
	</td>
	<td>
		<input type="button" style="width: 107px; height: 24px; font-size: 12px;" id="ABACloseDisclosure" value1="0" onclick="this.value1 = 1;" value="Close Disclosure"><br>
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
	<input type="button" id="ABAClientInstr" style="display: none; width: 217px; height: 24px; font-size: 10px; text-align: center;"  onclick="this.value1 = 1;" value="INT-ABA CLIENT INSTR TO ABA RECVD">						
	)
	
	ActionButtons = 
	(
	<td>
		<input type="button" style="display: none; width: 100px; height: 24px; font-size: 12px;"  id="ABADocketAction" 	 value1="0" onclick="this.value1 = 1;" value="Docket Action">
	</td>
	<td>
		<input type="button" style="display: none; width: 107px; height: 24px; font-size: 12px;"  id="ABACloseAction" 	 value1="0" onclick="this.value1 = 1;" value="Close Action">
	</td>
	)
	
;	StatusAndDisclosure = 
;	(
;	<td>
;		<input type="button" value1="0" id="ABAUpdateStatus" style="width: 100px; height: 24px; font-size: 12px;"  onclick="
;			
;			alert('need to look into this one.');
;	
;			
;			IsFiledPat := ie.document.getElementByID("flddteFilDate").Value
;			IsPublishedPat := ie.document.getElementByID("flddtePubDate").Value		
;			IsIssuedPat := ie.document.getElementByID("flddteIssDate").Value	
;			
;			if (IsIssuedPat != "")
;				ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := "Issued"   		; For Patent.
;			else if (IsPublishedPat != "")
;				ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := "Published"   	; For Patent.	
;			else if (IsFiledPat != "")
;				ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := "Pending"   		; For Patent.				
;
;			ie.document.getElementByID("flddteClosedDate").Value := ""
;
;			
;		" value="Update Status">				
;	</td>
;	<td>
;		<input type="button" style="width: 107px; height: 24px; font-size: 12px;" id="ABACloseDisclosure" value1="0" onclick="this.value1 = 1;" value="Close Disclosure"><br>
;	</td>
;	)
	}	
	
IniRead, RespAtty, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
	notesection = 
	(	
	<div style="padding: 0px;"></div>
	<table id="notesSection" style="border: 0px solid black; height: 145px; width:100`%; text-align: left;">
	<tr>
		<td style="width: 30`%; border: 1px solid black; vertical-align: top; padding: 3px;">
			<textarea readonly title="" style="font-family: Arial, Helvetica, sans-serif;
			align: middle; text-align: left; height: 145px; width: 100`%; color: black; background-color: #E4E4E4; border: 1px solid black;" 
			id="noteArea" 
			value1="0" 
			onfocusin=""
			onfocusout=""
			onMouseOver="" 
			onMouseOut=""
			ondblclick=""
			
			wrap="hard">%NoteInput%</textarea>
		</td>
		
		<td style="width: 60px; border: 1px solid black; vertical-align: top; padding: 3px;">
			<input type="button" id="noteEdit" value="Edit" onclick="
			
			if (this.value === 'Edit') {
				document.getElementById('noteArea').readOnly = false; 
				document.getElementById('noteArea').focus(); 
				document.getElementById('noteArea').style.color='black'; 
				document.getElementById('noteArea').style.backgroundColor='#FFBFBF';
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

			style="width: 60px;">
		</td>
		<td style="border: 1px solid black; width: 370px; height: 100`%; vertical-align: top; padding: 0px;">
	<table>
	<tr>
		<td>
		<div style="height:155px; width:230px; border: 1px black solid; background-color: lightgray; padding-left: 4px" onscroll=""	>
			<table style="width: 100`%; vertical-align: 'top'; ">
				<tr>
				
					<td colspan="2" style="border-right: 0px solid black; width: 100`%;">
						<button disabled style="width: 100px; height: 24px; color: red;">ABAer 3 (IE)</button>&nbsp;&nbsp;&nbsp;&nbsp;

						<input type="text" onfocus="this.style.backgroundColor = 'FFBFBF';" onblur="this.value1 = 1;" value1="0" id="ABARespAtty" value="%RespAtty%" style="width: 76px; height: 23px; text-align: center;">
						
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
						<input type="text" style="width: 103px; text-align: center;" id="ABACloseDate" value1="0" value="%ABACloseDate%">
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
	</tr>		
</table>	
	
		</td>


		<td style="border: 1px solid black; vertical-align: top; padding: 0px;">
			<textarea wrap="soft" unselectable="on" rows="3" id="" readonly style="border: 1px solid black; overflow-y: scroll; font-size: 12px; color: black; background-color: #E4E4E4; text-align: center; width: 99`%; font-family: Arial, Helvetica, sans-serif;">%exceptionInfo%</textarea>
		
			%quickTips%
			
			
			
		</td>		
		
		
	</td>
	)
	
	
;			<td style="border: 1px solid black; width: 370px; height: 100`%; vertical-align: top; padding: 0px;">
;			<div style="display: inline-block; font-family: Arial, Helvetica, sans-serif; font-size: 0; overflow-y: scroll; overflow-x: hidden; height: 153px;">
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">				
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">		
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">				
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">	
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">				
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">	
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">				
;				<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">
;			<input type="button" id="" value="Edit" style="width: 70px; height: 51px;" onclick="alert(this.value);">					
;		</div>
;	</td>

	
	
	checkNotesSection := ie.document.getElementByid("notesSection").id
	if (checkNotesSection == "")
		ie.document.getElementsByTagName("HR")[1].insertAdjacentHTML("afterend",notesection )
	
	checkABAStatus := ie.document.getElementById("ABAStatus").value1
	checkABADocketAction := ie.document.getElementById("ABADocketAction").value1
	checkABACloseAction := ie.document.getElementById("ABACloseAction").value1
	checkABACloseDisclosure := ie.document.getElementById("ABACloseDisclosure").value1
	checkABAUpdateStatus := ie.document.getElementById("ABAUpdateStatus").value1
	checkABAClientInstr := ie.document.getElementById("ABAClientInstr").value1
	checkABARespAtty := ie.document.getElementById("ABARespAtty").value1
	checkfixNewRemarks := ie.document.getElementById("fixNewRemarks").value1
		
	if checkABAStatus = 1
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
		;ie.document.getElementById("ctl00_Detail_EditButton_input").click()
		; gosub UpdateStatus
		}
	else if checkABAClientInstr = 1
		{
		ie.document.getElementById("ABAClientInstr").value1 := 0
		
		MsgBox, Client Instr
		; gosub DocketABAAction
		}
		
	else if checkABADocketAction = 1
		{
		ie.document.getElementById("ABADocketAction").value1 := 0
		ActionType := "INT-ABA CLIENT INSTR TO ABA RECVD"
		Remarks := "* - test remarks"
		WinActivate, ahk_class IEFrame
		ie := WBGet()
		while ie.busy or ie.ReadyState != 4 ;Wait for page to load
			Sleep, 100
		if InStr(ie.LocationURL, "patfrmCountryApplication")	
			{
			URL := StrSplit(ie.LocationURL, "=")
			Key := StrSplit(URL[2], "&")
			OutputVar := "https://web05.computerpackages.com/knobbe/patent/patfrmActionDue.aspx?key=-1&appId=" Key[1]
			}
		else if InStr(ie.LocationURL, "patfrmActionDue")	
			{
			Key := StrSplit(ie.LocationURL, "appId=")
			OutputVar := "https://web05.computerpackages.com/knobbe/patent/patfrmActionDue.aspx?key=-1&appId=" Key[2]
			}
		params := [OutputVar, 2048]
		ie.Navigate(params*)
		Sleep 2000
		ie := WBGet()
		while ie.busy or ie.ReadyState != 4 ;Wait for page to load
			Sleep, 100
		ie.document.getElementByID("ctl00_Detail_tplFormview_ActionType_Input").value := ActionType ; GRAB value
		ie.document.getElementByID("ctl00_Detail_tplFormview_ActionType_ClientState").value := "{'logEntries':[],'value':'" ActionType "','text':" ActionType ",'enabled':true,'checkedIndices':[],'checkedItemsTextOverflows':false}"  ; GRAB value
		ie.document.getElementByID("ctl00_Detail_tplFormview_ActionType_Arrow").click()
		ie.document.getElementByID("ctl00_Detail_tplFormview_ActionType_Input").blur()
		ie.document.getElementByID("ctl00_Detail_tplFormview_BaseDate_dateInput").focus()
		ie.document.getElementByID("ctl00_Detail_tplFormview_BaseDate_dateInput").value := TodayDocket
		ie.document.getElementByID("ctl00_Detail_Remarks").value := Remarks
		}			
	else if checkABACloseAction = 1
		{
		ie.document.getElementById("ABACloseAction").value1 := 0
		MsgBox, Close Action
		
		; gosub CloseAction
		}	
	else if checkABACloseDisclosure = 1
		{
		ie.document.getElementById("ABACloseDisclosure").value1 := 0
		MsgBox, Close Disclosure
		
		;gosub CloseDisclosureAuto
		}
	}

CheckNoteInput := ie.document.getElementById("noteArea").value1	
if (CheckNoteInput == 1)
	{
	ie.document.getElementById("noteArea").value1 := 0
	ie.document.getElementById("noteEdit").style.backgroundColor := "lightgreen"
	ie.document.getElementById("noteEdit").value := "Saved"
	NoteInput := ie.document.getElementById("noteArea").value
	StringReplace, NoteInput, NoteInput, `r`n, <br>, A
	IniWrite, %NoteInput%, C:\Users\%A_Username%\DocketMods.ini, Notes, SavedNotes
	SetTimer, changeButtonColor, -2000
	}


SuperEditInvention	= 1
if (SuperEditInvention)
	{
	if InStr(ie.LocationURL, "patfrmInvention")
		{
		checkEPRecordDuplicator := ie.document.getElementsByClassName("rwTitlebarControls")[0].getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[0].getElementsByTagName("TD")[1].getElementsByTagName("em")[0].textContent
		if (checkEPRecordDuplicator != "SuperEdit Invention Edition")
			{
			ie.document.getElementsByClassName("rwTitlebarControls")[0].getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[0].getElementsByTagName("TD")[1].getElementsByTagName("em")[0].textContent := "SuperEdit Invention Edition" 
			ie.document.getElementsByName("CopyWindow")[0].style.height := "67%"
			ie.document.getElementById("RadWindowWrapper_ctl00_Detail_CopyWindow").getElementsByTagname("TABLE")[0].style.height := "352px"
			
			buttonWidth := "9.26`%"
			
			countryButtons1 =
			(
			<input type="button" id="validationAL" style="height: 20px; width: %buttonWidth%; text-align: center;" value="AL" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="AT" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="BA" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="BE" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="BG" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="CH" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="CY" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="CZ" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="DE" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">		
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="DK" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			)
			countryButtons2 =
			(
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="EE" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="ES" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="FI" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="FR" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">		
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="GB" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">		
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="GR" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="HR" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="HU" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="IE" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="IS" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">	
			)
			countryButtons3 =
			(			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="IT" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="KH" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">		
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="LI" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="LT" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="LU" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">		
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="LV" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="MA" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="MC" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="MD" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="ME" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			)
			countryButtons4 =
			(
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="MK" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">		
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="MT" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="NL" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="NO" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="PL" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="PT" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="RO" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="RS" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">		
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="SE" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">			
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="SI" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			)
			countryButtons5 =
			(
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="SK" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="SM" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="TN" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			<input type="button" id="validationAT" style="height: 20px; width: %buttonWidth%; text-align: center;" value="TR" value1="0" 
			onclick="			
			var clientCode = document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value;
			var newCountry = document.getElementById('lastClickedCountry').value;
			clientCode = clientCode.replace('copy', '');
			var split = clientCode.split('.');
			var backend = split[1].replace(newCountry, this.value);
			document.parentWindow.frames[0].document.getElementById('CopyCaseNumber').value = split[0] + '.' + backend;	
			document.getElementById('lastClickedCountry').value = this.value;
			document.getElementById('lastClickedCountry').value1 = '1';
			">
			&nbsp; &nbsp; &nbsp;
			<label for="lastClickedCountry" style="word-wrap: break-word; font-size: 16px; text-decoration: underline;">Country to Replace:</label>
			<input type="text" id="lastClickedCountry" value1="0" title="Last Country" style="text-align: center; width: 13`%; height: 17px; font-size: 16px;" value="%lastClickedCountry%">

			
			)
			
			if (ie.document.getElementByid("validationAL").id == "")
				ie.document.getElementsByName("CopyWindow")[0].insertAdjacentHTML("afterend",countryButtons1 . countryButtons2 . countryButtons3 . countryButtons4 . countryButtons5)			


		
		;	ie.document.getElementsByClassName("rgEditForm")[0].style.height := "520px"
		;	ie.document.getElementsByClassName("rgEditForm")[0].style.height := "100%"
		;	ie.document.getElementsByClassName("rgEditForm")[0].style.backgroundColor := "#AABBCC"
		;	ie.document.getElementsByClassName("rgEditForm")[0].style.border := "2px solid black"
			
			}
		
		}
	}

checkLastClickedCountry := ie.document.getElementById("lastClickedCountry").value1
if (checkLastClickedCountry == "1")
	{
	ie.document.getElementById("lastClickedCountry").value1:= "0"
	lastClickedCountry := ie.document.getElementById("lastClickedCountry").value
	}

	
	
; SuperEdit 2.0
if (EnableSuperEdit)
	{
	if InStr(ie.LocationURL, "ActionDue")
		{
		checkSuperEdit := ie.document.getElementsByClassName("rgHeader")[9].innerText
		if (checkSuperEdit != "Can you say SuperEdit 2.0?")
			{
			if (ActionInjectors)
				{
				if InStr(ie.LocationURL, "pat")
					{
					superEditActions =
					(
					<br>
					&nbsp;
					<button style="display: none;">.</button>
					<label for="superEditEarlyAtty" style="word-wrap: break-word; font-size: 16px; text-decoration: underline;">Early Instr:</label>
					<input type="button" id="superEditEarlyAtty"  	style="height: 22px; width: 11.4`%; text-align: center;" value="Atty" 	value1="0" onclick="this.value1 = '1';">
					<input type="button" id="superEditEarlyIPP"   	style="height: 22px; width: 11.4`%; text-align: center;" value="IPP" 		value1="0" onclick="this.value1 = '1';">
					<input type="button" id="superEditEarlyOAPat" 	style="height: 22px; width: 11.4`%; text-align: center;" value="OA" 		value1="0" onclick="this.value1 = '1';">
					<input type="button" id="superEditEarlyExam"  	style="height: 22px; width: 11.4`%; text-align: center;" value="Exam" 	value1="0" onclick="this.value1 = '1';">
					<input type="button" id="superEditEarlyHK" 	  	style="height: 22px; width: 11.4`%; text-align: center;" value="HK" 		value1="0" onclick="this.value1 = '1';">
					<input type="button" id="superEditEarlyMO" 	  	style="height: 22px; width: 11.4`%; text-align: center;" value="MO" 		value1="0" onclick="this.value1 = '1';">
					<input type="button" id="superEditEarlyDiv"   	style="height: 22px; width: 11.4`%; text-align: center;" value="DIV" 		value1="0" onclick="this.value1 = '1';">
					
					<br><br>
					&nbsp;
					<label for="superEditGraceEP" style="word-wrap: break-word; font-size: 16px; text-decoration: underline;">Grace Period:</label>
					<input type="button" id="superEditGraceEP" 	  	style="height: 22px; width: 10`%; text-align: center;" value="EP" 			value1="0" onclick="this.value1 = '1';">
					<input type="button" id="superEditGraceCN" 	  	style="height: 22px; width: 10`%; text-align: center;" value="CN" 			value1="0" onclick="this.value1 = '1';">
					<input type="button" id="superEditGraceCNAllow" style="height: 22px; width: 20`%; text-align: center;" value="CN Allowance"	value1="0" onclick="this.value1 = '1';">
					
					&nbsp;
					<label for="superEditFurtherPat" style="word-wrap: break-word; font-size: 16px; text-decoration: underline;">Further:</label>
					<input type="button" id="superEditFurtherAtty" 	style="height: 22px; width: 12`%; text-align: center;" value="Atty" 		value1="0" onclick="this.value1 = '1';">
					<input type="button" id="superEditFurtherIPP"  	style="height: 22px; width: 12`%; text-align: center;" value="IPP" 			value1="0" onclick="this.value1 = '1';">
					
					<br>
					------------------------------------------------------------------------------------------------------------
					

					)
					}
				else
					{
					superEditActions =
					(
					<br>
					&nbsp;
					<button style="display: none;">.</button>
					<label for="superEditEarlyTMPL" style="word-wrap: break-word; font-size: 16px; text-decoration: underline;">Early Instr:</label>
					<input type="button" id="superEditEarlyTMPL" 	 style="" value="TMPL" 	value1="0" onclick="this.value1 = '1';">
					<input type="button" id="superEditEarlyOATM" 	 style="" value="OA" 		value1="0" onclick="this.value1 = '1';">
					<input type="button" id="superEditEarlyRenewal"  style="" value="Renewal" value1="0" onclick="this.value1 = '1';">

					&nbsp;
					<label for="superEditFurtherTM" style="word-wrap: break-word; font-size: 16px; text-decoration: underline;">Further:</label>
					<input type="button" id="superEditFurtherTM" 	style="height: 22px; width: 12`%; text-align: center;" value="TMPL" 		value1="0" onclick="this.value1 = '1';">
				
					<br>
					------------------------------------------------------------------------------------------------------------
					)
					}
				}
			else
				{
				superEditActions := ""
				}

			if (QuickMDActions)
				{
				superEditMDActions =
				(
				&nbsp;
				<label for="respAtty" style="word-wrap: break-word; font-size: 16px; text-decoration: underline;">Resp. Atty:</label>
				<input type="text" id="respAtty" title="This is the Responsible attorney." %isDisabled% style="text-align: center; width: 12`%; height: 17px; font-size: 16px;" value="%respAtty%">

				&nbsp;&nbsp;
				<input type="checkbox" id="autoExtendCheckbox" title="Enable for automatic extension with EXT." style="height: 15px; width: 15px; vertical-align: sub;" %SuperEditAutoExtend% value="Hello" value1="0" 
				
				onclick="if (this.checked === true) {
				document.getElementById('respAtty').disabled = true;
				document.getElementById('superEditNoted').disabled = true;
				document.getElementById('superEditAllowToPass').disabled = true;
				document.getElementById('superEditFollowUp').disabled = true;
				} else {
				document.getElementById('respAtty').disabled = false;
				document.getElementById('superEditNoted').disabled = false;
				document.getElementById('superEditAllowToPass').disabled = false;
				document.getElementById('superEditFollowUp').disabled = false;
				};">

				<label for="autoExtendCheckbox" style="word-wrap: break-word; font-size: 16px;">Automatic Extension</label>
				&nbsp;

				<br><br>
				
				&nbsp;
				<label for="superEditNoted" 				   style="word-wrap: break-word; font-size: 16px; text-decoration: underline;">Quick Remarks:</label>
				<input type="button" id="superEditNoted"       style="height: 22px; width: 12`%; text-align: center;" value="Noted" value1="0" onclick="this.value1 = '1';">
				<input type="button" id="superEditAllowToPass" style="height: 22px; width: 19`%; text-align: center;" value="Allow to Pass" value1="0" onclick="this.value1 = '1';">
				<input type="button" id="superEditFollowUp"    style="height: 22px; width: 17`%; text-align: center;" value="Follow-up" value1="0" onclick="this.value1 = '1';">
				<input type="button" id="" disabled            style="height: 22px; width: 17`%; text-align: center;" value="TBD" value1="0" onclick="this.value1 = '1';">
			
				<br><br>

				&nbsp;
				<label for="superEditQuickClose" 		      style="word-wrap: break-word; font-size: 16px; text-decoration: underline;">Quick Actions:</label>
				<input type="button" id="superEditQuickClose" style="height: 22px; width: 17.65`%; text-align: center;" value="Close Date" value1="0" onclick="this.value1 = '1';">
				<input type="button" id="superEditQuickExtend"style="height: 22px; width: 20.65`%; text-align: center;" value="Quick Extend" value1="0" onclick="this.value1 = '1';">
				<input type="button" id=""   disabled         style="height: 22px; width: 14.65`%; text-align: center;" value="TBD" value1="0" onclick="this.value1 = '1';">
				<input type="button" id=""   disabled         style="height: 22px; width: 17.65`%; text-align: center;" value="TBD" value1="0" onclick="this.value1 = '1';">
				
				<br><br>
				
				<input type="button" id="superEdit1W" 	style="height: 22px; width: 8.5`%; text-align: center;" value="1W" value1="0" onclick="this.value1 = '1';">
				<input type="button" id="superEdit2W" 	style="height: 22px; width: 8.5`%; text-align: center;" value="2W" value1="0" onclick="this.value1 = '1';">
				<input type="button" id="superEdit3W" 	style="height: 22px; width: 8.5`%; text-align: center;" value="3W" value1="0" onclick="this.value1 = '1';">
				<input type="button" id="superEdit4W" 	style="height: 22px; width: 8.5`%; text-align: center;" value="4W" value1="0" onclick="this.value1 = '1';">
				<input type="button" id="superEdit1M" 	style="height: 22px; width: 8.5`%; text-align: center;" value="1M" value1="0" onclick="this.value1 = '1';">
				<input type="button" id="superEdit2M" 	style="height: 22px; width: 8.5`%; text-align: center;" value="2M" value1="0" onclick="this.value1 = '1';">
				<input type="button" id="superEdit3M" 	style="height: 22px; width: 8.5`%; text-align: center;" value="3M" value1="0" onclick="this.value1 = '1';">
				<input type="button" id="superEdit4M" 	style="height: 22px; width: 8.5`%; text-align: center;" value="4M" value1="0" onclick="this.value1 = '1';">
				<input type="button" id="superEdit5M" 	style="height: 22px; width: 8.5`%; text-align: center;" value="5M" value1="0" onclick="this.value1 = '1';">
				<input type="button" id="superEdit6M" 	style="height: 22px; width: 8.5`%; text-align: center;" value="6M" value1="0" onclick="this.value1 = '1';">
				<input type="button" id="superEdit1Y" 	style="height: 22px; width: 8.6`%; text-align: center;" value="1Y" value1="0" onclick="this.value1 = '1';">
				
				<br>
				------------------------------------------------------------------------------------------------------------
				)
				
				superEditDaysBar =
				(


				<td>			
					<label for="superEditDaysButton"   style="word-wrap: break-word; font-size: 16px; text-decoration: underline;">Add Days:</label>
					<input type="button" id="superEditDaysButton1" style="height: 24px; width: 24px; text-align: left; padding-left: 4px;" value="+1" value1="0" onclick="this.value1 = '1';">
				</td>
				<td>		
					<input type="button" id="superEditDaysButton2" style="height: 24px; width: 24px; text-align: left; padding-left: 4px;" value="+2" value1="0" onclick="this.value1 = '1';">
				</td>
				<td>
					<input type="button" id="superEditDaysButton3" style="height: 24px; width: 24px; text-align: left; padding-left: 4px;" value="+3" value1="0" onclick="this.value1 = '1';">
				</td>
				<td>
					<input type="button" id="superEditDaysButton4" style="height: 24px; width: 24px; text-align: left; padding-left: 4px;" value="+4" value1="0" onclick="this.value1 = '1';">
				</td>
				<td>
					<input type="button" id="superEditDaysButton5" style="height: 24px; width: 24px; text-align: left; padding-left: 4px;" value="+5" value1="0" onclick="this.value1 = '1';">
				</td>
				<td>
					<input type="button" id="superEditDaysButton6" style="height: 24px; width: 24px; text-align: left; padding-left: 4px;" value="+6" value1="0" onclick="this.value1 = '1';">
				</td>
				)
				
				
				}
			else
				{
				superEditMDActions := ""
				superEditDaysBar := ""
				}
				
			superEditBar := superEditMDActions . superEditActions

			ie.document.getElementsByClassName("rgHeader")[9].innerText := "Can you say SuperEdit 2.0?" 
		;	ie.document.getElementsByClassName("rgEditForm")[0].style.height := "520px"
			ie.document.getElementsByClassName("rgEditForm")[0].style.height := "100%"
			ie.document.getElementsByClassName("rgEditForm")[0].style.backgroundColor := "#AABBCC"
			ie.document.getElementsByClassName("rgEditForm")[0].style.border := "2px solid black"
		; 	ie.document.getElementsByClassName("riTextBox")[0].className := ""
		
			ie.document.getElementById("ctl00_Detail_DummyDatePicker_popupButton").className := ""
			
			
			if (ie.document.getElementsByTagName("TextArea")[0].style.width == "400px")
				ie.document.getElementsByTagName("TextArea")[0].rows := "7"
			
			ie.document.getElementsByClassName("rgEditForm")[0].getElementsByTagName("DIV")[1].insertAdjacentHTML("afterbegin", superEditBar)
			
			

			}
		else if (checkSuperEdit == "Can you say SuperEdit 2.0?")
			{
			; Check for clicked Extension buttons
			if (ie.document.getElementById("superEditDaysButton1").id == "")
				{
				ie.document.getElementsByClassName("DetailValue")[1].style.width := "100px"
				ie.document.getElementsByClassName("DetailValue")[1].insertAdjacentHTML("beforeend", superEditDaysBar)
				}
			gosub CheckIfClicked
			return
			}

			CheckIfClicked:	
			checkSuperEdit1W 		  	:= ie.document.getElementById("superEdit1W").value1				; 1
			checkSuperEdit2W 		  	:= ie.document.getElementById("superEdit2W").value1				; 2
			checkSuperEdit3W 		  	:= ie.document.getElementById("superEdit3W").value1				; 3
			checkSuperEdit4W 		  	:= ie.document.getElementById("superEdit4W").value1				; 4
			checkSuperEdit1M 		  	:= ie.document.getElementById("superEdit1M").value1				; 5
			checkSuperEdit2M 		  	:= ie.document.getElementById("superEdit2M").value1				; 6
			checkSuperEdit3M 		  	:= ie.document.getElementById("superEdit3M").value1				; 7
			checkSuperEdit4M   		  	:= ie.document.getElementById("superEdit4M").value1				; 8
			checkSuperEdit5M 		  	:= ie.document.getElementById("superEdit5M").value1				; 9
			checkSuperEdit6M 		  	:= ie.document.getElementById("superEdit6M").value1				; 10
			checkSuperEdit1Y 		  	:= ie.document.getElementById("superEdit1Y").value1				; 11
			checkSuperEditQuickClose  	:= ie.document.getElementById("superEditQuickClose").value1		; 12
			checkSuperEditNoted 	  	:= ie.document.getElementById("superEditNoted").value1			; 13
			checkSuperEditAllowToPass 	:= ie.document.getElementById("superEditAllowToPass").value1	; 14
			checkSuperEditFollowUp 	  	:= ie.document.getElementById("superEditFollowUp").value1		; 15
			checkSuperEditQuickExtend 	:= ie.document.getElementById("superEditQuickExtend").value1	; 16	


			checkSuperEditEarlyAtty 	:= ie.document.getElementById("superEditEarlyAtty").value1 		; 17
			checkSuperEditEarlyIPP 		:= ie.document.getElementById("superEditEarlyIPP").value1		; 18
			checkSuperEditEarlyOAPat	:= ie.document.getElementById("superEditEarlyOAPat").value1		; 19
			checkSuperEditEarlyExam 	:= ie.document.getElementById("superEditEarlyExam").value1		; 20
			checkSuperEditEarlyHK 		:= ie.document.getElementById("superEditEarlyHK").value1		; 21	
			checkSuperEditEarlyMO 		:= ie.document.getElementById("superEditEarlyMO").value1		; 22
			checkSuperEditGraceEP 		:= ie.document.getElementById("superEditGraceEP").value1		; 23
			checkSuperEditGraceCN 		:= ie.document.getElementById("superEditGraceCN").value1		; 24
			checkSuperEditGraceCNAllow 	:= ie.document.getElementById("superEditGraceCNAllow").value1	; 25
			checkSuperEditFurtherAtty	:= ie.document.getElementById("superEditFurtherAtty").value1	; 26	
			checkSuperEditFurtherIPP 	:= ie.document.getElementById("superEditFurtherIPP").value1		; 27
			checkSuperEditEarlyTMPL		:= ie.document.getElementById("superEditEarlyTMPL").value1		; 28
			checkSuperEditEarlyOATM		:= ie.document.getElementById("superEditEarlyOATM").value1		; 29
			checkSuperEditEarlyRenewal	:= ie.document.getElementById("superEditEarlyRenewal").value1	; 30
			checkSuperEditFurtherTM		:= ie.document.getElementById("superEditFurtherTM").value1		; 31
			checkSuperEditEarlyDiv		:= ie.document.getElementById("superEditEarlyDiv").value1		; 32
		
			checkSuperEditDaysButton1	:= ie.document.getElementById("superEditDaysButton1").value1	; 33		
			checkSuperEditDaysButton2	:= ie.document.getElementById("superEditDaysButton2").value1	; 34		
			checkSuperEditDaysButton3	:= ie.document.getElementById("superEditDaysButton3").value1	; 35		
			checkSuperEditDaysButton4	:= ie.document.getElementById("superEditDaysButton4").value1	; 36		
			checkSuperEditDaysButton5	:= ie.document.getElementById("superEditDaysButton5").value1	; 37		
			checkSuperEditDaysButton6	:= ie.document.getElementById("superEditDaysButton6").value1	; 38		
		
			checkSuperEditArray := [checkSuperEdit1W, checkSuperEdit2W, checkSuperEdit3W, checkSuperEdit4W, checkSuperEdit1M, checkSuperEdit2M, checkSuperEdit3M, checkSuperEdit4M, checkSuperEdit5M, checkSuperEdit6M, checkSuperEdit1Y, checkSuperEditQuickClose, checkSuperEditNoted, checkSuperEditAllowToPass, checkSuperEditFollowUp, checkSuperEditQuickExtend, checkSuperEditEarlyAtty,checkSuperEditEarlyIPP,checkSuperEditEarlyOAPat,checkSuperEditEarlyExam,checkSuperEditEarlyHK,checkSuperEditEarlyMO,checkSuperEditGraceEP,checkSuperEditGraceCN,checkSuperEditGraceCNAllow,checkSuperEditFurtherAtty,checkSuperEditFurtherIPP,checkSuperEditEarlyTMPL,checkSuperEditEarlyOATM,checkSuperEditEarlyRenewal,checkSuperEditFurtherTM, checkSuperEditEarlyDiv, checkSuperEditDaysButton1,checkSuperEditDaysButton2, checkSuperEditDaysButton3, checkSuperEditDaysButton4, checkSuperEditDaysButton5, checkSuperEditDaysButton6]

		Loop % checkSuperEditArray.Length()
			{
			if (checkSuperEditArray[A_Index] == "1")
				{
				clickedButton := A_Index
				
				if (clickedButton == 12) ; Quick Close
					{
					; Add Date Taken
					ie.document.getElementsByClassName("riTextBox")[1].value := TodayStyled
					ie.document.getElementsByClassName("riTextBox")[1].focus()
					ie.document.getElementsByClassName("riTextBox")[1].blur()
					
					if (ie.document.getElementById("respAtty").value != "")
						{
						respAtty := ie.document.getElementById("respAtty").value
						InsertAtty(respAtty)
						ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled " - Date closed per " respAtty ". -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
						}
					else if (ie.document.getElementById("autoExtendCheckbox").checked != "0")
						InsertAtty("EXT")
					}
				else if (clickedButton == 13) ; Noted
					{
					if (ie.document.getElementById("respAtty").value != "")
						{
						respAtty := ie.document.getElementById("respAtty").value
						InsertAtty(respAtty)
						ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled " - Noted per " respAtty ". -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
						}
					}
				else if (clickedButton == 14) ; Allow to pass.
					{
					if (ie.document.getElementById("respAtty").value != "")
						{
						respAtty := ie.document.getElementById("respAtty").value
						InsertAtty(respAtty)
						ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled " - Allow to pass per " respAtty ". -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
						}
					}
				else if (clickedButton == 15) ; Follow-up
					{
					if (ie.document.getElementById("respAtty").value != "")
						{
						respAtty := ie.document.getElementById("respAtty").value
						InsertAtty(respAtty)							
						ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled " - Follow-up sent to FA per " respAtty ". -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
						}
					}
				else if (clickedButton == 16) ; Quick Extend
					{
					if (ie.document.getElementById("respAtty").value != "")
						{
						respAtty := ie.document.getElementById("respAtty").value
						InsertAtty(respAtty)	
						}
					else
						InsertAtty("EXT")	
						
					ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(TodayDocket, 7)
					ie.document.getElementsByClassName("riTextBox")[0].focus()
					ie.document.getElementsByClassName("riTextBox")[0].blur()
					}
					
				else if (clickedButton == 17) ; Early Instr Atty
					{
					InsertIndicator("Due Date")
					newActionDue := "Provide FA with Instructions as Requested / Atty"
					ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_ActionDue").value := newActionDue
					ie.document.getElementsByClassName("riTextBox")[0].focus()	
					ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled " - FA requesting early instructions re: * -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
					}
				else if (clickedButton == 18) ; Early Instr IPP
					{
					InsertIndicator("Due Date")
					newActionDue := "Provide FA with Instructions as Requested / IPP "
					ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_ActionDue").value := newActionDue
					ie.document.getElementsByClassName("riTextBox")[0].focus()	
					ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled " - FA requesting early instructions re *. -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
					}					
				else if (clickedButton == 19) ; Early Instr OA
					{
					InsertIndicator("Due Date")
					newActionDue := "FA Requests Instructions re Office Action"
					ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_ActionDue").value := newActionDue
					ie.document.getElementsByClassName("riTextBox")[0].focus()	
					ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled " - FA Letter reporting an Office Action; FA requested date to receive instructions. -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
					}						
				else if (clickedButton == 20) ; Early Instr Exam
					{
					InsertIndicator("Due Date")
					newActionDue := "Instructions to FA Regarding Exam Request / Exam Desk"
					ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_ActionDue").value := newActionDue
					ie.document.getElementsByClassName("riTextBox")[0].focus()	
					ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled " - FA Requesting instructions regarding Examination Request. -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
					}
				else if (clickedButton == 21) ; Early HK
					{
					InsertIndicator("Due Date")
					newActionDue := "Provide FA Instructions re: Possible Hong Kong Filing / IPP"
					ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_ActionDue").value := newActionDue
					ie.document.getElementsByClassName("riTextBox")[0].focus()	
					ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled "* - FA has requested early instructions re: whether to file in Hong Kong based on this application. -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
					}
				else if (clickedButton == 22) ; Early MO
					{
					InsertIndicator("Due Date")
					newActionDue := "Provide FA Instructions re: Possible Macao Filing / IPP"
					ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_ActionDue").value := newActionDue
					ie.document.getElementsByClassName("riTextBox")[0].focus()	
					ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled "* - FA has requested early instructions re: whether to file in Macao based on this application. -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
					}
				else if (clickedButton == 23) ; Grace EP
					{
					InsertIndicator("Final")
					newActionDue := "Respond to Official Deadline During Grace Period"
					ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_ActionDue").value := newActionDue
					ie.document.getElementsByClassName("riTextBox")[0].focus()	
					ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled "Docketed per *. Instructions for a response re: * can still be sent to the FA by the notification period deadline. (Important Note: The notification period is added to the base date rather than the pending deadline.) -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
					}
				else if (clickedButton == 24) ; Grace CN
					{
					InsertIndicator("Final")
					newActionDue := "Respond to Official Deadline During Grace Period"
					ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_ActionDue").value := newActionDue
					ie.document.getElementsByClassName("riTextBox")[0].focus()	
					ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled "* - Instructions for a response re * can still be sent to the FA during the notification period. (Important Note: The notification period is added to the base date rather than the pending deadline.) -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
					}
				else if (clickedButton == 25) ; Grace CN Allowance
					{
					InsertIndicator("Final")
					newActionDue := "Grant Fees/Poss Div Grace Period FINAL / Atty&IntFees"
					ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_ActionDue").value := newActionDue
					ie.document.getElementsByClassName("riTextBox")[0].focus()	
					ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled "Instructions for grant fee payment can still be sent to the FA during the notification period. (Important Note: The notification period is added to the base date rather than the pending deadline.) -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
					}					
				else if (clickedButton == 26) ; Further Atty
					{
					InsertIndicator("Final")
					newActionDue := "Provide FA with Further Instructions / Atty"
					ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_ActionDue").value := newActionDue
					ie.document.getElementsByClassName("riTextBox")[0].focus()	
					ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled "* - FA Request for further instructions for [action due] due [official deadline] re: * -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
					}
				else if (clickedButton == 27) ; Further IPP
					{
					InsertIndicator("Final")
					newActionDue := "Provide FA with Further Instructions / IPP"
					ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_ActionDue").value := newActionDue
					ie.document.getElementsByClassName("riTextBox")[0].focus()	
					ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled "* - FA Request for further instructions for: [action due] due [official deadline] re: * -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
					}
				else if (clickedButton == 28) ; Early TMPL
					{
					InsertIndicator("Due Date")
					newActionDue := "Provide FA with Instructions as Requested"
					ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_ActionDue").value := newActionDue
					ie.document.getElementsByClassName("riTextBox")[0].focus()	
					ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled " FA requesting early instructions prior to official deadline re * -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
					}
				else if (clickedButton == 29) ; Early OA TMPL
					{
					InsertIndicator("Due Date")
					newActionDue := "FA Requests Instructions re Office Action"
					ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_ActionDue").value := newActionDue
					ie.document.getElementsByClassName("riTextBox")[0].focus()	
					ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled " - FA request for early instructions by a particular date prior to office action deadline. -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
					}
				else if (clickedButton == 30) ; Early Renewal 
					{
					InsertIndicator("Due Date")
					newActionDue := "FProvide Renewal Instructions per FA Request "
					ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_ActionDue").value := newActionDue
					ie.document.getElementsByClassName("riTextBox")[0].focus()	
					ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled " - FA request for early instructions by a particular date prior to the renewal deadline. -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
					}
				else if (clickedButton == 31) ; Further TMPL
					{
					InsertIndicator("Final")
					newActionDue := "Provide FA with Further Instructions for Response"
					ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_ActionDue").value := newActionDue
					ie.document.getElementsByClassName("riTextBox")[0].focus()	
					ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled "* - FA Request for further instructions for [action due] due [official deadline] re: * -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
					}
				else if (clickedButton == 32) ; Early Patent Div
					{
					InsertIndicator("Due Date")
					newActionDue := "Provide FA Instructions re Possible Divisional Filing / Atty "
					ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_ActionDue").value := newActionDue
					ie.document.getElementsByClassName("riTextBox")[0].focus()	
					ie.document.getElementsByTagName("TextArea")[0].value := TodayStyled "* - FA has requested early instructions re whether to file a divisional based on this application. -TDICKSON`n"	. ie.document.getElementsByTagName("TextArea")[0].value
					}
				else	
					{
					if (clickedButton == 1) ; 1 week
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 7)
					else if (clickedButton == 2) ; 2 weeks
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 14)				
					else if (clickedButton == 3) ; 3 weeks
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 21)	
					else if (clickedButton == 4) ; 4 weeks
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 28)
					else if (clickedButton == 5) ; 1 month
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 101)
					else if (clickedButton == 6) ; 2 months
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 102)
					else if (clickedButton == 7) ; 3 months
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 103)
					else if (clickedButton == 8) ; 4 months
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 104)
					else if (clickedButton == 9) ; 5 months
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 105)
					else if (clickedButton == 10) ; 6 months
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 106)
					else if (clickedButton == 11) ; 1 year
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 100)
					else if (clickedButton == 33) ; 1 day
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 1)
					else if (clickedButton == 34) ; 2 day
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 2)
					else if (clickedButton == 35) ; 3 day
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 3)
					else if (clickedButton == 36) ; 4 day
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 4)
					else if (clickedButton == 37) ; 5 day
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 5)
					else if (clickedButton == 38) ; 6 day
						ie.document.getElementsByClassName("riTextBox")[0].value := ExtendDays(ie.document.getElementsByClassName("riTextBox")[0].value, 6)
			
						
						ie.document.getElementsByClassName("riTextBox")[0].focus()
						ie.document.getElementsByClassName("riTextBox")[0].blur()

					if (ie.document.getElementById("autoExtendCheckbox").checked != "0")
						InsertAtty("EXT")
					else if (ie.document.getElementById("respAtty").value != "")
						{
						respAtty := ie.document.getElementById("respAtty").value
						InsertAtty(respAtty)
						}
					}
					
					if (ie.document.getElementById("respAtty").value != "")
						{
						respAtty := ie.document.getElementById("respAtty").value
						SuperEditAutoExtend := ""
						isDisabled := ""
						gosub ClickSave							
						}
					else if (ie.document.getElementById("autoExtendCheckbox").checked != "0")
						{
						SuperEditAutoExtend := "checked"
						isDisabled := "disabled"
						gosub ClickSave	
						}
					else
						{
						
						}
				}
			}
			
					
			ie.document.getElementById("superEdit1W").value1 			:= "0"
			ie.document.getElementById("superEdit2W").value1 			:= "0"
			ie.document.getElementById("superEdit3W").value1 			:= "0"
			ie.document.getElementById("superEdit4W").value1 			:= "0"
			ie.document.getElementById("superEdit1M").value1 			:= "0"
			ie.document.getElementById("superEdit2M").value1 			:= "0"
			ie.document.getElementById("superEdit3M").value1 			:= "0"
			ie.document.getElementById("superEdit4M").value1 			:= "0"
			ie.document.getElementById("superEdit5M").value1 			:= "0"
			ie.document.getElementById("superEdit6M").value1 			:= "0"
			ie.document.getElementById("superEdit1Y").value1 			:= "0"
			ie.document.getElementById("superEditQuickClose").value1 	:= "0"
			ie.document.getElementById("superEditNoted").value1 		:= "0"
			ie.document.getElementById("superEditAllowToPass").value1 	:= "0"
			ie.document.getElementById("superEditFollowUp").value1 		:= "0"
			ie.document.getElementById("superEditQuickExtend").value1	:= "0"
			
			
			ie.document.getElementById("superEditEarlyAtty").value1 	:= "0"	; 17
			ie.document.getElementById("superEditEarlyIPP").value1	 	:= "0"	; 18
			ie.document.getElementById("superEditEarlyOAPat").value1 	:= "0"	; 19
			ie.document.getElementById("superEditEarlyExam").value1 	:= "0"	; 20
			ie.document.getElementById("superEditEarlyHK").value1 		:= "0"	; 21	
			ie.document.getElementById("superEditEarlyMO").value1	 	:= "0"	; 22
			ie.document.getElementById("superEditGraceEP").value1	 	:= "0"	; 23
			ie.document.getElementById("superEditGraceCN").value1	 	:= "0"	; 24
			ie.document.getElementById("superEditGraceCNAllow").value1 	:= "0"	; 25
			ie.document.getElementById("superEditFurtherAtty").value1 	:= "0"	; 26	
			ie.document.getElementById("superEditFurtherIPP").value1 	:= "0"	; 27
			ie.document.getElementById("superEditEarlyTMPL").value1		:= "0"	; 28
			ie.document.getElementById("superEditEarlyOATM").value1	 	:= "0"	; 29
			ie.document.getElementById("superEditEarlyRenewal").value1 	:= "0"	; 30
			ie.document.getElementById("superEditFurtherTM").value1	 	:= "0"	; 31
			ie.document.getElementById("superEditEarlyDiv").value1		:= "0"	; 32			

			ie.document.getElementById("superEditDaysButton1").value1	:= "0"	; 33		
			ie.document.getElementById("superEditDaysButton2").value1	:= "0"	; 34		
			ie.document.getElementById("superEditDaysButton3").value1	:= "0"	; 35		
			ie.document.getElementById("superEditDaysButton4").value1	:= "0"	; 36		
			ie.document.getElementById("superEditDaysButton5").value1	:= "0"	; 37		
			ie.document.getElementById("superEditDaysButton6").value1	:= "0"	; 38	
			return
		} 
	else if InStr(ie.LocationURL, "CountryApplication") || InStr(ie.LocationURL, "tmkfrmtrademark")
		{
		Loop % ie.document.querySelectorAll("input[type=image]").length
			{
			if (ie.document.querySelectorAll("input[type=image]")[A_Index - 1].title == "Update")
				{
				checkSuperEdit2 := ie.document.getElementById("superEditMainClose").value
				if (checkSuperEdit2 == "")
					{
					if !InStr(ie.document.querySelectorAll("input[type=image]")[A_Index - 1].id, "goods")
						{
						superEditMainButton =
						(
						<br>
						<input type="button" id="superEditMainClose" value1=0 value="Close" onclick="this.value1 = '1';">
						<input type="button" id="superEditMainAppFiled" value1=0 value="App Filed" onclick="this.value1 = '1';">
						<input type="button" id="superEditMainFilingReceipt" value1=0 value="Filing Receipt" onclick="this.value1 = '1';">
						)

						ie.document.getElementsByTagName("TextArea")[2].insertAdjacentHTML("afterend", superEditMainButton)
						}
					else if InStr(ie.document.querySelectorAll("input[type=image]")[A_Index - 1].id, "goods")
						{
						goodsButton =
						(
						<input type="image" style="display: none;" src="/Knobbe/WebResource.axd?d=QC49OatwyQz_bZHXh-Qx6jefkkbvBbx1wcN2gLUMXB0vTDkMw7FfguEAcPxDN97nV8hgEq8rH7qHELCKRomGiy25-yyYlQVzWJUPF-Wzl4d9N6o0FQ21zdFS2Mhn-a-TnsbN6pGR8fuaxw_3cwyVuC0BzSE1&t=637365666515807387" id="superEditMainClose" value1=0 value="Adjust" onload="
						var temp = document.getElementsByTagName('TEXTAREA')[2].value;
						temp = temp.replace(/\r\n|\r|\n/g, '');
						document.getElementsByTagName('TEXTAREA')[2].value = temp;
						">
						)

						ie.document.getElementsByTagName("TextArea")[2].insertAdjacentHTML("afterend", goodsButton)
						; ie.document.getElementsByTagName('TEXTAREA')[2].value := temp;
						ie.document.getElementsByTagName("TEXTAREA")[2].rows := "10"
						
						}
					}
				}
			}
			
				
		checkSuperEditMainClose := ie.document.getElementById("superEditMainClose").value1
		if (checkSuperEditMainClose == "1")
			{
			ie.document.getElementById("superEditMainClose").value1 := "0"
			ie.document.getElementsByTagName("TextArea")[2].value := TodayStyled " - -TDICKSON`n" . ie.document.getElementsByTagName("TextArea")[2].value
			ie.document.getElementsByClassName("riTextBox riEnabled DetailValue")[0].value := TodayStyled
			InsertDate(TodayStyled)
			ie.document.getElementsByClassName("riTextBox riEnabled DetailValue")[0].focus()
			ie.document.getElementsByClassName("riTextBox riEnabled DetailValue")[0].blur()			
			
			Sleep 500
			Loop % ie.document.querySelectorAll("input[type=image]").length
				{
				if (ie.document.querySelectorAll("input[type=image]")[A_Index - 1].title == "Update")
					{
					ie.document.querySelectorAll("input[type=image]")[A_Index - 1].focus()
					ie.document.querySelectorAll("input[type=image]")[A_Index - 1].click()
					break
					}
				}
			}

		checkSuperEditMainAppFiled := ie.document.getElementById("superEditMainAppFiled").value1
		if (checkSuperEditMainAppFiled == "1")
			{
			ie.document.getElementById("superEditMainAppFiled").value1 := "0"
			ie.document.getElementsByTagName("TextArea")[2].value := TodayStyled " - FA confirm app filed. -TDICKSON`n" . ie.document.getElementsByTagName("TextArea")[2].value
			ie.document.getElementsByClassName("riTextBox riEnabled DetailValue")[0].value := TodayStyled
			InsertDate(TodayStyled)
			ie.document.getElementsByClassName("riTextBox riEnabled DetailValue")[0].focus()
			ie.document.getElementsByClassName("riTextBox riEnabled DetailValue")[0].blur()			
			
			Sleep 500
			Loop % ie.document.querySelectorAll("input[type=image]").length
				{
				if (ie.document.querySelectorAll("input[type=image]")[A_Index - 1].title == "Update")
					{
					ie.document.querySelectorAll("input[type=image]")[A_Index - 1].focus()
					ie.document.querySelectorAll("input[type=image]")[A_Index - 1].click()
					break
					}
				}
			}			

		checkSuperEditMainFilingReceipt := ie.document.getElementById("superEditMainFilingReceipt").value1
		if (checkSuperEditMainFilingReceipt == "1")
			{
			ie.document.getElementById("superEditMainFilingReceipt").value1 := "0"
			ie.document.getElementsByTagName("TextArea")[2].value := TodayStyled " - Filing receipt recvd. -TDICKSON`n" . ie.document.getElementsByTagName("TextArea")[2].value
			ie.document.getElementsByClassName("riTextBox riEnabled DetailValue")[0].value := TodayStyled
			InsertDate(TodayStyled)
			ie.document.getElementsByClassName("riTextBox riEnabled DetailValue")[0].focus()
			ie.document.getElementsByClassName("riTextBox riEnabled DetailValue")[0].blur()			
			
			Sleep 500
			Loop % ie.document.querySelectorAll("input[type=image]").length
				{
				if (ie.document.querySelectorAll("input[type=image]")[A_Index - 1].title == "Update")
					{
					ie.document.querySelectorAll("input[type=image]")[A_Index - 1].focus()
					ie.document.querySelectorAll("input[type=image]")[A_Index - 1].click()
					break
					}
				}
			}				
		}
	}

if (ie.document.getElementById("ctl00_Detail_UpdateButton_input").value == "Save")
	{
	gosub FixBiblio
	Sleep 250
	ie.document.getElementById("ctl00_Detail_AppTitle").readonly := "true"
	ie.document.getElementById("ctl00_Detail_AppClientRef").readonly := "true"
	ie.document.getElementById("ctl00_Detail_AppTitle").disabled := "true"
	ie.document.getElementById("ctl00_Detail_AppClientRef").disabled := "true"	
	ie.document.getElementById("ctl00_Detail_AppTitle").style.backgroundColor := "#DDDDDD"
	ie.document.getElementById("ctl00_Detail_AppClientRef").style.backgroundColor := "#DDDDDD"	
	ie.document.getElementById("ctl00_Detail_AppTitle").style.color := "black"
	ie.document.getElementById("ctl00_Detail_AppClientRef").style.color := "black"
	MsgBox, 4096, Temporarily pausing AHK so you can edit a main page., Due to some weirdness with the new CPi, the script needs to be paused in order to Edit and Save on the main pages.`n`nAfter you are done editing and saving, close this pop-up to enable the script again.`n`nThis is a temporary fix until I can think of something better.
	}
return	

ExtendDays(newdate, plusdays)
	{
	year  := SubStr(newdate, 8,4)
	month := SubStr(newdate, 4,3) 
	day   := SubStr(newdate, 1,2)

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

	if (plusdays >= 100)
		{
		if (plusdays == 100)
			year++
		else
			{
			plusdays := SubStr(plusdays, 0, 1)
			newmonth += plusdays
			if (newmonth > 12)
				{
				newmonth -= 12
				year++
				}
				
			if (newmonth < 10)
				newmonth := "0" newmonth
			}
		
			if (newmonth == 02)
				{
				if (year == 2024) || (year == 2028)
					{
					if (day > 29)
						day = 29
					}
				else if (day > 28)
					day = 28
				}
			else if (newmonth == 04)
				{
				if (day > 30)
					day = 30
				}				
			else if (newmonth == 06)
				{
				if (day > 30)
					day = 30
				}					
			else if (newmonth == 09)
				{
				if (day > 30)
					day = 30
				}					
			else if (newmonth == 11)
				{
				if (day > 30)
					day = 30
				}					
		newDate := year . newmonth . day
		}
	else
		{
		newDate := year . newmonth . day
		newDate += %plusdays%, days		
		}
		
	FormatTime, newDate, %newDate%, MM/dd/yyyy
	return newDate
	}
	
InsertAtty(attorney)
	{
	ie := WBGet()
	ie.document.getElementsByClassName("rcbInput")[1].value := attorney
	otherField := ie.document.getElementsByClassName("rcbInput")[1].id
	otherField := StrReplace(otherField, "Input", "ClientState")
	ie.document.getElementById(otherField).value := "{'logEntries':[],'value':'" attorney "','text':'" attorney "','enabled':true,'checkedIndices':[],'checkedItemsTextOverflows':false}"
	}
	
InsertDate(insertedDate)
	{
	ie := WBGet()
	otherField := ie.document.getElementsByClassName("riTextBox riEnabled DetailValue")[0].id
	otherField := otherField . "_ClientState"
	ie.document.getElementById(otherField).value := "{'enabled':true,'emptyMessage':'','validationText':'" SubStr(insertedDate, 1, 4) "-" SubStr(insertedDate, 5, 2) "-" SubStr(insertedDate, 7, 2) "-00-00-00','valueAsString':'" SubStr(insertedDate, 1, 4) "-" SubStr(insertedDate, 5, 2) "-" SubStr(insertedDate, 7, 2) "-00-00-00','minDateStr':'1000-01-01-00-00-00','maxDateStr':'9999-12-31-00-00-00','lastSetTextBoxValue':" TodayDocket "}"
	}

InsertResponseSentDate(insertedDate)
	{
	ie := WBGet()
	otherField := ie.document.getElementById("ctl00_Detail_tplFormview_ResponseDate_dateInput").id
	otherField := otherField . "_ClientState"
	ie.document.getElementById(otherField).value := "{'enabled':true,'emptyMessage':'','validationText':'" SubStr(insertedDate, 1, 4) "-" SubStr(insertedDate, 5, 2) "-" SubStr(insertedDate, 7, 2) "-00-00-00','valueAsString':'" SubStr(insertedDate, 1, 4) "-" SubStr(insertedDate, 5, 2) "-" SubStr(insertedDate, 7, 2) "-00-00-00','minDateStr':'1000-01-01-00-00-00','maxDateStr':'9999-12-31-00-00-00','lastSetTextBoxValue':" TodayDocket "}"
	}
	
;InsertDueDate(insertedDate)
;	{
;	ie := WBGet()
;	otherField := ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_DueDate_dateInput").id
;	otherField := otherField . "_ClientState"
;	ie.document.getElementById(otherField).value := "{'enabled':true,'emptyMessage':'','validationText':'" SubStr(insertedDate, 1, 4) "-" SubStr(insertedDate, 5, 2) "-" SubStr(insertedDate, 7, 2) "-00-00-00','valueAsString':'" SubStr(insertedDate, 1, 4) "-" SubStr(insertedDate, 5, 2) "-" SubStr(insertedDate, 7, 2) "-00-00-00','minDateStr':'1000-01-01-00-00-00','maxDateStr':'9999-12-31-00-00-00','lastSetTextBoxValue':" TodayDocket "}"
;	}

	

InsertIndicator(insertedIndicator)
	{
	ie := WBGet()
	ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_Indicator_Arrow").click()
	ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_Indicator_Input").value := insertedIndicator
	otherField := ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_Indicator_Input").id
	otherField := otherField . "_ClientState"
	ie.document.getElementById(otherField).value := "{'logEntries':[],'value':'"  insertedIndicator "','text':'" insertedIndicator "','enabled':true,'checkedIndices':[],'checkedItemsTextOverflows':false}"
	ie.document.getElementById("ctl00_Detail_rgdActionDueDate_ctl00_ctl02_ctl02_Indicator_Arrow").click()
	}
	
ClickSave:
Loop % ie.document.getElementsByTagName("INPUT").length
	{
	if (ie.document.getElementsByTagName("INPUT")[A_Index - 1].value == "Save")
		{
		ie.document.getElementsByTagName("INPUT")[A_Index - 1].click()
		break
		}
	}	
return	
	
FixBiblio:
ie.document.getElementById("ctl00_Detail_Applicant").style.width := "310px"	
ie.document.getElementById("ctl00_Detail_Owner").style.width := "110px"	
ie.document.getElementById("ctl00_Detail_OwnerName").style.width := "150px"	
ie.document.getElementById("ctl00_Detail_AgentName").style.width := "149px"	
ie.document.getElementById("ctl00_Detail_AgentRef").style.width := "215px"	
ie.document.getElementById("ctl00_Detail_CountryOrigin").style.width := "110px"	
ie.document.getElementById("ctl00_Detail_ClientName").style.width := "200px"	
ie.document.getElementById("ctl00_Detail_CountryName").style.width := "200px"	
ie.document.getElementById("ctl00_Detail_Client").style.width := "180px"	
ie.document.getElementById("ctl00_Detail_TrademarkName").style.width := "340px"	
;	ie.document.getElementById("ctl00_Detail_CountryName").style.width := "255px"	
ie.document.getElementById("ctl00_Detail_ClientRef").style.width := "255px"	
ie.document.getElementById("ctl00_Detail_rgdGoods").style.width := "99.5%"	
;	ie.document.getElementById("ctl00_Detail_GoodsView").className := "DetailTab"	
ie.document.getElementById("ctl00_Detail_rgdGoods").style.height := "290px"	
ie.document.getElementById("ctl00_Detail_rgdGoods_GridData").style.height := "100%"	
ie.document.getElementById("ctl00_Detail_pnlCaseInfo").getElementsByTagName("TABLE")[0].getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[0].getElementsByTagName("TD")[0].style.paddingRight := "0px"

ie.document.getElementById("RAD_SPLITTER_PANE_CONTENT_ctl00_Detail_panesplitAtty").style.height := "100%"	
ie.document.getElementById("ctl00_Detail_rgdAttorney").style.height := "100%"	
ie.document.getElementById("ctl00_Detail_rgdAttorney_GridData").style.height := "100%"	
ie.document.getElementById("ctl00_Detail_tplFormview_CaseNumber").style.width := "150px"	

if InStr(ie.LocationURL, "tmkfrmActionDue")
	ie.document.getElementById("ctl00_Detail_tplFormview_ActionType").style.width := "400px"


; Patent related.
if InStr(ie.LocationURL, "patfrm")
	ie.document.getElementById("ctl00_Detail_CaseNumber").style.width := "180px"
else
	ie.document.getElementById("ctl00_Detail_CaseNumber").style.width := "175px"	
ie.document.getElementById("ctl00_Detail_DisclosureStatus").style.width := "110px"	
ie.document.getElementById("ctl00_Detail_DisclosureDate_wrapper").style.width := "155px"	
ie.document.getElementById("ctl00_Detail_InvTitle").rows := "4"	
ie.document.getElementById("ctl00_Detail_InvTitle").style.width := "50%"	
ie.document.getElementById("ctl00_Detail_FamilyNumber").style.width := "200px"	
ie.document.getElementById("ctl00_Detail_Country").style.width := "75px"	
ie.document.getElementById("ctl00_Detail_Agent").style.width := "155px"	
ie.document.getElementById("ctl00_Detail_AppTitle").style.width := "80%"	
ie.document.getElementById("ctl00_Detail_CaseInfoView").style.overflow := "hidden"
ie.document.getElementById("ctl00_Detail_pnlHeaderInfo").getElementsByTagName("TABLE")[0].getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[0].getElementsByTagName("TD")[0].width := "10%"
ie.document.getElementById("ctl00_Detail_AppTitle").readonly := "true"
ie.document.getElementById("ctl00_Detail_AppClientRef").readonly := "true"
ie.document.getElementById("ctl00_Detail_AppTitle").disabled := "true"
ie.document.getElementById("ctl00_Detail_AppClientRef").disabled := "true"	
ie.document.getElementById("ctl00_Detail_AppTitle").style.color := "black"
ie.document.getElementById("ctl00_Detail_AppClientRef").style.color := "black"
ie.document.getElementById("ctl00_Detail_AppTitle").style.backgroundColor := "#DDDDDD"
ie.document.getElementById("ctl00_Detail_AppClientRef").style.backgroundColor := "#DDDDDD"



;if (ie.document.getElementById("ctl00_Detail_rgdAction_ctl00_ctl03_ctl01_PageSizeComboBox_Input").id != "");
;	{
;	ie.document.getElementById("ctl00_Detail_rgdAction_ctl00_ctl03_ctl01_PageSizeComboBox_Arrow").click()
;	ie.document.getElementsByClassName("rcbList")[0].click()
;	ie.document.getElementsByClassName("rcbList")[0].getElementsByTagName("li")[2].click()
;	}

remarksSpace =
(		
<div style="text-align: left;">
<input type="button" id="editRemarksMain" value1="0" value="Edit" style="width:60px; height: 30px;" onclick="document.getElementById('ctl00_Detail_EditButton_input').click();">
<input type="button" id="insertRemarksMain" value1="0" value="Insert Space" style="width:95px; height: 30px;" onclick="var temp = document.getElementById('ctl00_Detail_Remarks').value; document.getElementById('ctl00_Detail_Remarks').value = '\r\n' + temp; getElementById('ctl00_Detail_Remarks').focus();">
</div>
)
	
checkRemarksButton := ie.document.getElementById("insertRemarksMain").id
if (checkRemarksButton == "" && !InStr(ie.LocationURL, "ActionDue"))
	{
	ie.document.getElementById("ctl00_Detail_Remarks").insertAdjacentHTML("afterend", remarksSpace)
	ie.document.getElementById("ctl00_Detail_Remarks").style.fontSize := "20px"
	ie.document.getElementById("ctl00_Detail_Remarks").rows := "11"
	}

return		
	
changeButtonColor:
ie.document.getElementById("noteEdit").style.backgroundColor := "#A6F4FF"
ie.document.getElementById("noteArea").style.backgroundColor := "#E4E4E4"
ie.document.getElementById("noteEdit").value := "Edit"
return	

UpdateStatus:
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ABAStatus := ie.document.getElementById("ABAStatus").value
ABACloseDate := ie.document.getElementById("ABACloseDate").value
RespAtty := ie.document.getElementById("ABARespAtty").value

MsgBox, % ABAStatus

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


MsgBox, need to work on this.

gosub DocketNewAction
return


DocketABAAction:
ie := WBGet()
ABAStatus 	 := ie.document.getElementById("ABAStatus").value
ABACloseDate := ie.document.getElementById("ABACloseDate").value
RespAtty := ie.document.getElementById("ABARespAtty").value
IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty

MsgBox, need to work on this.


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



CloseDisclosureAuto:
MsgBox, Need to work on this.
return
	
	
ReplaceMonth(date) 
	{
	day := SubStr(date, 1, 2)
	month := SubStr(date, 4, 3)
	year := SubStr(date, 8, 4)
	
	if InStr(month, "Jan")
		month := "01"
	if InStr(month, "Feb")
		month := "02"
	if InStr(month, "Mar")
		month := "03"
	if InStr(month, "Apr")
		month := "04"
	if InStr(month, "May")
		month := "05"
	if InStr(month, "Jun")
		month := "06"
	if InStr(month, "Jul")
		month := "07"
	if InStr(month, "Aug")
		month := "08"
	if InStr(month, "Sep")
		month := "09"
	if InStr(month, "Oct")
		month := "10"
	if InStr(month, "Nov")
		month := "11"
	if InStr(month, "Dec")
		month := "12"

	updatedDate := year . month . day	
	return updatedDate
	}
	
SystemSwitch(URL) 
{
if InStr(URL, "Invention")
	{
	if InStr(URL, "knobbeagent/patent/patfrmInvention")
		newURL := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplication.aspx?key=" GetAppID()	
	else if InStr(URL, "knobbe/patent/patfrmInvention")
		newURL := "https://web05bak.computerpackages.com/knobbeAgent/patent/patfrmCountryApplication.aspx?key=" GetAppID()	
	}
else if InStr(URL, "ActionDue") ; Inside Actions
	{
	; AT Patent Action to Live Page	
	if InStr(URL, "KnobbeAgent/patent/patfrmActionDue")
		newURL := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplication.aspx?key=" GetAppID()
	; Live Patent Action to AT Page	
	else if InStr(URL, "knobbe/patent/patfrmActionDue")
		newURL := "https://web05bak.computerpackages.com/knobbeAgent/patent/patfrmCountryApplication.aspx?key=" GetAppID()	
	; AT TM Action to Live Page	
	else if InStr(URL, "knobbeAgent/trademark/tmkfrmActionDue")
		newURL := "https://web05.computerpackages.com/knobbe/trademark/tmkfrmTrademark.aspx?nkey=" GetTmkID()	
	; Live TM Action to AT Page	
	else if InStr(URL, "knobbe/trademark/tmkfrmActionDue")
		newURL := "https://web05bak.computerpackages.com/knobbeAgent/trademark/tmkfrmTrademark.aspx?nkey=" GetTmkID()	
	}
else  ; On Main Pages
	{
	if InStr(URL, "knobbeagent/patent/patfrmCountryApplication")
		newURL := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplication.aspx?key=" GetAppID()			
	else if InStr(URL, "knobbe/patent/patfrmCountryApplication")
		newURL := "https://web05bak.computerpackages.com/knobbeAgent/patent/patfrmCountryApplication.aspx?key=" GetAppID()		
	else if InStr(URL, "KnobbeAgent/trademark/tmkfrmTrademark")
		newURL := "https://web05.computerpackages.com/knobbe/trademark/tmkfrmTrademark.aspx?nkey=" GetTmkID()			
	else if InStr(URL, "Knobbe/trademark/tmkfrmTrademar")
		newURL := "https://web05bak.computerpackages.com/knobbeAgent/trademark/tmkfrmTrademark.aspx?nkey=" GetTmkID()			
	}

Run, % newURL
}


AttyFinder(Attys)
{
ie := WBGet()
location := ie.LocationURL

ie.document.getElementById("attyFinder").value := "Working..."

IniRead, ATPartner, C:\Users\%Computername%\AHKPrefs.ini, Username, ATPartner
; ATPartner := "Jackie"	

AllAttys := ""
Loop % Attys.Length()
	{
	if (AllAttys == "")
		AllAttys := Attys[A_Index]
	else
		AllAttys := AllAttys "," Attys[A_Index]
	}
	
;;;;;;;;;;;;;;;;;;; IF THEY EVER CHANGE MLEAP OR SMNPH, LOOK HERE! SEARCH FOR MLEAP! ;;;;;;;;;;;;;;;;;;;;;;;
if InStr(AllAttys, "A3C") && InStr(AllAttys, "B3M")
	AllAttys := StrReplace(AllAttys, "A3C", "B3M")
else if InStr(AllAttys, "J3J") && InStr(AllAttys, "N3J")
	AllAttys := StrReplace(AllAttys, "J3J", "N3J")
;;;;;;;;;;;;;;;;;;; IF THEY EVER CHANGE MLEAP OR SMNPH, LOOK HERE! SEARCH FOR MLEAP! ;;;;;;;;;;;;;;;;;;;;;;;

Sort, AllAttys, U D,
NewAttys := StrSplit(AllAttys, ",")

Loop % NewAttys.Length()
	{
	tempAtty := NewAttys[A_Index]
	IniRead, newTempAtty, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini,  Attorneys, %tempAtty%

	if (newTempAtty == "ERROR")  ; If attorney is not an irregular one, sets AttyTest to 2aty team.
		 NewAttys[A_Index] := "2" . NewAttys[A_Index]
	else
		NewAttys[A_Index] := newTempAtty
		 
	tempLength := StrLen(newTempAtty)
	if (tempLength > 30)                       ; If string is greater than 30 characters, meaning a runaway/blank array, sets array to blank.
		NewAttys[A_Index] := ""
	}

NewAttyString := ""
Loop % NewAttys.Length()
	{
	if (NewAttyString == "")
		NewAttyString := NewAttys[A_Index]
	else
		NewAttyString := NewAttyString ", " NewAttys[A_Index]
	}
	
if InStr(location, "ActionDue")
	Country := ie.document.getElementById("ctl00_Detail_tplFormview_Country").value
else if InStr(location, "tmkfrmtrademark")
	Country := ie.document.getElementById("ctl00_Detail_Country_Input").value
else if InStr(location, "Invention")
	Country := ""

if InStr(location, "countryapplication")
	ClientCode := ie.document.getElementById("ctl00_Detail_CaseNumber_Input").value
else if InStr(location, "ActionDue")
	ClientCode := ie.document.getElementById("ctl00_Detail_tplFormview_CaseNumber").value
else if InStr(location, "Invention") || InStr(location, "tmkfrmtrademark")
	ClientCode := ie.document.getElementById("ctl00_Detail_CaseNumber").value


FORUS := ".knobbe@knobbe.imanage.work"

if InStr(Country, "US")
	{
	if (ATPartner == "-none-")
		NewAttyString := NewAttyString . ", *FORUS, " . ClientCode . FORUS
	else
		NewAttyString := NewAttyString . ", " ATPartner . ", *FORUS, " . ClientCode . FORUS	
	}
else if (Country != "")
	{
	if (ATPartner == "-none-")
		NewAttyString := NewAttyString
	else
		NewAttyString := NewAttyString . ", " ATPartner
	}
else if (Country == "")
	{
	MsgBox, 0, Is this *FORUS?,Click OK if it is.`n`nOtherwise`, I'll assume it isn't., 3
	ifMsgBox OK
		{
		if (ATPartner == "-none-")
			NewAttyString := NewAttyString . ", *FORUS, " . ClientCode . FORUS
		else
			NewAttyString := NewAttyString . ", " ATPartner . ", *FORUS, " . ClientCode . FORUS			
		}
	ifMsgBox TIMEOUT		
		{
		if (ATPartner == "-none-")
			NewAttyString := NewAttyString
		else
			NewAttyString := NewAttyString . ", " ATPartner
		}
	}
	
Clipboard := NewAttyString
ie.document.getElementById("attyFinder").value := "Copied!"
return
}
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                          ;;;;
;;;;     HOT KEYS GO HERE     ;;;;
;;;;                          ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Record Opener
!LButton:: 
!RButton::
Clipboard := ""
SendInput, ^c
ClipWait, 1

if (A_ThisHotKey == "!RButton")
	OutputVar := "https://web05.computerpackages.com/knobbe/patent/patschcountryapplication.aspx"
else if (A_ThisHotKey == "!LButton")
	OutputVar := "https://web05.computerpackages.com/knobbe/trademark/tmkschTrademark.aspx"

ie := WBGet()
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

; CapsTap
#CapsLock::
capsToggle := !capsToggle
	if capsToggle
		SetCapsLockState, On
	else
		SetCapsLockState, Off
return

CapsLock::
IfWinActive, ahk_class XLMAIN
	SendInput, %Today%{Shift down}{ENTER}{Shift up}
else IfWinActive, ahk_class IEFrame
	return 
else 
	{
	ie := WBGet()
	URL := ie.LocationURL ;grab current url
	if InStr(URL, "ActionDue")
		ClientCodeNew := ie.document.getElementById("ctl00_Detail_tplFormview_CaseNumber").Value
	else
		ClientCodeNew := ie.document.getElementById("ctl00_Detail_CaseNumber").Value
	SendRaw, % StrReplace(ClientCodeNew, " ", "")
	}
return


$^o::
IfWinActive, ahk_class IEFrame
	{
	ie := WBGet()
	ie.document.getElementById("ctl00_Detail_EditButton_input").Click()
	Sleep 500
	while ie.document.getElementById("ctl00_Detail_UpdateButton_input").value == ""
		Sleep, 200

	oppNumber := ie.document.getElementById("ctl00_Detail_tplFormview_ActionType").value
	oppNumber := StrReplace(oppNumber, "Deadline to File Opposition (", "")
	oppNumber := StrReplace(oppNumber, ")", "")

	oppRemarks =
	(
	Possible Opposition against:
	Application #: %oppNumber%
	Mark: *
	Applicant: *
	Class: *
	Our Mark: HANBEV.204GEN
	)

	ie.document.getElementById("ctl00_Detail_Remarks").value := oppRemarks
	return
	}
else
	SendInput, {Ctrl down}o{Ctrl up}
return

RCtrl & Right::
ie := WBGet()

if InStr(ie.LocationURL, "patfrmCountryApplication")
	numTabs = 14
else if InStr(ie.LocationURL, "ActionDue")
	numTabs = 3
else if InStr(ie.LocationURL, "patfrmInvention")
	numTabs = 7	
else if InStr(ie.LocationURL, "tmkfrmtrademark")
	numTabs = 13
	
if (tabNumber < numTabs)
	tabNumber++
else
	tabNumber = numTabs
	
ie.document.getElementsByClassName("rtsLink")[tabNumber].click()	
return

RCtrl & Left::
ie := WBGet()

if (tabNumber > 0)
	tabNumber--
else
	tabNumber = 0
	
ie.document.getElementsByClassName("rtsLink")[tabNumber].click()
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



GetAppID() {
user := "Paperboy@knobbe.com"
pass := "knobbedocket"
ie := WBGet()
CPIClientCode := ie.document.getElementById("ctl00_Detail_tplFormview_CaseNumber").value
CPIClientCode2 := ie.document.getElementById("ctl00_Detail_CaseNumber").value

if (CPIClientCode == "")
	CPIClientCode := CPIClientCode2

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
return % value.Table[1].appid
}

GetTmkID() {
user := "Paperboy@knobbe.com"
pass := "knobbedocket"
ie := WBGet()
CPIClientCode := ie.document.getElementById("ctl00_Detail_tplFormview_CaseNumber").value
CPIClientCode2 := ie.document.getElementById("ctl00_Detail_CaseNumber").value

if (CPIClientCode == "")
	CPIClientCode := CPIClientCode2

EndPoint1 := "https://web05.computerpackages.com/knobbews/api/Knobbe?queryString="
EndPoint2 := "select tmkid from tblTmkTrademark WHERE casenumber "
EndPoint3 := "= '" CPIClientCode "';"
http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http.Open("GET", EndPoint1 . EndPoint2 . EndPoint3, true)
http.SetRequestHeader("Authorization", "Basic "  Base64Encode(user ":" pass) )
http.Send()
while (http.Responsetext == "")
	Sleep 100
value := JSON.Load(http.Responsetext)
return % value.Table[1].tmkId
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
