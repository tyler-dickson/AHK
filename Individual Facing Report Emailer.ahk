; Created with AutoHotkey by Tyler Dickson. 

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 59

; NEWCPI
global NewCPI

;MsgBox, 4, Are you using new CPI or old CPI?, Click YES if you're using new CPI.`n`nClick NO if you're using old CPI.
;IfMsgBox, Yes
	NewCPI = 1
;IfMsgBox, No
;	NewCPI = 0
	

; update template to have below when we go live.
; =CONCATENATE("https://web05.computerpackages.com/knobbe/patent/patfrmActionDue.aspx?key=",$S1,"&appId=",$T1)
; =CONCATENATE("https://web05.computerpackages.com/knobbe/trademark/tmkfrmActionDue.aspx?key=",$R1,"&tmkId=",$S1)


global Computername
global SendOnBehalfOf
global ExtraCCs := "2jca; Kimberly.Flowers"
global CLSP := "Jessica.Johansen; Nicole.Jevsevar"
global MLEAP := "Brittney.Mandella; Alyssa.Coleman"

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

IniRead,  APIUses, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements,  APIUses
	if  APIUses = ERROR
		{
		APIUses = 0
		IniWrite, %APIUses%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements,  APIUses
		IniRead,  APIUses, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements,  APIUses
		}		

				
; MsgBox, , Facing Report Individual Emailer, Hello!`n`nWelcome to the Individual Facing Report Emailer.`n`nInstead of sending a large email to ALL prosecution teams, this will instead send individual emails to each Responsible person. This has several key benefits:`n`n-Each subject line will have the Responsible person's initials at the front to allow a quick glance at who has responded. With the old method, all received emails had the same subject line, so they all blended together. You should now be able to easily tell what dates you've received an answer on.`n`n-Similar to the FACING tab on the Facing Report Template, this will allow you to select the Facing timeframe and which mailbox to "Send On Behalf Of." This will let you easily verify the Facing timeframe, and ensures all emails are correctly routed to the right mailbox.`n`n-This has a secondary benefit of increasing confidentiality. I doubt we'd encounter Ethical Walls while facing, but I suppose it IS possible. This way, people also aren't bombarded with irrelevant unrelated information.`n`nI'm sure there are other benefits that we'll figure out down the road.`n`nv.2019.4.22
FileDelete, C:\Users\%Computername%\FaceAtty.txt	




if (NewCPI)
	MsgBox, , Individual Facing Report Emailer (New CPI), Here are some tips for how to use this tool with New CPI.`n`nYou no longer need to open a query page and plug in the information or anything like that. The tool will grab everything for you.`n`nHere is what you do:`n`n1) Open your Facing Template spreadsheet to the proper sheet.`n`n2) Set your date range, then click Patent or Trademark. It will automatically grab the information for you. It takes maybe 3-5 seconds usually.`n`n3) The data will start populating the spreadsheet row by row. Try not to touch your computer too much during this time, just in case.`n`n4) You'll get a pop-up when it is done, and you're good to go. Everything else should be the same as it was before.

if (NewCPI)
	Gui, New, , Individual Facing Report Emailer (New CPI) 
else
	Gui, New, , Individual Facing Report Emailer v.8.4.2021
	
