#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                              ;;
;;            If you're here to fix your shortcuts,             ;;
;;       scroll all the way to the end! (hit Ctrl + End)        ;;
;;     Make sure you don't modify anything except the values    ;;
;;          at the bottom under the "Shortcuts" heading.        ;;
;;                                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;    Hotstring for Auto-Replacing    ;;
;;              Passive               ;;
;;    Stores data in Hotstring.ahk    ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

global Hotstring
global Extended

^=::
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
IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, key
Sleep 200
Gui, New, +AlwaysOnTop, Create Shortcut
Gui, Add, Text, w180 h50 +Center, Create a shortcut for longer text. `n (e.g. btw => by the way) `n`n Shortened version...
Gui, Add, Edit, w180 h20 Limit +Center vHotstring,
Gui, Add, Text, w180 h14 +Center,...will turn into...
Gui, Add, Edit, w180 h20 Limit +Center vExtended,
Gui, Add, Button, x22 y140 w50 h30 Default gHotupdate , Update
Gui, Add, Button, x130 y140 w50 h30 gHotcancel , Cancel
Gui, Add, Button, x22 y190 w160 h30 +Center gHotFix , Need to delete a mistake?
if (xpos > 2150) & (ypos > 500)     
     {
     newypos := (ypos - 155)
     newxpos := (xpos - 230)
     Gui, Show, x%newxpos% y%newypos% h230 w200
     return 
     }
else if (ypos > 500)     
     {
     newypos := (ypos - 155)
     ;Msgbox, %newypos%
     Gui, Show, x%xpos% y%newypos% h230 w200
     return     
     }
else if (xpos > 2150)      
     {
     newxpos := (xpos - 230)
     ;Msgbox, %newxpos%
     Gui, Show, x%newxpos% y%ypos% h230 w200
     return     
     }
else
     Gui, Show, x%xpos% y%ypos% h230 w200
return

Hotupdate:
{
Gui, Submit
MsgBox, New shortcut added!`n`nNote: This will remove your selections from the Update Information Tab.`n`nPress Control+CapsLock to re-enable your preferred options.
FileAppend, ::%Hotstring%::%Extended%`n, C:\Users\%A_Username%\Desktop\Hotstrings.ahk
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
Run, C:\Windows\Notepad.exe "C:\Users\%A_Username%\Desktop\Hotstrings.ahk"
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

::#pp::Previously processed.



