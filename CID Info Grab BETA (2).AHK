#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 119

Gui, 1: New, , CID Thingamabob
Gui, 2: New, -Resize, Client Search
Gui, 1: Add, Text, 	 x5 y5 w180 Center, Client Code
Gui, 1: Add, Button, x5 y20 w180 gButton1, %ClientCode%
Gui, 1: Add, Text,   x5 y55 w180 Center, Contact Name
Gui, 1: Add, Button, x5 y70 w180 gButton2, %ContactName%
Gui, 1: Add, Text,   x5 y105 w180 Center, Job Title
Gui, 1: Add, Button, x5 y120 w180 gButton3, %JobTitle%
Gui, 1: Add, Text,   x5 y155 w180 Center, Company
Gui, 1: Add, Button, x5 y170 w180 gButton4, %Company%
Gui, 1: Add, Text,   x5 y205 w180 Center, Address
Gui, 1: Add, Button, x5 y220 w180 h60 gButton5, %Address%
Gui, 1: Add, Text,   x5 y290 w180 Center, Billing Address
Gui, 1: Add, Button, x5 y305 w180 h60 gButton6, %BillingAddress%
Gui, 1: Add, Text,   x5 y375 w180 Center, Mailing Address
Gui, 1: Add, Button, x5 y390 w180 h60 gButton7, %MailingAddress%
Gui, 1: Add, Text,   x5 y455 w180 Center, City/State/ZIP
Gui, 1: Add, Button, x5 y470 w180 gButton8, %CityStateZip%
Gui, 1: Add, Text,   x5 y505 w180 Center, Phone Number
Gui, 1: Add, Button, x5 y520 w180 gButton9, %Phone%
Gui, 1: Add, Text,   x5 y555 w180 Center, Fax Number
Gui, 1: Add, Button, x5 y570 w180 gButton10, %Fax%
Gui, 1: Add, Text,   x5 y605 w180 Center, Email Address
Gui, 1: Add, Button, x5 y620 w180 gButton11, %Email%

Gui, 1: Add, Edit,   x190 y22 w300 h208 vBusinessCardExport,
Gui, 1: Add, Button, x300 y232 w150 gExport, Export to Business Card
Gui, 1: Add, Button, x210 y232 w80 gClearInfo, Clear
Gui, 1: Add, Button, x460 y232 w10 gExpand, >>
Gui, 1: Add, ActiveX, x193 y290 w1000 h385 vie, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
Gui, 2: Add, ActiveX, x0 y-130 w700 h780 vSearch, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
ie.Navigate("http://kmobnetold/outsidekmobnet/cid/cidold/ClientList.aspx")  ; This is specific to the web browser control.
Search.Navigate("http://kmobnet/insidekmobnet/ClientID_Search/ClientID.cfm?Client=Qualcomm&submit=Search")  ; This is specific to the web browser control.
ie.silent := true
Search.silent := true 
Gui, Font, underline
Gui, 1: Add, Text, x207 y262 , SAVED CLIENTS:
Gui, Font, 
Gui, 1: Add, ComboBox, x300 y258 w117 Sort gSavedURL vSavedURL, HANBEV|QVID|TEST|TEST2|TEST3
Gui, 1: Add, Button, x424 y258 w10 gGotoURL, Save


Gui, 1: Show, w520 h650
;Gui, 2: Show
SetTimer, PersistBiblio, 1000
return

GotoURL:
var := ie.LocationURL ;grab current url
GuiControlGet, StatusButton1, , Button1
MsgBox, % var " | " StatusButton1
return

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
		;Gui, Show, w1200
		Gui, 2: Show
		GuiControl, , Button14, <<
		}
	else
		{
		;Gui, Show, w520
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


PersistBiblio:
;ie := WBGet()
;var := ie.LocationURL ;grab current url
;while ie.busy or ie.ReadyState != 4 ;Wait for page to load
;	Sleep, 100
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
Phone := ie.document.getElementByID("txtBusinessPhone").Value
Fax := ie.document.getElementByID("txtFax").Value
Email := ie.document.getElementByID("txtEmail").Value
CityStateZip := City ", " State " " ZIP
GuiControl, 1: , Button1, %ClientCode%
GuiControl, 1: , Button2, %ContactName%
GuiControl, 1: , Button3, %JobTitle%
GuiControl, 1: , Button4, %Company%
GuiControl, 1: , Button5, %Address%
GuiControl, 1: , Button6, %BillingAddress%
GuiControl, 1: , Button7, %MailingAddress%
GuiControl, 1: , Button8, %CityStateZip%
GuiControl, 1: , Button9, %Phone%
GuiControl, 1: , Button10, %Fax%
GuiControl, 1: , Button11, %Email%
return



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