Gui, Font, s12
Gui, Add, Text, x10 w255 Section Center, Select the Facing Date Range`n(Hold Shift to select multiple days.)
Gui, Add, MonthCal, xp+15 yp+50  Multi vDateRange,
Gui, Add, Text, Center xp yp+170 wp,Select which mailbox you are "Sending On Behalf Of."
Gui, Add, DropDownList, Center xp yp+50 wp vSendOnBehalfOf, OCINTDATES.Mailbox||BRANCHINTDATES.Mailbox|-----|OCUSDATES.Mailbox|BRANCHUSDATES.Mailbox|

Gui, Font,
Gui, Add, ListView, Grid -Multi r16 w650 xs+265 ys, Date|Action Due|Action Type|Indicator|Client Code|Responsible|Email
Gui, Font, bold
if (NewCPI)
	Gui, Add, Text, Center xp+655 yp+50 w150, Click above buttons to grab Facing data.`n`nMake sure you set your dates first and you're on the correct sheet!
else
	Gui, Add, Text, Center xp+655 yp+70 w150, Use Control + F12 to clean data from Facing query. You can then paste into Excel template.

Gui, Font,
Gui, Font, s12

if (NewCPI)
	Gui, Add, Button, gGrabFacingInfo  xp yp+82 w150 h45, Pull Facing Data from Excel
else
	Gui, Add, Button, gGrabFacingInfo  xp yp+62 w150 h45, Pull Facing Data from Excel
	
Gui, Add, Button, gClearFacingInfo xp yp+45 wp h35, Clear Facing Info
Gui, Add, Button, gShowSignature   xp yp+44 wp hp, Saved Signature
Gui, Add, Button, gCreateEmails    xp yp+44 wp hp, Create Emails
Gui, Font, s8 bold
Gui, Add, Button, gOpenPatentPage    xs+920 ys-8 w70 hp, Patent
Gui, Add, Button, gOpenTMPage    	xs+1000 ys-8 w70 hp, Trademark
Gui, Font,
Gui, Font, s8 underline
Gui, Add, Text,						xs+933  yp+40 w83 Left, Single Atty Only?
Gui, Font,
Gui, Add, Edit,	vsingleAtty			xp+84 	yp-3 w40 Center, % ""


if (NewCPI)
	{ 
	}
else
	Gui, Add, Button, gPlugIntoQuery xs+920 yp+40 w150, Plug Into Query Page
Gui, Font,
Gui, Add, StatusBar,, 
OnMessage(0x200, "Help")
Gui, Show
return

OpenPatentPage:
if (NewCPI)
	gosub NewCPIGrabPatentData
else
	Run, http://oc-insideknobbe/intranet/docket/reports/Custom_Reports/Tyler_Dickson/rptActionDuePat.cfm
return

OpenTMPage:
if (NewCPI)
	gosub NewCPIGrabTMData
else
	Run, http://oc-insideknobbe/intranet/docket/reports/Custom_Reports/Tyler_Dickson/rptActionDue.cfm
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
		{
		AttorneyInitials := "2" . Trim(FaceAttyParts6)
		AttorneyInitials := Trim(AttorneyInitials)
		}
	else
		AttorneyInitials := Trim(AttorneyInitials)
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
EmailBodyContents := "<HTML><style> table {border-style: solid; border-collapse:collapse; border-width: 1px;} td {border-style: solid; border-collapse:collapse; border-width: 1px; text-align: center; vertical-align: middle; padding: 5px;} p{color: blue;} </style><p><BODY><p>International Docketing has not yet received instructions for the below actions. Your immediate response to <u>**INTDATES</u> is required. Thank you!</p><br><table><tr><td align=center valign=middle>" DueDate "</td><td align=center valign=middle>" ActionType "</td><td align=center valign=middle>" ActionDue "</td><td align=center valign=middle>" Indicator "</td><td align=center valign=middle>" ClientCode "</td><td align=center valign=middle>" Responsible "</td></tr>"
MailItem.To := EmailAddress 
EmailSubject := Responsible " | " DateRange " Docket Items Requiring Immediate Response"
StringReplace, EmailSubject, EmailSubject, `r, , A
MailItem.Subject := EmailSubject ;change to whatever your subject is.
	if ((Responsible = "DJF") || (Responsible = "MBH") || (Responsible = "RJR") || (Responsible = "TYY") || (Responsible = "BJJ") || (Responsible = "ZJH") || (Responsible = "MFX") || (Responsible = "KWK") || (Responsible = "LYK") || (Responsible = "NEN") || (Responsible = "SYJ") || (Responsible = "SZW"))
		MailItem.CC := ExtraCCs
	else if InStr(ClientCode, "SMNPH") or InStr(ClientCode, "SNCOV") or InStr(ClientCode, "BLSKY") or InStr(ClientCode, "KLYPT")
		MailItem.CC := CLSP	
	else if InStr(ClientCode, "MLEAP") 
		MailItem.CC := MLEAP
		
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
	else if InStr(ClientCode, "MLEAP") 
		MailItem.CC := MLEAP
return

GuiClose:
;Escape::
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



#F4::
offset = 0
xl := ComObjActive("Excel.Application")
ReportType := xl.Range("B2").Value

xl.Range(xl.Rows("1"),xl.Rows("3")).Delete ; Deletes top three rows.
Sleep 200
xl.Range(xl.columns("K"),xl.columns("L")).Delete
Sleep 200
xl.Range(xl.columns("F"),xl.columns("I")).Delete
Sleep 200
xl.Columns("F").Insert
Sleep 200
xl.Columns("F").Insert
Sleep 200
xl.Range(xl.columns("A"),xl.columns("Z")).Interior.ColorIndex := 0 ; https://the-automator.com/shading-cells-in-excel-with-autohotkey/
Sleep 200

while (xl.Range("A" . A_Index).Value != "") 
	offset++

xl.Range("A1:R" offset).Borders.Color := 14998742	; light blue? 

MSgBox, Need to fix for conditional formatting

Loop % offset
{
; StringReplace, temp, temp, % chr(160),  , All

temp := xl.Range("I" A_Index).Value
xl.Range("I" A_Index) := SubStr(temp, 1, 3)	

temp := xl.Range("J" A_Index).Value
xl.Range("J" A_Index) := SubStr(temp, 1, 3)			

temp := xl.Range("K" A_Index).Value
xl.Range("K" A_Index) := SubStr(temp, 1, 3)	

temp := xl.Range("L" A_Index).Value
xl.Range("L" A_Index) := SubStr(temp, 1, 3)		

temp := xl.Range("M" A_Index).Value
xl.Range("M" A_Index) := SubStr(temp, 1, 3)	

}
MsgBox, done

