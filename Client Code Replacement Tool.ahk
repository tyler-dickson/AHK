#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
formattime, Today, ,  MM/dd/yyyy          ;  yyyy-MM-dd	
Menu, Tray, Icon, wmploc.dll, 136

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

;Username := "J.George"
	
		
Gui, New, AlwaysOnTop
Gui, Font, s10
Gui, Add, Tab3, x0 y0 +background AltSubmit vSelectedTab, USERNAME|PREFIX|NUMBER|COUNTRY
Gui, Tab, 2
Gui, Font,
Gui, Font, s16 Arial underline
Gui, Add, Text, +Center  x10   y25  w150           , OLD PREFIX
Gui, Add, Text, +Center  x185 y25  w150           , NEW PREFIX
Gui, Font,
Gui, Font, s16 Arial
Gui, Add, Edit, +Center Uppercase x10   y55  w150 vOldPrefix, 
Gui, Font, s18 Arial bold
Gui, Add, Text, +Center  x160 y58  w25           , ⇒
Gui, Font, 
Gui, Font, s16 Arial
Gui, Add, Edit, +Center Uppercase x185 y55  w150 vNewPrefix, 
Gui, Add, Button,  +Center x23 y100 gChangeCode w300, INVENTION PREFIX/CLIENT
;Gui, Font, s16 Arial underline
;Gui, Add, Text, +Center  x48  y157 w140          , RESP ATTY:
;Gui, Font,
;Gui, Font, s16 Arial
;Gui, Add, Edit, +Center Uppercase x185 y154 w100 vAttorney , 
Gui, Font, 
Gui, Color, ABCDEF 


Gui, Tab, 3
Gui, Font, s16 Arial underline
Gui, Add, Text, +Center  x10   y25  w150           , OLD NUMBER
Gui, Add, Text, +Center  x185 y25  w150           , NEW NUMBER
Gui, Font,
Gui, Font, s16 Arial
Gui, Add, Edit, +Center Uppercase x10   y55  w150 vOldPrefix2, 
Gui, Font, s18 Arial bold
Gui, Add, Text, +Center  x160 y58  w25           , ⇒
Gui, Font, 
Gui, Font, s16 Arial
Gui, Add, Edit, +Center Uppercase x185 y55  w150 vNewPrefix2, 
Gui, Add, Button,  +Center x33 y100 gChangeCode2 w280, UPDATE NUMBER          ;REPLACE CLIENT CODE
;Gui, Font, s16 Arial underline
;Gui, Add, Text, +Center  x48  y157 w140          , RESP ATTY:
;Gui, Font,
;Gui, Font, s16 Arial
;Gui, Add, Edit, +Center Uppercase x185 y154 w100 vAttorney2 , 
Gui, Font, 
Gui, Color, ABCDEF 


Gui, Tab, 4
Gui, Font, s14 Arial underline
Gui, Add, Text, +Center  x10   y25  w150           , OLD COUNTRY
Gui, Add, Text, +Center  x185 y25  w150           , NEW COUNTRY
Gui, Font,
Gui, Font, s16 Arial
Gui, Add, Edit, +Center Uppercase x10   y55  w150 vOldPrefix3, 
Gui, Font, s18 Arial bold
Gui, Add, Text, +Center  x160 y58  w25           , ⇒
Gui, Font, 
Gui, Font, s16 Arial
Gui, Add, Edit, +Center Uppercase x185 y55  w150 vNewPrefix3, 
Gui, Add, Button,  +Center x33 y100 gChangeCode3 w280, UPDATE COUNTRY
;Gui, Font, s16 Arial underline
;Gui, Add, Text, +Center  x48  y157 w140          , RESP ATTY:
;Gui, Font,
;Gui, Font, s16 Arial
;Gui, Add, Edit, +Center Uppercase x185 y154 w100 vAttorney3 , 
;Gui, Font, 

Gui, Tab, 1
Gui, Font, s14 Arial underline
Gui, Add, Text, +Center  x33   y25  w280           , USERNAME FOR REMARKS
Gui, Font,
Gui, Font, s16 Arial
Gui, Add, ComboBox,  +Center Uppercase x33   y55  w280 vUsername, J.GEORGE||LLAW

;Gui, Font, s16 Arial underline
;Gui, Add, Text, +Center  x48  y157 w140          , RESP ATTY:
;Gui, Font,
;Gui, Font, s16 Arial
;Gui, Add, Edit, +Center Uppercase x185 y154 w100 vAttorney3 , 
;Gui, Font, 
Gui, Tab
Gui, Add, Button,  +Center x5 y155 gChangeClient w335, COUNTRY PAGE REMARKS
Gui, Font, s8
Gui, Add, Edit,  +Center x5 y205 w335 h40, 
Gui, Color, ABCDEF 
Gui, Show, w345 h250 ,Replace Client Code
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


;ChangeClient:
;ie := WBGet()
;while ie.busy or ie.ReadyState != 4 ;Wait for page to load
;	Sleep, 100
;IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
;ie.document.getElementByID("btnEdit").Click()
;ie.document.getElementByID("fldstrClient_TextBox").Value := NewPrefix
;ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
;return



ChangeClient:
ie := WBGet()
NewClientCode := ie.document.getElementByID("fldstrCaseNumber").Value
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
TrayTip, Quick Record Opener, Opening a Patent in docketing.
OutputVar = http://oc-docketing/CPi/patschCountryApplication.aspx
params := [OutputVar, 32]
ie.Navigate(params*)

