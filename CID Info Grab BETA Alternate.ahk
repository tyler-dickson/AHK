#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 119

/*
												Client Code - txtClientCode
Billing Attorney - txtAttyBilling
Assigned Attorney - txtAttyAssigned
Working Attorney - txtAttyWorking
Contact - txtContactName
Job Title - txtTitleJob
Company - txtCompany
Address - txtAddress
Billing Address - txtAddressBilling
Mailing Address - txtAddressMailing
City - txtCity
State - txtState
State of Incorporation - txtStateofInc
Country - txtCountry
ZIP - txtZip
Business Phone - txtBusinessPhone
Fax - txtFax
Email - txtEmail
Web Page - txtWebPageDecription
Other Phone - txtOtherPhone
Mobile Phone - txtMobilePhone
Foreign Associate - chkForeignAssoc (checkbox)
INTA - chkINTA (checkbox)
Holiday - chkHoliday (checkbox)
INT Seminar - chkINTSeminar (checkbox)
KMOB Seminar - chkCASeminar (checkbox)
Other Contacts - txtOtherContacts
Notes - txtNotes
Reference Number - txtRefNum
Patent Contact - txtContactPA
Patent Address - txtAddressPA
Responsible Patent Attorney - txtRespAttyPA
Working Patent Attorney - txtWrkAttyPA
Trademark Contact - txtContactTM
Trademark Address - txtAddressTM
Trademark Responsible Attorney - txtRespAttyTM
Trademark Working Attorney - txtWrkAttyTM
Litigation Contact - txtContactLit
Litigation Address - txtAddressLit
Responsible Litigation Attorney - txtRespAttyLit
Working Litigation Attorney - txtWrkAttyLit
Inactive - chkInactive (checkbox)
Inactive Description - txtInactiveReason
Flag = chkFlag (checkbox)
Flag Description - txtFlagDescription
Engagement Agreement - chkEngAgree (checkbox)
Annuities - txtAnnuities
*/

width = 350
height = 50

Pos1 = 30
Pos2 = 80
Pos3 = 130
Pos4 = 180
Pos5 = 230
Pos6 = 280
Pos7 = 330
Pos8 = 380
Pos9  = 430
Pos10 = 480
Pos11 = 530
Pos12 = 580
Pos13 = 630


Gui, 1: New, Resize, CID Thingamabob
Gui, 2: New, Resize, Client Search

Gui, 1: Add, Tab3, x0 y0 w490 h800, 1|2|3|4
Gui, 1: Tab, 1
Gui, 1: Font, bold underline
Gui, 1: Add, Text, 	 x0 y%Pos1% w100 Center, Client Code
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton1, %ClientCode%

Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos2% w100 Center, Contact Name
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton2, %ContactName%

Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos3% w100 Center, Job Title
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton3, %JobTitle%

Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos4% w100 Center, Company
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton4, %Company%

Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos5% w100 Center, Address
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton5, %Address%

Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos6% w100 Center, Billing Address
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton6, %BillingAddress%

Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos7% w100 Center, Mailing Address
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton7, %MailingAddress%

Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos8% w100 Center, City/State/ZIP
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton8, %CityStateZip%

Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos9% w100 Center, Phone Number
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton9, %Phone%

Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos10% w100 Center, Fax Number
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton10, %Fax%

Gui, 1: Font, bold underline ;Edit 11
Gui, 1: Add, Text,   x0 y%Pos11% w100 Center, Email Address
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton11, %Email%