xl.Range("A1:R" offset).Select
Sleep 200
xl.Selection.Copy


return



#F3::
ie := WBGet()
NumTRS := ie.document.GetElementsBytagname("TR").length ; Use for multi-level & change array value

offset = 1

Loop % NumTRS
{
if InStr(ie.document.GetElementsBytagname("TR")[A_Index - offset].getElementsByTagName("TD")[1].innerText, "Confirm Status (Recent Tranin) / TMPL")
	{
	ie.document.GetElementsBytagname("TABLE")[0].deleteRow(A_Index - offset)
	offset++
	ie.document.GetElementsBytagname("TD")[0].innerText := "Records Removed: " offset
	}

;else if InStr(ie.document.GetElementsBytagname("TR")[A_Index - offset].getElementsByTagName("TD")[1].innerText, "Reminder")
;	{
;	ie.document.GetElementsBytagname("TABLE")[0].deleteRow(A_Index - offset)
;	offset++
;	ie.document.GetElementsBytagname("TD")[0].innerText := "Records Removed: " offset
;	}

	
}

NumTRS := ie.document.GetElementsBytagname("TR").length ; Use for multi-level & change array value

	ie.document.GetElementsBytagname("TD")[0].innerText := "DONE! Records Removed: " offset
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


Clipboard := TDSList



/*

if Mod(A_Index, 22) = 1													  ;<------------ Add +1 to this line!
	{
	TDSList := LoopTDS
	}
else
	TDSList := TDSList "`t" LoopTDS

;;;;;  EXCEPTION SECTION ENDS  ;;;;;
	
SkipEntryPat:	
if ColumnCount = 22 													  ;<------------ Add +1 to this line!
	{
	xl.Range("B" . RowsSoFar + 1).Select
	
	Clipboard := TDSList
	
	ClipWait, 0.5, 0
	xl.ActiveSheet.Paste

	if (xl.Range("B" . RowsSoFar + 1).Value == "")
		{
		Sleep 100
		xl.ActiveSheet.Paste
		}
	TDSList := ""
	ColumnCount = 1
	RowsSoFar++
	GuiControl, , ProgressBar, %RowsSoFar%
	GuiControl, , Static1, %RowsSoFar% / %ApproxRows%
	}
else
	ColumnCount++
	
}


"

*This single application containing 17 designs has been further broken into TWO applications. This is part of the second application designs 1 of 4

Application 2: (4 Designs)
AURIS.101XEM/2/3/4 | Priority: 29/634024
Application 1: (13 designs)
AURIS.099XEM/2       | Priority: 29/634007
AURIS.100XEM/2/3/4 | Priority: 29/634021
AURIS.102XEM/2/3    | Priority: 29/634027
AURIS.103XEM/2/3/4 | Priority: 29/634023
---------------------------------------------------------
This is design 7 of 17. 5 application were combined into a single application with 17 embodiments/designs

AURIS.099XEM/2       | Priority: 29/634007
AURIS.100XEM/2/3/4 | Priority: 29/634021
AURIS.101XEM/2/3/4 | Priority: 29/634024
AURIS.102XEM/2/3    | Priority: 29/634027
AURIS.103XEM/2/3/4 | Priority: 29/634023





*/

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

F1::
PlugIntoQuery:
Gui, Submit, NoHide
ie := WBget()
StringSplit, DateRange, DateRange, -
FormatTime, DateRange1, % DateRange1, M/d/yyyy
FormatTime, DateRange2, % DateRange2, M/d/yyyy	
ie.document.getElementsByName("case_no2")[0].value := "*"
ie.document.getElementsByName("country")[1].checked := "true"
ie.document.getElementsByName("date_from")[0].value := DateRange1
ie.document.getElementsByName("date_to")[0].value := DateRange2
ie.document.getElementsByName("offices")[0].getElementsByTagName("Option")[0].selected := 0
ie.document.getElementsByName("offices")[0].getElementsByTagName("Option")[1].selected := 0
ie.document.getElementsByName("offices")[0].getElementsByTagName("Option")[2].selected := 0
ie.document.getElementsByName("offices")[0].getElementsByTagName("Option")[3].selected := 0
ie.document.getElementsByName("offices")[0].getElementsByTagName("Option")[4].selected := 0
ie.document.getElementsByName("offices")[0].getElementsByTagName("Option")[5].selected := 0
ie.document.getElementsByName("offices")[0].getElementsByTagName("Option")[6].selected := 0
ie.document.getElementsByName("offices")[0].getElementsByTagName("Option")[7].selected := 0

if instr(SendOnBehalfOf, "OC")
	{
	ie.document.getElementsByName("offices")[0].getElementsByTagName("Option")[4].selected := 1
	}
