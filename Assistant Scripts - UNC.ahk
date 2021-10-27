#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
;Menu, Tray, Icon, mmcndmgr.dll , 59
formattime, ThisHour, , MM.dd.yyyy-htt


/* 
H: - OC  \\docs-oc\files\
S: - SD  \\docs-sd\files\
U: - DC  \\dc-docs\files\
V: - SEA \\sea-docs\files\
Q: - SV  \\sv-docs\files\
Y: - NY  \\ny-docs\files\
L: - LA  \\docs-la\files\
W: - SF  \\docs-sf\files\

\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\
*/


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;    CHECK IF USERNAME MATCHES USER FILE    ;;
;;   (FIX FOR THOSE WITH MAIDEN NAMES...)    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}

if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;         CHECK IF SAVE FILE EXISTS         ;;
;;            IF NOT, CREATE IT.             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IfExist, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini
	{
	SetTimer, PeriodicRestart, 3600000
	return
	}
else
	{
	gosub CreateFile
	SetTimer, PeriodicRestart, 3600000
	}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;    RESTART HOURLY TO CHECK FOR UPDATES    ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PeriodicRestart:
Reload
Sleep 5000    ; Shouldn't ever reach this. Tries again just in case the first one fails.
Reload
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;     CLOSE UNNECESSARY WINDOW DIALOGS      ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CloseWindow:
IfWinExist, Message from webpage, Record has successfully been saved.                				;  ahk_class #32770 - Message from webpage, Record has successfully been saved.
	WinClose, Message from webpage, Record has successfully been saved.
IfWinExist, Message from webpage, The specified search criteria did not match any records.          ;  ahk_class #32770 - Message from webpage, The specified search criteria did not match any records.
	WinClose, Message from webpage, The specified search criteria did not match any records.
IfWinActive, Opening Mail Attachment, You should only open attachments from a trustworthy source.   ;  ahk_class #32770 - Opening Mail Attachment, You should only open attachments from a trustworthy source.
	ControlSend,  , {Alt down}O{Alt up}, Opening Mail Attachment
IfWinActive, WorkSite, The version of this document                
	ControlSend,  , {Alt down}Y{Alt up}, WorkSite
IfWinActive, Microsoft Excel Security Notice
	ControlSend,  , {Alt down}Y{Alt up}, Microsoft Excel Security Notice
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;            OPEN AHK HELP FILE             ;;
;;                (DISABLED)                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

OpenHelp:
FileCopy, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HTML\AHK Instructions.html, C:\Users\%Computername%\AHK Instructions.html, 1
Sleep 2000
Run "C:\Users\%ComputerName%\AHK Instructions.html"
return

CreateFile:
IniWrite, 0, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSCertFinder
IniWrite, 0, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSCertFinder
IniWrite, 0, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSFill
IniWrite, 0, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSFill
IniWrite, 0, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSLogin
IniWrite, 0, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSLogin
IniWrite, 0, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
IniWrite, 0, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, ClientCodeIE
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;             RUN RECORD OPENER             ;;
;;       Hold Control and Right Click        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^RButton::
Gui, Destroy
CoordMode, Mouse, Screen     							   ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
SendInput ^c
ClipWait, .2
Sleep 50
StringLen, ClipLength, Clipboard
NewMousePosX := (xpos - 150)								; Adjust X position for GUI.
NewMousePosY := (ypos - 50)									; Adjust Y position for GUI.
Gui, New, +Owner +AlwaysOnTop, OpenInIE
Gui, Font, s10 w500, Verdana
Gui, Font, bold
Gui, Add, Button, x70 y0 h25 w150, %Clipboard%
Gui, Font, s10 w500 normal, Verdana
Gui, Add, Button, x70 y30 w150 h25 gOpenPATLive, Open Patent
Gui, Add, Button, x70 y60 w150 h25 gOpenTMLive, Open Trademark	 			
Gui, Add, Button, x70 y90 w150 h25 gCancelOpen, Cancel
Gui, Show, x%NewMousePosX% y%NewMousePosY%
Gui, +ToolWindow -Caption                          			 ; Removes the Border and Task bar icon
Gui, Color, 000111, OpenInIE                                 ; can be any colour but it's good to use a color that is NOT present in ur GUI
WinSet, Transcolor, 000111, OpenInIE
Gui, Show, x%NewMousePosX% y%NewMousePosY%
return

CancelOpen:
Gui, Hide
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;				; Reference page for Record Opener options.
;;                                           ;;				; https://msdn.microsoft.com/en-us/library/dd565688(v=vs.85).aspx
;;          TRADEMARK RECORD OPENER          ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

OpenTMLive:
Gui, Submit
OutputVar = http://oc-docketing/CPi/tmkschTrademark.aspx
ie := WBGet()
	if IsObject(ie) = 0
		{
		Run "iexplore.exe"
		Sleep 3000
		ie := WBGet()
		}
	else
var := ie.LocationURL 									;grab current url
while ie.busy or ie.ReadyState != 4 					;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Navigate(params*)
	While IE.Busy 											; simple wait for page to load
	Sleep, 100
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;            PATENT RECORD OPENER           ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

OpenPATLive:
Gui, Submit
OutputVar = http://oc-docketing/CPi/patschCountryApplication.aspx
ie := WBGet()
	if IsObject(ie) = 0
		{
		Run "iexplore.exe"
		Sleep 3000
		ie := WBGet()
		}
	else
var := ie.LocationURL 									;grab current url
while ie.busy or ie.ReadyState != 4 					;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Navigate(params*)
	While IE.Busy ; simple wait for page to load
	Sleep, 100
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;             EFS INFO FILLER               ;;
;;                (DISABLED)                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


/*
#E::
EFSFill:
IniRead, EFSFirst,C:\Users\%Computername%\AHKPrefs.ini, Username, EFSFirst
IniRead, EFSLast, C:\Users\%Computername%\AHKPrefs.ini, Username, EFSLast
IniRead, EFSEmail,C:\Users\%Computername%\AHKPrefs.ini, Username, EFSEmail
EFSFirst = %EFSFirst%
EFSLast  = %EFSLast%
EFSEmail = %EFSEmail%
OutputVar = https://efs.uspto.gov/EFSWebUIRegistered/EFSWebRegistered#
ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Document.All.radiogroup2.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ie.Document.All.certname1.Value := EFSFirst
ie.Document.All.certname2.Value := EFSLast
ie.Document.All.certaddr1.Value := EFSEmail
ie.Document.getElementById("My workplace").Click()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ie.Navigate(params*)
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ie.Document.All.pkiSaveType_1.Click()
Sleep, 100 ; 1/10 second
Sleep 200
ie.Document.All.retrievepract.Click()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
SendInput {Space}
Sleep 1000
gosub RecordEFSFill
return	


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;              EFS FEE LOGIN                ;;
;;                (DISABLED)                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#F::
EFSPayLogIn:
TrayTip, Getting started..., Starting the EFS Fee Login process...
YourSearchStr := "loginLogout"
IniRead, EFSPayEmail,    C:\Users\%Computername%\AHKPrefs.ini, Username, EFSPayEmail
IniRead, EFSPayPassword, C:\Users\%Computername%\AHKPrefs.ini, Username, EFSPayPassword
EFSPayEmail = %EFSPayEmail%
EFSPayPassword  = %EFSPayPassword%
OutputVar = https://fees.uspto.gov/pay/
YourSearchStr := "loginLogout"
ie := ComObjCreate("InternetExplorer.Application")
ie.Visible := False
;params := [OutputVar, 4096]
params := [OutputVar, 32]
ie.Navigate(params*)
	While IE.Busy ; simple wait for page to load
	Sleep, 100 ; 1/10 second
ie.Document.All.loginLogout.Click()
	While IE.Busy ; simple wait for page to load
	Sleep, 100 ; 1/10 second
	;IELoad(wb)
ie.Document.All.dijit_form_Button_8_label.Click()
	While IE.Busy ; simple wait for page to load
	Sleep, 100 ; 1/10 second
	;IELoad(wb)
TrayTip, Please wait..., Signing into EFS...
ie.Quit() ; this is if you want the ie browser to close once the string as been found
Sleep 5000
ie := ComObjCreate("InternetExplorer.Application")
ie.Visible := False
;params := [OutputVar, 4096]
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ie.Document.All.headerSignInLink.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
ie.Document.All.uniqName_11_9.Value := EFSPayEmail
ie.Document.All.uniqName_11_10.Value := EFSPayPassword
Sleep 250
ie.Document.All.dijit_form_Button_10.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
Sleep 5000
ie.Quit() ; this is if you want the ie browser to close once the string as been found
TrayTip, And we're done!, You should now (hopefully) be signed into EFS Fees.
gosub RecordEFSLogin
return	
*/

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;         FIND EFS LOCATION/PASSWORD        ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GetPassword:
Send ^a
Sleep 200
Send ^c
Sleep 500
IniRead, Password, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\EFS - UNC.ini, EFS, %Clipboard%
Sleep 500
TrayTip, %Clipboard%,%Password%
Send {Tab}
Sleep 1250
Send {Tab}
Send ^a
Sleep 200
Send {Delete}
Sleep 200
Send %Password%
Sleep 500		
Clipboard = 
Sleep 3000
TrayTip
gosub RecordEFSCertFinder
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;        EFS CERT FINDER HOTSTRINGS         ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#If WinActive("ahk_class IEFrame") || WinActive("ahk_class SunAwtFrame")

