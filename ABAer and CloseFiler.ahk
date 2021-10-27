#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
formattime, Today, ,  MM/dd/yyyy          ;  yyyy-MM-dd	
Menu, Tray, Icon, Shell32.dll, 132


StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}
if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder

IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username

if Username = ERROR
	{
	if Computername = Loyd.Law
		IniWrite, LLAW, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
	else if Computername = jessica.egigian
		IniWrite, J.George, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
	else if Computername = jessica.george
		IniWrite, J.George, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
	}
	
Sleep 500
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, RespAtty, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty

if RespAtty = ERROR
	RespAtty := ""
	
Gui, New, AlwaysOnTop
Gui, Add, GroupBox, cBlue x5 y5 w151 h160, Update Case Status
Gui, Add, DropDownList, R7 x10 h20 y23 w140 +Center vNewStatus gNewStatus, ABA Intent|ABA Intent (Qualcomm)|Abandoned|Pend Tran|Transferred|Expired|Closed
Gui, Font, underline
Gui, Add, Text, +Center x10 y52 w70 , Closed Date:
Gui, Font
Gui, Add, Edit,+Center +ReadOnly x82 y48 w70 vCloseDate, 
Gui, Font, underline
Gui, Add, Text, +Center x10 y74 w70 , TranOut Date:
Gui, Font
Gui, Add, Edit,+Center  +ReadOnly x82 y70 w70 vTranOutDate, 		
Gui, Font, underline
Gui, Add, Text, +Center x10 y94 w140 , New Responsible Counsel:
Gui, Font
Gui, Add, Edit,+Center  +ReadOnly x10 y112 w140 vNewCounsel, 
Gui, Add, Button, +Center x10 y136 w140 gUpdateStatus, Update Case Status

Gui, Add, GroupBox, cBlue x5 y170 w151 h72, Docket Action
Gui, Font, underline
Gui, Add, Text, +Center x9 y191 w72 , TranOut Doc#:
Gui, Font
Gui, Add, Edit,+Center  +ReadOnly x82 y187 w69 vDocNumber, 
Gui, Add, Button, +Center x10 y213 w140 gDocketAction, Docket Action


Gui, Add, GroupBox, cBlue x5 y245 w151 h102, Close Action
Gui, Font, underline
Gui, Add, Text, +Center x11 y291 w72 , Closed Date:
Gui, Font
Gui, Add, Edit,+Center  -ReadOnly x82 y287 w70 vResponseSent, %Today%
Gui, Add, Button,+Center  x10 y313 w140 gCloseAction, Close Action

Gui, Add, GroupBox, cBlue x165 y5 w151 h160, Additional Options
Gui, Add, Button,+Center  x170 y23 w140 gOpenNewEmail, Open New *ABA Email

Gui, Add, GroupBox, cBlue x165 y170 w151 h177, Close Disclosure
Gui, Add, Button, +Center x170 y186 w140 h25  gCloseDisclosureAuto, Automatic
Gui, Add, Button, +Center x170 y313 w140 h25 gCloseDisclosureManual, Manual
Gui, Font, 
Gui, Add, Text, x170 y213 w140 h50 Center, *Uses "Close Action" Date*`n`nAutomatic should work unless similar client codes exist. 
Gui, Add, Text, x170 y270 w140 h38 Center, If Automatic yields multiple results, select correct matter, then click Manual. 
Gui, Add, Button,+Center  x170 y48 w140 gDocketAction2, INT-ABA CLIENT INSTR TO ABA RECVD
Gui, Font, underline
Gui, Add, Text, +Center x11 y266 w72 , Responsible:
Gui, Font
Gui, Add, Edit, Center Limit4 -Wrap Uppercase vRespAtty x82 y262 w70, %RespAtty%

Gui, Font, underline
Gui, Add, Text, +Center x10 y92 w140 , *CloseFile Reason
Gui, Font
Gui, Add, ComboBox, x10 y110 w140 vCloseRemarks, *CloseFile Reason||Client not opposing.|Different firm handling.|KMOB no longer attorney of record.|Not filing application.|Prosecution completed.|Matter concluded.|Settlement reached.|No instructions received from client|Client instructions to close.|Client went out of business.|Duplicate file.|

Gui, Add, Button, +Center x170 y136 w140 gSystemSwitch, System Switch




GuiControl, Hide, Static9	
GuiControl, Hide, Button8
GuiControl, Hide, Button12
GuiControl, Hide, Button13
GuiControl, Hide, Edit7


;Gui, Add, Button, +Center x10 y165 w130 gDuplicateAction, Duplicate Action
Gui, Show, w320 h350       ;w160
GuiControlGet,  ComboBox1Text, , ComboBox1
SetTimer, CloseWindow, 100
return

CloseWindow:
IfWinExist, Message from webpage, Record has successfully been saved.                ;  ahk_class #32770                   ;Message from webpage
	WinClose, Message from webpage, Record has successfully been saved.
IfWinExist, Message from webpage, The specified search criteria did not match any records.               ;  ahk_class #32770                   ;Message from webpage
	WinClose, Message from webpage, The specified search criteria did not match any records.
IfWinActive, Opening Mail Attachment, You should only open attachments from a trustworthy source.                ;  ahk_class #32770                   ;Message from webpage
	ControlSend,  , {Alt down}O{Alt up}, Opening Mail Attachment
IfWinActive, WorkSite, The version of this document                
	ControlSend,  , {Alt down}Y{Alt up}, WorkSite
IfWinActive, Microsoft Excel Security Notice
	ControlSend,  , {Alt down}Y{Alt up}, Microsoft Excel Security Notice
return


SystemSwitch:
SwitchSystem()
return

CloseRemarksButton:
Gui, Submit, NoHide
MsgBox, %CloseRemarks%
return

DocketAction2:
Gui, Submit, NoHide
WinActivate, ahk_class IEFrame
gosub CopyAction
Sleep 100
ModifiedSwitchSystem2()
WinActivate, ahk_class IEFrame
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ActionType := "INT-ABA CLIENT INSTR TO ABA RECVD"

