#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 68
; global reminderDate

TrayTip, Batch Task Creator, Highlight the data in your Excel spreadsheet`, then press Windows + T.

#t::
xl := ComObjActive("Excel.Application")
xl.Selection.Copy
TaskArray := StrSplit(Clipboard, "`n")
xl.CutCopyMode := False

Loop % TaskArray.Length() - 1
	{
	temp := StrReplace(TaskArray[A_Index], "`n")
	TempArray := StrSplit(temp, "`t")
	Run, % "C:\Program Files (x86)\Microsoft Office\Office16\outlook.exe /c ipm.task"
	WinWaitActive, ahk_class rctrl_renwnd32

	if instr((Name := ComObjType(ComObjActive("Outlook.Application").ActiveWindow, "Name")), "Inspector") ; https://docs.microsoft.com/en-us/office/vba/api/outlook.taskitem
	   OpenEmail := COMObjActive("Outlook.Application").ActiveInspector.CurrentItem
	else if instr(Name, "Explorer")
	   OpenEmail := COMObjActive("Outlook.Application").ActiveExplorer.Selection.Item(1)
	else
	   MsgBox, Active Outlook window is a %name% window
	StartDate := ConvertDate(TempArray[2])
	OpenEmail.Subject := TempArray[1] " | " TempArray[3] " | Due " StartDate
	OpenEmail.Body := "`n`n`n`n`n- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - `n" TempArray[1]  " | " TempArray[4] " | " TempArray[2] "`n" TempArray[3]
	OpenEmail.StartDate := StartDate      	; "6/2/2019"
	OpenEmail.DueDate := StartDate      	; "6/2/2019"
	; OpenEmail.Status := 1 ; https://docs.microsoft.com/en-us/office/vba/api/outlook.oltaskstatus
	
	Sleep 500
	}
return

/*
	1 = Client Code
	2 = Due Date
	3 = Action Due
	4 = Indicator
	5 = Status
	6 = SubCase
	7 = Due Date again.
*/

ConvertDate(SelectedDate) 
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

formattedTime := year . newmonth . day
	; reminderDate := formattedTime
	; reminderDate += -7, days
	; FormatTime, reminderDate, %reminderDate%, MM/dd/yyyy
formattedTime := newmonth "/" day "/" year
return formattedTime
}

/*
	fldstrCaseNumber_TextBox
	fldstrCountry_TextBox
	fldstrCountryName
	flddteFilDate
	fldstrAttorneys
	fldstrApplicationStatus
	fldstrAppNumber
	ie.LocationURL
*/

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