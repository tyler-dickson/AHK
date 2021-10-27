﻿;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;        Open Shortcut Tips          ;;
;;          CTRL + CapsLock           ;;
;;   Press Space or Enter to close.   ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^CapsLock::
FormatTime, TimeStamp, R
IniRead, Username, C:\Users\tyler.dickson\Desktop\test.ini, Username, key 
SplashTextOn,350 ,275, Quick Shortcuts, Ctrl+`` = Open Docketing in Opposite System `n Ctrl+1 = Open Hyperlink from Excel `n`n Ctrl+5 = Store Extra Clipboard Items `n Ctrl+6 = Paste Stored Clipboard Items `n`n Ctrl+9 = Suggested Remarks `n`n Ctrl+3 = Set Username for Remarks `n Shift+CapsLock = Paste current date and initials. `n`n Ctrl+= = Create Shortcut Abbreviations `n`n Ctrl+J = Attorney Email Finder
;WinMove, Quick Shortcuts , , 0, 0 ; Move the splash window to the top left corner.
Msgbox
;Sleep 4000
SplashTextOff
FileAppend, "Open Shortcut Tips" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;     Store Extra Clipboard Items    ;;
;;             CTRL + 5               ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^5::
Gui, Destroy
FormatTime, TimeStamp, R
IniRead, Username, C:\Users\tyler.dickson\Desktop\test.ini, Username, key 
CoordMode, Mouse, Screen       ;Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
Clipboard = ;
IniRead, Clip1, C:\Users\tyler.dickson\Desktop\test.ini, Clip1, key
IniRead, Clip2, C:\Users\tyler.dickson\Desktop\test.ini, Clip2, key
IniRead, Clip3, C:\Users\tyler.dickson\Desktop\test.ini, Clip3, key
IniRead, Clip4, C:\Users\tyler.dickson\Desktop\test.ini, Clip4, key
IniRead, Clip5, C:\Users\tyler.dickson\Desktop\test.ini, Clip5, key
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
FileAppend, "Store Extra Clipboard Items" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return

But1:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\tyler.dickson\Desktop\test.ini, Clip1, key
Sleep 200
IniRead, Clip1, C:\Users\tyler.dickson\Desktop\test.ini, Clip1, key
Clipboard = ;
FileAppend, "Store Extra Clipboard Items" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

But2:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\tyler.dickson\Desktop\test.ini, Clip2, key
Sleep 200
IniRead, Clip2, C:\Users\tyler.dickson\Desktop\test.ini, Clip2, key
Clipboard = ;
FileAppend, "Store Extra Clipboard Items" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

But3:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\tyler.dickson\Desktop\test.ini, Clip3, key
Sleep 200
IniRead, Clip3, C:\Users\tyler.dickson\Desktop\test.ini, Clip3, key
Clipboard = ;
FileAppend, "Store Extra Clipboard Items" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

But4:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\tyler.dickson\Desktop\test.ini, Clip4, key
Sleep 200
IniRead, Clip4, C:\Users\tyler.dickson\Desktop\test.ini, Clip4, key
Clipboard = ;
FileAppend, "Store Extra Clipboard Items" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

But5:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\tyler.dickson\Desktop\test.ini, Clip5, key
Sleep 200
IniRead, Clip5, C:\Users\tyler.dickson\Desktop\test.ini, Clip5, key
Clipboard = ;
FileAppend, "Store Extra Clipboard Items" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

But6:
{
Gui, Destroy
FileAppend, "Store Extra Clipboard Items" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}
FileAppend, "Store Extra Clipboard Items" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;    Paste Extra Stored Clipboard    ;;
;;             CTRL + 6               ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^6::
Gui, Destroy
FormatTime, TimeStamp, R
IniRead, Username, C:\Users\tyler.dickson\Desktop\test.ini, Username, key
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
IniRead, Clip1, C:\Users\tyler.dickson\Desktop\test.ini, Clip1, key
IniRead, Clip2, C:\Users\tyler.dickson\Desktop\test.ini, Clip2, key
IniRead, Clip3, C:\Users\tyler.dickson\Desktop\test.ini, Clip3, key
IniRead, Clip4, C:\Users\tyler.dickson\Desktop\test.ini, Clip4, key
IniRead, Clip5, C:\Users\tyler.dickson\Desktop\test.ini, Clip5, key
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
FileAppend, "Paste Extra Stored Clipboard" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
return

Paste1:
{
Gui, Submit
SendInput %Clip1%
FileAppend, "Paste Extra Stored Clipboard" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

Paste2:
{
Gui, Submit
SendInput %Clip2%
FileAppend, "Paste Extra Stored Clipboard" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

Paste3:
{
Gui, Submit
SendInput %Clip3%
FileAppend, "Paste Extra Stored Clipboard" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

Paste4:
{
Gui, Submit
SendInput %Clip4%
FileAppend, "Paste Extra Stored Clipboard" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

Paste5:
{
Gui, Submit
SendInput %Clip5%
FileAppend, "Paste Extra Stored Clipboard" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

Paste6:
{
Gui, Destroy
FileAppend, "Paste Extra Stored Clipboard" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}
FileAppend, "Paste Extra Stored Clipboard" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;    Hotkey for Date and Initials    ;;
;;          Shift + CapsLock          ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

+CapsLock::
FormatTime, TimeStamp, R
IniRead, Username, C:\Users\tyler.dickson\Desktop\test.ini, Username, key
UserID = -TDICKSON
formattime, TodaysDate, , MM/dd/yy  
SendInput %TodaysDate%            ; Pastes current date.
SendInput {Space}-{Space}         ; Adds space after date.
SendInput {End}{Space}-%Username% ; Jumps to end of line and pasts Username.
SendInput {Home}                  ; Jumps to front of line.
SendInput {Right 11}              ; Positions cursor in middle of text.
FileAppend, "Hotkey for Date and Initials" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;     Sets Username for Remarks      ;;
;;             CTRL + 3               ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^3::
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy  
IniRead, Username, C:\Users\tyler.dickson\Desktop\test.ini, Username, key
Sleep 200
Gui, New, +AlwaysOnTop, Update Username
Gui, Add, Text, x10 y9 w200 h50 +Center, Current Username is %Username%. `n`n Enter your new Username:
Gui, Add, Edit, x10 y64 w200 h20 Limit +Center vUsername
Gui, Add, Button, x22 y99 w80 h30 Default gaOK , Update
Gui, Add, Button, x122 y99 w80 h30 gCancel , Cancel
if (xpos > 2150) & (ypos > 800)     
     {
     newypos := (ypos - 165)
     newxpos := (xpos - 230)
     Gui, Show, x%newxpos% y%newypos% h139 w224
     return 
     }
else if (ypos > 800)     
     {
     newypos := (ypos - 165)
     ;Msgbox, %newypos%
     Gui, Show, x%xpos% y%newypos% h139 w224
     return     
     }
else if (xpos > 2150)      
     {
     newxpos := (xpos - 230)
     ;Msgbox, %newxpos%
     Gui, Show, x%newxpos% y%ypos% h139 w224
     return     
     }
else
     Gui, Show, x%xpos% y%ypos% h139 w224
return

aOK:
Gui, Submit
Gui, New, +AlwaysOnTop, Username Updated
Gui, Add, Text,Center , This is how your remarks will now appear:`n`n "%todaysdate% - Insert default comments here. -%Username%." `n
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
FileAppend, "Select Username for Remarks" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
return