::!DXC::
SendInput \\docs-oc\files\USPTO\David.Cohen.epf
Clipboard = \\docs-oc\files\USPTO\David.Cohen.epf
Sleep 200
gosub, GetPassword
return

::!DWK::
SendInput \\docs-sf\files\USPTO\David.Kellogg.epf
Clipboard = \\docs-sf\files\USPTO\David.Kellogg.epf
Sleep 200
gosub, GetPassword
return

::!LLS::
SendInput \\docs-sd\files\USPTO\Loni.Morrow.epf
Clipboard = \\docs-sd\files\USPTO\Loni.Morrow.epf
Sleep 200
gosub, GetPassword
return

::!MBH::
SendInput \\ny-docs\files\USPTO\Mitch.Hadley.epf
Clipboard = \\ny-docs\files\USPTO\Mitch.Hadley.epf
Sleep 200
gosub, GetPassword
return

::!DCT::
SendInput \\docs-sd\files\USPTO\Dylan.Turner.epf
Clipboard = \\docs-sd\files\USPTO\Dylan.Turner.epf
Sleep 200
gosub, GetPassword
return

::!RHP::
SendInput \\docs-sd\files\USPTO\Rick.Park.epf
Clipboard = \\docs-sd\files\USPTO\Rick.Park.epf
Sleep 200
gosub, GetPassword
return


::!SGS::
SendInput \\docs-sf\files\USPTO\Scott.Siera.epf
Clipboard = \\docs-sf\files\USPTO\Scott.Siera.epf
Sleep 200
gosub, GetPassword
return

::!VXT::
SendInput \\docs-oc\files\USPTO\Vlad.Teplitskiy.epf
Clipboard = \\docs-oc\files\USPTO\Vlad.Teplitskiy.epf
Sleep 200
gosub, GetPassword
return

::!JPL::
SendInput \\docs-oc\files\USPTO\Josepher.Li.epf
Clipboard = \\docs-oc\files\USPTO\Josepher.Li.epf
gosub, GetPassword
return

::!BHL::
SendInput \\docs-sf\files\USPTO\Ben.Liu.epf
Clipboard = \\docs-sf\files\USPTO\Ben.Liu.epf
gosub, GetPassword
return

::!CDD::
SendInput \\docs-sd\files\USPTO\Casey.Donahoe.epf
Clipboard = \\docs-sd\files\USPTO\Casey.Donahoe.epf
gosub, GetPassword
return

::!JJC::
SendInput \\docs-oc\files\USPTO\Jeremy.Carney.epf
Clipboard = \\docs-oc\files\USPTO\Jeremy.Carney.epf
gosub, GetPassword
return

::!JZA::
SendInput \\docs-oc\files\USPTO\Jessica.Achtsam.epf
Clipboard = \\docs-oc\files\USPTO\Jessica.Achtsam.epf
gosub, GetPassword
return

::!NJL::
SendInput \\docs-oc\files\USPTO\Nathan.Lee.epf
Clipboard = \\docs-oc\files\USPTO\Nathan.Lee.epf
gosub, GetPassword
return

::!SYW::
SendInput \\docs-oc\files\USPTO\Sabrina.Wang.epf
Clipboard = \\docs-oc\files\USPTO\Sabrina.Wang.epf
gosub, GetPassword
return

::!AKD::
SendInput \\docs-oc\files\USPTO\Angela.Dremann.epf
Clipboard = \\docs-oc\files\USPTO\Angela.Dremann.epf
gosub, GetPassword
return

::!ZJH::
SendInput \\docs-oc\files\USPTO\Zach.Hong.epf
Clipboard = \\docs-oc\files\USPTO\Zach.Hong.epf
gosub, GetPassword
return

::!AUK::
SendInput \\docs-oc\files\USPTO\Alexander.Kappner.epf
Clipboard = \\docs-oc\files\USPTO\Alexander.Kappner.epf
gosub, GetPassword
return

::!AJG::
SendInput \\docs-oc\files\USPTO\Adam.Gilbert.epf
Clipboard = \\docs-oc\files\USPTO\Adam.Gilbert.epf
gosub, GetPassword
return

::!AXJ::
SendInput \\docs-oc\files\USPTO\Agnes.Juang.epf
Clipboard = \\docs-oc\files\USPTO\Agnes.Juang.epf
gosub, GetPassword
return

::!AJS::
SendInput \\docs-oc\files\USPTO\Albert.Sueiras.epf
Clipboard = \\docs-oc\files\USPTO\Albert.Sueiras.epf
gosub, GetPassword
return

::!AJM::
SendInput \\docs-oc\files\USPTO\Alex.Martinez.epf
Clipboard = \\docs-oc\files\USPTO\Alex.Martinez.epf
gosub, GetPassword
return

::!AZ4::
SendInput \\docs-oc\files\USPTO\Allison.Weimer.epf
Clipboard = \\docs-oc\files\USPTO\Allison.Weimer.epf
gosub, GetPassword
return

::!AGB::
SendInput \\docs-oc\files\USPTO\Allyson.Brown.epf
Clipboard = \\docs-oc\files\USPTO\Allyson.Brown.epf
gosub, GetPassword
return

::!ACC::
SendInput \\docs-oc\files\USPTO\Amy.Chun.epf
Clipboard = \\docs-oc\files\USPTO\Amy.Chun.epf
gosub, GetPassword
return

::!AMD::
SendInput \\docs-oc\files\USPTO\Andrew.Douglas.epf
Clipboard = \\docs-oc\files\USPTO\Andrew.Douglas.epf
gosub, GetPassword
return

::!AIK::
SendInput \\docs-oc\files\USPTO\Andrew.Kimmel.epf
Clipboard = \\docs-oc\files\USPTO\Andrew.Kimmel.epf
gosub, GetPassword
return

::!AWL::
SendInput \\docs-oc\files\USPTO\Andrew.Lloyd.epf
Clipboard = \\docs-oc\files\USPTO\Andrew.Lloyd.epf
gosub, GetPassword
return

::!AVS::
SendInput \\docs-oc\files\USPTO\Andrew.Schwaab.epf
Clipboard = \\docs-oc\files\USPTO\Andrew.Schwaab.epf
gosub, GetPassword
return

::!AHS::
SendInput \\docs-oc\files\USPTO\Andrew.Simpson.epf
Clipboard = \\docs-oc\files\USPTO\Andrew.Simpson.epf
gosub, GetPassword
return

::!ASR::
SendInput \\docs-oc\files\USPTO\Art Rose.epf
Clipboard = \\docs-oc\files\USPTO\Art Rose.epf
gosub, GetPassword
return

::!BJE::
SendInput \\docs-oc\files\USPTO\Ben.Everton.epf
Clipboard = \\docs-oc\files\USPTO\Ben.Everton.epf
gosub, GetPassword
return