else
	{
	ie.document.getElementsByName("offices")[0].getElementsByTagName("Option")[1].selected := 1
	ie.document.getElementsByName("offices")[0].getElementsByTagName("Option")[2].selected := 1
	ie.document.getElementsByName("offices")[0].getElementsByTagName("Option")[3].selected := 1
	ie.document.getElementsByName("offices")[0].getElementsByTagName("Option")[5].selected := 1
	ie.document.getElementsByName("offices")[0].getElementsByTagName("Option")[6].selected := 1
	ie.document.getElementsByName("offices")[0].getElementsByTagName("Option")[7].selected := 1
	}
return

NewCPIGrabPatentData:
Gui, Submit, NoHide

StringSplit, DateRange, DateRange, -
FormatTime, DateRange1, % DateRange1, MM/dd/yyyy
FormatTime, DateRange2, % DateRange2, MM/dd/yyyy	

Gui, Show, NoActivate, Individual Facing Report Emailer (New CPI) - Grabbing Patent Data for %DateRange1% through %DateRange2%...

value := ""
user := "Paperboy@knobbe.com"
pass := "knobbedocket"
EndPoint1 := "https://web05.computerpackages.com/knobbews/api/Knobbe?queryString="

if (singleAtty != "")
	{
	EndPoint2 = 
	(
	SELECT t1.CaseNumber, t1.InvId, t1.ApplicationStatus, t2.ActId, t2.AppId, t2.ActionType, t2.Remarks AS ActionTypeRemarks, t3.Remarks AS ActionDueRemarks, t1.Remarks AS MainRemarks, t3.DueDate, t3.ActionDue, t3.Indicator, t3.DateTaken, t5.Attorney, t5.AttorneyType %A_Space%
	FROM tblPatCountryApplication t1 %A_Space%
	INNER JOIN tblPatActionDue t2 ON t1.AppId = t2.AppId %A_Space%
	INNER JOIN tblPatDueDate t3 ON t2.ActId = t3.ActId %A_Space%
	LEFT JOIN tblPatInvention t4 ON t1.InvId = t4.InvId %A_Space%
	LEFT JOIN tblPatAttorneyInv t5 ON t4.InvId = t5.InvId %A_Space%
	WHERE t1.Country NOT IN('US') AND t3.DateTaken IS NULL AND t5.Attorney IN('%singleAtty%') AND %A_Space%
	)
	}
else
	{
	EndPoint2 = 
	(
	SELECT t1.CaseNumber, t1.InvId, t1.ApplicationStatus, t2.ActId, t2.AppId, t2.ActionType, t2.Remarks AS ActionTypeRemarks, t3.Remarks AS ActionDueRemarks, t1.Remarks AS MainRemarks, t3.DueDate, t3.ActionDue, t3.Indicator, t3.DateTaken, t5.Attorney, t5.AttorneyType %A_Space%
	FROM tblPatCountryApplication t1 %A_Space%
	INNER JOIN tblPatActionDue t2 ON t1.AppId = t2.AppId %A_Space%
	INNER JOIN tblPatDueDate t3 ON t2.ActId = t3.ActId %A_Space%
	LEFT JOIN tblPatInvention t4 ON t1.InvId = t4.InvId %A_Space%
	LEFT JOIN tblPatAttorneyInv t5 ON t4.InvId = t5.InvId %A_Space%
	WHERE t1.Country NOT IN('US') AND t3.DateTaken IS NULL AND %A_Space%
	)
	}

EndPoint3 := " t3.DueDate BETWEEN cast('" DateRange1 "' as date) AND cast('" DateRange2 "' as date) ORDER BY t1.CaseNumber"

http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http.Open("GET", EndPoint1 . EndPoint2 . EndPoint3, true)
http.SetRequestHeader("Authorization", "Basic "  Base64Encode(user ":" pass) )
http.Send()

while (http.Responsetext == "")
	Sleep 100

value := JSON.Load(http.Responsetext)
; MsgBox, % http.Responsetext
; MsgBox, % value.Table.length()

Gui, Show, NoActivate, % "Individual Facing Report Emailer (New CPI) - Patent data grabbed! " value.Table.length()
WinActivate, ahk_exe EXCEL.EXE

global offset = 2
storedAction := ""
storedCode := ""
attys := []
xl := ComObjActive("Excel.Application")

storedAction := value.Table[1].ActionDue
storedCode := value.Table[1].CaseNumber

