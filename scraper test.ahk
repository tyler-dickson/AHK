#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)

#q::
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100

MsgBox, % ie.LocationURL
;ie := ComObjCreate("Shell.Application").Windows
;while ie.busy or ie.ReadyState != 4 ;Wait for page to load
;	Sleep, 100
;ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := "NewStatus"

;MsgBox % ie.document.parentWindow.frames.length ; Returns count of main frames

;MsgBox % ie.document.parentWindow.frames("iframeResult").document.GetElementsBytagname("TABLE").length ; Use for multi-level & change array value
;MsgBox % ie.document.parentWindow.frames("iframeResult").document.GetElementsBytagname("TR").length ; Use for multi-level & change array value
;TDS := ie.document.GetElementsBytagname("TD").length ; Use for multi-level & change array value
;INPUTS := ie.document.GetElementsBytagname("INPUT").length ; Use for multi-level & change array value

;MsgBox % ie.document.parentWindow.frames("iframeResult").document.GetElementsBytagname("TR")[0].OuterHTML ; Use for multi-level & change array value
;MsgBox % ie.document.parentWindow.frames("iframeResult").document.GetElementsBytagname("TR")[0].Value ; Use for multi-level & change array value


;MsgBox % ie.document.GetElementsBytagname("TD")[12].InnerText ; Use for multi-level & change array value
;MsgBox % ie.document.GetElementsBytagname("TD")[12].OuterHTML ; Use for multi-level & change array value

;MsgBox % ie.document.parentWindow.frames("iframeResult").document.GetElementsBytagname("TD")[1].InnerText ; Use for multi-level & change array value
;MsgBox % ie.document.parentWindow.frames("iframeResult").document.GetElementsBytagname("TD")[1].OuterHTML ; Use for multi-level & change array value
TDS := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("TD").length ;[0].InnerText ; Use for multi-level & change array value
TEXTAREA := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("TEXTAREA").length ;[0].InnerText ; Use for multi-level & change array value
DIVS := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("DIV").length ;[0].InnerText ; Use for multi-level & change array value
INPUTS := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("INPUT").length ; Use for multi-level & change array value

MsgBox, NumTDS | %TDS%`nNumTEXTAREA | %TEXTAREA%`nNumINPUTS | %INPUTS%`nNumDIVS | %DIVS%

Loop %INPUTS%
{
RESULT := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("TEXTAREA")[A_Index - 1].InnerText ; Use for multi-level & change array value
RESULT2 := ie.document.parentWindow.frames("eFormContents").document.GetElementsBytagname("INPUT")[A_Index - 1].Value ; Use for multi-level & change array value

MsgBox, %RESULT2% | %A_Index%

;AllDIVS := AllDIVS . "`t" . RESULT . " | " . A_Index
;MsgBox, %AllDIVS%
;MsgBox, % RESULT . " | " .  RESULT2 . " | " . A_Index
}




/*
TDSList := "Country`tComments`n"
Loop %NumTDS%
{
LoopTDS := ie.document.GetElementsBytagname("TD")[A_Index + 4].InnerText ; Use for multi-level & change array value
MsgBox, % LoopTDS " | " A_Index
if Mod(A_Index, 2) = 1
	TDSList := TDSList "`n" LoopTDS
else
	TDSList := TDSList "`t" LoopTDS
if A_Index = 2
	break
}
*/

MsgBox, NumTDS | %TDS%`nNumTEXTAREA | %TEXTAREA%`nNumINPUTS | %INPUTS%`nNumDIVS | %DIVS%


;FacingInfo := ie.document.GetElementsBytagname("TD")[5].InnerText ; Use for multi-level & change array value
;CaseStatus := ie.document.GetElementsBytagname("TD")[6].InnerText ; Use for multi-level & change array value

;MsgBox, % FacingInfo "`n" CaseStatus


return



#F2::
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
var := ie.LocationURL ;grab current url	
Var2:=ie.document.GetElementsByTagName("DIV").length  ;INPUT
TDS :=ie.document.GetElementsByTagName("TD").length  ;INPUT
MsgBox, %Var2% %TDS%

