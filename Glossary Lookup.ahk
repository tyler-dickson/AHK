#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)



#1::
Clipboard := ""
Sleep 100
SendInput ^c
ClipWait, 1
StringLeft, ActionPart, Clipboard, 20
Gui, New, , Action Glossary ; Resize
Gui, Add, ListView, Grid -Multi r50 w640, Action|Face?|
gosub GrabData
;Gui, Show

Loop
{
;MsgBox, % A%A_Index%  ClientPart
ifinstring, PAT%A_Index%, %ActionPart%
;	{
;	if A%A_Index% = 
;		{
;		MsgBox, No match. Opening List.
;		Gui, Show
;		break
;		}
;	else
		{
		MsgBox, 1 ,% "Your query was: " Clipboard ". I found: " PAT%A_Index% ".", % "Your query was:`t" Clipboard "`nI found:`t`t" PAT%A_Index% "`n`nHere is what the International Glossary says for this action: " PAT2%A_Index% "`n`nFalse positive? Click OK to open Exception List to confirm."
		ifMsgBox OK
		Gui, Show
		LV_Modify((A_Index - 1), "Select")
		break
		}
;	}
NumBlanks++
	if (NumBlanks > 2000)
		{
		TrayTip, No match found., No match found. Opening Exception List to confirm.
		Sleep 2000
		Gui, Show
		TrayTip
		break
		}
}
return

GrabData:
NumBlanks = 0
LV_Delete()
FilePath := "H:\Docketing\International Glossary.xlsx" ; example path
oWorkbook := ComObjGet(FilePath) ; access Workbook object

Loop
{
Test := oWorkbook.Sheets(1).Range("A" . A_Index).Value ; get value from A1 cell in first sheet
;MsgBOx, %Test%
if (Test = "")
	{
	NumBlanks++
	if (NumBlanks > 2 )
		break
	}
if (Test = "CLIENT")
	{
	;Result := "Reached the bottom."
	;break
	}
else
	{
	PAT%A_Index% := oWorkbook.Sheets(1).Range("A" . A_Index).Value ; get value from A1 cell in first sheet	
	PAT2%A_Index% := oWorkbook.Sheets(1).Range("I" . A_Index).Value ; get value from A1 cell in first sheet
	LV_Add("", PAT%A_Index%, PAT2%A_Index%)	
	;LV_Modify(A_Index, "Vis")
	}
}
LV_ModifyCol()
LV_ModifyCol(1, "Logical")
return
















/*
#z::
CardValue := "Card15"

FilePath := "C:\Users\" A_Username "\Desktop\Poker AHK Stuff.xlsx" ; example path
oWorkbook := ComObjGet(FilePath) ; access Workbook object

Loop
{
Test := oWorkbook.Sheets(1).Range("A" . A_Index).Value ; get value from A1 cell in first sheet
if (Test = CardValue)
	{
	Result := oWorkbook.Sheets(1).Range("E" . A_Index).Value ; get value from A1 cell in first sheet
	break
	}
if (Test = "")	
	{
	Result := "Reached the bottom."
	break
	}
}
MsgBox, %Result%
return

*/