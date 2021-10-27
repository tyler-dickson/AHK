#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 63

global ie
global ClientCode
global PriorGUIControl
global TDTDTD
Computername := A_Username

if Computername = lara.anabtawi
	Computername = lara.hamdan
if Computername = neysa.perkins
	Computername = neysa.cabudol
if Computername = jessica.george
	Computername = jessica.egigian
if Computername = sabrina.fleming
	Computername = sabrina.kellogg

if Computername = tyler.dickson
	goto OpenGUI
if Computername = paul.traska
	goto OpenGUI
if Computername = nick.lamb
	goto OpenGUI
if Computername = long.dang
	goto OpenGUI
	
formattime, Today, , yyyy-MM-dd	
IniRead, TodaysPerson, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\EP Validation.ini, Schedule, %Today%


if (TodaysPerson = ComputerName)
	{
	TrayTip, Access granted., `nYou are scheduled to use the Bibliographic Data Duplicator today.`n`nOpening script now.
	Sleep 4000
	TrayTip
	}
else
	{
	TrayTip, Access denied., `nYou aren't scheduled to use the Bibliographic Data Duplicator today.`n`nContact Kristin if this is incorrect.
	Sleep 4000
	TrayTip
	ExitApp
	}

	
OpenGUI:
Gui, New, Owner AlwaysOnTop, Bibliographic Data Duplicator

Gui, Add, GroupBox, cBlue x200 y70  h70, Bibliographic Data
Gui, Add, Button, Section +Center x205 y85 w130 gCopyBiblio, Copy Bibliographic Data
Gui, Add, Button, +Center x205 y110 w130 gPasteBiblio, Paste Bibliographic Data

Gui, Add, GroupBox, cBlue x200 y5  h55, Update Country Page
Gui, Add, Button, Section +Center x205 y20 w130 h35 gUpdateCountry, Update Client Code

Gui, Add, GroupBox, cBlue x5 y5 w191 h135, Copy Invention Screen
Gui, Add, Button, +Center     x8 y20 w23 h23 gUpdateInventionCode, AL
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, AT
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, BA
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, BE
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, BG
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, CH
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, CY
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, CZ

Gui, Add, Button, +Center     x8 y43 w23 h23 gUpdateInventionCode, DE
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, DK
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, EE
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, ES
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, FI
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, FR
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, GB
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, GR

Gui, Add, Button, +Center     x8 y66 w23 h23 gUpdateInventionCode, HR
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, HU
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, IE
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, IS
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, IT
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, LI
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, LT
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, LU

Gui, Add, Button, +Center     x8 y89 w23 h23 gUpdateInventionCode, LV
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, MC
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, ME
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, MK
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, MT
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, NL
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, NO
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, PL

Gui, Add, Button, +Center    x8 y112 w23 h23 gUpdateInventionCode, PT
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, RO
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, RS
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, SE
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, SI
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, SK
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, SM
Gui, Add, Button, +Center  xp+23 yp  wp  hp  gUpdateInventionCode, TR

Gui, Add, Button, Center x86 yp+30 w173 hp gHideNotes, ↓ Show Validation Information ↓
Gui, Add, Tab, x5 yp+25 w335 h230, Notes|Designation/Family Info
Gui, Add, Button, x223 y167 w50 h20 gGrabValidationData, GRAB
Gui, Add, Button, x278 y167 w50 h20 gResetValidationData, RESET
Gui, Add, Edit, Limit x10 yp+25 w325 h200,
Gui, Tab, 2
Gui, Add, ListView, Checked Grid -Multi r40 x10 yp w325 h200 gEditValidationInfo,  |Country|Type|Status|
Gui, Add, Button, x223 y167 w50 h20 gGrabValidationData, GRAB
Gui, Add, Button, x278 y167 w50 h20 gResetValidationData, RESET
Gui, Add, StatusBar,, 

GuiControl, Hide, SysListView321
GuiControl, Hide, SysTabControl321
GuiControl, Hide, Edit1
GuiControl, Hide, Button48
GuiControl, Hide, Button49
GuiControl, Hide, Button50
GuiControl, Hide, Button51
Gui, Show, w345 h188
SetTimer, CloseAttyWindow, 100
OnMessage(0x200, "Help")
return


