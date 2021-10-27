#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)


formattime, Today, , MMddyy          ; yyyy-MM-dd

PriorNumber := "Priority Number:"
PriorDate := "Priority Date:"

Gui, New, , Docketing Information Check
Gui, Add, ActiveX, x0 y0 w650 h500 vie2, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
ie2.Navigate("http://kmobnetold/outsidekmobnet/cid/cidold/ClientList.aspx")  ; This is specific to the web browser control.
Gui, Show, w650 h500
SetTimer, Append, 1000
return

#5::
Append:
Action := ""
Action2 := ""
ClientCode := ""
Country := ""

ie := WBGet()
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
;SplashTextOn, 400, 200, %ClientCode%, %ClientCode%

Website := "http://kmobnet/insidekmobnet/Patent_TM_Reports/facesheet.cfm?&casenumber=" . ClientCode
params := [Website, 64]
ie2.Navigate(params*)	
Sleep 500
Info := ""
BaseNumber := ""
var := ie2.LocationURL ;grab current url	
Var2 := ie2.document.GetElementsByTagName("TD").length
;SplashTextOn, 400, 200, %Var2%,  %Var2%
	Loop %Var2%
	{
	NewInfo := ie2.document.GetElementsByTagName("TD")[A_Index-1].InnerText
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
	}
Country := ie.document.getElementByID("fldstrCountryName").Value
ifinstring, Country, Priority
	return
else if Action = 
	return	
else
	ie.document.getElementByID("fldstrCountryName").Value := Country . " | " . Action . " | " . Action2
	
SplashTextOff
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