;Edit12
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos12% w100 Center, State Of`nIncorporation
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton12, %StateOfIncorp%

;Edit13
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos13% w100 Center, Country
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton13, %Country%

Gui, 1: Tab, 2
;Edit14
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos1% w100 Center, Webpage
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton14, %Webpage%

;Edit15
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos2% w100 Center, Other Phone
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton15, %OtherPhone%

;Edit16
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos3% w100 Center, Mobile Phone
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton16, %MobilePhone%

;Edit17
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos4% w100 Center, Other Contact
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton17, %OtherContact%

;Edit18
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos5% w100 Center, Notes
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton18, %Notes%

;Edit19
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos6% w100 Center, Reference No.
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton19, %ReferenceNumber%

;Edit20
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos7% w100 Center, Billing Attorney
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton20, %BillingAtty%

;Edit21
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos8% w100 Center, Assigned Attorney
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton21, %AssignedAtty%

;Edit22
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos9% w100 Center, Working Attorney
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton22, %WorkingAtty%

;Edit23
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos10% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton23, %ReferenceNumber%

;Edit24
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos11% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton24, %ReferenceNumber%

;Edit25
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos12% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton25, %ReferenceNumber%

;Edit26
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos13% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton26, %ReferenceNumber%

Gui, 1: Tab, 3
;Edit14
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos1% w100 Center, Patent Contact
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton27, %PatentContact%

;Edit15
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos2% w100 Center, Patent Address
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton28, %PatentAddress%

;Edit16
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos3% w100 Center, Responsible Patent Attorney
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton29, %ResponsiblePatentAttorney%

;Edit17
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos4% w100 Center, Working Patent Attorney
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton30, %WorkingPatentAttorney%

;Edit18
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos5% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton31, %ReferenceNumber%

;Edit19
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos6% w100 Center, Trademark Contact
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton32, %TrademarkContact%

;Edit20
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos7% w100 Center, Trademark Responsible Attorney
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton33, %TrademarkResponsibleAttorney%

;Edit21
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos8% w100 Center, Trademark Working Attorney
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton34, %TrademarkWorkingAttorney%

;Edit22
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos9% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton35, %ReferenceNumber%

;Edit23
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos10% w100 Center, Litigation Contact
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton36, %LitigationContact%

;Edit24
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos11% w100 Center, Litigation Address
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton37, %LitigationAddress%

;Edit25
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos12% w100 Center, Responsible Litigation Attorney
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton38, %ResponsibleLitigationAttorney%

;Edit26
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos13% w100 Center, Working Litigation Attorney
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton39, %WorkingLitigationAttorney%

Gui, 1: Tab, 4
;Edit14
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos1% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton40, %ReferenceNumber%

;Edit15
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos2% w100 Center,TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton41, %ReferenceNumber%

;Edit16
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos3% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton42, %ReferenceNumber%

;Edit17
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos4% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton43, %ReferenceNumber%

;Edit18
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos5% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton44, %ReferenceNumber%

;Edit19
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos6% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton45, %ReferenceNumber%

;Edit20
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos7% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton46, %ReferenceNumber%

;Edit21
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos8% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton47, %ReferenceNumber%

;Edit22
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos9% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton48, %ReferenceNumber%

;Edit23
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos10% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton49, %ReferenceNumber%

;Edit24
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos11% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton50, %ReferenceNumber%

;Edit25
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos12% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton51, %ReferenceNumber%

;Edit26
Gui, 1: Font, bold underline
Gui, 1: Add, Text,   x0 y%Pos13% w100 Center, TBD
Gui, 1: Font, 
Gui, 1: Add, Edit, x100 yp-5 w%width% h%height% gButton52, %ReferenceNumber%


Gui, 1: Tab
;Gui, 1: Add, Edit,   x490 y0 w320 h208 vBusinessCardExport,
;Gui, 1: Add, Button, x490 y212 w80 gClearInfo, Clear
;Gui, 1: Add, Button, x600 y212 w150 gExport, Export to Business Card
;Gui, 1: Add, Button, x760 y212 w10 gExpand, >>
Gui, 1: Add, ActiveX, x492 y290 w1000 h385 vie, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
;Gui, 2: Add, ActiveX, x0 y-130 w700 h780 vSearch, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
ie.Navigate("http://kmobnetold/outsidekmobnet/cid/cidold/ClientList.aspx")  ; This is specific to the web browser control.
;Search.Navigate("http://kmobnet/insidekmobnet/ClientID_Search/ClientID.cfm?Client=Qualcomm&submit=Search")  ; This is specific to the web browser control.
ie.silent := true
;Search.silent := true 
;Gui, Font, underline
;Gui, 1: Add, Text, x507 y262 , SAVED CLIENTS:
;Gui, Font, 
;Gui, 1: Add, ComboBox, x600 y258 w117 Sort gSavedURL vSavedURL, HANBEV|QVID|TEST|TEST2|TEST3
;Gui, 1: Add, Button, x724 y258 w10 gGotoURL, Save




Gui, 1: Show, w820 h680
;Gui, 2: Show
SetTimer, PersistBiblio, 1000
return

;GotoURL:
;var := ie.LocationURL ;grab current url
;GuiControlGet, StatusButton1, , Button1
;MsgBox, % var " | " StatusButton1
;return

SavedURL:
Gui, Submit, NoHide
;MsgBox, %SavedURL%
if SavedURL = HANBEV
	ie.Navigate("http://kmobnetold/outsidekmobnet/cid/cidold/EditContact.aspx?ItemID=28426")
else
	ie.Navigate("http://kmobnetold/outsidekmobnet/cid/cidold/EditContact.aspx?ItemID=28426")
return

;http://kmobnet/insidekmobnet/ClientID_Search/ClientID.cfm?Client=Test&submit=Search

ClearInfo:
GuiControl, 1: , Edit1,
ie.Navigate("http://kmobnetold/outsidekmobnet/cid/cidold/ClientList.aspx")  ; This is specific to the web browser control.
return

Expand:
toggle := !toggle
	if toggle
		{
		Gui, Show, w1200
		Gui, 2: Show
		GuiControl, , Button14, <<
		}
	else
		{
		Gui, Show, w620
		Gui, 2: Show
		GuiControl, , Button14, >>
		}
return

Export:
Gui, Submit, NoHide
;MsgBox, % BusinessCardExport
StringSplit, BusinessCardExport, BusinessCardExport, `n, 
;MsgBox % BusinessCardExport0 " | " BusinessCardExport1 " | " BusinessCardExport2 " | " BusinessCardExport3 " | " BusinessCardExport4
olMailItem := 0
o:= ComObjActive("Outlook.Application").Session()
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
MailItem.Subject := "Test Business Card" ;change to whatever your subject is.
MailItem.BodyFormat := olFormatHTML
MailItem.HTMLBody := "<HTML><BODY><b>" BusinessCardExport1 "</b><br>" BusinessCardExport2 "<BR>" BusinessCardExport3 "<BR>" BusinessCardExport4  "<BR>" BusinessCardExport5   "<BR>" BusinessCardExport6 "<BR>" BusinessCardExport7 "<BR>" BusinessCardExport8 "<BR>" BusinessCardExport9 "<BR>" BusinessCardExport10 "<BR>" BusinessCardExport11 "</BODY></p></HTML>"
MailItem.Display ;Make email visible
;Clipboard := MailItem.HTMLBody
return



