#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, pifmgr.dll, 20
ComputerName = %A_Username%

^#!Space::
Clipboard = 
Sleep 200
SendInput ^c
ClipWait, 1
IfinString, Clipboard, Description
	gosub iManageColumnRemover
else
	gosub PairFormatter
return

iManageColumnRemover:
FileDelete, C:\Users\%Computername%\PAIRTemp.txt
FileDelete, C:\Users\%Computername%\PAIRTempCleaned.txt
FileAppend, %Clipboard%, C:\Users\%Computername%\PAIRTemp.txt
Sleep 500
FileRead, SavedContent, C:\Users\%Computername%\PAIRTemp.txt
StringSplit, SavedContent, SavedContent, `n

MsgBox, 4, Include Document #?, Do you want to include the Document #?

Loop %SavedContent0%
{
StringSplit, Columns, SavedContent%A_Index%, `t
	ifMsgBox Yes
		CleanedColumns = % Columns1 "`t"  Columns3 "`t" Columns6 "`t" Columns7    ; "`t" Columns6 . "." . Columns7
	ifMsgBox No
		CleanedColumns = % Columns1 "`t"  Columns6 "`t" Columns7                   ; "`t" Columns6 . "." . Columns7
ifNotInString, Columns9, Edit Time
	FileAppend, %CleanedColumns%`n, C:\Users\%Computername%\PAIRTempCleaned.txt
}
FileRead, Clipboard, C:\Users\%Computername%\PAIRTempCleaned.txt
TrayTip, Columns removed!, Formatted information added to Clipboard.`nPaste into Excel template to proceed.
Sleep 3000
TrayTip
return

PairFormatter:
InputBox, CustomerNumber, Private PAIR Customer Number, Enter the Customer Number from Private PAIR., , 300, 137
FileDelete, C:\Users\%Computername%\PAIRTemp.txt
FileDelete, C:\Users\%Computername%\PAIRTempCleaned.txt
FileAppend, %Clipboard%, C:\Users\%Computername%\PAIRTemp.txt
Sleep 500
FileRead, SavedContent, C:\Users\%Computername%\PAIRTemp.txt
StringSplit, SavedContent, SavedContent, `n
Sleep 200
;LoopAmount := SavedContent0 - 1

Loop %SavedContent0%        ; %LoopAmount%
{
PreviousLoop := (A_Index - 1)
StringMid, AppNo%A_Index%,      SavedContent%A_Index%,  1, 8 
StringMid, DocType%A_Index%,    SavedContent%A_Index%, 16, 16 
StringMid, DocDate%A_Index%,    SavedContent%A_Index%, 32, 10
StringMid, ClientCode%A_Index%, SavedContent%A_Index%, 50, 50

if AppNo%A_Index% = %A_Space%%A_Space%%A_Space%%A_Space%%A_Space%%A_Space%%A_Space%%A_Space%
	AppNo%A_Index% = % AppNo%PreviousLoop%
else 
	AppNo%A_Index% = % AppNo%A_Index%
	
CleanedContent = % CustomerNumber "`t" AppNo%A_Index% "`t" DocType%A_Index% "`t" DocDate%A_Index% "`t" ClientCode%A_Index% "`n" 
FileAppend, %CleanedContent%, C:\Users\%Computername%\PAIRTempCleaned.txt
}
FileRead, Clipboard, C:\Users\%Computername%\PAIRTempCleaned.txt
TrayTip, Formatting updated!, Formatted information added to Clipboard.`nPaste into Excel template to proceed.
Sleep 3000
TrayTip
return

Escape:
ExitApp
