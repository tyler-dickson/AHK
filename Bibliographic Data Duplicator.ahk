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
Gui, New, Owner AlwaysOnTop

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

;Gui, Add, Edit, x5 yp+50 w500 h300, Test


Gui, Add, StatusBar,, 
Gui, Show, w345
SetTimer, CloseAttyWindow, 100
OnMessage(0x200, "Help")
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
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
CaseType := ie.document.getElementByID("fldstrCaseType_TextBox").Value
PCTNumber := ie.document.getElementByID("fldstrParentPCTNumber").Value
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
	else ifinstring, PCTNumber, % " " ,
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
	
SB_SetText(Help)
}

GuiClose:
ExitApp
return