Button1:
GuiControlGet, StatusButton1, , Button1
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton1
	else
		BusinessCard := StatusEdit1 "`n" StatusButton1
GuiControl, 1: , Edit1, %BusinessCard%
return

Button2:
GuiControlGet, StatusButton2, , Button2
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton2
	else
		BusinessCard := StatusEdit1 "`n" StatusButton2
GuiControl, 1: , Edit1, %BusinessCard%
return

Button3:
GuiControlGet, StatusButton3, , Button3
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton3
	else
		BusinessCard := StatusEdit1 "`n" StatusButton3
GuiControl, 1: , Edit1, %BusinessCard%
return

Button4:
GuiControlGet, StatusButton4, , Button4
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton4
	else
		BusinessCard := StatusEdit1 "`n" StatusButton4
GuiControl, 1: , Edit1, %BusinessCard%
return

Button5:
GuiControlGet, StatusButton5, , Button5
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton5
	else
		BusinessCard := StatusEdit1 "`n" StatusButton5
GuiControl, 1: , Edit1, %BusinessCard%
return

Button6:
GuiControlGet, StatusButton6, , Button6
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton6
	else
		BusinessCard := StatusEdit1 "`n" StatusButton6
GuiControl, 1: , Edit1, %BusinessCard%
return

Button7:
GuiControlGet, StatusButton7, , Button7
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton7
	else
		BusinessCard := StatusEdit1 "`n" StatusButton7
GuiControl, 1: , Edit1, %BusinessCard%
return

Button8:
GuiControlGet, StatusButton8, , Button8
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton8
	else
		BusinessCard := StatusEdit1 "`n" StatusButton8
GuiControl, 1: , Edit1, %BusinessCard%
return

Button9:
GuiControlGet, StatusButton9, , Button9
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := "PH: " StatusButton9
	else
		BusinessCard := StatusEdit1 "`n" "PH: " StatusButton9
GuiControl, 1: , Edit1, %BusinessCard%
return

