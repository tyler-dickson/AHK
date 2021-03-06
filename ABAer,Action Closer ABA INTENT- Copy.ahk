#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
formattime, Today, ,  MM/dd/yyyy          ;  yyyy-MM-dd	
Menu, Tray, Icon, Shell32.dll, 132


global ComputerName
Computername = %A_Username%

if Computername = lara.anabtawi
	Computername = lara.hamdan
if Computername = neysa.perkins
	Computername = neysa.cabudol
if Computername = jessica.george
	Computername = jessica.egigian
if Computername = sabrina.fleming
	Computername = sabrina.kellogg

IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATDate
IniRead, RespAtty, C:\Users\%Computername%\AHKPrefs.ini, Username, RespAtty
	if RespAtty = ERROR
		RespAtty := ""
Gui, New, AlwaysOnTop

Gui, Add, GroupBox, cBlue x5 y5 w151 h160, Update Case Status
Gui, Add, DropDownList, R6 x10 h20 y23 w140 +Center vNewStatus gNewStatus, ABA Intent|| ; ABA Intent|ABA Intent (Qualcomm)|Abandoned|Pend Tran|Transferred|Expired
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
Gui, Font, s8
Gui, Add, Edit,+Center  +ReadOnly x10 y112 w140 vNewCounsel, 
Gui, Font
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
Gui, Add, Button,+Center  x170 y23 w140 gOpenNewEmail, Open New Email

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


GuiControl, Hide, Button12

;Gui, Add, Button, +Center x10 y165 w130 gDuplicateAction, Duplicate Action
Gui, Show, w320 h350       ;w160
GuiControlGet,  ComboBox1Text, , ComboBox1
return


DocketAction2:
Gui, Submit
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
Gui, Submit
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
Gui, Submit
WinActivate, ahk_class IEFrame
gosub CopyAction
OutputVar = http://oc-docketing/CPi/patschInvention.aspx
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
Gui, Submit
WinActivate, ahk_class IEFrame
gosub CopyAction
OutputVar = http://oc-docketing/CPi/patschInvention.aspx
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
;While IE.Busy ; simple wait for page to load
;Sleep, 100 ; 1/10 second
;ie.Document.All.schstrCaseNumber_TextBox.Value := ClientCode
;ie.Document.All.btnStartSearch.Click()
;ie.Visible := True
;WinActivate, ahk_class IEFrame
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
Sleep 1000
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
		NewRemarks = %RespAtty%`n   ;%Remarks% 
		ActionType := "INT-ABA INSTRUCTIONS CONFIRMED"
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
		ie.document.getElementByID("flddteResponseDate").Value := ResponseSent
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		ie.document.getElementByID("flddteBaseDate").Value := ResponseSent
		}
	if ComboBox1Text = Pend Tran
		{
		NewRemarks = %ATDate% Matter is being transferred out to %NewCounsel%. iManage #%DocNumber%. %Username%    ;%Remarks% 
		ActionType := "INT-PAT/TM TRANOUT PENDING"
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks	
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType	
		}
	if ComboBox1Text = Transferred
		{
		NewRemarks = %ATDate% Confirmation of transfer received. %Username%`    ;%Remarks% 	
		ActionType := "INT-PAT/TM TRANOUT PENDING"
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
		ie.document.getElementByID("flddteResponseDate").Value := ResponseSent
		ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
		}
Sleep 100
Gui, Show
return

ModifiedSwitchSystem2()
{
IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
IniRead, ATPartner, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATPartner
IniRead, ATDate, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATDate

ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
WinActivate, ahk_class IEFrame
Sleep 200
		OldClipboard := Clipboard                                                                ; This saves clipboard content for later.
        Clipboard = ;                                                                            ; This empties the clipboard.
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
					
SendInput ^l
Sleep 200
SendInput ^c
ClipWait, .2      
MyString := clipboard                            ; Fetch URL into variable
if Instr(MyString, PatentString)
     {
     StringLeft, FrontString, MyString, 65       ; Stores first 67+7=74 characters of URL for Live Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     ;FrontString = %NewPATATAction%
     FrontString = %NewPATLiveAction%
     }
else if Instr(MyString, TMString)
     {
     StringLeft, FrontString, MyString, 55       ; Stores first 67+6=73 characters of URL for Live TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     ;FrontString = %NewTMATAction%
	 FrontString = %NewTMLiveAction%
     }	 
else if Instr(MyString, PatentATString)
     {
     StringLeft, FrontString, MyString, 75       ; Stores first 78+7=85 characters of URL for AT Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     ;FrontString = %NewPATLiveAction%
	 FrontString = %NewPATATAction%
     }
else if Instr(MyString, TMATString)
     {
     StringLeft, FrontString, MyString, 65       ; Stores first 77+6=83 characters of URL for AT TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     ;FrontString = %NewTMLiveAction%
	 FrontString = %NewTMATAction%
     }
else if Instr(MyString, PatentActionString)
     {
     StringLeft, FrontString, MyString, 74       ; Stores first 67+7=74 characters of URL for Live Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     ;FrontString = %NewPATATAction%
     FrontString = %NewPATLiveAction%
     }
else if Instr(MyString, PatentATActionString)
     {
     StringLeft, FrontString, MyString, 85       ; Stores first 78+7=85 characters of URL for AT Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     ;FrontString = %NewPATLiveAction%
	 FrontString = %NewPATATAction%
     }
else if Instr(MyString, TMActionString)
     {
     StringLeft, FrontString, MyString, 73       ; Stores first 67+6=73 characters of URL for Live TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     ;FrontString = %NewTMATAction%
	 FrontString = %NewTMLiveAction%
     }
else if Instr(MyString, TMATActionString)
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
;TrayTip,Docketing Action, Docketing "Abandoned" or "Transferred" action now.
MyString = %MyString%
OutputVar = %MyString%
;ie := ComObjCreate("InternetExplorer.Application")
params := [OutputVar, 16384]
ie.Navigate(params*)
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
Gui, Hide
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
		GuiControl, Show, Button12
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
		GuiControl, Show, Button12
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
		GuiControl, Hide, Button12
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
		GuiControl, Hide, Button12
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
		GuiControl, Hide, Button12
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
		GuiControl, Hide, Button12
		;GuiControl, , Edit5,  %Today%           ;TranOut LC
		;GuiControl, -ReadOnly, Edit5
		}
return

CloseAction:
Gui, Submit
;Gui, Hide
GuiControlGet,  ComboBox1Text, , ComboBox1
OutputVar = http://oc-docketing/CPi/tmkfrmTrademark.aspx?key=430607
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
IniRead, ATPartner, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATPartner
IniRead, ATDate, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATDate
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
				NewRemarks = %ATDate% Case going abandoned per %RespAtty%. %Username%`n%Remarks% 
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
				NewRemarks = %ATDate% Case going abandoned per %RespAtty%. %Username%`n%Remarks%  
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
				NewRemarks = %ATDate% Case going abandoned per %RespAtty%. %Username%`n%Remarks% 
				ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
				}
		}
	if ComboBox1Text = Pend Tran
		{
		NewRemarks = %ATDate% Matter is being transferred out to %NewCounsel%. iManage #%DocNumber%. %Username%`n%Remarks%
		ie.document.getElementByID("fldstrRemarks").Value := NewRemarks		
		}
	if ComboBox1Text = Transferred
		{
		NewRemarks = %ATDate% Confirmation of transfer received. %Username%`n%Remarks% 	
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
Gui, Submit
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
