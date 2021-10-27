#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)

Gui, New, AlwaysOnTop -Caption Owner, Override
Gui, Add, Button, x5 y5 w25 h25 gOverrideLinks,
Gui, Font, bold
Gui, Add, Text, x35 y5 h25 w50 Center gOverride, Override`nLinks
Gui, Color, ff6842
Gui, Show, w90 h35
return

Override:
PostMessage, 0xA1, 2,,, A
return

OverrideLinks:
#F3::
FileDelete, UpdateLinks.txt
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
	ifInString, Spans, tmkfrmActionDue  ; usually 5  ; 184, 193
		{
		LinkNumber++
		ifinstring, Var, tmkfrmTrademarkAgent	
			{
			StringMid, MidSpan, Spans, 65, 7
			NewInsert%A_Index% = <INPUT onclick="OpenPopup('tmkfrmActDueDateAgent.aspx?Key=%MidSpan%', '720px'); return false;" id=btn_edtDueDate alt="" src="H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\superedit.png" type=image border=0 name=btn_edtDueDate>
			NewLink := (A_Index - A_Index + LinkNumber)
			Link%NewLink% := NewInsert%A_Index%
			;MsgBox, % Link%NewLink% .  " | " . NewLink
			}
		else ifinstring, Var, tmkfrmTrademark
			{
			StringMid, MidSpan, Spans, 60, 7 
			NewInsert%A_Index% = <INPUT onclick="OpenPopup('tmkfrmActDueDate.aspx?Key=%MidSpan%', '720px'); return false;" id=btn_edtDueDate alt="" src="H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\superedit.png" type=image border=0 name=btn_edtDueDate>
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
	ifinstring, Spans, EditTakenDate
		{
		NewInject := (A_Index - A_Index + LinkNumber)
		ie.document.GetElementsByTagName("INPUT")[A_Index - 1].OuterHTML := Link%NewInject%	
		LinkNumber++
		}
}
TrayTip, Link override activated., This only works for a single refresh.`nYou'll need to use this again if updating multiple actions.
Sleep 5000
Traytip
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
INPUTS := ie.document.GetElementsByTagName("INPUT").length   ;Get InnerText    ;INPUT
StringSplit, Spans, Spans, `n
MsgBox, %Spans0% %INPUTS%

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
			NewInsert = "OpenPopup('patfrmActDueDate.aspx?Key=%MidSpan%', '820px');" alt=Edit src="images/icon_delete.gif" type=image>
			MsgBox, %A_Index% | %Spans%`n`n%MidSpan%`n`n%NewInsert%
			}
	ifInString, Spans, EditTakenDate  ; usually 12   ; 191, 200
			{
			ClickButton := A_Index
			StringLeft, SpansLeft, Spans, 137
			MsgBox, %A_Index% | %Spans%`n`n%SpansLeft%%NewInsert%
			SuperNewInsert := SpansLeft . NewInsert
			ie.document.GetElementsByTagName("TD")[191].OuterHTML := SuperNewInsert
			}
	}
}
MsgBox, %NewInsert%

;MsgBOx, % var := ie.document.links.length   ; how many links
MsgBox, end of loop.
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

#2::
html =
(
<html>
<head>
<script>
function ClickFunction()
{
alert("Hello World!");
}
</script>

<script>
function ClickFunction1()
{
var x = 'tyler'; 
var y = 6; 
alert(x + ' This is a test. ' + y);
}
</script>
</head>

<body>
<button onclick="ClickFunction()">Try it</button>
<button onclick="ClickFunction1()">Now</button>
</body>
</html>
)

Gui, Add, ActiveX, w100 h50 vWB, HTMLFile
wb.write(html)
Gui, Show
return

GuiClose:
ExitApp


#1::
ie := WBGet()
;url := ie.LocationURL
;ie.Navigate( "javascript: var x = 'tyler'; var y = 6; url = window.location.href; var txt; var r = confirm(x + '\n\nThis is a test. \n\n' + url); if (r == false) {alert(r) } else {  alert(r) }       " )
test := "javascript: var x = 'tyler'; var y = 6; url = window.location.href; var txt; var r = confirm(x + '\n\nThis is a test. \n\n' + url); if (r == false) {alert(r) } else {  alert(r) }       "
ie.Navigate(test)
return


Escape:
ExitApp




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