TrayTip, Grabbing Designation/Family info.
TDCount = 0
;Loop %Var2%
Spans := ie.document.GetElementsByTagName("DIV")[9].OuterHTML    ;Get InnerText    ;INPUT
StringSplit, Spans, Spans, `n
MsgBox, %Spans0%

Loop %TDS%
{
Spans := ie.document.GetElementsByTagName("TD")[A_Index - 1].OuterHTML
StringLen, SpanCount, Spans
;MsgBox, %SpanCount%
if SpanCount < 250
	{
	ifInString, Spans, patfrmActionDue  ; usually 5  ; 184, 193
			{
			StringMid, MidSpan, Spans, 60, 7 
			NewInsert = "OpenPopup('patfrmActDueDate.aspx?Key=%MidSpan%', '820px');" alt=Edit src="images/icon_edit.gif" type=image>
			MsgBox, %A_Index% | %Spans%`n`n%MidSpan%`n`n%NewInsert%
			}
	ifInString, Spans, EditTakenDate  ; usually 12   ; 191, 200
			{
			ClickButton := A_Index
			StringLeft, SpansLeft, Spans, 137
			MsgBox, %A_Index% | %Spans%`n`n%SpansLeft%%NewInsert%
			SuperNewInsert := SpansLeft . NewInsert
			ie.document.GetElementsByTagName("TD")[ClickButton].OuterHTML := SuperNewInsert
			}
	}
}
;NewInsert = INPUT onclick="OpenPopup('patfrmActDueDate.aspx?Key=%MidSpan%', '820px');"

MsgBox, %NewInsert%

;INPUT onclick="OpenPopup('patfrmActDueDate.aspx?Key=9383624', '820px');"

;<TD style="WIDTH: 33%"><A href="patfrmActionDue.aspx?key=9333857&amp;bc=1&amp;key2=1275806"><IMG border=0 src="images/icon_zoom.gif"> Status of Application? / Asst </A></TD>

;<TD style="WIDTH: 1%" vAlign=middle noWrap><IMG id=dgdAction__ctl2_Image6 border=0 alt="" src="images/icon_spacer.gif"> <INPUT onclick="return EditTakenDate(19458509);" alt=Edit src="images/icon_edit.gif" type=image> </TD>


;<TD style="WIDTH: 1%" vAlign=middle noWrap><IMG id=dgdAction__ctl2_Image6 border=0 alt="" src="images/icon_spacer.gif"> <INPUT onclick="return EditTakenDate(19458509);" alt=Edit src="images/icon_edit.gif" type=image> </TD>



;<TD style="WIDTH: 33%"><A href="patfrmActionDue.aspx?key=9383746&amp;bc=1&amp;key2=1275806"><IMG border=0 src="images/icon_zoom.gif"> INT-PAT MISCELLANEOUS </A></TD> | 


;<TD style="WIDTH: 1%" vAlign=middle noWrap><IMG id=dgdAction__ctl2_Image6 border=0 alt="" src="images/icon_spacer.gif"> <INPUT onclick="return EditTakenDate(19584222);" alt=Edit src="images/icon_edit.gif" type=image> </TD>


;<TD style="WIDTH: 1%" vAlign=middle noWrap><IMG id=dgdAction__ctl2_Image6 border=0 alt="" src="images/icon_spacer.gif"> <INPUT onclick="return EditTakenDate(19584222);" alt=Edit src="images/icon_edit.gif" type=image> </TD>





;MsgBOx, % var := ie.document.links.length   ; how many links
MsgBox, end of loop.
return





#F1::
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
var := ie.LocationURL ;grab current url	
MsgBox, % ie.LocationURL
	
	
Var2:=ie.document.GetElementsByTagName("TD").length
MsgBox, % Var2
Info := ""
Loop %Var2%
{
NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
MsgBox, %Info%
Info := Info . "`n" . NewInfo
}


Gui, New, QuickDocket
Gui, Add, Edit, w500 h500, %Info%
Gui, Show

return
	
;MsgBox % Var:=ie.document.GetElementsByTagName("TD")[218].Value ;Get value
;MsgBox % Var:=ie.document.GetElementsByTagName("TD")[217].OuterHTML ;Get OuterHTML
;MsgBox % Var:=ie.document.GetElementsByTagName("TD")[217].InnerHTML ;Get InnerHTML
;MsgBox % Var:=ie.document.GetElementsByTagName("TD")[227].InnerText ;Get InnerText

TrayTip, Grabbing Designation/Family info.
TDCount = 0
Loop %Var2%
{
TDTDTD := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText    ;Get InnerText 

ifinstring, TDTDTD, % "RemarksCase"
	TDCount++
if TDCount = 5
	{
	;MsgBox %TDTDTD% %A_Index%
	break
	}

}

StringSplit, TDTDTD, TDTDTD, `n
	;MsgBox, % TDTDTD0 "`n" TDTDTD3 "`n" TDTDTD4 "`n" TDTDTD5 "`n"  

Loop %TDTDTD0%
{
if A_Index < 3
	continue
else
StringMid, Country%A_Index%, TDTDTD%A_Index%, 1, 2
StringMid, CaseType%A_Index%, TDTDTD%A_Index%, 3, 3
StringMid, ValidationInfo%A_Index%, TDTDTD%A_Index%, 6, 100	
MsgBox, % Country%A_Index% " | " CaseType%A_Index% " | " ValidationInfo%A_Index%
	
}



;      DEEPCVALIDATED 602006052514.1   

;      GBEPCVALIDATED   




;ie.document.GetElementsByTagName("TD")[8].Value := "This is a test." ;Get InnerText
;Sleep 1000
;ie.document.all.email.Value := "This is also a test."
;Sleep 1000

;MsgBOx, % var := ie.document.links.length   ; how many links
MsgBox, end of loop.
return


#z::


EFSPayLogIn:

TrayTip, Getting started..., Starting the EFS Fee Login process...
YourSearchStr := "loginLogout"
IniRead, EFSPayEmail,    C:\Users\%Computername%\AHKPrefs.ini, Username, EFSPayEmail
IniRead, EFSPayPassword, C:\Users\%Computername%\AHKPrefs.ini, Username, EFSPayPassword
EFSPayEmail = %EFSPayEmail%
EFSPayPassword  = %EFSPayPassword%
OutputVar = http://oc-docketing/CPi/patschInvention.aspx

ie := ComObjCreate("InternetExplorer.Application")
ie.Visible := True
;params := [OutputVar, 4096]
params := [OutputVar, 32]
ie.Navigate(params*)
Sleep 2000
ie.document.getElementByID("schstrCaseNumber_TextBox").Value := YourSearchStr
Sleep 2000
ie.document.getElementByID("btnStartSearch").Click()
Sleep 2000
TrayTip, Please wait..., Signing into EFS...


Sleep 5000
ie.Quit() ; this is if you want the ie browser to close once the string as been found
TrayTip, And we're done!, You should now (hopefully) be signed into EFS Fees.

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