Loop % value.Table.length() + 1
	{
	if (storedAction == value.Table[A_Index].ActionDue && storedCode == value.Table[A_Index].CaseNumber)
		{
		tempAtty := value.Table[A_Index].Attorney " - " value.Table[A_Index].AttorneyType
		attys.Push(tempAtty)
		}
	else if (value.Table[A_Index].CaseNumber != storedCode)
		{
		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`r`n", "`n")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`r`n", "`n")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`r`n", "`n")

		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`r", "`n")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`r", "`n")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`r", "`n")

		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`n`n", "`n")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`n`n", "`n")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`n`n", "`n")

		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`n`n`n", "`n")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`n`n`n", "`n")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`n`n`n", "`n")
		
		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`n", "; ")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`n", "; ")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`n", "; ")
	
		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`t", " ")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`t", " ")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`t", " ")	
		
		billingAtty := ""
		responsibleAtty := ""
		workingAtty := ""
		reviewingAtty := ""
		ippAtty := ""
		uspsAtty := ""
		innerLoop = 1
		
		Loop % attys.Length()
			{
			if InStr(attys[innerLoop], "Billing") && !InStr(billingAtty, SubStr(attys[innerLoop], 1, 3))
				billingAtty := billingAtty " " SubStr(attys[innerLoop], 1, 3)
			else if InStr(attys[innerLoop], "Responsible") && !InStr(responsibleAtty, SubStr(attys[innerLoop], 1, 3))
				responsibleAtty := responsibleAtty " " SubStr(attys[innerLoop], 1, 3)			
			else if InStr(attys[innerLoop], "Working") && !InStr(workingAtty, SubStr(attys[innerLoop], 1, 3))
				workingAtty := workingAtty " " SubStr(attys[innerLoop], 1, 3)				
			else if InStr(attys[innerLoop], "Reviewing") && !InStr(reviewingAtty, SubStr(attys[innerLoop], 1, 3))
				reviewingAtty := reviewingAtty " " SubStr(attys[innerLoop], 1, 3)	
			else if InStr(attys[innerLoop], "IPP") && !InStr(ippAtty, SubStr(attys[innerLoop], 1, 3))
				ippAtty := ippAtty " " SubStr(attys[innerLoop], 1, 3)
			else if InStr(attys[innerLoop], "USPS") && !InStr(uspsAtty, SubStr(attys[innerLoop], 1, 3))
				uspsAtty := uspsAtty " " SubStr(attys[innerLoop], 1, 3)		
		
			innerLoop++
			}

		xl.Range("B" . offset).Select
		
		Clipboard := value.Table[A_Index - 1].DueDate "`t" value.Table[A_Index - 1].ActionDue "`t" value.Table[A_Index - 1].ActionType "`t" value.Table[A_Index - 1].Indicator "`t" value.Table[A_Index - 1].CaseNumber "`t`t`t" value.Table[A_Index - 1].ApplicationStatus "`t" billingAtty "`t" responsibleAtty "`t" workingAtty "`t" reviewingAtty "`t" ippAtty "`t" uspsAtty "`t" value.Table[A_Index - 1].ActionTypeRemarks "`t" value.Table[A_Index - 1].ActionDueRemarks "`t" value.Table[A_Index - 1].MainRemarks "`t" value.Table[A_Index - 1].ActId "`t" value.Table[A_Index - 1].AppId
		
		ClipWait, 0.5, 0
		xl.ActiveSheet.Paste

		if (xl.Range("B" . offset).Value == "")
			{
			Sleep 100
			xl.ActiveSheet.Paste
			}


	;	faceCheck := xl.Range("A" . offset).Value
	;	if (faceCheck == "Not faced" || faceCheck == "Exam Desk handles" || faceCheck == "Intfees handles" || faceCheck == "ABA Desk handles")
	;		{
	;		
	;		}
	;	else
			offset++		

		storedAction := value.Table[A_Index].ActionDue
		storedCode := value.Table[A_Index].CaseNumber
		attys := []
		attys.Push(value.Table[A_Index].Attorney " - " value.Table[A_Index].AttorneyType)
		}
	else
		{
		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`r`n", "`n")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`r`n", "`n")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`r`n", "`n")

		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`r", "`n")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`r", "`n")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`r", "`n")

		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`n`n", "`n")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`n`n", "`n")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`n`n", "`n")

		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`n`n`n", "`n")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`n`n`n", "`n")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`n`n`n", "`n")
		
		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`n", "; ")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`n", "; ")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`n", "; ")
	
		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`t", " ")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`t", " ")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`t", " ")	
		
		billingAtty := ""
		responsibleAtty := ""
		workingAtty := ""
		reviewingAtty := ""
		ippAtty := ""
		uspsAtty := ""
		innerLoop = 1
		
		Loop % attys.Length()
			{
			if InStr(attys[innerLoop], "Billing") && !InStr(billingAtty, SubStr(attys[innerLoop], 1, 3))
				billingAtty := billingAtty " " SubStr(attys[innerLoop], 1, 3)
			else if InStr(attys[innerLoop], "Responsible") && !InStr(responsibleAtty, SubStr(attys[innerLoop], 1, 3))
				responsibleAtty := responsibleAtty " " SubStr(attys[innerLoop], 1, 3)			
			else if InStr(attys[innerLoop], "Working") && !InStr(workingAtty, SubStr(attys[innerLoop], 1, 3))
				workingAtty := workingAtty " " SubStr(attys[innerLoop], 1, 3)				
			else if InStr(attys[innerLoop], "Reviewing") && !InStr(reviewingAtty, SubStr(attys[innerLoop], 1, 3))
				reviewingAtty := reviewingAtty " " SubStr(attys[innerLoop], 1, 3)	
			else if InStr(attys[innerLoop], "IPP") && !InStr(ippAtty, SubStr(attys[innerLoop], 1, 3))
				ippAtty := ippAtty " " SubStr(attys[innerLoop], 1, 3)
			else if InStr(attys[innerLoop], "USPS") && !InStr(uspsAtty, SubStr(attys[innerLoop], 1, 3))
				uspsAtty := uspsAtty " " SubStr(attys[innerLoop], 1, 3)		
		
			innerLoop++
			}

		xl.Range("B" . offset).Select
		
		Clipboard := value.Table[A_Index - 1].DueDate "`t" value.Table[A_Index - 1].ActionDue "`t" value.Table[A_Index - 1].ActionType "`t" value.Table[A_Index - 1].Indicator "`t" value.Table[A_Index - 1].CaseNumber "`t`t`t" value.Table[A_Index - 1].ApplicationStatus "`t" billingAtty "`t" responsibleAtty "`t" workingAtty "`t" reviewingAtty "`t" ippAtty "`t" uspsAtty "`t" value.Table[A_Index - 1].ActionTypeRemarks "`t" value.Table[A_Index - 1].ActionDueRemarks "`t" value.Table[A_Index - 1].MainRemarks "`t" value.Table[A_Index - 1].ActId "`t" value.Table[A_Index - 1].AppId
		
		ClipWait, 0.5, 0
		xl.ActiveSheet.Paste

		if (xl.Range("B" . offset).Value == "")
			{
			Sleep 100
			xl.ActiveSheet.Paste
			}


	;	faceCheck := xl.Range("A" . offset).Value
	;	if (faceCheck == "Not faced" || faceCheck == "Exam Desk handles" || faceCheck == "Intfees handles" || faceCheck == "ABA Desk handles")
	;		{
	;		
	;		}
	;	else
			offset++		

		storedAction := value.Table[A_Index].ActionDue
		storedCode := value.Table[A_Index].CaseNumber
		attys := []
		attys.Push(value.Table[A_Index].Attorney " - " value.Table[A_Index].AttorneyType)
		}
		
	storedAction := value.Table[A_Index].ActionDue
	storedCode := value.Table[A_Index].CaseNumber
	
	Gui, Show, NoActivate, % "Individual Facing Report Emailer (New CPI) - Adding to spreadsheet: " A_Index - 1 " / " value.Table.length()
	}
