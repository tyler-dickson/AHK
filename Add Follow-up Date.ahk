#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, pifmgr.dll, 11
#Persistent
^o::
OutgoingOppActions:
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
	}
else if instr(ActionType, "INT-PAT OFFICE ACTION")
	{
	TrayTip, Adding Follow-up Dates, Please wait a few seconds...
	ie.document.getElementByID("fldstrActionType_TextBox").Value := "ADDING FOLLOW-UP DATES. PLEASE HOLD."
	ie.document.getElementByID("fldstrActionType_TextBox").style.color := "red"
	ie.document.getElementByID("fldstrActionType_TextBox").style.fontWeight := "bold"
	location := ie.LocationURL
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
	CNevidenceDate += -2, days
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
	}
else
	{
	MsgBox, This shortcut only works on "Deadline to File Opposition (" and "Opposition Filed? (" actions.
	return
	}
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
ie2.document.GetElementsBytagname("INPUT")[3].Value := "FA Ack Receipt of Response? / Asst"
ie2.document.GetElementsBytagname("INPUT")[4].Value := ackDate
gosub ClickSaveOpp
return

DocketOppCNEvidence:
ie.document.getElementByID("fldstrActionType_TextBox").Value := "ADDING CHECK EVIDENCE DATE..."
while ie2.busy or ie2.ReadyState != 4 						;Wait for page to load
	Sleep, 100
ie2.document.getElementById("btnNew").Click()
Sleep 750
ie2.document.GetElementsBytagname("INPUT")[3].Value := "FA Filing Confirmation of Response? / Asst"
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

ChangeActionType:
Gui, Opp: Destroy
ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
ie.document.getElementByID("fldstrActionType_TextBox").style.color := "black"
ie.document.getElementByID("fldstrActionType_TextBox").style.fontWeight := "normal"
; ie.document.getElementById("fldstrRemarks").value := ATDate . " Instructions to file opposition in China sent to FA. FA must provide an evidence deadline following filing of the opposition. " . Username . "`n`nApplication Number: " AppNo
ie.document.getElementById("btnSave").Click()
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