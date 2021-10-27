#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 119

global ReadyToPaste = 0

Gui, 1: New, , CID Thingamabob
Gui, 1: Add, Text, 	 x5 y5 w180 Center v1 gStatic, Client
Gui, 1: Add, Button, x5 y20 w180 gButton, %ClientCode%
Gui, 1: Add, Text,   x5 y55 w180 Center v2 gStatic, Contact Name
Gui, 1: Add, Button, x5 y70 w180 gButton, %ContactName%
Gui, 1: Add, Text,   x5 y105 w180 Center v3 gStatic, Job Title
Gui, 1: Add, Button, x5 y120 w180 gButton, %JobTitle%
Gui, 1: Add, Text,   x5 y155 w180 Center v4 gStatic, Company
Gui, 1: Add, Button, x5 y170 w180 gButton, %Company%
Gui, 1: Add, Text,   x5 y205 w180 Center v5 gStatic, Address
Gui, 1: Add, Button, x5 y220 w180 h60 gButton, %Address%
Gui, 1: Add, Text,   x5 y290 w180 Center v6 gStatic, Billing Address
Gui, 1: Add, Button, x5 y305 w180 h60 gButton, %BillingAddress%
Gui, 1: Add, Text,   x5 y375 w180 Center v7 gStatic, Mailing Address
Gui, 1: Add, Button, x5 y390 w180 h60 gButton, %MailingAddress%
Gui, 1: Add, Text,   x5 y455 w180 Center v8 gStatic, City/State/ZIP
Gui, 1: Add, Button, x5 y470 w180 gButton, %CityStateZip%
Gui, 1: Add, Text,   x5 y505 w180 Center v9 gStatic, Phone Number
Gui, 1: Add, Button, x5 y520 w180 gButton, %Phone%
Gui, 1: Add, Text,   x5 y555 w180 Center v10 gStatic, Fax Number
Gui, 1: Add, Button, x5 y570 w180 gButton, %Fax%
Gui, 1: Add, Text,   x5 y605 w180 Center v11 gStatic, Email Address
Gui, 1: Add, Button, x5 y620 w180 gButton, %Email%

;Gui, 1: Add, Edit,   x190 y22 w300 h208 vBusinessCardExport,
;Gui, 1: Add, Button, x295 y5 w80 gOpenCID, Open CID
;Gui, 1: Add, Button, x300 y232 w150 gExport, Export to Business Card
Gui, 1: Add, Button, x193 y620 w80 gClearInfo, Restart
Gui, 1: Add, Button, x695 y640 w10 gExpand, >>					;Button13

Gui, 1: Add, ActiveX, x10 y665 w1000 h385 vie2, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
ie2.Navigate("http://kmobnetold/outsidekmobnet/cid/cidold/ClientList.aspx")  ; This is specific to the web browser control.
;Gui, 1: Add, Text, x218 y261 , Saved Clients:
;Gui, 1: Add, ComboBox, x300 y258 w117 Sort gSavedURL vSavedURL, HANBEV|QVID|TEST|TEST2|TEST3
;Gui, 1: Add, Button, x424 y258 w10 gGotoURL, Go

Gui, 1: Add, Text, x200 y25 w275 h15, 1
Gui, 1: Add, Edit, xp+25 yp+15 w250 h20, `n
Loop 14 {
;Position := A_Index * 25
Gui, 1: Add, Text, xp-25 yp+25 w275 h15, % A_Index + 1
Gui, 1: Add, Edit, xp+25 yp+15 w250 h20, `n

}
Gui, 1: Add, Button, x248 y0 w80 gGrabLCFields, Grab LC Fields	;Button14
Gui, 1: Add, Button, x372 y0 w80 gSetLCFields, Set LC Fields	;Button15

Gui, 1: Add, Text, 	 x515 y5 w200 Center, Client Code
Gui, 1: Add, Button, x515 yp+15 w200 gButton, %ClientCode% 		;Button16

Gui, 1: Add, Text, 	 x515 yp+30 w200 Center, Assignee
Gui, 1: Add, Button, x515 yp+15 w200 gButton, 		;Button16

Gui, 1: Add, Text, 	 x515 yp+30 w200 Center, Applicant
Gui, 1: Add, Button, x515 yp+15 w200 gButton, 		;Button16


Gui, 1: Add, Text,   x515 	yp+30 w120 Center, Priority #
Gui, 1: Add, Text,   xp+120 yp w80 Center, Priority Date
Gui, 1: Add, Button, x515 	yp+15 w120 gButton, 
Gui, 1: Add, Button, xp+120 yp w80 gButton, 

Gui, 1: Add, Text,   x515 	yp+30 w120 Center, Application #
Gui, 1: Add, Text,   xp+120 yp w80 Center, Filing Date
Gui, 1: Add, Button, x515 	yp+15 w120 gButton, 
Gui, 1: Add, Button, xp+120 yp w80 gButton, 

