#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 32


OldKBINum := ""
showToggle := true

Gui, 4: New, -ToolWindow AlwaysOnTop, KBI Grabber

Gui, 4: Font, bold cBlue s12
Gui, 4: Add, Text, x5 y8 Section w50 Center, KBI #
Gui, 4: Add, Edit, yp-3 xp+55 Center w200 vKBINum ,
Gui, 4: Font,

Gui, 4: Add, Button, x5 y40 w50 h50 gSearchKBI, Search!
Gui, 4: Add, Button, xp+55 y40 w50 h50 gClearAll, Clear!
Gui, 4: Add, Button, xp+95 y40 w50 h50 gInjectBiblio, Nothing yet. ; Inject Biblio!
Gui, 4: Add, Button, xp+55 y40 w50 h50 gShowKBI, <<

Gui, 4: Add, Text, x3 yp+58 Section w65 Center -Wrap, Client Code
Gui, 4: Add, Edit, yp-3 xp+58 Center w200 ,
Gui, 4: Add, Text, x5 yp+28 Section w50 Center, Mark
Gui, 4: Add, Edit, yp-3 xp+55 Center w200 , 
Gui, 4: Add, Text, x5 yp+28 w50 Center, App No.
Gui, 4: Add, Edit, yp-3 xp+55 Center w200 ,
Gui, 4: Add, Text, x5 yp+28 w50 Center, Filing Date 
Gui, 4: Add, Edit, yp-3 xp+55 Center w200  ,
Gui, 4: Add, Text, x5 yp+28 w50 Center, Applicant 
Gui, 4: Add, Edit, yp-3 xp+55 Center w200  ,
Gui, 4: Add, Text, x5 yp+28 w50 Center, Relation
Gui, 4: Add, Edit, yp-3 xp+55 Center w200  ,
Gui, 4: Add, Text, x5 yp+28 w50 Center, Docketing`nNotes
Gui, 4: Add, Edit, yp-3 xp+55 Center w200 h100 ,

Gui, 4: Add, Text, x5 yp+105 w50 Center, Goods
Gui, 4: Add, Edit, yp-3 xp+55 Center w200 h200 ,

Gui, 4: Add, Text, x5 yp+205 w50 Center, Billing
Gui, 4: Add, Edit, yp-3 xp+55 Center w200  ,
Gui, 4: Add, Text, x5 yp+28 w50 Center, Reviewing
Gui, 4: Add, Edit, yp-3 xp+55 Center w200  ,
Gui, 4: Add, Text, x5 yp+28 w50 Center, Working
Gui, 4: Add, Edit, yp-3 xp+55 Center w200  ,
Gui, 4: Add, Text, x5 yp+28 w50 Center, TMPL
Gui, 4: Add, Edit, yp-3 xp+55 Center w200  ,
Gui, 4: Add, Text, x5 yp+28 w50 Center, CLSP
Gui, 4: Add, Edit, yp-3 xp+55 Center w200  ,
Gui, 4: Add, Text, x5 yp+28 w50 Center, Subject`nMatter
Gui, 4: Add, Edit, yp-3 xp+55 Center w200 h200 ,




; Maybe grab country from Country of Filing: United Kingdom (GB) 



Gui, 4: Add, ActiveX, x268 y5 w700 h865 vie, Shell.Explorer
ie.Navigate("http://kbi/Intapp/Intake/Requests/HybridRequestForm.aspx?rid=25535")


Gui, 4: Show, w980
return

4GuiClose:
ExitApp
return

InjectBiblio:
;MsgBox, Doesn't work yet.
return

ie2 := WBGet()

ie2.document.getElementById("fldstrCaseNumber").value := Trim(ClientCode)
ie2.document.getElementById("fldstrTrademarkName_TextBox").value := Trim(Mark)
ie2.document.getElementById("fldstrAppNumber").value := Trim(AppNo)

if !InStr(FilingDate, "No answer")
	ie2.document.getElementById("flddteFilDate").value := Trim(FilingDate)