Button10:
GuiControlGet, StatusButton10, , Button10
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := "FAX: "StatusButton10
	else
		BusinessCard := StatusEdit1 "`n" "FAX: " StatusButton10
GuiControl, 1: , Edit1, %BusinessCard%
return

Button11:
GuiControlGet, StatusButton11, , Button11
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton11
	else
		BusinessCard := StatusEdit1 "`n" StatusButton11
GuiControl, 1: , Edit1, %BusinessCard%
return

Button12:
GuiControlGet, StatusButton12, , Button12
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton12
	else
		BusinessCard := StatusEdit1 "`n" StatusButton12
GuiControl, 1: , Edit1, %BusinessCard%
return

Button13:
GuiControlGet, StatusButton13, , Button13
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton13
	else
		BusinessCard := StatusEdit1 "`n" StatusButton13
GuiControl, 1: , Edit1, %BusinessCard%
return

Button14:
GuiControlGet, StatusButton14, , Button14
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton14
	else
		BusinessCard := StatusEdit1 "`n" StatusButton14
GuiControl, 1: , Edit1, %BusinessCard%
return

Button15:
GuiControlGet, StatusButton15, , Button15
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton15
	else
		BusinessCard := StatusEdit1 "`n" StatusButton15
GuiControl, 1: , Edit1, %BusinessCard%
return

Button16:
GuiControlGet, StatusButton16, , Button16
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton16
	else
		BusinessCard := StatusEdit1 "`n" StatusButton16
GuiControl, 1: , Edit1, %BusinessCard%
return

Button17:
GuiControlGet, StatusButton17, , Button17
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton17
	else
		BusinessCard := StatusEdit1 "`n" StatusButton17
GuiControl, 1: , Edit1, %BusinessCard%
return

Button18:
GuiControlGet, StatusButton18, , Button18
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton18
	else
		BusinessCard := StatusEdit1 "`n" StatusButton18
GuiControl, 1: , Edit1, %BusinessCard%
return

Button19:
GuiControlGet, StatusButton19, , Button19
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton19
	else
		BusinessCard := StatusEdit1 "`n" StatusButton19
GuiControl, 1: , Edit1, %BusinessCard%
return

Button20:
GuiControlGet, StatusButton20, , Button20
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton20
	else
		BusinessCard := StatusEdit1 "`n" StatusButton20
GuiControl, 1: , Edit1, %BusinessCard%
return

Button21:
GuiControlGet, StatusButton21, , Button21
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton21
	else
		BusinessCard := StatusEdit1 "`n" StatusButton21
GuiControl, 1: , Edit1, %BusinessCard%
return

Button22:
GuiControlGet, StatusButton22, , Button22
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton22
	else
		BusinessCard := StatusEdit1 "`n" StatusButton22
GuiControl, 1: , Edit1, %BusinessCard%
return

Button23:
GuiControlGet, StatusButton23, , Button23
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton23
	else
		BusinessCard := StatusEdit1 "`n" StatusButton23
GuiControl, 1: , Edit1, %BusinessCard%
return

Button24:
GuiControlGet, StatusButton24, , Button24
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton24
	else
		BusinessCard := StatusEdit1 "`n" StatusButton24
GuiControl, 1: , Edit1, %BusinessCard%
return

Button25:
GuiControlGet, StatusButton25, , Button25
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton25
	else
		BusinessCard := StatusEdit1 "`n" StatusButton25
GuiControl, 1: , Edit1, %BusinessCard%
return

Button26:
GuiControlGet, StatusButton26, , Button26
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton26
	else
		BusinessCard := StatusEdit1 "`n" StatusButton26
GuiControl, 1: , Edit1, %BusinessCard%
return

Button27:
GuiControlGet, StatusButton27, , Button27
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton27
	else
		BusinessCard := StatusEdit1 "`n" StatusButton27
GuiControl, 1: , Edit1, %BusinessCard%
return

Button28:
GuiControlGet, StatusButton28, , Button28
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton28
	else
		BusinessCard := StatusEdit1 "`n" StatusButton28
GuiControl, 1: , Edit1, %BusinessCard%
return

Button29:
GuiControlGet, StatusButton29, , Button29
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton29
	else
		BusinessCard := StatusEdit1 "`n" StatusButton29
GuiControl, 1: , Edit1, %BusinessCard%
return