::!BAK::
SendInput \\docs-oc\files\USPTO\Benajmain.Katzenellenbogen.epf
Clipboard = \\docs-oc\files\USPTO\Benajmain.Katzenellenbogen.epf
gosub, GetPassword
return

::!WBB::
SendInput \\docs-oc\files\USPTO\Bill.Bunker.epf
Clipboard = \\docs-oc\files\USPTO\Bill.Bunker.epf
gosub, GetPassword
return

::!WHS::
SendInput \\docs-oc\files\USPTO\Bill.Shreve.epf
Clipboard = \\docs-oc\files\USPTO\Bill.Shreve.epf
gosub, GetPassword
return

::!BRB::
SendInput \\docs-oc\files\USPTO\Brent Babcock.epf
Clipboard = \\docs-oc\files\USPTO\Brent Babcock.epf
gosub, GetPassword
return

::!BMD::
SendInput \\docs-oc\files\USPTO\Brent Dougal.epf
Clipboard = \\docs-oc\files\USPTO\Brent Dougal.epf
gosub, GetPassword
return

::!BCC::
SendInput \\docs-oc\files\USPTO\Brian Claassen.epf
Clipboard = \\docs-oc\files\USPTO\Brian Claassen.epf
gosub, GetPassword
return

::!BZS::
SendInput \\docs-oc\files\USPTO\Bridget Smith.epf
Clipboard = \\docs-oc\files\USPTO\Bridget Smith.epf
gosub, GetPassword
return

::!BSI::
SendInput \\docs-oc\files\USPTO\Bruce.Itchkawitz.epf
Clipboard = \\docs-oc\files\USPTO\Bruce.Itchkawitz.epf
gosub, GetPassword
return

::!BWW::
SendInput \\docs-oc\files\USPTO\Bryan.Wahl.epf
Clipboard = \\docs-oc\files\USPTO\Bryan.Wahl.epf
gosub, GetPassword
return

::!CKL::
SendInput \\docs-oc\files\USPTO\Catherine.Lee.epf
Clipboard = \\docs-oc\files\USPTO\Catherine.Lee.epf
gosub, GetPassword
return

::!CYL::
SendInput \\docs-oc\files\USPTO\Chang.Lim.epf
Clipboard = \\docs-oc\files\USPTO\Chang.Lim.epf
gosub, GetPassword
return

::!CSC::
SendInput \\docs-oc\files\USPTO\Che.Chereskin.epf
Clipboard = \\docs-oc\files\USPTO\Che.Chereskin.epf
gosub, GetPassword
return

::!CXR::
SendInput \\docs-oc\files\USPTO\Christopher Ross.epf
Clipboard = \\docs-oc\files\USPTO\Christopher Ross.epf
gosub, GetPassword
return

::!CSS::
SendInput \\docs-oc\files\USPTO\Craig.Summers.epf
Clipboard = \\docs-oc\files\USPTO\Craig.Summers.epf
gosub, GetPassword
return

::!CRH::
SendInput \\docs-oc\files\USPTO\Curtis.Huffmire.epf
Clipboard = \\docs-oc\files\USPTO\Curtis.Huffmire.epf
gosub, GetPassword
return

::!CCD::
SendInput \\docs-oc\files\USPTO\Curtiss.Dosier.epf
Clipboard = \\docs-oc\files\USPTO\Curtiss.Dosier.epf
gosub, GetPassword
return

::!DJH::
SendInput \\docs-oc\files\USPTO\Damien.Howard.epf
Clipboard = \\docs-oc\files\USPTO\Damien.Howard.epf
gosub, GetPassword
return

::!DEA::
SendInput \\docs-oc\files\USPTO\Dan.Altman.epf
Clipboard = \\docs-oc\files\USPTO\Dan.Altman.epf
gosub, GetPassword
return

::!DJF::
SendInput \\docs-oc\files\USPTO\Dan.Fischer.epf
Clipboard = \\docs-oc\files\USPTO\Dan.Fischer.epf
gosub, GetPassword
return

::!DVG::
SendInput \\docs-oc\files\USPTO\Daniel.Gibson.epf
Clipboard = \\docs-oc\files\USPTO\Daniel.Gibson.epf
gosub, GetPassword
return

::!DLO::
SendInput \\docs-oc\files\USPTO\Darrell.Olson.epf
Clipboard = \\docs-oc\files\USPTO\Darrell.Olson.epf
gosub, GetPassword
return

::!DSB::
SendInput \\docs-oc\files\USPTO\David.Barnhill.epf
Clipboard = \\docs-oc\files\USPTO\David.Barnhill.epf
gosub, GetPassword
return

::!DMD::
SendInput \\docs-oc\files\USPTO\David.Dremann.epf
Clipboard = \\docs-oc\files\USPTO\David.Dremann.epf
gosub, GetPassword
return

::!DGK::
SendInput \\docs-oc\files\USPTO\David.G.Kim.epf
Clipboard = \\docs-oc\files\USPTO\David.G.Kim.epf
gosub, GetPassword
return

::!DGJ::
SendInput \\docs-oc\files\USPTO\David.Jankowski.epf
Clipboard = \\docs-oc\files\USPTO\David.Jankowski.epf
gosub, GetPassword
return

::!DRS::
SendInput \\docs-oc\files\USPTO\David.Schmidt.epf
Clipboard = \\docs-oc\files\USPTO\David.Schmidt.epf
gosub, GetPassword
return

::!DVK::
SendInput \\docs-oc\files\USPTO\David.T.Kim.epf
Clipboard = \\docs-oc\files\USPTO\David.T.Kim.epf
gosub, GetPassword
return

::!DRB::
SendInput \\docs-oc\files\USPTO\Derek.Bayles.epf
Clipboard = \\docs-oc\files\USPTO\Derek.Bayles.epf
gosub, GetPassword
return

::!DXD::
SendInput \\docs-oc\files\USPTO\Devanie.Dufour.epf
Clipboard = \\docs-oc\files\USPTO\Devanie.Dufour.epf 
gosub, GetPassword
return

::!DGM::
SendInput \\docs-oc\files\USPTO\Doug.Muehlhauser.epf
Clipboard = \\docs-oc\files\USPTO\Doug.Muehlhauser.epf
gosub, GetPassword
return

::!DXW::
SendInput \\docs-oc\files\USPTO\Douglas.Wentzel.epf
Clipboard = \\docs-oc\files\USPTO\Douglas.Wentzel.epf
gosub, GetPassword
return

::!EAS::
SendInput \\docs-oc\files\USPTO\Ed.Schlatter.epf
Clipboard = \\docs-oc\files\USPTO\Ed.Schlatter.epf
gosub, GetPassword
return

::!GVH::
SendInput \\docs-oc\files\USPTO\Gerard.vonHoffmann.epf
Clipboard = \\docs-oc\files\USPTO\Gerard.vonHoffmann.epf
gosub, GetPassword
return

::!GLN::
SendInput \\docs-oc\files\USPTO\Glen.Nuttall.epf
Clipboard = \\docs-oc\files\USPTO\Glen.Nuttall.epf
gosub, GetPassword
return

::!HXM::
SendInput \\docs-oc\files\USPTO\Hans.Mayer.epf
Clipboard = \\docs-oc\files\USPTO\Hans.Mayer.epf
gosub, GetPassword
return

::!HZS::
SendInput \\docs-oc\files\USPTO\Harnik.Shukla.epf
Clipboard = \\docs-oc\files\USPTO\Harnik.Shukla.epf
gosub, GetPassword
return

::!HCS::
SendInput \\docs-oc\files\USPTO\Hochan.Song.epf
Clipboard = \\docs-oc\files\USPTO\Hochan.Song.epf
gosub, GetPassword
return

::!IAL::
SendInput \\docs-oc\files\USPTO\Irfan.Lateef.epf
Clipboard = \\docs-oc\files\USPTO\Irfan.Lateef.epf
gosub, GetPassword
return

