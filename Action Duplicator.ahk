#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Enabled := ComObjError(false)

^j::
MetastormGrab: ; TO BE IMPLEMENTED
OutputVar = http://oc-docketing/CPi/tmkfrmTrademark.aspx?key=430607
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
  ie.Visible := True
   params := [OutputVar, 32]
}
;ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
BaseDate := ie.document.getElementByID("flddteBaseDate").Value
Remarks := ie.document.getElementByID("fldstrRemarks").Value
Sleep 1000
SplashTextOn, 400, 400, Information Copied,Client Code: %ClientCode%`n`nCountry: %Country%`n`nAction Type: %ActionType%`n`nBase Date: %BaseDate%`n`nGeneral Remarks: %Remarks%
Sleep 2000
SplashTextOff
return

^k::
SplashTextOn, 400, 400, Information to Paste,Client Code: %ClientCode%`n`nCountry: %Country%`n`nAction Type: %ActionType%`n`nBase Date: %BaseDate%`n`nGeneral Remarks: %Remarks%
Sleep 2000
SplashTextOff
;MetastormGrab: ; TO BE IMPLEMENTED
OutputVar = http://oc-docketing/CPi/tmkfrmTrademark.aspx?key=430607
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
  ie.Visible := True
   params := [OutputVar, 32]
}
;ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := ClientCode
ie.document.getElementByID("fldstrCountry_TextBox").Value := Country
ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
ie.document.getElementByID("flddteBaseDate").Value := BaseDate
ie.document.getElementByID("fldstrRemarks").Value := Remarks
Sleep 1000
return


/*
ie.Document.All.certname2.Value := EFSLast
ie.Document.All.certaddr1.Value := EFSEmail
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second


ie.Document.All.radiogroup2.Click()
ie.Document.getElementById("My workplace").Click()
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
ie.Document.All.pkiSaveType_1.Click()
Sleep, 100 ; 1/10 second
IELoad(wb)
Sleep 200
ie.Document.All.retrievepract.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
SendInput {Space}
Sleep 1000
gosub RecordEFSFill
*/

return	





































/*

DocketingFill: ; TO BE IMPLEMENTED
OutputVar = https://efs.uspto.gov/EFSWebUIRegistered/EFSWebRegistered#
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
   ie.Visible := True
   params := [OutputVar, 32]
}
;ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
ie.Document.All.radiogroup2.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
ie.Document.All.certname1.Value := EFSFirst
ie.Document.All.certname2.Value := EFSLast
ie.Document.All.certaddr1.Value := EFSEmail
ie.Document.getElementById("My workplace").Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
Progress, P50, ...living on a prayer..., We're halfway there..., Filling EFS Information, 
ie.Navigate(params*)
                                        ;    SendInput ^l
;   This one works on the other method. ;    Sleep 200
                                        ;    SendInput, https://efs.uspto.gov/EFSWebUIRegistered/EFSWebRegistered#
                                        ;    SendInput {Enter}
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
ie.Document.All.pkiSaveType_1.Click()
Sleep, 100 ; 1/10 second
IELoad(wb)
Sleep 200
ie.Document.All.retrievepract.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
SendInput {Space}
Sleep 1000
gosub RecordEFSFill
return	

*/










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
