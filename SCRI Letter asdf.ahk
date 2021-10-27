#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, shell32.dll , 44

!z::
Gui, New, , Letter Helper
Gui, Font, s18
Gui, Add, Radio,  gChangeMode vDocketOrFacing x12 y0 h50, Docketing
Gui, Add, Radio,  gChangeMode xp+140 yp h50 Checked1, Manual
Gui, Add, Edit,  vClientCode2 x5 yp+50	w250 h35 Center, 
Gui, Add, Button, gRunFiled   x5 yp+45 	w250 h50 Center, Local
Gui, Add, Button, gRunIssued  x5 yp+55 	w250 h50 Center, NonLocal
Gui, Add, ActiveX, w100 h100 vie2, Shell.Explorer
Gui, Show, w260	h210
;Gui, Show, w260	h500
return




; how about adding your email address for send on behalf of, ccs, cc/bcc workspace?



GuiClose:
Gui, Destroy
return

ChangeMode:
Gui, Submit, NoHide
if (DocketOrFacing == 1)
	{
	GuiControl, Disable, Edit1
	GuiControl, , Edit1, CLIENT.CODE
	}
else
	{
	GuiControl, Enable, Edit1
	GuiControl, , Edit1, 	
	}
return


RunDexcom:
Gui, Submit, NoHide
if (DocketOrFacing == 1)
	gosub GrabDocketInfo							; Grabs information from docketing.
else
	gosub GrabFacingInfo

FilingDate := ReformatDate(FilingDate)			; Converts Filing Date to correct format.
AppNumber := AddCommas(AppNumber)				; Adds comma to App Number.

WorkSpace := ClientCode ".kmob@iwcs.kmob.com"
TextToWrite =									; Text with a continuation section. This is an HTML email, so <br> is used instead of `n.

(
IPOperations@dexcom.com; %WorkSpace% <br> 
Re: `t U.S. Patent Application <br>
Title: `t %Title%<br>
Application No.: %AppNumber%<br>
Filing Date: %FilingDate%<br>
Your Reference: %Client%<br>
Our Reference: %ClientCode%<br>
)

olMailItem := 0																							; Creates new empty MailItem object with index of 0, meaning an email.
o:= ComObjActive("Outlook.Application").Session()														; Finds existing Outlook session.
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)									; Creates new email object.
MailItem.BodyFormat 		:= olFormatHTML																; Sets body of email to HTML.
MailItem.SentOnBehalfOfName := "Ashley.Camacho"															; Sets who to Send Email On Behalf Of. 
MailItem.HTMLBody			:= TextToWrite 																; Adds the TextToWrite variable from above as the email body.
MailItem.Subject 			:= "" Client " (" ClientCode ") FILL IN - USSN: " AppNumber "" 				; Sets email subject with Expression form.
MailItem.To 				:= "Aly.Quintong"															; Sets the email recipient.
MailItem.Cc 				:= 																			; Sets the CC'd recipients.
MailItem.Bcc 				:= 																			; Sets the BCC'd recipients.
MailItem.Display																						; Displays created email.
return

RunFiled: ;Local
Gui, Submit, NoHide
if (DocketOrFacing == 1)
	gosub GrabDocketInfo							; Grabs information from docketing.
else
	gosub GrabFacingInfo							; Grabs information from docketing.
	
FilingDate := ReformatDate(FilingDate)				; Converts Filing Date to correct format.
AppNumber := AddCommas(AppNumber)					; Adds comma to App Number.

TextToWrite =										; Text with a continuation section. This is an HTML email, so <br> is used instead of `n.
(
<b><font color="red">[Use CAUTION when opening links/attachments]</font></b><br>
Re: U.S. Patent Application <br>
Title: %Title%<br>
US Application No.: %AppNumber%<br>
Filed: %FilingDate%<br>
Our Reference: %ClientCode%<br>
BMS Reference: 
<br><br>
Dear NAME, <br> <br>
 
Please see the attached letter and related documents from Mark Marsden.  We look forward to receiving your instructions.  Feel free to contact our office with any questions. <br> <br>
 
Thanks,

)

olMailItem := 0																							; Creates new empty MailItem object with index of 0, meaning an email.
o:= ComObjActive("Outlook.Application").Session()														; Finds existing Outlook session.
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)									; Creates new email object.
MailItem.BodyFormat 		:= olFormatHTML																; Sets body of email to HTML.
MailItem.SentOnBehalfOfName := "Ashley.Camacho"															; Sets who to Send Email On Behalf Of. 
MailItem.HTMLBody			:= TextToWrite 																; Adds the TextToWrite variable from above as the email body.
MailItem.Subject 			:= ""ADD ACTION "US Application No. " AppNumber " (BMS Ref: / Our Ref:" ClientCode ") ATTACHMENT" 	; Sets email subject with Expression form.
MailItem.To 				:= "ADD FA"																; Sets the email recipient.
MailItem.Cc 				:= 															; Sets the CC'd recipients.
MailItem.Bcc 				:= ClientCode ".kmob@iwcs.kmob.com"																; Sets the BCC'd recipients.
MailItem.Display																						; Displays created email.
return