::!JUP::
SendInput \\docs-oc\files\USPTO\Jacob.Peterson.epf
Clipboard = \\docs-oc\files\USPTO\Jacob.Peterson.epf
gosub, GetPassword
return

::!JCB::
SendInput \\docs-oc\files\USPTO\Jared.Bunker.epf
Clipboard = \\docs-oc\files\USPTO\Jared.Bunker.epf
gosub, GetPassword
return

::!JZK::
SendInput \\docs-oc\files\USPTO\Jarom.Kesler.epf
Clipboard = \\docs-oc\files\USPTO\Jarom.Kesler.epf 
gosub, GetPassword
return

::!JAG::
SendInput \\docs-oc\files\USPTO\Jason.Gersting.epf
Clipboard = \\docs-oc\files\USPTO\Jason.Gersting.epf
gosub, GetPassword
return

::!JCS::
SendInput \\docs-oc\files\USPTO\Jason.Swartz.epf
Clipboard = \\docs-oc\files\USPTO\Jason.Swartz.epf
gosub, GetPassword
return

::!JUH::
SendInput \\docs-oc\files\USPTO\Jeffery.Hallstrom.epf
Clipboard = \\docs-oc\files\USPTO\Jeffery.Hallstrom.epf
gosub, GetPassword
return

::!JYC::
SendInput \\docs-oc\files\USPTO\Joan.Chan.epf
Clipboard = :\USPTO\Joan.Chan.epf
gosub, GetPassword
return

::!HSU::
SendInput \\docs-oc\files\USPTO\Johannes.Hsu.epf
Clipboard = \\docs-oc\files\USPTO\Johannes.Hsu.epf
gosub, GetPassword
return

::!JRK::
SendInput \\docs-oc\files\USPTO\John King.epf
Clipboard = \\docs-oc\files\USPTO\John King.epf
gosub, GetPassword
return

::!JMG::
SendInput \\docs-oc\files\USPTO\John.Grover.epf
Clipboard = \\docs-oc\files\USPTO\John.Grover.epf
gosub, GetPassword
return

::!JHS::
SendInput \\docs-oc\files\USPTO\John.Sadlik.epf
Clipboard = \\docs-oc\files\USPTO\John.Sadlik.epf
gosub, GetPassword
return

::!JBS::
SendInput \\docs-oc\files\USPTO\John.Sganga.epf
Clipboard = \\docs-oc\files\USPTO\John.Sganga.epf
gosub, GetPassword
return

::!JWG::
SendInput \\docs-oc\files\USPTO\Jon Gurka.epf
Clipboard = \\docs-oc\files\USPTO\Jon Gurka.epf
gosub, GetPassword
return

::!JUC::
SendInput \\docs-oc\files\USPTO\Jordan.Cox.epf
Clipboard = \\docs-oc\files\USPTO\Jordan.Cox.epf
gosub, GetPassword
return

::!JYS::
SendInput \\docs-oc\files\USPTO\Joshua Stowell.epf
Clipboard = \\docs-oc\files\USPTO\Joshua Stowell.epf
gosub, GetPassword
return

::!JDB::
SendInput \\docs-oc\files\USPTO\Joshua.Berk.epf
Clipboard = \\docs-oc\files\USPTO\Joshua.Berk.epf
gosub, GetPassword
return

::!JJG::
SendInput \\docs-oc\files\USPTO\Justin.Gillett.epf
Clipboard = \\docs-oc\files\USPTO\Justin.Gillett.epf
gosub, GetPassword
return

::!KJL::
SendInput \\docs-oc\files\USPTO\Karen.Lenker.epf
Clipboard = \\docs-oc\files\USPTO\Karen.Lenker.epf
gosub, GetPassword
return

::!KAD::
SendInput \\docs-oc\files\USPTO\Karoline.Delaney.epf
Clipboard = \\docs-oc\files\USPTO\Karoline.Delaney.epf
gosub, GetPassword
return

::!KXA::
SendInput \\docs-oc\files\USPTO\Kazuo.Aoki.epf
Clipboard = \\docs-oc\files\USPTO\Kazuo.Aoki.epf
gosub, GetPassword
return

::!KZL::
SendInput \\docs-oc\files\USPTO\Keith.Lim.epf
Clipboard = \\docs-oc\files\USPTO\Keith.Lim.epf
gosub, GetPassword
return

::!KNS::
SendInput \\docs-oc\files\USPTO\Kent.Shum.epf
Clipboard = \\docs-oc\files\USPTO\Kent.Shum.epf
gosub, GetPassword
return

::!LDS::
SendInput \\docs-oc\files\USPTO\Lance.Smemoe.epf
Clipboard = \\docs-oc\files\USPTO\Lance.Smemoe.epf
gosub, GetPassword
return

::!LXK::
SendInput \\docs-oc\files\USPTO\Lauren.Keller.epf
Clipboard = \\docs-oc\files\USPTO\Lauren.Keller.epf
gosub, GetPassword
return

::!LGR::
SendInput \\docs-oc\files\USPTO\Lavanya.Rau.epf
Clipboard = \\docs-oc\files\USPTO\Lavanya.Rau.epf
gosub, GetPassword
return

::!LHL::
SendInput \\docs-oc\files\USPTO\Linda.Liu.epf
Clipboard = \\docs-oc\files\USPTO\Linda.Liu.epf
gosub, GetPassword
return

::!LLX::
SendInput \\docs-oc\files\USPTO\Linda.Xu.epf
Clipboard = \\docs-oc\files\USPTO\Linda.Xu.epf
gosub, GetPassword
return

::!LLY::
SendInput \\docs-oc\files\USPTO\Lori.Yamato.epf
Clipboard = \\docs-oc\files\USPTO\Lori.Yamato.epf
gosub, GetPassword
return

::!MRB::
SendInput \\docs-oc\files\USPTO\Mark Benedict.epf
Clipboard = \\docs-oc\files\USPTO\Mark Benedict.epf
gosub, GetPassword
return

::!MJG::
SendInput \\docs-oc\files\USPTO\Mark Gallagher.epf
Clipboard = \\docs-oc\files\USPTO\Mark Gallagher.epf
gosub, GetPassword
return

::!MED::
SendInput \\docs-oc\files\USPTO\Mark.Davis.epf
Clipboard = \\docs-oc\files\USPTO\Mark.Davis.epf
gosub, GetPassword
return

::!MRZ::
SendInput \\docs-oc\files\USPTO\Marko.Zoretic.epf
Clipboard = \\docs-oc\files\USPTO\Marko.Zoretic.epf
gosub, GetPassword
return

::!MPB::
SendInput \\docs-oc\files\USPTO\Michael.Burns.epf
Clipboard = \\docs-oc\files\USPTO\Michael.Burns.epf
gosub, GetPassword
return

::!MRC::
SendInput \\docs-oc\files\USPTO\Michael.Christensen.epf
Clipboard = \\docs-oc\files\USPTO\Michael.Christensen.epf
gosub, GetPassword
return

::!MAG::
SendInput \\docs-oc\files\USPTO\Michael.Guiliana.epf
Clipboard = \\docs-oc\files\USPTO\Michael.Guiliana.epf
gosub, GetPassword
return

::!MCL::
SendInput \\docs-oc\files\USPTO\Mike.Lee.epf
Clipboard = \\docs-oc\files\USPTO\Mike.Lee.epf
gosub, GetPassword
return

::!MCK::
SendInput \\docs-oc\files\USPTO\Mincheol.Kim.epf
Clipboard = \\docs-oc\files\USPTO\Mincheol.Kim.epf
gosub, GetPassword
return

::!NMZ::
SendInput \\docs-oc\files\USPTO\Nicholas.Zovko.epf
Clipboard = \\docs-oc\files\USPTO\Nicholas.Zovko.epf
gosub, GetPassword
return

::!NXB::
SendInput \\docs-oc\files\USPTO\Nira.Brand.epf
Clipboard = \\docs-oc\files\USPTO\Nira.Brand.epf
gosub, GetPassword
return

::!NAM::
SendInput \\docs-oc\files\USPTO\Nora.Marachelian.epf
Clipboard = \\docs-oc\files\USPTO\Nora.Marachelian.epf
gosub, GetPassword
return