GrabValidationData:
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
var := ie.LocationURL ;grab current url	
Var2:=ie.document.GetElementsByTagName("TD").length
TrayTip, Grabbing Designation/Family Info, Grabbing Designation/Family Info.
TDCount = 0
Loop %Var2%
{
TDTDTD := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText    ;Get InnerText 
ifinstring, TDTDTD, % "RemarksCase"
	TDCount++
if TDCount = 5
	break
}
StringSplit, TDTDTD, TDTDTD, `n
LV_Delete()

Loop %TDTDTD0%
{
if A_Index < 3
	continue
else
	{
	StringMid, Country%A_Index%, TDTDTD%A_Index%, 1, 2
	StringMid, CaseType%A_Index%, TDTDTD%A_Index%, 3, 3
	StringMid, ValidationInfo%A_Index%, TDTDTD%A_Index%, 6, 100	
	;MsgBox, % Country%A_Index% " | " CaseType%A_Index% " | " ValidationInfo%A_Index%

	LV_Add( , , Country%A_Index% , CaseType%A_Index%, ValidationInfo%A_Index% )
	LV_ModifyCol( 1 , "AutoHdr")
	LV_ModifyCol( 2 , "AutoHdr")
	LV_ModifyCol( 3 , "AutoHdr")
	LV_ModifyCol( 4 , "AutoHdr")
	}
}

;MsgBox, end of loop.
TrayTip, Validation Data Grabbed, Validation data has been stored.
SetTimer, CloseToolTip, 2500
return


ResetValidationData:
LV_Delete()
;GuiControl, , Edit1, 
return

/*
;CleanValidationData:
LV_Delete()
GuiControlGet, ValidationInfo, , Edit1

;MsgBOx, %ValidationInfo%
StringReplace, ValidationInfo, ValidationInfo, Generate this country.,`n, All
StringReplace, ValidationInfo, ValidationInfo, `n, , 
StringReplace, ValidationInfo, ValidationInfo, `n`n,`n, All
StringSplit, ValidationInfo, ValidationInfo, `n, 
;MsgBOx, %ValidationInfo0% | %ValidationInfo1% 1 | %ValidationInfo2% 2 | %ValidationInfo3% 3| %ValidationInfo4% 4| %ValidationInfo5% 5| %ValidationInfo6% 6| %ValidationInfo7% 7|
GuiControl, , Edit1, %ValidationInfo%


Loop %ValidationInfo0%
{
StringSplit, SplitInfo%A_Index%, ValidationInfo%A_Index%, %A_Space%
;MsgBox % SplitInfo%A_Index%0
if SplitInfo%A_Index%0 = 0
	{}
else
	{
	LV_Add( Check, , SplitInfo%A_Index%2 ,  SplitInfo%A_Index%3, SplitInfo%A_Index%4 " " SplitInfo%A_Index%5 " " SplitInfo%A_Index%6  )
	LV_ModifyCol( 1 , "AutoHdr")
	LV_ModifyCol( 2 , "AutoHdr")
	LV_ModifyCol( 3 , "AutoHdr")
	LV_ModifyCol( 4 , "AutoHdr")
	}
}

return
*/


EditValidationInfo:
if A_GuiEvent = DoubleClick
	LV_GetText(ValidationNumber, A_EventInfo, 4)
Clipboard := ValidationNumber
ToolTip, %Clipboard% copied to Clipboard. Use Ctrl + V to paste.
SetTimer, CloseToolTip, 2500
return

CloseToolTip:
SetTimer, CloseToolTip, Off
ToolTip
return

HideNotes:
hidden := !hidden
	if hidden = 1
		{
		Gui, Show, w345 h425
		GuiControl, Show, SysListView321
		GuiControl, Show, Edit1
		GuiControl, , Button47, ↑ Hide Validation Information ↑
		GuiControl, Show, Button48
		GuiControl, Show, Button49
		GuiControl, Show, Button50
		GuiControl, Show, Button51
		GuiControl, Show, SysTabControl321
		}
	else
		{
		Gui, Show, w345 h188
		GuiControl, Hide, SysListView321
		GuiControl, Hide, Edit1
		GuiControl, , Button47, ↓ Show Validation Information ↓
		GuiControl, Hide, Button48
		GuiControl, Hide, Button49
		GuiControl, Hide, Button50
		GuiControl, Hide, Button51
		GuiControl, Hide, SysTabControl321
		}
return	



CloseAttyWindow:
IfWinExist, Attorneys -- Webpage Dialog                ;  ahk_class #32770                   ;Message from webpage
	WinClose, Attorneys -- Webpage Dialog
return

UpdateInventionCode:
Country := A_GuiControl
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ClientCode := ie.document.getElementByID("fldstrCaseNumber").Value
Sleep 200
StringSplit, SecondPart, ClientCode, .
Sleep 200
	ifinstring, SecondPart2, EP
		StringReplace, SecondPart2, SecondPart2, EP, %Country%, All,
	else
		StringReplace, SecondPart2, SecondPart2, % PriorGuiControl, %Country%, All,
Sleep 200
NewClientCode := SecondPart1 "." SecondPart2
Sleep 200
ie.Document.getElementById("btnCopy").Click()
Sleep 1750
ie.document.getElementByID("fldstrCaseNumber").Value := NewClientCode
Clipboard := NewClientCode
PriorGuiControl := A_GuiControl
TrayTip, Client Code Updated., The Client Code should now have %Country% instead of EP.`n`nIf it didn't work`, I've updated your Clipboard so you can paste the new Client Code with Ctrl + V.
Sleep 3500
TrayTip
return