Button30:
GuiControlGet, StatusButton30, , Button30
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton30
	else
		BusinessCard := StatusEdit1 "`n" StatusButton30
GuiControl, 1: , Edit1, %BusinessCard%
return

Button31:
GuiControlGet, StatusButton31, , Button31
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton31
	else
		BusinessCard := StatusEdit1 "`n" StatusButton31
GuiControl, 1: , Edit1, %BusinessCard%
return

Button32:
GuiControlGet, StatusButton32, , Button32
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton32
	else
		BusinessCard := StatusEdit1 "`n" StatusButton32
GuiControl, 1: , Edit1, %BusinessCard%
return

Button33:
GuiControlGet, StatusButton33, , Button33
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton33
	else
		BusinessCard := StatusEdit1 "`n" StatusButton33
GuiControl, 1: , Edit1, %BusinessCard%
return

Button34:
GuiControlGet, StatusButton34, , Button34
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton34
	else
		BusinessCard := StatusEdit1 "`n" StatusButton34
GuiControl, 1: , Edit1, %BusinessCard%
return

Button35:
GuiControlGet, StatusButton35, , Button35
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton35
	else
		BusinessCard := StatusEdit1 "`n" StatusButton35
GuiControl, 1: , Edit1, %BusinessCard%
return

Button36:
GuiControlGet, StatusButton36, , Button36
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton36
	else
		BusinessCard := StatusEdit1 "`n" StatusButton36
GuiControl, 1: , Edit1, %BusinessCard%
return

Button37:
GuiControlGet, StatusButton37, , Button37
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton37
	else
		BusinessCard := StatusEdit1 "`n" StatusButton37
GuiControl, 1: , Edit1, %BusinessCard%
return

Button38:
GuiControlGet, StatusButton38, , Button38
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton38
	else
		BusinessCard := StatusEdit1 "`n" StatusButton38
GuiControl, 1: , Edit1, %BusinessCard%
return

Button39:
GuiControlGet, StatusButton39, , Button39
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton39
	else
		BusinessCard := StatusEdit1 "`n" StatusButton39
GuiControl, 1: , Edit1, %BusinessCard%
return

Button40:
GuiControlGet, StatusButton40, , Button40
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton40
	else
		BusinessCard := StatusEdit1 "`n" StatusButton40
GuiControl, 1: , Edit1, %BusinessCard%
return

Button41:
GuiControlGet, StatusButton41, , Button41
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton41
	else
		BusinessCard := StatusEdit1 "`n" StatusButton41
GuiControl, 1: , Edit1, %BusinessCard%
return

Button42:
GuiControlGet, StatusButton42, , Button42
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton42
	else
		BusinessCard := StatusEdit1 "`n" StatusButton42
GuiControl, 1: , Edit1, %BusinessCard%
return

Button43:
GuiControlGet, StatusButton43, , Button43
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton43
	else
		BusinessCard := StatusEdit1 "`n" StatusButton43
GuiControl, 1: , Edit1, %BusinessCard%
return

Button44:
GuiControlGet, StatusButton44, , Button44
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton44
	else
		BusinessCard := StatusEdit1 "`n" StatusButton44
GuiControl, 1: , Edit1, %BusinessCard%
return

Button45:
GuiControlGet, StatusButton45, , Button45
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton45
	else
		BusinessCard := StatusEdit1 "`n" StatusButton45
GuiControl, 1: , Edit1, %BusinessCard%
return

Button46:
GuiControlGet, StatusButton46, , Button46
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton46
	else
		BusinessCard := StatusEdit1 "`n" StatusButton46
GuiControl, 1: , Edit1, %BusinessCard%
return

Button47:
GuiControlGet, StatusButton47, , Button47
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton47
	else
		BusinessCard := StatusEdit1 "`n" StatusButton47
GuiControl, 1: , Edit1, %BusinessCard%
return

Button48:
GuiControlGet, StatusButton48, , Button48
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton48
	else
		BusinessCard := StatusEdit1 "`n" StatusButton48
GuiControl, 1: , Edit1, %BusinessCard%
return

Button49:
GuiControlGet, StatusButton49, , Button49
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton49
	else
		BusinessCard := StatusEdit1 "`n" StatusButton49
GuiControl, 1: , Edit1, %BusinessCard%
return