Gui, 1: Add, Text,   x515 	yp+30 w120 Center, Publication #
Gui, 1: Add, Text,   xp+120 yp w80 Center, Publication Date
Gui, 1: Add, Button, x515 	yp+15 w120 gButton, 
Gui, 1: Add, Button, xp+120 yp w80 gButton, 

Gui, 1: Add, Text,   x515 	yp+30 w120 Center, 2nd Publication #
Gui, 1: Add, Text,   xp+120 yp w80 Center, 2nd Pub Date
Gui, 1: Add, Button, x515 	yp+15 w120 gButton, 
Gui, 1: Add, Button, xp+120 yp w80 gButton, 

Gui, 1: Add, Text,   x515 	yp+30 w120 Center, Patent/Registration #
Gui, 1: Add, Text,   xp+120 yp w80 Center, Issue/Reg Date
Gui, 1: Add, Button, x515 	yp+15 w120 gButton, 
Gui, 1: Add, Button, xp+120 yp w80 gButton, 

Gui, 1: Add, Text,   x515 	yp+30 w120 Center, Parent/PCT #
Gui, 1: Add, Text,   xp+120 yp w80 Center, Parent/PCT Date
Gui, 1: Add, Button, x515 	yp+15 w120 gButton, 
Gui, 1: Add, Button, xp+120 yp w80 gButton, 

Gui, 1: Add, Text,   x515 	yp+30 w120 Center, Parent Patent #
Gui, 1: Add, Text,   xp+120 yp w80 Center, Parent Issue Date
Gui, 1: Add, Button, x515 	yp+15 w120 gButton, 
Gui, 1: Add, Button, xp+120 yp w80 gButton, 

Gui, 1: Add, Edit, x515 yp+30 w200 h180 vPlainText,


OnMessage(0x200, "Help")
Gui, 1: Show, w720 h850

SetTimer, PersistBiblio, 1000
SetTimer, GrabClientCode, 1000
gosub ClearInfo
return

Help(wParam, lParam, Msg) {
MouseGetPos,,,, OutputVarControl
Loop 15 
	{
	NewOffset := A_Index + 11
	IfEqual, OutputVarControl, Static%NewOffset%  ; 26
		{
		GuiControlGet, Help, , Static%NewOffset% 
		StringLen, HelpLength, Help
		if (HelpLength < 50) 
			Help := ""
		}
	}
ToolTip % Help
}

