#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 59

global Computername
global SendOnBehalfOf
global ExtraCCs := "2jca; Kimberly.Flowers"
global CLSP := "Jessica.Johansen; Nicole.Jevsevar"

StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}

if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder	

IniRead, Uses, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, IndivFacingEmailer
	if Uses = ERROR
		IniWrite, 1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, IndivFacingEmailer
	else
		{
		Uses++
		IniWrite, %Uses%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, IndivFacingEmailer
		}
				
MsgBox, , Facing Report Individual Emailer, Hello!`n`nWelcome to the Individual Facing Report Emailer.`n`nInstead of sending a large email to ALL prosecution teams, this will instead send individual emails to each Responsible person. This has several key benefits:`n`n-Each subject line will have the Responsible person's initials at the front to allow a quick glance at who has responded. With the old method, all received emails had the same subject line, so they all blended together. You should now be able to easily tell what dates you've received an answer on.`n`n-Similar to the FACING tab on the Facing Report Template, this will allow you to select the Facing timeframe and which mailbox to "Send On Behalf Of." This will let you easily verify the Facing timeframe, and ensures all emails are correctly routed to the right mailbox.`n`n-This has a secondary benefit of increasing confidentiality. I doubt we'd encounter Ethical Walls while facing, but I suppose it IS possible. This way, people also aren't bombarded with irrelevant unrelated information.`n`nI'm sure there are other benefits that we'll figure out down the road.`n`nv.2018.10.10
FileDelete, C:\Users\%Computername%\FaceAtty.txt		


Gui, Font, s12
Gui, Add, Text, x10 w255 Section Center, Select the Facing Date Range`n(Hold Shift to select multiple days.)
Gui, Add, MonthCal, xp+15 yp+50  Multi vDateRange,
Gui, Add, Text, Center xp yp+170 wp,Select which mailbox you are "Sending On Behalf Of."
Gui, Add, DropDownList, Center xp yp+50 wp vSendOnBehalfOf, OCINTDATES.Mailbox||BRANCHINTDATES.Mailbox|-----|OCUSDATES.Mailbox|BRANCHUSDATES.Mailbox|

Gui, Font,
Gui, Add, ListView, Grid -Multi r16 w650 xs+265 ys, Date|Action Due|Action Type|Indicator|Client Code|Responsible|Email
Gui, Font, bold
Gui, Add, Text, Center xp+655 yp+40 w150, Use Control + F12 to clean data from Facing query. You can then paste into Excel template.
Gui, Font,
Gui, Font, s12
Gui, Add, Button, gGrabFacingInfo  xp yp+60 w150 h45, Pull Facing Data from Excel
Gui, Add, Button, gClearFacingInfo xp yp+45 wp h35, Clear Facing Info
Gui, Add, Button, gShowSignature   xp yp+60 wp hp, Saved Signature
Gui, Add, Button, gCreateEmails    xp yp+60 wp hp, Create Emails
Gui, Font, s8 bold
Gui, Add, Button, gOpenPatentPage    xs+920 ys w70 hp, Patent
Gui, Add, Button, gOpenTMPage    xs+1000 ys w70 hp, Trademark
Gui, Font,
Gui, Add, StatusBar,, 
OnMessage(0x200, "Help")
Gui, Show
return

OpenPatentPage:
Run, http://oc-knobbetools/intranet/docket/reports/Custom_Reports/Tyler_Dickson/rptActionDuePat.cfm
return

OpenTMPage:
Run, http://oc-knobbetools/intranet/docket/reports/Custom_Reports/Tyler_Dickson/rptActionDue.cfm
return

ShowSignature:
Gui, Signature: New, AlwaysOnTop, Here is your stored signature.
Gui, Signature: Font, s12
Gui, Signature: Add, Text, , If this is blank, you haven't saved a signature yet.
Gui, Signature: Add, Picture, , C:\Users\%Computername%\Capture.png
Gui, Signature: Font, s12 underline
Gui, Signature: Add, Text, gSaveSignature, Click here to save a new signature.
Gui, Signature: Show
return

SaveSignature:
StoredSignature := ""
olMailItem := 0
o:= ComObjActive("Outlook.Application").Session()
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
MailItem.BodyFormat := olFormatHTML
MailItem.Subject := EmailSubject ;change to whatever your subject is.
MailItem.Display ; Make email visible
Gui, Signature: New, AlwaysOnTop, Let's save your signature.
Gui, Signature: Font, s12
Gui, Signature: Add, Text, ,I just opened a new email in Outlook for you. It should include your default signature.`n`nGo ahead and change it to whatever signature you want to append to your Facing emails.`n`nOnce you've chosen your signature, I'll open up Snipping Tool so you can take a screenshot of it.`n`nIt should look something like this:
Gui, Signature: Add, Picture, ,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Facing Signature\tyler.dickson.png
Gui, Signature: Add, Text, ,I've also opened a quick demonstration on how to save it.`nWatch it a couple times so you can see how to do it. It will freeze when you try to take your screenshot.
Gui, Signature: Font, s12 underline
Gui, Signature: Add, Text, gSaveSignature2, Click here to capture screenshot.
Gui, Signature: Show
Run "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\SaveSignature.gif"
return

