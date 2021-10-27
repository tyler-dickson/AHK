#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, pifmgr.dll, 31
CoordMode, ToolTip 

global NewAckDate
global NewConfDate

StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}

if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder	

FormatTime, Today, , yyyyMMdd

GuiStatus := "Show"
Gui, Adjust: New, AlwaysOnTop ToolWindow, 
Gui, Adjust: Add, Button, w220 gStoreOADeadline, Grab OA Deadline from OA action.`n`n(Grabs Due Date of lowest Action Due.)`n(Doesn't grab Base Date!)
Gui, Adjust: Font, bold underline
;Gui, Adjust: Add, Text, w225 Center, New Acknowledgment Date
;Gui, Adjust: Add, MonthCal, wp vNewAckDate, %Today%
;Gui, Adjust: Add, Text,   wp Center, New Confirmation Date
;Gui, Adjust: Add, MonthCal, wp vNewConfDate, %Today%
Gui, Adjust: Font, 
Gui, Adjust: Font, bold s14
Gui, Adjust: Add, Button, wp h30 gRunDateAdjuster, Adjust Dates
Gui, Adjust: Font, 
Gui, Adjust: Font, bold
;if (Computername != "ThuyQuyen.Nguyen")
;	Gui, Adjust: Add, Button, wp h40 gCopyActionToAT, Copy Action to Other System`n(Copy, save, then adjust!)
Gui, Adjust: Show
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
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value

