#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
Menu, Tray, Icon, pifmgr.dll, 14
Enabled := ComObjError(false)

FileRead, ImportedInfo, C:\Users\Tyler.Dickson\Downloads\IP Portfolio.txt

MsgBox, % ImportedInfo

ImportedInfo := StrReplace(ImportedInfo, "`r`n`r`n", "`t")
ImportedInfo := StrReplace(ImportedInfo, "`r`n", " ")
ImportedInfo := StrSplit(ImportedInfo, "`t")

CleanedInfo := ""

Loop % ImportedInfo.Length()
	{

	if Mod(A_Index, 11) = 0
		ImportedInfo[A_Index] := ImportedInfo[A_Index] . "`n"
	else
		ImportedInfo[A_Index] := ImportedInfo[A_Index] . "`t"
	
	CleanedInfo := CleanedInfo . ImportedInfo[A_Index]
	}
	
Clipboard := CleanedInfo

return

