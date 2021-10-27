#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
Enabled := ComObjError(false)
formattime, Today, ,  MM/dd/yyyy          ;  yyyy-MM-dd	

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





SetTimer, GrabClientCode, 1000
TrayTip, Client Code Grab Activated, I don't mess around bro.
Sleep 2500
TrayTip
return


GrabClientCode:
ie := WBGet()
;while ie.busy or ie.ReadyState != 4 ;Wait for page to load
;	Sleep, 100
URL := ie.LocationURL ;grab current url
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
ClientCodeTM := ie.document.getElementByID("fldstrCaseNumber").Value
	if ClientCode = 
		{
		ClientCode := "Not a Patent."
		Stored := ClientCodeTM
		}
	if ClientCodeTM = 
		{
		ClientCodeTM := "Not a Trademark."	
		Stored := ClientCode
		}
	if (ClientCode = "Not a Patent.") && (ClientCodeTM = "Not a Trademark.")
		Stored := ""
	
;TrayTip, Grabbed Client Code, %ClientCode% | %ClientCodeTM% | %url%
ie := ""
return


RCtrl::
;IfWinActive, ahk_class XLMAIN
;	SendInput, %Today%{Shift down}{ENTER}{Shift up}
;else
	SendInput, %Stored%
return


^MButton::
DateandName()
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

DateAndName()
{
IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
StringLen, NameLen, Username
NameLen1 := NameLen + 1
NameLen2 := NameLen + 2
LastClipboard = %Clipboard%
Clipboard = ;
Sleep 75
SendInput ^c
ClipWait, .2
NewClipboard = %Clipboard%
	if NewClipboard = ;
		{
		Sleep 75
		SendInput %ATDate%            ; Pastes current date.
		SendInput {Space}             ; Adds space after date.
		;SendInput {End}{Space}-%Username% ; Jumps to end of line and pastes Username.
		SendInput {End}{Space}%Username% ; Jumps to end of line and pastes Username.
		SendInput {Left %NameLen1%}              ; Positions cursor in middle of text by taking length of Username and adding 2.
		}
	else IfInString, NewClipboard, * -
		{
		Sleep 75
		StringReplace, NewClipboard, NewClipboard, *,, 
		StringReplace, NewClipboard, NewClipboard, %A_Space%,,		
		StringReplace, NewClipboard, NewClipboard, -,, 
		Sleep 75
		;Clipboard = %ATDate% -%NewClipboard% -%Username% 
		Clipboard = %ATDate%%NewClipboard%%Username% 
		Sleep 75
		SendInput ^v
		SendInput {Left %NameLen%}              ; Positions cursor in middle of text by taking length of Username and adding 2.
		SendInput {Space}
		}
	else
		{
		Sleep 75
		;Clipboard = %ATDate% - %NewClipboard% -%Username% 
		Clipboard = %ATDate% %NewClipboard% %Username% 
		Sleep 100
		SendInput ^v
		SendInput {Left %NameLen1%}              ; Positions cursor in middle of text by taking length of Username and adding 2.
		}
Sleep 100
Clipboard = %LastClipboard%
gosub RecordKeystrokes
SendInput {Ctrl up}
return
}

RecordKeystrokes:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, Keystrokes, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, Keystrokes
IniRead, KeystrokesH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, Keystrokes
StringLen, NameLen, Username
StringLen, DateLen, ATDate
KeystrokesSaved := (NameLen + DateLen + 3)
Keystrokes+=%KeystrokesSaved%
KeystrokesSavedH := (NameLen + DateLen + 3)
KeystrokesH+=%KeystrokesSavedH%
IniWrite, %Keystrokes%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, Keystrokes
IniWrite, %KeystrokesH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, Keystrokes
return