Done:
{
Gui, Destroy
IniWrite, %Username%, C:\Users\tyler.dickson\Desktop\test.ini, Username, key
FileAppend, "Select Username for Remarks" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

Cancel:
{
Gui, Destroy
FileAppend, "Select Username for Remarks" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
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
IniRead, Username, C:\Users\tyler.dickson\Desktop\test.ini, Username, key
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
	 FileAppend, "Open Hyperlink from Excel - Failed" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
     Return
     }
else
     {
     SplashTextOn, 300,,Not a docketing URL. Unable to open link.,
     Sleep 1000
     SplashTextOff
     Clipboard = %oldClipboard%
	 FileAppend, "Open Hyperlink from Excel" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
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
IniRead, Username, C:\Users\tyler.dickson\Desktop\test.ini, Username, key
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
	 FileAppend, "Open Opposite System - Failed" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
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
FileAppend, "Open Opposite System" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;         Suggested Remarks          ;;
;;             CTRL + 9               ;;
;;      Stores data in test.ini       ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^9::
FormatTime, TimeStamp, R
formattime, TodaysDate, , MM/dd/yy  
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos
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
IniRead, CopiedAction, C:\Users\tyler.dickson\Desktop\test.ini, Actions, %CopiedAction%
IniRead, Username, C:\Users\tyler.dickson\Desktop\test.ini, Username, key
Sleep 200
Array := StrSplit(CopiedAction, "|", A_Space)
;msgbox, %CopiedAction%
if % Array[1] == "ERROR"  OR (StringLen, CopiedAction > 50)
     {
     Sleep 200
     SplashTextOn, 360,, Action not found`, or not copied correctly (perhaps extra spaces?).
	 Sleep 2500
	 Clipboard = %PreviousClip%
	 SplashTextOff
	 FileAppend, "Suggested Remarks - Failed" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
	 Return
	 }	 
else 
     {
     Gui, New, +AlwaysOnTop, Username Updated, Remarks Suggestions
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
SendInput % TodaysDate " - " Array[1] " -" Username
Clipboard = %PreviousClip%
FileAppend, "Suggested Remarks" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

Array2:
{
Gui, Submit
SendInput % TodaysDate " - " Array[2] " -" Username
Clipboard = %PreviousClip%
FileAppend, "Suggested Remarks" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

Array3:
{
Gui, Submit
SendInput % TodaysDate " - " Array[3] " -" Username
Clipboard = %PreviousClip%
FileAppend, "Suggested Remarks" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

Array4:
{
Gui, Submit
SendInput % TodaysDate " - " Array[4] " -" Username
Clipboard = %PreviousClip%
FileAppend, "Suggested Remarks" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

Array5:
{
Gui, Submit
SendInput % TodaysDate " - " Array[5] " -" Username
Clipboard = %PreviousClip%
FileAppend, "Suggested Remarks" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

Array6:
{
Gui, Destroy
Clipboard = %PreviousClip%
FileAppend, "Suggested Remarks" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
}

GuiClose:
{
Gui, Destroy
Clipboard = %PreviousClip%
FileAppend, "Suggested Remarks" opened by %Username% on %TimeStamp%.`n, C:\Users\tyler.dickson\Desktop\test.ini
Return
}

Clipboard = %PreviousClip%
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;    Hotstring for Auto-Replacing    ;;
;;              Passive               ;;
;;     Stores data in Scripts.ahk     ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^=::
#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t
FormatTime, TimeStamp, R
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
formattime, todaysdate, , MM/dd/yy  
IniRead, Username, C:\Users\tyler.dickson\Desktop\test.ini, Username, key
Sleep 200
Gui, New, +AlwaysOnTop, Create Shortcut
Gui, Add, Text, w200 h50 +Center, Create a shortcut for longer text. `n (e.g. btw => by the way) `n`n Shortened version...
Gui, Add, Edit, w200 h20 Limit +Center vHotstring
Gui, Add, Text, w200 h14 +Center,...will turn into...
Gui, Add, Edit, w200 h20 Limit +Center vExtended
Gui, Add, Button, x22 y140 w80 h30 Default gHotupdate , Update
Gui, Add, Button, x122 y140 w80 h30 gHotcancel , Cancel
Gui, Add, Button, x22 y185 w180 h30 +Center gHotFix , Need to delete a mistake?
if (xpos > 2150) & (ypos > 800)     
     {
     newypos := (ypos - 165)
     newxpos := (xpos - 230)
     Gui, Show, x%newxpos% y%newypos% h230 w224
     return 
     }
else if (ypos > 800)     
     {
     newypos := (ypos - 165)
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
MsgBox, New shortcut saved.
FileAppend, ::%Hotstring%::%Extended%`n, C:\Users\tyler.dickson\Desktop\Scripts.ahk
Reload
Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
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
Run, C:\Windows\Notepad.exe "C:\Users\tyler.dickson\Desktop\Scripts.ahk"
Sleep 200
SendInput ^{End} ; Takes the user to the bottom of the document.
Return
}
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;         Attorney Email Finder      ;;
;;              Ctrl + J              ;;
;;   Stores data in Attorneys.ini     ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^j::                            
SendInput ^c
Sleep 200
TestString = %Clipboard%
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

IniRead, AttyTest1, C:\Users\tyler.dickson\Desktop\Attorneys.ini,  Attorneys, %AttyString1%      ; Compares attorney to .ini file.
IniRead, AttyTest2, C:\Users\tyler.dickson\Desktop\Attorneys.ini,  Attorneys, %AttyString2%
IniRead, AttyTest3, C:\Users\tyler.dickson\Desktop\Attorneys.ini,  Attorneys, %AttyString3%
IniRead, AttyTest4, C:\Users\tyler.dickson\Desktop\Attorneys.ini,  Attorneys, %AttyString4%
IniRead, AttyTest5, C:\Users\tyler.dickson\Desktop\Attorneys.ini,  Attorneys, %AttyString5%
IniRead, AttyTest6, C:\Users\tyler.dickson\Desktop\Attorneys.ini,  Attorneys, %AttyString6%
IniRead, AttyTest7, C:\Users\tyler.dickson\Desktop\Attorneys.ini,  Attorneys, %AttyString7%
IniRead, AttyTest8, C:\Users\tyler.dickson\Desktop\Attorneys.ini,  Attorneys, %AttyString8%
IniRead, AttyTest9, C:\Users\tyler.dickson\Desktop\Attorneys.ini,  Attorneys, %AttyString9%
IniRead, AttyTest10, C:\Users\tyler.dickson\Desktop\Attorneys.ini, Attorneys, %AttyString10%

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
	 
StringLen, Atty1Len, AttyTest1      ; Gets the length of each string of the array.
StringLen, Atty2Len, AttyTest2
StringLen, Atty3Len, AttyTest3
StringLen, Atty4Len, AttyTest4
StringLen, Atty5Len, AttyTest5
StringLen, Atty6Len, AttyTest6
StringLen, Atty7Len, AttyTest7
StringLen, Atty8Len, AttyTest8
StringLen, Atty9Len, AttyTest9
StringLen, Atty10Len, AttyTest10

if Atty1Len > 30                    ; If string is greater than 30 characters, meaning a blank array, sets array to blank.
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


if TestString0 == 1               ; If number of arrays is less than this number, only put this many in the copy/message box.
     {
MsgBox Copied to clipboard. `n`nPaste into CC field, then drag Working/IPP/TMPL as needed. `n`n%AttyTest1%
Clipboard = %AttyTest1%
     }              
else if TestString0 = 2
     {
MsgBox Copied to clipboard. `n`nPaste into CC field, then drag Working/IPP/TMPL as needed. `n`n%AttyTest1%`n%AttyTest2%
Clipboard = %AttyTest1%, %AttyTest2%
     }	
else if TestString0 = 3
     {
MsgBox Copied to clipboard. `n`nPaste into CC field, then drag Working/IPP/TMPL as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%
     }	
else if TestString0 = 4
     {
MsgBox Copied to clipboard. `n`nPaste into CC field, then drag Working/IPP/TMPL as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%`n%AttyTest4%
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%
     }	
else if TestString0 = 5
     {
MsgBox Copied to clipboard. `n`nPaste into CC field, then drag Working/IPP/TMPL as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%`n%AttyTest4%`n%AttyTest5%
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%
     }
else if TestString0 = 6
     {
MsgBox Copied to clipboard. `n`nPaste into CC field, then drag Working/IPP/TMPL as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%`n%AttyTest4%`n%AttyTest5%`n%AttyTest6%
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%
     }
else if TestString0 = 7
     {
MsgBox Copied to clipboard. `n`nPaste into CC field, then drag Working/IPP/TMPL as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%`n%AttyTest4%`n%AttyTest5%`n%AttyTest6%`n%AttyTest7%
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%
     }
else if TestString0 = 8
     {
MsgBox Copied to clipboard. `n`nPaste into CC field, then drag Working/IPP/TMPL as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%`n%AttyTest4%`n%AttyTest5%`n%AttyTest6%`n%AttyTest7%`n%AttyTest8%
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %AttyTest8%
     }
else if TestString0 = 9
     {
MsgBox Copied to clipboard. `n`nPaste into CC field, then drag Working/IPP/TMPL as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%`n%AttyTest4%`n%AttyTest5%`n%AttyTest6%`n%AttyTest7%`n%AttyTest8%`n%AttyTest9%
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %AttyTest8%, %AttyTest9%
     }
else if TestString0 = 10
     {
MsgBox Copied to clipboard. `n`nPaste into CC field, then drag Working/IPP/TMPL as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%`n%AttyTest4%`n%AttyTest5%`n%AttyTest6%`n%AttyTest7%`n%AttyTest8%`n%AttyTest9%`n%AttyTest10%
Clipboard = %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%, %AttyTest6%, %AttyTest7%, %AttyTest8%, %AttyTest9%, %AttyTest10%
     }
return





















































;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                              ;;
;;                           SHORTCUTS                          ;;
;;                                                              ;;
;;            If you're here to fix your shortcuts,             ;;
;;       delete the line(s) with the erroneous shortcuts.       ;;
;;   You can also add new ones if you follow the format below.  ;;
;;                                                              ;;
;;     Make sure you don't modify anything above this box!      ;;
;;                                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

::btw::by the way

::#ndd::No new dates docketed.
