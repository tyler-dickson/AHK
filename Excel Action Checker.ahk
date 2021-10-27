#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, pifmgr.dll, 30
Enabled := ComObjError(false)

xl := ComObjActive("Excel.Application")

Sleep 1000

DocumentName := % xl.ActiveWorkbook.Name

offset = 2
TotalRows = 0

OA = 0
FinalOA = 0
RestrictionRequirement = 0
AdvisoryAction = 0

while (xl.Range("A" . A_Index + offset).Value != "") 
	{
	value := xl.Range("B" . A_Index + offset).Value

	/*
	Office Action
	Final OA
	Restriction Requirement
	Advisory Action
	*/

	if InStr(value, "Office Action")
		OA++
	else if InStr(value, "Final OA")
		FinalOA++
	else if InStr(value, "Restriction Requirement")
		RestrictionRequirement++
	else if InStr(value, "Advisory Action")
		AdvisoryAction++
		
	TotalRows++	
	}

TotalCount := OA + FinalOA + RestrictionRequirement + AdvisoryAction
	
Results = 
(
Filename: %DocumentName%

Total Rows Counted:`t%TotalRows%
----------------------------------------------
Office Actions:`t`t%OA%
Final Office Actions:`t%FinalOA%
Restriction Requirements:`t%RestrictionRequirement%
Advisory Actions:`t`t%AdvisoryAction%
----------------------------------------------
Count of All Actions:`t%TotalCount%
)
	
MsgBox, 0, Excel Search Results, % Results
ExitApp
return