MsgBox, And we're done!
Gui, Show, NoActivate, Individual Facing Report Emailer (New CPI)
return

NewCPIGrabTMData:
Gui, Submit, NoHide
StringSplit, DateRange, DateRange, -
FormatTime, DateRange1, % DateRange1, MM/dd/yyyy
FormatTime, DateRange2, % DateRange2, MM/dd/yyyy	

Gui, Show, NoActivate, Individual Facing Report Emailer (New CPI) - Grabbing Trademark Data for %DateRange1% through %DateRange2%...

value := ""
user := "Paperboy@knobbe.com"
pass := "knobbedocket"
EndPoint1 := "https://web05.computerpackages.com/knobbews/api/Knobbe?queryString="

if (singleAtty != "")
	{
	EndPoint2 = 
	(
	SELECT t1.CaseNumber, t1.TmkId, t1.TrademarkStatus, t2.ActId, t2.TmkId, t2.ActionType, t2.Remarks AS ActionTypeRemarks, t3.Remarks AS ActionDueRemarks, t1.Remarks AS MainRemarks, t3.DueDate, t3.ActionDue, t3.Indicator, t3.DateTaken, t5.Attorney, t5.AttorneyType %A_Space%
	FROM tblTmkTrademark t1 %A_Space%
	INNER JOIN tblTmkActionDue t2 ON t1.TmkId = t2.TmkId %A_Space%
	INNER JOIN tblTmkDueDate t3 ON t2.ActId = t3.ActId %A_Space%
	LEFT JOIN tblTmkAttorney t5 ON t1.TmkId = t5.TmkId %A_Space%
	WHERE t1.Country NOT IN('US') AND t3.DateTaken IS NULL AND t5.Attorney IN('%singleAtty%') AND %A_Space%
	)
	}
