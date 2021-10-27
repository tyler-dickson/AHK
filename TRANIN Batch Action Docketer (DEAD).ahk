#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, pifmgr.dll, 38
formattime, Today, , dd-MMM-yyyy	

Sites := ["http://oc-docketing/CPi/patfrmActionDue.aspx?key=-1"		; New Live Patent Action
,"http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=-1"	; New AT Patent Action
,"http://oc-docketing/CPi/tmkfrmActionDue.aspx?Key=-1"				; New Live TM Action
,"http://oc-docketing/CPiAgent/tmkfrmActionDueAgent.aspx?Key=-1"]	; New AT TM Action

Actions := ["INT-PAT PCT TRANIN"									; WO Patent					; done
,"INT-PAT TRANIN"													; INTL Patent				; done
,"US-PAT TRANIN PENDING"											; US Patent Pending			; done
,"US-PAT TRANIN ISSUED"												; US Patent Issued			; done
,"INT-TM TRANIN"													; INTL Trademark			; done
,"INT-TM WO TRANIN"													; INTL Madrid Trademark		; done
,"INT-TM TRANIN ASSIGN FA"											; INTL Trademark Assign FA	; done
,"US-TM TRANIN"														; US Trademark Pending				; nope
,"US-TM TRANIN INACTIVE KMO"										; US Trademark Inactive				; nope
,"US-TM TRANIN RENEWAL LC DATE"										; US TM Renewal LC Date				; nope
,"US-TTAB TRANIN"]													; US TTAB							; nope

Gui, New, , TRANIN Batch Action Docketer
Gui, Add, ActiveX, 	x120 y-100 w800 h720 vie, Shell.Explorer  
Gui, Font, cblue
Gui, Add, GroupBox, x5 y10 w110 h100 Center, Type of Records
Gui, Font,
Gui, Font, bold
Gui, Add, Radio, x18 yp+20 vPageType Checked AltSubmit  gChangeType , Patent Live
Gui, Add, Radio, xp yp+20 			 		 			gChangeType , Patent AT
Gui, Add, Radio, xp yp+20 			 		 			gChangeType , TM Live
Gui, Add, Radio, xp yp+20 			 		 			gChangeType , TM AT
Gui, Font,
Gui, Font, cblue
Gui, Add, GroupBox, x5 yp+30 w110 h185 Center, Excel Data Columns
Gui, Font,
Gui, Font, bold
Gui, Add, Text, xp+10 yp+20 w90 Center, Client Code
Gui, Font,
Gui, Add, DropDownList, xp yp+15 w90 vClientColumn, 	||A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z
Gui, Font, bold
Gui, Add, Text, x15 yp+25 w90 Center, Country Code
Gui, Font,
Gui, Add, DropDownList, xp yp+15 w90 vCountryColumn,	||A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z
Gui, Font, bold
Gui, Add, Text, x15 yp+25 w90 Center, Case Status
Gui, Font,
Gui, Add, DropDownList, xp yp+15 w90 vCaseColumn,		||A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z
Gui, Font, bold
Gui, Add, Text, x15 yp+25 w90 Center, Issue Date
Gui, Font,
Gui, Add, DropDownList, xp yp+15 w90 vIssueColumn,		||A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z
Gui, Font, bold
Gui, Add, Checkbox, xp+5 yp+30 w90 -Checked vAssignFA, Assign FA?
GuiControl, Hide, Button7

Gui, Add, Button,x5	y570 w110 h50 gLetsDoIt, Go!
ie.Navigate("\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\TRANIN Batch Start Page.html")
Gui, Show
return

ChangeType:
Gui, Submit, NoHide
if PageType < 3
	{
	GuiControl, , Static4, Issue Date
	GuiControl, Move, Button6, h185
	GuiControl, Hide, Button7
	GuiControl, , Button7, 0
	}
else
	{
	GuiControl, , Static4, Reg. Date
	GuiControl, Move, Button6, h208
	GuiControl, Show, Button7
	}
return

LetsDoIt:
Gui, Submit, NoHide
offset = 0
if ((ClientColumn = "") || (CountryColumn = ""))
	{
	MsgBox, 0, Client Code and/or Country Code column not selected!, For the tool to work, I need you to select at least the Client Code and Country Code columns. For best results, select all four columns.`n`nI will determine which action to use based on the columns you select, so make sure you pick the right ones.`n`nCheck to make sure your selections are correct, and then try again.
	return
	}

xl := ComObjActive("Excel.Application")
while (xl.Range(ClientColumn . A_Index + 1).Value != "") 
	offset++

if offset < 1	
	{
	MsgBox, 0, Something seems weird..., Try restarting Excel and try again.
	return
	}

