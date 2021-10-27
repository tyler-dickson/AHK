;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                              ;;
;;            If you're here to fix your shortcuts,             ;;
;;       scroll all the way to the end! (hit Ctrl + End)        ;;
;;     Make sure you don't modify anything except the values    ;;
;;          at the bottom under the "Shortcuts" heading.        ;;
;;                                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;#SingleInstance, Force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;global ComputerName := %A_Username%
;IniWrite, %A_Username%, C:\Users\%ComputerName%\Desktop\test.ini, Username, ComputerName

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;     Sets Username for Remarks      ;;
;;             CTRL + 3               ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^3::
ComputerName = %A_Username%
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
NewComputerName = %ComputerName%
Sleep 200
if NewComputerName = ERROR
	{
	Gui, Add, Text, x10 y9 w200 h60 +Center, What is your Windows username? `n`n Open the Start Menu. `nYou can see it at the top. 
	Gui, Add, Edit, x10 y75 w200 h20 Limit +Center vComputerName, %ComputerName%
	Gui, Add, Button, x70 y104 w80 h30 Default gaUpdate , Update
	Gui, Show, w220 h140, Update Windows Username
	return
	}
else

IniRead, Username, C:\Users\%ComputerName%\Desktop\test.ini, Username, Username
IniRead, ComputerName, C:\Users\%ComputerName%\Desktop\test.ini, Username, ComputerName
IniRead, ATDate, C:\Users\%ComputerName%\Desktop\test.ini, Username, ATDate
Sleep 200
Gui, New, +AlwaysOnTop, Update Username
Gui, Add, Text, x10 y9 w200 h60 +Center, Computer Name is %ComputerName%. `nCurrent Username is %Username%. `nCurrent Remarks Date is %ATDate%.
Gui, Add, Text, x10 y60 w200 h80 +Center,Enter your Computer Name:
Gui, Add, Edit, x10 y75 w200 h20 Limit +Center vComputerName, %ComputerName%
Gui, Add, Text, x10 y98 w200 h80 +Center,Enter your Username for Remarks:
Gui, Add, Edit, x10 y113 w200 h20 Limit +Center vUsername, %Username%
Gui, Add, Text, x10 y136 w200 h80 +Center,Enter the Date for Remarks:
Gui, Add, Edit, x10 y151 w200 h20 Limit +Center vATDate, %ATDate%
Gui, Add, Button, x22 y182 w80 h30 Default gaOK , Update
Gui, Add, Button, x122 y182 w80 h30 gCancel , Cancel
if (xpos > 2150) & (ypos > 800)     
     {
     newypos := (ypos - 165)
     newxpos := (xpos - 230)
     Gui, Show, x%newxpos% y%newypos% h224 w224
     return 
     }
else if (ypos > 800)     
     {
     newypos := (ypos - 165)
     ;Msgbox, %newypos%
     Gui, Show, x%xpos% y%newypos% h224 w224
     return     
     }
else if (xpos > 2150)      
     {
     newxpos := (xpos - 230)
     ;Msgbox, %newxpos%
     Gui, Show, x%newxpos% y%ypos% h224 w224
     return     
     }
else
     {
     Gui, Show, x%xpos% y%ypos% h224 w224
	 return
     }
return

aUpdate:
Gui, Submit
Msgbox, Saved Windows username as %ComputerName%.
IniWrite, %ComputerName%, C:\Users\%ComputerName%\Desktop\test.ini, Username, ComputerName
Gui, Destroy
return

aOK:
Gui, Submit
Gui, New, +AlwaysOnTop, Username Updated
Gui, Add, Text,Center , This is how your remarks will now appear:`n`n "%ATDate% - Insert default comments here. -%Username%." `n
;Gui, Add, Button, x22 y99 w80 h30 Default +Center gDone , OK
Gui, Add, Button, w80 h30 Default Center gDone , OK
if (xpos > 2150) & (ypos > 800)
     {
     newypos := (ypos - 200)
     newxpos := (xpos - 400)
     Gui, Show, x%newxpos% y%newypos%
     }
else if (ypos > 800)
     {
     newypos := (ypos - 200)
     ;Msgbox, %newypos%
     Gui, Show, x%xpos% y%newypos%
     }
else if (xpos > 2150) 
     {
     newxpos := (xpos - 400)
     ;Msgbox, %newxpos%
     Gui, Show, x%newxpos% y%ypos%
	 }
else
     Gui, Show, x%xpos% y%ypos%
return

Done:
{
Gui, Destroy
IniWrite, %ComputerName%, C:\Users\%ComputerName%\Desktop\test.ini, Username, ComputerName
IniWrite, %Username%, C:\Users\%ComputerName%\Desktop\test.ini, Username, Username
IniWrite, %ATDate%, C:\Users\%ComputerName%\Desktop\test.ini, Username, ATDate
Return
}

Cancel:
{
Gui, Destroy
Return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                      ;;
;; Multiple Things in Internet Explorer ;;
;;           CTRL + RightClick          ;;
;;   DateExtend,AttyFind,SuggestRemark  ;;
;;                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;#IfWinActive ahk_class IEFrame
^RButton::
global ComputerName
global IntPat = INT-PAT
global IntTM = INT-TM
global year := SubStr(NewClipboard, 8,4)
global month := SubStr(NewClipboard, 4, 3) 
global day := SubStr(NewClipboard, 1,2)
global NewClipboard := Clipboard
global MyMonthCal
global Array
global ATDate
global Username
global TestString
global AttyString
global Hotstring
global Extended
ComputerName = %A_Username%
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
IniRead, ComputerName, C:\Users\%ComputerName%\Desktop\test.ini, Username, ComputerName
NewComputerName = %ComputerName%
Sleep 200
if NewComputerName = ERROR
	{
	Gui, Add, Text, x10 y9 w200 h60 +Center, What is your Windows username? `n`n Open the Start Menu. `nYou can see it at the top. 
	Gui, Add, Edit, x10 y75 w200 h20 Limit +Center vComputerName, %ComputerName%
	Gui, Add, Button, x70 y104 w80 h30 Default gaUpdate , Update
	Gui, Show, w220 h140, Update Windows Username
	return
	}
else

SendInput ^c
Sleep 200
NewClipboard = %Clipboard%

if NewClipboard = ;
	MsgBox, blank clipboard
else if InStr(NewClipboard, "Work")
	{
	SplashTextOn, 300, ,Running AttyEmailFinder()
	Sleep 1000
	SplashTextOff
	AttyEmailFinder()
	return
	}
else if InStr(NewClipboard, "Bill")
	{
	SplashTextOn, 300, ,Running AttyEmailFinder()
	Sleep 1000
	SplashTextOff
	AttyEmailFinder()
	return
	}
else if InStr(NewClipboard, "TMPL")
	{
	SplashTextOn, 300, ,Running AttyEmailFinder()
        Sleep 1000
	SplashTextOff
	AttyEmailFinder()
	return
	}		
else if InStr(NewClipboard, 20)
	{
	;SplashTextOn, 300, ,Running DateExtend()
	;Sleep 1000
	;SplashTextOff
	DateExtend()
	return
	}	
else if InStr(NewClipboard, "INT-TM")
	{
	;SplashTextOn, 300, ,Running SuggestRemarks()
	;Sleep 1000
	;SplashTextOff
	SuggestRemarks()
	return
	}
else if InStr(NewClipboard, "INT-PAT")
	{
	;SplashTextOn, 300, ,Running SuggestRemarks()
	;Sleep 1000
	;SplashTextOff
	SuggestRemarks()
	return
	}
else
	MsgBox, didn't work.
return

DateExtend()
{
CoordMode, Mouse, Screen       ;Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
year := SubStr(NewClipboard, 8,4)
month := SubStr(NewClipboard, 4, 3) 
day := SubStr(NewClipboard, 1,2)

if month = Jan
	newmonth := 01
else if month = Feb
	newmonth := 02
else if month = Mar
	newmonth := 03
else if month = Apr
	newmonth := 04
else if month = May
	newmonth := 05
else if month = Jun
	newmonth := 06
else if month = Jul
	newmonth := 07
else if month = Aug
	newmonth := 08
else if month = Sep
	newmonth := 09
else if month = Oct
	newmonth := 10
else if month = Nov
	newmonth := 11
else if month = Dec
	newmonth := 12

formattedTime := year . newmonth . day
;MsgBox, %formattedTime%
Gui, Add, Text, gText Center , Click here to test clicking text!
Gui, Add, MonthCal, vMyMonthCal, %formattedTime%
Gui, Add, Button, x11 y192 w50 Default gExtend, Extend
Gui, Add, Button, x68 y192 w37 gAdd1, +1M
Gui, Add, Button, x111 y192 w37 gAdd3, +3M
Gui, Add, Button, x154 y192 w37 gAdd6, +6M
Gui, Add, Button, x197 y192 w37 gAdd12, +1Y
NewY := (ypos - 265)
NewX := (xpos - 50)
Gui, Show, x%NewX% y%NewY% , Calendar Selection
Return

Extend:
Gui, Submit
FormatTime, MyMonthCal, %MyMonthCal%, dd-MMM-yyyy
SendInput %MyMonthCal%
Gui, Destroy
return

Add1:
Gui, Submit
;MsgBox, %MyMonthCal%                                 ; shows selected date as YYYYMMDD - 20170106
FormatTime, MyMonthCal, %MyMonthCal%, dd-MMM-yyyy
ifInString, MyMonthCal, Jan                                   
	{
	StringReplace, MyMonthCal, MyMonthCal, Jan, Feb
	ifInString, MyMonthCal, 29
		StringReplace, MyMonthCal, MyMonthCal, 29, 28
	else ifInString, MyMonthCal, 30
		StringReplace, MyMonthCal, MyMonthCal, 30, 28
	else ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 28	
	}	
else ifInString, MyMonthCal, Feb
	StringReplace, MyMonthCal, MyMonthCal, Feb, Mar
else ifInString, MyMonthCal, Mar
	{
	StringReplace, MyMonthCal, MyMonthCal, Mar, Apr
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Apr
	StringReplace, MyMonthCal, MyMonthCal, Apr, May
else ifInString, MyMonthCal, May
	{
	StringReplace, MyMonthCal, MyMonthCal, May, Jun
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Jun
	StringReplace, MyMonthCal, MyMonthCal, Jun, Jul
else ifInString, MyMonthCal, Jul
	{
	StringReplace, MyMonthCal, MyMonthCal, Jul, Aug
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Aug
	{
	StringReplace, MyMonthCal, MyMonthCal, Aug, Sep
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Sep
	StringReplace, MyMonthCal, MyMonthCal, Sep, Oct
else ifInString, MyMonthCal, Oct
	{
	StringReplace, MyMonthCal, MyMonthCal, Oct, Nov
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Nov
	StringReplace, MyMonthCal, MyMonthCal, Nov, Dec
else ifInString, MyMonthCal, Dec
	{
	StringReplace, MyMonthCal, MyMonthCal, Dec, Jan
		ifInString, MyMonthCal, 2016
			StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
		else ifInString, MyMonthCal, 2017
			StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
		else ifInString, MyMonthCal, 2018
			StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
		else ifInString, MyMonthCal, 2019
			StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
		else ifInString, MyMonthCal, 2020
			StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
		else ifInString, MyMonthCal, 2021
			StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
		else ifInString, MyMonthCal, 2022
			StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
		else ifInString, MyMonthCal, 2023
			StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
		else ifInString, MyMonthCal, 2024
			StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
		else ifInString, MyMonthCal, 2025
			StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
		else ifInString, MyMonthCal, 2026
			StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
		else ifInString, MyMonthCal, 2027
			StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
		else ifInString, MyMonthCal, 2028
			StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
		else ifInString, MyMonthCal, 2029
			StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else	
	MsgBox, didn't work.
SendInput %MyMonthCal%
Gui, Destroy
return

Add3:
Gui, Submit
;MsgBox, %MyMonthCal%                                 ; shows selected date as YYYYMMDD - 20170106
FormatTime, MyMonthCal, %MyMonthCal%, dd-MMM-yyyy
ifInString, MyMonthCal, Jan                                   
	{
	StringReplace, MyMonthCal, MyMonthCal, Jan, Apr
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30	
	}	
else ifInString, MyMonthCal, Feb
	StringReplace, MyMonthCal, MyMonthCal, Feb, May
else ifInString, MyMonthCal, Mar
	{
	StringReplace, MyMonthCal, MyMonthCal, Mar, Jun
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Apr
	StringReplace, MyMonthCal, MyMonthCal, Apr, Jul
else ifInString, MyMonthCal, May
	StringReplace, MyMonthCal, MyMonthCal, May, Aug
else ifInString, MyMonthCal, Jun
	StringReplace, MyMonthCal, MyMonthCal, Jun, Sep
else ifInString, MyMonthCal, Jul
	StringReplace, MyMonthCal, MyMonthCal, Jul, Oct
else ifInString, MyMonthCal, Aug
	{
	StringReplace, MyMonthCal, MyMonthCal, Aug, Nov
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Sep
	StringReplace, MyMonthCal, MyMonthCal, Sep, Dec
else ifInString, MyMonthCal, Oct
	{
	StringReplace, MyMonthCal, MyMonthCal, Oct, Jan
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Nov
	{
	StringReplace, MyMonthCal, MyMonthCal, Nov, Feb
	ifInString, MyMonthCal, 29
		StringReplace, MyMonthCal, MyMonthCal, 29, 28
	else ifInString, MyMonthCal, 30
		StringReplace, MyMonthCal, MyMonthCal, 30, 28
	else ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 28	
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Dec
	{
	StringReplace, MyMonthCal, MyMonthCal, Dec, Mar
		ifInString, MyMonthCal, 2016
			StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
		else ifInString, MyMonthCal, 2017
			StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
		else ifInString, MyMonthCal, 2018
			StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
		else ifInString, MyMonthCal, 2019
			StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
		else ifInString, MyMonthCal, 2020
			StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
		else ifInString, MyMonthCal, 2021
			StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
		else ifInString, MyMonthCal, 2022
			StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
		else ifInString, MyMonthCal, 2023
			StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
		else ifInString, MyMonthCal, 2024
			StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
		else ifInString, MyMonthCal, 2025
			StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
		else ifInString, MyMonthCal, 2026
			StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
		else ifInString, MyMonthCal, 2027
			StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
		else ifInString, MyMonthCal, 2028
			StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
		else ifInString, MyMonthCal, 2029
			StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else	
	MsgBox, didn't work.
SendInput %MyMonthCal%
Gui, Destroy
return

Add6:
Gui, Submit
;MsgBox, %MyMonthCal%                                 ; shows selected date as YYYYMMDD - 20170106
FormatTime, MyMonthCal, %MyMonthCal%, dd-MMM-yyyy
ifInString, MyMonthCal, Jan                                   
	StringReplace, MyMonthCal, MyMonthCal, Jan, Jul
else ifInString, MyMonthCal, Feb
	StringReplace, MyMonthCal, MyMonthCal, Feb, Aug
else ifInString, MyMonthCal, Mar
	{
	StringReplace, MyMonthCal, MyMonthCal, Mar, Sep
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Apr
	StringReplace, MyMonthCal, MyMonthCal, Apr, Oct
else ifInString, MyMonthCal, May
	{
	StringReplace, MyMonthCal, MyMonthCal, May, Nov
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	}
else ifInString, MyMonthCal, Jun
	StringReplace, MyMonthCal, MyMonthCal, Jun, Dec
else ifInString, MyMonthCal, Jul
	{
	StringReplace, MyMonthCal, MyMonthCal, Jul, Jan
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}	
else ifInString, MyMonthCal, Aug
	{
	StringReplace, MyMonthCal, MyMonthCal, Aug, Feb
	ifInString, MyMonthCal, 29
		StringReplace, MyMonthCal, MyMonthCal, 29, 28
	else ifInString, MyMonthCal, 30
		StringReplace, MyMonthCal, MyMonthCal, 30, 28
	else ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 28	
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Sep
	{
	StringReplace, MyMonthCal, MyMonthCal, Sep, Mar
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Oct
	{
	StringReplace, MyMonthCal, MyMonthCal, Oct, Apr
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Nov
	{
	StringReplace, MyMonthCal, MyMonthCal, Nov, May
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Dec
	{
	StringReplace, MyMonthCal, MyMonthCal, Dec, Jun
	ifInString, MyMonthCal, 31
		StringReplace, MyMonthCal, MyMonthCal, 31, 30
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else	
	MsgBox, didn't work.
SendInput %MyMonthCal%
Gui, Destroy
return

Add12:
Gui, Submit
;MsgBox, %MyMonthCal%                                 ; shows selected date as YYYYMMDD - 20170106
FormatTime, MyMonthCal, %MyMonthCal%, dd-MMM-yyyy
ifInString, MyMonthCal, Jan
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Feb
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Mar
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Apr
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, May
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Jun
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Jul
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Aug
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Sep
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Oct
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Nov
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else ifInString, MyMonthCal, Dec
	{
	ifInString, MyMonthCal, 2016
		StringReplace, MyMonthCal, MyMonthCal, 2016, 2017
	else ifInString, MyMonthCal, 2017
		StringReplace, MyMonthCal, MyMonthCal, 2017, 2018
	else ifInString, MyMonthCal, 2018
		StringReplace, MyMonthCal, MyMonthCal, 2018, 2019
	else ifInString, MyMonthCal, 2019
		StringReplace, MyMonthCal, MyMonthCal, 2019, 2020
	else ifInString, MyMonthCal, 2020
		StringReplace, MyMonthCal, MyMonthCal, 2020, 2021
	else ifInString, MyMonthCal, 2021
		StringReplace, MyMonthCal, MyMonthCal, 2021, 2022
	else ifInString, MyMonthCal, 2022
		StringReplace, MyMonthCal, MyMonthCal, 2022, 2023
	else ifInString, MyMonthCal, 2023
		StringReplace, MyMonthCal, MyMonthCal, 2023, 2024
	else ifInString, MyMonthCal, 2024
		StringReplace, MyMonthCal, MyMonthCal, 2024, 2025
	else ifInString, MyMonthCal, 2025
		StringReplace, MyMonthCal, MyMonthCal, 2025, 2026
	else ifInString, MyMonthCal, 2026
		StringReplace, MyMonthCal, MyMonthCal, 2026, 2027
	else ifInString, MyMonthCal, 2027
		StringReplace, MyMonthCal, MyMonthCal, 2027, 2028
	else ifInString, MyMonthCal, 2028
		StringReplace, MyMonthCal, MyMonthCal, 2028, 2029
	else ifInString, MyMonthCal, 2029
		StringReplace, MyMonthCal, MyMonthCal, 2029, 2030
	}
else	
	MsgBox, didn't work.
SendInput %MyMonthCal%
Gui, Destroy
return

Text:
MsgBox, You clicked the text.
return

GuiClose:
Gui, Destroy
return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;        Persistent Box on IE        ;;
;;             CTRL + 8               ;;
;;   Press Space or Enter to close.   ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;#IfWinActive ahk_class IEFrame
#Space::
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
IniRead, ComputerName, C:\Users\%ComputerName%\Desktop\test.ini, Username, ComputerName
NewComputerName = %ComputerName%
Sleep 200
if NewComputerName = ERROR
	{
	Gui, Add, Text, x10 y9 w200 h60 +Center, What is your Windows username? `n`n Open the Start Menu. `nYou can see it at the top. 
	Gui, Add, Edit, x10 y75 w200 h20 Limit +Center vComputerName, %ComputerName%
	Gui, Add, Button, x70 y104 w80 h30 Default gaUpdate , Update
	Gui, Show, w220 h140, Update Windows Username
	return
	}
else
WinActivate, ahk_class IEFrame
PersistentBar()
return

PersistentBar()
{
WinGetPos , X, Y, Width, Height, ahk_class IEFrame
NewX := x + 10
NewY := y + 2
Gui, New, +AlwaysOnTop +Owner, Test
Gui, Add, Button, x0 y5 w100 h25 g2Test, Switch System
Gui, Add, Button, x120 y5 w100 h25 g2Cancel, Close
Gui, Show, ,Test
Gui, +ToolWindow -Caption                           ; Removes the Border and Task bar icon
Gui, Color, 000111                                  ; can be any colour but it's good to use a color that is NOT present in ur GUI
;Gui, Show, X%X% Y%Y% h28 w225, Test
Gui, Show, X%NewX% Y%NewY% h28 w225, Test
WinSet, Transcolor, 000111, Test
return
}
	
2Test:
	{
	WinActivate, ahk_class IEFrame
	SwitchSystem()
	;Send ^``
	PersistentBar()
	WinActivate, ahk_class IEFrame
	Gui, Destroy
	return
	}

2Cancel:
	{
;	Gui, Submit
	Gui, Destroy
	MsgBox, , You closed the System Switch button! ,You removed the button!`n`nNow you can't easily switch systems!`n`nPress Window+Space to reopen it!
	Return
	}
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;        Open Shortcut Tips          ;;
;;          CTRL + CapsLock           ;;
;;   Press Space or Enter to close.   ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^CapsLock::
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
IniRead, ComputerName, C:\Users\%ComputerName%\Desktop\test.ini, Username, ComputerName
NewComputerName = %ComputerName%
Sleep 200
if NewComputerName = ERROR
	{
	Gui, Add, Text, x10 y9 w200 h60 +Center, What is your Windows username? `n`n Open the Start Menu. `nYou can see it at the top. 
	Gui, Add, Edit, x10 y75 w200 h20 Limit +Center vComputerName, %ComputerName%
	Gui, Add, Button, x70 y104 w80 h30 Default gaUpdate , Update
	Gui, Show, w220 h140, Update Windows Username
	return
	}
else
ShortcutTips()
return

ShortcutTips()
{
FormatTime, TimeStamp, R
IniRead, Username, C:\Users\%ComputerName%\Desktop\test.ini, Username, Username
SplashTextOn,350 ,310, Quick Shortcuts                                         (Press Enter/ESC to close.), Ctrl+`` = Open Docketing in Opposite System `n Ctrl+1 = Open Hyperlink from Excel `n`n Ctrl+5 = Store Extra Clipboard Items `n Ctrl+6 = Paste Stored Clipboard Items `n`n Ctrl+3 = Set Username for Remarks `n Shift+CapsLock = Paste current date and initials. `n`n Ctrl+= = Create Shortcut Abbreviations `n`n Highlight text, then Ctrl+RightClick:`n     Suggest Action Remarks`n     Extend Docketing Date`n     Generate Attorney Emails
;WinMove, Quick Shortcuts , , 0, 0 ; Move the splash window to the top left corner.
Msgbox
;Sleep 4000
SplashTextOff
Return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;     Store Extra Clipboard Items    ;;
;;             CTRL + 5               ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^5::
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
IniRead, ComputerName, C:\Users\%ComputerName%\Desktop\test.ini, Username, ComputerName
NewComputerName = %ComputerName%
Sleep 200
if NewComputerName = ERROR
	{
	Gui, Add, Text, x10 y9 w200 h60 +Center, What is your Windows username? `n`n Open the Start Menu. `nYou can see it at the top. 
	Gui, Add, Edit, x10 y75 w200 h20 Limit +Center vComputerName, %ComputerName%
	Gui, Add, Button, x70 y104 w80 h30 Default gaUpdate , Update
	Gui, Show, w220 h140, Update Windows Username
	return
	}
else
StoreClipboard()
return

StoreClipboard()
{
Gui, Destroy
FormatTime, TimeStamp, R
IniRead, Username, C:\Users\%ComputerName%\Desktop\test.ini, Username, Username 
CoordMode, Mouse, Screen       ;Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
Clipboard = ;
IniRead, Clip1, C:\Users\%ComputerName%\Desktop\test.ini, Clip1, key
IniRead, Clip2, C:\Users\%ComputerName%\Desktop\test.ini, Clip2, key
IniRead, Clip3, C:\Users\%ComputerName%\Desktop\test.ini, Clip3, key
IniRead, Clip4, C:\Users\%ComputerName%\Desktop\test.ini, Clip4, key
IniRead, Clip5, C:\Users\%ComputerName%\Desktop\test.ini, Clip5, key
SendInput ^c
Sleep 100
NewClipboard = %Clipboard%
StringReplace, NewClipboard, NewClipboard, `r`n, %A_Space%, All    ; Replace any hard returns with a space. 
StringReplace, NewClipboard, NewClipboard, `r, %A_Space%, All      ; Replace any hard returns with a space. 
StringReplace, NewClipboard, NewClipboard, `n, %A_Space%, All      ; Replace any hard returns with a space. 
StringReplace, NewClipboard, NewClipboard, %A_Space%%A_Space%, %A_Space%, All      ; Replace any hard returns with a space. 
Gui, New, +AlwaysOnTop +Owner, Multiple Clipboard Slots
Gui, Font, s12 bold, Verdana
Gui, Add, Button, w400 h30, Where would you like to store the text?
Gui, Font, s10 w500, Verdana
Gui, Add, Button, gBut1, %Clip1%
Gui, Add, Button, gBut2, %Clip2%
Gui, Add, Button, gBut3, %Clip3%
Gui, Add, Button, gBut4, %Clip4%
Gui, Add, Button, gBut5, %Clip5%
Gui, Font, s12 bold, Verdana
Gui, Add, Button, gBut6, Cancel
 
if (xpos > 2150) & (ypos > 800)     
     {
     newypos := (ypos - 200)
     newxpos := (xpos - 400)
     Gui, Show, x%newxpos% y%newypos% h300 w911, New GUI Window
	 Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }
else if (ypos > 800)     
     {
     newypos := (ypos - 200)
     Gui, Show, x%xpos% y%newypos% h300 w911, New GUI Window
	 Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return
     }
else if (xpos > 2150)      
     {
     newxpos := (xpos - 400)
     Gui, Show, x%newxpos% y%ypos% 3200 w911, New GUI Window
	 Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }
else 
     {
     Gui, Show, x%xpos% y%ypos% h300 w911, New GUI Window
	 Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return
	 }
Return

But1:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\%ComputerName%\Desktop\test.ini, Clip1, key
Sleep 200
IniRead, Clip1, C:\Users\%ComputerName%\Desktop\test.ini, Clip1, key
Clipboard = ;
Return
}

But2:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\%ComputerName%\Desktop\test.ini, Clip2, key
Sleep 200
IniRead, Clip2, C:\Users\%ComputerName%\Desktop\test.ini, Clip2, key
Clipboard = ;
Return
}

But3:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\%ComputerName%\Desktop\test.ini, Clip3, key
Sleep 200
IniRead, Clip3, C:\Users\%ComputerName%\Desktop\test.ini, Clip3, key
Clipboard = ;
Return
}