UpdateCountry:
ValPend := "Val Pend"
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
CaseType := ie.document.getElementByID("fldstrCaseType_TextBox").Value
PCTNumber := ie.document.getElementByID("fldstrParentPCTNumber").Value
PatentNumber := ie.document.getElementByID("fldstrPatNumber").Value
Sleep 200
StringSplit, SecondPart, ClientCode, .
Sleep 200
StringReplace, SecondPart2, SecondPart2, EP, %Country%, All,
Sleep 200
NewClientCode := SecondPart1 "." SecondPart2
Sleep 200
	ifinstring, Country, EP
		{
		MsgBox, 0, You're on an EP record!, You're supposed to use this on your Validated state records, not the EP record!`n`nCheck the record you're on and try again!
		return
		}
	ifinstring, CaseType, EDV
		{
		ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := NewClientCode
		ie.document.getElementById("btnEdit").Click()
		TrayTip, Client Code Updated., The Client Code should now have %Country% instead of EP.`n`nThe Case Type is still EDV.
		Sleep 2500
		TrayTip
		}
	else ifinstring, PCTNumber, PCT
		{
		CaseType := "EPP"
		ie.document.getElementByID("fldstrCaseType_TextBox").Value := CaseType 
		ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := NewClientCode
		ie.document.getElementById("btnEdit").Click()
		TrayTip, Client Code Updated., The Client Code should now have %Country% instead of EP.`n`nThe Case Type has been updated to EPP.
		Sleep 2500
		TrayTip
		}
	else ifinstring, PCTNumber, % "" ,
		{
		ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := NewClientCode
		ie.document.getElementById("btnEdit").Click()
		TrayTip, Client Code Updated., The Client Code should now have %Country% instead of EP.`n`nWas this an NPhase based on a PCT filing?`nIt wouldn't hurt to check`, just in case.
		Sleep 4000
		TrayTip
		}
return

CopyBiblio:
;Gui, Hide
ie := ""
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ClientCode := ie.document.getElementByID("fldstrCaseNumber").Value
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
PriorityDate := ie.document.getElementByID("flddtePriDate").Value
FilingDate := ie.document.getElementByID("flddteFilDate").Value
PubDate := ie.document.getElementByID("flddtePubDate").Value
RegDate := ie.document.getElementByID("flddteRegDate").Value
LastRenewal := ie.document.getElementByID("flddteLastRenewalDate").Value
NextRenewal := ie.document.getElementByID("flddteNextRenewalDate").Value
AllowanceDate := ie.document.getElementByID("flddteAllowanceDate").Value
ClosedDate := ie.document.getElementByID("flddteClosedDate").Value
2ndPubDate := ie.document.getElementByID("flddtePubDate_2").Value
IssueDate  := ie.document.getElementByID("flddteIssDate").Value
ParentPCTDate := ie.document.getElementByID("flddteParentPCTDate").Value
ParentIssueDate := ie.document.getElementByID("flddteParentIssDate").Value
ExpirationDate := ie.document.getElementByID("flddteExpDate").Value
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
BaseDate := ie.document.getElementByID("flddteBaseDate").Value
Remarks := ie.document.getElementByID("fldstrRemarks").Value
TrayTip, Biblio Copied., Bibliographic data has been stored.
;msgbox, % ie
;MsgBox, %ClientCode%

OutputVar = http://oc-docketing/CPiAgent/patschCountryApplicationAgent.aspx
params := [OutputVar, 65536]   ;32 
ie.Navigate(params*)
Sleep 500
ie := WBGet()
	;Sleep, 500
	while ie.busy ;  or ie.ReadyState != 4 ;Wait for page to load
		Sleep, 100