SaveSignature2:
WinGetPos, WindowPosX, WindowPosY, , , A, 
Gui, Signature: Destroy
Gui, Signature: New
Gui, Signature: Font, s12
Gui, Signature: Add, Text, , Remember, it should look something like this.
Gui, Signature: Add, Picture, ,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Facing Signature\tyler.dickson.png
Gui, Signature: Add, Text, , Once you take the screenshot, save it to your Desktop as Capture.png, which is the default name.
Gui, Signature: Add, Text, , Once you've saved your Capture.png to the desktop, I'll move it for safe-keeping.
Gui, Signature: Font, s12 underline
Gui, Signature: Add, Text, gSaveSignature3, Click here to save signature.
Gui, Signature: Show, x%WindowPosX% y%WindowPosY%
Sleep 2000
Run "SnippingTool.exe"
return

SaveSignature3:
Gui, Signature: Submit
FileDelete, C:\Users\%Computername%\Capture.png
Sleep 100
FileCopy, C:\Users\%Computername%\Desktop\Capture.png , C:\Users\%Computername%\Capture.png
Sleep 100
FileDelete, C:\Users\%Computername%\Desktop\Capture.png
MsgBox, , Signature stored., OK! I've saved your signature for later. Feel free to update it in the future if something changes.	
return


/*
pwb := ComObjCreate("InternetExplorer.Application") ;create IE Object
pwb.Navigate(SigLocation) ;Navigate to URL
CheckURL:
pwb := WBGet()
while pwb.busy or pwb.ReadyState != 4 ;Wait for page to load
	Sleep, 100
pwb.visible:=false  ; Set the pwb object to visible
var := pwb.LocationURL ;grab current url	
Msgbox, % var
NumPS := pwb.document.GetElementsBytagname("P").length ; Use for multi-level & change array value
Loop %NumPS%
{
NumTDS := pwb.document.GetElementsBytagname("P")[A_Index - 1].OuterHTML ; Use for multi-level & change array value
StoredSignature := StoredSignature "`n" NumTDS
}
FileDelete, SavedFacingSignature.html
Sleep 2000
return

*/

ClearFacingInfo:
FileDelete, FaceAtty.txt
LV_Delete()
ReplacedAtty := ""
AttorneyInitials := ""
FaceAtty := ""
FaceAttyParts0 := ""
FaceAttyParts1 := ""
FaceAttyParts2 := ""
FaceAttyParts3 := ""
FaceAttyParts4 := ""
FaceAttyParts5 := ""
FaceAttyParts6 := ""
FixExtra := ""
return

