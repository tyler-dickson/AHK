


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
Menu, Tray, Icon, pifmgr.dll, 33

^q::
Send, Re:`nTitle:`nUS Application No.:`nFiled:`nYour Reference:`nOur Reference: 
return

^w::
Send, US Application No.  (Y/R: O/R: ) 
return

^e::
Send, Can you please do a supplemental conflict check for the inventors listed below. Please share your KBI request and/or your request number. Also please email me when your KBI request clears.
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
















global FilingDate


^Space::
Clipboard = 
SendInput, ^c
ClipWait, .2
FilingDate := Clipboard
ReformatDate:
if InStr(FilingDate, "20")
                {
                year := SubStr(FilingDate, 8,4)
                month := SubStr(FilingDate, 4, 3) 
                day := SubStr(FilingDate, 1,2)
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
                                                                                
                FilingDate := newmonth " " day ", " year
		Clipboard := FilingDate
                }
else if InStr(Clipboard, ",")
                {
                Inventor := StrSplit(Clipboard, ",")
                
                Inventor[1] := Trim(Inventor[1])
                Inventor[2] := Trim(Inventor[2])
                
                Clipboard := Inventor[2] " " Inventor[1]
                TrayTip, Inventor reformatted. Go ahead and paste it now.,  %Clipboard%
                }
return

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 43


TrayTip, Number Reformatter, Highlight number`, press Windows + N.`n`nWorks on 12/345678 and 12345678 type numbers.
return


^n::
Clipboard = 
SendInput ^c
ClipWait, .2

if InStr(Clipboard, "/")
	{
	Spl := StrSplit(Clipboard)
	Clipboard := Spl[1] Spl[2] Spl[3] Spl[4] Spl[5] Spl[6] "," Spl[7] Spl[8] Spl[9]
	}
else
	{
	Clipboard := RegExReplace(Clipboard, "(\d)(?=(?:\d{3})+(?:\.|$))", "$1,")
	}

TrayTip, Number reformatted | %Clipboard%, Go ahead and paste it somewhere.

return

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 43

/*






*/

^F1::
ie := WBGet()  ; Don't worry about what this does. It is the magic that lets you grab from the browser.

ClientCode 		:= ie.document.getElementById("fldstrCaseNumber_TextBox").value
AppNumber 		:= ie.document.getElementById("fldstrAppNumber").value
FilingDate 		:= ie.document.getElementById("flddteFilDate").value
PatentNumber 	:= ie.document.getElementById("fldstrPatNumber").value
IssueDate 		:= ie.document.getElementById("flddteIssDate").value
Title 		:= ie.document.getElementById("fldstrAppTitle").value
Agent		:= ie.document.getElementById("fldstrAgentRef").value

gosub ReformatDate

MsgBox, % "Client Code: " ClientCode "`nApplication #: " AppNumber "`nFiling Date: " FilingDate "`nPatent #: " PatentNumber "`nIssue Date: " IssueDate 
return




::faemail::
ie := WBGet() 
ClientCode 		:= ie.document.getElementById("fldstrCaseNumber_TextBox").value
AppNumber 		:= ie.document.getElementById("fldstrAppNumber").value
FilingDate 		:= ie.document.getElementById("flddteFilDate").value
PatentNumber 	:= ie.document.getElementById("fldstrPatNumber").value
Title 		:= ie.document.getElementById("fldstrAppTitle").value
Agent 		:= ie.document.getElementById("fldstrAgentRef").value

gosub ReformatDate


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
ie := WBGet() 
ClientCode 		:= ie.document.getElementById("fldstrCaseNumber_TextBox").value
AppNumber 		:= ie.document.getElementById("fldstrAppNumber").value
FilingDate 		:= ie.document.getElementById("flddteFilDate").value
PatentNumber 	:= ie.document.getElementById("fldstrPatNumber").value
Title 		:= ie.document.getElementById("fldstrAppTitle").value
Agent 		:= ie.document.getElementById("fldstrAgentRef").value


TextToWrite = US Application No. %AppNumber% (Y/R:%Agent%;O/R:%ClientCode%)


SendRaw, % TextToWrite
return

::fapat::
ie := WBGet() 
ClientCode 		:= ie.document.getElementById("fldstrCaseNumber_TextBox").value
PatentNumber 	:= ie.document.getElementById("fldstrPatNumber").value
Title		:= ie.document.getElementById("fldstrAppTitle").value
Agent 		:= ie.document.getElementById("fldstrAgentRef").value


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
ClientCode 		:= ie.document.getElementById("fldstrCaseNumber_TextBox").value
AppNumber 		:= ie.document.getElementById("fldstrAppNumber").value
FilingDate 		:= ie.document.getElementById("flddteFilDate").value
PatentNumber 	:= ie.document.getElementById("fldstrPatNumber").value
Title 		:= ie.document.getElementById("fldstrAppTitle").value
Agent 		:= ie.document.getElementById("fldstrAgentRef").value


TextToWrite = US Patent No. %PatentNumber% (Y/R:%Agent%;O/R:%ClientCode%)


SendRaw, % TextToWrite
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
