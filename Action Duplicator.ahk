#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)

Gui, New, Owner AlwaysOnTop
Gui, Add, GroupBox, cBlue x5 y5  h95, Bibliographic Data
Gui, Add, Button, Section +Center x10 y20 w130 gCopyBiblio, Copy Bibliographic Data
Gui, Add, Button, +Center x10 y45 w130 gPasteBiblio, Paste Bibliographic Data
;Gui, Add, Button, +Center x10 y70 w130 gDuplicateBiblio, Duplicate Biblio Data
Gui, Add, GroupBox, cBlue x5 y100  h95, Action Data
Gui, Add, Button, +Center  x10 y115 w130 gCopyAction, Copy Action Data
Gui, Add, Button, +Center x10 y140 w130 gPasteAction, Paste Action Data
;Gui, Add, Button, +Center x10 y165 w130 gDuplicateAction, Duplicate Action
Gui, Add, Button, +Center x10 y200 w130 gStartDataGrab, Start Data Grab
Gui, Show, w150
return

StartDataGrab:
Gui, 1: New, AlwaysOnTop
Gui, 1: Font, underline
Gui, 1: Add, Text, w100 Center, Biblio Info:
Gui, 1: Font
Gui, 1: Add, Button, w100 , %ClientCode%
Gui, 1: Add, Button, w100 , %Country%
Gui, 1: Add, Button, w100 , %PriorityDate%
Gui, 1: Add, Button, w100 , %FilingDate%
Gui, 1: Add, Button, w100 , %PubDate%
Gui, 1: Add, Button, w100 , %RegDate%
Gui, 1: Add, Button, w100 , %LastRenewal%
Gui, 1: Add, Button, w100 , %NextRenewal%
Gui, 1: Add, Button, w100 , %AllowanceDate%
Gui, 1: Add, Button, w100 , %ClosedDate%
Gui, 1: Add, Button, w100 , %2ndPubDate%
Gui, 1: Add, Button, w100 , %IssueDate%
Gui, 1: Add, Button, w100 , %ParentPCTDate%
Gui, 1: Add, Button, w100 , %ParentIssueDate%
Gui, 1: Add, Button, w100 , %ExpirationDate%
Gui, 1: Add, Button, w100 ,     ;%Remarks%
Gui, 1: Font, underline
Gui, 1: Add, Text, w100 Center, Action Info:
Gui, 1: Font
Gui, 1: Add, Button, w100 , %ClientCode%
Gui, 1: Add, Button, w100 , %Country%
Gui, 1: Add, Button, w100 , %ActionType%
Gui, 1: Add, Button, w100 , %BaseDate%
Gui, 1: Add, Button, w100 ,    ;%Remarks%
Gui, 1: Show
SetTimer, PersistBiblio, 2500
return

PersistBiblio:
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ClientCode2 := ie.document.getElementByID("fldstrCaseNumber").Value
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
PriorityDate := ie.document.getElementByID("flddtePriDate").Value
FilingDate := ie.document.getElementByID("flddteFilDate").Value
PubDate := ie.document.getElementByID("flddtePubDate").Value
RegDate := ie.document.getElementByID("flddteRegDate").Value
LastRenewal := ie.document.getElementByID("flddteLastRenewalDate").Value
NextRenewal := ie.document.getElementByID("flddteNextRenewalDate").Value
AllowanceDate := ie.document.getElementByID("flddteAllowanceDate").Value
ClosedDate := ie.document.getElementByID("flddteClosedDate").Value
2ndPubDate := ie.document.getElementByID("flddtePubDate_2").Value
IssueDate  := ie.document.getElementByID("flddteIssDate").Value
ParentPCTDate := ie.document.getElementByID("flddteParentPCTDate").Value
ParentIssueDate := ie.document.getElementByID("flddteParentIssDate").Value
ExpirationDate := ie.document.getElementByID("flddteExpDate").Value
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
BaseDate := ie.document.getElementByID("flddteBaseDate").Value
Remarks := ie.document.getElementByID("fldstrRemarks").Value
GuiControl, 1: , Button1, %ClientCode%%ClientCode2%
GuiControl, 1: , Button2, %Country%
GuiControl, 1: , Button3, %PriorityDate%
GuiControl, 1: , Button4, %FilingDate%
GuiControl, 1: , Button5, %PubDate%
GuiControl, 1: , Button6, %RegDate%
GuiControl, 1: , Button7, %LastRenewal%
GuiControl, 1: , Button8, %NextRenewal%
GuiControl, 1: , Button9, %AllowanceDate%
GuiControl, 1: , Button10, %ClosedDate%
GuiControl, 1: , Button11, %2ndPubDate%
GuiControl, 1: , Button12, %IssueDate%
GuiControl, 1: , Button13, %ParentPCTDate%
GuiControl, 1: , Button14, %ParentIssueDate%
GuiControl, 1: , Button15, %ExpirationDate%
GuiControl, 1: , Button16, %Remarks%
GuiControl, 1: , Button17, %ClientCode%
GuiControl, 1: , Button18, %Country%
GuiControl, 1: , Button19, %ActionType%
GuiControl, 1: , Button20, %BaseDate%
GuiControlGet,  Button17Info, , Button17
	if Button17Info = 
		{
		GuiControl, 1: , Button16, %Remarks%
		GuiControl, 1: , Button21,
		}
	else if Button17Info != 
		{
		GuiControl, 1: , Button16, 
		GuiControl, 1: , Button21, %Remarks%
		}
