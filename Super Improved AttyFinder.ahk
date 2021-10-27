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

Gui, New, +Owner, QuickDocket
Gui, Add, ActiveX, w500 h500 vie2, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
ie2.Navigate("http://kmobnetold/outsidekmobnet/cid/cidold/ClientList.aspx")  ; This is specific to the web browser control.
Gui, Show
Gui, Hide
return

#x::
GrabClientCode:
URL := ""
Info := ""
ie := WBGet()
;while ie.busy or ie.ReadyState != 4 ;Wait for page to load
;	Sleep, 100
URL := ie.LocationURL ;grab current url
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
ClientCodeTM := ie.document.getElementByID("fldstrCaseNumber").Value
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value

if ClientCode = 
	{
	ClientCode := "Not a Patent."
	ClientCode := ClientCodeTM
	}
if ClientCodeTM = 
	{
	ClientCodeTM := "Not a Trademark."	
	ClientCode := ClientCode
	}
if (ClientCode = "Not a Patent.") && (ClientCodeTM = "Not a Trademark.")
	ClientCode := ""

;MsgBox, %ClientCode%, %ClientCodeTM%, %Stored%

ifinstring, URL, % "patfrm"
	Website := "http://kmobnet/insidekmobnet/Patent_TM_Reports/facesheet.cfm?&casenumber=" . ClientCode . "&country=" . Country
ifinstring, URL, % "tmkfrm"
	Website := "http://kmobnet/insidekmobnet/Patent_TM_Reports/TMfacesheet.cfm?&casenumber=" . ClientCode . "&country=" . Country

params := [Website, 64]
ie2.Navigate(params*)	
Sleep 1000
Info := ""

var := ie2.LocationURL ;grab current url	
;MsgBOx, %var%
Var2 := ie2.document.GetElementsByTagName("SPAN").length
;MsgBox, %Var2%

Loop %Var2%
{
NewInfo := ie2.document.GetElementsByTagName("SPAN")[A_Index-1].InnerText
Info := Info . "`r`n" . NewInfo ; " | " . A_Index
}

TrayTip, AttyFinder, %Info%
gosub AttyEmailFinder
ie := ""
gosub RecordAttyFinder
Sleep 2000
TrayTip
return


AttyEmailFinder:
Multiuse:
Clipboard = ;
SendInput ^c
ClipWait, .2
NewClipboard = %Clipboard%
;global ClientCode := ""
;global ClientCode2 := ""
;global Country := ""
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

TestString = %Info%
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
			Clipboard := Clipboard . ", " ATPartner . ", *FORUS, " . ClientCode . ".kmob@iwcs.kmob.com" 
			}
	;	ifMsgBox No
	;		Clipboard := Clipboard . ", " ATPartner
		ifMsgBox Timeout		
			Clipboard := Clipboard . ", " ATPartner
	}
return


RecordAttyFinder:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, AttyFinder, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AttyFinder
IniRead, AttyFinderH, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AttyFinder
AttyFinder++
AttyFinderH++
IniWrite, %AttyFinder%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, AttyFinder
IniWrite, %AttyFinderH%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, AttyFinder
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
