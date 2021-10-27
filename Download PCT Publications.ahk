#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Enabled := ComObjError(false)
Gui, New, ,Download PCT Publication
Gui, Add, Text, w160 h40 +Center, Enter PCT #s to download.`n`nOne PCT # per line.
Gui, Font, s10
Gui, Add, Edit, w160 h200 vPCTNumber, 
Gui, Font
Gui, Add, Button, w160 h40 +Center gDownloadPDF, Download Publications
Gui, Show, 
return

DownloadPDF:
Gui, Submit, NoHide
StringSplit, PCTNumber, PCTNumber, `n , . ; Omits periods.  
test := ie.locationURL
SearchTerm = PAMPH
SearchTerm2 = download
PCTNumber = %PCTNumber%

Loop, %PCTNumber0%
{
OutputVar = https://patentscope.wipo.int/search/en/search.jsf
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
	ie := ComObjCreate("InternetExplorer.Application")
	ie.Visible := false
	params := [OutputVar, 32]
}
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ie.document.getElementByID("simpleSearchSearchForm:fpSearch").Value := PCTNumber%A_Index%
ie.document.getElementByID("simpleSearchSearchForm:commandSimpleFPSearch").Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ie.document.getElementByID("detailMainForm:PCTDocuments:header").Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ie.document.getElementByID("detailMainForm:j_idt988:0:j_idt997").Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
Sleep 1000
If InStr(ie.locationURL,test)
	{
	Links1 := ie.Document.Links.Length
	Links := ie.Document.Links
		Loop % Links.Length
			If InStr(Links[A_Index-1].href,SearchTerm) && InStr(Links[A_Index-1].href,SearchTerm2)
				Links[A_Index-1].Click()
	}
	ie.Visible := true
	Sleep 2000
ControlFocus, DirectUIHWND1
SendInput !o
Sleep 1000
ie.Visible := false
Sleep 1000
ie.Quit()
Sleep 1000
}
MsgBox, Process complete.`n`nPlease confirm all publications were downloaded.`n`nIf any are missing, verify the PCT # is correct and/or download manually.
return

GuiClose:
ExitApp 

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