if AssignFA = 1
	{
	tempoffset := offset * 2
	MsgBox, 4, About to docket some actions..., I'm about to docket %tempoffset% actions.`n`nDoes that sound right?
	}
else		
	MsgBox, 4, About to docket some actions..., I'm about to docket %offset% actions.`n`nDoes that sound right?
IfMsgBox No
	{
	MsgBox, 0, Aborting!, No worries!`n`nMake sure you're on the right Excel sheet and try again.
	return
	}
else
	{
	Loop % offset 
		{
		ie.Navigate(Sites[PageType])
		while ie.busy or ie.ReadyState != 4
			Sleep, 100
		ClientCode 	:= xl.Range(ClientColumn  . A_Index + 1).Value
		CountryCode := xl.Range(CountryColumn . A_Index + 1).Value
		CaseStatus 	:= xl.Range(CaseColumn . A_Index + 1).Value
		IssueDate 	:= xl.Range(IssueColumn . A_Index + 1).Value

		; This is always the same whether it is Patent or Trademark, Live or AT.
		ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := ClientCode
		ie.document.getElementByID("fldstrCountry_TextBox").Value 	 := CountryCode
		ie.document.getElementByID("flddteBaseDate").Value 			 := Today	
		
	if CountryCode = WO			; Meaning PCT App or Madrid
		{
		if PageType < 3		
			ie.document.getElementByID("fldstrActionType_TextBox").Value := Actions[1]
		else
			ie.document.getElementByID("fldstrActionType_TextBox").Value := Actions[6]		
		}
	else if CountryCode = US	; Meaning only US applications.
		{
		if PageType < 3 		; Meaning a US Patent.
			{
			if ((CaseStatus != "") || (IssueDate != "")) 	; This means it is Issued or has an Issue Date.
				ie.document.getElementByID("fldstrActionType_TextBox").Value := Actions[4]
			else											; This means it isn't Issued 
				ie.document.getElementByID("fldstrActionType_TextBox").Value := Actions[3]	
			}
		else					; Meaning a US Trademark or TTAB.
			{
			; TTAB can end in : IUS, M, N, TIS, ZTUS 
			; TM can end in   : T, TUS, TD1, T2, TFC, IUS 
			
			; US TMs are too complicated! I might need to set them all aside so they can be manually managed 
			; individually at the end instead of guessing which actions to use. Ask Danika what approach to take.
			
			; How do we tell if it is Inactive? Would status be Abandoned?
			; For Renewal LC date, when is this action used? Only on Registered? What is the base date? Today?
			
			; ,"US-TM TRANIN"					; US Trademark Pending				; nope		Actions[8] 
			; ,"US-TM TRANIN INACTIVE KMO"		; US Trademark Inactive				; nope		Actions[9] 
			; ,"US-TM TRANIN RENEWAL LC DATE"	; US TM Renewal LC Date				; nope		Actions[10]
			; ,"US-TTAB TRANIN"]				; US TTAB							; nope		Actions[11]
			
			MsgBox, US TMs and TTAB to are too difficult to determine programmatically! 
			}
		}
	else
		{
		if PageType < 3 	; Meaning an INTL Patent. (non-WO)
			ie.document.getElementByID("fldstrActionType_TextBox").Value := Actions[2]	
		else				; Meaning an INTL Trademark. (non-WO)
			{
			if AssignFA = 1 ; Meaning the "Assign FA?" checkbox was checked.
				{
				ie.document.getElementByID("fldstrActionType_TextBox").Value := Actions[7] 	; TRANIN Assign FA
				
			; 	This is if we want to add remarks to each action. Commented out for now.
			;	ie.document.getElementByID("fldstrRemarks").Value := "test remarks"	
				
				Sleep 200
				ie.document.getElementByID("btnSave").Click()
				Sleep 1000
				ie.Navigate(Sites[PageType])
				while ie.busy or ie.ReadyState != 4
					Sleep, 100		
				ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := ClientCode
				ie.document.getElementByID("fldstrCountry_TextBox").Value 	 := CountryCode
				ie.document.getElementByID("flddteBaseDate").Value 			 := Today	
				ie.document.getElementByID("fldstrActionType_TextBox").Value := Actions[5]	; Normal TRANIN action. Always used?
				}			
			else
				ie.document.getElementByID("fldstrActionType_TextBox").Value := Actions[5]	; Normal TRANIN action. Always used?
			}			
		}
			; 	This is if we want to add remarks to each action. Commented out for now.
			;	ie.document.getElementByID("fldstrRemarks").Value := "test remarks"	

		Sleep 200
		ie.document.getElementByID("btnSave").Click()	; This clicks the Save button.
		Sleep 1000
		}
	return
	}
MsgBox, 0, And we're done!, You should now have the action(s) docketed on every record.
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

GuiClose:
ExitApp