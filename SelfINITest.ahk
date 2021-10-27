#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

IniRead, search1, % A_ScriptFullPath, SavedVariables, search1
IniRead, search2, % A_ScriptFullPath, SavedVariables, search2
IniRead, search3, % A_ScriptFullPath, SavedVariables, search3
IniRead, search4, % A_ScriptFullPath, SavedVariables, search4
IniRead, search5, % A_ScriptFullPath, SavedVariables, search5

if (search = "")
    search  := "Search Text"

Gui, Add, Edit, vSearch1, % search1
Gui, Add, Edit, vSearch2, % search2
Gui, Add, Edit, vSearch3, % search3
Gui, Add, Edit, vSearch4, % search4
Gui, Add, Edit, vSearch5, % search5
Gui, Add, Button, gOnSubmit, Submit
Gui, Show

return

; The name of your 
OnSubmit:
    Gui, Submit
    IniWrite, % search1, % A_ScriptFullPath, SavedVariables, search1
	IniWrite, % search2, % A_ScriptFullPath, SavedVariables, search2
	IniWrite, % search3, % A_ScriptFullPath, SavedVariables, search3
	IniWrite, % search4, % A_ScriptFullPath, SavedVariables, search4
	IniWrite, % search5, % A_ScriptFullPath, SavedVariables, search5

;Run, % A_Temp "\lastSearch.txt"
return

;============================== ini Section ==============================
/*
[SavedVariables]
search1=wwwwwwwwwww
search2=rrrrrrrrr
search3=123
search4=321
search5=23232
*/


ClientCodeIE()
{
Gui, Destroy
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
SendInput ^c
Clipboard := Trim(Clipboard)
StringLen, ClipLength, Clipboard
NewMousePosX := (xpos - 150)
NewMousePosY := (ypos - 50)
Gui, New, +Owner +AlwaysOnTop, OpenInIE
Gui, Font, s10 w500, Verdana
Gui, Font, bold
Gui, Add, Button, x100 y30 w100 h55, Open Record in Docketing
if ClipLength < 9
	Gui, Add, Button, x100 y0 h25 w100, %Clipboard%
else
	Gui, Add, Button, x50 y0 h25 w200, %Clipboard%
Gui, Font, s10 w500 normal, Verdana
;Gui, Add, Button, x100 y0 w100 h25, %Clipboard%
Gui, Add, Button, x0 y30 w100 h25 gOpenTMLive, TM Live
Gui, Add, Button, x0 y60 w100 h25 gOpenTMAT, TM AT
Gui, Add, Button, x200 y30 w100 h25 gOpenPATLive, Patent Live
Gui, Add, Button, x200 y60 w100 h25 gOpenPATAT, Patent AT
Gui, Add, Button, x305 y30 w100 h25 gOpenInventionLive, Invention Live
Gui, Add, Button, x305 y60 w100 h25 gOpenInventionAT, Invention AT
Gui, Add, Button, x100 y90 w100 h25 gCancelOpen, Cancel
Gui, Show, x%NewMousePosX% y%NewMousePosY%
Gui, +ToolWindow -Caption                           ; Removes the Border and Task bar icon
Gui, Color, 000111, OpenInIE                                 ; can be any colour but it's good to use a color that is NOT present in ur GUI
;Gui, Show, X%X% Y%Y% h28 w225, Test
;Gui, Show, X%NewX% Y%NewY% h500 w500, Test2
WinSet, Transcolor, 000111, OpenInIE
Gui, Show, x%NewMousePosX% y%NewMousePosY%
return

CancelOpen:
Gui, Hide
return

OpenTMLive:
Gui, Submit
For IE in ComObjCreate("Shell.Application").Windows ; for each open window
If InStr(IE.FullName, "iexplore.exe") ; check if it's an ie window
break ; keep that window's handle
ie.Navigate("http://oc-docketing/CPi/tmkschTrademark.aspx")
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
gosub RecordClientCodeIE
return

OpenTMAT:
Gui, Submit
For IE in ComObjCreate("Shell.Application").Windows ; for each open window
If InStr(IE.FullName, "iexplore.exe") ; check if it's an ie window
break ; keep that window's handle
ie.Navigate("http://oc-docketing/CPiAgent/tmkschTrademarkAgent.aspx")
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
gosub RecordClientCodeIE
return

OpenPATLive:
Gui, Submit
For IE in ComObjCreate("Shell.Application").Windows ; for each open window
If InStr(IE.FullName, "iexplore.exe") ; check if it's an ie window
break ; keep that window's handle
ie.Navigate("http://oc-docketing/CPi/patschCountryApplication.aspx")
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
gosub RecordClientCodeIE
return

OpenPATAT:
Gui, Submit
For IE in ComObjCreate("Shell.Application").Windows ; for each open window
If InStr(IE.FullName, "iexplore.exe") ; check if it's an ie window
break ; keep that window's handle
ie.Navigate("http://oc-docketing/CPiAgent/patschCountryApplicationAgent.aspx")
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
gosub RecordClientCodeIE
return

OpenInventionLive:
Gui, Submit
For IE in ComObjCreate("Shell.Application").Windows ; for each open window
If InStr(IE.FullName, "iexplore.exe") ; check if it's an ie window
break ; keep that window's handle
ie.Navigate("http://oc-docketing/CPi/patschInvention.aspx")
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
gosub RecordClientCodeIE
return

OpenInventionAT:
Gui, Submit
For IE in ComObjCreate("Shell.Application").Windows ; for each open window
If InStr(IE.FullName, "iexplore.exe") ; check if it's an ie window
break ; keep that window's handle
ie.Navigate("http://oc-docketing/CPiAgent/patschInventionAgent.aspx")
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
gosub RecordClientCodeIE
return
}

IEGet(Name="")        ;Retrieve pointer to existing IE window/tab
{
    IfEqual, Name,, WinGetTitle, Name, ahk_class IEFrame
        Name := ( Name="New Tab - Windows Internet Explorer" ) ? "about:Tabs"
        : RegExReplace( Name, " - (Windows|Microsoft) Internet Explorer" )
    For ie in ComObjCreate( "Shell.Application" ).Windows
        If ( ie.LocationName = Name ) && InStr( wb.FullName, "iexplore.exe" )
            Return ie
} ;written by Jethrow

IELoad(ie)    ;You need to send the IE handle to the function unless you define it as global.
{
    If !ie    ;If wb is not a valid pointer then quit
        Return False
    Loop    ;Otherwise sleep for .1 seconds untill the page starts loading
        Sleep,250
    Until (ie.busy)
    Loop    ;Once it starts loading wait until completes
        Sleep,250
    Until (!ie.busy)
    Loop    ;optional check to wait for the page to completely load
        Sleep,250
    Until (ie.Document.Readystate = "Complete")
Return True
}






Gui, 1: Add, Checkbox, x60 Checked%Checkboxes1% vOption9,  Record Opener - Patent Live
Gui, 1: Add, Checkbox, x60 Checked%Checkboxes1% vOption10, Record Opener - Patent AT
Gui, 1: Add, Checkbox, x60 Checked%Checkboxes1% vOption11, Record Opener - TM Live
Gui, 1: Add, Checkbox, x60 Checked%Checkboxes1% vOption12, Record Opener - TM AT
Gui, 1: Add, Checkbox, x60 Checked%Checkboxes1% vOption13, Record Opener - Invention Live
Gui, 1: Add, Checkbox, x60 Checked%Checkboxes1% vOption14, Record Opener - Invention AT


































