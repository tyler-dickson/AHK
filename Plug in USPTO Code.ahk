#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
Enabled := ComObjError(false)

F2::
CoordMode, Mouse, Client
CustomColor = EEAA99  ; Can be any RGB color (it will be made transparent below).
Gui +LastFound +AlwaysOnTop +Caption +ToolWindow +Resize ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Color, %CustomColor%
Gui, Font, s12  ; Set a large font size (32-point).
Gui, Add, Text, gPicture vMyText cRed x0 y0, XXXXX YYYYY  | %Clipboard% ; XX & YY serve to auto-size the window.
; Make all pixels of this color transparent and make the text itself translucent (150):
;WinSet, TransColor, %CustomColor% 
SetTimer, UpdateOSD, 1000
Gui, Show, x500 y500 w800 NoActivate  ; NoActivate avoids deactivating the currently active window.
return

Picture:
;PostMessage, 0xA1, 2,,, A
return

UpdateOSD:
Test := ""
Emailemail := ""
NumberOfEmails = 0
mail := ComObjActive("Outlook.Application").GetNameSpace("MAPI").GetDefaultFolder(6)
;mail := ComObjActive("Outlook.Application").GetNameSpace("MAPI").GetSharedDefaultFolder("Instructions.Mailbox", olFolder)
;mail := ComObjActive("Outlook.Application").GetNameSpace("MAPI").GetSharedDefaultFolder(Outlook.Recipient, olFolder)
oExp := ComObjActive("Outlook.Application").ActiveExplorer
MyItems := mail.Items
MyItems.Sort("[Received]", true)
 
for MailItem, in  MyItems {
; Or
;Loop, % MyItems.Count {
;    MailItem := MyItems.Item(A_Index)
    ;oExp.ClearSelection
   ; oExp.AddToSelection(MailItem)
   ; MsgBox, 4, Confirm Step, % "Item " A_Index " selected with subject " MailItem.Subject ".`nContinue?"
	Emailemail := MailItem.Subject
	Emailbody  := MailItem.Body

	;MsgBox, % MailItem.Subject.Category.Name
	NumberOfEmails++
	ifinString, Emailemail, authentication
		{
		StringSplit, emailbody, emailbody, `n
		StringSplit, testtest, emailbody4, %A_Space%
		StringReplace, AuthCode, testtest5, ., % ""

		MsgBox, %AuthCode%
		
		Test := AuthCode 
		SetTimer, UpdateOSD, 15000
		}
}

MouseGetPos, MouseX, MouseY
GuiControl,, MyText, %Test% ; X%MouseX%, Y%MouseY%,  Emails: %NumberOfEmails%
return

GuiClose:
Gui, Destroy
return

!Space::

Loop 10

{
if instr((Name := ComObjType(ComObjActive("Outlook.Application").ActiveWindow, "Name")), "Inspector")
	OpenEmail := COMObjActive("Outlook.Application").ActiveInspector.CurrentItem
else if instr(Name, "Explorer")
   OpenEmail := COMObjActive("Outlook.Application").ActiveExplorer.Selection.Item(1)
   
Address := OpenEmail.SenderEmailAddress
From := OpenEmail.SenderName
Subj := OpenEmail.Subject   
Categ := OpenEmail.Categories
Size := OpenEmail.Size

;MsgBox, %Address% | %From% | %Subj% | %Categ% | %Size% | `n`n %Body%

Size := Floor(Size / 1000) ; Convert from bytes to kilobytes and round down.

if Size > 100
	OpenEmail.Categories := "Huge"
else if (Size < 99 && Size > 36)
	OpenEmail.Categories := "Medium"
else if Size < 35
	OpenEmail.Categories := "Small"	

OpenEmail.Subject  := "Email " A_Index

;OpenEmail.Categories := "test" A_Index
;OpenEmail.Body := "body" A_Index

Sleep 1000
SendInput, {Down}


;SendInput, {Down}
}

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