ie.Document.All.schstrCaseNumber_TextBox.Value := ClientCode
ie.Document.All.btnStartSearch.Click()
Sleep 100
ie2.Visible := True
WinActivate, ahk_class IEFrame

;SwitchSystem()
Sleep 2000
TrayTip
return

PasteBiblio:
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ie.Document.getElementById("btnEdit").Click()
ie.document.getElementByID("flddtePriDate").Value := PriorityDate
ie.document.getElementByID("flddteFilDate").Value := FilingDate
ie.document.getElementByID("flddtePubDate").Value := PubDate
ie.document.getElementByID("flddteRegDate").Value := RegDate
ie.document.getElementByID("flddteLastRenewalDate").Value := LastRenewal
ie.document.getElementByID("flddteNextRenewalDate").Value := NextRenewal
ie.document.getElementByID("flddteAllowanceDate").Value := AllowanceDate
ie.document.getElementByID("flddteClosedDate").Value := ClosedDate
ie.document.getElementByID("flddtePubDate_2").Value := 2ndPubDate
ie.document.getElementByID("flddteIssDate").Value := IssueDate
ie.document.getElementByID("flddteParentPCTDate").Value := ParentPCTDate
ie.document.getElementByID("flddteParentIssDate").Value := ParentIssueDate
ie.document.getElementByID("flddteExpDate").Value := ExpirationDate
TrayTip, Biblio Pasted., Bibliographic data has been pasted.
Sleep 2000
TrayTip
return

SwitchSystem()
{
;MsgBox, %ClientCode%
OutputVar = http://oc-docketing/CPiAgent/patschCountryApplicationAgent.aspx
params := [OutputVar, 65536]   ;32 
ie.Navigate(params*)
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 500
ie2 := WBGet()
while ie2.busy or ie2.ReadyState != 4 ;Wait for page to load
	Sleep, 500
ie2.Document.All.schstrCaseNumber_TextBox.Value := ClientCode
ie2.Document.All.btnStartSearch.Click()
Sleep 100
ie2.Visible := True
WinActivate, ahk_class IEFrame
return

; PCIRA.034CND4


MyString := FrontString . AppString
Run iexplore.exe  %MyString% 
Clipboard = %OldClipboard%
AppString = ;
FrontString = ;
return
}

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