return

ShowKBI:
showToggle := !showToggle

if (!showToggle)
	{
	Gui, 4: Show, w265
	GuiControl, 4: , Button4, >>
	}
else
	{
	Gui, 4: Show, w980
	GuiControl, 4: , Button4, <<
	}

return

ClearAll:
; GuiControl, 4: , Edit1,  ;   %Mark%
GuiControl, 4: , Edit2,  ;   %AppNo%
GuiControl, 4: , Edit3,  ;   %FilingDate%
GuiControl, 4: , Edit4,  ;   %Applicant%
GuiControl, 4: , Edit5,  ;   %Relationship%
GuiControl, 4: , Edit6,  ;   %DocketingNotes%
GuiControl, 4: , Edit7,  ;   %ClassGoods%
GuiControl, 4: , Edit8,  ;   %Billing%
GuiControl, 4: , Edit9,  ;   %Reviewing%
GuiControl, 4: , Edit10, ;   %Working%
GuiControl, 4: , Edit11, ;   %TMPL%
GuiControl, 4: , Edit12, ;   %CLSP%
GuiControl, 4: , Edit13, ;   %SubjectMatter%	
GuiControl, 4: , Edit14, ;   %SubjectMatter%	
GuiControl, 4: , Edit15, ;   %SubjectMatter%	
return

SearchKBI:
Gui, 4: Submit, NoHide
if (KBINum != "")
	{
	if (OldKBINum == KBINum)
		gosub KBISearch
	else
		{
		gosub ClearAll
		ie.Navigate("http://kbi/Intapp/Intake/Requests/HybridRequestForm.aspx?rid=" KBINum)
		while ie.busy or ie.ReadyState != 4 ;Wait for page to load
			Sleep, 100
		gosub KBISearch
		}
	}
OldKBINum := KBINum
return

Info = 
(
BIBLIOGRAPHIC DATA:
Mark: %Mark%
App No: %AppNo%
Filing Date: %FilingDate%
Applicant: %Applicant%
Relationship: %Relationship%
Docketing Notes: %DocketingNotes%

%ClassGoods%

ATTORNEYS:
Billing: %Billing%
Reviewing: %Reviewing%
Working: %Working%
TMPL: %TMPL%
CLSP: %CLSP%

SUBJECT MATTER:
%SubjectMatter%	
)








KBISearch:
SubjectMatter := ""
Mark := ""
ClassGoods := ""
AppNo := ""
FilingDate := ""
Billing := ""
Reviewing := ""
Working := ""
TMPL := ""
CLSP := ""
Info := ""
Applicant := ""
Relationship := ""
DocketingNotes := ""
ClientCode := ""

FindAgain:
; ie := WBGet()

SPANS := ie.document.getElementsByTagName("SPAN").length

Loop % SPANS
	{
	temp := ie.document.getElementsByTagName("SPAN")[A_Index - 1].outerText	
	if (temp == "►")
		{
		ie.document.getElementsByTagName("SPAN")[A_Index - 1].Click()		
		}
	}

;Sleep 200

;MsgBOx, % ie.document.getElementsByClassName("collapsify-marker").length


; Loop % ie.document.getElementsByClassName("collapsify-marker").length
;Loop % ie.document.getElementsByClassName("collapsify-marker").length
;	{
;	if (ie.document.getElementsByClassName("collapsify-marker")[A_Index - 1].outerText != "▼")
;		ie.document.getElementsByClassName("collapsify-marker")[A_Index - 1].Click()
;	Sleep 250
;	}

SPANS := ie.document.getElementsByTagName("SPAN").length

