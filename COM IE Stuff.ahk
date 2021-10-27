#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

^1::
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

^k::
ClientCode = QVID.123BR

For IE in ComObjCreate("Shell.Application").Windows ; for each open window
If InStr(IE.FullName, "iexplore.exe") ; check if it's an ie window
break ; keep that window's handle
; this assumes an ie window is available. it won't work if not
;IE.Navigate("http://www.google.com") ; go to the ahk forum page
;IE.Visible := true
;While IE.Busy ; simple wait for page to load
;Sleep, 100 ; 1/10 second
;ie := ComObjCreate("InternetExplorer.Application") ;create a IE instance
ie.Visible := True
ie.Navigate("http://oc-docketing/CPi/patschCountryApplication.aspx")
;IELoad(wb)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ie.Document.All.schstrCaseNumber_TextBox.Value := ClientCode
ie.Document.All.btnStartSearch.Click()
return



^j::
;wb := ComObjCreate("InternetExplorer.Application")
;wb.Visible := true  ; This is known to work incorrectly on IE7.
;wb.Navigate("https://autohotkey.com/")

wb := IEGet("Google") ;IE instance already open and tab named google existslwb.Document.All.q.Value := "site:autohotkey.com tutorial"
wb.Document.All.btnG.Click()
SendInput {Enter}
IELoad(wb)
;or
wb := ComObjCreate("InternetExplorer.Application") ;create a IE instance
wb.Visible := True
wb.Navigate("http://oc-docketing/CPi/patschCountryApplication.aspx")
IELoad(wb)
wb.Document.All.schstrCaseNumber_TextBox.Value := "QVID.123BR"
wb.Document.All.btnStartSearch.Click()
SendInput {Enter}
IELoad(wb)

return


IEGet(Name="")        ;Retrieve pointer to existing IE window/tab
{
    IfEqual, Name,, WinGetTitle, Name, ahk_class IEFrame
        Name := ( Name="New Tab - Windows Internet Explorer" ) ? "about:Tabs"
        : RegExReplace( Name, " - (Windows|Microsoft) Internet Explorer" )
    For wb in ComObjCreate( "Shell.Application" ).Windows
        If ( wb.LocationName = Name ) && InStr( wb.FullName, "iexplore.exe" )
            Return wb
} ;written by Jethrow


IELoad(wb)    ;You need to send the IE handle to the function unless you define it as global.
{
    If !wb    ;If wb is not a valid pointer then quit
        Return False
    Loop    ;Otherwise sleep for .1 seconds untill the page starts loading
        Sleep,100
    Until (wb.busy)
    Loop    ;Once it starts loading wait until completes
        Sleep,100
    Until (!wb.busy)
    Loop    ;optional check to wait for the page to completely load
        Sleep,100
    Until (wb.Document.Readystate = "Complete")
Return True
}