GrabFacingInfo:
Gui, Submit
FileDelete, C:\Users\%Computername%\FaceAtty.txt
;LV_Delete()
ReplacedAtty := ""
AttorneyInitials := ""
FaceAtty := ""
FaceAttyParts0 := ""
FaceAttyParts1 := ""
FaceAttyParts2 := ""
FaceAttyParts3 := ""
FaceAttyParts4 := ""
FaceAttyParts5 := ""
FaceAttyParts6 := ""
global FixExtra := ""
/*
Sleep 500
SendInput ^c
ClipWait, .5
*/
xl := ComObjActive("Excel.Application")
SplashtextOn, 500, 0, Select your Facing information. I'm going to grab it from Excel in 5 seconds.
Sleep 1000
SplashtextOn, 500, 0, Select your Facing information. I'm going to grab it from Excel in 4 seconds.
Sleep 1000
SplashtextOn, 500, 0, Select your Facing information. I'm going to grab it from Excel in 3 seconds.
Sleep 1000
SplashtextOn, 500, 0, Select your Facing information. I'm going to grab it from Excel in 2 seconds.
Sleep 1000
SplashtextOn, 500, 0, Select your Facing information. I'm going to grab it from Excel in 1 second.
Sleep 1000
SplashTextOff
xl.Selection.Copy
Clipboard := RegExReplace(Clipboard, "[\r]")
FileAppend, %Clipboard%, C:\Users\%Computername%\FaceAtty.txt
Sleep 1000
FileRead, FaceAtty, C:\Users\%Computername%\FaceAtty.txt
;FaceAtty := Clipboard
StringSplit, FaceAtty, FaceAtty, `n
FixExtra := FaceAtty0 - 1
Xl.CutCopyMode := False
Loop %FixExtra%
{
StringSplit, FaceAttyParts, FaceAtty%A_Index%, `t
FaceAttyParts6 := RegExReplace(FaceAttyParts6, "[\r]")
IniRead, AttorneyInitials, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys (Facing).ini, Attorneys, %FaceAttyParts6%
Sleep 200
	if AttorneyInitials = ERROR
		AttorneyInitials := "2" FaceAttyParts6
	else
		AttorneyInitials := AttorneyInitials
LV_Add("", FaceAttyParts1, FaceAttyParts2, FaceAttyParts3, FaceAttyParts4, FaceAttyParts5, FaceAttyParts6, AttorneyInitials)
}
LV_ModifyCol()
LV_ModifyCol(1, "Logical")
LV_ModifyCol(6, "SortAsc")

Loop 6
{
LV_ModifyCol(A_Index, "autoHdr")
}
Gui, Show
return

