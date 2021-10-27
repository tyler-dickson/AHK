#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)


#`::
Clipboard := ""
Sleep 100
SendInput ^c
ClipWait, 1
StringLeft, ClientPart, Clipboard, 4
StringRight, IsAPeriod, ClientPart, 1
	if (IsAPeriod = ".")
		StringLeft, ClientPart, Clipboard, 3
Gui, New, , Exception List ; Resize
Gui, Add, ListView, NoSortHdr Grid -Multi r50 w640, Client|Exception|
gosub GrabData

Loop
{
;MsgBox, % A%A_Index%  ClientPart
ifinstring, A%A_Index%, %ClientPart%
		{
		MsgBox, 1 ,% "Your query was: " Clipboard ". I found: " A%A_Index% ".", % "Here is what the Exception List says for this client:`n`n" B%A_Index% "`n`nIs this a false positive? Did I find the wrong client?`n`nClick OK to open the Exception List to double-check, or click Cancel to close."
		ifMsgBox OK
		Gui, Show
		LV_Modify((A_Index - 1), "Select")
		break
		}
;	}
NumBlanks++
	if (NumBlanks > 500)
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
FilePath := "H:\Docketing\Exception List.xls" ; example path
oWorkbook := ComObjGet(FilePath) ; access Workbook object

Loop
{
Test := oWorkbook.Sheets(1).Range("A" . A_Index).Value ; get value from A1 cell in first sheet
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
	A%A_Index% := oWorkbook.Sheets(1).Range("A" . A_Index).Value ; get value from A1 cell in first sheet	
	B%A_Index% := oWorkbook.Sheets(1).Range("B" . A_Index).Value ; get value from A1 cell in first sheet
	LV_Add("", A%A_Index%, B%A_Index%)	
	;LV_Modify(A_Index, "Vis")
	}
}
LV_ModifyCol()
LV_ModifyCol(1, "Logical")
return

