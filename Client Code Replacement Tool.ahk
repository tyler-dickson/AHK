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

Username := "J.George"
	
		
Gui, New, AlwaysOnTop
Gui, Font, s10
Gui, Add, Tab3, x0 y0 +background, PREFIX|NUMBER|COUNTRY
Gui, Tab, 1
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
Gui, Add, Button,  +Center x33 y100 gChangeCode w280, UPDATE PREFIX
;Gui, Font, s16 Arial underline
;Gui, Add, Text, +Center  x48  y157 w140          , RESP ATTY:
;Gui, Font,
;Gui, Font, s16 Arial
;Gui, Add, Edit, +Center Uppercase x185 y154 w100 vAttorney , 
Gui, Font, 
Gui, Color, ABCDEF 


Gui, Tab, 2
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


Gui, Tab, 3
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
Gui, Tab
Gui, Add, Button,  +Center x5 y155 gChangeClient w335, INVENTION: UPDATE CLIENT
Gui, Color, ABCDEF 
Gui, Show, w345 h200 ,Replace Client Code
return


ChangeClient:
Gui, Submit, NoHide
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
;IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
ie.document.getElementByID("btnEdit").Click()
ie.document.getElementByID("fldstrClient_TextBox").Value := NewPrefix
return

ChangeCode:
Gui, Submit, NoHide
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
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
	ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
	}
else
	{
	StringReplace, NewClientCode, OldClientCode, % OldPrefix, % NewPrefix, A
	NewRemarks = %Today% - Matter changed from %OldClientCode% to %NewClientCode%, %Username%`n%Remarks%	
	ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := NewClientCode
	ie.document.getElementByID("fldstrRemarks").Value := NewRemarks
	}
return

ChangeCode2:
Gui, Submit, NoHide
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
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
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
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
