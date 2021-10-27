#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)

Gui, Meta: New, , MetaStorm Grab
;Gui, Meta: Add, Radio, x5 y8 vPatOrTM Checked, Patent
;Gui, Meta: Add, Radio, x60 y8,Trademark
;Gui, Meta: Add, Edit, x140 y5 vClientCode w100, Client Code
;Gui, Meta: Add, Edit, x245 y5 vCountry w100, Country
Gui, Meta: Add, Text, Section x5 y5  w250 Left , MetaStorm Grab - Press Windows + Q to Grab!

Gui, Meta: Add, Edit, x5 y25 w500 h500
;Gui, Add, ActiveX, x5 w500 h500 vie, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
;ie.Navigate("http://oc-metastorm/Metastorm/eFolder.aspx?FolderID=0000000000000000000000000473451&Service=Metastorm+BPM+Server&Timestamp=2017-11-02T12%3A49%3A10#")  ; This is specific to the web browser control.
Gui, Meta: Show
return

#q::
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
;MsgBox, % ie.LocationURL
TDS := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("TD").length ;[0].InnerText ; Use for multi-level & change array value
TEXTAREA := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("TEXTAREA").length ;[0].InnerText ; Use for multi-level & change array value
DIVS := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("DIV").length ;[0].InnerText ; Use for multi-level & change array value
INPUTS := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("INPUT").length ; Use for multi-level & change array value

MsgBox, NumTDS | %TDS%`nNumTEXTAREA | %TEXTAREA%`nNumINPUTS | %INPUTS%`nNumDIVS | %DIVS%


;    THIS IS FOR TAB 7 : DOCKETING

Country := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("INPUT")[55].Value ; Use for multi-level & change array value
Mark := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("INPUT")[57].Value ; Use for multi-level & change array value
ClientName := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("INPUT")[58].Value ; Use for multi-level & change array value
ForeignAssociate := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("INPUT")[59].Value ; Use for multi-level & change array value
AppNumber := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("INPUT")[60].Value ; Use for multi-level & change array value
OppDeadline := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("INPUT")[61].Value ; Use for multi-level & change array value
ClientCode := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("INPUT")[69].Value ; Use for multi-level & change array value

/*
Loop %INPUTS%
{
RESULT := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("TEXTAREA")[A_Index - 1].InnerText ; Use for multi-level & change array value
RESULT2 := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("INPUT")[A_Index - 1].Value ; Use for multi-level & change array value
if (A_Index = 56) || (A_Index = 58) || (A_Index = 59) || (A_Index = 60) || (A_Index = 61) || (A_Index = 62) || (A_Index = 70)
	ALLINPUTS := ALLINPUTS . "`n" . A_Index . " | " RESULT2
;MsgBox, %RESULT2% | %A_Index%

;AllDIVS := AllDIVS . "`t" . RESULT . " | " . A_Index
;MsgBox, %AllDIVS%
;MsgBox, % RESULT . " | " .  RESULT2 . " | " . A_Index
}
*/
ALLINPUTS := "Country: " . Country . "`n" . "Mark: " . Mark . "`n" . "Client: " . ClientName . "`n" . "Foreign Associate: " . ForeignAssociate . "`n" . "App #: " .  AppNumber . "`n" . "Opposition Deadline: " . OppDeadline . "`n" . "Client Code: " . ClientCode . "`n"

;MsgBox, NumTDS | %TDS%`nNumTEXTAREA | %TEXTAREA%`nNumINPUTS | %INPUTS%`nNumDIVS | %DIVS%
GuiControl, Meta: , Edit1, %ALLINPUTS%
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