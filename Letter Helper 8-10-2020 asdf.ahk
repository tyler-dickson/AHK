#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, shell32.dll , 44

!c::
Gui, New, , Letter Helper
Gui, Font, s18
Gui, Add, Radio,  gChangeMode vDocketOrFacing x12 y0 h40, Docketing
Gui, Add, Radio,  gChangeMode xp+140 yp h40 Checked1, Manual
Gui, Add, Edit,  vClientCode2 x5 yp+45	w250 h35 Center, 

Gui, Font, s10
Gui, Add, Text,  x5 yp+45 w75 h25 Center, Your Email:
Gui, Add, Edit,  vYourEmail xp+75 yp-2 w175 h20 Center, tyler.dickson@knobbe.com

Gui, Add, Text,  x5 yp+25 w75 h25 Center, To:
Gui, Add, Edit,  vToEmails xp+75 yp-2 w175 h20 Center,

Gui, Add, Text,  x5 yp+25 w75 h25 Center, Cc:
Gui, Add, Edit,  vCcEmails xp+75 yp-2 w175 h20 Center, 
Gui, Add, Text,  x5 yp+25 w75 h25 Center, Bcc:
Gui, Add, Edit,  vBccEmails xp+75 yp-2 w175 h20 Center, 



Gui, Font, s18
Gui, Add, Button, gRunFiled   x5 yp+25 	w250 h40 Center, Filed Application
Gui, Add, Button, gRunIssued  x5 yp+45 	w250 h40 Center, Issued Patent
; Gui, Add, Button, gRunDexcom  x5 yp+45 	w250 h40 Center, DEXCOM
Gui, Add, Button, gRunNational  x5 yp+45 	w250 h40 Center, National
; Gui, Add, Button, gRunInvoice  x5 yp+45 	w250 h40 Center, Create Invoice 

Gui, Add, Button, gTestButton h50, Test Button

Gui, Add, ActiveX, w100 h100 vie2, Shell.Explorer
Gui, Show, w260	h420


;Gui, Show, w260	h500
return



TestButton:
Gui, Submit, NoHide
MsgBox, % YourEmail "`n" ToEmails "`n" CcEmails "`n" BccEmails

TextToWrite =
(
<p class="MsoNormal"><b><span style="font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;
mso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;
color:black">Tyler Dickson</span></b><span style="font-size:12.0pt;font-family:
&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;"><o:p></o:p></span></p>

<p class="MsoNormal"><span style="font-size:8.0pt;font-family:&quot;Verdana&quot;,sans-serif;
mso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;
color:#6B6D73">International Docketing Agent</span><span style="font-size:12.0pt;
font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;"><o:p></o:p></span></p>

<p class="MsoNormal"><span style="font-size:8.0pt;font-family:&quot;Verdana&quot;,sans-serif;
mso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;
color:#0068AC"><a href="mailto:Tyler.Dickson@knobbe.com"><span style="color:#0076C0;text-decoration:none;text-underline:none">Tyler.Dickson@knobbe.com</span></a></span><span style="font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:
&quot;Times New Roman&quot;"><o:p></o:p></span></p>

<p class="MsoNormal"><span style="font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;
mso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;
color:black">206-405-2021</span><span style="font-size:9.0pt;font-family:&quot;Times New Roman&quot;,serif;
mso-fareast-font-family:&quot;Times New Roman&quot;">&nbsp;</span><b><span style="font-size:9.0pt;font-family:&quot;Helvetica&quot;,sans-serif;mso-fareast-font-family:
&quot;Times New Roman&quot;;color:#6B6D73">Direct</span></b><span style="font-size:9.0pt;
font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;"><o:p></o:p></span></p>

<p class="MsoNormal"><b><span style="font-size:12.0pt;font-family:&quot;Helvetica&quot;,sans-serif;
color:#221F20">Knobbe</span></b><span style="font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif">&nbsp;</span><b><span style="font-size:12.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#3594D2">Martens</span></b><span style="font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif"><o:p></o:p></span></p>

<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
)

olMailItem := 0																							; Creates new empty MailItem object with index of 0, meaning an email.
o:= ComObjActive("Outlook.Application").Session()														; Finds existing Outlook session.
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)									; Creates new email object.
MailItem.BodyFormat 		:= olFormatHTML																; Sets body of email to HTML.
MailItem.SentOnBehalfOfName := YourEmail																; Sets who to Send Email On Behalf Of. 
MailItem.HTMLBody			:= TextToWrite 																; Adds the TextToWrite variable from above as the email body.
MailItem.Subject 			:= "" Client " (" ClientCode ") FILL IN - USSN: " AppNumber "" 				; Sets email subject with Expression form.
MailItem.To 				:= ToEmails																	; Sets the email recipient.
MailItem.Cc 				:= CcEmails																	; Sets the CC'd recipients.
MailItem.Bcc 				:= BccEmails																; Sets the BCC'd recipients.


MailItem.HTMLBody := TextToWrite "<img src=C:\Users\Ashley.Camacho\Desktop\signature.PNG>"


MailItem.Display	
MailItem.ActiveDocument.Range.ParagraphFormat.SpaceAfter := 0

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

RunFiled:
Gui, Submit, NoHide
if (DocketOrFacing == 1)
	gosub GrabDocketInfo							; Grabs information from docketing.
else
	gosub GrabFacingInfo							; Grabs information from docketing.
	
