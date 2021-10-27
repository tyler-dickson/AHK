#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)

^F12::
Clipboard := ""
Gui, New
Gui, Add, Button, gPatent, Patent
Gui, Add, Button, gTrademark, Trademark
Gui, Show
return

Patent:
ColumnCount = 1
Gui, Submit
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
var := ie.LocationURL ;grab current url	
NumTDS := ie.document.GetElementsBytagname("TD").length ; Use for multi-level & change array value

TDSList := "`n"
Loop %NumTDS%
{
LoopTDS := ie.document.GetElementsBytagname("TD")[A_Index + 21].InnerText ; Use for multi-level & change array value
LoopTDS := RegExReplace(LoopTDS, "[\r\n]")
	
if (ColumnCount = 6) or (ColumnCount = 7)
	LoopTDS := ""	

if ColumnCount = 8
	goto SkipEntryPat

if Mod(A_Index, 20) = 1
	TDSList := TDSList "`n" LoopTDS
else
	TDSList := TDSList "`t" LoopTDS
	
SkipEntryPat:	
if ColumnCount = 20
	ColumnCount = 1
else
	ColumnCount++
}

StringReplace, TDSList, TDSList, `n, , 
Clipboard = %TDSList%
TrayTip, Facing Data added to Clipboard., You can now paste the Facing data into the Facing template.
Sleep 2000
TrayTip
return

Trademark:
ColumnCount = 1
Gui, Submit
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
var := ie.LocationURL ;grab current url	
NumTDS := ie.document.GetElementsBytagname("TD").length ; Use for multi-level & change array value

TDSList := "`n"
Loop %NumTDS%
{
LoopTDS := ie.document.GetElementsBytagname("TD")[A_Index + 20].InnerText ; Use for multi-level & change array value
LoopTDS := RegExReplace(LoopTDS, "[\r\n]")

if (ColumnCount = 6) or (ColumnCount = 7)
	LoopTDS := ""	

if ColumnCount = 8
	goto SkipEntryTM

if Mod(A_Index, 19) = 1
	TDSList := TDSList "`n" LoopTDS
else
	TDSList := TDSList "`t" LoopTDS
	
SkipEntryTM:	
if ColumnCount = 19
	ColumnCount = 1
else
	ColumnCount++
}
Sleep 1000
StringReplace, TDSList, TDSList, `n, , 
Clipboard = %TDSList%
TrayTip, Facing Data added to Clipboard., You can now paste the Facing data into the Facing template.
Sleep 2000
TrayTip
return

/*


;F1::
;ie := WBGet()
;while ie.busy or ie.ReadyState != 4 ;Wait for page to load
;	Sleep, 100
;var := ie.LocationURL ;grab current url	
;MsgBox, % ie.LocationURL
	
	
	
	
	
	
	
	
;return	
	
	
MsgBox % Var:=ie.document.GetElementsByTagName("TD")[8].Value ;Get value
MsgBox % Var:=ie.document.GetElementsByTagName("TD")[8].OuterHTML ;Get OuterHTML
MsgBox % Var:=ie.document.GetElementsByTagName("TD")[8].InnerHTML ;Get InnerHTML
MsgBox % Var:=ie.document.GetElementsByTagName("TD")[8].InnerText ;Get InnerText
ie.document.GetElementsByTagName("TD")[8].Value := "This is a test." ;Get InnerText
Sleep 1000
ie.document.all.email.Value := "This is also a test."
Sleep 1000

MsgBOx, % var := ie.document.links.length   ; how many links


return




;MsgBox % ie.document.parentWindow.frames.length ; Returns count of main frames
;MsgBox % ie.document.parentWindow.frames("iframeResult").document.GetElementsBytagname("TABLE").length ; Use for multi-level & change array value
;MsgBox % ie.document.parentWindow.frames("iframeResult").document.GetElementsBytagname("TR").length ; Use for multi-level & change array value
;MsgBox, % NumTDS := ie.document.GetElementsBytagname("TD").length ; Use for multi-level & change array value
;MsgBox % ie.document.parentWindow.frames("iframeResult").document.GetElementsBytagname("TR")[0].InnerText ; Use for multi-level & change array value
;MsgBox % ie.document.parentWindow.frames("iframeResult").document.GetElementsBytagname("TR")[0].OuterHTML ; Use for multi-level & change array value
;MsgBox % ie.document.parentWindow.frames("iframeResult").document.GetElementsBytagname("TR")[0].Value ; Use for multi-level & change array value
;MsgBox % ie.document.parentWindow.frames("iframeResult").document.GetElementsBytagname("TD")[0].InnerText ; Use for multi-level & change array value
;MsgBox % ie.document.parentWindow.frames("iframeResult").document.GetElementsBytagname("TD")[0].OuterHTML ; Use for multi-level & change array value
;MsgBox % ie.document.parentWindow.frames("iframeResult").document.GetElementsBytagname("TD")[1].InnerText ; Use for multi-level & change array value
;MsgBox % ie.document.parentWindow.frames("iframeResult").document.GetElementsBytagname("TD")[1].OuterHTML ; Use for multi-level & change array value






*/






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