while ie.busy ; or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ie.Document.All.schstrCaseNumber_TextBox.Value := NewClientCode
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
Sleep 3000
TrayTip
;gosub RecordClientCodeIE
SendInput {Ctrl up}
Remarks := ie.document.getElementByID("fldstrRemarks").Value
Sleep 500
NewRemarks = %Today% - Matter changed from %OldClientCodeTM% to %NewClientCode%, %Username%`n%Remarks%	
ie.document.getElementByID("btnEdit").Click()
Sleep 500
ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
ie.document.getElementByID("fldstrSubCase").Value := ""
GuiControl, , Edit8, %NewRemarks%
return




ChangeCode:
Gui, Submit, NoHide
if Username = 
	{
	MsgBox, , No Username set!, You haven't set your Username yet.`n`nUpdate the USERNAME tab and try again.
	return
	}
else
;Gui, Show, w345 h250 ,Replace Client Code
ie := WBGet()
;while ie.busy or ie.ReadyState != 4 ;Wait for page to load
;	Sleep, 100
;IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
ie.document.getElementByID("btnEdit").Click()
OldClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
OldClientCodeTM := ie.document.getElementByID("fldstrCaseNumber").Value
Remarks := ie.document.getElementByID("fldstrRemarks").Value
Sleep 500
;MsgBox, %Remarks% %OldPrefix% %NewPrefix% %OldClientCode%
if OldClientCode = 
	{
	StringReplace, NewClientCode, OldClientCodeTM, % OldPrefix, % NewPrefix, A
	NewRemarks = %Today% - Matter changed from %OldClientCodeTM% to %NewClientCode%, %Username%`n%Remarks%	
	ie.document.getElementByID("fldstrCaseNumber").Value := NewClientCode
	ie.document.getElementByID("fldstrClient_TextBox").Value := NewPrefix
	ie.document.getElementByID("fldstrSubCase").Value := ""
	}
else
	{
	StringReplace, NewClientCode, OldClientCode, % OldPrefix, % NewPrefix, A
	NewRemarks = %Today% - Matter changed from %OldClientCode% to %NewClientCode%, %Username%`n%Remarks%	
	ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := NewClientCode
	ie.document.getElementByID("fldstrClient_TextBox").Value := NewPrefix
	ie.document.getElementByID("fldstrSubCase").Value := ""
	}
return

ChangeCode2:
Gui, Submit, NoHide
if Username = 
	{
	MsgBox, , No Username set!, You haven't set your Username yet.`n`nUpdate the USERNAME tab and try again.
	return
	}
else
ie := WBGet()
;while ie.busy or ie.ReadyState != 4 ;Wait for page to load
;	Sleep, 100
;IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
ie.document.getElementByID("btnEdit").Click()
OldClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
OldClientCodeTM := ie.document.getElementByID("fldstrCaseNumber").Value
Remarks := ie.document.getElementByID("fldstrRemarks").Value
Sleep 500
;MsgBox, %Remarks% %OldPrefix% %NewPrefix% %OldClientCode%
if OldClientCode = 
	{
	StringReplace, NewClientCode, OldClientCodeTM, % OldPrefix2, % NewPrefix2, A
	NewRemarks = %Today% - Matter changed from %OldClientCodeTM% to %NewClientCode%, %Username%`n%Remarks%	
	ie.document.getElementByID("fldstrCaseNumber").Value := NewClientCode
	ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
	ie.document.getElementByID("fldstrSubCase").Value := ""
	}
else
	{
	StringReplace, NewClientCode, OldClientCode, % OldPrefix2, % NewPrefix2, A
	NewRemarks = %Today% - Matter changed from %OldClientCode% to %NewClientCode%, %Username%`n%Remarks%	
	ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := NewClientCode
	ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
	ie.document.getElementByID("fldstrSubCase").Value := ""
	}
return

ChangeCode3:
Gui, Submit, NoHide
if Username = 
	{
	MsgBox, , No Username set!, You haven't set your Username yet.`n`nUpdate the USERNAME tab and try again.
	return
	}
else
ie := WBGet()
;while ie.busy or ie.ReadyState != 4 ;Wait for page to load
;	Sleep, 100
;IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
ie.document.getElementByID("btnEdit").Click()
OldClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
OldClientCodeTM := ie.document.getElementByID("fldstrCaseNumber").Value
Remarks := ie.document.getElementByID("fldstrRemarks").Value
Sleep 500
;MsgBox, %Remarks% %OldPrefix% %NewPrefix% %OldClientCode%
if OldClientCode = 
	{
	StringReplace, NewClientCode, OldClientCodeTM, % OldPrefix3, % NewPrefix3, A
	NewRemarks = %Today% - Matter changed from %OldClientCodeTM% to %NewClientCode%, %Username%`n%Remarks%	
	ie.document.getElementByID("fldstrCaseNumber").Value := NewClientCode
	ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
	ie.document.getElementByID("fldstrSubCase").Value := ""
	}
else
	{
	StringReplace, NewClientCode, OldClientCode, % OldPrefix3, % NewPrefix3, A
	NewRemarks = %Today% - Matter changed from %OldClientCode% to %NewClientCode%, %Username%`n%Remarks%	
	ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := NewClientCode
	ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
	ie.document.getElementByID("fldstrSubCase").Value := ""
	}
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
