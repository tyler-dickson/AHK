#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)


formattime, Today, , MMddyy          ; yyyy-MM-dd

Gui, New, , Docketing Information Check
Gui, Add, Edit, Center x10 y55 w150 h400 gBackEnd vBackEnd,
Gui, Font
Gui, Add, Edit, Center x10 y25 w150 ReadOnly vNumberOfCodes, 0
Gui, Font, s11 
Gui, Add, Text, Center x10 y5 w150, Client Code Count:
Gui, Add, ListView, x165 y55 w475 h400 Checked Right Grid vLoadedFiles , Client Code                   |Priority Number                         |Priority Date 
Gui, Add, Button, x440 y25 w200 h22 gAppend, Search Docketing
Gui, Add, ActiveX, x0 y450 w650 h0 vie2, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
ie.Navigate("http://kmobnetold/outsidekmobnet/cid/cidold/ClientList.aspx")  ; This is specific to the web browser control.
Gui, Add, Edit, Center x180 y25 w130 vSearchField, 
Gui, Font, s11 
Gui, Add, Text, Center x180 y5 w130, Search Criteria:


Gui, Add, Button, x5 y5 w25 h25 gOverrideLinks,
Gui, Font, bold
Gui, Add, Text, x35 y5 h25 w50 Center gOverride, Override`nLinks
Gui, Color, ff6842
Gui, Show, w90 h35

Gui, Show, w650 h500
return

BackEnd:
GuiControlGet, Edit1Status, , Edit1
StringSplit, Edit1Status, Edit1Status, `n, 
GuiControl, , Edit2, %Edit1Status0%
return

Append:
Gui, Submit, NoHide

PriorNumber := "Priority Number:"
PriorDate := "Priority Date:"

StringSplit, BackEnd, BackEnd, `n, , 
LV_Delete()
Sleep 1000
Loop %BackEnd0%
{
Website := "http://kmobnet/insidekmobnet/Patent_TM_Reports/facesheet.cfm?&casenumber=" . BackEnd%A_Index%

params := [Website, 64]
ie2.Navigate(params*)	
Sleep 500
Info := ""
BaseNumber := ""
var := ie2.LocationURL ;grab current url	
Var2 := ie2.document.GetElementsByTagName("TD").length
;MsgBox, %Var2%
	Loop %Var2%
	{
	NewInfo := ie2.document.GetElementsByTagName("TD")[A_Index-1].InnerText
	;MsgBox, %NewInfo% %A_Index%
	Info := Info . "`n" . NewInfo . " | " . A_Index
		ifinstring, NewInfo, % PriorNumber
			{
			BaseNumber := A_Index - 1
			Action := ie2.document.GetElementsByTagName("TD")[BaseNumber].InnerText	
			;StringReplace, Action, Action, %PriorNumber%, ,
			}
		ifinstring, NewInfo, % PriorDate
			{
			BaseNumber2 := A_Index - 1
			Action2 := ie2.document.GetElementsByTagName("TD")[BaseNumber2].InnerText	
			;StringReplace, Action2, Action2, %PriorDate%, , 
			break
			}				
			
			
		;if NewInfo = File Continuing App? IFee Due
		;	{
		;	BaseNumber := A_Index - 1
		;	break
		;	}
	}
;Action1 := ie.document.GetElementsByTagName("TD")[BaseNumber - 1].InnerText
;Action2 := ie.document.GetElementsByTagName("TD")[BaseNumber].InnerText
;Action4 := ie.document.GetElementsByTagName("TD")[BaseNumber + 3].InnerText
LV_Add("", BackEnd%A_Index%, Action, Action2)
}
;LV_ModifyCol(2, "Sort")
gosub OverrideLinks
return

Override:
PostMessage, 0xA1, 2,,, A
return

OverrideLinks:
#F3::
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
var := ie.LocationURL ;grab current url	
Var2:=ie.document.GetElementsByTagName("DIV").length  ;INPUT
TDS :=ie.document.GetElementsByTagName("TD").length  ;INPUT
Spans := ie.document.GetElementsByTagName("DIV")[9].OuterHTML    ;Get InnerText    ;INPUT
INPUTS := ie.document.GetElementsByTagName("INPUT").length   ;Get InnerText    ;INPUT
LinkNumber = 0
Loop %TDS%
{
Spans := ie.document.GetElementsByTagName("TD")[A_Index - 1].OuterHTML
StringLen, SpanCount, Spans
if SpanCount < 250
	{
	ifInString, Spans, patfrmActionDue  ; usually 5  ; 184, 193
		{
		LinkNumber++
		ifinstring, Var, CountryApplicationAgent	
			{
			StringMid, MidSpan, Spans, 65, 8
			NewInsert%A_Index% = <INPUT onclick="OpenPopup('patfrmActDueDateAgent.aspx?Key=%MidSpan%', '820px');" id=btn_edtDueDate alt="" src="H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\superedit.png" type=image border=0 name=btn_edtDueDate>
			NewLink := (A_Index - A_Index + LinkNumber)
			Link%NewLink% := NewInsert%A_Index%
			}
		else ifinstring, Var, CountryApplication
			{
			StringMid, MidSpan, Spans, 60, 7 
			NewInsert%A_Index% = <INPUT onclick="OpenPopup('patfrmActDueDate.aspx?Key=%MidSpan%', '820px');" alt=Edit src="H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\superedit.png" type=image>
			NewLink := (A_Index - A_Index + LinkNumber)
			Link%NewLink% := NewInsert%A_Index%
			}
		}
	}
}

LinkNumber = 1
Loop %INPUTS%
{
Spans := ie.document.GetElementsByTagName("INPUT")[A_Index - 1].OuterHTML
	ifinstring, Spans, id=fldstrCountryName
		{
		NewInject := (A_Index - A_Index + LinkNumber)
		Boom := ie.document.GetElementsByTagName("INPUT")[A_Index - 1].Value
		ie.document.GetElementsByTagName("INPUT")[A_Index - 1].InnerText := Boom . " | " . Action . " | " . Action2
		LinkNumber++
		}
}
TrayTip, Link override activated., This only works for a single refresh.`nYou'll need to use this again if updating multiple actions.
Sleep 5000
Traytip
return




#F4::
ie := WBGet()
;while ie.busy or ie.ReadyState != 4 ;Wait for page to load
;	Sleep, 100
URL := ie.LocationURL ;grab current url
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
ClientCodeTM := ie.document.getElementByID("fldstrCaseNumber").Value
Inject = OpenPopup('patfrmActDueDate.aspx?Key=%MidSpan%', '820px');" alt=Edit src="images/icon_save.gif" type=image>
MidSpan = 9383746

ie.Navigate( "javascript: var MidSpan = %MidSpan%; OpenPopup('patfrmActDueDate.aspx?Key=' + MidSpan, '820px')" )

;ie.Navigate( "javascript: var Inject = 'OpenPopup('patfrmActDueDate.aspx?Key=%MidSpan%', '820px')" )
;ie.Navigate( "javascript: eval(Inject)" )
ie := ""
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