But4:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\%ComputerName%\Desktop\test.ini, Clip4, key
Sleep 200
IniRead, Clip4, C:\Users\%ComputerName%\Desktop\test.ini, Clip4, key
Clipboard = ;
Return
}

But5:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\%ComputerName%\Desktop\test.ini, Clip5, key
Sleep 200
IniRead, Clip5, C:\Users\%ComputerName%\Desktop\test.ini, Clip5, key
Clipboard = ;
Return
}

But6:
{
Gui, Destroy
Return
}
Return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;    Paste Extra Stored Clipboard    ;;
;;             CTRL + 6               ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^6::
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
IniRead, ComputerName, C:\Users\%ComputerName%\Desktop\test.ini, Username, ComputerName
NewComputerName = %ComputerName%
Sleep 200
if NewComputerName = ERROR
	{
	Gui, Add, Text, x10 y9 w200 h60 +Center, What is your Windows username? `n`n Open the Start Menu. `nYou can see it at the top. 
	Gui, Add, Edit, x10 y75 w200 h20 Limit +Center vComputerName, %ComputerName%
	Gui, Add, Button, x70 y104 w80 h30 Default gaUpdate , Update
	Gui, Show, w220 h140, Update Windows Username
	return
	}
else
PasteClipboard()
return

PasteClipboard()
{
Gui, Destroy
FormatTime, TimeStamp, R
IniRead, Username, C:\Users\%ComputerName%\Desktop\test.ini, Username, key
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
IniRead, Clip1, C:\Users\%ComputerName%\Desktop\test.ini, Clip1, key
IniRead, Clip2, C:\Users\%ComputerName%\Desktop\test.ini, Clip2, key
IniRead, Clip3, C:\Users\%ComputerName%\Desktop\test.ini, Clip3, key
IniRead, Clip4, C:\Users\%ComputerName%\Desktop\test.ini, Clip4, key
IniRead, Clip5, C:\Users\%ComputerName%\Desktop\test.ini, Clip5, key
Sleep 200
Gui, New, +AlwaysOnTop +Owner, Multiple Clipboard Slots
Gui, Font, s12 bold, Verdana
Gui, Add, Button, w300 h30, What would you like to paste?
Gui, Font, s10 w500, Verdana
Gui, Add, Button, gPaste1, %Clip1%
Gui, Add, Button, gPaste2, %Clip2%
Gui, Add, Button, gPaste3, %Clip3%
Gui, Add, Button, gPaste4, %Clip4%
Gui, Add, Button, gPaste5, %Clip5%
Gui, Font, s12 bold, Verdana
Gui, Add, Button, gPaste6, Cancel
if (xpos > 2150) & (ypos > 800)
     {
     newypos := (ypos - 200)
     newxpos := (xpos - 400)
     Gui, Show, x%newxpos% y%newypos%
     Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }
else if (ypos > 800)
     {
     newypos := (ypos - 200)
     ;Msgbox, %newypos%
     Gui, Show, x%xpos% y%newypos%
     Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }
else if (xpos > 2150) 
     {
     newxpos := (xpos - 400)
     ;Msgbox, %newxpos%
     Gui, Show, x%newxpos% y%ypos%
     Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }
else
     Gui, Show, x%xpos% y%ypos%
	 Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
return

Paste1:
{
Gui, Submit
SendInput %Clip1%
Return
}

Paste2:
{
Gui, Submit
SendInput %Clip2%
Return
}

Paste3:
{
Gui, Submit
SendInput %Clip3%
Return
}

Paste4:
{
Gui, Submit
SendInput %Clip4%
Return
}

Paste5:
{
Gui, Submit
SendInput %Clip5%
Return
}

Paste6:
{
Gui, Destroy
Return
}
Return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;    Hotkey for Date and Initials    ;;
;;          Shift + CapsLock          ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

+CapsLock::
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
IniRead, ComputerName, C:\Users\%ComputerName%\Desktop\test.ini, Username, ComputerName
NewComputerName = %ComputerName%
Sleep 200
if NewComputerName = ERROR
	{
	Gui, Add, Text, x10 y9 w200 h60 +Center, What is your Windows username? `n`n Open the Start Menu. `nYou can see it at the top. 
	Gui, Add, Edit, x10 y75 w200 h20 Limit +Center vComputerName, %ComputerName%
	Gui, Add, Button, x70 y104 w80 h30 Default gaUpdate , Update
	Gui, Show, w220 h140, Update Windows Username
	return
	}
