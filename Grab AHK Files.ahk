#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
formattime, RightNow, , yyyy-MM-dd hh.mm.ss          ; yyyy-MM-dd

StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}
if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder


Loop, Files, C:\Users\%Computername%\*.ahk, FR
	{
	TempFile = %A_LoopFileFullPath%
	StringReplace, TempFile, TempFile, `, , \
	
	if DiagnosticData != 
		DiagnosticData := DiagnosticData "`n" TempFile
	else
		DiagnosticData := TempFile
	}
	
FileAppend, %DiagnosticData%, % "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\\" Computername " - " RightNow ".csv"

return