Button50:
GuiControlGet, StatusButton50, , Button50
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton50
	else
		BusinessCard := StatusEdit1 "`n" StatusButton50
GuiControl, 1: , Edit1, %BusinessCard%
return

Button51:
GuiControlGet, StatusButton51, , Button51
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton51
	else
		BusinessCard := StatusEdit1 "`n" StatusButton51
GuiControl, 1: , Edit1, %BusinessCard%
return

Button52:
GuiControlGet, StatusButton52, , Button52
GuiControlGet, StatusEdit1, , Edit1
	if StatusEdit1 =
		BusinessCard := StatusButton52
	else
		BusinessCard := StatusEdit1 "`n" StatusButton52
GuiControl, 1: , Edit1, %BusinessCard%
return

PersistBiblio:
;ie := WBGet()
;var := ie.LocationURL ;grab current url
;while ie.busy or ie.ReadyState != 4 ;Wait for page to load
;	Sleep, 100
if ClientCode = 
{
ClientCode := ie.document.getElementByID("txtClientCode").Value
ContactName := ie.document.getElementByID("txtContactName").Value
JobTitle := ie.document.getElementByID("txtTitleJob").Value
Company := ie.document.getElementByID("txtCompany").Value
Address := ie.document.getElementByID("txtAddress").Value
BillingAddress := ie.document.getElementByID("txtAddressBilling").Value
MailingAddress := ie.document.getElementByID("txtAddressMailing").Value
City := ie.document.getElementByID("txtCity").Value
State := ie.document.getElementByID("txtState").Value
ZIP := ie.document.getElementByID("txtZip").Value
CityStateZip := City ", " State " " ZIP
Phone := ie.document.getElementByID("txtBusinessPhone").Value
Fax := ie.document.getElementByID("txtFax").Value
Email := ie.document.getElementByID("txtEmail").Value
StateOfIncorp := ie.document.getElementByID("txtStateofInc").Value
Country := ie.document.getElementByID("txtCountry").Value
Webpage := ie.document.getElementByID("txtWebPageDecription").Value
OtherPhone := ie.document.getElementByID("txtOtherPhone").Value
MobilePhone := ie.document.getElementByID("txtMobilePhone").Value
OtherContact := ie.document.getElementByID("txtOtherContacts").Value
Notes := ie.document.getElementByID("txtNotes").Value
ReferenceNumber := ie.document.getElementByID("txtRefNum").Value

BillingAtty := ie.document.getElementByID("txtAttyBilling").Value
AssignedAtty := ie.document.getElementByID("txtAttyAssigned").Value
WorkingAtty := ie.document.getElementByID("txtAttyWorking").Value
PatentContact := ie.document.getElementByID("txtContactPA").Value
PatentAddress := ie.document.getElementByID("txtAddressPA").Value
ResponsiblePatentAttorney := ie.document.getElementByID("txtRespAttyPA").Value
WorkingPatentAttorney := ie.document.getElementByID("txtWrkAttyPA").Value
TrademarkContact := ie.document.getElementByID("txtContactTM").Value
TrademarkAddress := ie.document.getElementByID("txtAddressTM").Value
TrademarkResponsibleAttorney := ie.document.getElementByID("txtRespAttyTM").Value
TrademarkWorkingAttorney := ie.document.getElementByID("txtWrkAttyTM").Value
LitigationContact := ie.document.getElementByID("txtContactLit").Value
LitigationAddress := ie.document.getElementByID("txtAddressLit").Value
ResponsibleLitigationAttorney := ie.document.getElementByID("txtRespAttyLit").Value
WorkingLitigationAttorney := ie.document.getElementByID("txtWrkAttyLit").Value





GuiControl, 1: , Edit1, %ClientCode%
GuiControl, 1: , Edit2, %ContactName%
GuiControl, 1: , Edit3, %JobTitle%
GuiControl, 1: , Edit4, %Company%
GuiControl, 1: , Edit5, %Address%
GuiControl, 1: , Edit6, %BillingAddress%
GuiControl, 1: , Edit7, %MailingAddress%
GuiControl, 1: , Edit8, %CityStateZip%
GuiControl, 1: , Edit9, %Phone%
GuiControl, 1: , Edit10, %Fax%
GuiControl, 1: , Edit11, %Email%
GuiControl, 1: , Edit12, %StateOfIncorp%
GuiControl, 1: , Edit13, %Country%

GuiControl, 1: , Edit14, %Webpage%
GuiControl, 1: , Edit15, %OtherPhone%
GuiControl, 1: , Edit16, %MobilePhone%
GuiControl, 1: , Edit17, %OtherContact%
GuiControl, 1: , Edit18, %Notes%
GuiControl, 1: , Edit19, %ReferenceNumber%
GuiControl, 1: , Edit20, %BillingAtty%
GuiControl, 1: , Edit21, %AssignedAtty%
GuiControl, 1: , Edit22, %WorkingAtty%
GuiControl, 1: , Edit23, 
GuiControl, 1: , Edit24, 
GuiControl, 1: , Edit25, 
GuiControl, 1: , Edit26, 

GuiControl, 1: , Edit27, %PatentContact%
GuiControl, 1: , Edit28, %PatentAddress%
GuiControl, 1: , Edit29, %ResponsiblePatentAttorney%
GuiControl, 1: , Edit30, %WorkingPatentAttorney%
GuiControl, 1: , Edit31, 
GuiControl, 1: , Edit32, %TrademarkContact%
GuiControl, 1: , Edit33, %TrademarkResponsibleAttorney%
GuiControl, 1: , Edit34, %TrademarkWorkingAttorney%
GuiControl, 1: , Edit35, 
GuiControl, 1: , Edit36, %LitigationContact%
GuiControl, 1: , Edit37, %LitigationAddress%
GuiControl, 1: , Edit38, %ResponsibleLitigationAttorney%
GuiControl, 1: , Edit39, %WorkingLitigationAttorney%

GuiControl, 1: , Edit40, %ReferenceNumber%
GuiControl, 1: , Edit41, %ReferenceNumber%
GuiControl, 1: , Edit42, %ReferenceNumber%
GuiControl, 1: , Edit43, %ReferenceNumber%
GuiControl, 1: , Edit44, %ReferenceNumber%
GuiControl, 1: , Edit45, %ReferenceNumber%
GuiControl, 1: , Edit46, %ReferenceNumber%
GuiControl, 1: , Edit47, %ReferenceNumber%
GuiControl, 1: , Edit48, %ReferenceNumber%
GuiControl, 1: , Edit49, %ReferenceNumber%
GuiControl, 1: , Edit50, %ReferenceNumber%
GuiControl, 1: , Edit51, %ReferenceNumber%
GuiControl, 1: , Edit52, %ReferenceNumber%
}
return




