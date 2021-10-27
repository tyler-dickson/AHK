#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, imageres.dll , 119


TrayTip, Number Reformatter, Highlight number`, press Windows + N.`n`nWorks on 12/345678 and 12345678 type numbers.
return

!/::
FormatTime, Today, , yyyy-MM-dd
Send, %Today%
return

FormatTime, Today, , MMMM d, yyyy

Send, %TestText%
return

!o::
FormatTime, Today, , MMMM d, yyyy
TestText = 
(
Dear Colleagues:

We are pleased to report the ***** were filed on %Today% with the United States Patent and Trademark Office in the above-referenced patent application. Copies of the documents are attached. 

We will continue to keep you advised as further developments occur.  If you have any questions or wish additional information, please contact us.

Best regards,

)

Send, %TestText%
return

!f::
FormatTime, Today, , MMMM d, yyyy
TestText = 
(
Dear Colleagues,

We are pleased to report the **** were filed on %Today% in the above referenced patent application.  Copies of the documents as filed and the invoice will follow via email.

We will continue to keep you advised as further developments occur.  If you have any questions or wish additional information, please contact us.

Best Regards,
)

Send, %TestText%
return

^q::
Send, Re:`nTitle:`nUS Application No.:`nFiled:`nYour Reference:`nOur Reference: 
return

^w::
Send, US Application No.  (Y/R: O/R: ) 
return

^e::
Send, Dear Colleagues,`n`n Received with thanks.`n`nBest Regards,
return

^r::
Send, Please clear your hit for KBI Request 10379 as soon as possible. It has been on hold since 10/01/19 and I cannot open SMNPH.117 in CD until this KBI request clears.
return

^1::
Send, EFS ID:`nNeil S. Bartfeld (SD) `n$ `n`nThank you!,
return

^2::
Send, For your review and signature. Thanks!,
return

^3::
Send, Dear Colleagues, `n`nPlease find attached the invoice for this matter. `n`nBest Regards,
return

^4::
Send, Dear Colleagues, `n`nPlease find attached a copy of the invoice and documents as filed for this matter. `n`nBest Regards,
return

^5::

TestText = 
(
Dear Colleagues,

As a courtesy we are forwarding you a copy of the **** that we received from the United States Patent and Trademark Office in the above referenced patent.

If you have any questions or wish additional information, please contact us.

Best Regards,
)

Send, %TestText%
return


^0::
Send, Maintenance Fee Payment`n`nThird Party Paid
return


^Space::
Clipboard = 
SendInput, ^c
ClipWait, .2

if InStr(Clipboard, ",") || InStr(Clipboard, "-")
	{
	SelectedDate := Clipboard
	Clipboard := ReformatDate(SelectedDate)
	}
else 
	{
	SelectedNumber := Clipboard
	Clipboard := AddCommas(SelectedNumber)
	TrayTip, Number reformatted | %Clipboard%, Go ahead and paste it somewhere.
	}
return


^F1::
gosub GrabDocketInfo
FilingDate := ReformatDate(FilingDate)
IssueDate  := ReformatDate(IssueDate)
AppNumber := AddCommas(AppNumber)
PatentNumber := AddCommas(PatentNumber)
MsgBox, % "Client Code: " ClientCode "`nApplication #: " AppNumber "`nFiling Date: " FilingDate "`nPatent #: " PatentNumber "`nIssue Date: " IssueDate 
return


::faemail::
gosub GrabDocketInfo

FilingDate := ReformatDate(FilingDate)
AppNumber := AddCommas(AppNumber)

TextToWrite =
(
Re:
Title: %Title%
US Application No.: %AppNumber%
Filed: %FilingDate%
Your Reference: %Agent%
Our Reference: %ClientCode%
)

SendRaw, % TextToWrite
return


::fasub::
gosub GrabDocketInfo
AppNumber := AddCommas(AppNumber)
TextToWrite = US Application No. %AppNumber% (Y/R:%Agent%;O/R:%ClientCode%)
SendRaw, % TextToWrite
return

::fapat::
gosub GrabDocketInfo
FilingDate := ReformatDate(FilingDate)
IssueDate  := ReformatDate(IssueDate)
AppNumber := AddCommas(AppNumber)
PatentNumber := AddCommas(PatentNumber)

TextToWrite = 
(
Re:
Title: %Title%
US Patent No.: %PatentNumber%
Issued: %IssueDate%
Your Reference: %Agent%
Our Reference: %ClientCode%
)

SendRaw, % TextToWrite
return


::patsub::
ie := WBGet() 
gosub GrabDocketInfo
AppNumber := AddCommas(AppNumber)
PatentNumber := AddCommas(PatentNumber)
TextToWrite = US Patent No. %PatentNumber% (Y/R:%Agent%;O/R:%ClientCode%)
SendRaw, % TextToWrite
return









;;;;; Subroutine to grab IE handle and grab docketing information. Add new fields here!
;;;;; To add more, Inspect the element in docketing and find the id, NOT the name.
GrabDocketInfo: 
ie := WBGet() 
ClientCode 		:= ie.document.getElementById("fldstrCaseNumber_TextBox").value
AppNumber 		:= ie.document.getElementById("fldstrAppNumber").value
FilingDate 		:= ie.document.getElementById("flddteFilDate").value
PatentNumber 	:= ie.document.getElementById("fldstrPatNumber").value
IssueDate 		:= ie.document.getElementById("flddteIssDate").value
Title 			:= ie.document.getElementById("fldstrAppTitle").value
Agent			:= ie.document.getElementById("fldstrAgentRef").value
return

;;;;; Function to convert DD-MMM-YYYY to Month Day, Year & reformat Inventor names.
ReformatDate(Datedate) {
if InStr(Datedate, "20")
	{
	year := SubStr(Datedate, 8,4)
	month := SubStr(Datedate, 4, 3) 
	day := SubStr(Datedate, 1,2)
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
																	
	Datedate := newmonth " " day ", " year
	return Datedate
	}
else if InStr(Datedate, ",")
	{
	Inventor := StrSplit(Datedate, ",")
	Inventor[1] := Trim(Inventor[1])
	Inventor[2] := Trim(Inventor[2])
	Datedate := Inventor[2] " " Inventor[1]
	return Datedate
	}
return
}

;;;;; Function to update format on US App/Patent Numbers. May behave strangely on non-US formats.
AddCommas(Numnum) {
if InStr(Numnum, "/")
	{
	Spl := StrSplit(Numnum)
	Numnum := Spl[1] Spl[2] Spl[3] Spl[4] Spl[5] Spl[6] "," Spl[7] Spl[8] Spl[9]
	}
else
	Numnum := RegExReplace(Numnum, "(\d)(?=(?:\d{3})+(?:\.|$))", "$1,")

return Numnum
}


;;;;; Don't worry about this. This is where all the IE magic comes from.
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