CreateEmails:
Gui, Submit, NoHide
SortedAttys := ""
LV_ModifyCol(6, "SortAsc")
Loop %FixExtra%
{
LV_GetText(Attorneys, A_Index, 6 )   ;[, ColumnNumber]) ¶
SortedAttys := SortedAttys "`n" Attorneys
}
Sort, SortedAttys, U D`n
StringReplace, SortedAttys, SortedAttys, `n, , 
StringSplit, SortedAttys, SortedAttys, `n
	if SortedAttys0 = 0
		{
		MsgBox, , You didn't add any information!, Add some Facing information and try again.
		Gui, Show
		return
		}
MsgBox, 1, Are you sure you want to proceed?, You're about to create %SortedAttys0% emails. 
	ifMsgBox Cancel
		return
	ifMsgBox OK
EmailBodyContents := ""
PreviousAtty := "1"
StringSplit, DateRange, DateRange, -
FormatTime, DateRange1, % DateRange1, M/d
FormatTime, DateRange2, % DateRange2, M/d
	if (DateRange1 = DateRange2)
		DateRange := DateRange1
	else
		DateRange := DateRange1 " - " DateRange2
EmailsCreated = 0
Loop %FaceAtty0%
{
LV_GetText(Attorneys, A_Index, 6 )   ;[, ColumnNumber]) ¶
NewAttorneys := NewAttorneys "|" Attorneys
	if A_Index = 1
		gosub NewEmail
	else if (Attorneys = PreviousAtty)
		gosub ExpandEmail  ;MsgBox, Attorneys match.
	else
		{
		MailItem.HTMLBody := EmailBodyContents "</table><br><br></BODY></p><img src=C:\Users\" Computername "\Capture.png></HTML>" ; MsgBox, No match.
		MailItem.Display ; Make email visible
		Sleep 100
		gosub NewEmail
		}
PreviousAtty := Attorneys
}
return

NewEmail:
EmailBodyContents := ""
olMailItem := 0
o:= ComObjActive("Outlook.Application").Session()
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
MailItem.SentOnBehalfOfName := SendOnBehalfOf
MailItem.BodyFormat := olFormatHTML
LV_GetText(DueDate, A_Index, 1 )   ;[, ColumnNumber]) ¶
LV_GetText(ActionDue, A_Index, 2 )   ;[, ColumnNumber]) ¶
LV_GetText(ActionType, A_Index, 3 )   ;[, ColumnNumber]) ¶
LV_GetText(Indicator, A_Index, 4 )   ;[, ColumnNumber]) ¶
LV_GetText(ClientCode, A_Index, 5 )   ;[, ColumnNumber]) ¶
LV_GetText(Responsible, A_Index, 6 )   ;[, ColumnNumber]) ¶
LV_GetText(EmailAddress, A_Index, 7 )   ;[, ColumnNumber]) ¶
                                                           ;   td {color:red; border-style: solid; border-width: 1px; }                                            ; table{border-style: solid; border-width: 1px;}
EmailBodyContents := "<HTML><style> table {border-style: solid; border-collapse:collapse; border-width: 1px;} td {border-style: solid; border-collapse:collapse; border-width: 1px; text-align: center; vertical-align: middle; padding: 5px;} p{color: blue;} </style><p><BODY><p>International Docketing has not yet received instructions for the below actions. Your immediate response to <u>**INTDATES</u> is required. Thank you!.</p><br><table><tr><td align=center valign=middle>" DueDate "</td><td align=center valign=middle>" ActionType "</td><td align=center valign=middle>" ActionDue "</td><td align=center valign=middle>" Indicator "</td><td align=center valign=middle>" ClientCode "</td><td align=center valign=middle>" Responsible "</td></tr>"
MailItem.To := EmailAddress 
EmailSubject := Responsible " | " DateRange " Docket Items Requiring Immediate Response"
StringReplace, EmailSubject, EmailSubject, `r, , A
MailItem.Subject := EmailSubject ;change to whatever your subject is.
	if ((Responsible = "DJF") || (Responsible = "MBH") || (Responsible = "RJR") || (Responsible = "TYY") || (Responsible = "ZJH"))
		MailItem.CC := ExtraCCs
	else if InStr(ClientCode, "SMNPH") or InStr(ClientCode, "SNCOV") or InStr(ClientCode, "BLSKY") or InStr(ClientCode, "KLYPT")
		MailItem.CC := CLSP	
return

ExpandEmail:
LV_GetText(DueDate, A_Index, 1 )   ;[, ColumnNumber]) ¶
LV_GetText(ActionDue, A_Index, 2 )   ;[, ColumnNumber]) ¶
LV_GetText(ActionType, A_Index, 3 )   ;[, ColumnNumber]) ¶
LV_GetText(Indicator, A_Index, 4 )   ;[, ColumnNumber]) ¶
LV_GetText(ClientCode, A_Index, 5 )   ;[, ColumnNumber]) ¶
LV_GetText(Responsible, A_Index, 6 )   ;[, ColumnNumber]) ¶
LV_GetText(EmailAddress, A_Index, 7 )   ;[, ColumnNumber]) ¶
EmailBodyContents := EmailBodyContents "<tr><td align=center valign=middle>" DueDate "</td><td align=center valign=middle>" ActionType "</td><td align=center valign=middle>" ActionDue "</td><td align=center valign=middle>" Indicator "</td><td align=center valign=middle>" ClientCode "</td><td align=center valign=middle>" Responsible "</td></tr>"
	
	if InStr(ClientCode, "SMNPH") or InStr(ClientCode, "SNCOV") or InStr(ClientCode, "BLSKY") or InStr(ClientCode, "KLYPT")
		MailItem.CC := CLSP	