RunIssued: ;NonLocal
Gui, Submit, NoHide
if (DocketOrFacing == 1)
	gosub GrabDocketInfo							; Grabs information from docketing.
else
	gosub GrabFacingInfo							; Grabs information from docketing.
	
FilingDate := ReformatDate(FilingDate)				; Converts Filing Date to correct format.
AppNumber := AddCommas(AppNumber)					; Adds comma to App Number.

TextToWrite =										; Text with a continuation section. This is an HTML email, so <br> is used instead of `n.
(
[Use CAUTION when opening links/attachments] <br>
Re:  <br>
Title: %Title%<br>
COUNTRY Application No.: %AppNumber%<br>
Filing Date: %FilingDate%<br>
Our Reference: %ClientCode%<br>
<br>
Dear NAME, <br> <br>
 
Please see the attached letter and related documents from Mark Marsden.  We look forward to receiving your instructions.  Feel free to contact our office with any questions. <br> <br>
 
Thanks,

)

olMailItem := 0																							; Creates new empty MailItem object with index of 0, meaning an email.
o:= ComObjActive("Outlook.Application").Session()														; Finds existing Outlook session.
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)									; Creates new email object.
MailItem.BodyFormat 		:= olFormatHTML																; Sets body of email to HTML.
MailItem.SentOnBehalfOfName := "Ashley.Camacho"															; Sets who to Send Email On Behalf Of. 
MailItem.HTMLBody			:= TextToWrite 																; Adds the TextToWrite variable from above as the email body.
MailItem.Subject 			:= ""ADD ACTION "COUNTRY Application No. " AppNumber " (Our Ref:" ClientCode ") ATTACHMENT" 	; Sets email subject with Expression form.
MailItem.To 				:= "ADD FA"																; Sets the email recipient.
MailItem.Cc 				:= 															; Sets the CC'd recipients.
MailItem.Bcc 				:= ClientCode ".kmob@iwcs.kmob.com"																; Sets the BCC'd recipients.
MailItem.Display																						; Displays created email.
return



;;;;; Subroutine to grab IE handle and grab docketing information. Add new fields here!
;;;;; To add more, Inspect the element in docketing and find the id, NOT the name.

GrabDocketInfo: 
ClientCode 		:= ""
AppNumber 		:= ""
FilingDate 		:= ""
PatentNumber 	:= ""
IssueDate 		:= ""
Agent 			:= ""
Client          := ""

ie := WBGet() 
ClientCode 		:= ie.document.getElementById("fldstrCaseNumber_TextBox").value
AppNumber 		:= ie.document.getElementById("fldstrAppNumber").value
FilingDate 		:= ie.document.getElementById("flddteFilDate").value
PatentNumber 	:= ie.document.getElementById("fldstrPatNumber").value
IssueDate 		:= ie.document.getElementById("flddteIssDate").value
Title 			:= ie.document.getElementById("fldstrAppTitle").value
Agent			:= ie.document.getElementById("fldstrAgentRef").value
Client          := ie.document.getElementById("fldstrAppClientRef").value
return

;;;;; Subroutine to grab from a Facing Page instead of from Docketing.
GrabFacingInfo: 
ClientCode 		:= ""
AppNumber 		:= ""
FilingDate 		:= ""
PatentNumber 	:= ""
IssueDate 		:= ""
Agent 			:= ""
Client          := ""

ClientCode2 := Trim(ClientCode2)
ie2.Navigate("https://oc-insideknobbe.kmob.com/intranet/forms/Patent_TM_Reports/facesheet.cfm?&casenumber=" ClientCode2 "&country=CN")
while ie2.busy or ie2.ReadyState != 4 ;Wait for page to load
	Sleep, 100

ClientCode 		:= StrReplace(ie2.document.getElementsByTagName("TD")[4].innerText,  "Case Number: ", "")
AppNumber 		:= StrReplace(ie2.document.getElementsByTagName("TD")[10].innerText, "Application Number: ", "")
FilingDate 		:= StrReplace(ie2.document.getElementsByTagName("TD")[11].innerText, "Filing Date: ", "")
PatentNumber 	:= StrReplace(ie2.document.getElementsByTagName("TD")[12].innerText, "Patent Number: ", "")
IssueDate 		:= StrReplace(ie2.document.getElementsByTagName("TD")[13].innerText, "Issued Date: ", "")
Agent 			:= StrReplace(ie2.document.getElementsByTagName("TD")[22].innerText, "Agent Ref: ", "")
Client          := StrReplace(ie2.document.getElementsByTagName("TD")[32].innerText, "Client's Ref. No.: ", "")


Loop % ie2.document.getElementsByTagName("TD").length
	{
	temp := ie2.document.getElementsByTagName("TD")[A_Index].innerText
	if InStr(temp, "Title:")
		{
		Title := StrReplace(ie2.document.getElementsByTagName("TD")[A_Index].innerText, "Title: ", "")
		break
		}
	}
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
	TrayTip, Inventor reformatted. Go ahead and paste it now.,  %Datedate%
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