/*
Client Code - txtClientCode
Billing Attorney - txtAttyBilling
Assigned Attorney - txtAttyAssigned
Working Attorney - txtAttyWorking
Contact - txtContactName
Job Title - txtTitleJob
Company - txtCompany
Address - txtAddress
Billing Address - txtAddressBilling
Mailing Address - txtAddressMailing
City - txtCity
State - txtState
State of Incorporation - txtStateofInc
Country - txtCountry
ZIP - txtZip
Business Phone - txtBusinessPhone
Fax - txtFax
Email - txtEmail
Web Page - txtWebPageDecription
Other Phone - txtOtherPhone
Mobile Phone - txtMobilePhone
Foreign Associate - chkForeignAssoc (checkbox)
INTA - chkINTA (checkbox)
Holiday - chkHoliday (checkbox)
INT Seminar - chkINTSeminar (checkbox)
KMOB Seminar - chkCASeminar (checkbox)
Other Contacts - txtOtherContacts
Notes - txtNotes
Reference Number - txtRefNum
Patent Contact - txtContactPA
Patent Address - txtAddressPA
Responsible Patent Attorney - txtRespAttyPA
Working Patent Attorney - txtWrkAttyPA
Trademark Contact - txtContactTM
Trademark Address - txtAddressTM
Trademark Responsible Attorney - txtRespAttyTM
Trademark Working Attorney - txtWrkAttyTM
Litigation Contact - txtContactLit
Litigation Address - txtAddressLit
Responsible Litigation Attorney - txtRespAttyLit
Working Litigation Attorney - txtWrkAttyLit
Inactive - chkInactive (checkbox)
Inactive Description - txtInactiveReason
Flag = chkFlag (checkbox)
Flag Description - txtFlagDescription
Engagement Agreement - chkEngAgree (checkbox)
Annuities - txtAnnuities
*/























GuiClose:
ExitApp
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









