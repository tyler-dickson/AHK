#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
formattime, Today, , yyyy-MM-dd	


IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATDate
Gui, New, Owner AlwaysOnTop
Gui, Add, GroupBox, cBlue x5 y5 w151 h112, New Status and Close Dates

Gui, Add, DropDownList, R4 x10 h20 y23 w140 +Center vNewStatus gNewStatus, ABA Intent||Abandoned|Pend Tran (Automatic)|Transferred

Gui, Font, underline
Gui, Add, Text, +Center x10 y52 w70 , Closed Date:
Gui, Font
Gui, Add, Edit,+Center  x82 y48 w70 vCloseDate, %Today%

Gui, Font, underline
Gui, Add, Text, +Center x10 y74 w70 , TranOut Date:
Gui, Font
Gui, Add, Edit,+Center  x82 y70 w70 vTranOutDate, %Today%		

Gui, Font, underline
Gui, Add, Text, +Center x10 y96 w70 , TranOut LC#:
Gui, Font
Gui, Add, Edit,+Center  x82 y92 w70 vLCNumber, 


Gui, Add, GroupBox, cBlue x5 y120 w151 h45, Update Case Status
Gui, Add, Button, +Center x10 y135 w140 gUpdateStatus, Update Case Status

Gui, Add, GroupBox, cBlue x5 y165 w151 h45, Close Action
Gui, Add, Button,+Center  x10 y180 w140 gCloseAction, Close Action

;Gui, Add, Button, +Center x10 y165 w130 gDuplicateAction, Duplicate Action
Gui, Show, w160
return

NewStatus:
	if NewStatus = Abandoned
		GuiControl, Text, Edit1, Test
	else if NewStatus = Transferred
		GuiControl, Text, Edit2, Test2
return



CloseAction:
Gui, Submit
;Gui, Hide
OutputVar = http://oc-docketing/CPi/tmkfrmTrademark.aspx?key=430607
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
  ie.Visible := True
   params := [OutputVar, 32]
}
;ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
IniRead, ATPartner, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATPartner
IniRead, ATDate, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATDate
NewStatus := NewStatus
CloseDate := CloseDate
TranOutDate := TranOutDate
Username := Username
NowClosed := "Transferred to Soandso LC#"
ie.document.getElementByID("btnEdit").Click()
Sleep 250
;ie.document.getElementByID("btnSave").Click()
ie.document.getElementByID("flddteResponseDate").Value := CloseDate
Remarks := ie.document.getElementByID("fldstrRemarks").Value
NewRemarks = %ATDate% %NowClosed% %Username%`n%Remarks% 
ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
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
Sleep 1000
SplashTextOn, 400, 400, Information Copied, Client Code: %ClientCode%`nCountry: %Country%`n`nPriority Date: %PriorityDate%`nFiling Date: %FilingDate%`nPublication Date: %PubDate%`nRegistration Date: %RegDate%`nLast Renewal: %LastRenewal%`nNextRenewal: %NextRenewal%`nAllowance Date: %AllowanceDate%`nClosed Date: %ClosedDate%`n2nd Publication Date: %2ndPubDate%`nIssue Date: %IssueDate%`nParent PCT Date: %ParentPCTDate%`nParent Issue Date: %ParentIssueDate%`nExpiration Date: %ExpirationDate%
Sleep 2000
SplashTextOff
Gui, Show
return
return