FilingDate := ReformatDate(FilingDate)				; Converts Filing Date to correct format.
AppNumber := AddCommas(AppNumber)					; Adds comma to App Number.

TextToWrite =										; Text with a continuation section. This is an HTML email, so <br> is used instead of `n.
(
Re:<br>
Title: %Title%<br>
US Application No.: %AppNumber%<br>
Filed: %FilingDate%<br>
Your Reference: %Agent%<br>
Our Reference: %ClientCode%<br>
)

olMailItem := 0																							; Creates new empty MailItem object with index of 0, meaning an email.
o:= ComObjActive("Outlook.Application").Session()														; Finds existing Outlook session.
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)									; Creates new email object.
MailItem.BodyFormat 		:= olFormatHTML																; Sets body of email to HTML.
MailItem.SentOnBehalfOfName := "Ashley.Camacho"															; Sets who to Send Email On Behalf Of. 
MailItem.HTMLBody			:= TextToWrite 																; Adds the TextToWrite variable from above as the email body.
MailItem.Subject 			:= "US Application No. " AppNumber " (Y/R:" Agent ";O/R:" ClientCode ")" 	; Sets email subject with Expression form.
MailItem.To 				:= "ADD FA"																; Sets the email recipient.
MailItem.Cc 				:= "Neil.Bartfeld"															; Sets the CC'd recipients.
MailItem.Bcc 				:= ClientCode ".kmob@iwcs.kmob.com"																; Sets the BCC'd recipients.
MailItem.Display																						; Displays created email.
return

RunNational:
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
MailItem.Subject 			:= " FILL IN - U.S. Application No.: " AppNumber " | "Client " | "ClientCode " " 				; Sets email subject with Expression form.
MailItem.To 				:= "ADD FA"															; Sets the email recipient.
MailItem.Cc 				:= 	"Neil.Bartfeld"																		; Sets the CC'd recipients.
MailItem.Bcc 				:= 																			; Sets the BCC'd recipients.
MailItem.Display																						; Displays created email.
return

RunIssued:
Gui, Submit, NoHide
if (DocketOrFacing == 1)
	gosub GrabDocketInfo							; Grabs information from docketing.
else
	gosub GrabFacingInfo							; Grabs information from docketing.
	
IssueDate := ReformatDate(IssueDate)				; Converts Filing Date to correct format.
PatentNumber := AddCommas(PatentNumber)				; Adds comma to App Number.

TextToWrite =										; Text with a continuation section. This is an HTML email, so <br> is used instead of `n.
(
Re:<br>
Title: %Title%<br>
US Patent No.: %PatentNumber%<br>
Issued: %IssueDate%<br>
Your Reference: %Agent%<br>
Our Reference: %ClientCode%<br>
)

olMailItem := 0																							; Creates new empty MailItem object with index of 0, meaning an email.
o:= ComObjActive("Outlook.Application").Session()														; Finds existing Outlook session.
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)									; Creates new email object.
MailItem.BodyFormat 		:= olFormatHTML																; Sets body of email to HTML.
MailItem.SentOnBehalfOfName := "Ashley.Camacho"															; Sets who to Send Email On Behalf Of. 
MailItem.HTMLBody			:= TextToWrite 																; Adds the TextToWrite variable from above as the email body.
MailItem.Subject 			:= "US Patent No. " PatentNumber " (Y/R:" Agent ";O/R:" ClientCode ")" 		; Sets email subject with Expression form.
MailItem.To 				:= "ADD FA"																	; Sets the email recipient.
MailItem.Cc 				:= "Neil.Bartfeld"															; Sets the CC'd recipients.
MailItem.Bcc 				:= ClientCode ".kmob@iwcs.kmob.com"											; Sets the BCC'd recipients.
MailItem.Display																						; Displays created email.
return

RunInvoice:
Gui, Submit, NoHide
if (DocketOrFacing == 1)
	gosub GrabDocketInfo							; Grabs information from docketing.
else
	gosub GrabFacingInfo

; FilingDate := ReformatDate(FilingDate)			; Converts Filing Date to correct format.
; AppNumber := AddCommas(AppNumber)				; Adds comma to App Number.

WorkSpace := ClientCode ".kmob@iwcs.kmob.com"

TextToWrite =									; Text with a continuation section. This is an HTML email, so <br> is used instead of `n.
(
Hi Genevieve,<br><br>

Please prepare a draft invoice for Neil’s review for filing a *** .<br><br>

Time has been closed.  No fee/Fee transmittal attached.<br><br>

Let me know if you have any questions.<br><br>

Thanks,<br><br>

)



olMailItem := 0																							; Creates new empty MailItem object with index of 0, meaning an email.
o:= ComObjActive("Outlook.Application").Session()														; Finds existing Outlook session.
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)									; Creates new email object.
MailItem.BodyFormat 		:= olFormatHTML																; Sets body of email to HTML.
MailItem.SentOnBehalfOfName := "Ashley.Camacho"															; Sets who to Send Email On Behalf Of. 
MailItem.HTMLBody			:= TextToWrite 																; Adds the TextToWrite variable from above as the email body.
MailItem.Subject 			:= ClientCode " - Invoice Request" 				; Sets email subject with Expression form.
MailItem.To 				:= "Genevieve.Arnedo"															; Sets the email recipient.
MailItem.Cc 				:= "Neil.Bartfeld; Ashley.Camacho"											; Sets the CC'd recipients.
MailItem.Bcc 				:= 																			; Sets the BCC'd recipients.
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