return

GuiClose:
Escape::
FileDelete, C:\Users\%Computername%\FaceAtty.txt
ExitApp
return


Help(wParam, lParam, Msg) {
MouseGetPos,,,, OutputVarControl
IfEqual, OutputVarControl, Button1
	Help := "This grabs your Facing information directly from Excel.`n`nAfter clicking, you'll have five seconds to highlight your data in Excel.`nYou can also select your information prior to clicking the button."
else IfEqual, OutputVarControl, Button2
	Help := "This will clear any information you've grabbed so far.`n`nHelpful for if you mess up or forgot someone."
else IfEqual, OutputVarControl, Button4
	Help := "This will sort your data by ""Responsible"" and determine how many emails to create.`n`nYou'll have a chance to cancel if something doesn't look right, so don't worry."
else IfEqual, OutputVarControl, Button3
	Help := "If you want to include a signature at the bottom of each email, you need to save one first.`n`nYou only have to do this one time since I'll store it for future use.`n`nIf you decide you want to update it, just click this button again."

	
	
	
;else IfEqual, OutputVarControl, SysMonthCal321
;	Help := "This is a calendar test."
	
; ToolTip % Help
SB_SetText(Help)
}






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


;***********Function*******************
setWbCom(name=false, url=false) {
    ;   Set web browser COM pointer        ;   eserv_flag sets this.wb_eserv
    if (!name AND !url) {
        ;    Clear COM object
        return false
    }
    ;   Set defaults.  No promises.
    wb:=false
    For wb in ComObjCreate( "Shell.Application" ).Windows {
        Try {
            If ((InStr(wb.locationName, name) AND name) OR (InStr(wb.locationURL, url) AND url)) && InStr(wb.FullName, "iexplore.exe") {
                return wb
            }
        } Catch, e {
            if (e AND this.debug) {
                FileAppend, % "`r`nCOM Error: " . e, % this.debug_file
            }
        }
    }
    if (debug) {
        this.errorWindow("Failed to find web browser.`r`nName:`t" . name . "`r`nURL:`t" . url)
    }
    return false
}



^F12::
Clipboard := ""
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
STRONGS := ie.document.GetElementsBytagname("STRONG").length
PageName := ie.document.GetElementsBytagname("STRONG")[0].InnerText

TDS :=  ie.document.GetElementsBytagname("TD").length

ApproxRows := Floor((TDS / 22) - 1)      ; <------ 22 = Columns on Facing Query


ifinstring, PageName, Patent
	{
	Gui, New, , Grabbing Patent Facing Info... This may take a minute...
	Gui, Add, Progress, w500 h20 cBlue BackgroundWhite vProgressBar Range1-%ApproxRows%, 
	Gui, Add, Text, Center w500, 0 / %ApproxRows% 
	Gui, Show, h50
	gosub Patent
	}
ifinstring, PageName, Trademark
	{
	Gui, New, , Grabbing Trademark Facing Info... This may take a minute...
	Gui, Add, Progress, w500 h20 cBlue BackgroundWhite vProgressBar Range1-%ApproxRows%,
	Gui, Add, Text, Center w500, 0 / %ApproxRows% 
	Gui, Show, h50
	gosub Trademark
	}
return