::!OAM::
SendInput \\docs-oc\files\USPTO\Omar.AlMesned.epf
Clipboard = \\docs-oc\files\USPTO\Omar.AlMesned.epf
gosub, GetPassword
return

::!PNC::
SendInput \\docs-oc\files\USPTO\Paul.Conover.epf
Clipboard = \\docs-oc\files\USPTO\Paul.Conover.epf
gosub, GetPassword
return

::!PDO::
SendInput \\docs-oc\files\USPTO\Perry.Oldham.epf
Clipboard = \\docs-oc\files\USPTO\Perry.Oldham.epf
gosub, GetPassword
return

::!PQT::
SendInput \\docs-oc\files\USPTO\Peter.Tong.epf
Clipboard = \\docs-oc\files\USPTO\Peter.Tong.epf
gosub, GetPassword
return

::!PMN::
SendInput \\docs-oc\files\USPTO\Philip.Nelson.epf
Clipboard = \\docs-oc\files\USPTO\Philip.Nelson.epf
gosub, GetPassword
return

::!RNN::
SendInput \\docs-oc\files\USPTO\Rabi.Narula.epf
Clipboard = \\docs-oc\files\USPTO\Rabi.Narula.epf
gosub, GetPassword
return

::!RDS::
SendInput \\docs-oc\files\USPTO\Raymond.Smith.epf
Clipboard = \\docs-oc\files\USPTO\Raymond.Smith.epf
gosub, GetPassword
return

::!RJR::
SendInput \\docs-oc\files\USPTO\Robb.Roby.epf
Clipboard = \\docs-oc\files\USPTO\Robb.Roby.epf
gosub, GetPassword
return

::!ROS::
SendInput \\docs-oc\files\USPTO\Ron.Schoenbaum.epf
Clipboard = \\docs-oc\files\USPTO\Ron.Schoenbaum.epf
gosub, GetPassword
return

::!RMJ::
SendInput \\docs-oc\files\USPTO\Russell.Jeide.epf
Clipboard = \\docs-oc\files\USPTO\Russell.Jeide.epf
gosub, GetPassword
return

::!SHL::
SendInput \\docs-oc\files\USPTO\Sabing.Lee.epf
Clipboard = \\docs-oc\files\USPTO\Sabing.Lee.epf
gosub, GetPassword
return

::!SAM::
SendInput \\docs-oc\files\USPTO\Salima Merani.epf
Clipboard = \\docs-oc\files\USPTO\Salima Merani.epf
gosub, GetPassword
return

::!SZC::
SendInput \\docs-oc\files\USPTO\Scott.Cromar.epf
Clipboard = \\docs-oc\files\USPTO\Scott.Cromar.epf
gosub, GetPassword
return

::!SXR::
SendInput \\docs-oc\files\USPTO\Scott.Raevsky.epf
Clipboard = \\docs-oc\files\USPTO\Scott.Raevsky.epf
gosub, GetPassword
return

::!SXA::
SendInput \\docs-oc\files\USPTO\Sean.Ambrosius.epf
Clipboard = \\docs-oc\files\USPTO\Sean.Ambrosius.epf
gosub, GetPassword
return

::!SXL::
SendInput \\docs-oc\files\USPTO\Shannon.Lam.epf
Clipboard = \\docs-oc\files\USPTO\Shannon.Lam.epf
gosub, GetPassword
return

::!SNS::
SendInput \\docs-oc\files\USPTO\Sheila Swaroop.epf
Clipboard = \\docs-oc\files\USPTO\Sheila Swaroop.epf
gosub, GetPassword
return

::!SCJ::
SendInput \\docs-oc\files\USPTO\Steve.Jensen.epf
Clipboard = \\docs-oc\files\USPTO\Steve.Jensen.epf
gosub, GetPassword
return

::!SPR::
SendInput \\docs-oc\files\USPTO\Steven Ruden.epf
Clipboard = \\docs-oc\files\USPTO\Steven Ruden.epf
gosub, GetPassword
return

::!SJN::
SendInput \\docs-oc\files\USPTO\Steven.Nataupsky.epf
Clipboard = \\docs-oc\files\USPTO\Steven.Nataupsky.epf
gosub, GetPassword
return

::!TXN::
SendInput \\docs-oc\files\USPTO\Tak.Nishimura.epf
Clipboard = \\docs-oc\files\USPTO\Tak.Nishimura.epf
gosub, GetPassword
return

::!TMC::
SendInput \\docs-oc\files\USPTO\Ted Cannon.epf
Clipboard = \\docs-oc\files\USPTO\Ted Cannon.epf
gosub, GetPassword
return

::!TKT::
SendInput \\docs-oc\files\USPTO\Terry.Tullis.epf
Clipboard = \\docs-oc\files\USPTO\Terry.Tullis.epf
gosub, GetPassword
return

::!TGP::
SendInput \\docs-oc\files\USPTO\Theodore.Papagiannis.epf
Clipboard = \\docs-oc\files\USPTO\Theodore.Papagiannis.epf
gosub, GetPassword
return

::!TYY::
SendInput \\docs-oc\files\USPTO\Thomas.Yee.epf
Clipboard = \\docs-oc\files\USPTO\Thomas.Yee.epf
gosub, GetPassword
return

::!VZB::
SendInput \\docs-oc\files\USPTO\Vikas.Bhargava.epf
Clipboard = \\docs-oc\files\USPTO\Vikas.Bhargava.epf
gosub, GetPassword
return

::!VSL::
SendInput \\docs-oc\files\USPTO\Vladimir.Lozan.epf
Clipboard = \\docs-oc\files\USPTO\Vladimir.Lozan.epf
gosub, GetPassword
return

::!JYW::
SendInput \\docs-oc\files\USPTO\YueJoyWang.epf
Clipboard = \\docs-oc\files\USPTO\YueJoyWang.epf
gosub, GetPassword
return

::!ZAG::
SendInput \\docs-oc\files\USPTO\Zachary.Glantz.epf
Clipboard = \\docs-oc\files\USPTO\Zachary.Glantz.epf
gosub, GetPassword
return

::!ABP::
SendInput \\docs-sd\files\USPTO\Adam.Powell.epf
Clipboard = \\docs-sd\files\USPTO\Adam.Powell.epf
gosub, GetPassword
return

::!AEM::
SendInput \\docs-sd\files\USPTO\Andrew.Morrell.epf
Clipboard = \\docs-sd\files\USPTO\Andrew.Morrell.epf
gosub, GetPassword
return

::!BBA::
SendInput \\docs-sd\files\USPTO\Ben.Anger.epf
Clipboard = \\docs-sd\files\USPTO\Ben.Anger.epf
gosub, GetPassword
return

::!BSG::
SendInput \\docs-sd\files\USPTO\Brenden.Gingrich.epf
Clipboard = \\docs-sd\files\USPTO\Brenden.Gingrich.epf
gosub, GetPassword
return

::!PCS::
SendInput \\docs-sd\files\USPTO\Chris Steinhardt.epf
Clipboard = \\docs-sd\files\USPTO\Chris Steinhardt.epf
gosub, GetPassword
return

::!CMD::
SendInput \\docs-sd\files\USPTO\Chris.DiLeo.epf
Clipboard = \\docs-sd\files\USPTO\Chris.DiLeo.epf
gosub, GetPassword
return

::!CLS::
SendInput \\docs-sd\files\USPTO\Claine.Snow.epf
Clipboard = \\docs-sd\files\USPTO\Claine.Snow.epf
gosub, GetPassword
return

::!DOH::
SendInput \\docs-sd\files\USPTO\Dan.Hart.epf
Clipboard = \\docs-sd\files\USPTO\Dan.Hart.epf
gosub, GetPassword
return

::!DKY::
SendInput \\docs-sd\files\USPTO\Dan.Yarbrough.epf
Clipboard = \\docs-sd\files\USPTO\Dan.Yarbrough.epf
gosub, GetPassword
return

