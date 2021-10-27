#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
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

Menu, Tray, Icon, Shell32.dll, 138

global Hotstring
global Extended
global ComputerName
global Username
global ATPartner
global Date
Computername = %A_Username%

if Computername = lara.anabtawi
	Computername = lara.hamdan
if Computername = neysa.perkins
	Computername = neysa.cabudol
if Computername = jessica.george
	Computername = jessica.egigian
if Computername = sabrina.fleming
	Computername = sabrina.kellogg

IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, Partner, C:\Users\%Computername%\AHKPrefs.ini, Username, ATPartner
IniRead, Date, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate	
return

	
<#Space::
toggle    := !toggle
if (toggle = 1)
	{
	WinMove, A,, 0, 0, 958, 941
	}
else
	{
	WinMove, A,, 305, 239, 700, 530
    }
return


^=::
HotstringCreator()
return

HotstringCreator()
{
#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t
Gui, Destroy
Sleep 200
Gui, New, +AlwaysOnTop, Create Hotstring
Gui, Add, Text, w180 h50 +Center, Create a shortcut for longer text. `n (e.g. btw => by the way) `n`n Shortened version...
Gui, Add, Edit, w180 h20 Limit +Center vHotstring,
Gui, Add, Text, w180 h12 +Center,...will turn into...
Gui, Add, Edit, w180 h20 +Center vExtended,
Gui, Font, underline bold
Gui, Add, Text, w200 h20 x0 +Center, % "Try out %Date% or %Username%"
Gui, Font
Gui, Add, Button, x22 y155 w65 h30 Default gHotupdate , Update
Gui, Add, Button, x115 y155 w65 h30 gHotcancel , Cancel
Gui, Add, Button, x22 y190 w160 h30 +Center gHotFix , Need to delete a mistake?
Gui, Show, h230 w200
return

Hotupdate:
Gui, Submit
MsgBox, New shortcut added!`n`nYour shortcut will be available for use immediately.
ifinstring, Extended, % "%Username%"
	FileAppend, ::%Hotstring%::`nSendInput %Extended%`nreturn`n`n, C:\Users\%A_Username%\Desktop\Hotstrings.ahk
else ifinstring, Extended, % "%ATDate%"
	FileAppend, ::%Hotstring%::`nSendInput %Extended%`nreturn`n`n, C:\Users\%A_Username%\Desktop\Hotstrings.ahk	
else
	FileAppend, ::%Hotstring%::%Extended%`n, C:\Users\%A_Username%\Desktop\Hotstrings.ahk
Reload
Sleep 500 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, The script could not be reloaded. Please restart manually.
return

Hotcancel:
Gui, Destroy
MsgBox, Shortcut NOT saved.
return

Hotfix:
Gui, Destroy
MsgBox, OK, let's open the file so you can fix any mistakes.
Run, C:\Windows\Notepad.exe "C:\Users\%A_Username%\Desktop\Hotstrings.ahk"
Sleep 200
SendInput ^{End} ; Takes the user to the bottom of the document.
return

}