else
	{
	EndPoint2 = 
	(
	SELECT t1.CaseNumber, t1.TmkId, t1.TrademarkStatus, t2.ActId, t2.TmkId, t2.ActionType, t2.Remarks AS ActionTypeRemarks, t3.Remarks AS ActionDueRemarks, t1.Remarks AS MainRemarks, t3.DueDate, t3.ActionDue, t3.Indicator, t3.DateTaken, t5.Attorney, t5.AttorneyType %A_Space%
	FROM tblTmkTrademark t1 %A_Space%
	INNER JOIN tblTmkActionDue t2 ON t1.TmkId = t2.TmkId %A_Space%
	INNER JOIN tblTmkDueDate t3 ON t2.ActId = t3.ActId %A_Space%
	LEFT JOIN tblTmkAttorney t5 ON t1.TmkId = t5.TmkId %A_Space%
	WHERE t1.Country NOT IN('US') AND t3.DateTaken IS NULL AND %A_Space%
	)	
	}

EndPoint3 := " t3.DueDate BETWEEN cast('" DateRange1 "' as date) AND cast('" DateRange2 "' as date) ORDER BY t1.CaseNumber"

http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http.Open("GET", EndPoint1 . EndPoint2 . EndPoint3, true)
http.SetRequestHeader("Authorization", "Basic "  Base64Encode(user ":" pass) )
http.Send()

while (http.Responsetext == "")
	Sleep 100

value := JSON.Load(http.Responsetext)



;MsgBox, % http.Responsetext
;MsgBox, % value.Table.length()

Gui, Show, NoActivate, % "Individual Facing Report Emailer (New CPI) - Trademark data grabbed! " value.Table.length()
WinActivate, ahk_exe EXCEL.EXE

global offset = 2
storedAction := ""
storedCode := ""
attys := []
xl := ComObjActive("Excel.Application")


storedAction := value.Table[1].ActionDue
storedCode := value.Table[1].CaseNumber

