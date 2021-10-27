#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

/*

radiogroup2 CLICK= I certify that I am working under the authority of the certificate holder: Daniel E. Altman 

WAIT

certname1 = * Your First Name 

certname2 = * Your Last Name 

certaddr1 = * Your e-Mail Address 

My workplace CLICK= My Workplace

Saved Submission Package  - 

pkiSaveType_1 = My Saved Packages

retrievepract CLICK = Retrieve

saved_0 = First option

*/

^j::
FillEFS:
FirstName := "Tyler"
LastName := "Dickson"
EmailAddress := "instructions@knobbe.com"

;Gui, Submit
For IE in ComObjCreate("Shell.Application").Windows ; for each open window
If InStr(IE.FullName, "iexplore.exe") ; check if it's an ie window
break ; keep that window's handle
ie.Navigate("https://efs.uspto.gov/EFSWebUIRegistered/EFSWebRegistered")
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
ie.Document.All.radiogroup2.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
ie.Document.All.certname1.Value := FirstName
ie.Document.All.certname2.Value := LastName
ie.Document.All.certaddr1.Value := EmailAddress
ie.Document.getElementById("My workplace").Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
SendInput ^l
Sleep 200
SendInput, https://efs.uspto.gov/EFSWebUIRegistered/EFSWebRegistered#
SendInput {Enter}
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
ie.Document.All.pkiSaveType_1.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
Sleep 200
ie.Document.All.retrievepract.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
SendInput {Space}
return


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














