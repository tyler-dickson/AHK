#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^5::
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
;Msgbox, The cursor is at X%xpos% Y%ypos%. 

; This example allows you to move the mouse around to see
; the title of the window currently under the cursor:
;#Persistent
;SetTimer, WatchCursor, 100
;return

;WatchCursor:
;MouseGetPos, , , id, control
;WinGetTitle, title, ahk_id %id%
;WinGetClass, class, ahk_id %id%
;ToolTip, ahk_id %id%`nahk_class %class%`n%title%`nControl: %control%
;return

Clipboard = ;
IniRead, Clip1, C:\Users\paul.traska\Desktop\test.ini, Clip1, key
IniRead, Clip2, C:\Users\paul.traska\Desktop\test.ini, Clip2, key
IniRead, Clip3, C:\Users\paul.traska\Desktop\test.ini, Clip3, key
IniRead, Clip4, C:\Users\paul.traska\Desktop\test.ini, Clip4, key
IniRead, Clip5, C:\Users\paul.traska\Desktop\test.ini, Clip5, key
Send ^c
Sleep 200
NewClipboard = %Clipboard%
Gui, New
Gui, Add, Text,, Multiple Clipboard Slots. `n`n Where should the text be saved?:
Gui, Add, Button, gBut1, %Clip1% 
Gui, Add, Button, gBut2, %Clip2% 
Gui, Add, Button, gBut3, %Clip3% 
Gui, Add, Button, gBut4, %Clip4% 
Gui, Add, Button, gBut5, %Clip5% 
Gui, Show, x%xpos% y%ypos%
return

But1:
{
Gui, Submit
;MsgBox, You pressed 1.
IniWrite, %NewClipboard%, C:\Users\paul.traska\Desktop\test.ini, Clip1, key
Sleep 200
IniRead, Clip1, C:\Users\paul.traska\Desktop\test.ini, key
Clipboard = ;
Return
}

But2:
{
Gui, Submit
;MsgBox, You pressed 2.
IniWrite, %NewClipboard%, C:\Users\paul.traska\Desktop\test.ini, Clip2, key
Sleep 200
IniRead, Clip2, C:\Users\paul.traska\Desktop\test.ini, Clip2, key
Clipboard = ;
Return
}

But3:
{
Gui, Submit
;MsgBox, You pressed 3.
IniWrite, %NewClipboard%, C:\Users\paul.traska\Desktop\test.ini, Clip3, key
Sleep 200
IniRead, Clip3, C:\Users\paul.traska\Desktop\test.ini, Clip3, key
Clipboard = ;
Return
}

But4:
{
Gui, Submit
;MsgBox, You pressed 4.
IniWrite, %NewClipboard%, C:\Users\paul.traska\Desktop\test.ini, Clip4, key
Sleep 200
IniRead, Clip4, C:\Users\paul.traska\Desktop\test.ini, Clip4, key
Clipboard = ;
Return
}

But5:
{
Gui, Submit
;MsgBox, You pressed 5.
IniWrite, %NewClipboard%, C:\Users\paul.traska\Desktop\test.ini, Clip5, key
Sleep 200
IniRead, Clip5, C:\Users\paul.traska\Desktop\test.ini, Clip5, key
Clipboard = ;
Return
}


Return

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

^6::
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
;Msgbox, The cursor is at X%xpos% Y%ypos%. 

; This example allows you to move the mouse around to see
; the title of the window currently under the cursor:
;#Persistent
;SetTimer, WatchCursor, 100
;return

;WatchCursor:
;MouseGetPos, , , id, control
;WinGetTitle, title, ahk_id %id%
;WinGetClass, class, ahk_id %id%
;ToolTip, ahk_id %id%`nahk_class %class%`n%title%`nControl: %control%
;return

;Clipboard = ;
IniRead, Clip1, C:\Users\paul.traska\Desktop\test.ini, Clip1, key
IniRead, Clip2, C:\Users\paul.traska\Desktop\test.ini, Clip2, key
IniRead, Clip3, C:\Users\paul.traska\Desktop\test.ini, Clip3, key
IniRead, Clip4, C:\Users\paul.traska\Desktop\test.ini, Clip4, key
IniRead, Clip5, C:\Users\paul.traska\Desktop\test.ini, Clip5, key
Sleep 200
;NewClipboard = %Clipboard%
;MsgBox, %Clip1%`n%Clip2%`n%Clip3%`n%Clip4%`n%Clip5%
Gui, New
Gui, Add, Text,, Multiple Clipboard Slots. `n`n What do you want to paste?:
Gui, Add, Button, gPaste1, %Clip1%
Gui, Add, Button, gPaste2, %Clip2%
Gui, Add, Button, gPaste3, %Clip3%
Gui, Add, Button, gPaste4, %Clip4%
Gui, Add, Button, gPaste5, %Clip5%
Gui, Show, x%xpos% y%ypos%
return

Paste1:
{
Gui, Submit
;MsgBox, You pressed 1.
Send %Clip1%
;Clipboard = ;
Return
}

Paste2:
{
Gui, Submit
;MsgBox, You pressed 2.
Send %Clip2%
;Clipboard = ;
Return
}

Paste3:
{
Gui, Submit
;MsgBox, You pressed 3.
Send %Clip3%
;Clipboard = ;
Return
}

Paste4:
{
Gui, Submit
;MsgBox, You pressed 4.
Send %Clip4%
;Clipboard = ;
Return
}

Paste5:
{
Gui, Submit
;MsgBox, You pressed 5.
Send %Clip5%
;Clipboard = ;
Return
}

Return