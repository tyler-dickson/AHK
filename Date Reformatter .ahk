#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, shell32.dll , 232
#SingleInstance, Force

TrayTip, Date Formatter Activated, Highlight date`, then press both Control keys!
return

LControl & RControl::
Clipboard = ;
SendInput ^c
ClipWait, .2
NewClipboard = %Clipboard%
year := SubStr(NewClipboard, 8,4)
month := SubStr(NewClipboard, 4, 3) 
day := SubStr(NewClipboard, 1,2)
if month = Jan
	newmonth = January
else if month = Feb
	newmonth = February
else if month = Mar
	newmonth = March
else if month = Apr
	newmonth = April
else if month = May
	newmonth = May
else if month = Jun
	newmonth = June
else if month = Jul
	newmonth = July
else if month = Aug
	newmonth = August
else if month = Sep
	newmonth = September
else if month = Oct
	newmonth = October
else if month = Nov
	newmonth = November
else if month = Dec
	newmonth = December

Clipboard := newmonth " " day ", " year
TrayTip, Date reformatted., %NewClipboard% | %Clipboard%
return