UpdateStatus:
Gui, Hide
OutputVar = http://oc-docketing/CPi/tmkfrmTrademark.aspx?key=430607
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
  ie.Visible := True
   params := [OutputVar, 32]
}
;ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
NewStatus := "Abandoned"
CloseDate := "2/8/17"
TranOutDate := "2/8/17"
ie.document.getElementByID("btnEdit").Click()
Sleep 250
	if NewStatus = Transferred
		{
		ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := NewStatus   ; For Patent.
		ie.document.getElementByID("fldstrTrademarkStatus_TextBox").Value := NewStatus     ; For TM.
		ie.document.getElementByID("flddteTranOutDate").Value := TranOutDate
		}
	if NewStatus = Abandoned
		{
		ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := NewStatus
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
Sleep 1000
SplashTextOn, 400, 400, Information Copied, Client Code: %ClientCode%`nCountry: %Country%`n`nPriority Date: %PriorityDate%`nFiling Date: %FilingDate%`nPublication Date: %PubDate%`nRegistration Date: %RegDate%`nLast Renewal: %LastRenewal%`nNextRenewal: %NextRenewal%`nAllowance Date: %AllowanceDate%`nClosed Date: %ClosedDate%`n2nd Publication Date: %2ndPubDate%`nIssue Date: %IssueDate%`nParent PCT Date: %ParentPCTDate%`nParent Issue Date: %ParentIssueDate%`nExpiration Date: %ExpirationDate%
Sleep 2000
SplashTextOff
Gui, Show
return

PasteBiblio:
Gui, Hide
SplashTextOn, 400, 400, Information Copied, Client Code: %ClientCode%`nCountry: %Country%`n`nPriority Date: %PriorityDate%`nFiling Date: %FilingDate%`nPublication Date: %PubDate%`nRegistration Date: %RegDate%`nLast Renewal: %LastRenewal%`nNextRenewal: %NextRenewal%`nAllowance Date: %AllowanceDate%`nClosed Date: %ClosedDate%`n2nd Publication Date: %2ndPubDate%`nIssue Date: %IssueDate%`nParent PCT Date: %ParentPCTDate%`nParent Issue Date: %ParentIssueDate%`nExpiration Date: %ExpirationDate%
Sleep 2000
SplashTextOff
;MetastormGrab: ; TO BE IMPLEMENTED
OutputVar = http://oc-docketing/CPi/tmkfrmTrademark.aspx?key=430607
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
  ie.Visible := True
   params := [OutputVar, 32]
}
;ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ie.document.getElementByID("flddtePriDate").Value := PriorityDate
ie.document.getElementByID("flddteFilDate").Value := FilingDate
ie.document.getElementByID("flddtePubDate").Value := PubDate
ie.document.getElementByID("flddteRegDate").Value := RegDate
ie.document.getElementByID("flddteLastRenewalDate").Value := LastRenewal
ie.document.getElementByID("flddteNextRenewalDate").Value := NextRenewal
ie.document.getElementByID("flddteAllowanceDate").Value := AllowanceDate
ie.document.getElementByID("flddteClosedDate").Value := ClosedDate
ie.document.getElementByID("flddtePubDate_2").Value := 2ndPubDate
ie.document.getElementByID("flddteIssDate").Value := IssueDate
ie.document.getElementByID("flddteParentPCTDate").Value := ParentPCTDate
ie.document.getElementByID("flddteParentIssDate").Value := ParentIssueDate
ie.document.getElementByID("flddteExpDate").Value := ExpirationDate
Sleep 1000
Gui, Show
return

CopyAction:
Gui, Hide
MetastormGrab: ; TO BE IMPLEMENTED
OutputVar = http://oc-docketing/CPi/tmkfrmTrademark.aspx?key=430607
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
  ie.Visible := True
   params := [OutputVar, 32]
}
;ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
BaseDate := ie.document.getElementByID("flddteBaseDate").Value
Remarks := ie.document.getElementByID("fldstrRemarks").Value
Sleep 1000
SplashTextOn, 400, 400, Information Copied,Client Code: %ClientCode%`n`nCountry: %Country%`n`nAction Type: %ActionType%`n`nBase Date: %BaseDate%`n`nGeneral Remarks: %Remarks%
Sleep 2000
SplashTextOff
Gui, Show
return

PasteAction:
Gui, Hide
SplashTextOn, 400, 400, Information to Paste,Client Code: %ClientCode%`n`nCountry: %Country%`n`nAction Type: %ActionType%`n`nBase Date: %BaseDate%`n`nGeneral Remarks: %Remarks%
Sleep 2000
SplashTextOff
;MetastormGrab: ; TO BE IMPLEMENTED
OutputVar = http://oc-docketing/CPi/tmkfrmTrademark.aspx?key=430607
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
  ie.Visible := True
   params := [OutputVar, 32]
}
;ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := ClientCode
ie.document.getElementByID("fldstrCountry_TextBox").Value := Country
ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
ie.document.getElementByID("flddteBaseDate").Value := BaseDate
ie.document.getElementByID("fldstrRemarks").Value := Remarks
Sleep 1000
Gui, Show
return


