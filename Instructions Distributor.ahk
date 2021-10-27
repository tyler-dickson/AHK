#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, pifmgr.dll, 31
Enabled := ComObjError(false)

; https://www.slipstick.com/developer/working-vba-nondefault-outlook-folders/

; https://docs.microsoft.com/en-us/office/vba/api/outlook.folder

; https://docs.microsoft.com/en-us/office/vba/api/outlook.explorer.currentfolder

; https://docs.microsoft.com/en-us/office/vba/api/outlook.mailitem



Agents 	 := []
Assigned := []

!Space::
StartPoint = 1
xl := ComObjActive("Excel.Application")
SelectedItems := COMObjActive("Outlook.Application").ActiveExplorer.Selection
SelectedCount := SelectedItems.Count

Loop
	{	
	TempAgent 	:= xl.Range("G" . A_Index + 1).Value
	TempAssigned := xl.Range("H" . A_Index + 1).Value	
	if TempAgent != 
		{
		Agents.Push(TempAgent)
		Assigned.Push(TempAssigned)
		}
	else if TempAgent = FORUS
		break	
	else
		break
	}

Loop
	{	
	Temp := xl.Range("A" . A_Index).Value

	if Temp !=
		StartPoint++
	else
		break
	}

AgentNum := 1
for each in SelectedItems
	{
	Address := each.SenderEmailAddress
	From 	:= each.SenderName
	Subj 	:= each.Subject   
	Categ 	:= each.Categories
	Size 	:= each.Size
	Body 	:= each.Body
	Count	:= each.Count
	Sent 	:= each.SentOn ; ReceivedTime
	Size := Floor(Size / 1000) ; Convert from bytes to kilobytes and round down.

	ifinstring, Subj, HANBEV
		each.Categories := "FORUS"
	else
		{
		each.Categories := Agents[AgentNum]
		AgentNum := AgentNum < Agents.Length() ? AgentNum + 1 : 1
		}
		
;	MsgBox, % From " | " Subj " | " Size " | " Sent " | " NewCateg

	xl.Range("A" . StartPoint).Value := From
	xl.Range("B" . StartPoint).Value := Subj
	xl.Range("C" . StartPoint).Value := Size . "KB"
	xl.Range("D" . StartPoint).Value := Sent
	xl.Range("E" . StartPoint).Value := each.Categories
		
	StartPoint++
	}
return







;if instr((Name := ComObjType(ComObjActive("Outlook.Application").ActiveWindow, "Name")), "Inspector")
;	OpenEmail := COMObjActive("Outlook.Application").ActiveInspector.CurrentItem
;else if instr(Name, "Explorer")
;	{
;	OpenEmail := COMObjActive("Outlook.Application").ActiveExplorer.Selection.Item(1)
;	SelectedItems := COMObjActive("Outlook.Application").ActiveExplorer.Selection.Count
;	FolderItems := COMObjActive("Outlook.Application").ActiveExplorer.CurrentFolder.Items
;	FolderCount := FolderItems.Count
;	FolderName := COMObjActive("Outlook.Application").ActiveExplorer.CurrentFolder.Name
;	Unread := COMObjActive("Outlook.Application").ActiveExplorer.CurrentFolder.UnReadItemCount
;	}
;OpenEmail := COMObjActive("Outlook.Application").ActiveExplorer.Selection.Item(1)




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