Patent:
RowsSoFar = -1
ColumnCount = 1
;Gui, Submit
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
var := ie.LocationURL ;grab current url	
NumTDS := ie.document.GetElementsBytagname("TD").length ; Use for multi-level & change array value

TDSList := ""
Loop %NumTDS%
{

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;																	;;;;;
;;;;;    IF THEY ADD AN EXTRA COLUMN, ADD +1 WHERE INSTRUCTED BELOW     ;;;;;
;;;;;			AND ADD AN EXCEPTION TO THE EXCEPTION SECTION			;;;;;
;;;;;																	;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LoopTDS := ie.document.GetElementsBytagname("TD")[A_Index + 23].InnerText ;<------------ Add +1 to this line!
LoopTDS := RegExReplace(LoopTDS, "[\r\n]")


;;;;; EXCEPTION SECTION STARTS ;;;;;
	
if (ColumnCount = 7) or (ColumnCount = 8)  								  ;<------------ This puts blanks for Columns 6 and 7.
	LoopTDS := ""	

if ColumnCount = 2														  ;<------------ This will skip Column 2
	goto SkipEntryPat
	
if ColumnCount = 9											 		 	  ;<------------ This will skip Column 8		
	goto SkipEntryPat					                                                                           

if ColumnCount = 10														  ;<------------ This will skip Column 10
	goto SkipEntryPat

if Mod(A_Index, 22) = 1													  ;<------------ Add +1 to this line!
	TDSList := TDSList "`n" LoopTDS
else
	TDSList := TDSList "`t" LoopTDS

;;;;;  EXCEPTION SECTION ENDS  ;;;;;
	
SkipEntryPat:	
if ColumnCount = 22 													  ;<------------ Add +1 to this line!
	{
	ColumnCount = 1
	RowsSoFar++
	GuiControl, , ProgressBar, %RowsSoFar%
	GuiControl, , Static1, %RowsSoFar% / %ApproxRows%
	}
else
	ColumnCount++
}
Sleep 1000
StringReplace, TDSList, TDSList, `n, , 
Clipboard = %TDSList%
GuiControl, , Static1, And we're done! You can now paste the Facing data into the Facing template.
Sleep 3000
Gui, Destroy
return

Trademark:
RowsSoFar = -1
ColumnCount = 1
;Gui, Submit
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
var := ie.LocationURL ;grab current url	
NumTDS := ie.document.GetElementsBytagname("TD").length ; Use for multi-level & change array value

TDSList := ""
Loop %NumTDS%
{
LoopTDS := ie.document.GetElementsBytagname("TD")[A_Index + 23].InnerText ; Use for multi-level & change array value
LoopTDS := RegExReplace(LoopTDS, "[\r\n]")

if ColumnCount = 6													;;; IF THEY ADD COLUMNS, SEE PATENT INSTRUCTIONS ABOVE ;;;
	goto SkipEntryTM

if (ColumnCount = 7) or (ColumnCount = 8) or (ColumnCount = 9)
	LoopTDS := ""	

if ColumnCount = 8
	goto SkipEntryTM
	
if ColumnCount = 11
	goto SkipEntryTM

if ColumnCount = 12
	goto SkipEntryTM
	
if Mod(A_Index, 22) = 1
	TDSList := TDSList "`n" LoopTDS
else
	TDSList := TDSList "`t" LoopTDS
	
SkipEntryTM:	
if ColumnCount = 22
	{
	ColumnCount = 1
	RowsSoFar++
	GuiControl, , ProgressBar, %RowsSoFar%
	GuiControl, , Static1, %RowsSoFar% / %ApproxRows%
	}
else
	ColumnCount++
}
Sleep 1000
StringReplace, TDSList, TDSList, `n, , 
Clipboard = %TDSList%
GuiControl, , Static1, And we're done! You can now paste the Facing data into the Facing template.
Sleep 3000
Gui, Destroy
return