/*
ie.Document.All.certname2.Value := EFSLast
ie.Document.All.certaddr1.Value := EFSEmail
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second


ie.Document.All.radiogroup2.Click()
ie.Document.getElementById("My workplace").Click()
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
ie.Document.All.pkiSaveType_1.Click()
Sleep, 100 ; 1/10 second
IELoad(wb)
Sleep 200
ie.Document.All.retrievepract.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
SendInput {Space}
Sleep 1000
gosub RecordEFSFill
*/


DuplicateAction:
ModifiedSwitchSystem()
return

#3::
Gui, Hide
ModifiedSwitchSystem()
{
gosub CopyAction
WinActivate, ahk_class IEFrame
Sleep 2000
		OldClipboard := Clipboard                                                                ; This saves clipboard content for later.
        Clipboard = ;                                                                            ; This empties the clipboard.
        MyString = ;                                                                             ; Sets MyString to blank.
        AppString = ;
        FrontString = ;
        
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

if Instr(MyString, PatentActionString)
     {
     StringLeft, FrontString, MyString, 74       ; Stores first 67+7=74 characters of URL for Live Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     FrontString = %NewPATATAction%
     }
else if Instr(MyString, PatentATActionString)
     {
     StringLeft, FrontString, MyString, 85       ; Stores first 78+7=85 characters of URL for AT Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     FrontString = %NewPATLiveAction%
     }
else if Instr(MyString, TMActionString)
     {
     StringLeft, FrontString, MyString, 73       ; Stores first 67+6=73 characters of URL for Live TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     FrontString = %NewTMATAction%
     }
else if Instr(MyString, TMATActionString)
     {
     StringLeft, FrontString, MyString, 83       ; Stores first 77+6=83 characters of URL for AT TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     FrontString = %NewTMLiveAction%
     }
else
     {
     SplashTextOn, 430,,Not on a Live or AT action. Unable to duplicate action.,
     Sleep 1500
     SplashTextOff
     Clipboard = %OldClipboard%
     Return
     }
MyString := FrontString . AppString
SplashTextOn, 300,,Duplicating action now.,
Sleep 1000
MyString = %MyString%
OutputVar = %MyString%
ie := ComObjCreate("InternetExplorer.Application")
;params := [OutputVar, 4096]
params := [OutputVar, 32]
ie.Navigate(params*)
;Run iexplore.exe "%MyString%"
;Sleep 1000
SplashTextOff
gosub PasteAction
Sleep 2000
Clipboard = %OldClipboard%
AppString = ;
FrontString = ;
Gui, Show
Return
}
Gui, Show
return

GuiClose:
ExitApp
return



;ie.Document.getElementById("btnSave").Click()
;ie.Document.getElementById("btnUndo").Click()

;ie.Document.All.btnUndo.Click()

DuplicateBiblio:
Gui, Hide
;gosub CopyBiblio
Sleep 1000
SwitchSystem()
Sleep 1000
gosub PasteBiblio
Gui, Show
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
SendInput ^l
Sleep 200
SendInput ^c
ClipWait, .2      
MyString := clipboard                            ; Fetch URL into variable
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
else
     {
     SplashTextOn, 400,,Not on a Live or AT docketing page. Unable to open page.,
     Sleep 1500
     SplashTextOff
     Clipboard = %OldClipboard%
     Return
     }
MyString := FrontString . AppString
SplashTextOn, 300,,Opening in opposite system now.,
Run %MyString%
Sleep 1000
SplashTextOff
;MsgBox, %MyString%
;Run iexplore.exe, max
;WinWait,
Clipboard = %OldClipboard%
AppString = ;
FrontString = ;
Return
}

