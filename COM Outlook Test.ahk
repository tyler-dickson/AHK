#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Enabled := ComObjError(false)

MsgBox % "There are " . ComObjActive("Outlook.Application").COMAddIns.Count . " COM add ins."


Gui, New,
Gui, Add, Edit, vMyInput, 
Gui, Add, Button, gSubmit, Submit
Gui, Show
return

Submit:
Gui, Submit, NoHide
MY_INPUT := 2
xl :=	ComObj("Excel.Application")
 , xlSheet :=	xl.ActiveWorkbook.Sheets(1)
 , xlRng :=	xl.Sheet.Range[xl.Sheet.Cells(2,1),xl.Sheet.Cells(4,4)]
MsgBox %	xl.WorksheetFunction.VLOOKUP(MY_INPUT,xlRng,2,FALSE) "`n"
		 . xl.WorksheetFunction.VLOOKUP(MY_INPUT,xlRng,3,FALSE) "`n"
		 . xl.WorksheetFunction.VLOOKUP(MY_INPUT,xlRng,4,FALSE)*1000