::!DPH::
SendInput \\docs-sd\files\USPTO\Daniel Hughes.epf
Clipboard = \\docs-sd\files\USPTO\Daniel Hughes.epf
gosub, GetPassword
return

::!DAK::
SendInput \\docs-sd\files\USPTO\Daniel.Kamkar.epf
Clipboard = \\docs-sd\files\USPTO\Daniel.Kamkar.epf
gosub, GetPassword
return

::!DZD::
SendInput \\docs-sd\files\USPTO\David.Dang.epf
Clipboard = \\docs-sd\files\USPTO\David.Dang.epf
gosub, GetPassword
return

::!DPK::
SendInput \\docs-sd\files\USPTO\David.Kujawa.epf
Clipboard = \\docs-sd\files\USPTO\David.Kujawa.epf
gosub, GetPassword
return

::!DCD::
SendInput \\docs-sd\files\USPTO\Derek.Dailey.epf
Clipboard = \\docs-sd\files\USPTO\Derek.Dailey.epf
gosub, GetPassword
return

::!DSH::
SendInput \\docs-sd\files\USPTO\Drew.Hamilton.epf
Clipboard = \\docs-sd\files\USPTO\Drew.Hamilton.epf
gosub, GetPassword
return

::!EMN::
SendInput \\docs-sd\files\USPTO\Eric Nelson.epf
Clipboard = \\docs-sd\files\USPTO\Eric Nelson.epf
gosub, GetPassword
return

::!ESF::
SendInput \\docs-sd\files\USPTO\Eric.Furman.epf
Clipboard = \\docs-sd\files\USPTO\Eric.Furman.epf
gosub, GetPassword
return

::!FTH::
SendInput \\docs-sd\files\USPTO\Fred.Hale.epf
Clipboard = \\docs-sd\files\USPTO\Fred.Hale.epf
gosub, GetPassword
return

::!FAN::
SendInput \\docs-sd\files\USPTO\Fred.Nicholson.epf
Clipboard = \\docs-sd\files\USPTO\Fred.Nicholson.epf
gosub, GetPassword
return

::!GAH::
SendInput \\docs-sd\files\USPTO\Greg.Hermanson.epf
Clipboard = \\docs-sd\files\USPTO\Greg.Hermanson.epf
gosub, GetPassword
return

::!GXM::
SendInput \\docs-sd\files\USPTO\Greg.Munchinsky.epf
Clipboard = \\docs-sd\files\USPTO\Greg.Munchinsky.epf
gosub, GetPassword
return

::!HZC::
SendInput \\docs-sd\files\USPTO\Heungsoo.Choi.epf
Clipboard = \\docs-sd\files\USPTO\Heungsoo.Choi.epf
gosub, GetPassword
return

::!IWG::
SendInput \\docs-sd\files\USPTO\Ian Gillies.epf
Clipboard = \\docs-sd\files\USPTO\Ian Gillies.epf
gosub, GetPassword
return

::!JFH::
SendInput \\docs-sd\files\USPTO\James.Herkenhoff.epf
Clipboard = \\docs-sd\files\USPTO\James.Herkenhoff.epf
gosub, GetPassword
return

::!JQD::
SendInput \\docs-sd\files\USPTO\Jane.Dai.epf
Clipboard = \\docs-sd\files\USPTO\Jane.Dai.epf
gosub, GetPassword
return

::!JQX::
SendInput \\docs-sd\files\USPTO\Jane.Xia.epf
Clipboard = \\docs-sd\files\USPTO\Jane.Xia.epf
gosub, GetPassword
return

::!JJJ::
SendInput \\docs-sd\files\USPTO\Jason Jardine.epf
Clipboard = \\docs-sd\files\USPTO\Jason Jardine.epf
gosub, GetPassword
return

::!JZL::
SendInput \\docs-sd\files\USPTO\Jing.Liu.epf
Clipboard = \\docs-sd\files\USPTO\Jing.Liu.epf
gosub, GetPassword
return

::!JMC::
SendInput \\docs-sd\files\USPTO\John Carson.epf
Clipboard = \\docs-sd\files\USPTO\John Carson.epf
gosub, GetPassword
return

::!JEG::
SendInput \\docs-sd\files\USPTO\Jordan.Gottdank.epf
Clipboard = \\docs-sd\files\USPTO\Jordan.Gottdank.epf
gosub, GetPassword
return

::!JMR::
SendInput \\docs-sd\files\USPTO\Joseph Reisman.epf
Clipboard = \\docs-sd\files\USPTO\Joseph Reisman.epf
gosub, GetPassword
return

::!JOM::
SendInput \\docs-sd\files\USPTO\Joseph.Mallon.epf
Clipboard = \\docs-sd\files\USPTO\Joseph.Mallon.epf
gosub, GetPassword
return

::!KST::
SendInput \\docs-sd\files\USPTO\Kerry.Taylor.epf
Clipboard = \\docs-sd\files\USPTO\Kerry.Taylor.epf
gosub, GetPassword
return

::!KJM::
SendInput \\docs-sd\files\USPTO\Kimberly Miller.epf
Clipboard = \\docs-sd\files\USPTO\Kimberly Miller.epf
gosub, GetPassword
return

::!KXW::
SendInput \\docs-sd\files\USPTO\Kun.Wang.epf
Clipboard = \\docs-sd\files\USPTO\Kun.Wang.epf
gosub, GetPassword
return

::!LMF::
SendInput \\docs-sd\files\USPTO\Larry.Firestone.epf
Clipboard = \\docs-sd\files\USPTO\Larry.Firestone.epf
gosub, GetPassword
return

::!LEN::
SendInput \\docs-sd\files\USPTO\Lauren.Hockett.epf
Clipboard = \\docs-sd\files\USPTO\Lauren.Hockett.epf
gosub, GetPassword
return

::!MVS::
SendInput \\docs-sd\files\USPTO\Maria.Stout.epf
Clipboard = \\docs-sd\files\USPTO\Maria.Stout.epf
gosub, GetPassword
return

::!MMA::
SendInput \\docs-sd\files\USPTO\Mark.Abumeri.epf
Clipboard = \\docs-sd\files\USPTO\Mark.Abumeri.epf
gosub, GetPassword
return

::!MWC::
SendInput \\docs-sd\files\USPTO\Mark.Catanese.epf
Clipboard = \\docs-sd\files\USPTO\Mark.Catanese.epf
gosub, GetPassword
return

::!MDM::
SendInput \\docs-sd\files\USPTO\Mark.Marsden.epf
Clipboard = \\docs-sd\files\USPTO\Mark.Marsden.epf
gosub, GetPassword
return

::!MLF::
SendInput \\docs-sd\files\USPTO\Michael.Fuller.epf
Clipboard = \\docs-sd\files\USPTO\Michael.Fuller.epf
gosub, GetPassword
return

::!NRL::
SendInput \\docs-sd\files\USPTO\Nate.Luman.epf
Clipboard = \\docs-sd\files\USPTO\Nate.Luman.epf
gosub, GetPassword
return

::!NAI::
SendInput \\docs-sd\files\USPTO\Ned.Israelsen.epf
Clipboard = \\docs-sd\files\USPTO\Ned.Israelsen.epf
gosub, GetPassword
return

::!NSB::
SendInput \\docs-sd\files\USPTO\Neil.Bartfeld.epf
Clipboard = \\docs-sd\files\USPTO\Neil.Bartfeld.epf
gosub, GetPassword
return

::!PYC::
SendInput \\docs-sd\files\USPTO\Paul.Chang.epf
Clipboard = \\docs-sd\files\USPTO\Paul.Chang.epf
gosub, GetPassword
return

::!PXL::
SendInput \\docs-sd\files\USPTO\Peter.Law.epf
Clipboard = \\docs-sd\files\USPTO\Peter.Law.epf
gosub, GetPassword
return

::!RJS::
SendInput \\docs-sd\files\USPTO\Ray.Salenieks.epf
Clipboard = \\docs-sd\files\USPTO\Ray.Salenieks.epf
gosub, GetPassword
return

::!RJH::
SendInput \\docs-sd\files\USPTO\Robert.Hilton.epf
Clipboard = \\docs-sd\files\USPTO\Robert.Hilton.epf
gosub, GetPassword
return

