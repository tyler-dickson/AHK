#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, Shell32.dll, 18

Number = 3090

Site := "http://kmobnet/insidekmobnet/shared/directory2.cfm?employeeid=" Number
SiteImage := "http://oc-knobbetools/intranet/images/employee_pics/large/" Number ".jpg"

If !FileExist(A_Desktop "\Downloaded Images")
	FileCreateDir, Downloaded Images

Gui, Add, ActiveX, x0 y0 w200 h230 vie, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
Gui, Add, Edit, w100 Center vCurrentPage, %Number%
Gui, Add, Button, yp x105 gIncreaseNumber, /\
Gui, Add, Button, yp x135 gGrab, Grab
Gui, Add, ActiveX, w0 h0 x-100 y-100 vie2, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
ie.Navigate(Site)  ; This is specific to the web browser control.
ie2.Navigate(SiteImage)  ; This is specific to the web browser control.
Gui, Show
Sleep 500
gosub Grab
return

GuiClose:
ExitApp
return

Grab:
Gui, Submit, NoHide
Sleep 500
IMGS := ie2.document.GetElementsBytagname("IMG").length

if IMGS = 1
	{
	TempName := ie.document.GetElementsBytagname("FONT")[0].InnerText
	
		if TempName = Notary
			TempName := ie.document.GetElementsBytagname("FONT")[1].InnerText
	
	UrlDownloadToFile, %SiteImage%, % A_Desktop "\Downloaded Images\" CurrentPage " - " TempName ".jpg"
	Sleep 1000
	gosub IncreaseNumber
	Sleep 500
	gosub Grab
	}
else
	{
	gosub IncreaseNumber
	Sleep 500
	gosub Grab
	}
return

IncreaseNumber:
Number++
Sleep 250
Site := "http://kmobnet/insidekmobnet/shared/directory2.cfm?employeeid=" Number
SiteImage := "http://oc-knobbetools/intranet/images/employee_pics/large/" Number ".jpg"
GuiControl, , Edit1, %Number%
ie.Navigate(Site)  ; This is specific to the web browser control.
ie2.Navigate(SiteImage)  ; This is specific to the web browser control.
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