Loop % SPANS
	{
	temp := ie.document.getElementsByTagName("SPAN")[A_Index - 1].innerText
	
	if (InStr(temp, "Subject Matter of Work") && SubjectMatter == "")
		{
		SubjectMatter := ie.document.getElementsByTagName("SPAN")[A_Index + 1].innerText
		}
	else if (InStr(temp, "Subject Mark:")  && Mark == "")
		{
		Mark := ie.document.getElementsByTagName("SPAN")[A_Index + 1].innerText
		}	
	else if (InStr(temp, "Class No. and Goods / Services:")  && ClassGoods == "")
		{
		ClassGoods := ie.document.getElementsByTagName("SPAN")[A_Index].innerText
		}		
	else if (InStr(temp, "Application No. (if applicable):")  && AppNo == "")
		{
		AppNo := ie.document.getElementsByTagName("SPAN")[A_Index].innerText
		}		
	else if (InStr(temp, "Application Filing Date (if applicable):")  && FilingDate == "")
		{
		FilingDate := ie.document.getElementsByTagName("SPAN")[A_Index].innerText
		}	
	else if (InStr(temp, "Billing Partner:")  && Billing == "")
		{
		Billing := ie.document.getElementsByTagName("SPAN")[A_Index + 1].innerText
		}		
	else if (InStr(temp, "Reviewing Attorney:")  && Reviewing == "")
		{
		Reviewing := ie.document.getElementsByTagName("SPAN")[A_Index + 1].innerText
		}		
	else if (InStr(temp, "Working Attorney or Patent Scientist:")  && Working == "")
		{
		Working := ie.document.getElementsByTagName("SPAN")[A_Index + 1].innerText
		}			
	else if (InStr(temp, "Trademark Paralegal (TMPL):")  && TMPL == "")
		{
		TMPL := ie.document.getElementsByTagName("SPAN")[A_Index + 1].innerText
		}			
	else if (InStr(temp, "Client Specialist:")  && CLSP == "")
		{
		CLSP := ie.document.getElementsByTagName("SPAN")[A_Index].innerText
		}	
	else if (InStr(temp, "Docketing Notes:")  && DocketingNotes == "")
		{
		DocketingNotes := ie.document.getElementsByTagName("SPAN")[A_Index + 1].innerText
		}	
	else if (InStr(temp, "Client Matter Code:")  && ClientCode == "")
		{
		ClientCode := ie.document.getElementsByTagName("SPAN")[A_Index].innerText
		}	
	}

Applicant := ie.document.getElementsByClassName("grid-row-collapsible-first-cell")[0].innerText
Relationship := ie.document.getElementsByClassName("grid-row-cell")[0].innerText

if (SubjectMatter == "" || Working == "")
	goto FindAgain
		
Info = 
(
BIBLIOGRAPHIC DATA:
Client Code: %ClientCode%
Mark: %Mark%
App No: %AppNo%
Filing Date: %FilingDate%
Applicant: %Applicant%
Relationship: %Relationship%
Docketing Notes: %DocketingNotes%

%ClassGoods%

ATTORNEYS:
Billing: %Billing%
Reviewing: %Reviewing%
Working: %Working%
TMPL: %TMPL%
CLSP: %CLSP%

SUBJECT MATTER:
%SubjectMatter%	
)

Info := StrReplace(Info, "`t", "")	
Info := StrReplace(Info, "No answer provided", "")	
	
; MsgBox, % Info

GuiControl, 4: , Edit2, %ClientCode%
GuiControl, 4: , Edit3, %Mark%
GuiControl, 4: , Edit4, %AppNo%
GuiControl, 4: , Edit5, %FilingDate%
GuiControl, 4: , Edit6, %Applicant%
GuiControl, 4: , Edit7, %Relationship%
GuiControl, 4: , Edit8, %DocketingNotes%
GuiControl, 4: , Edit9, %ClassGoods%
GuiControl, 4: , Edit10, %Billing%
GuiControl, 4: , Edit11, %Reviewing%
GuiControl, 4: , Edit12, %Working%
GuiControl, 4: , Edit13, %TMPL%
GuiControl, 4: , Edit14, %CLSP%
GuiControl, 4: , Edit15, %SubjectMatter%	

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