Help(wParam, lParam, Msg) {
MouseGetPos,,,, OutputVarControl
IfEqual, OutputVarControl, Button2
	Help := "This will store the current Bibliographic Information and open Audit Trail."
else IfEqual, OutputVarControl, Button3
	Help := "This will inject your stored Bibliographic Information into Audit Trail."
else IfEqual, OutputVarControl, Button5
	Help := "This will replace EP in the Client Code with the new country."

else IfEqual, OutputVarControl, Button7
	Help := "This copies the Invention Screen, and then updates the Country to AL."

else IfEqual, OutputVarControl, Button8
	Help := "This copies the Invention Screen, and then updates the Country to AT."	
	
else IfEqual, OutputVarControl, Button9
	Help := "This copies the Invention Screen, and then updates the Country to BA."

else IfEqual, OutputVarControl, Button10
	Help := "This copies the Invention Screen, and then updates the Country to BE."

else IfEqual, OutputVarControl, Button11
	Help := "This copies the Invention Screen, and then updates the Country to BG."

else IfEqual, OutputVarControl, Button12
	Help := "This copies the Invention Screen, and then updates the Country to CH."

else IfEqual, OutputVarControl, Button13
	Help := "This copies the Invention Screen, and then updates the Country to CY."

else IfEqual, OutputVarControl, Button14
	Help := "This copies the Invention Screen, and then updates the Country to CZ."

else IfEqual, OutputVarControl, Button15
	Help := "This copies the Invention Screen, and then updates the Country to DE"

else IfEqual, OutputVarControl, Button16
	Help := "This copies the Invention Screen, and then updates the Country to DK."

else IfEqual, OutputVarControl, Button17
	Help := "This copies the Invention Screen, and then updates the Country to EE."

else IfEqual, OutputVarControl, Button18
	Help := "This copies the Invention Screen, and then updates the Country to ES."
	
else IfEqual, OutputVarControl, Button19
	Help := "This copies the Invention Screen, and then updates the Country to FI."	
	
else IfEqual, OutputVarControl, Button20
	Help := "This copies the Invention Screen, and then updates the Country to FR."	
	
else IfEqual, OutputVarControl, Button21
	Help := "This copies the Invention Screen, and then updates the Country to GB."

else IfEqual, OutputVarControl, Button22
	Help := "This copies the Invention Screen, and then updates the Country to GR."

else IfEqual, OutputVarControl, Button23
	Help := "This copies the Invention Screen, and then updates the Country to HR."

else IfEqual, OutputVarControl, Button24
	Help := "This copies the Invention Screen, and then updates the Country to HU."

else IfEqual, OutputVarControl, Button25
	Help := "This copies the Invention Screen, and then updates the Country to IE."

else IfEqual, OutputVarControl, Button26
	Help := "This copies the Invention Screen, and then updates the Country to IS."	

else IfEqual, OutputVarControl, Button27
	Help := "This copies the Invention Screen, and then updates the Country to IT."

else IfEqual, OutputVarControl, Button28
	Help := "This copies the Invention Screen, and then updates the Country to LI."

else IfEqual, OutputVarControl, Button29
	Help := "This copies the Invention Screen, and then updates the Country to LT."

else IfEqual, OutputVarControl, Button30
	Help := "This copies the Invention Screen, and then updates the Country to LU."

else IfEqual, OutputVarControl, Button31
	Help := "This copies the Invention Screen, and then updates the Country to LV."

else IfEqual, OutputVarControl, Button32
	Help := "This copies the Invention Screen, and then updates the Country to MC."

else IfEqual, OutputVarControl, Button33
	Help := "This copies the Invention Screen, and then updates the Country to ME."

else IfEqual, OutputVarControl, Button34
	Help := "This copies the Invention Screen, and then updates the Country to MK."

else IfEqual, OutputVarControl, Button35
	Help := "This copies the Invention Screen, and then updates the Country to MT."

else IfEqual, OutputVarControl, Button36
	Help := "This copies the Invention Screen, and then updates the Country to NL."

else IfEqual, OutputVarControl, Button37
	Help := "This copies the Invention Screen, and then updates the Country to NO."

else IfEqual, OutputVarControl, Button38
	Help := "This copies the Invention Screen, and then updates the Country to PL."

else IfEqual, OutputVarControl, Button39
	Help := "This copies the Invention Screen, and then updates the Country to PT."

else IfEqual, OutputVarControl, Button40
	Help := "This copies the Invention Screen, and then updates the Country to RO."	
	
else IfEqual, OutputVarControl, Button41
	Help := "This copies the Invention Screen, and then updates the Country to RS."	
	
else IfEqual, OutputVarControl, Button42
	Help := "This copies the Invention Screen, and then updates the Country to SE."		
	
else IfEqual, OutputVarControl, Button43
	Help := "This copies the Invention Screen, and then updates the Country to SI."		

else IfEqual, OutputVarControl, Button44
	Help := "This copies the Invention Screen, and then updates the Country to SK."	

else IfEqual, OutputVarControl, Button45
	Help := "This copies the Invention Screen, and then updates the Country to SM."	

else IfEqual, OutputVarControl, Button46
	Help := "This copies the Invention Screen, and then updates the Country to TR."		

else IfEqual, OutputVarControl, Button47
	Help := "This will hide/show the saved Validation Information section below."	

	
else IfEqual, OutputVarControl, Button48
	Help := "This will clean the info you pasted and update the Cleaned Data tab."	
else IfEqual, OutputVarControl, Button50
	Help := "This will clean the info you pasted and update the Cleaned Data tab."	
	
else IfEqual, OutputVarControl, Button49
	Help := "This will reset any data you've pasted and clear the Cleaned Data tab."	
else IfEqual, OutputVarControl, Button51
	Help := "This will reset any data you've pasted and clear the Cleaned Data tab."	
	

else IfEqual, OutputVarControl, Edit1
	Help := "Paste your Validation information in here, then click CLEAN to update."	
else IfEqual, OutputVarControl, SysListView321
	Help := "Double-click a row to copy the Status if you need the Application #."		
	
else IfEqual, OutputVarControl, msctls_statusbar321
	Help := "This is just a status bar. It will update when you hover over stuff."		
	
;else IfEqual, OutputVarControl, SysTabControl321
;	Help := "This can't tell the difference between the tabs, so this should be blank."		
	
	
	
SB_SetText(Help)
}

GuiClose:
ExitApp
return