;NewRemarks = %ATDate% Case going abandoned per %RespAtty%. %Username%`n   ;%Remarks% 
;ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
;ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := ClientCode
ie.document.getElementByID("fldstrCountry_TextBox").Value := Country
ie.document.getElementByID("flddteBaseDate").Value := ResponseSent
ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType	
Sleep 100
Gui, Show
return

OpenNewEmail:
Abandonment := "Abandonment.Inbox@knobbe.com"
olMailItem := 0
o:= ComObjActive("Outlook.Application").Session()
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
MailItem.SentOnBehalfOfName := Abandonment
MailItem.Display ;Make email visible

return

DocketAction:
Gui, Submit, NoHide
	if ComboBox1Text = 
		{
		MsgBox, Choose a new Status in the top field if you want to docket an action.
		Gui, Show
		return
		}
	else
		{
		WinActivate, ahk_class IEFrame
		gosub CopyAction
		Sleep 100
		ModifiedSwitchSystem2()
		WinActivate, ahk_class IEFrame
		gosub DocketNewAction
		return
		}
return

CloseDisclosureAuto:
Gui, Submit, NoHide
WinActivate, ahk_class IEFrame
gosub CopyAction
OutputVar = http://oc-docketing/CPi/patschInvention.aspx

ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]

ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ie.Document.All.schstrCaseNumber_TextBox.Value := ClientCode
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
Sleep 1000
ie.document.getElementByID("btnEdit").Click()
ie.document.All.fldstrDisclosureStatus_TextBox.Value := "Closed"
ie.document.All.flddteDisclosureDate1.Value := ResponseSent
Gui, Show
return

CloseDisclosureManual:
Gui, Submit, NoHide
WinActivate, ahk_class IEFrame
gosub CopyAction
OutputVar = http://oc-docketing/CPi/patschInvention.aspx
ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
;ie.Navigate(params*)
;While IE.Busy ; simple wait for page to load
;Sleep, 100 ; 1/10 second
;ie.Document.All.schstrCaseNumber_TextBox.Value := ClientCode
;ie.Document.All.btnStartSearch.Click()
;ie.Visible := True
;WinActivate, ahk_class IEFrame
;While IE.Busy ; simple wait for page to load
;Sleep, 100 ; 1/10 second
;Sleep 1000
ie.document.getElementByID("btnEdit").Click()
ie.document.All.fldstrDisclosureStatus_TextBox.Value := "Closed"
ie.document.All.flddteDisclosureDate1.Value := ResponseSent
Gui, Show
return

DocketNewAction:
/*
OutputVar = http://oc-docketing/CPi/tmkfrmTrademark.aspx?key=430607
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 16384]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
  ie.Visible := True
   params := [OutputVar, 16384]
}
;ie.Navigate(params*)
*/

ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
;ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := ClientCode
ie.document.getElementByID("fldstrCountry_TextBox").Value := Country
ie.document.getElementByID("flddteBaseDate").Value := ResponseSent
	if ComboBox1Text = ABA Intent
		{
		NewRemarks = %RespAtty%`n   ;%Remarks% 
		ActionType := "INT-ABA CC OF ABA INSTR RECVD"
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType	
		}
	if ComboBox1Text = ABA Intent (Qualcomm)
		{
		NewRemarks = %RespAtty%`n   ;%Remarks% 
		ActionType := "INT-PAT ABA LAPSE Q"
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType	
		}
	if ComboBox1Text = Abandoned
		{			
			if RespAtty = 
				{
				}
			else
				{
				NewRemarks = %RespAtty% confirmed abandonment.`n   ;%Remarks% 
				}
		ActionType := "INT-ABA INSTRUCTIONS CONFIRMED"
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
		ie.document.getElementByID("flddteResponseDate").Value := ResponseSent
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		ie.document.getElementByID("flddteBaseDate").Value := ResponseSent
		}
	if ComboBox1Text = Pend Tran
		{
		NewRemarks = %TranOutDate% - Matter is being transferred out to %NewCounsel%. iManage #%DocNumber%. %Username%    ;%Remarks% 
		ActionType := "INT-PAT/TM TRANOUT PENDING"
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks	
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType	
		}
	if ComboBox1Text = Transferred
		{
		NewRemarks = %TranOutDate% - Confirmation of transfer received. %Username%`    ;%Remarks% 	
		ActionType := "INT-PAT/TM TRANOUT PENDING"
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
		ie.document.getElementByID("flddteResponseDate").Value := ResponseSent
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		}
Sleep 100
Gui, Show
return

/*
ModifiedSwitchSystem2()
{
IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username

ie := WBGet()
	if IsObject(ie) = 0
		{
		Run "iexplore.exe"
		Sleep 3000
		ie := WBGet()
		return
		}
	else

var := ie.LocationURL ;grab current url
MsgBox, 
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
Sleep 200
		;OldClipboard := Clipboard                                                                ; This saves clipboard content for later.
        ;Clipboard = ;                                                                            ; This empties the clipboard.
        MyString = ;                                                                             ; Sets MyString to blank.
        AppString = ;
        FrontString = ;
        
        PatentString = http://oc-docketing/CPi/patfrmCountryApplication.aspx?Key=                ; Prefix section of a Live Patent (58 Characters).
        PatentATString = http://oc-docketing/CPiAgent/patfrmCountryApplicationAgent.aspx?Key=    ; Prefix section of a AT Patent (68 Characters).
        TMString = http://oc-docketing/CPi/tmkfrmTrademark.aspx?Key=                             ; Prefix section of a Live Trademark (49 Characters).
        TMATString = http://oc-docketing/CPiAgent/tmkfrmTrademarkAgent.aspx?Key=   
				
        PatentActionString = http://oc-docketing/CPi/patfrmActionDue.aspx?key=                   ; Patent Action (49 + 7)
        PatentATActionString = http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=       ; Patent AT Action (60 + 7)
        TMActionString = http://oc-docketing/CPi/tmkfrmActionDue.aspx?Key=                       ; TM Live Action (49 + 6)
        TMATActionString = http://oc-docketing/CPiAgent/tmkfrmActionDueAgent.aspx?Key=           ; TM AT Action (59 + 6)
		
		NewPATLiveAction = http://oc-docketing/CPi/patfrmActionDue.aspx?key=-1&key2=             ;57 characters + 7 = 64
		NewPATATAction   = http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=-1&key2=   ;67 characters + 7 = 74
		NewTMLiveAction = http://oc-docketing/CPi/tmkfrmActionDue.aspx?key=-1&key2=              ;57 characters + 6 = 63
		NewTMATAction   = http://oc-docketing/CPiAgent/tmkfrmActionDueAgent.aspx?key=-1&key2=    ;67 characters + 6 = 73
					
;SendInput ^l
;Sleep 200
;SendInput ^c
;ClipWait, .2      
;MyString := clipboard                            ; Fetch URL into variable
if Instr(var, PatentString)
     {
     StringLeft, FrontString, MyString, 65       ; Stores first 67+7=74 characters of URL for Live Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     ;FrontString = %NewPATATAction%
     FrontString = %NewPATLiveAction%
     }
else if Instr(var, TMString)
     {
     StringLeft, FrontString, MyString, 55       ; Stores first 67+6=73 characters of URL for Live TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     ;FrontString = %NewTMATAction%
	 FrontString = %NewTMLiveAction%
     }	 
else if Instr(var, PatentATString)
     {
     StringLeft, FrontString, MyString, 75       ; Stores first 78+7=85 characters of URL for AT Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     ;FrontString = %NewPATLiveAction%
	 FrontString = %NewPATATAction%
     }
else if Instr(var, TMATString)
     {
     StringLeft, FrontString, MyString, 65       ; Stores first 77+6=83 characters of URL for AT TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     ;FrontString = %NewTMLiveAction%
	 FrontString = %NewTMATAction%
     }
else if Instr(var, PatentActionString)
     {
     StringLeft, FrontString, MyString, 74       ; Stores first 67+7=74 characters of URL for Live Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     ;FrontString = %NewPATATAction%
     FrontString = %NewPATLiveAction%
     }
else if Instr(var, PatentATActionString)
     {
     StringLeft, FrontString, MyString, 85       ; Stores first 78+7=85 characters of URL for AT Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     ;FrontString = %NewPATLiveAction%
	 FrontString = %NewPATATAction%
     }
else if Instr(var, TMActionString)
     {
     StringLeft, FrontString, MyString, 73       ; Stores first 67+6=73 characters of URL for Live TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     ;FrontString = %NewTMATAction%
	 FrontString = %NewTMLiveAction%
     }
else if Instr(var, TMATActionString)
     {
     StringLeft, FrontString, MyString, 83       ; Stores first 77+6=83 characters of URL for AT TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     ;FrontString = %NewTMLiveAction%
	 FrontString = %NewTMATAction%
     }
else
     {
     SplashTextOn, 430,,Not on a Live or AT action. Unable to docket action.,
     Sleep 1500
     SplashTextOff
     Clipboard = %OldClipboard%
     Return
     }
MyString := FrontString . AppString
;MsgBox, %MyString%
;TrayTip,Docketing Action, Docketing action now.
MyString = %MyString%
OutputVar = %MyString%
;ie := ComObjCreate("InternetExplorer.Application")
params := [OutputVar, 16384]
ie.Navigate(params*)
;Sleep 3000
;TrayTip
Sleep 200
Clipboard = %OldClipboard%
AppString = ;
FrontString = ;
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
Gui, Show
Return
}
*/

ModifiedSwitchSystem2()
{
IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
IniRead, ATPartner, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATPartner
IniRead, ATDate, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATDate

ie := WBGet()
	if IsObject(ie) = 0
		{
		Run "iexplore.exe"
		Sleep 3000
		ie := WBGet()
		return
		}
	else

var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
WinActivate, ahk_class IEFrame
Sleep 200
;		OldClipboard := Clipboard                                                                ; This saves clipboard content for later.
 ;       Clipboard = ;                                                                            ; This empties the clipboard.
        MyString = ;                                                                             ; Sets MyString to blank.
        AppString = ;
        FrontString = ;
        
       ; PatentString = http://oc-docketing/CPi/patfrmCountryApplication.aspx?Key=                ; Prefix section of a Live Patent (58 Characters).
        ;PatentATString = http://oc-docketing/CPiAgent/patfrmCountryApplicationAgent.aspx?Key=    ; Prefix section of a AT Patent (68 Characters).
			
        ;PatentActionString = http://oc-docketing/CPi/patfrmActionDue.aspx?key=                   ; Patent Action (49 + 7)
        ;PatentATActionString = http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=       ; Patent AT Action (60 + 7)
		
		;NewPATLiveAction = http://oc-docketing/CPi/patfrmActionDue.aspx?key=-1&key2=             ;57 characters + 7 = 64
		;NewPATATAction   = http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=-1&key2=   ;67 characters + 7 = 74
		
		
		PatentString = http://oc-docketing/CPi/patfrmCountryApplication.aspx?Key=                ; Prefix section of a Live Patent (58 Characters).
        PatentATString = http://oc-docketing/CPiAgent/patfrmCountryApplicationAgent.aspx?Key=    ; Prefix section of a AT Patent (68 Characters).
        TMString = http://oc-docketing/CPi/tmkfrmTrademark.aspx?Key=                             ; Prefix section of a Live Trademark (49 Characters).
        TMATString = http://oc-docketing/CPiAgent/tmkfrmTrademarkAgent.aspx?Key=   
				
        PatentActionString = http://oc-docketing/CPi/patfrmActionDue.aspx?key=                   ; Patent Action (49 + 7)
        PatentATActionString = http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=       ; Patent AT Action (60 + 7)
        TMActionString = http://oc-docketing/CPi/tmkfrmActionDue.aspx?Key=                       ; TM Live Action (49 + 6)
        TMATActionString = http://oc-docketing/CPiAgent/tmkfrmActionDueAgent.aspx?Key=           ; TM AT Action (59 + 6)
		
		NewPATLiveAction = http://oc-docketing/CPi/patfrmActionDue.aspx?key=-1&key2=             ;57 characters + 7 = 64
		NewPATATAction   = http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=-1&key2=   ;67 characters + 7 = 74
		NewTMLiveAction = http://oc-docketing/CPi/tmkfrmActionDue.aspx?key=-1&key2=              ;57 characters + 6 = 63
		NewTMATAction   = http://oc-docketing/CPiAgent/tmkfrmActionDueAgent.aspx?key=-1&key2=    ;67 characters + 6 = 73
					
;SendInput ^l
Sleep 200
;SendInput ^c
;ClipWait, .2      
;MyString := clipboard                            ; Fetch URL into variable
if Instr(var, PatentString)
     {
     StringLeft, FrontString, var, 65       ; Stores first 67+7=74 characters of URL for Live Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     ;FrontString = %NewPATATAction%
     FrontString = %NewPATLiveAction%
     }
else if Instr(var, TMString)
     {
     StringLeft, FrontString, var, 55       ; Stores first 67+6=73 characters of URL for Live TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     ;FrontString = %NewTMATAction%
	 FrontString = %NewTMLiveAction%
     }	 
else if Instr(var, PatentATString)
     {
     StringLeft, FrontString, var, 75       ; Stores first 78+7=85 characters of URL for AT Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     ;FrontString = %NewPATLiveAction%
	 FrontString = %NewPATATAction%
     }
else if Instr(var, TMATString)
     {
     StringLeft, FrontString, var, 65       ; Stores first 77+6=83 characters of URL for AT TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     ;FrontString = %NewTMLiveAction%
	 FrontString = %NewTMATAction%
     }
else if Instr(var, PatentActionString)
     {
     StringLeft, FrontString, var, 74       ; Stores first 67+7=74 characters of URL for Live Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     ;FrontString = %NewPATATAction%
     FrontString = %NewPATLiveAction%
     }
else if Instr(var, PatentATActionString)
     {
     StringLeft, FrontString, var, 85       ; Stores first 78+7=85 characters of URL for AT Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     ;FrontString = %NewPATLiveAction%
	 FrontString = %NewPATATAction%
     }
else if Instr(var, TMActionString)
     {
     StringLeft, FrontString, var, 73       ; Stores first 67+6=73 characters of URL for Live TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     ;FrontString = %NewTMATAction%
	 FrontString = %NewTMLiveAction%
     }
else if Instr(var, TMATActionString)
     {
     StringLeft, FrontString, var, 83       ; Stores first 77+6=83 characters of URL for AT TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     ;FrontString = %NewTMLiveAction%
	 FrontString = %NewTMATAction%
     }
else
     {
     SplashTextOn, 430,,Not on a Live or AT action. Unable to docket action.,
     Sleep 1500
     SplashTextOff
     Clipboard = %OldClipboard%
     Return
     }
MyString := FrontString . AppString
;MsgBox, %MyString%
;TrayTip,Docketing Action, Docketing action now.
MyString = %MyString%
OutputVar = %MyString%
;ie := ComObjCreate("InternetExplorer.Application")
params := [OutputVar, 16384]
ie.Navigate(params*)
;Sleep 3000
;TrayTip
Sleep 200
Clipboard = %OldClipboard%
AppString = ;
FrontString = ;
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
Gui, Show
Return
}





CopyAction:
;Gui, Hide
WinActivate, ahk_class IEFrame
OutputVar = http://oc-docketing/CPi/tmkfrmTrademark.aspx?key=430607
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
BaseDate := ie.document.getElementByID("flddteBaseDate").Value
Remarks := ie.document.getElementByID("fldstrRemarks").Value
Sleep 200
;SplashTextOn, 400, 400, Information Copied,Client Code: %ClientCode%`n`nCountry: %Country%`n`nAction Type: %ActionType%`n`nBase Date: %BaseDate%`n`nGeneral Remarks: %Remarks%
;Sleep 2000
;SplashTextOff
;Gui, Show
return


NewStatus:
GuiControlGet,  ComboBox1Text, , ComboBox1
	if ComboBox1Text = ABA Intent
		{
		GuiControl, , Edit1, 	         ;Closed Date
		GuiControl, +ReadOnly, Edit1
		GuiControl, , Edit2,             ;TranOut Date
		GuiControl, +ReadOnly, Edit2
		GuiControl, , Edit3,             ;TranOut LC
		GuiControl, +ReadOnly, Edit3
		GuiControl, , Edit4,             ;TranOut LC
		GuiControl, +ReadOnly, Edit4
		GuiControl, Hide, Edit1
		GuiControl, Hide, Static1
		GuiControl, Hide, Edit2
		GuiControl, Hide, Static2
		GuiControl, Hide, Edit3
		GuiControl, Hide, Static3
		GuiControl, Hide, Edit4
		GuiControl, Hide, Static4
		GuiControl, Show, Button4
		GuiControl, Show, Button6
		GuiControl, Show, Button8
		GuiControl, Show, Button12

		GuiControl, Hide, Static9	
		GuiControl, Hide, Button13
		GuiControl, Hide, Edit7
		
		;GuiControl, , Edit5,  %Today%    ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
	if ComboBox1Text = ABA Intent (Qualcomm)
		{
		GuiControl, , Edit1, 	         ;Closed Date
		GuiControl, +ReadOnly, Edit1
		GuiControl, , Edit2,             ;TranOut Date
		GuiControl, +ReadOnly, Edit2
		GuiControl, , Edit3,             ;TranOut LC
		GuiControl, +ReadOnly, Edit3
		GuiControl, , Edit4,             ;TranOut LC
		GuiControl, +ReadOnly, Edit4
		GuiControl, Hide, Edit1
		GuiControl, Hide, Static1
		GuiControl, Hide, Edit2
		GuiControl, Hide, Static2
		GuiControl, Hide, Edit3
		GuiControl, Hide, Static3
		GuiControl, Hide, Edit4
		GuiControl, Hide, Static4
		GuiControl, Show, Button4
		GuiControl, Show, Button6
		GuiControl, Show, Button8
		GuiControl, Show, Button12
	
		GuiControl, Hide, Static9		
		GuiControl, Hide, Button13
		GuiControl, Hide, Edit7
		
		;GuiControl, , Edit5,  %Today%    ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
	if ComboBox1Text = Abandoned
		{
		GuiControl, , Edit1,  %Today%    ;Closed Date
		GuiControl, -ReadOnly, Edit1
		GuiControl, , Edit2,             ;TranOut Date
		GuiControl, +ReadOnly, Edit2
		GuiControl, , Edit3,             ;TranOut LC
		GuiControl, +ReadOnly, Edit3
		GuiControl, , Edit4,             ;TranOut LC
		GuiControl, +ReadOnly, Edit4
		GuiControl, Show, Edit1
		GuiControl, Show, Static1
		GuiControl, Hide, Edit2
		GuiControl, Hide, Static2
		GuiControl, Hide, Edit3
		GuiControl, Hide, Static3
		GuiControl, Hide, Edit4
		GuiControl, Hide, Static4
		GuiControl, Show, Button4
		GuiControl, Show, Button6
		GuiControl, Show, Button8
		GuiControl, Hide, Button12

		GuiControl, Hide, Static9			
		GuiControl, Hide, Button13
		GuiControl, Hide, Edit7
		
		;GuiControl, , Edit5,  %Today%            ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
	if ComboBox1Text = Pend Tran
		{
		GuiControl, , Edit1,     	  	 ;Closed Date
		GuiControl, +ReadOnly, Edit1
		GuiControl, , Edit2,  %Today% 	 ;TranOut Date
		GuiControl, -ReadOnly, Edit2
		GuiControl, , Edit3,             ;TranOut LC
		GuiControl, -ReadOnly, Edit3
		GuiControl, , Edit4,             ;TranOut LC
		GuiControl, -ReadOnly, Edit4
		GuiControl, Hide, Edit1
		GuiControl, Hide, Static1
		GuiControl, Show, Edit2
		GuiControl, Show, Static2
		GuiControl, Show, Edit3
		GuiControl, Show, Static3
		GuiControl, Show, Edit4
		GuiControl, Show, Static4
		GuiControl, Show, Button4
		GuiControl, Show, Button6
		GuiControl, Hide, Button8
		GuiControl, Hide, Button12

		GuiControl, Hide, Static9			
		GuiControl, Hide, Button13
		GuiControl, Hide, Edit7
		
		;GuiControl, , Edit5,  %Today%            ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
	if ComboBox1Text = Transferred
		{
		GuiControl, , Edit1,  %Today%    ;Closed Date
		GuiControl, -ReadOnly, Edit1
		GuiControl, , Edit2,      		 ;TranOut Date
		GuiControl, +ReadOnly, Edit2
		GuiControl, , Edit3,             ;TranOut LC
		GuiControl, +ReadOnly, Edit3
		GuiControl, , Edit4,             ;TranOut LC
		GuiControl, +ReadOnly, Edit4
		GuiControl, Show, Edit1
		GuiControl, Show, Static1
		GuiControl, Hide, Edit2
		GuiControl, Hide, Static2
		GuiControl, Hide, Edit3
		GuiControl, Hide, Static3
		GuiControl, Hide, Edit4
		GuiControl, Hide, Static4
		GuiControl, Show, Button4
		GuiControl, Show, Button6
		GuiControl, Hide, Button8
		GuiControl, Hide, Button12

		GuiControl, Hide, Static9			
		GuiControl, Hide, Button13
		GuiControl, Hide, Edit7
		
		;GuiControl, , Edit5,  %Today%           ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
	if ComboBox1Text = Expired
		{
		GuiControl, , Edit1,  %Today%    ;Closed Date
		GuiControl, -ReadOnly, Edit1
		GuiControl, , Edit2,      		 ;TranOut Date
		GuiControl, +ReadOnly, Edit2
		GuiControl, , Edit3,             ;TranOut LC
		GuiControl, +ReadOnly, Edit3
		GuiControl, , Edit4,             ;TranOut LC
		GuiControl, +ReadOnly, Edit4
		GuiControl, Show, Edit1
		GuiControl, Show, Static1
		GuiControl, Hide, Edit2
		GuiControl, Hide, Static2
		GuiControl, Hide, Edit3
		GuiControl, Hide, Static3
		GuiControl, Hide, Edit4
		GuiControl, Hide, Static4
		GuiControl, Hide, Button4
		GuiControl, Hide, Button6
		GuiControl, Hide, Button8
		GuiControl, Hide, Button12

		GuiControl, Hide, Static9	
		GuiControl, Hide, Button13
		GuiControl, Hide, Edit7

		;GuiControl, , Edit5,  %Today%           ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
	if ComboBox1Text = Closed
		{
		GuiControl, , Edit1,  %Today%    ;Closed Date
		GuiControl, -ReadOnly, Edit1
		GuiControl, , Edit2,      		 ;TranOut Date
		GuiControl, +ReadOnly, Edit2
		GuiControl, , Edit3,             ;TranOut LC
		GuiControl, +ReadOnly, Edit3
		GuiControl, , Edit4,             ;TranOut LC
		GuiControl, +ReadOnly, Edit4
		GuiControl, Show, Edit1
		GuiControl, Show, Static1
		GuiControl, Hide, Edit2
		GuiControl, Hide, Static2
		GuiControl, Hide, Edit3
		GuiControl, Hide, Static3
		GuiControl, Hide, Edit4
		GuiControl, Hide, Static4
		GuiControl, Hide, Button4
		GuiControl, Show, Button6
		GuiControl, Hide, Button8
		GuiControl, Hide, Button12
		
		GuiControl, Show, Static9		
		GuiControl, Show, Button13
		GuiControl, Show, Edit7
		;GuiControl, , Edit5,  %Today%           ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
return

CloseAction:
Gui, Submit, NoHide
;Gui, Hide
GuiControlGet,  ComboBox1Text, , ComboBox1
OutputVar = http://oc-docketing/CPi/tmkfrmTrademark.aspx?key=430607
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
ResponseSent := ResponseSent
NewStatus := NewStatus
CloseDate := CloseDate
TranOutDate := TranOutDate
Username := Username
NewCounsel := NewCounsel
DocNumber := DocNumber
ie.document.getElementByID("btnEdit").Click()
Sleep 250
;ie.document.getElementByID("btnSave").Click()
ie.document.getElementByID("flddteResponseDate").Value := ResponseSent
Remarks := ie.document.getElementByID("fldstrRemarks").Value
	if ComboBox1Text = 
		{
		TrayTip, No Case Status Selected, Choose a new Status in the top field if you want to auto-add remarks.
		Gui, Show
		Sleep 2000
		TrayTIp
		return
		}
	if ComboBox1Text = ABA Intent
		{
			if RespAtty = 
				{
				}
			else
				{
				;NewRemarks = %ATDate% %RespAtty% %Username%`n%Remarks% 
				NewRemarks = %ResponseSent% - Case going abandoned per %RespAtty%. %Username%`n%Remarks% 
				ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
				}
		}
	if ComboBox1Text = ABA Intent (Qualcomm)
		{
			if RespAtty = 
				{
				}
			else
				{
				;NewRemarks = %ATDate% %RespAtty% %Username%`n%Remarks% 
				NewRemarks = %ResponseSent% - Case going abandoned per %RespAtty%. %Username%`n%Remarks%  
				ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
				}
		}		
	if ComboBox1Text = Abandoned
		{
			if RespAtty = 
				{
				}
			else
				{
				;NewRemarks = %ATDate% %RespAtty% %Username%`n%Remarks% 
				NewRemarks = %ResponseSent% - Case going abandoned per %RespAtty%. %Username%`n%Remarks% 
				ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
				}
		}
	if ComboBox1Text = Pend Tran
		{
		NewRemarks = %ResponseSent% - Matter is being transferred out to %NewCounsel%. iManage #%DocNumber%. %Username%`n%Remarks%
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks		
		}
	if ComboBox1Text = Transferred
		{
		NewRemarks = %ResponseSent% - Confirmation of transfer received. %Username%`n%Remarks% 	
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
		}
	if ComboBox1Text = Closed
		{
		NewRemarks = %ResponseSent% - Matter closing. %CloseRemarks%/%RespAtty%. %Username%`n%Remarks% 
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
		}	
		
		