Loop % value.Table.length() + 1
	{
	if (storedAction == value.Table[A_Index].ActionDue && storedCode == value.Table[A_Index].CaseNumber)
		{
		tempAtty := value.Table[A_Index].Attorney " - " value.Table[A_Index].AttorneyType
		attys.Push(tempAtty)
		}
	else if (value.Table[A_Index].CaseNumber != storedCode)
		{
		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`r`n", "`n")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`r`n", "`n")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`r`n", "`n")

		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`r", "`n")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`r", "`n")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`r", "`n")

		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`n`n", "`n")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`n`n", "`n")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`n`n", "`n")

		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`n`n`n", "`n")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`n`n`n", "`n")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`n`n`n", "`n")
		
		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`n", "; ")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`n", "; ")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`n", "; ")
	
		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`t", " ")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`t", " ")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`t", " ")	
		
		billingAtty := ""
		responsibleAtty := ""
		workingAtty := ""
		reviewingAtty := ""
		tmplAtty := ""
		innerLoop = 1
		
		Loop % attys.Length()
			{
			if InStr(attys[innerLoop], "Billing") && !InStr(billingAtty, SubStr(attys[innerLoop], 1, 3))
				billingAtty := billingAtty " " SubStr(attys[innerLoop], 1, 3)
			else if InStr(attys[innerLoop], "Responsible") && !InStr(responsibleAtty, SubStr(attys[innerLoop], 1, 3))
				responsibleAtty := responsibleAtty " " SubStr(attys[innerLoop], 1, 3)			
			else if InStr(attys[innerLoop], "Working") && !InStr(workingAtty, SubStr(attys[innerLoop], 1, 3))
				workingAtty := workingAtty " " SubStr(attys[innerLoop], 1, 3)				
			else if InStr(attys[innerLoop], "Reviewing") && !InStr(reviewingAtty, SubStr(attys[innerLoop], 1, 3))
				reviewingAtty := reviewingAtty " " SubStr(attys[innerLoop], 1, 3)	
			else if InStr(attys[innerLoop], "TMPL") && !InStr(tmplAtty, SubStr(attys[innerLoop], 1, 3))
				tmplAtty := tmplAtty " " SubStr(attys[innerLoop], 1, 3)
		
			innerLoop++
			}
		xl.Range("B" . offset).Select
	
		Clipboard := value.Table[A_Index - 1].DueDate "`t" value.Table[A_Index - 1].ActionDue "`t" value.Table[A_Index - 1].ActionType "`t" value.Table[A_Index - 1].Indicator "`t" value.Table[A_Index - 1].CaseNumber "`t`t`t" value.Table[A_Index - 1].TrademarkStatus "`t" billingAtty "`t" responsibleAtty "`t" workingAtty "`t" reviewingAtty "`t" tmplAtty "`t" value.Table[A_Index - 1].ActionTypeRemarks "`t" value.Table[A_Index - 1].ActionDueRemarks "`t" value.Table[A_Index - 1].MainRemarks "`t" value.Table[A_Index - 1].ActId "`t" value.Table[A_Index - 1].TmkId
		
		ClipWait, 0.5, 0
		xl.ActiveSheet.Paste

		if (xl.Range("B" . offset).Value == "")
			{
			Sleep 100
			xl.ActiveSheet.Paste
			}

	;	xl.Columns("B:I").AutoFit

	;	faceCheck := xl.Range("A" . offset).Value
	;	if (faceCheck == "Not faced")
	;		{
	;		
	;		}
	;	else
			offset++		
		
		storedAction := value.Table[A_Index].ActionDue
		storedCode := value.Table[A_Index].CaseNumber
		attys := []
		attys.Push(value.Table[A_Index].Attorney " - " value.Table[A_Index].AttorneyType)
		}
	else
		{
		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`r`n", "`n")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`r`n", "`n")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`r`n", "`n")

		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`r", "`n")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`r", "`n")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`r", "`n")

		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`n`n", "`n")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`n`n", "`n")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`n`n", "`n")

		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`n`n`n", "`n")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`n`n`n", "`n")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`n`n`n", "`n")
		
		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`n", "; ")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`n", "; ")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`n", "; ")
	
		value.Table[A_Index - 1].MainRemarks := StrReplace(value.Table[A_Index - 1].MainRemarks, "`t", " ")
		value.Table[A_Index - 1].ActionDueRemarks := StrReplace(value.Table[A_Index - 1].ActionDueRemarks, "`t", " ")
		value.Table[A_Index - 1].ActionTypeRemarks := StrReplace(value.Table[A_Index - 1].ActionTypeRemarks, "`t", " ")	
		
		billingAtty := ""
		responsibleAtty := ""
		workingAtty := ""
		reviewingAtty := ""
		tmplAtty := ""
		innerLoop = 1
		
		Loop % attys.Length()
			{
			if InStr(attys[innerLoop], "Billing") && !InStr(billingAtty, SubStr(attys[innerLoop], 1, 3))
				billingAtty := billingAtty " " SubStr(attys[innerLoop], 1, 3)
			else if InStr(attys[innerLoop], "Responsible") && !InStr(responsibleAtty, SubStr(attys[innerLoop], 1, 3))
				responsibleAtty := responsibleAtty " " SubStr(attys[innerLoop], 1, 3)			
			else if InStr(attys[innerLoop], "Working") && !InStr(workingAtty, SubStr(attys[innerLoop], 1, 3))
				workingAtty := workingAtty " " SubStr(attys[innerLoop], 1, 3)				
			else if InStr(attys[innerLoop], "Reviewing") && !InStr(reviewingAtty, SubStr(attys[innerLoop], 1, 3))
				reviewingAtty := reviewingAtty " " SubStr(attys[innerLoop], 1, 3)	
			else if InStr(attys[innerLoop], "TMPL") && !InStr(tmplAtty, SubStr(attys[innerLoop], 1, 3))
				tmplAtty := tmplAtty " " SubStr(attys[innerLoop], 1, 3)
		
			innerLoop++
			}
		xl.Range("B" . offset).Select
	
		Clipboard := value.Table[A_Index - 1].DueDate "`t" value.Table[A_Index - 1].ActionDue "`t" value.Table[A_Index - 1].ActionType "`t" value.Table[A_Index - 1].Indicator "`t" value.Table[A_Index - 1].CaseNumber "`t`t`t" value.Table[A_Index - 1].TrademarkStatus "`t" billingAtty "`t" responsibleAtty "`t" workingAtty "`t" reviewingAtty "`t" tmplAtty "`t" value.Table[A_Index - 1].ActionTypeRemarks "`t" value.Table[A_Index - 1].ActionDueRemarks "`t" value.Table[A_Index - 1].MainRemarks "`t" value.Table[A_Index - 1].ActId "`t" value.Table[A_Index - 1].TmkId
		
		ClipWait, 0.5, 0
		xl.ActiveSheet.Paste

		if (xl.Range("B" . offset).Value == "")
			{
			Sleep 100
			xl.ActiveSheet.Paste
			}

	;	xl.Columns("B:I").AutoFit

	;	faceCheck := xl.Range("A" . offset).Value
	;	if (faceCheck == "Not faced")
	;		{
	;		
	;		}
	;	else
			offset++		
		
		storedAction := value.Table[A_Index].ActionDue
		storedCode := value.Table[A_Index].CaseNumber
		attys := []
		attys.Push(value.Table[A_Index].Attorney " - " value.Table[A_Index].AttorneyType)
		}

	
	storedAction := value.Table[A_Index].ActionDue
	storedCode := value.Table[A_Index].CaseNumber
	Gui, Show, NoActivate, % "Individual Facing Report Emailer (New CPI) - Adding to spreadsheet: " A_Index - 1 " / " value.Table.length()
	}
MsgBox, And we're done!
gosub RecordAPIUses
Gui, Show, NoActivate, Individual Facing Report Emailer (New CPI)
return

RecordAPIUses:	
IniRead, APIUses, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, APIUses
APIUses++
IniWrite, %APIUses%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, APIUses
return	

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