if (ActionType == "")
	{
	GuiControl, , Button2, Not on an action!
	Sleep 2000
	GuiControl, , Button2, Copy Action to Other System`n(Consider copying then adjusting!)
	return
	}

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

StoreOADeadline:
ie := WBGet()
NumberOfInputs := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR").length

Actions 	:= []
DueDates 	:= []
Indics 		:= []
Takens 		:= []
Resps 		:= []
Rmks 		:= []

Loop % NumberOfInputs
	{
	Actions.Push(ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("TD")[0].innerText)
	ActionDueTemp := ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("TD")[0].innerText
	StringSplit, Remarks, ActionDueTemp, `r`n

	Rmks.Push(Remarks3)
	
	DueDates.Push(ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("TD")[1].innerText)
	Indics.Push(ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("TD")[3].innerText)
	Takens.Push(ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("TD")[4].innerText)
	Resps.Push(ie.document.getElementById("dgdDueDate").getElementsByTagName("TBODY")[0].getElementsByTagName("TR")[A_Index - 1].getElementsByTagName("TD")[5].innerText)

	Gui, Adjust: Add, Text, h15, % Actions[A_Index] " | " DueDates[A_Index] " | " Indics [A_Index] " | " Takens[A_Index] " | " Resps[A_Index] " | " Rmks[A_Index]
	
	}

Gui, Adjust:  Show, h300 w400

;GuiControl, , SysMonthCal321, % ConvertDateToString(duedate1)
;GuiControl, , SysMonthCal322, % ConvertDateToString(duedate2)
return

RunDateAdjuster:
Gui, Adjust: Submit, NoHide
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

if (ActionType == "")
	{
	GuiControl, , Button1, Not on an action!
	Sleep 2000
	GuiControl, , Button1, Adjust Dates
	return
	}
	
SetTimer, RefreshGUIOpp, 500
var := ie.LocationURL ; grab current url
var2 := ie.document.getElementById("btn_edtDueDate").OuterHTML
TempHTML := var2
HTMLArray := StrSplit(var2, "Key=")
StringSplit, ActionID, % HTMLArray[2], '

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

if InStr(newvar, "-1")
	StringReplace, newvar, newvar, -1, %ActionID1%
	
Gui, Opp: New, ToolWindow AlwaysOnTop, Outgoing Opposition Actions
Gui, Opp: Add, Button, gNewAdjustAction2, Test Button
Gui, Opp: Add, ActiveX, w800 h500 x0 y0 vie2, Shell.Explorer  	; The final parameter is the name of the ActiveX component.
ie2.Navigate(newvar)  											; This is specific to the web browser control.
IniRead, CustomColor, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowColor
Gui, Opp: Color, %CustomColor%
OnMessage(0x100, "gui_KeyDown", 2) 								; [color=green]; This when the GUI is initialized.[/color]
ComObjConnect(ie2, ie_events)  									; Connect ie's events to the ie_events class object.
newheight := winposY + (winposH/2 - 225)
newwidth  := winposX + (winposW/2 - 423)
	Gui, Opp: Show, x%newwidth% y%newheight% w780 h500 ; yCenter w845 h533
while ie2.busy or ie2.ReadyState != 4 						;Wait for page to load
	Sleep, 100

; gosub NewAdjustAction
gosub NewAdjustAction2
return

NewAdjustAction2:
ie.document.getElementById("fldstrActionType_TextBox").Value := "TEST TES TTEST TESTSE"
ie.document.getElementById("fldstrActionType_TextBox").style.fontWeight := "bold"
ie.document.getElementById("fldstrActionType_TextBox").style.backgroundColor := "lightgreen"
EditButtons := []

Loop % ie2.document.GetElementsBytagname("IMG").length 
	{
	Temp%A_Index% := ie2.document.GetElementsBytagname("IMG")[A_Index-1].OuterHTML
	ifinstring, Temp%A_Index% , edit
		EditButtons.Push(A_Index-1)
	}


backwards := EditButtons.Length()


Loop % EditButtons.Length() 
	{
	
	ie2.document.GetElementsBytagname("IMG")[EditButtons[backwards]].Click()
	Sleep 750																						; Wait .750 seconds
	ie2.document.GetElementsBytagname("INPUT")[1].Value := Indics[backwards]
	ie2.document.GetElementsBytagname("INPUT")[4].Value := DueDates[backwards]
	ie2.document.GetElementsBytagname("INPUT")[7].Value := Takens[backwards]
	ie2.document.GetElementsBytagname("INPUT")[8].Value := Resps[backwards]
	ie2.document.GetElementsBytagname("TEXTAREA")[0].Value := Rmks[backwards]

	gosub ClickSaveOpp
	Sleep 1000
	
	backwards--
	}
gosub OppGuiClose
return

NewAdjustAction:
ie.document.getElementById("fldstrActionType_TextBox").Value := "ADJUSTING DUE DATES. PLEASE WAIT..."
ie.document.getElementById("fldstrActionType_TextBox").style.fontWeight := "bold"
ie.document.getElementById("fldstrActionType_TextBox").style.backgroundColor := "lightgreen"
EditButtons := []

Loop % ie2.document.GetElementsBytagname("IMG").length 
	{
	Temp%A_Index% := ie2.document.GetElementsBytagname("IMG")[A_Index-1].OuterHTML
	ifinstring, Temp%A_Index% , edit
		EditButtons.Push(A_Index-1)
	}

Loop 2
	{
	ie2.document.GetElementsBytagname("IMG")[EditButtons[A_Index]].Click()
	Sleep 750																						; Wait .750 seconds

	if (A_Index < 2)
		{
		if InStr(ie2.document.GetElementsBytagname("INPUT")[3].Value, "Ack")							; Action Due
			{
			ie2.document.GetElementsBytagname("INPUT")[4].Value := ConvertDateToDocket(NewAckDate)		; Due Date
			gosub ClickSaveOpp
			Sleep 1000
			}
		else
			{
			ie2.document.GetElementsBytagname("INPUT")[4].Value := ConvertDateToDocket(NewConfDate)		; Due Date
			gosub ClickSaveOpp
			Sleep 1000
			}		
		}
	else
		{
		if (ie2.document.GetElementsBytagname("INPUT")[4].Value == ConvertDateToDocket(NewAckDate))
			{
			gosub ClickSaveOpp
			Sleep 1000				
			ie2.document.GetElementsBytagname("IMG")[EditButtons[A_Index-1]].Click()
			Sleep 750
			}
		
		if InStr(ie2.document.GetElementsBytagname("INPUT")[3].Value, "Confirm Evidence")			
			{
			gosub ClickSaveOpp
			Sleep 1000
			}		
		else if InStr(ie2.document.GetElementsBytagname("INPUT")[3].Value, "Conf")							; Action Due
			{
			ie2.document.GetElementsBytagname("INPUT")[4].Value := ConvertDateToDocket(NewConfDate)
			gosub ClickSaveOpp
			Sleep 1000
			}
		else if InStr(ie2.document.GetElementsBytagname("INPUT")[3].Value, "Opposition")
			{
			ie2.document.GetElementsBytagname("INPUT")[4].Value := ConvertDateToDocket(NewConfDate)		; Due Date
			gosub ClickSaveOpp
			Sleep 1000
			}	
		else
			{
			ie2.document.GetElementsBytagname("INPUT")[4].Value := ConvertDateToDocket(NewAckDate)		; Due Date
			gosub ClickSaveOpp
			Sleep 1000
			}		
		}
	}
gosub OppGuiClose
return

ConvertDateToString(SelectedDate)
{
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

convertedDate := year . newmonth . day
return convertedDate
}

ConvertDateToDocket(SelectedDate)
{
FormatTime, convertedDate, %SelectedDate%, dd-MMM-yyyy
return convertedDate
}	

;	ie2.document.getElementsByTagName("IMG")[2].Click()						; Click EDIT Button	
;	ie2.document.GetElementsBytagname("INPUT")[0].Value := "0"				; Nothing
;	ie2.document.GetElementsBytagname("INPUT")[1].Value := "1"				; Nothing
;	ie2.document.GetElementsBytagname("INPUT")[2].Value := "2"				; Nothing
;	ie2.document.GetElementsBytagname("INPUT")[3].Value := "3" 				; Action Due
;	ie2.document.GetElementsBytagname("INPUT")[5].Value := "5 Due Date"		; Indicator
;	ie2.document.GetElementsBytagname("INPUT")[6].Value := "6"				; Nothing
;	ie2.document.GetElementsBytagname("INPUT")[7].Value := "7"				; Date Taken
;	ie2.document.GetElementsBytagname("INPUT")[8].Value := "8"				; Responsible
;	ie2.document.GetElementsBytagname("TEXTAREA")[0].Value := "Remarks"		; Remarks

RefreshGUIOpp:
AS := ie2.document.GetElementsBytagname("A").length
INPUTS := ie2.document.GetElementsBytagname("INPUT").length
SPANS := ie2.document.GetElementsBytagname("SPAN").length
TEXTAREAS := ie2.document.GetElementsBytagname("TEXTAREA").length
IMGS := ie2.document.GetElementsBytagname("IMG").length
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
return

ChangeActionType:
Gui, Opp: Destroy
ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
ie.document.getElementByID("fldstrActionType_TextBox").style.color := "black"
ie.document.getElementByID("fldstrActionType_TextBox").style.fontWeight := "normal"
ie.document.getElementById("fldstrRemarks").value := ATDate . " Instructions to file opposition in China sent to FA. FA must provide an evidence deadline following filing of the opposition. " . Username . "`n`nApplication Number: " AppNo
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


; document.body.insertAdjacentHTML("afterbegin", "<iframe id='iframe' width='800' height='680' src='http://oc-docketing/CPi/patfrmActDueDate.aspx?key=10001755&bc=1&key2=1275806'></iframe>")
; document.body.insertAdjacentHTML("afterbegin", "<iframe id='iframe' width='800' height='380' src='http://oc-docketing/CPi/patfrmActDueDate.aspx?key=10001242&bc=1&key2=1275806'></iframe>")