#h::
FileRead, AllHotStrings, Hotstrings.ahk
StringSplit, AllHotStrings, AllHotStrings, `n
Gui, New, Resize, Saved Hotstrings
Gui, Add, ListView, R20 x5 w435 Sort Grid vListViewIndiv, #|Shortcut|Extended
Loop %AllHotStrings0%
{
StringLeft, IsColons, % AllHotStrings%A_Index%, 2
	if IsColons = ::
		{
		IsColonsAmount++
		StringSplit, FirstHalf, AllHotStrings%A_Index%, ::, 
			if FirstHalf5 = %A_Space%`r
				FirstHalf5 = Advanced Hotstring. Unable to display.		
			if FirstHalf5 = `r
				FirstHalf5 = Advanced Hotstring. Unable to display.	
		LV_Add( , IsColonsAmount , FirstHalf3 , FirstHalf5 )  ;AllHotStrings%A_Index%
		LV_ModifyCol()
		LV_ModifyCol(1, "Integer")		
		LV_ModifyCol(1, "SortAsc")
		}
}
Gui, Show, w445
IsColonsAmount = 0
return

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

::#send:: 
SendInput,<3<3<3<3(duck)<3<3<3<3(duck)<3(duck)(duck)(duck)<3(duck)<3<3(duck)(duck){Shift down}{Enter}{Shift up}
SendInput,<3(duck)(duck)(duck)(duck)<3(duck)(duck)(duck)(duck)<3<3(duck)(duck)<3(duck)<3(duck)<3(duck){Shift down}{Enter}{Shift up}
SendInput,<3(duck)(duck)(duck)(duck)<3(duck)(duck)(duck)(duck)<3<3(duck)(duck)<3(duck)<3(duck)(duck)<3{Shift down}{Enter}{Shift up}
SendInput,<3<3<3<3(duck)<3<3<3<3(duck)<3(duck)<3(duck)<3(duck)<3(duck)(duck)<3{Shift down}{Enter}{Shift up}
SendInput,(duck)(duck)(duck)<3(duck)<3(duck)(duck)(duck)(duck)<3(duck)(duck)<3<3(duck)<3(duck)(duck)<3{Shift down}{Enter}{Shift up}
SendInput,(duck)(duck)(duck)<3(duck)<3(duck)(duck)(duck)(duck)<3(duck)(duck)<3<3(duck)<3(duck)<3(duck){Shift down}{Enter}{Shift up}
SendInput,<3<3<3<3(duck)<3<3<3<3(duck)<3(duck)(duck)(duck)<3(duck)<3<3(duck)(duck){Shift down}{Enter}{Shift up}{Shift down}{Enter}{Shift up}
return

::#nudes::
SendInput,<3(duck)(duck)(duck)<3(duck)<3(duck)(duck)<3(duck)<3<3(duck)(duck)(duck)<3<3<3<3(duck)<3<3<3<3{Shift down}{Enter}{Shift up}
SendInput,<3<3(duck)(duck)<3(duck)<3(duck)(duck)<3(duck)<3(duck)<3(duck)(duck)<3(duck)(duck)(duck)(duck)<3(duck)(duck)(duck){Shift down}{Enter}{Shift up}
SendInput,<3<3(duck)(duck)<3(duck)<3(duck)(duck)<3(duck)<3(duck)(duck)<3(duck)<3(duck)(duck)(duck)(duck)<3(duck)(duck)(duck){Shift down}{Enter}{Shift up}
SendInput,<3(duck)<3(duck)<3(duck)<3(duck)(duck)<3(duck)<3(duck)(duck)<3(duck)<3<3<3<3(duck)<3<3<3<3{Shift down}{Enter}{Shift up}
SendInput,<3(duck)(duck)<3<3(duck)<3(duck)(duck)<3(duck)<3(duck)(duck)<3(duck)<3(duck)(duck)(duck)(duck)(duck)(duck)(duck)<3{Shift down}{Enter}{Shift up}
SendInput,<3(duck)(duck)<3<3(duck)<3(duck)(duck)<3(duck)<3(duck)<3(duck)(duck)<3(duck)(duck)(duck)(duck)(duck)(duck)(duck)<3{Shift down}{Enter}{Shift up}
SendInput,<3(duck)(duck)(duck)<3(duck)<3<3<3<3(duck)<3<3(duck)(duck)(duck)<3<3<3<3(duck)<3<3<3<3{Shift down}{Enter}{Shift up}
return

::#test::
SendInput %ATDate% This is a test. %Username%
return


::#shrug::¯\_(ツ)_/¯
::btw::by the way
::#ndd::No new dates docketed.
::#pp::Previously processed.
::#thisapp::This app is parent to divisional *.
::#sgp::Statement of Grant of Protection recvd.
::#further::*Per WorkSpace, further instructions already sent.
::#please::*Please advise if any dates should be docketed
::#QC::- QC'd and entered in docketing.
::#regcopy::Copy of Reg Cert recvd. Awaiting original via corres.
::#closemacro::*Please advise if a CLOSE MACRO Reminder should be docketed.

::#tableflip::(╯°□°）╯︵ ┻━┻