::!RMT::
SendInput \\docs-sd\files\USPTO\Rose.Thiessen.epf
Clipboard = \\docs-sd\files\USPTO\Rose.Thiessen.epf
gosub, GetPassword
return

::!REM::
SendInput \\docs-sd\files\USPTO\Ryan Melnick.epf
Clipboard = \\docs-sd\files\USPTO\Ryan Melnick.epf
gosub, GetPassword
return

::!SCY::
SendInput \\docs-sd\files\USPTO\Samantha.Markley.epf
Clipboard = \\docs-sd\files\USPTO\Samantha.Markley.epf
gosub, GetPassword
return

::!TRA::
SendInput \\docs-sd\files\USPTO\Tom.Arno.epf
Clipboard = \\docs-sd\files\USPTO\Tom.Arno.epf
gosub, GetPassword
return

::!TSC::
SendInput \\docs-sd\files\USPTO\Tom.Cowan.epf
Clipboard = \\docs-sd\files\USPTO\Tom.Cowan.epf
gosub, GetPassword
return

::!TJH::
SendInput \\docs-sd\files\USPTO\Travis.Hill.epf
Clipboard = \\docs-sd\files\USPTO\Travis.Hill.epf
gosub, GetPassword
return

::!VCV::
SendInput \\docs-sd\files\USPTO\Victor.Vassar.epf
Clipboard = \\docs-sd\files\USPTO\Victor.Vassar.epf
gosub, GetPassword
return

::!VKG::
SendInput \\docs-sd\files\USPTO\Vijay.Gore.epf
Clipboard = \\docs-sd\files\USPTO\Vijay.Gore.epf
gosub, GetPassword
return

::!JXW::
SendInput \\docs-sd\files\USPTO\Jeffrey.Wu.epf
Clipboard = \\docs-sd\files\USPTO\Jeffrey.Wu.epf
gosub, GetPassword
return

::!DNW::
SendInput \\docs-la\files\USPTO\David.Weiss.epf
Clipboard = \\docs-la\files\USPTO\David.Weiss.epf
gosub, GetPassword
return

::!MDK::
SendInput \\docs-la\files\USPTO\Mark.Kachner.epf
Clipboard = \\docs-la\files\USPTO\Mark.Kachner.epf
gosub, GetPassword
return

::!MSO::
SendInput \\docs-la\files\USPTO\Mike.Okamoto.epf
Clipboard = \\docs-la\files\USPTO\Mike.Okamoto.epf
gosub, GetPassword
return

::!AXD::
SendInput \\docs-sf\files\USPTO\Aaron.Davis.epf
Clipboard = \\docs-sf\files\USPTO\Aaron.Davis.epf
gosub, GetPassword
return

::!ASA::
SendInput \\docs-sf\files\USPTO\Adeel.Akhtar.epf
Clipboard = \\docs-sf\files\USPTO\Adeel.Akhtar.epf
gosub, GetPassword
return

::!ANM::
SendInput \\docs-sf\files\USPTO\Andrew.Merickel.epf
Clipboard = \\docs-sf\files\USPTO\Andrew.Merickel.epf
gosub, GetPassword
return

::!BMG::
SendInput \\docs-sf\files\USPTO\Brian Graham.epf
Clipboard = \\docs-sf\files\USPTO\Brian Graham.epf
gosub, GetPassword
return

::!DRT::
SendInput \\docs-sf\files\USPTO\David.Trossen.epf
Clipboard = \\docs-sf\files\USPTO\David.Trossen.epf
gosub, GetPassword
return


::!ELF::
SendInput \\docs-sf\files\USPTO\Eric.Fong.epf
Clipboard = \\docs-sf\files\USPTO\Eric.Fong.epf
gosub, GetPassword
return

::!KZM::
SendInput \\docs-sf\files\USPTO\Kyu.Min.epf
Clipboard = \\docs-sf\files\USPTO\Kyu.Min.epf
gosub, GetPassword
return

::!PSS::
SendInput \\docs-sf\files\USPTO\Paul.Stellman.epf
Clipboard = \\docs-sf\files\USPTO\Paul.Stellman.epf
gosub, GetPassword
return

::!VXL::
SendInput \\docs-sf\files\USPTO\V.Lakshmananepf.epf
Clipboard = \\docs-sf\files\USPTO\V.Lakshmananepf.epf
gosub, GetPassword
return

::!ZYW::
SendInput \\docs-sf\files\USPTO\Zi Wong.epf
Clipboard = \\docs-sf\files\USPTO\Zi Wong.epf
gosub, GetPassword
return

::!DJG::
SendInput \\dc-docs\files\USPTO\David.Grant.epf
Clipboard = \\dc-docs\files\USPTO\David.Grant.epf
gosub, GetPassword
return

::!JUB::
SendInput \\dc-docs\files\USPTO\Julie.Burke.epf
Clipboard = \\dc-docs\files\USPTO\Julie.Burke.epf
gosub, GetPassword
return

::!MUM::
SendInput \\dc-docs\files\USPTO\Mark.Metzke.epf
Clipboard = \\dc-docs\files\USPTO\Mark.Metzke.epf
gosub, GetPassword
return

::!AVB::
SendInput \\sea-docs\files\USPTO\Adam.Burks.epf
Clipboard = \\sea-docs\files\USPTO\Adam.Burks.epf
gosub, GetPassword
return

::!AFQ::
SendInput \\sea-docs\files\USPTO\Andrew.Quecan.epf
Clipboard = \\sea-docs\files\USPTO\Andrew.Quecan.epf
gosub, GetPassword
return

::!BPJ::
SendInput \\sea-docs\files\USPTO\Benjamin.Johnson.epf
Clipboard = \\sea-docs\files\USPTO\Benjamin.Johnson.epf
gosub, GetPassword
return

::!BGM::
SendInput \\sea-docs\files\USPTO\Bryan McWhorter.epf
Clipboard = \\sea-docs\files\USPTO\Bryan McWhorter.epf
gosub, GetPassword
return

::!CTS::
SendInput \\sea-docs\files\USPTO\Christopher Sweeney.epf
Clipboard = \\sea-docs\files\USPTO\Christopher Sweeney.epf
gosub, GetPassword
return

::!CBH::
SendInput \\sea-docs\files\USPTO\Colin Heideman.epf
Clipboard = \\sea-docs\files\USPTO\Colin Heideman.epf
gosub, GetPassword
return

::!MCA::
SendInput \\sea-docs\files\USPTO\Maria Anderson.epf
Clipboard = \\sea-docs\files\USPTO\Maria Anderson.epf
gosub, GetPassword
return

::!MAU::
SendInput \\sea-docs\files\USPTO\Mauricio Uribe.epf
Clipboard = \\sea-docs\files\USPTO\Mauricio Uribe.epf
gosub, GetPassword
return

::!MJS::
SendInput \\sea-docs\files\USPTO\Melanie Seelig.epf
Clipboard = \\sea-docs\files\USPTO\Melanie Seelig.epf
gosub, GetPassword
return

::!SWF::
SendInput \\sea-docs\files\USPTO\Scott.Forbes.epf
Clipboard = \\sea-docs\files\USPTO\Scott.Forbes.epf
gosub, GetPassword
return

::!YXL::
SendInput \\sea-docs\files\USPTO\Yiheng.Li.epf
Clipboard = \\sea-docs\files\USPTO\Yiheng.Li.epf
gosub, GetPassword
return

::!ADM::
SendInput \\sv-docs\files\USPTO\Alejandro.Munoz.epf
Clipboard = \\sv-docs\files\USPTO\Alejandro.Munoz.epf
gosub, GetPassword
return

::!AVS::
SendInput \\sv-docs\files\USPTO\Andrew.Schwaab.epf
Clipboard = \\sv-docs\files\USPTO\Andrew.Schwaab.epf
gosub, GetPassword
return

::!JXV::
SendInput \\docs-la\files\USPTO\Josue.Villalta.epf
Clipboard = \\docs-la\files\USPTO\Josue.Villalta.epf
gosub, GetPassword
return

