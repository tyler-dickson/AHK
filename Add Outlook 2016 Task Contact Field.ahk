#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

RegWrite, REG_DWORD, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Outlook\Preferences, SHOWCONTACTFIELDOBSOLETE, 1
MsgBox, , Contact Field Added to Outlook 2016, Registry updated!`n`nYou will now have the Contact field on a new Task in Outlook 2016.
return
