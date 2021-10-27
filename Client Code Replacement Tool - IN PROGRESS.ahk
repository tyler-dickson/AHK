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
Gui, Add, Tab3, x0 y0 +background AltSubmit vSelectedTab, Username|*Change|*CloseFile ;NUMBER|COUNTRY

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
Gui, Add, Button,  +Center x23 y152 gChangeClient w300, COUNTRY PAGE REMARKS
Gui, Font, s8
Gui, Add, Edit,  +Center x5 y205 w335 h40, 
Gui, Color, ABCDEF 

Gui, Tab, 1
Gui, Font, s14 Arial underline
Gui, Add, Text, +Center  x33   y25  w280           , USERNAME FOR REMARKS
Gui, Font,
Gui, Font, s16 Arial
Gui, Add, ComboBox,  +Center Uppercase x33   y55  w280 vUsername, J.GEORGE||LLAW


Gui, Tab, 3
Gui, Font,
Gui, Font, s16 Arial underline
Gui, Add, Text, +Center  x33   y25  w280           , INVENTION SCREEN
Gui, Add, Text, +Center  x33   y105  w280          , COUNTRY / TRADEMARK
Gui, Font,
Gui, Font, s18 Arial bold
Gui, Font, 
Gui, Font, s16 Arial
Gui, Add, Button,  +Center x23 y55 gCloseInvention w300, UPDATE TO CLOSED
Gui, Add, Button,  +Center x23 y135 gClosePatTM w300, UPDATE TO CLOSED


Gui, Add, Button,  +Center x23 y198 gChangeClient w300, CLOSE ACTION

Gui, Color, ABCDEF 




Gui, Show, w345 h250 ,Replace Client Code
return

CloseInvention:
ClosePatTM:
return








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
GuiControl, , Edit3, %NewRemarks%
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
	}
else
	{
	StringReplace, NewClientCode, OldClientCode, % OldPrefix, % NewPrefix, A
	NewRemarks = %Today% - Matter changed from %OldClientCode% to %NewClientCode%, %Username%`n%Remarks%	
	ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := NewClientCode
	ie.document.getElementByID("fldstrClient_TextBox").Value := NewPrefix
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
	}
else
	{
	StringReplace, NewClientCode, OldClientCode, % OldPrefix2, % NewPrefix2, A
	NewRemarks = %Today% - Matter changed from %OldClientCode% to %NewClientCode%, %Username%`n%Remarks%	
	ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := NewClientCode
	ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
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
	}
else
	{
	StringReplace, NewClientCode, OldClientCode, % OldPrefix3, % NewPrefix3, A
	NewRemarks = %Today% - Matter changed from %OldClientCode% to %NewClientCode%, %Username%`n%Remarks%	
	ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := NewClientCode
	ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
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