return



CopyBiblio:
;Gui, Hide
ie := ""
ie := WBGet()
;while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	;Sleep, 100
;Sleep 1000
ClientCode := ie.document.getElementByID("fldstrCaseNumber").Value
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
PriorityDate := ie.document.getElementByID("flddtePriDate").Value
FilingDate := ie.document.getElementByID("flddteFilDate").Value
PubDate := ie.document.getElementByID("flddtePubDate").Value
RegDate := ie.document.getElementByID("flddteRegDate").Value
LastRenewal := ie.document.getElementByID("flddteLastRenewalDate").Value
NextRenewal := ie.document.getElementByID("flddteNextRenewalDate").Value
AllowanceDate := ie.document.getElementByID("flddteAllowanceDate").Value
ClosedDate := ie.document.getElementByID("flddteClosedDate").Value
2ndPubDate := ie.document.getElementByID("flddtePubDate_2").Value
IssueDate  := ie.document.getElementByID("flddteIssDate").Value
ParentPCTDate := ie.document.getElementByID("flddteParentPCTDate").Value
ParentIssueDate := ie.document.getElementByID("flddteParentIssDate").Value
ExpirationDate := ie.document.getElementByID("flddteExpDate").Value
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
BaseDate := ie.document.getElementByID("flddteBaseDate").Value
Remarks := ie.document.getElementByID("fldstrRemarks").Value
;Sleep 200
;SplashTextOn, 400, 400, Information Copied, Client Code: %ClientCode%`nCountry: %Country%`n`nPriority Date: %PriorityDate%`nFiling Date: %FilingDate%`nPublication Date: %PubDate%`nRegistration Date: %RegDate%`nLast Renewal: %LastRenewal%`nNextRenewal: %NextRenewal%`nAllowance Date: %AllowanceDate%`nClosed Date: %ClosedDate%`n2nd Publication Date: %2ndPubDate%`nIssue Date: %IssueDate%`nParent PCT Date: %ParentPCTDate%`nParent Issue Date: %ParentIssueDate%`nExpiration Date: %ExpirationDate%`nAction Type: %ActionType%`n`nBase Date: %BaseDate%`n`nGeneral Remarks: %Remarks%
SwitchSystem()
TrayTip, Biblio Copied., Bibliographic data has been stored.
Sleep 2000
TrayTip
;SplashTextOff
;Gui, Show
return

PasteBiblio:
;Gui, Hide
;SplashTextOn, 400, 400, Information Copied, Client Code: %ClientCode%`nCountry: %Country%`n`nPriority Date: %PriorityDate%`nFiling Date: %FilingDate%`nPublication Date: %PubDate%`nRegistration Date: %RegDate%`nLast Renewal: %LastRenewal%`nNextRenewal: %NextRenewal%`nAllowance Date: %AllowanceDate%`nClosed Date: %ClosedDate%`n2nd Publication Date: %2ndPubDate%`nIssue Date: %IssueDate%`nParent PCT Date: %ParentPCTDate%`nParent Issue Date: %ParentIssueDate%`nExpiration Date: %ExpirationDate%
;Sleep 2000
;SplashTextOff
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ie.Document.getElementById("btnEdit").Click()
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
TrayTip, Biblio Pasted., Bibliographic data has been pasted.
Sleep 2000
TrayTip
return

CopyAction:
Gui, Hide
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
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
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
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
Sleep 1000
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
Sleep 1000
Clipboard = %OldClipboard%
AppString = ;
FrontString = ;
Gui, Show
Return
}
Gui, Show
return

;GuiClose:
;ExitApp
;return



;ie.Document.getElementById("btnSave").Click()
;ie.Document.getElementById("btnUndo").Click()

;ie.Document.All.btnUndo.Click()

DuplicateBiblio:
Gui, Hide
gosub CopyBiblio
Sleep 1000
SwitchSystem()
Sleep 1000
gosub PasteBiblio
Gui, Show
return

SwitchSystem()
{
FormatTime, TimeStamp, R
IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, key
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
ie := WBGet()
MyString := ie.LocationURL ;grab current url

                        ; Fetch URL into variable
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
Run iexplore.exe  %MyString% 
Sleep 1000
SplashTextOff
;MsgBox, %MyString%
;Run iexplore.exe, max
;WinWait,
Clipboard = %OldClipboard%
AppString = ;
FrontString = ;
return
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




