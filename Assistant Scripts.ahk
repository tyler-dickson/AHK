#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 59
formattime, ThisHour, , MM.dd.yyyy-htt


StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}

if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder

H_Mapped := "Unmapped"
S_Mapped := "Unmapped"
U_Mapped := "Unmapped"
V_Mapped := "Unmapped"
Q_Mapped := "Unmapped"
Y_Mapped := "Unmapped"
L_Mapped := "Unmapped"
W_Mapped := "Unmapped"
NumberMapped = 0

/* 
H: - OC  - DONE
S: - SD  - DONE
U: - DC  - DONE
V: - SEA - DONE	
Q: - SV  - DONE
Y: - NY  - DONE

L: - LA  - BLOCKED - Need to create directories.
W: - SF  - BLOCKED - Need to create directories.

H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\

*/

Gui, Add, Text, Center w240, First Time User Setup`n`nUsername: %A_Username%`nUser Folder: %UserFolder%`nComputer Name: %Computername%`n`nPlease select your default location.`n


IfExist, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\   ;%Computername%.ini
	{
	H_Mapped := "Mapped"
	Gui, Add, Radio, Center Group vSaveDirectory , H Drive: (Orange County)	
	IfExist, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini	
	NumberMapped++	;return
	}
else
	{
	Gui, Add, Radio, Center Group vSaveLocation , H Drive: (Orange County) - Not mapped.
	GuiControl, Disable, Button1
	}	
IfExist, S:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\
	{
	S_Mapped := "Mapped"
	Gui, Add, Radio, Center, S Drive: (San Diego)	
	IfExist, S:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini	
	NumberMapped++		;return
	}
else
	{
	Gui, Add, Radio, Center, S Drive: (San Diego) - Not mapped.
	GuiControl, Disable, Button2
	}	
IfExist, U:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\
	{
	U_Mapped := "Mapped"
	Gui, Add, Radio,Center , U Drive: (Washington D.C.)
	IfExist, U:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini	
	NumberMapped++	;return
	}
else
	{
	Gui, Add, Radio,Center , U Drive: (Washington D.C.) - Not mapped.
	GuiControl, Disable, Button3
	}	
IfExist, V:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\
	{
	V_Mapped := "Mapped"
	Gui, Add, Radio, Center, V Drive: (Seattle)
	IfExist, V:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini	
	NumberMapped++	;return
	}
else
	{
	Gui, Add, Radio, Center, V Drive: (Seattle) - Not mapped.
	GuiControl, Disable, Button4
	}	
IfExist, Y:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\
	{
	Y_Mapped := "Mapped"
	Gui, Add, Radio, Center, Y Drive: (New York)	
	IfExist, Y:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini	
	NumberMapped++	;return
	}
else
	{
	Gui, Add, Radio, Center, Y Drive: (New York) - Not mapped.
	GuiControl, Disable, Button5
	}	
IfExist, Q:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\
	{
	Q_Mapped := "Mapped"
	Gui, Add, Radio, Center, Q Drive: (Silicon Valley)		
	IfExist, Q:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini	
	NumberMapped++	;return
	}
else
	{
	Gui, Add, Radio, Center, Q Drive: (Silicon Valley) - Not mapped.
	GuiControl, Disable, Button6
	}	
IfExist, L:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\
	{
	L_Mapped := "Mapped"
	Gui, Add, Radio, Center, L Drive: (Los Angeles)	
	IfExist, L:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini	
	NumberMapped++	;return
	}
else
	{
	Gui, Add, Radio, Center, L Drive: (Los Angeles) - Not mapped.
	GuiControl, Disable, Button7
	}	
IfExist, W:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\
	{
	W_Mapped := "Mapped"
	Gui, Add, Radio, Center, W Drive: (San Francisco)	
	IfExist, W:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini	
	NumberMapped++	;return
	}
else
	{
	Gui, Add, Radio, Center, W Drive: (San Francisco) - Not mapped.
	GuiControl, Disable, Button8
	}


;if NumberMapped = 0 
;	{
Gui, Add, Text, , 
Gui, Add, Button, Section gButton, Submit
Gui, Add, Button, ys xs+210 gOpenHelp, Help
	Gui, Show, , Assistant Scripts
	return
;	}
;else
;	Gui, Destroy

Button:
Gui, Submit, Hide
if SaveDirectory = 1
	{
	SaveDirectory := "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch"
	Sleep 500
	gosub CreateFile
	}
else if SaveDirectory = 2
	{
	SaveDirectory := "S:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch"
	Sleep 500
	gosub CreateFile
	}		
else if  SaveDirectory = 3
	{
	SaveDirectory := "U:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch"
	Sleep 500
	gosub CreateFile
	}		
else if  SaveDirectory = 4
	{
	SaveDirectory := "V:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch"
	Sleep 500
	gosub CreateFile
	}	
else if  SaveDirectory = 5
	{
	SaveDirectory := "Y:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch"
	Sleep 500
	gosub CreateFile
	}	
else if  SaveDirectory = 6
	{
	SaveDirectory := "Q:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch"
	Sleep 500
	gosub CreateFile
	}
else if  SaveDirectory = 7
	{
	SaveDirectory := "L:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch"
	Sleep 500
	gosub CreateFile
	}		
else if  SaveDirectory = 8
	{
	SaveDirectory := "W:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch"
	Sleep 500
	MsgBox, %SaveDirectory%
	;gosub CreateFile
	}
return
	
; OC  "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch"
; SD  "S:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch"
; DC  "U:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch"	
; SEA "V:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch"	
; NY  "Y:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch"	
; SV  "Q:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch"
; LA  "L:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch"
; SF  "W:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch"

OpenHelp:
FileCopy, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HTML\AHK Instructions.html, C:\Users\%ComputerName%\AHK Instructions.html, 1
Sleep 2000
Run "C:\Users\%ComputerName%\AHK Instructions.html"
return

CreateFile:
IniWrite, 0, %SaveDirectory%\%Computername%.ini, Achievements, EFSCertFinder
IniWrite, 0, %SaveDirectory%\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSCertFinder
IniWrite, 0, %SaveDirectory%\%Computername%.ini, Achievements, EFSFill
IniWrite, 0, %SaveDirectory%\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSFill
IniWrite, 0, %SaveDirectory%\%Computername%.ini, Achievements, EFSLogin
IniWrite, 0, %SaveDirectory%\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSLogin
IniWrite, 0, %SaveDirectory%\%Computername%.ini, Achievements, ClientCodeIE
IniWrite, 0, %SaveDirectory%\Hourly\%Computername%-%ThisHour%.ini, Achievements, ClientCodeIE
return

!LButton::
SendInput ^c
Clipwait .25
ie := WBGet()
	if IsObject(ie) = 0
		{
		Run "iexplore.exe"
		Sleep 3000
		ie := WBGet()
		return
		}
	else

var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
TrayTip, Quick Record Opener, Opening a TM in docketing.
OutputVar = http://oc-docketing/CPi/tmkschTrademark.aspx
params := [OutputVar, 32]
ie.Navigate(params*)
while ie.busy ;  or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
Sleep 3000
TrayTip
gosub RecordClientCodeIE
SendInput {Ctrl up}
return

!RButton::
SendInput ^c
Clipwait .25
ie := WBGet()
	if IsObject(ie) = 0
		{
		Run "iexplore.exe"
		Sleep 3000
		ie := WBGet()
		return
		}
	else
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
TrayTip, Quick Record Opener, Opening a Patent in docketing.
OutputVar = http://oc-docketing/CPi/patschCountryApplication.aspx
params := [OutputVar, 32]
ie.Navigate(params*)
while ie.busy ; or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
Sleep 3000
TrayTip
gosub RecordClientCodeIE
SendInput {Ctrl up}
return

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




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;¿                                   ;;
;;       EFS Cert/Password Finder     ;;
;;              !ATY Team             ;;
;;               Passive              ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GetPassword:
		Send ^a
		Sleep 200
		Send ^c
		Sleep 500
		IniRead, Password, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\EFS.ini, EFS, %Clipboard%
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;¿                                                           ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



RecordEFSCertFinder:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, EFSCertFinder, %SaveDirectory%\%Computername%.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinderH, %SaveDirectory%\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSCertFinder
EFSCertFinder++
EFSCertFinderH++
IniWrite, %EFSCertFinder%, %SaveDirectory%\%Computername%.ini, Achievements, EFSCertFinder
IniWrite, %EFSCertFinderH%, %SaveDirectory%\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSCertFinder
return

RecordEFSFill:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, EFSFill, %SaveDirectory%\%Computername%.ini, Achievements, EFSFill
IniRead, EFSFillH, %SaveDirectory%\%Computername%-%ThisHour%.ini, Achievements, EFSFill
EFSFill++
EFSFillH++
IniWrite, %EFSFill%, %SaveDirectory%\%Computername%.ini, Achievements, EFSFill
IniWrite, %EFSFillH%, %SaveDirectory%\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSFill
return

RecordEFSLogin:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, EFSLogin, %SaveDirectory%\%Computername%.ini, Achievements, EFSLogin
IniRead, EFSLoginH, %SaveDirectory%\%Computername%-%ThisHour%.ini, Achievements, EFSLogin
EFSLogin++
EFSLoginH++
IniWrite, %EFSLogin%, %SaveDirectory%\%Computername%.ini, Achievements, EFSLogin
IniWrite, %EFSLoginH%, %SaveDirectory%\Hourly\%Computername%-%ThisHour%.ini, Achievements, EFSLogin
return

RecordClientCodeIE:
formattime, ThisHour, , MM.dd.yyyy-htt
IniRead, ClientCodeIE, %SaveDirectory%\%Computername%.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIEH, %SaveDirectory%\Hourly\%Computername%-%ThisHour%.ini, Achievements, ClientCodeIE
ClientCodeIE++
ClientCodeIEH++
IniWrite, %ClientCodeIE%, %SaveDirectory%\%Computername%.ini, Achievements, ClientCodeIE
IniWrite, %ClientCodeIEH%, %SaveDirectory%\Hourly\%Computername%-%ThisHour%.ini, Achievements, ClientCodeIE
return



#If WinActive("ahk_class IEFrame") || WinActive("ahk_class SunAwtFrame")



::!DXC::
SendInput H:\USPTO\David.Cohen.epf
Clipboard = H:\USPTO\David.Cohen.epf
Sleep 200
gosub, GetPassword
return



::!DWK::
SendInput W:\USPTO\David.Kellogg.epf
Clipboard = W:\USPTO\David.Kellogg.epf
Sleep 200
gosub, GetPassword
return


::!LLS::
SendInput S:\USPTO\Loni.Morrow.epf
Clipboard = S:\USPTO\Loni.Morrow.epf
Sleep 200
gosub, GetPassword
return


::!MBH::
SendInput Y:\USPTO\Mitch.Hadley.epf
Clipboard = Y:\USPTO\Mitch.Hadley.epf
Sleep 200
gosub, GetPassword
return

::!DCT::
SendInput S:\USPTO\Dylan.Turner.epf
Clipboard = S:\USPTO\Dylan.Turner.epf
Sleep 200
gosub, GetPassword
return

::!RHP::
SendInput S:\USPTO\Rick.Park.epf
Clipboard = S:\USPTO\Rick.Park.epf
Sleep 200
gosub, GetPassword
return


::!SGS::
SendInput W:\USPTO\Scott.Siera.epf
Clipboard = W:\USPTO\Scott.Siera.epf
Sleep 200
gosub, GetPassword
return

::!VXT::
SendInput H:\USPTO\Vlad.Teplitskiy.epf
Clipboard = H:\USPTO\Vlad.Teplitskiy.epf
Sleep 200
gosub, GetPassword
return

::!JPL::
SendInput H:\USPTO\Josepher.Li.epf
Clipboard = H:\USPTO\Josepher.Li.epf
gosub, GetPassword
return

::!BHL::
SendInput W:\USPTO\Ben.Liu.epf
Clipboard = W:\USPTO\Ben.Liu.epf
gosub, GetPassword
return

::!CDD::
SendInput S:\USPTO\Casey.Donahoe.epf
Clipboard = S:\USPTO\Casey.Donahoe.epf
gosub, GetPassword
return

::!JJC::
SendInput H:\USPTO\Jeremy.Carney.epf
Clipboard = H:\USPTO\Jeremy.Carney.epf
gosub, GetPassword
return

::!JZA::
SendInput H:\USPTO\Jessica.Achtsam.epf
Clipboard = H:\USPTO\Jessica.Achtsam.epf
gosub, GetPassword
return

::!NJL::
SendInput H:\USPTO\Nathan.Lee.epf
Clipboard = H:\USPTO\Nathan.Lee.epf
gosub, GetPassword
return

::!SYW::
SendInput H:\USPTO\Sabrina.Wang.epf
Clipboard = H:\USPTO\Sabrina.Wang.epf
gosub, GetPassword
return

::!AKD::
SendInput H:\USPTO\Angela.Dremann.epf
Clipboard = H:\USPTO\Angela.Dremann.epf
gosub, GetPassword
return

::!ZJH::
SendInput H:\USPTO\Zach.Hong.epf
Clipboard = H:\USPTO\Zach.Hong.epf
gosub, GetPassword
return

::!AUK::
SendInput H:\USPTO\Alexander.Kappner.epf
Clipboard = H:\USPTO\Alexander.Kappner.epf
gosub, GetPassword
return

::!AJG::
SendInput H:\USPTO\Adam.Gilbert.epf
Clipboard = H:\USPTO\Adam.Gilbert.epf
gosub, GetPassword
return

::!AXJ::
SendInput H:\USPTO\Agnes.Juang.epf
Clipboard = H:\USPTO\Agnes.Juang.epf
gosub, GetPassword
return

::!AJS::
SendInput H:\USPTO\Albert.Sueiras.epf
Clipboard = H:\USPTO\Albert.Sueiras.epf
gosub, GetPassword
return

::!AJM::
SendInput H:\USPTO\Alex.Martinez.epf
Clipboard = H:\USPTO\Alex.Martinez.epf
gosub, GetPassword
return

::!AZ4::
SendInput H:\USPTO\Allison.Weimer.epf
Clipboard = H:\USPTO\Allison.Weimer.epf
gosub, GetPassword
return

::!AGB::
SendInput H:\USPTO\Allyson.Brown.epf
Clipboard = H:\USPTO\Allyson.Brown.epf
gosub, GetPassword
return

::!ACC::
SendInput H:\USPTO\Amy.Chun.epf
Clipboard = H:\USPTO\Amy.Chun.epf
gosub, GetPassword
return

::!AMD::
SendInput H:\USPTO\Andrew.Douglas.epf
Clipboard = H:\USPTO\Andrew.Douglas.epf
gosub, GetPassword
return

::!AIK::
SendInput H:\USPTO\Andrew.Kimmel.epf
Clipboard = H:\USPTO\Andrew.Kimmel.epf
gosub, GetPassword
return

::!AWL::
SendInput H:\USPTO\Andrew.Lloyd.epf
Clipboard = H:\USPTO\Andrew.Lloyd.epf
gosub, GetPassword
return

::!AVS::
SendInput H:\USPTO\Andrew.Schwaab.epf
Clipboard = H:\USPTO\Andrew.Schwaab.epf
gosub, GetPassword
return

::!AHS::
SendInput H:\USPTO\Andrew.Simpson.epf
Clipboard = H:\USPTO\Andrew.Simpson.epf
gosub, GetPassword
return

::!ASR::
SendInput H:\USPTO\Art Rose.epf
Clipboard = H:\USPTO\Art Rose.epf
gosub, GetPassword
return

::!BJE::
SendInput H:\USPTO\Ben.Everton.epf
Clipboard = H:\USPTO\Ben.Everton.epf
gosub, GetPassword
return

::!BAK::
SendInput H:\USPTO\Benajmain.Katzenellenbogen.epf
Clipboard = H:\USPTO\Benajmain.Katzenellenbogen.epf
gosub, GetPassword
return

::!WBB::
SendInput H:\USPTO\Bill.Bunker.epf
Clipboard = H:\USPTO\Bill.Bunker.epf
gosub, GetPassword
return

::!WHS::
SendInput H:\USPTO\Bill.Shreve.epf
Clipboard = H:\USPTO\Bill.Shreve.epf
gosub, GetPassword
return

::!BRB::
SendInput H:\USPTO\Brent Babcock.epf
Clipboard = H:\USPTO\Brent Babcock.epf
gosub, GetPassword
return

::!BMD::
SendInput H:\USPTO\Brent Dougal.epf
Clipboard = H:\USPTO\Brent Dougal.epf
gosub, GetPassword
return

::!BCC::
SendInput H:\USPTO\Brian Claassen.epf
Clipboard = H:\USPTO\Brian Claassen.epf
gosub, GetPassword
return

::!BZS::
SendInput H:\USPTO\Bridget Smith.epf
Clipboard = H:\USPTO\Bridget Smith.epf
gosub, GetPassword
return

::!BSI::
SendInput H:\USPTO\Bruce.Itchkawitz.epf
Clipboard = H:\USPTO\Bruce.Itchkawitz.epf
gosub, GetPassword
return

::!BWW::
SendInput H:\USPTO\Bryan.Wahl.epf
Clipboard = H:\USPTO\Bryan.Wahl.epf
gosub, GetPassword
return

::!CKL::
SendInput H:\USPTO\Catherine.Lee.epf
Clipboard = H:\USPTO\Catherine.Lee.epf
gosub, GetPassword
return

::!CYL::
SendInput H:\USPTO\Chang.Lim.epf
Clipboard = H:\USPTO\Chang.Lim.epf
gosub, GetPassword
return

::!CSC::
SendInput H:\USPTO\Che.Chereskin.epf
Clipboard = H:\USPTO\Che.Chereskin.epf
gosub, GetPassword
return

::!CXR::
SendInput H:\USPTO\Christopher Ross.epf
Clipboard = H:\USPTO\Christopher Ross.epf
gosub, GetPassword
return

::!CSS::
SendInput H:\USPTO\Craig.Summers.epf
Clipboard = H:\USPTO\Craig.Summers.epf
gosub, GetPassword
return

::!CRH::
SendInput H:\USPTO\Curtis.Huffmire.epf
Clipboard = H:\USPTO\Curtis.Huffmire.epf
gosub, GetPassword
return

::!CCD::
SendInput H:\USPTO\Curtiss.Dosier.epf
Clipboard = H:\USPTO\Curtiss.Dosier.epf
gosub, GetPassword
return

::!DJH::
SendInput H:\USPTO\Damien.Howard.epf
Clipboard = H:\USPTO\Damien.Howard.epf
gosub, GetPassword
return

::!DEA::
SendInput H:\USPTO\Dan.Altman.epf
Clipboard = H:\USPTO\Dan.Altman.epf
gosub, GetPassword
return

::!DJF::
SendInput H:\USPTO\Dan.Fischer.epf
Clipboard = H:\USPTO\Dan.Fischer.epf
gosub, GetPassword
return

::!DVG::
SendInput H:\USPTO\Daniel.Gibson.epf
Clipboard = H:\USPTO\Daniel.Gibson.epf
gosub, GetPassword
return

::!DLO::
SendInput H:\USPTO\Darrell.Olson.epf
Clipboard = H:\USPTO\Darrell.Olson.epf
gosub, GetPassword
return

::!DSB::
SendInput H:\USPTO\David.Barnhill.epf
Clipboard = H:\USPTO\David.Barnhill.epf
gosub, GetPassword
return

::!DMD::
SendInput H:\USPTO\David.Dremann.epf
Clipboard = H:\USPTO\David.Dremann.epf
gosub, GetPassword
return

::!DGK::
SendInput H:\USPTO\David.G.Kim.epf
Clipboard = H:\USPTO\David.G.Kim.epf
gosub, GetPassword
return

::!DGJ::
SendInput H:\USPTO\David.Jankowski.epf
Clipboard = H:\USPTO\David.Jankowski.epf
gosub, GetPassword
return

::!DRS::
SendInput H:\USPTO\David.Schmidt.epf
Clipboard = H:\USPTO\David.Schmidt.epf
gosub, GetPassword
return

::!DVK::
SendInput H:\USPTO\David.T.Kim.epf
Clipboard = H:\USPTO\David.T.Kim.epf
gosub, GetPassword
return

::!DRB::
SendInput H:\USPTO\Derek.Bayles.epf
Clipboard = H:\USPTO\Derek.Bayles.epf
gosub, GetPassword
return

::!DXD::
SendInput H:\USPTO\Devanie.Dufour.epf
Clipboard = H:\USPTO\Devanie.Dufour.epf 
gosub, GetPassword
return

::!DGM::
SendInput H:\USPTO\Doug.Muehlhauser.epf
Clipboard = H:\USPTO\Doug.Muehlhauser.epf
gosub, GetPassword
return

::!DXW::
SendInput H:\USPTO\Douglas.Wentzel.epf
Clipboard = H:\USPTO\Douglas.Wentzel.epf
gosub, GetPassword
return

::!EAS::
SendInput H:\USPTO\Ed.Schlatter.epf
Clipboard = H:\USPTO\Ed.Schlatter.epf
gosub, GetPassword
return

::!GVH::
SendInput H:\USPTO\Gerard.vonHoffmann.epf
Clipboard = H:\USPTO\Gerard.vonHoffmann.epf
gosub, GetPassword
return

::!GLN::
SendInput H:\USPTO\Glen.Nuttall.epf
Clipboard = H:\USPTO\Glen.Nuttall.epf
gosub, GetPassword
return

::!HXM::
SendInput H:\USPTO\Hans.Mayer.epf
Clipboard = H:\USPTO\Hans.Mayer.epf
gosub, GetPassword
return

::!HZS::
SendInput H:\USPTO\Harnik.Shukla.epf
Clipboard = H:\USPTO\Harnik.Shukla.epf
gosub, GetPassword
return

::!HCS::
SendInput H:\USPTO\Hochan.Song.epf
Clipboard = H:\USPTO\Hochan.Song.epf
gosub, GetPassword
return

::!IAL::
SendInput H:\USPTO\Irfan.Lateef.epf
Clipboard = H:\USPTO\Irfan.Lateef.epf
gosub, GetPassword
return

::!JUP::
SendInput H:\USPTO\Jacob.Peterson.epf
Clipboard = H:\USPTO\Jacob.Peterson.epf
gosub, GetPassword
return

::!JCB::
SendInput H:\USPTO\Jared.Bunker.epf
Clipboard = H:\USPTO\Jared.Bunker.epf
gosub, GetPassword
return

::!JZK::
SendInput H:\USPTO\Jarom.Kesler.epf
Clipboard = H:\USPTO\Jarom.Kesler.epf 
gosub, GetPassword
return

::!JAG::
SendInput H:\USPTO\Jason.Gersting.epf
Clipboard = H:\USPTO\Jason.Gersting.epf
gosub, GetPassword
return

::!JCS::
SendInput H:\USPTO\Jason.Swartz.epf
Clipboard = H:\USPTO\Jason.Swartz.epf
gosub, GetPassword
return

::!JUH::
SendInput H:\USPTO\Jeffery.Hallstrom.epf
Clipboard = H:\USPTO\Jeffery.Hallstrom.epf
gosub, GetPassword
return

::!JYC::
SendInput H:\USPTO\Joan.Chan.epf
Clipboard = :\USPTO\Joan.Chan.epf
gosub, GetPassword
return

::!HSU::
SendInput H:\USPTO\Johannes.Hsu.epf
Clipboard = H:\USPTO\Johannes.Hsu.epf
gosub, GetPassword
return

::!JRK::
SendInput H:\USPTO\John King.epf
Clipboard = H:\USPTO\John King.epf
gosub, GetPassword
return

::!JMG::
SendInput H:\USPTO\John.Grover.epf
Clipboard = H:\USPTO\John.Grover.epf
gosub, GetPassword
return

::!JHS::
SendInput H:\USPTO\John.Sadlik.epf
Clipboard = H:\USPTO\John.Sadlik.epf
gosub, GetPassword
return

::!JBS::
SendInput H:\USPTO\John.Sganga.epf
Clipboard = H:\USPTO\John.Sganga.epf
gosub, GetPassword
return

::!JWG::
SendInput H:\USPTO\Jon Gurka.epf
Clipboard = H:\USPTO\Jon Gurka.epf
gosub, GetPassword
return

::!JUC::
SendInput H:\USPTO\Jordan.Cox.epf
Clipboard = H:\USPTO\Jordan.Cox.epf
gosub, GetPassword
return

::!JYS::
SendInput H:\USPTO\Joshua Stowell.epf
Clipboard = H:\USPTO\Joshua Stowell.epf
gosub, GetPassword
return

::!JDB::
SendInput H:\USPTO\Joshua.Berk.epf
Clipboard = H:\USPTO\Joshua.Berk.epf
gosub, GetPassword
return

::!JJG::
SendInput H:\USPTO\Justin.Gillett.epf
Clipboard = H:\USPTO\Justin.Gillett.epf
gosub, GetPassword
return

::!KJL::
SendInput H:\USPTO\Karen.Lenker.epf
Clipboard = H:\USPTO\Karen.Lenker.epf
gosub, GetPassword
return

::!KAD::
SendInput H:\USPTO\Karoline.Delaney.epf
Clipboard = H:\USPTO\Karoline.Delaney.epf
gosub, GetPassword
return

::!KXA::
SendInput H:\USPTO\Kazuo.Aoki.epf
Clipboard = H:\USPTO\Kazuo.Aoki.epf
gosub, GetPassword
return

::!KZL::
SendInput H:\USPTO\Keith.Lim.epf
Clipboard = H:\USPTO\Keith.Lim.epf
gosub, GetPassword
return

::!KNS::
SendInput H:\USPTO\Kent.Shum.epf
Clipboard = H:\USPTO\Kent.Shum.epf
gosub, GetPassword
return

::!LDS::
SendInput H:\USPTO\Lance.Smemoe.epf
Clipboard = H:\USPTO\Lance.Smemoe.epf
gosub, GetPassword
return

::!LXK::
SendInput H:\USPTO\Lauren.Keller.epf
Clipboard = H:\USPTO\Lauren.Keller.epf
gosub, GetPassword
return

::!LGR::
SendInput H:\USPTO\Lavanya.Rau.epf
Clipboard = H:\USPTO\Lavanya.Rau.epf
gosub, GetPassword
return

::!LHL::
SendInput H:\USPTO\Linda.Liu.epf
Clipboard = H:\USPTO\Linda.Liu.epf
gosub, GetPassword
return

::!LLX::
SendInput H:\USPTO\Linda.Xu.epf
Clipboard = H:\USPTO\Linda.Xu.epf
gosub, GetPassword
return

::!LLY::
SendInput H:\USPTO\Lori.Yamato.epf
Clipboard = H:\USPTO\Lori.Yamato.epf
gosub, GetPassword
return

::!MRB::
SendInput H:\USPTO\Mark Benedict.epf
Clipboard = H:\USPTO\Mark Benedict.epf
gosub, GetPassword
return

::!MJG::
SendInput H:\USPTO\Mark Gallagher.epf
Clipboard = H:\USPTO\Mark Gallagher.epf
gosub, GetPassword
return

::!MED::
SendInput H:\USPTO\Mark.Davis.epf
Clipboard = H:\USPTO\Mark.Davis.epf
gosub, GetPassword
return

::!MRZ::
SendInput H:\USPTO\Marko.Zoretic.epf
Clipboard = H:\USPTO\Marko.Zoretic.epf
gosub, GetPassword
return

::!MPB::
SendInput H:\USPTO\Michael.Burns.epf
Clipboard = H:\USPTO\Michael.Burns.epf
gosub, GetPassword
return

::!MRC::
SendInput H:\USPTO\Michael.Christensen.epf
Clipboard = H:\USPTO\Michael.Christensen.epf
gosub, GetPassword
return

::!MAG::
SendInput H:\USPTO\Michael.Guiliana.epf
Clipboard = H:\USPTO\Michael.Guiliana.epf
gosub, GetPassword
return

::!MCL::
SendInput H:\USPTO\Mike.Lee.epf
Clipboard = H:\USPTO\Mike.Lee.epf
gosub, GetPassword
return

::!MCK::
SendInput H:\USPTO\Mincheol.Kim.epf
Clipboard = H:\USPTO\Mincheol.Kim.epf
gosub, GetPassword
return

::!NMZ::
SendInput H:\USPTO\Nicholas.Zovko.epf
Clipboard = H:\USPTO\Nicholas.Zovko.epf
gosub, GetPassword
return

::!NXB::
SendInput H:\USPTO\Nira.Brand.epf
Clipboard = H:\USPTO\Nira.Brand.epf
gosub, GetPassword
return

::!NAM::
SendInput H:\USPTO\Nora.Marachelian.epf
Clipboard = H:\USPTO\Nora.Marachelian.epf
gosub, GetPassword
return

::!OAM::
SendInput H:\USPTO\Omar.AlMesned.epf
Clipboard = H:\USPTO\Omar.AlMesned.epf
gosub, GetPassword
return

::!PNC::
SendInput H:\USPTO\Paul.Conover.epf
Clipboard = H:\USPTO\Paul.Conover.epf
gosub, GetPassword
return

::!PDO::
SendInput H:\USPTO\Perry.Oldham.epf
Clipboard = H:\USPTO\Perry.Oldham.epf
gosub, GetPassword
return

::!PQT::
SendInput H:\USPTO\Peter.Tong.epf
Clipboard = H:\USPTO\Peter.Tong.epf
gosub, GetPassword
return

::!PMN::
SendInput H:\USPTO\Philip.Nelson.epf
Clipboard = H:\USPTO\Philip.Nelson.epf
gosub, GetPassword
return

::!RNN::
SendInput H:\USPTO\Rabi.Narula.epf
Clipboard = H:\USPTO\Rabi.Narula.epf
gosub, GetPassword
return

::!RDS::
SendInput H:\USPTO\Raymond.Smith.epf
Clipboard = H:\USPTO\Raymond.Smith.epf
gosub, GetPassword
return

::!RJR::
SendInput H:\USPTO\Robb.Roby.epf
Clipboard = H:\USPTO\Robb.Roby.epf
gosub, GetPassword
return

::!ROS::
SendInput H:\USPTO\Ron.Schoenbaum.epf
Clipboard = H:\USPTO\Ron.Schoenbaum.epf
gosub, GetPassword
return

::!RMJ::
SendInput H:\USPTO\Russell.Jeide.epf
Clipboard = H:\USPTO\Russell.Jeide.epf
gosub, GetPassword
return

::!SHL::
SendInput H:\USPTO\Sabing.Lee.epf
Clipboard = H:\USPTO\Sabing.Lee.epf
gosub, GetPassword
return

::!SAM::
SendInput H:\USPTO\Salima Merani.epf
Clipboard = H:\USPTO\Salima Merani.epf
gosub, GetPassword
return

::!SZC::
SendInput H:\USPTO\Scott.Cromar.epf
Clipboard = H:\USPTO\Scott.Cromar.epf
gosub, GetPassword
return

::!SXR::
SendInput H:\USPTO\Scott.Raevsky.epf
Clipboard = H:\USPTO\Scott.Raevsky.epf
gosub, GetPassword
return

::!SXA::
SendInput H:\USPTO\Sean.Ambrosius.epf
Clipboard = H:\USPTO\Sean.Ambrosius.epf
gosub, GetPassword
return

::!SXL::
SendInput H:\USPTO\Shannon.Lam.epf
Clipboard = H:\USPTO\Shannon.Lam.epf
gosub, GetPassword
return

::!SNS::
SendInput H:\USPTO\Sheila Swaroop.epf
Clipboard = H:\USPTO\Sheila Swaroop.epf
gosub, GetPassword
return

::!SCJ::
SendInput H:\USPTO\Steve.Jensen.epf
Clipboard = H:\USPTO\Steve.Jensen.epf
gosub, GetPassword
return

::!SPR::
SendInput H:\USPTO\Steven Ruden.epf
Clipboard = H:\USPTO\Steven Ruden.epf
gosub, GetPassword
return

::!SJN::
SendInput H:\USPTO\Steven.Nataupsky.epf
Clipboard = H:\USPTO\Steven.Nataupsky.epf
gosub, GetPassword
return

::!TXN::
SendInput H:\USPTO\Tak.Nishimura.epf
Clipboard = H:\USPTO\Tak.Nishimura.epf
gosub, GetPassword
return

::!TMC::
SendInput H:\USPTO\Ted Cannon.epf
Clipboard = H:\USPTO\Ted Cannon.epf
gosub, GetPassword
return

::!TKT::
SendInput H:\USPTO\Terry.Tullis.epf
Clipboard = H:\USPTO\Terry.Tullis.epf
gosub, GetPassword
return

::!TGP::
SendInput H:\USPTO\Theodore.Papagiannis.epf
Clipboard = H:\USPTO\Theodore.Papagiannis.epf
gosub, GetPassword
return

::!TYY::
SendInput H:\USPTO\Thomas.Yee.epf
Clipboard = H:\USPTO\Thomas.Yee.epf
gosub, GetPassword
return

::!VZB::
SendInput H:\USPTO\Vikas.Bhargava.epf
Clipboard = H:\USPTO\Vikas.Bhargava.epf
gosub, GetPassword
return

::!VSL::
SendInput H:\USPTO\Vladimir.Lozan.epf
Clipboard = H:\USPTO\Vladimir.Lozan.epf
gosub, GetPassword
return

::!JYW::
SendInput H:\USPTO\YueJoyWang.epf
Clipboard = H:\USPTO\YueJoyWang.epf
gosub, GetPassword
return

::!ZAG::
SendInput H:\USPTO\Zachary.Glantz.epf
Clipboard = H:\USPTO\Zachary.Glantz.epf
gosub, GetPassword
return

::!ABP::
SendInput S:\USPTO\Adam.Powell.epf
Clipboard = S:\USPTO\Adam.Powell.epf
gosub, GetPassword
return

::!AEM::
SendInput S:\USPTO\Andrew.Morrell.epf
Clipboard = S:\USPTO\Andrew.Morrell.epf
gosub, GetPassword
return

::!BBA::
SendInput S:\USPTO\Ben.Anger.epf
Clipboard = S:\USPTO\Ben.Anger.epf
gosub, GetPassword
return

::!BSG::
SendInput S:\USPTO\Brenden.Gingrich.epf
Clipboard = S:\USPTO\Brenden.Gingrich.epf
gosub, GetPassword
return

::!PCS::
SendInput S:\USPTO\Chris Steinhardt.epf
Clipboard = S:\USPTO\Chris Steinhardt.epf
gosub, GetPassword
return

::!CMD::
SendInput S:\USPTO\Chris.DiLeo.epf
Clipboard = S:\USPTO\Chris.DiLeo.epf
gosub, GetPassword
return

::!CLS::
SendInput S:\USPTO\Claine.Snow.epf
Clipboard = S:\USPTO\Claine.Snow.epf
gosub, GetPassword
return

::!DOH::
SendInput S:\USPTO\Dan.Hart.epf
Clipboard = S:\USPTO\Dan.Hart.epf
gosub, GetPassword
return

::!DKY::
SendInput S:\USPTO\Dan.Yarbrough.epf
Clipboard = S:\USPTO\Dan.Yarbrough.epf
gosub, GetPassword
return

::!DPH::
SendInput S:\USPTO\Daniel Hughes.epf
Clipboard = S:\USPTO\Daniel Hughes.epf
gosub, GetPassword
return

::!DAK::
SendInput S:\USPTO\Daniel.Kamkar.epf
Clipboard = S:\USPTO\Daniel.Kamkar.epf
gosub, GetPassword
return

::!DZD::
SendInput S:\USPTO\David.Dang.epf
Clipboard = S:\USPTO\David.Dang.epf
gosub, GetPassword
return

::!DPK::
SendInput S:\USPTO\David.Kujawa.epf
Clipboard = S:\USPTO\David.Kujawa.epf
gosub, GetPassword
return

::!DCD::
SendInput S:\USPTO\Derek.Dailey.epf
Clipboard = S:\USPTO\Derek.Dailey.epf
gosub, GetPassword
return

::!DSH::
SendInput S:\USPTO\Drew.Hamilton.epf
Clipboard = S:\USPTO\Drew.Hamilton.epf
gosub, GetPassword
return

::!EMN::
SendInput S:\USPTO\Eric Nelson.epf
Clipboard = S:\USPTO\Eric Nelson.epf
gosub, GetPassword
return

::!ESF::
SendInput S:\USPTO\Eric.Furman.epf
Clipboard = S:\USPTO\Eric.Furman.epf
gosub, GetPassword
return

::!FTH::
SendInput S:\USPTO\Fred.Hale.epf
Clipboard = S:\USPTO\Fred.Hale.epf
gosub, GetPassword
return

::!FAN::
SendInput S:\USPTO\Fred.Nicholson.epf
Clipboard = S:\USPTO\Fred.Nicholson.epf
gosub, GetPassword
return

::!GAH::
SendInput S:\USPTO\Greg.Hermanson.epf
Clipboard = S:\USPTO\Greg.Hermanson.epf
gosub, GetPassword
return

::!GXM::
SendInput S:\USPTO\Greg.Munchinsky.epf
Clipboard = S:\USPTO\Greg.Munchinsky.epf
gosub, GetPassword
return

::!HZC::
SendInput S:\USPTO\Heungsoo.Choi.epf
Clipboard = S:\USPTO\Heungsoo.Choi.epf
gosub, GetPassword
return

::!IWG::
SendInput S:\USPTO\Ian Gillies.epf
Clipboard = S:\USPTO\Ian Gillies.epf
gosub, GetPassword
return

::!JFH::
SendInput S:\USPTO\James.Herkenhoff.epf
Clipboard = S:\USPTO\James.Herkenhoff.epf
gosub, GetPassword
return

::!JQD::
SendInput S:\USPTO\Jane.Dai.epf
Clipboard = S:\USPTO\Jane.Dai.epf
gosub, GetPassword
return

::!JQX::
SendInput S:\USPTO\Jane.Xia.epf
Clipboard = S:\USPTO\Jane.Xia.epf
gosub, GetPassword
return

::!JJJ::
SendInput S:\USPTO\Jason Jardine.epf
Clipboard = S:\USPTO\Jason Jardine.epf
gosub, GetPassword
return

::!JZL::
SendInput S:\USPTO\Jing.Liu.epf
Clipboard = S:\USPTO\Jing.Liu.epf
gosub, GetPassword
return

::!JMC::
SendInput S:\USPTO\John Carson.epf
Clipboard = S:\USPTO\John Carson.epf
gosub, GetPassword
return

::!JEG::
SendInput S:\USPTO\Jordan.Gottdank.epf
Clipboard = S:\USPTO\Jordan.Gottdank.epf
gosub, GetPassword
return

::!JMR::
SendInput S:\USPTO\Joseph Reisman.epf
Clipboard = S:\USPTO\Joseph Reisman.epf
gosub, GetPassword
return

::!JOM::
SendInput S:\USPTO\Joseph.Mallon.epf
Clipboard = S:\USPTO\Joseph.Mallon.epf
gosub, GetPassword
return

::!KST::
SendInput S:\USPTO\Kerry.Taylor.epf
Clipboard = S:\USPTO\Kerry.Taylor.epf
gosub, GetPassword
return

::!KJM::
SendInput S:\USPTO\Kimberly Miller.epf
Clipboard = S:\USPTO\Kimberly Miller.epf
gosub, GetPassword
return

::!KXW::
SendInput S:\USPTO\Kun.Wang.epf
Clipboard = S:\USPTO\Kun.Wang.epf
gosub, GetPassword
return

::!LMF::
SendInput S:\USPTO\Larry.Firestone.epf
Clipboard = S:\USPTO\Larry.Firestone.epf
gosub, GetPassword
return

::!LEN::
SendInput S:\USPTO\Lauren.Hockett.epf
Clipboard = S:\USPTO\Lauren.Hockett.epf
gosub, GetPassword
return

::!MVS::
SendInput S:\USPTO\Maria.Stout.epf
Clipboard = S:\USPTO\Maria.Stout.epf
gosub, GetPassword
return

::!MMA::
SendInput S:\USPTO\Mark.Abumeri.epf
Clipboard = S:\USPTO\Mark.Abumeri.epf
gosub, GetPassword
return

::!MWC::
SendInput S:\USPTO\Mark.Catanese.epf
Clipboard = S:\USPTO\Mark.Catanese.epf
gosub, GetPassword
return

::!MDM::
SendInput S:\USPTO\Mark.Marsden.epf
Clipboard = S:\USPTO\Mark.Marsden.epf
gosub, GetPassword
return

::!MLF::
SendInput S:\USPTO\Michael.Fuller.epf
Clipboard = S:\USPTO\Michael.Fuller.epf
gosub, GetPassword
return

::!NRL::
SendInput S:\USPTO\Nate.Luman.epf
Clipboard = S:\USPTO\Nate.Luman.epf
gosub, GetPassword
return

::!NAI::
SendInput S:\USPTO\Ned.Israelsen.epf
Clipboard = S:\USPTO\Ned.Israelsen.epf
gosub, GetPassword
return

::!NSB::
SendInput S:\USPTO\Neil.Bartfeld.epf
Clipboard = S:\USPTO\Neil.Bartfeld.epf
gosub, GetPassword
return

::!PYC::
SendInput S:\USPTO\Paul.Chang.epf
Clipboard = S:\USPTO\Paul.Chang.epf
gosub, GetPassword
return

::!PXL::
SendInput S:\USPTO\Peter.Law.epf
Clipboard = S:\USPTO\Peter.Law.epf
gosub, GetPassword
return

::!RJS::
SendInput S:\USPTO\Ray.Salenieks.epf
Clipboard = S:\USPTO\Ray.Salenieks.epf
gosub, GetPassword
return

::!RJH::
SendInput S:\USPTO\Robert.Hilton.epf
Clipboard = S:\USPTO\Robert.Hilton.epf
gosub, GetPassword
return

::!RMT::
SendInput S:\USPTO\Rose.Thiessen.epf
Clipboard = S:\USPTO\Rose.Thiessen.epf
gosub, GetPassword
return

::!REM::
SendInput S:\USPTO\Ryan Melnick.epf
Clipboard = S:\USPTO\Ryan Melnick.epf
gosub, GetPassword
return

::!SCY::
SendInput S:\USPTO\Samantha.Markley.epf
Clipboard = S:\USPTO\Samantha.Markley.epf
gosub, GetPassword
return

::!TRA::
SendInput S:\USPTO\Tom.Arno.epf
Clipboard = S:\USPTO\Tom.Arno.epf
gosub, GetPassword
return

::!TSC::
SendInput S:\USPTO\Tom.Cowan.epf
Clipboard = S:\USPTO\Tom.Cowan.epf
gosub, GetPassword
return

::!TJH::
SendInput S:\USPTO\Travis.Hill.epf
Clipboard = S:\USPTO\Travis.Hill.epf
gosub, GetPassword
return

::!VCV::
SendInput S:\USPTO\Victor.Vassar.epf
Clipboard = S:\USPTO\Victor.Vassar.epf
gosub, GetPassword
return

::!VKG::
SendInput S:\USPTO\Vijay.Gore.epf
Clipboard = S:\USPTO\Vijay.Gore.epf
gosub, GetPassword
return

::!JXW::
SendInput S:\USPTO\Jeffrey.Wu.epf
Clipboard = S:\USPTO\Jeffrey.Wu.epf
gosub, GetPassword
return

::!DNW::
SendInput L:\USPTO\David.Weiss.epf
Clipboard = L:\USPTO\David.Weiss.epf
gosub, GetPassword
return

::!MDK::
SendInput L:\USPTO\Mark.Kachner.epf
Clipboard = L:\USPTO\Mark.Kachner.epf
gosub, GetPassword
return

::!MSO::
SendInput L:\USPTO\Mike.Okamoto.epf
Clipboard = L:\USPTO\Mike.Okamoto.epf
gosub, GetPassword
return

::!AXD::
SendInput W:\USPTO\Aaron.Davis.epf
Clipboard = W:\USPTO\Aaron.Davis.epf
gosub, GetPassword
return

::!ASA::
SendInput W:\USPTO\Adeel.Akhtar.epf
Clipboard = W:\USPTO\Adeel.Akhtar.epf
gosub, GetPassword
return

::!ANM::
SendInput W:\USPTO\Andrew.Merickel.epf
Clipboard = W:\USPTO\Andrew.Merickel.epf
gosub, GetPassword
return

::!BMG::
SendInput W:\USPTO\Brian Graham.epf
Clipboard = W:\USPTO\Brian Graham.epf
gosub, GetPassword
return

::!DRT::
SendInput W:\USPTO\David.Trossen.epf
Clipboard = W:\USPTO\David.Trossen.epf
gosub, GetPassword
return


::!ELF::
SendInput W:\USPTO\Eric.Fong.epf
Clipboard = W:\USPTO\Eric.Fong.epf
gosub, GetPassword
return

::!KZM::
SendInput W:\USPTO\Kyu.Min.epf
Clipboard = W:\USPTO\Kyu.Min.epf
gosub, GetPassword
return

::!PSS::
SendInput W:\USPTO\Paul.Stellman.epf
Clipboard = W:\USPTO\Paul.Stellman.epf
gosub, GetPassword
return

::!VXL::
SendInput W:\USPTO\V.Lakshmananepf.epf
Clipboard = W:\USPTO\V.Lakshmananepf.epf
gosub, GetPassword
return

::!ZYW::
SendInput W:\USPTO\Zi Wong.epf
Clipboard = W:\USPTO\Zi Wong.epf
gosub, GetPassword
return

::!DJG::
SendInput U:\USPTO\David.Grant.epf
Clipboard = U:\USPTO\David.Grant.epf
gosub, GetPassword
return

::!JUB::
SendInput U:\USPTO\Julie.Burke.epf
Clipboard = U:\USPTO\Julie.Burke.epf
gosub, GetPassword
return

::!MUM::
SendInput U:\USPTO\Mark.Metzke.epf
Clipboard = U:\USPTO\Mark.Metzke.epf
gosub, GetPassword
return

::!AVB::
SendInput V:\USPTO\Adam.Burks.epf
Clipboard = V:\USPTO\Adam.Burks.epf
gosub, GetPassword
return

::!AFQ::
SendInput V:\USPTO\Andrew.Quecan.epf
Clipboard = V:\USPTO\Andrew.Quecan.epf
gosub, GetPassword
return

::!BPJ::
SendInput V:\USPTO\Benjamin.Johnson.epf
Clipboard = V:\USPTO\Benjamin.Johnson.epf
gosub, GetPassword
return

::!BGM::
SendInput V:\USPTO\Bryan McWhorter.epf
Clipboard = V:\USPTO\Bryan McWhorter.epf
gosub, GetPassword
return

::!CTS::
SendInput V:\USPTO\Christopher Sweeney.epf
Clipboard = V:\USPTO\Christopher Sweeney.epf
gosub, GetPassword
return

::!CBH::
SendInput V:\USPTO\Colin Heideman.epf
Clipboard = V:\USPTO\Colin Heideman.epf
gosub, GetPassword
return

::!MCA::
SendInput V:\USPTO\Maria Anderson.epf
Clipboard = V:\USPTO\Maria Anderson.epf
gosub, GetPassword
return

::!MAU::
SendInput V:\USPTO\Mauricio Uribe.epf
Clipboard = V:\USPTO\Mauricio Uribe.epf
gosub, GetPassword
return

::!MJS::
SendInput V:\USPTO\Melanie Seelig.epf
Clipboard = V:\USPTO\Melanie Seelig.epf
gosub, GetPassword
return

::!SWF::
SendInput V:\USPTO\Scott.Forbes.epf
Clipboard = V:\USPTO\Scott.Forbes.epf
gosub, GetPassword
return

::!YXL::
SendInput V:\USPTO\Yiheng.Li.epf
Clipboard = V:\USPTO\Yiheng.Li.epf
gosub, GetPassword
return

::!ADM::
SendInput Q:\USPTO\Alejandro.Munoz.epf
Clipboard = Q:\USPTO\Alejandro.Munoz.epf
gosub, GetPassword
return

::!AVS::
SendInput Q:\USPTO\Andrew.Schwaab.epf
Clipboard = Q:\USPTO\Andrew.Schwaab.epf
gosub, GetPassword
return

::!JXV::
SendInput L:\USPTO\Josue.Villalta.epf
Clipboard = L:\USPTO\Josue.Villalta.epf
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
Gui, Add, Button, x10 y25 gEAL1, SD - S:\USPTO
Gui, Add, Button, x112  y25 gEAL2, SF - W:\USPTO
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
SendInput S:\USPTO\EliLoots.epf
Clipboard = S:\USPTO\EliLoots.epf
Sleep 200
gosub, GetPassword
return

EAL2:
Gui, Submit
Sleep 200
SendInput W:\USPTO\EliLoots.epf
Clipboard = W:\USPTO\EliLoots.epf
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
Gui, Add, Button, x10 y25 gEYZ1, SV - Q:\USPTO
Gui, Add, Button, x112  y25 gEYZ2, OC - H:\USPTO
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
SendInput Q:\USPTO\Eric.Zhou.epf
Clipboard = Q:\USPTO\Eric.Zhou.epf
Sleep 200
gosub, GetPassword
return

EYZ2:
Gui, Submit
Sleep 200
SendInput H:\USPTO\Eric.Zhou.epf
Clipboard = H:\USPTO\Eric.Zhou.epf
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
Gui, Add, Button, x10 y25 gGRM1, OC - H:\USPTO
Gui, Add, Button, x112  y25 gGRM2, SF - W:\USPTO
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
SendInput H:\USPTO\Grant.McAdams.epf
Clipboard = H:\USPTO\Grant.McAdams.epf
Sleep 200
gosub, GetPassword
return

GRM2:
Gui, Submit
Sleep 200
SendInput W:\USPTO\Grant.McAdams.epf
Clipboard = W:\USPTO\Grant.McAdams.epf
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
Gui, Add, Button, x10 y25 gJXV1, LA - L:\USPTO
Gui, Add, Button, x112  y25 gJXV2, OC - H:\USPTO
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
SendInput L:\USPTO\Josue.Villalta.epf
Sleep 200
gosub, GetPassword
return

JXV2:
Gui, Submit
Sleep 200
SendInput H:\USPTO\Josue.Villalta.epf
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
Gui, Add, Button, x10 y25 gLSE1, OC - H:\USPTO
Gui, Add, Button, x112  y25 gLSE2, DC - U:\USPTO
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
SendInput H:\USPTO\Lincoln.Essig.epf
Clipboard = H:\USPTO\Lincoln.Essig.epf
Sleep 200
gosub, GetPassword
return

LSE2:
Gui, Submit
Sleep 200
SendInput U:\USPTO\Lincoln.Essig.epf
Clipboard = U:\USPTO\Lincoln.Essig.epf
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
Gui, Add, Button, x10 y25 gMHT1, OC - H:\USPTO
Gui, Add, Button, x112  y25 gMHT2, SV - Q:\USPTO
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
SendInput H:\USPTO\Michael.Trenholm.epf
Clipboard = H:\USPTO\Michael.Trenholm.epf
Sleep 200
gosub, GetPassword
return

MHT2:
Gui, Submit
Sleep 200
SendInput Q:\USPTO\Michael.Trenholm.epf
Clipboard = Q:\USPTO\Michael.Trenholm.epf
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
Gui, Add, Button, x10 y25 gMZC1, OC - H:\USPTO
Gui, Add, Button, x112  y25 gMZC2, SD - S:\USPTO
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
SendInput H:\USPTO\Morgan.Coates.epf
Clipboard = H:\USPTO\Morgan.Coates.epf
Sleep 200
gosub, GetPassword
return

MZC2:
Gui, Submit
Sleep 200
SendInput S:\USPTO\Morgan.Coates.epf
Clipboard = S:\USPTO\Morgan.Coates.epf
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
Gui, Add, Button, x10 y25 gJLP1, SD - S:\USPTO
Gui, Add, Button, x112  y25 gJLP2, OC - H:\USPTO
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
SendInput S:\USPTO\John.Paik.epf
Clipboard = S:\USPTO\John.Paik.epf
Sleep 200
gosub, GetPassword
return

JLP2:
Gui, Submit
Sleep 200
SendInput H:\USPTO\John.Paik.epf
Clipboard = H:\USPTO\John.Paik.epf
Sleep 200
gosub, GetPassword
return

JLP3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

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