Static:
GuiControlGet, Temp16,  , Edit16
GuiControlGet, Clicked, , Button%A_GuiControl%
	if (Temp16 == "")
		GuiControl, , Edit16, %Clicked%
	else
		GuiControl, , Edit16, %Temp16%`n%Clicked%

return

GrabLCFields:
gosub ClearInfo
BlankSpots := ""
Loop  
{
Offset := A_Index + 11
ControlGetText, TempStatic,  % "WindowsForms10.STATIC.app.0.1a6f050_r81_ad2" . A_Index, ahk_exe WINWORD.EXE
ControlGetText, Temp,  % "WindowsForms10.EDIT.app.0.1a6f050_r81_ad2" . A_Index, ahk_exe WINWORD.EXE
	
if (TempStatic == "") 
	{
	break
	}
if (Temp == "")
	{
	GuiControl, 1: Show, Static%Offset%
	GuiControl, 1: Show, Edit%A_Index%
	GuiControl, 1: , Static%Offset%, %TempStatic%
	GuiControl, 1: , Edit%A_Index%, %Temp%
	BlankSpots++
	}
else 
	{
	GuiControl, 1: Show, Static%Offset%
	GuiControl, 1: Show, Edit%A_Index%
	GuiControl, 1: , Static%Offset%, %TempStatic%
	GuiControl, 1: , Edit%A_Index%, %Temp%
	BlankSpots++
	}
}
return


SetLCFields:
Loop %BlankSpots%
	{
	GuiControlGet, Temp, , Edit%A_Index%
	ControlSetText, % "WindowsForms10.EDIT.app.0.1a6f050_r81_ad2" . A_Index, %Temp%, ahk_exe WINWORD.EXE
	}
return

ClearInfo:
Loop 15 
{
Offset := A_Index + 11
GuiControl, 1: , Edit%A_Index%,
GuiControl, 1: Hide, Edit%A_Index%
GuiControl, 1: , Static%Offset%, % A_Index
GuiControl, 1: Hide, Static%Offset%
}

ie2.Navigate("http://kmobnetold/outsidekmobnet/cid/cidold/ClientList.aspx")  ; This is specific to the web browser control.
BlankSpots := ""
return

Expand:
toggle := !toggle
	if toggle
		{
		Gui, Show, w1000
		GuiControl, , Button13, <<
		}
	else
		{
		Gui, Show, w720
		GuiControl, , Button13, >>
		}
return

Button:
Loop 15 
	{
	GuiControlGet, Temp, , Edit%A_Index%
		if (Temp == "")
			{
			GuiControl, , Edit%A_Index%, %A_GuiControl%
			break
			}
	}
return

SelectedText := A_GuiControl
ReadyToPaste = 1
MsgBox, %SelectedText% %ReadyToPaste%
;ControlSetText, % "WindowsForms10.EDIT.app.0.1a6f050_r81_ad2" . "1", % A_GuiControl, ahk_exe WINWORD.EXE
return

GrabClientCode:
ie := WBGet()
;while ie.busy or ie.ReadyState != 4 ;Wait for page to load
;	Sleep, 100
URL := ie.LocationURL ;grab current url
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
ClientCodeTM := ie.document.getElementByID("fldstrCaseNumber").Value
;Attorneys := ie.document.getElementByID("fldstrAttorneys").Value

	if ClientCode = 
		Stored := ClientCodeTM
	else if ClientCodeTM = 
		Stored := ClientCode
	if (ClientCode := "") && (ClientCodeTM := "")
		Stored := ""
	
;TrayTip, Grabbed Client Code, %ClientCode% | %ClientCodeTM% | %url%
GuiControl, 1: , Button16, %Stored%
GuiControl, 1: , Button17, % ie.document.getElementByID("fldstrOwnerName").Value
GuiControl, 1: , Button18, % ie.document.getElementByID("fldstrApplicant").Value
GuiControl, 1: , Button19, % ie.document.getElementByID("fldstrPriNumber").Value
GuiControl, 1: , Button20, % ie.document.getElementByID("flddtePriDate").Value
GuiControl, 1: , Button21, % ie.document.getElementByID("fldstrAppNumber").Value
GuiControl, 1: , Button22, % ie.document.getElementByID("flddteFilDate").Value
GuiControl, 1: , Button23, % ie.document.getElementByID("fldstrPubNumber").Value
GuiControl, 1: , Button24, % ie.document.getElementByID("flddtePubDate").Value
GuiControl, 1: , Button25, % ie.document.getElementByID("fldstrPubNumber2").Value
GuiControl, 1: , Button26, % ie.document.getElementByID("flddtePubDate_2").Value

PatNum := ie.document.getElementByID("fldstrPatNumber").Value
RegNum := ie.document.getElementByID("fldstrRegNumber").Value
if (PatNum != "")
	GuiControl, 1: , Button27, %PatNum%
else GuiControl, 1: , Button27, %RegNum%
	
IssDate := ie.document.getElementByID("flddteIssDate").Value
RegDate := ie.document.getElementByID("flddteRegDate").Value
if (PatNum != "")
	GuiControl, 1: , Button28, %IssDate%
else GuiControl, 1: , Button28, %RegDate%

GuiControl, 1: , Button29, % ie.document.getElementByID("fldstrParentPCTNumber").Value
GuiControl, 1: , Button30, % ie.document.getElementByID("flddteParentPCTDate").Value
GuiControl, 1: , Button31, % ie.document.getElementByID("fldstrParentPatNumber").Value
GuiControl, 1: , Button32, % ie.document.getElementByID("flddteParentIssDate").Value

return

PersistBiblio:
;ie2 := WBGet()
;var := ie2.LocationURL ;grab current url
;while ie2.busy or ie2.ReadyState != 4 ;Wait for page to load
;	Sleep, 100
ClientCode := ie2.document.getElementByID("txtClientCode").Value
ContactName := ie2.document.getElementByID("txtContactName").Value
JobTitle := ie2.document.getElementByID("txtTitleJob").Value
Company := ie2.document.getElementByID("txtCompany").Value
Address := ie2.document.getElementByID("txtAddress").Value
BillingAddress := ie2.document.getElementByID("txtAddressBilling").Value
MailingAddress := ie2.document.getElementByID("txtAddressMailing").Value
City := ie2.document.getElementByID("txtCity").Value
State := ie2.document.getElementByID("txtState").Value
ZIP := ie2.document.getElementByID("txtZip").Value
Phone := ie2.document.getElementByID("txtBusinessPhone").Value
Fax := ie2.document.getElementByID("txtFax").Value
Email := ie2.document.getElementByID("txtEmail").Value
CityStateZip := City ", " State " " ZIP
GuiControl, 1: , Button1, %ClientCode%
GuiControl, 1: , Button2, %ContactName%
GuiControl, 1: , Button3, %JobTitle%
GuiControl, 1: , Button4, %Company%
GuiControl, 1: , Button5, %Address%
GuiControl, 1: , Button6, %BillingAddress%
GuiControl, 1: , Button7, %MailingAddress%
GuiControl, 1: , Button8, %CityStateZip%
GuiControl, 1: , Button9, %Phone%
GuiControl, 1: , Button10, %Fax%
GuiControl, 1: , Button11, %Email%
return

GuiClose:
ExitApp
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