else
DateAndName()
return

DateAndName()
{
global ComputerName
;FormatTime, TimeStamp, R
IniRead, Username, C:\Users\%ComputerName%\Desktop\test.ini, Username, Username
IniRead, ATDate, C:\Users\%ComputerName%\Desktop\test.ini, Username, ATDate
;formattime, TodaysDate, , MM/dd/yy  
SendInput %ATDate%            ; Pastes current date.
SendInput {Space}-{Space}         ; Adds space after date.
SendInput {End}{Space}-%Username% ; Jumps to end of line and pasts Username.
SendInput {Home}                  ; Jumps to front of line.
SendInput {Right 11}              ; Positions cursor in middle of text.
Return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;     Open Hyperlink from Excel      ;;
;;             CTRL + 1               ;;
;; For Past Due/IntFees/Facing Report ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^1::
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
IniRead, ComputerName, C:\Users\%ComputerName%\Desktop\test.ini, Username, ComputerName
NewComputerName = %ComputerName%
Sleep 200
if NewComputerName = ERROR
	{
	Gui, Add, Text, x10 y9 w200 h60 +Center, What is your Windows username? `n`n Open the Start Menu. `nYou can see it at the top. 
	Gui, Add, Edit, x10 y75 w200 h20 Limit +Center vComputerName, %ComputerName%
	Gui, Add, Button, x70 y104 w80 h30 Default gaUpdate , Update
	Gui, Show, w220 h140, Update Windows Username
	return
	}
else

FormatTime, TimeStamp, R
IniRead, Username, C:\Users\%ComputerName%\Desktop\test.ini, Username, key
OldClipboard := Clipboard                         ; This saves clipboard content for later.
Clipboard = ;                                     ; This empties the clipboard.
URLString = ;                                     ; Sets MyString to blank.
DocketingString = oc-docketing ;

SendInput ^c
Sleep 200
URLString := clipboard                            ; Fetch URL into variable
if InStr(URLString, DocketingString)
     {
     SplashTextOn, 300,,Opening in docketing now.,
     Run %URLString%
     Sleep 1000
     SplashTextOff
     Clipboard = %oldClipboard%
     Return
     }
else
     {
     SplashTextOn, 300,,Not a docketing URL. Unable to open link.,
     Sleep 1000
     SplashTextOff
     Clipboard = %oldClipboard%
     Return
     }
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;        Open Opposite System        ;;
;;             CTRL + `               ;;
;;        For use in Docketing.       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^`::
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
IniRead, ComputerName, C:\Users\%ComputerName%\Desktop\test.ini, Username, ComputerName
NewComputerName = %ComputerName%
Sleep 200
if NewComputerName = ERROR
	{
	Gui, Add, Text, x10 y9 w200 h60 +Center, What is your Windows username? `n`n Open the Start Menu. `nYou can see it at the top. 
	Gui, Add, Edit, x10 y75 w200 h20 Limit +Center vComputerName, %ComputerName%
	Gui, Add, Button, x70 y104 w80 h30 Default gaUpdate , Update
	Gui, Show, w220 h140, Update Windows Username
	return
	}
else
SwitchSystem()
return

SwitchSystem()
{
FormatTime, TimeStamp, R
IniRead, Username, C:\Users\%ComputerName%\Desktop\test.ini, Username, key
	OldClipboard := Clipboard                                                                ; This saves clipboard content for later.
        Clipboard = ;                                                                            ; This empties the clipboard.
        MyString = ;                                                                             ; Sets MyString to blank.
        AppString = ;
        FrontString = ;
        
        PatentString = http://oc-docketing/CPi/patfrmCountryApplication.aspx?Key=                ; Prefix section of a Live Patent (58 Characters).
        PatentATString = http://oc-docketing/CPiAgent/patfrmCountryApplicationAgent.aspx?Key=    ; Prefix section of a AT Patent (68 Characters).
        PatentActionString = http://oc-docketing/CPi/patfrmActionDue.aspx?key=                   ; Patent Action (49 + 7)
        PatentATActionString = http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=       ; Patent AT Action (60 + 7)

        TMString = http://oc-docketing/CPi/tmkfrmTrademark.aspx?Key=                             ; Prefix section of a Live Trademark (49 Characters).
        TMATString = http://oc-docketing/CPiAgent/tmkfrmTrademarkAgent.aspx?Key=                 ; Prefix section of a AT Trademark (59 + 6 Characters).
        TMActionString = http://oc-docketing/CPi/tmkfrmActionDue.aspx?Key=                       ; TM Live Action (49 + 6)
        TMATActionString = http://oc-docketing/CPiAgent/tmkfrmActionDueAgent.aspx?Key=           ; TM AT Action (59 + 6)
 
SendInput ^l
Sleep 200
SendInput ^c
Sleep 200        
MyString := clipboard                            ; Fetch URL into variable
if InStr(MyString, PatentString)
     {
     StringLeft, FrontString, MyString, 65       ; Stores first 58+7=65 characters of URL for Live Patent with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     FrontString = %PatentATString%
     }
else if InStr(MyString, TMString)
     {
     StringLeft, FrontString, MyString, 55       ; Stores first 49+6=55 characters of URL for Live Trademark with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     FrontString = %TMATString%
     }
else if InStr(MyString, PatentATString)
     {
     StringLeft, FrontString, MyString, 75       ; Stores first 68+7=75 characters of URL for AT Patent with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     FrontString = %PatentString%
     }
else if InStr(MyString, TMATString)
     {
     StringLeft, FrontString, MyString, 65       ; Stores first 54+6=60 characters of URL for AT Trademark with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     FrontString = %TMString%
     }
else if Instr(MyString, PatentActionString)
     {
     StringLeft, FrontString, MyString, 74       ; Stores first 67+7=74 characters of URL for Live Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     FrontString = %PatentATString%
     }
else if Instr(MyString, PatentATActionString)
     {
     StringLeft, FrontString, MyString, 85       ; Stores first 78+7=85 characters of URL for AT Patent Action with AppID.
     StringRight, AppString, FrontString, 7      ; Stores last 7 characters of URL to variable for AppID.
     FrontString = %PatentString%
     }
else if Instr(MyString, TMActionString)
     {
     StringLeft, FrontString, MyString, 73       ; Stores first 67+6=73 characters of URL for Live TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     FrontString = %TMATString%
     }
else if Instr(MyString, TMATActionString)
     {
     StringLeft, FrontString, MyString, 83       ; Stores first 77+6=83 characters of URL for AT TM Action with AppID.
     StringRight, AppString, FrontString, 6      ; Stores last 6 characters of URL to variable for AppID.
     FrontString = %TMString%
     }
else
     {
     SplashTextOn, 400,,Not on a Live or AT docketing page. Unable to open page.,
     Sleep 1500
     SplashTextOff
     Clipboard = %OldClipboard%
     Return
     }
MyString := FrontString . AppString
SplashTextOn, 300,,Opening in opposite system now.,
Run %MyString%
Sleep 1000
SplashTextOff
;MsgBox, %MyString%
;Run iexplore.exe, max
;WinWait,
Clipboard = %OldClipboard%
AppString = ;
FrontString = ;
Return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;         Suggested Remarks          ;;
;;             CTRL + 9               ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^9::
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
IniRead, ComputerName, C:\Users\%ComputerName%\Desktop\test.ini, Username, ComputerName
NewComputerName = %ComputerName%
Sleep 200
if NewComputerName = ERROR
	{
	Gui, Add, Text, x10 y9 w200 h60 +Center, What is your Windows username? `n`n Open the Start Menu. `nYou can see it at the top. 
	Gui, Add, Edit, x10 y75 w200 h20 Limit +Center vComputerName, %ComputerName%
	Gui, Add, Button, x70 y104 w80 h30 Default gaUpdate , Update
	Gui, Show, w220 h140, Update Windows Username
	return
	}
else
SuggestRemarks()
return

SuggestRemarks()
{
FormatTime, TimeStamp, R
formattime, TodaysDate, , MM/dd/yy  
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos
IniRead, Username, C:\Users\%ComputerName%\Desktop\test.ini, Username, Username
IniRead, ATDate, C:\Users\%ComputerName%\Desktop\test.ini, Username, ATDate
Array = ;
IntPat = INT-PAT
IntTM = INT-TM
PreviousClip := Clipboard
SendInput ^c
Sleep 200
CopiedAction := Clipboard                                                    ; This saves clipboard content for later.
Clipboard = ;
Sleep 200
InStr(CopiedAction, IntPat) OR InStr(CopiedAction, IntTM)
IniRead, CopiedAction, C:\Users\%ComputerName%\Desktop\test.ini, Actions, %CopiedAction%
Sleep 200
Array := StrSplit(CopiedAction, "|", A_Space)
if % Array[1] == "ERROR"  OR (StringLen, CopiedAction > 50)
     {
     Sleep 200
     SplashTextOn, 360,, Action not found`, or not copied correctly (perhaps extra spaces?).
	 Sleep 2500
	 Clipboard = %PreviousClip%
	 SplashTextOff
	 Return
	 }	 
else 
     {
     Gui, New, +AlwaysOnTop +Owner, Username Updated, Remarks Suggestions
     Gui, Font, s12 w700, Verdana
     Gui, Add, Button, w350 h30, Here are some suggested remarks:
     Gui, Font, s10 w500, Verdana
     Gui, Add, Button, gArray1, % Array[1]
if % Array[2] = ""{
}
else  
     Gui, Add, Button, gArray2, % Array[2] 
if % Array[3] = ""{
}
else	 
     Gui, Add, Button, gArray3, % Array[3]
if % Array[4] = ""{
}
else	 
     Gui, Add, Button, gArray4, % Array[4]
if % Array[5] = ""{
}
else	
     Gui, Add, Button, gArray5, % Array[5]  
if (xpos > 2150) & (ypos > 800)     
     {
     newypos := (ypos - 200)
     newxpos := (xpos - 400)
     Gui, Show, x%newxpos% y%newypos%
	 Gui, Font, s12 bold, Verdana
	 Gui, Add, Button, gArray6, Cancel
     Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return  
     }
else if (ypos > 800)     
     {
     newypos := (ypos - 200)
     ;Msgbox, %newypos%
     Gui, Show, x%xpos% y%newypos%
	 Gui, Font, s12 bold, Verdana
	 Gui, Add, Button, gArray6, Cancel
     Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return     
     }
else if (xpos > 2150)      
     {
     newxpos := (xpos - 400)
     ;Msgbox, %newxpos%
	 Gui, Font, s12 bold, Verdana
	 Gui, Add, Button, gArray6, Cancel
     Gui, Show, x%newxpos% y%ypos%
     Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return      
     }
else
     Gui, Show, x%xpos% y%ypos%
	 Gui, Font, s12 bold, Verdana
	 Gui, Add, Button, gArray6, Cancel
     Gui, +ToolWindow -Caption  ; Removes the Border and Task bar icon
	 Gui, Color, 000111 ; can be any colour but it's good to use a color that is NOT present in ur GUI
	 Gui, Show, , Test
	 WinSet, Transcolor, 000111, Test
	 Return 
     }
Clipboard = %PreviousClip%
return
	 
Array1:
{
Gui, Submit
SendInput % ATDate " - " Array[1] " -" Username
Clipboard = %PreviousClip%
Return
}

Array2:
{
Gui, Submit
SendInput % ATDate " - " Array[2] " -" Username
Clipboard = %PreviousClip%
Return
}

Array3:
{
Gui, Submit
SendInput % ATDate " - " Array[3] " -" Username
Clipboard = %PreviousClip%
Return
}

Array4:
{
Gui, Submit
SendInput % ATDate " - " Array[4] " -" Username
Clipboard = %PreviousClip%
Return
}

Array5:
{
Gui, Submit
SendInput % ATDate " - " Array[5] " -" Username
Clipboard = %PreviousClip%
Return
}

Array6:
{
Gui, Destroy
Clipboard = %PreviousClip%
Return
}

Clipboard = %PreviousClip%
Return
}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;         Attorney Email Finder      ;;
;;              Ctrl + J              ;;
;;   Stores data in test.ini     ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^j::                            
SendInput ^c
Sleep 200
TestString = %Clipboard%
AttyEmailFinder()
return

AttyEmailFinder()
{
TestString = %NewClipboard%
MsgBox, %TestString%
StringReplace, TestString, TestString, `- , , All                                        ; Removes all dashes.
StringReplace, TestString, TestString, `r`n, `, , All                                    ; Removes all hard returns. 
StringReplace, TestString, TestString, %A_Space% , , All ; Omits periods.                ; Removes all spaces, replaces with commas.
StringSplit, TestString, TestString, `, , . ; Omits periods.                             ; Splits into array at commas.

StringLeft, AttyString0, TestString0, 3  ; Stores first three characters.                ; Stores first three characters of string.
StringLeft, AttyString1, TestString1, 3  ; Stores first three characters.
StringLeft, AttyString2, TestString2, 3  ; Stores first three characters.
StringLeft, AttyString3, TestString3, 3  ; Stores first three characters.
StringLeft, AttyString4, TestString4, 3  ; Stores first three characters.
StringLeft, AttyString5, TestString5, 3  ; Stores first three characters.
StringLeft, AttyString6, TestString6, 3  ; Stores first three characters.
StringLeft, AttyString7, TestString7, 3  ; Stores first three characters.
StringLeft, AttyString8, TestString8, 3  ; Stores first three characters.
StringLeft, AttyString9, TestString9, 3  ; Stores first three characters.
StringLeft, AttyString10, TestString10,3 ; Stores first three characters.

IniRead, AttyTest1, C:\Users\%ComputerName%\Desktop\test.ini,  Attorneys, %AttyString1%      ; Compares attorney to .ini file.
IniRead, AttyTest2, C:\Users\%ComputerName%\Desktop\test.ini,  Attorneys, %AttyString2%
IniRead, AttyTest3, C:\Users\%ComputerName%\Desktop\test.ini,  Attorneys, %AttyString3%
IniRead, AttyTest4, C:\Users\%ComputerName%\Desktop\test.ini,  Attorneys, %AttyString4%
IniRead, AttyTest5, C:\Users\%ComputerName%\Desktop\test.ini,  Attorneys, %AttyString5%
IniRead, AttyTest6, C:\Users\%ComputerName%\Desktop\test.ini,  Attorneys, %AttyString6%
IniRead, AttyTest7, C:\Users\%ComputerName%\Desktop\test.ini,  Attorneys, %AttyString7%
IniRead, AttyTest8, C:\Users\%ComputerName%\Desktop\test.ini,  Attorneys, %AttyString8%
IniRead, AttyTest9, C:\Users\%ComputerName%\Desktop\test.ini,  Attorneys, %AttyString9%
IniRead, AttyTest10, C:\Users\%ComputerName%\Desktop\test.ini, Attorneys, %AttyString10%

if AttyTest1 = Error                  ; If attorney is not an irregular one, sets AttyTest to 2aty team.
     AttyTest1 = 2%AttyString1%             
if AttyTest2 = Error
     AttyTest2 = 2%AttyString2%
if AttyTest3 = Error
     AttyTest3 = 2%AttyString3%	 
if AttyTest4 = Error
     AttyTest4 = 2%AttyString4%	 
if AttyTest5 = Error
     AttyTest5 = 2%AttyString5%	 	 
if AttyTest6 = Error
     AttyTest6 = 2%AttyString6%	 
if AttyTest7 = Error
     AttyTest7 = 2%AttyString7%	 
if AttyTest8 = Error
     AttyTest8 = 2%AttyString8%	 
if AttyTest9 = Error
     AttyTest9 = 2%AttyString9%	 
if AttyTest10 = Error
     AttyTest10 = 2%AttyString10%	
	 	 
StringLen, Atty1Len, AttyTest1         ; Gets the length of each string of the array.
StringLen, Atty2Len, AttyTest2
StringLen, Atty3Len, AttyTest3
StringLen, Atty4Len, AttyTest4
StringLen, Atty5Len, AttyTest5
StringLen, Atty6Len, AttyTest6
StringLen, Atty7Len, AttyTest7
StringLen, Atty8Len, AttyTest8
StringLen, Atty9Len, AttyTest9
StringLen, Atty10Len, AttyTest10

if Atty1Len > 30                       ; If string is greater than 30 characters, meaning a runaway/blank array, sets array to blank.
	AttyTest1 = ;
if Atty2Len > 30
	AttyTest2 = ;	
if Atty3Len > 30
	AttyTest3 = ;
if Atty4Len > 30
	AttyTest4 = ;
if Atty5Len > 30
	AttyTest5 = ;
if Atty6Len > 30
	AttyTest6 = ;
if Atty7Len > 30
	AttyTest7 = ;
if Atty8Len > 30
	AttyTest8 = ;
if Atty9Len > 30
	AttyTest9 = ;	
if Atty10Len > 30
	AttyTest10 = ;

MsgBox, %TestString0%

if AttyTest10 = %AttyTest9%            ; Checks if String 10 matches any others. If so, removes duplicate and decrements TestString0 by 1.
		{
		EnvSub, TestString0, 1
		AttyTest10 = ;
		}
if AttyTest10 = %AttyTest8%
		{
		EnvSub, TestString0, 1
		AttyTest10 = ;
		}
if AttyTest10 = %AttyTest7%
		{
		EnvSub, TestString0, 1
		AttyTest10 = ;
		}
if AttyTest10 = %AttyTest6%
		{
		EnvSub, TestString0, 1
		AttyTest10 = ;
		}
if AttyTest10 = %AttyTest5%
		{
		EnvSub, TestString0, 1
		AttyTest10 = ;
		}		
if AttyTest10 = %AttyTest4%
		{
		EnvSub, TestString0, 1
		AttyTest10 = ;
		}		
if AttyTest10 = %AttyTest3%
		{
		EnvSub, TestString0, 1
		AttyTest10 = ;
		}		
if AttyTest10 = %AttyTest2%
		{
		EnvSub, TestString0, 1
		AttyTest10 = ;
		}		
if AttyTest10 = %AttyTest1%
		{
		EnvSub, TestString0, 1
		AttyTest10 = ;
		}		
if AttyTest9 = %AttyTest8%          ; Checks if String 9 matches any others. If so, removes duplicate and decrements TestString0 by 1.
		{
		EnvSub, TestString0, 1
		AttyTest9 = ;
		}
if AttyTest9 = %AttyTest7%
		{
		EnvSub, TestString0, 1
		AttyTest9 = ;
		}
if AttyTest9 = %AttyTest6%
		{
		EnvSub, TestString0, 1
		AttyTest9 = ;
		}
if AttyTest9 = %AttyTest5%
		{
		EnvSub, TestString0, 1
		AttyTest9 = ;
		}		
if AttyTest9 = %AttyTest4%
		{
		EnvSub, TestString0, 1
		AttyTest9 = ;
		}		
if AttyTest9 = %AttyTest3%
		{
		EnvSub, TestString0, 1
		AttyTest9 = ;
		}		
if AttyTest9 = %AttyTest2%
		{
		EnvSub, TestString0, 1
		AttyTest9 = ;
		}		
if AttyTest9 = %AttyTest1%
		{
		EnvSub, TestString0, 1
		AttyTest9 = ;
		}			
if AttyTest8 = %AttyTest7%          ; Checks if String 8 matches any others. If so, removes duplicate and decrements TestString0 by 1.
		{
		EnvSub, TestString0, 1
		AttyTest8 = ;
		}
if AttyTest8 = %AttyTest6%
		{
		EnvSub, TestString0, 1
		AttyTest8 = ;
		}
if AttyTest8 = %AttyTest5%
		{
		EnvSub, TestString0, 1
		AttyTest8 = ;
		}		
if AttyTest8 = %AttyTest4%
		{
		EnvSub, TestString0, 1
		AttyTest8 = ;
		}		
if AttyTest8 = %AttyTest3%
		{
		EnvSub, TestString0, 1
		AttyTest8 = ;
		}		
if AttyTest8 = %AttyTest2%
		{
		EnvSub, TestString0, 1
		AttyTest8 = ;
		}		
if AttyTest8 = %AttyTest1%
		{
		EnvSub, TestString0, 1
		AttyTest8 = ;
		}			
if AttyTest7 = %AttyTest6%          ; Checks if String 7 matches any others. If so, removes duplicate and decrements TestString0 by 1.
		{
		EnvSub, TestString0, 1
		AttyTest7 = ;
		}		
if AttyTest7 = %AttyTest5%
		{
		EnvSub, TestString0, 1
		AttyTest7 = ;
		}		
if AttyTest7 = %AttyTest4%
		{
		EnvSub, TestString0, 1
		AttyTest7 = ;
		}		
if AttyTest7 = %AttyTest3%
		{
		EnvSub, TestString0, 1
		AttyTest7 = ;
		}		
if AttyTest7 = %AttyTest2%
		{
		EnvSub, TestString0, 1
		AttyTest7 = ;
		}		
if AttyTest7 = %AttyTest1%
		{
		EnvSub, TestString0, 1
		AttyTest7 = ;
		}
if AttyTest6 = %AttyTest5%          ; Checks if String 6 matches any others. If so, removes duplicate and decrements TestString0 by 1.
		{
		EnvSub, TestString0, 1
		AttyTest6 = ;
		}		
if AttyTest6 = %AttyTest4%
		{
		EnvSub, TestString0, 1
		AttyTest6 = ;
		}		
if AttyTest6 = %AttyTest3%
		{
		EnvSub, TestString0, 1
		AttyTest6 = ;
		}		
if AttyTest6 = %AttyTest2%
		{
		EnvSub, TestString0, 1
		AttyTest6 = ;
		}		
if AttyTest6 = %AttyTest1%
		{
		EnvSub, TestString0, 1
		AttyTest6 = ;
		}	
if AttyTest5 = %AttyTest4%          ; Checks if String 5 matches any others. If so, removes duplicate and decrements TestString0 by 1.
		{
		EnvSub, TestString0, 1
		AttyTest5 = ;
		}		
if AttyTest5 = %AttyTest3%
		{
		EnvSub, TestString0, 1
		AttyTest5 = ;
		}		
if AttyTest5 = %AttyTest2%
		{
		EnvSub, TestString0, 1
		AttyTest5 = ;
		}		
if AttyTest5 = %AttyTest1%
		{
		EnvSub, TestString0, 1
		AttyTest5 = ;
		}	
if AttyTest4 = %AttyTest3%          ; Checks if String 4 matches any others. If so, removes duplicate and decrements TestString0 by 1.
		{
		EnvSub, TestString0, 1
		AttyTest4 = ;
		}		
if AttyTest4 = %AttyTest2%
		{
		EnvSub, TestString0, 1
		AttyTest4 = ;
		}		
if AttyTest4 = %AttyTest1%
		{
		EnvSub, TestString0, 1
		AttyTest4 = ;
		}	
if AttyTest3 = %AttyTest2%          ; Checks if String 3 matches any others. If so, removes duplicate and decrements TestString0 by 1.
		{
		EnvSub, TestString0, 1
		AttyTest3 = ;
		}		
if AttyTest3 = %AttyTest1%
		{
		EnvSub, TestString0, 1
		AttyTest3 = ;
		}	
if AttyTest2 = %AttyTest1%          ; Checks if String 1 matches any others. If so, removes duplicate and decrements TestString0 by 1.
		{
		EnvSub, TestString0, 1
		AttyTest2 = ;
		}
		
MsgBox, %TestString0%

if TestString0 == 1               ; If number of arrays is less than this number, only put this many in the copy/message box.
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed. `n`n%AttyTest1%
Clipboard = %AttyTest1%
Sleep 1250
SplashTextOff
return
     }              
else if TestString0 = 2
     {
SplashTextOn, 300, 50,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed. `n`n%AttyTest1%`n%AttyTest2%
Clipboard = %AttyTest1%, %AttyTest2%
Sleep 1250
SplashTextOff
return
     }	
else if TestString0 = 3
     {
SplashTextOn, 300, 120,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%
Sleep 1250
SplashTextOff
return
     }	
else if TestString0 = 4
     {
SplashTextOn, 300, 140,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%`n%AttyTest4%
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%
Sleep 1250
SplashTextOff
return
     }	
else if TestString0 = 5
     {
SplashTextOn, 300, 150,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%`n%AttyTest4%`n%AttyTest5%
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%
Sleep 1250
SplashTextOff
return
     }
else if TestString0 = 6
     {
SplashTextOn, 300, 150,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%`n%AttyTest4%`n%AttyTest5%`n%AttyTest6%
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%
Sleep 1250
SplashTextOff
return
     }
else if TestString0 = 7
     {
SplashTextOn, 300, 200,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%`n%AttyTest4%`n%AttyTest5%`n%AttyTest6%`n%AttyTest7%
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%
Sleep 1250
SplashTextOff
return
     }
else if TestString0 = 8
     {
SplashTextOn, 300, 220,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%`n%AttyTest4%`n%AttyTest5%`n%AttyTest6%`n%AttyTest7%`n%AttyTest8%
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %AttyTest8%
Sleep 1250
SplashTextOff
return
     }
else if TestString0 = 9
     {
SplashTextOn, 300, 240,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%`n%AttyTest4%`n%AttyTest5%`n%AttyTest6%`n%AttyTest7%`n%AttyTest8%`n%AttyTest9%
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %AttyTest8%, %AttyTest9%
Sleep 1250
SplashTextOff
return
     }
else if TestString0 = 10
     {
SplashTextOn, 300, 250,  Copied to clipboard., Paste into CC field, `nand then drag to To: field as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%`n%AttyTest4%`n%AttyTest5%`n%AttyTest6%`n%AttyTest7%`n%AttyTest8%`n%AttyTest9%`n%AttyTest10%
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %AttyTest8%, %AttyTest9%, %AttyTest10%
Sleep 1250
SplashTextOff
return
     }
else
	MsgBox, didn't work?
return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;    Hotstring for Auto-Replacing    ;;
;;              Passive               ;;
;;     Stores data in Scripts.ahk     ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^=::
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy 
IniRead, ComputerName, C:\Users\%ComputerName%\Desktop\test.ini, Username, ComputerName
NewComputerName = %ComputerName%
Sleep 200
if NewComputerName = ERROR
	{
	Gui, Add, Text, x5 y5 w200 h50 +Center, What is your Windows username? `n`n Open the Start Menu. `nYou can see it at the top. 
	Gui, Add, Edit, x5 y55 w200 h20 Limit +Center vComputerName, %ComputerName%
	Gui, Add, Button, x50 y54 w50 h30 Default gaUpdate , Update
	Gui, Show, w220 h140, Update Windows Username
	return
	}
else
HotstringCreator()
return

HotstringCreator()
{
#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy  
IniRead, Username, C:\Users\%ComputerName%\Desktop\test.ini, Username, key
Sleep 200
Gui, New, +AlwaysOnTop, Create Shortcut
Gui, Add, Text, w200 h50 +Center, Create a shortcut for longer text. `n (e.g. btw => by the way) `n`n Shortened version...
Gui, Add, Edit, w200 h20 Limit +Center vHotstring,
Gui, Add, Text, w200 h14 +Center,...will turn into...
Gui, Add, Edit, w200 h20 Limit +Center vExtended,
Gui, Add, Button, x22 y140 w50 h30 Default gHotupdate , Update
Gui, Add, Button, x122 y140 w50 h30 gHotcancel , Cancel
Gui, Add, Button, x22 y155 w150 h30 +Center gHotFix , Need to delete a mistake?
if (xpos > 2150) & (ypos > 500)     
     {
     newypos := (ypos - 155)
     newxpos := (xpos - 230)
     Gui, Show, x%newxpos% y%newypos% h230 w224
     return 
     }
else if (ypos > 500)     
     {
     newypos := (ypos - 155)
     ;Msgbox, %newypos%
     Gui, Show, x%xpos% y%newypos% h230 w224
     return     
     }
else if (xpos > 2150)      
     {
     newxpos := (xpos - 230)
     ;Msgbox, %newxpos%
     Gui, Show, x%newxpos% y%ypos% h230 w224
     return     
     }
else
     Gui, Show, x%xpos% y%ypos% h230 w224
return

Hotupdate:
{
Gui, Submit
FileAppend, ::%Hotstring%::%Extended%`n, C:\Users\%ComputerName%\Desktop\Scripts.ahk
Reload
Sleep 500 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, The script could not be reloaded. 
return
}

Hotcancel:
{
Gui, Destroy
MsgBox, Shortcut NOT saved.
Return
}

Hotfix:
{
Gui, Destroy
MsgBox, OK, let's open the file so you can fix any mistakes.
Run, C:\Windows\Notepad.exe "C:\Users\%ComputerName%\Desktop\Scripts.ahk"
Sleep 200
SendInput ^{End} ; Takes the user to the bottom of the document.
Return
}
Return
}

























































;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                              ;;
;;                           SHORTCUTS                          ;;
;;                                                              ;;
;;            If you're here to fix your shortcuts,             ;;
;;       delete the line(s) with the erroneous shortcuts.       ;;
;;   You can also add new ones if you follow the format below.  ;;
;;                                                              ;;  
;;            EXAMPLE - ::test::this is a test.                 ;;
;;                                                              ;;
;;     Make sure you don't modify anything above this box!      ;;
;;                                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

::btw::by the way


::#ndd::No new dates docketed.
