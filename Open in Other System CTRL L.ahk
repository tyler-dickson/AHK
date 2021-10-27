#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^5::
CoordMode, Mouse, Screen       ;Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
Clipboard = ;
IniRead, Clip1, C:\Users\tyler.dickson\Desktop\test.ini, Clip1, key
IniRead, Clip2, C:\Users\tyler.dickson\Desktop\test.ini, Clip2, key
IniRead, Clip3, C:\Users\tyler.dickson\Desktop\test.ini, Clip3, key
IniRead, Clip4, C:\Users\tyler.dickson\Desktop\test.ini, Clip4, key
IniRead, Clip5, C:\Users\tyler.dickson\Desktop\test.ini, Clip5, key
Send ^c
Sleep 100
NewClipboard = %Clipboard%
Gui, New,, Multiple Clipboard Slots
Gui, Add, Text,, Where should the text be saved?:
Gui, Add, Button, gBut1, %Clip1% 
Gui, Add, Button, gBut2, %Clip2% 
Gui, Add, Button, gBut3, %Clip3% 
Gui, Add, Button, gBut4, %Clip4% 
Gui, Add, Button, gBut5, %Clip5% 
if (xpos > 2150) & (ypos > 800)     
     {
     newypos := (ypos - 200)
     newxpos := (xpos - 400)
     Gui, Show, x%newxpos% y%newypos%
     return 
     }
else if (ypos > 800)     
     {
     newypos := (ypos - 200)
     ;Msgbox, %newypos%
     Gui, Show, x%xpos% y%newypos%
     return     
     }
else if (xpos > 2150)      
     {
     newxpos := (xpos - 400)
     ;Msgbox, %newxpos%
     Gui, Show, x%newxpos% y%ypos%
     return     
     }
else
     Gui, Show, x%xpos% y%ypos%
return

But1:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\tyler.dickson\Desktop\test.ini, Clip1, key
Sleep 200
IniRead, Clip1, C:\Users\tyler.dickson\Desktop\test.ini, Clip1, key
Clipboard = ;
Return
}

But2:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\tyler.dickson\Desktop\test.ini, Clip2, key
Sleep 200
IniRead, Clip2, C:\Users\tyler.dickson\Desktop\test.ini, Clip2, key
Clipboard = ;
Return
}

But3:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\tyler.dickson\Desktop\test.ini, Clip3, key
Sleep 200
IniRead, Clip3, C:\Users\tyler.dickson\Desktop\test.ini, Clip3, key
Clipboard = ;
Return
}

But4:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\tyler.dickson\Desktop\test.ini, Clip4, key
Sleep 200
IniRead, Clip4, C:\Users\tyler.dickson\Desktop\test.ini, Clip4, key
Clipboard = ;
Return
}

But5:
{
Gui, Submit
IniWrite, %NewClipboard%, C:\Users\tyler.dickson\Desktop\test.ini, Clip5, key
Sleep 200
IniRead, Clip5, C:\Users\tyler.dickson\Desktop\test.ini, Clip5, key
Clipboard = ;
Return
}


Return

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

^6::
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
IniRead, Clip1, C:\Users\tyler.dickson\Desktop\test.ini, Clip1, key
IniRead, Clip2, C:\Users\tyler.dickson\Desktop\test.ini, Clip2, key
IniRead, Clip3, C:\Users\tyler.dickson\Desktop\test.ini, Clip3, key
IniRead, Clip4, C:\Users\tyler.dickson\Desktop\test.ini, Clip4, key
IniRead, Clip5, C:\Users\tyler.dickson\Desktop\test.ini, Clip5, key
Sleep 200
Gui, New,, Multiple Clipboard Slots
Gui, Add, Text,, What do you want to paste?:
Gui, Add, Button, gPaste1, %Clip1%
Gui, Add, Button, gPaste2, %Clip2%
Gui, Add, Button, gPaste3, %Clip3%
Gui, Add, Button, gPaste4, %Clip4%
Gui, Add, Button, gPaste5, %Clip5%
if (xpos > 2150) & (ypos > 800)
     {
     newypos := (ypos - 200)
     newxpos := (xpos - 400)
     Gui, Show, x%newxpos% y%newypos%
     return
     }
else if (ypos > 800)
     {
     newypos := (ypos - 200)
     ;Msgbox, %newypos%
     Gui, Show, x%xpos% y%newypos%
     return
     }
else if (xpos > 2150) 
     {
     newxpos := (xpos - 400)
     ;Msgbox, %newxpos%
     Gui, Show, x%newxpos% y%ypos%
     return
     }
else
     Gui, Show, x%xpos% y%ypos%
return

Paste1:
{
Gui, Submit
Send %Clip1%
Return
}

Paste2:
{
Gui, Submit
Send %Clip2%
Return
}

Paste3:
{
Gui, Submit
Send %Clip3%
Return
}

Paste4:
{
Gui, Submit
Send %Clip4%
Return
}

Paste5:
{
Gui, Submit
Send %Clip5%
Return
}

Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

+CapsLock::
IniRead, Username, C:\Users\tyler.dickson\Desktop\test.ini, Username, key
UserID = -TDICKSON
formattime, carrotcake, , MM/dd/yy  
send %carrotcake%      
Send {Space}-{Space}
Send {End}{Space}-%Username%
Send {Home}
Send {Right 11}
Return

^3::
formattime, todaysdate, , MM/dd/yy  
IniRead, Username, C:\Users\tyler.dickson\Desktop\test.ini, Username, key
Gui, New
Gui, Add, Text,, Current Username is %Username%. `n`n Enter your new Username:
Gui, Add, Edit, vUsername
Gui, Add, Button, Default gaOK, OK
Gui, Add, Button, gCancel, Cancel
Gui, Show
return
aOK:
Gui, Submit
MsgBox, This is how your remarks will now appear:`n`n "%todaysdate% - Insert default comments here. -%Username%."
IniWrite, %Username%, C:\Users\tyler.dickson\Desktop\test.ini, Username, key
Return

gCancel:
Return

;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;

^1::
OldClipboard := Clipboard                         ; This saves clipboard content for later.
Clipboard = ;                                     ; This empties the clipboard.
URLString = ;                                     ; Sets MyString to blank.
DocketingString = oc-docketing ;

Send ^c
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

;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;

^`::
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
 
Send ^l
Sleep 200
Send ^c
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