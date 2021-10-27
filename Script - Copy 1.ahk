#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 43

^Space::
Clipboard = 
SendInput, ^c
ClipWait, .2

if InStr(Clipboard, ",") || InStr(Clipboard, "-")
	{
	SelectedDate := Clipboard
	Clipboard := ReformatDate(SelectedDate)
	TrayTip, Date reformatted | %Clipboard%, Go ahead and paste it somewhere.
	}
else 
	{
	SelectedNumber := Clipboard
	Clipboard := AddCommas(SelectedNumber)
	TrayTip, Number reformatted | %Clipboard%, Go ahead and paste it somewhere.
	}
return


!/::
FormatTime, Today, , yyyy-MM-dd
Send, %Today%
return


^5::

TestText = 
(
Dear Colleagues,

As a courtesy we are forwarding you a copy of the **** that we received from the United States Patent and Trademark Office in the above referenced patent.

If you have any questions or wish additional information, please contact us.

Best Regards,
)

Send, %TestText%
return

!o::
FormatTime, Today, , MMMM d, yyyy
TestText = 
(
Dear Colleagues:

We are pleased to report the ***** were filed on %Today% with the United States Patent and Trademark Office in the above-referenced patent application. Copies of the documents are attached. 

We will continue to keep you advised as further developments occur.  If you have any questions or wish additional information, please contact us.

Best regards,

)

Send, %TestText%
return

!f::
FormatTime, Today, , MMMM d, yyyy
TestText = 
(
Dear Colleagues,

We are pleased to report the **** were filed on %Today% in the above referenced patent application.  Copies of the documents as filed and the invoice will follow via email.

We will continue to keep you advised as further developments occur.  If you have any questions or wish additional information, please contact us.

Best Regards,
)

Send, %TestText%
return

;;;;; Function to convert DD-MMM-YYYY to Month Day, Year & reformat Inventor names.
ReformatDate(Datedate) {
if InStr(Datedate, "20")
	{
	year := SubStr(Datedate, 8,4)
	month := SubStr(Datedate, 4, 3) 
	day := SubStr(Datedate, 1,2)
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

	if SubStr(day, 1, 1) = 0
		day := SubStr(day, 2, 1)
																	
	Datedate := newmonth " " day ", " year
	return Datedate
	}
else if InStr(Datedate, ",")
	{
	Inventor := StrSplit(Datedate, ",")
	Inventor[1] := Trim(Inventor[1])
	Inventor[2] := Trim(Inventor[2])
	Datedate := Inventor[2] " " Inventor[1]
	TrayTip, Inventor reformatted. Go ahead and paste it now.,  %Datedate%
	return Datedate
	}
return
}

;;;;; Function to update format on US App/Patent Numbers. May behave strangely on non-US formats.
AddCommas(Numnum) {
if InStr(Numnum, "/")
	{
	Spl := StrSplit(Numnum)
	Numnum := Spl[1] Spl[2] Spl[3] Spl[4] Spl[5] Spl[6] "," Spl[7] Spl[8] Spl[9]
	}
else
	Numnum := RegExReplace(Numnum, "(\d)(?=(?:\d{3})+(?:\.|$))", "$1,")

return Numnum
}