::!EAL::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gEAL1, SD - \\docs-sd\files\USPTO
Gui, Add, Button, x112  y25 gEAL2, SF - \\docs-sf\files\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gEAL3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

EAL1:
Gui, Submit
Sleep 200
SendInput \\docs-sd\files\USPTO\EliLoots.epf
Clipboard = \\docs-sd\files\USPTO\EliLoots.epf
Sleep 200
gosub, GetPassword
return

EAL2:
Gui, Submit
Sleep 200
SendInput \\docs-sf\files\USPTO\EliLoots.epf
Clipboard = \\docs-sf\files\USPTO\EliLoots.epf
Sleep 200
gosub, GetPassword
return

EAL3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}


::!EYZ::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gEYZ1, SV - \\sv-docs\files\USPTO
Gui, Add, Button, x112  y25 gEYZ2, OC - \\docs-oc\files\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gEYZ3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

EYZ1:
Gui, Submit
Sleep 200
SendInput \\sv-docs\files\USPTO\Eric.Zhou.epf
Clipboard = \\sv-docs\files\USPTO\Eric.Zhou.epf
Sleep 200
gosub, GetPassword
return

EYZ2:
Gui, Submit
Sleep 200
SendInput \\docs-oc\files\USPTO\Eric.Zhou.epf
Clipboard = \\docs-oc\files\USPTO\Eric.Zhou.epf
Sleep 200
gosub, GetPassword
return

EYZ3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}


::!GRM::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gGRM1, OC - \\docs-oc\files\USPTO
Gui, Add, Button, x112  y25 gGRM2, SF - \\docs-sf\files\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gGRM3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

GRM1:
Gui, Submit
Sleep 200
SendInput \\docs-oc\files\USPTO\Grant.McAdams.epf
Clipboard = \\docs-oc\files\USPTO\Grant.McAdams.epf
Sleep 200
gosub, GetPassword
return

GRM2:
Gui, Submit
Sleep 200
SendInput \\docs-sf\files\USPTO\Grant.McAdams.epf
Clipboard = \\docs-sf\files\USPTO\Grant.McAdams.epf
Sleep 200
gosub, GetPassword
return

GRM3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

/*

::!JXV::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gJXV1, LA - \\docs-la\files\USPTO
Gui, Add, Button, x112  y25 gJXV2, OC - \\docs-oc\files\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gJXV3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

JXV1:
Gui, Submit
Sleep 200
SendInput \\docs-la\files\USPTO\Josue.Villalta.epf
Sleep 200
gosub, GetPassword
return

JXV2:
Gui, Submit
Sleep 200
SendInput \\docs-oc\files\USPTO\Josue.Villalta.epf
Sleep 200
gosub, GetPassword
return

JXV3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

*/

::!LSE::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gLSE1, OC - \\docs-oc\files\USPTO
Gui, Add, Button, x112  y25 gLSE2, DC - \\dc-docs\files\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gLSE3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

LSE1:
Gui, Submit
Sleep 200
SendInput \\docs-oc\files\USPTO\Lincoln.Essig.epf
Clipboard = \\docs-oc\files\USPTO\Lincoln.Essig.epf
Sleep 200
gosub, GetPassword
return

LSE2:
Gui, Submit
Sleep 200
SendInput \\dc-docs\files\USPTO\Lincoln.Essig.epf
Clipboard = \\dc-docs\files\USPTO\Lincoln.Essig.epf
Sleep 200
gosub, GetPassword
return

LSE3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

::!MHT::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gMHT1, OC - \\docs-oc\files\USPTO
Gui, Add, Button, x112  y25 gMHT2, SV - \\sv-docs\files\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gMHT3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

MHT1:
Gui, Submit
Sleep 200
SendInput \\docs-oc\files\USPTO\Michael.Trenholm.epf
Clipboard = \\docs-oc\files\USPTO\Michael.Trenholm.epf
Sleep 200
gosub, GetPassword
return

MHT2:
Gui, Submit
Sleep 200
SendInput \\sv-docs\files\USPTO\Michael.Trenholm.epf
Clipboard = \\sv-docs\files\USPTO\Michael.Trenholm.epf
Sleep 200
gosub, GetPassword
return

MHT3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

::!MZC::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gMZC1, OC - \\docs-oc\files\USPTO
Gui, Add, Button, x112  y25 gMZC2, SD - \\docs-sd\files\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gMZC3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

MZC1:
Gui, Submit
Sleep 200
SendInput \\docs-oc\files\USPTO\Morgan.Coates.epf
Clipboard = \\docs-oc\files\USPTO\Morgan.Coates.epf
Sleep 200
gosub, GetPassword
return

MZC2:
Gui, Submit
Sleep 200
SendInput \\docs-sd\files\USPTO\Morgan.Coates.epf
Clipboard = \\docs-sd\files\USPTO\Morgan.Coates.epf
Sleep 200
gosub, GetPassword
return

MZC3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

::!JLP::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gJLP1, SD - \\docs-sd\files\USPTO
Gui, Add, Button, x112  y25 gJLP2, OC - \\docs-oc\files\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gJLP3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

JLP1:
Gui, Submit
Sleep 200
SendInput \\docs-sd\files\USPTO\John.Paik.epf
Clipboard = \\docs-sd\files\USPTO\John.Paik.epf
Sleep 200
gosub, GetPassword
return

JLP2:
Gui, Submit
Sleep 200
SendInput \\docs-oc\files\USPTO\John.Paik.epf
Clipboard = \\docs-oc\files\USPTO\John.Paik.epf
Sleep 200
gosub, GetPassword
return

JLP3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

#If


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;                 ANALYTICS                 ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

RecordEFSCertFinder:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, EFSCertFinder, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinderH, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSCertFinder
EFSCertFinder++
EFSCertFinderH++
IniWrite, %EFSCertFinder%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSCertFinder
IniWrite, %EFSCertFinderH%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSCertFinder
return

RecordEFSFill:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, EFSFill, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSFill
IniRead, EFSFillH, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%-%ThisHour%.ini, Achievements, EFSFill
EFSFill++
EFSFillH++
IniWrite, %EFSFill%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSFill
IniWrite, %EFSFillH%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSFill
return

RecordEFSLogin:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, EFSLogin, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSLogin
IniRead, EFSLoginH, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%-%ThisHour%.ini, Achievements, EFSLogin
EFSLogin++
EFSLoginH++
IniWrite, %EFSLogin%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSLogin
IniWrite, %EFSLoginH%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSLogin
return

RecordClientCodeIE:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, ClientCodeIE, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIEH, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, ClientCodeIE
ClientCodeIE++
ClientCodeIEH++
IniWrite, %ClientCodeIE%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
IniWrite, %ClientCodeIEH%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\%Computername%-%ThisHour%.ini, Achievements, ClientCodeIE
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;                HOTSTRINGS                 ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

::#shrug::¯\_(ツ)_/¯
::btw::by the way

;************Pointer to Open IE Window******************
WBGet(WinTitle="ahk_class IEFrame", Svr#=1) {               ;// based on ComObjQuery docs
   static msg := DllCall("RegisterWindowMessage", "str", "WM_HTML_GETOBJECT")
        , IID := "{0002DF05-0000-0000-C000-000000000046}"   ;// IID_IWebBrowserApp
;//     , IID := "{332C4427-26CB-11D0-B483-00C04FD90119}"   ;// IID_IHTMLWindow2
   SendMessage msg, 0, 0, Internet Explorer_Server%Svr#%, %WinTitle%

   if (ErrorLevel != "FAIL") {
      lResult:=ErrorLevel, VarSetCapacity(GUID,16,0)
      if DllCall("ole32\CLSIDFromString", "wstr","{332C4425-26CB-11D0-B483-00C04FD90119}", "ptr",&GUID) >= 0 {
         DllCall("oleacc\ObjectFromLresult", "ptr",lResult, "ptr",&GUID, "ptr",0, "ptr*",pdoc)
         return ComObj(9,ComObjQuery(pdoc,IID,IID),1), ObjRelease(pdoc)
      }
   }
}
