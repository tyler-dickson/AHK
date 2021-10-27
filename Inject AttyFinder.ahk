#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
Enabled := ComObjError(false)

#c::
ControlSend, RichEdit20WPT2, {Ctrl down}c{Ctrl up}, ahk_class rctrl_renwnd32
Sleep 100
MsgBOx, %Clipboard%
return

#z::
AttyFinder:
;ControlGetText, SubjectLine, RichEdit20WPT4, ahk_class rctrl_renwnd32
gosub AttyEmailFinder
Sleep 100 
ControlSend, RichEdit20WPT2, ^v, ahk_class rctrl_renwnd32
Sleep 3000	
WinActivate, ahk_class rctrl_renwnd32
NewCountry := ""
return

AttyEmailFinder:
Multiuse:
Clipboard = ;
SendInput ^c
ClipWait, .2
NewClipboard = %Clipboard%
global ClientCode := ""
global ClientCode2 := ""
global Country := ""
ThreeString := ""
TestString := ""
IniRead, ATPartner, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATPartner
Loop 10
{
AttyTest%A_Index% := ""
AttyString%A_Index% := ""
ThreeString%A_Index% := ""
TestString%A_Index% := ""
}

ie := WBGet()
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
ClientCode2 := ie.document.getElementByID("fldstrCaseNumber").Value
TestString = %Clipboard%
StringReplace, TestString, TestString, `- , , All                                        ; Removes all dashes.
StringReplace, TestString, TestString, `r`n, `, , All                                    ; Removes all hard returns. 
StringReplace, TestString, TestString, %A_Space% , , All ; Omits periods.                ; Removes all spaces, replaces with commas.
StringSplit, TestString, TestString, `, , . ; Omits periods.                             ; Splits into array at commas.

if TestString%TestString0% = 
	TestString0--

Loop %TestString0%
{
StringLeft, AttyString%A_Index%, TestString%A_Index%, 3				; Stores first three characters of string.
	if ThreeString = 
		ThreeString := AttyString%A_Index%
	else
		ThreeString := ThreeString . " " . AttyString%A_Index%
}
Sort, ThreeString, U D%A_Space% 
StringSplit, ThreeString, ThreeString, %A_Space% , . ; Omits periods.                             ; Splits into array at commas.

Loop %TestString0%
{
IniRead, AttyTest%A_Index%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini,  Attorneys, % ThreeString%A_Index% 
if AttyTest%A_Index% = ERROR                  ; If attorney is not an irregular one, sets AttyTest to 2aty team.
     AttyTest%A_Index% := "2" . ThreeString%A_Index%

StringLen, Atty%A_Index%Len, AttyTest%A_Index%	 
if Atty%A_Index%Len > 30                       ; If string is greater than 30 characters, meaning a runaway/blank array, sets array to blank.
	AttyTest%A_Index% = ;
}

Clipboard := ""
Loop %ThreeString0%
{
if Clipboard = 
	Clipboard := AttyTest%A_Index%
else
	Clipboard := Clipboard . ", " . AttyTest%A_Index%
}

if ClientCode = 
	ClientCode := ClientCode2

if Country = US
	{
	;ControlSetText, RichEdit20WPT4, %ClientCode% | %SubjectLine%, ahk_class rctrl_renwnd32
	Clipboard := Clipboard . ", " ATPartner . ", *FORUS, " . ClientCode . ".kmob@iwcs.kmob.com" 
	}
else if Country != 
	Clipboard := Clipboard . ", " ATPartner
else if Country = 
	{
	MsgBox, 0, Is this *FORUS?,Click OK if it is.`n`nOtherwise`, I'll assume it isn't., 3
		ifMsgBox OK
			{
			;ControlSetText, RichEdit20WPT4, %ClientCode% | %SubjectLine%, ahk_class rctrl_renwnd32
			Clipboard := Clipboard . ", " ATPartner . ", *FORUS, " . ClientCode2 . ".kmob@iwcs.kmob.com" 
			}
	;	ifMsgBox No
	;		Clipboard := Clipboard . ", " ATPartner
		ifMsgBox Timeout		
			Clipboard := Clipboard . ", " ATPartner
	}
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