;FilingDate := ie.document.getElementByID("fldstrRemarks").Value
;PubDate := ie.document.getElementByID("flddtePubDate").Value
;RegDate := ie.document.getElementByID("flddteRegDate").Value
;LastRenewal := ie.document.getElementByID("flddteLastRenewalDate").Value
;NextRenewal := ie.document.getElementByID("flddteNextRenewalDate").Value
;AllowanceDate := ie.document.getElementByID("flddteAllowanceDate").Value
;ClosedDate := ie.document.getElementByID("flddteClosedDate").Value
;2ndPubDate := ie.document.getElementByID("flddtePubDate_2").Value
;IssueDate  := ie.document.getElementByID("flddteIssDate").Value
;ParentPCTDate := ie.document.getElementByID("flddteParentPCTDate").Value
;ParentIssueDate := ie.document.getElementByID("flddteParentIssDate").Value
;ExpirationDate := ie.document.getElementByID("flddteExpDate").Value
IniWrite, %RespAtty%, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
Gui, Show
return

UpdateStatus:
Gui, Submit, NoHide
;Gui, Hide
GuiControlGet,  ComboBox1Text, , ComboBox1
OutputVar = http://oc-docketing/CPi/tmkfrmTrademark.aspx?key=430607
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
IniRead, ATPartner, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATPartner
IniRead, ATDate, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATDate
NewStatus := NewStatus
CloseDate := CloseDate
TranOutDate := TranOutDate
Username := Username
NewCounsel := NewCounsel
LCNumber := LCNumber
ie.document.getElementByID("btnEdit").Click()
Remarks := ie.document.getElementByID("fldstrRemarks").Value
Sleep 250
	if ComboBox1Text = 
		{
		MsgBox, No status selected. Please select a new status and try again.
		}
	if ComboBox1Text = ABA Intent
		{
		ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := NewStatus
		;NewRemarks = %ATDate% Matter is going abandoned. %Username%`n%Remarks% 	
		;ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
		}
	if ComboBox1Text = ABA Intent (Qualcomm)
		{
		ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := NewStatus
		;NewRemarks = %ATDate% Matter is going abandoned. %Username%`n%Remarks% 	
		;ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
		}
	if ComboBox1Text = Abandoned
		{
		ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := NewStatus
		;NewRemarks = %ATDate% FA has confirmed abandonment instructions. %Username%`n%Remarks% 
		ie.document.getElementByID("flddteClosedDate").Value := CloseDate
		}
	if ComboBox1Text = Pend Tran
		{
		ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := NewStatus   ; For Patent.
		ie.document.getElementByID("fldstrTrademarkStatus_TextBox").Value := NewStatus     ; For TM.
		ie.document.getElementByID("flddteTranOutDate").Value := TranOutDate	
		; Add one to add remarks to General Remarks too
		NewRemarks = %ATDate% Matter is being transferred out to %NewCounsel%. iManage #%DocNumber%. %Username%`n%Remarks%	
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
		}	
	if ComboBox1Text = Transferred
		{
		ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := NewStatus   ; For Patent.
		ie.document.getElementByID("fldstrTrademarkStatus_TextBox").Value := NewStatus     ; For TM.
		ie.document.getElementByID("flddteClosedDate").Value := CloseDate	
		}
	if ComboBox1Text = Expired
		{
		ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := NewStatus   ; For Patent.
		ie.document.getElementByID("fldstrTrademarkStatus_TextBox").Value := NewStatus     ; For TM.
		ie.document.getElementByID("flddteClosedDate").Value := CloseDate	
		}
	if ComboBox1Text = Closed
		{
		ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := NewStatus   ; For Patent.
		ie.document.getElementByID("fldstrTrademarkStatus_TextBox").Value := NewStatus     ; For TM.
		ie.document.getElementByID("flddteClosedDate").Value := CloseDate	
		NewRemarks = %ResponseSent% - Matter closing. %CloseRemarks%/%RespAtty%. %Username%`n%Remarks% 
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
		}
Sleep 250
;ie.document.getElementByID("btnSave").Click()
;PriorityDate := ie.document.getElementByID("flddtePriDate").Value
;FilingDate := ie.document.getElementByID("flddteFilDate").Value
;PubDate := ie.document.getElementByID("flddtePubDate").Value
;RegDate := ie.document.getElementByID("flddteRegDate").Value
;LastRenewal := ie.document.getElementByID("flddteLastRenewalDate").Value
;NextRenewal := ie.document.getElementByID("flddteNextRenewalDate").Value
;AllowanceDate := ie.document.getElementByID("flddteAllowanceDate").Value
;ClosedDate := ie.document.getElementByID("flddteClosedDate").Value
;2ndPubDate := ie.document.getElementByID("flddtePubDate_2").Value
;IssueDate  := ie.document.getElementByID("flddteIssDate").Value
;ParentPCTDate := ie.document.getElementByID("flddteParentPCTDate").Value
;ParentIssueDate := ie.document.getElementByID("flddteParentIssDate").Value
;ExpirationDate := ie.document.getElementByID("flddteExpDate").Value
Gui, Show
return

PasteAction:
;MetastormGrab: ; TO BE IMPLEMENTED
OutputVar = http://oc-docketing/CPi/tmkfrmTrademark.aspx?key=430607
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := ClientCode
ie.document.getElementByID("fldstrCountry_TextBox").Value := Country
ie.document.getElementByID("flddteBaseDate").Value := BaseDate
	if ComboBox1Text = 
		MsgBox, Choose a new Status in the top field for auto-remarks when closing an action.
	if ComboBox1Text = ABA Intent
		{
		;NewRemarks = %ATDate% Matter is going abandoned. %Username%`n%Remarks% 
		ActionType := "INT-ABA CC OF ABA INSTR RECVD"
		;ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType		
		}
	if ComboBox1Text = Abandoned
		{
		;NewRemarks = %ATDate% FA has confirmed abandonment instructions. %Username%`n%Remarks% 
		ActionType := "INT-ABA INSTRUCTIONS CONFIRMED"
		;ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
		ie.document.getElementByID("flddteResponseDate").Value := ResponseSent
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		ie.document.getElementByID("flddteBaseDate").Value := ResponseSent
		}
	if ComboBox1Text = Pend Tran
		{
		NewRemarks = %ATDate% Matter is being transferred out to %NewCounsel%. iManage #%DocNumber%. %Username%`n%Remarks%
		ActionType := "INT-PAT TRANOUT PENDING"
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks	
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType		
		}
	if ComboBox1Text = Transferred
		{
		NewRemarks = %ATDate% Confirmation of transfer received. %Username%`n%Remarks% 	
		ActionType := "INT-PAT TRANOUT PENDING"
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
		;ie.document.getElementByID("flddteResponseDate").Value := ResponseSent
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		}
Sleep 250
Gui, Show
return

;GuiClose:
;ExitApp
;return

#v::
ie := ""
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
Country :=  ie.document.getElementByID("fldstrCountry_TextBox").Value
AppNumber :=  ie.document.getElementByID("fldstrAppNumber").Value
	StringReplace, AppNumber, AppNumber, EP, , 
PubNumber := ie.document.getElementByID("fldstrPubNumber").Value
EPAppNumber := "EP" . AppNumber
StringLeft, FirstEight, AppNumber, 8
EPFirstEight := "EP" . FirstEight
EPPubNumber := "EP" . PubNumber
Sleep 500
if Country = AT
	{
	OutputVar := "http://seeip.patentamt.at/EPatentSuche/EPRegister/" PubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = CZ
	{
	OutputVar := "http://isdv.upv.cz/portal/pls/portal/portlets.pta.det?pskup=5&pciod=" PubNumber "&plang=en"
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = LT
	{
	OutputVar := "http://www.vpb.lt/db_eu_patentai/rezult-singl.php?db=vpb_europat&extidpatent=" PubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = RO
	{
	OutputVar := "http://rnb.osim.ro/?pn=" PubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = SI
	{
	OutputVar := "http://www2.uil-sipo.si/ds1.htm?A=107100&Q=PN%3D" PubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = SK
	{
	OutputVar := "http://www.upv.sk/patentView/?id=" PubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = BE
	{
	OutputVar := "http://bpp.economie.fgov.be/fo-eregister-view/application?lng=fr&number=" EPPubNumber "&table=EInvention"
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = CH
	{
	OutputVar := "https://www.swissreg.ch/srclient/en/pat/" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = FR
	{
	OutputVar := "http://bases-brevets.inpi.fr/en/document-en/" EPPubNumber ".html"	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = GB
	{
	OutputVar := "http://www.ipo.gov.uk/p-ipsum/Case/PublicationNumber/" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = GR
	{
	OutputVar := "http://www.obi.gr/dl/emtservice/regviewer_pn?pn=" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = IS
	{
	OutputVar := "http://els.is/einkaleyfi/leit-i-gagnabonkum?application-number=" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = IT
	{
	OutputVar := "http://www.uibm.gov.it/uibm/dati/Tmview.aspx?load=espacenet&PubblicationNumber=" EPPubNumber "&table=EInvention"	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = LU
	{
	OutputVar := "http://patent.public.lu/fo-eregister-view/application?lng=en&number=" EPPubNumber	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = NL
	{
	OutputVar := "http://mijnoctrooi.rvo.nl/fo-eregister-view/application?lng=en&number=" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = PT
	{
	OutputVar := "http://servicosonline.inpi.pt/pesquisas/main/patentesdirecto.jsp?lang=en&fpubnumber=" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = TR
	{
	OutputVar := "http://online.turkpatent.gov.tr/EPATENT/epo_search.jsp?param=" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = SE
	{
	OutputVar := "http://was.prv.se/spd/ep/an/" FirstEight	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = BG
	{
	OutputVar := "https://portal.bpo.bg/en/rd?epo_key=" EPFirstEight
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = PL
	{
	OutputVar := "http://regserv.uprp.pl/register/application?number=" EPFirstEight "&lng=en"	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = ES
	{
	EFirstEight := "E" . FirstEight
	OutputVar := "http://sitadex.oepm.es/SitadexWS/index.jsp?numExp=" EFirstEight ; E04753697
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = HU
	{
	EFirstEight := "E" . FirstEight
	OutputVar := "http://epub.hpo.hu/e-kutatas/index.html?lang=en&service=ADATLAP&appId=" EFirstEight	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = DK
	{
	OutputVar := "http://onlineweb.dkpto.dk/pvsonline/Patent?action=102&language=gb&sagID=" AppNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = IE
	{
	OutputVar := "https://eregister.patentsoffice.ie/register/PTRegister.aspx?idappli=" AppNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = EE
	{
	OutputVar := "http://www1.epa.ee/ep/data.asp?NroParam=" EPAppNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = FI
	{
	OutputVar := "http://patent.prh.fi/FiEp/tiedot.asp?NroParam=" EPAppNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = DE
	{
	EAppNumber := "E" . AppNumber
	StringReplace, ENoPeriod, EAppNumber, ., , 
	OutputVar := "http://register.dpma.de/DPMAregister/pat/register?lang=en&AKZ=" ENoPeriod ; E047536974 
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
	
if Country = CY
	gosub NoWebsite
if Country = LI
	gosub NoWebsite
if Country = LV
	gosub NoWebsite
if Country = AL
	gosub NoWebsite	
if Country = BA
	gosub NoWebsite	
if Country = HR
	gosub NoWebsite
if Country = ME
	gosub NoWebsite
if Country = MK
	gosub NoWebsite
if Country = MT
	gosub NoWebsite
if Country = RS
	gosub NoWebsite
if Country = SM
	gosub NoWebsite
	
if Country = EP
	{
	Gui, New, , Where on the EPO website do you want to go?
	Gui, Add, Button, gOption1, About This File
	Gui, Add, Button, gOption1, Federated Register	
	Gui, Add, Button, gOption1, All Documents	
	Gui, Show, NoActivate
	Gui, Flash
	return
	}
else
	MsgBox, , Not on an EP or Validation record., You aren't on an EP or Validation record.`n`nCheck your Client Code and try again.
return

NoWebsite:
MsgBox, , No website information., No website information available.`n`nKnow the right website? Let Tyler know.
return

Option1:
Gui, Submit, NoHide
if A_GuiControl = About This File
	{
	OutputVar := "https://register.epo.org/application?number=" EPFirstEight "&lng=en&tab=main"
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if A_GuiControl = Federated Register
	{
	OutputVar := "https://register.epo.org/application?number=" EPFirstEight "&lng=en&tab=federated"
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if A_GuiControl = All Documents
	{
	OutputVar := "https://register.epo.org/application?number=" EPFirstEight "&lng=en&tab=doclist"
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
return

SwitchSystem()
{
WinActivate, ahk_class IEFrame
		OldClipboard := Clipboard                                                                ; This saves clipboard content for later.
        Clipboard = ;                                                                            ; This empties the clipboard.
        MyString = ;                                                                             ; Sets MyString to blank.
        AppString = ;
        FrontString = ;
        
        PatentString = http://oc-docketing/CPi/patfrmCountryApplication.aspx?Key=                ; Prefix section of a Live Patent (58 Characters).
        PatentATString = http://oc-docketing/CPiAgent/patfrmCountryApplicationAgent.aspx?Key=    ; Prefix section of a AT Patent (68 Characters).
        PatentActionString = http://oc-docketing/CPi/patfrmActionDue.aspx?key=                   ; Patent Action (49 + 7)
        PatentATActionString = http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=       ; Patent AT Action (60 + 7)

        TMString = http://oc-docketing/CPi/tmkfrmTrademark.aspx?Key=                             ; Prefix section of a Live Trademark (49 Characters).
        TMATString = http://oc-docketing/CPiAgent/tmkfrmTrademarkAgent.aspx?Key=                 ; Prefix section of a AT Trademark (59 + 6 Characters).
        TMActionString = http://oc-docketing/CPi/tmkfrmActionDue.aspx?Key=                       ; TM Live Action (49 + 6)
        TMATActionString = http://oc-docketing/CPiAgent/tmkfrmActionDueAgent.aspx?Key=           ; TM AT Action (59 + 6)
		
		PatentInvention  = http://oc-docketing/CPi/patfrmInvention.aspx?Key=
		PatentATInvetion = http://oc-docketing/CPiAgent/patfrmInventionAgent.aspx?key=
		
ie := WBGet()
MyString := ie.LocationURL ;grab current url
ClientCode := ie.document.getElementByID("fldstrCaseNumber").Value

;MsgBox, % IsObject(ie)
	if IsObject(ie) = 0
		{
		Run "iexplore.exe"
		Sleep 5000
		ie := WBGet()
		return
		}
	else

if InStr(MyString, PatentString)
     {
     StringLeft, FrontString, MyString, 65       ; Stores first 58+7=65 characters of URL for Live Patent with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     FrontString = %PatentATString%
     }
else if InStr(MyString, TMString)
     {
     StringLeft, FrontString, MyString, 55       ; Stores first 49+6=55 characters of URL for Live Trademark with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     FrontString = %TMATString%
     }
else if InStr(MyString, PatentATString)
     {
     StringLeft, FrontString, MyString, 75       ; Stores first 68+7=75 characters of URL for AT Patent with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     FrontString = %PatentString%
     }
else if InStr(MyString, TMATString)
     {
     StringLeft, FrontString, MyString, 65       ; Stores first 54+6=60 characters of URL for AT Trademark with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     FrontString = %TMString%
     }
else if Instr(MyString, PatentActionString)
     {
     StringLeft, FrontString, MyString, 74       ; Stores first 67+7=74 characters of URL for Live Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     FrontString = %PatentATString%
     }
else if Instr(MyString, PatentATActionString)
     {
     StringLeft, FrontString, MyString, 85       ; Stores first 78+7=85 characters of URL for AT Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     FrontString = %PatentString%
     }
else if Instr(MyString, TMActionString)
     {
     StringLeft, FrontString, MyString, 73       ; Stores first 67+6=73 characters of URL for Live TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     FrontString = %TMATString%
     }
else if Instr(MyString, TMATActionString)
     {
     StringLeft, FrontString, MyString, 83       ; Stores first 77+6=83 characters of URL for AT TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     FrontString = %TMString%
     }
else if Instr(MyString, PatentInvention)
     {
	OutputVar = http://oc-docketing/CPiAgent/patschCountryApplicationAgent.aspx
	ie := WBGet()
	var := ie.LocationURL ;grab current url
	while ie.busy or ie.ReadyState != 4 ;Wait for page to load
		Sleep, 100
	params := [OutputVar, 32]
	ie.Navigate(params*)
	While IE.Busy ; simple wait for page to load
	Sleep, 100 ; 1/10 second
	;IELoad(wb)
	ie.Document.All.schstrCaseNumber_TextBox.Value := ClientCode
	ie.Document.All.btnStartSearch.Click()
	ie.Visible := True
	WinActivate, ahk_class IEFrame
     }	 
else if Instr(MyString, PatentATInvention)
     {
	OutputVar = http://oc-docketing/CPi/patschCountryApplication.aspx
	ie := WBGet()
	var := ie.LocationURL ;grab current url
	while ie.busy or ie.ReadyState != 4 ;Wait for page to load
		Sleep, 100
	params := [OutputVar, 32]
	ie.Navigate(params*)
	While IE.Busy ; simple wait for page to load
	Sleep, 100 ; 1/10 second
	;IELoad(wb)
	ie.Document.All.schstrCaseNumber_TextBox.Value := ClientCode
	ie.Document.All.btnStartSearch.Click()
	ie.Visible := True
	WinActivate, ahk_class IEFrame
     }	 
else
     {
     TrayTip, System Switch, Not on a Live or AT docketing page. Unable to open page.,
     Sleep 1500
     TrayTip
     Clipboard = %OldClipboard%
     Return
     }
MyString := FrontString . AppString
TrayTip, System Switch, Opening in opposite system.
;SplashTextOn, 300,,Opening in opposite system now.,
	if CherToggle = 1
		{
		Run iexplore.exe  %MyString% 
		;Sleep 1000
		;ie := WBGet()
		;Run %MyString%
		}
	else
		{
		Run %MyString%
		}
Sleep 1500
TrayTip
Clipboard = %OldClipboard%
AppString = ;
FrontString = ;
;gosub RecordSysSwitch
SendInput {Ctrl up}
Return
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
