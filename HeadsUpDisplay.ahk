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
Gui, Font, s108  ; Set a large font size (32-point).
Gui, Add, Text, gPicture vMyText cRed x0 y0, XXXXX YYYYY  | %Clipboard% ; XX & YY serve to auto-size the window.
; Make all pixels of this color transparent and make the text itself translucent (150):
WinSet, TransColor, %CustomColor% 
SetTimer, UpdateOSD, 1000
Gosub, UpdateOSD  ; Make the first update immediate rather than waiting for the timer.
Gui, Show, x500 y500 w800 NoActivate  ; NoActivate avoids deactivating the currently active window.
return

Picture:
;PostMessage, 0xA1, 2,,, A
return

UpdateOSD:
Test := ""
Emailemail := ""
NumberOfEmails = 0
;mail := ComObjActive("Outlook.Application").GetNameSpace("MAPI").GetDefaultFolder(6)
;mail := ComObjActive("Outlook.Application").GetNameSpace("MAPI").GetSharedDefaultFolder("Instructions.Mailbox", olFolder)
mail := ComObjActive("Outlook.Application").GetNameSpace("MAPI").GetSharedDefaultFolder(Outlook.Recipient, olFolder)
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
	NumberOfEmails++
	ifinString, Emailemail, page
		Test := "PCT APP! " NumberOfEmails
}

MouseGetPos, MouseX, MouseY
GuiControl,, MyText, %Test% ; X%MouseX%, Y%MouseY%,  Emails: %NumberOfEmails%
return

GuiClose:
Gui, Destroy
return


#s::
FileDelete, test
Sleep 1000
FileAppend, %ClipboardAll%, test.txt
return

F12:: ; https://msdn.microsoft.com/en-us/vba/outlook-vba/articles/taskitem-object-outlook
;example of creating a MailItem and setting it's format to HTML
TestDate := "12/8/16"
TestNames := "Tyler.Dickson; Eddie.Monroy"
olTaskItem := 3
TaskItem := ComObjActive("Outlook.Application").CreateItem(olTaskItem)  ; olTaskItem, olPostItem, olTaskItem, olNoteItem, olContactItem, olJournalItem
olFormatPlainText := 1  ; HTML = 2, Plain = 1, Rich = 3, Unspecified = 0
TaskItem.BodyFormat := olFormatPlainText
TaskItem.Subject := "Test Task Name"
TaskItem.StartDate := TestDate
TaskItem.DueDate := TestDate
TaskItem.ContactNames := TestNames
TaskItem.Body := Clipboard
TaskItem.Display
FileRead, testVar, test
Clipboard := testVar
TrayTip, blah, blah
sleep 2000
TrayTip

return



/*
olAppointmentItem   1 
olContactItem   2 
olDistributionListItem   7 
olJournalItem   4 
olMailItem   0 
olNoteItem   5 
olPostItem   6 
olTaskItem   3 
*/


F10::
Gui, Add, Text, xm ym w325 Section, Select the Outlook item you wish to create:
Gui, Add, ListBox, r6 xs wp AltSubmit gItemSelection vitem,  Mail||Appointment|Contact|Task|Journal|Note|Post|Distribution List
Gui, Add, Button, xs+295 gCreateItem, OK
Gui, Show, AutoSize Center, Create New Outlook Item
return

ItemSelection:
CreateItem:
if	(A_ThisLabel="ItemSelection" && A_GuiEvent<>"DoubleClick")
	return
Gui, Submit, NoHide
item.Subject := "This is a test."
ComObjActive("Outlook.Application").CreateItem[item-1].GetInspector.Display()
;Gui, Destroy
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