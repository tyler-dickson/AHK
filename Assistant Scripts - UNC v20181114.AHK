/* 
Created with AutoHotkey by Tyler Dickson. 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;              RELEASE NOTES                ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

v20181114 - Added some new attorneys to EFS Cert Finder.
v20181008 - Added new attorneys to EFS Certificate Finder. Updated icon. Added diagnostics.
v20180827 - Increased reliability when used in Excel. (Chooses ActiveCell.Value if possible)
v20180720 - Heavily redesigned look of GUI. 
		  - Changed Record Opener back to back-end version. 
		  - Per request, changed to not open in same tab. Added Radio for Tab vs. Window choice.
		  - Added Trimming to remove spaces from front and back. Should increase accuracy.
		  - Prevented use with blank clipboard or clipboard over 20 characters.
		  - Prevented multiple GUIs from existing.
		  - Can close GUI with Escape key.
v20180608 - Silicon Valley (Q: Drive) removed without warning! Updated certificates to correct new locations.
v20180427 - Old version of Record Opener is faster. Reverted changes to Record Opener. Left as-is for WorkSpace Opener.
v20180404 - Baron gave access to backend! Updated scripts to grab URL directly.
v20180328 - Added WorkSpace Opener to Ctrl + Right Click menu.
v20180305 - Added ASJ to certificate finder.
v20180212 - Updated to work in Microsoft Edge. 
		  - Now uses COM for IE version.
		  - Added version number for tracking. Need to forward to Heather G. on next revision.
v20180126 - Updated to Mike.Fuller.epf.
				*Removed hourly restart due to issues with .exe version.
v20171214 - Updated ALL locations to UNC locations.
v20171209 - Updated H: references to \\docs-oc\files\ to allow accessing/saving without mapping the H: drive.
				*Consider doing the same with ALL certificate locations to remove need to ever map drives?
		  - Added Periodic Restart (hourly) to incorporate changes made throughout day. Should be (mostly) invisible to user.
v20171206 - Initial version sent to Heather G. User functionality should be mostly consistent beyond this version.
		  - Behind-the-scenes aspects may change.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;                REFERENCES                 ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	H: - OC  \\docs-oc\files\ 
	S: - SD  \\docs-sd\files\ 
	U: - DC  \\dc-docs\files\ 
	V: - SEA \\sea-docs\files\
	Q: - SV  \\sv-docs\files\ 
	Y: - NY  \\ny-docs\files\ 
	L: - LA  \\docs-la\files\ 
	W: - SF  \\docs-sf\files\ 

	\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\
	
	http://kmobnet/insidekmobnet/Patent_TM_Reports/TMfacesheet.cfm?&casenumber=HANBEV.000ZCN&country
	
	http://kmobnet/insidekmobnet/Patent_TM_Reports/facesheet.cfm?&casenumber=DOCKETING.AHK&country	
*/

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\favicon.ico, 1

global TabOrWin
global Computername

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
	IniWrite, a.11.14.2018, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Version, Version
	;SetTimer, CloseWindow, 100
	;gosub WriteDiagnostics
	return
	}
else
	{
	gosub CreateFile
	;SetTimer, CloseWindow, 100
	;gosub WriteDiagnostics
	}
return

CreateFile:
IniWrite, 0, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSCertFinder
IniWrite, 0, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSFill
IniWrite, 0, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSLogin
IniWrite, 0, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
IniWrite, a.11.14.2018, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Version, Version
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;     CLOSE UNNECESSARY WINDOW DIALOGS      ;;
;;               (DISABLED)                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/*
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
*/

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;            OPEN AHK HELP FILE             ;;
;;                (DISABLED)                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;OpenHelp:
;FileCopy, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HTML\AHK Instructions.html, C:\Users\%Computername%\AHK Instructions.html, 1
;Sleep 2000
;Run "C:\Users\%ComputerName%\AHK Instructions.html"
;return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;             RUN RECORD OPENER             ;;
;;       Hold Control and Right Click        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^RButton::
Gui, 1:Destroy
Clipboard = 
CoordMode, Mouse, Screen     							   ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 

IfWinActive, ahk_exe EXCEL.EXE
	{
	xl := ComObjActive("Excel.Application")
	NewClipboard := xl.ActiveCell.Value
	}
	
if (NewClipboard != "")
	Clipboard := NewClipboard
else
	{
	Clipboard = ;
	SendInput ^c
	ClipWait, .2	
	}
	
Clipboard := Trim(Clipboard, " ")

if (Length := StrLen(Clipboard) < 5) || (Length := StrLen(Clipboard) > 20)
	return
StringLen, ClipLength, Clipboard
StringReplace, Clipboard, Clipboard, `r`n, , A
NewMousePosX := (xpos - 165)								; Adjust X position for GUI.
NewMousePosY := (ypos - 50)									; Adjust Y position for GUI.
IniRead, TabOrWin, C:\Users\%Computername%\AHKPrefs.ini, RecordOpener, TabOrWindow
if (TabOrWin == "ERROR")
	TabOrWin = 2

Gui, 1:New, +Owner +AlwaysOnTop +ToolWindow -Caption, Record Opener

Gui, 1:Font, s10 w500, Verdana
Gui, 1:Font, bold
Gui, 1:Add, Button, x20 y20 h25 w150 gCancelOpen, %Clipboard%
Gui, 1:Font, s10 w500 normal, Verdana
Gui, 1:Add, Button, xp yp+30  w150 h25 gOpenPatent, Open Patent
Gui, 1:Add, Button, xp yp+30  w150 h25 gOpenTrademark, Open Trademark	
Gui, 1:Add, Button, xp yp+30 w150 h25 gCancelOpen, Cancel		

;Gui, 1:Add, Button, x70 y90  w150 h25 gOpenWorkSpace, Open WorkSpace		
;Gui, 1:Add, Button, x70 y120 w150 h25 gCancelOpen, Cancel

if (TabOrWin == "1")
	{
	Gui, 1:Add, Radio, xp+17 yp+30 vMyRadioGroup Checked1, Tab
	Gui, 1:Add, Radio, xp+50 yp Checked0, Window
	}
else
	{
	Gui, 1:Add, Radio, xp+17 yp+30 vMyRadioGroup Checked0, Tab
	Gui, 1:Add, Radio, xp+50 yp Checked1, Window
	}

;Gui, 1:Show, x%NewMousePosX% y%NewMousePosY%
;Gui, 1:+ToolWindow ; -Caption                          			 ; Removes the Border and Task bar icon
;Gui, 1:Color, 000111, OpenInIE                                 ; can be any color

Random, PixelColor1, 120 , 235
Random, PixelColor2, 120 , 235
Random, PixelColor3, 120 , 235
SetFormat, IntegerFast, hex
PixelColor1 += 0
PixelColor1 .= ""
PixelColor1 := SubStr(PixelColor1, 3)
PixelColor2 += 0
PixelColor2 .= ""
PixelColor2 := SubStr(PixelColor2, 3)
PixelColor3 += 0
PixelColor3 .= ""
PixelColor3 := SubStr(PixelColor3, 3)
Gui, 1:Color, % PixelColor1 PixelColor2 PixelColor3, Record Opener
SetFormat, IntegerFast, dec
;Gui, 1:Color, 000000, Record Opener

;WinSet, Transcolor, ABCDEF, Record Opener
Gui, 1:Show, % "x" NewMousePosX+75 " y" NewMousePosY-15 "w200 h200", Record Opener
WinSet, Transparent, 0, Record Opener
Sleep 50

WinSet, Region, 0-0 W191 H170 R50-50, ahk_class AutoHotkeyGUI


WinSet, Transparent, 40, Record Opener
Sleep 50
WinSet, Transparent, 70, Record Opener
Sleep 50
WinSet, Transparent, 110, Record Opener
Sleep 50				
WinSet, Transparent, 150, Record Opener		
Sleep 50				
WinSet, Transparent, 190, Record Opener	
Sleep 50				
WinSet, Transparent, 255, Record Opener	

qry := "SELECT * FROM dbo.vwAHKMatterInfo WHERE Matter = '" Clipboard "'"
result := ADOSQL(qry)
global liveUrl := result[2,5] ;url in live docketing system
return

CancelOpen:
Gui, 1:Submit, NoHide
WinSet, Transparent, 235, Record Opener
Sleep 50
WinSet, Transparent, 190, Record Opener
Sleep 50
WinSet, Transparent, 150, Record Opener
Sleep 50
WinSet, Transparent, 110, Record Opener
Sleep 50				
WinSet, Transparent,  70, Record Opener		
Sleep 50				
WinSet, Transparent,  40, Record Opener	
Sleep 50				
WinSet, Transparent,  10, Record Opener	
Gui, 1:Destroy
IniWrite, %MyRadioGroup%, C:\Users\%Computername%\AHKPrefs.ini, RecordOpener, TabOrWindow
return

GuiEscape:
gosub CancelOpen
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;              WORKSPACE OPENER             ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

OpenWorkSpace:
Gui, 1:Submit
TrayTip, Opening WorkSpace in iManage,`n`nPlease wait...
qry := "SELECT * FROM dbo.vwAHKWorkspace WHERE WorkspaceName = '" Clipboard "'"
result := ADOSQL(qry)
workspaceName := result[2,1] ;workspace name
FolderNumber := result[2,2] ;miscellaneous folder Id
Sleep 200
if (FolderNumber == "")
	{
	TrayTip, Unable to open WorkSpace, I couldn't open the WorkSpace.`nYou may have selected too much text`, or it may not exist.`nPlease open manually or try again.
	return
	}
else 
	{
	DocumentText := "OC-iDMS`n!nrtdms:0:!session:OC-iDMS:!database:KMOB:!folder:ordinary," . FolderNumber
	Sleep 200
	FileDelete, C:\Users\%Computername%\KMOB_%FolderNumber%.nrl
	Sleep 250
	FileAppend, %DocumentText%, C:\Users\%Computername%\KMOB_%FolderNumber%.nrl
	Sleep 250
	WinActivate, ahk_exe OUTLOOK.EXE  ;  ahk_class rctrl_renwnd32
	Sleep 100
	Run, C:\Users\%Computername%\KMOB_%FolderNumber%.nrl
	Sleep 500
	FileDelete, C:\Users\%Computername%\KMOB_%FolderNumber%.nrl
	gosub RecordWorkSpaceOpener
	return
	}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;				; Reference page for Record Opener options.
;;                                           ;;				; https://msdn.microsoft.com/en-us/library/dd565688(v=vs.85).aspx
;;          DOCKETING RECORD OPENER          ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

OpenTrademark:
Gui, 1:Submit, NoHide
IniWrite, %MyRadioGroup%, C:\Users\%Computername%\AHKPrefs.ini, RecordOpener, TabOrWindow
TrayTip, Quick Record Opener, Opening a TM in docketing.
if (liveUrl != "")
	{
	if (MyRadioGroup == "2")
		Run, iexplore.exe %liveUrl%
	else
		Run, %liveUrl%
	}
else
	{
	if (MyRadioGroup == "2")	
		Run, iexplore.exe "http://oc-docketing/CPi/tmkschTrademark.aspx"
	else
		Run, "http://oc-docketing/CPi/tmkschTrademark.aspx"
	}
SendInput {Ctrl up}
liveUrl := ""
result := ""
WinSet, Transparent, 235, Record Opener
Sleep 50
WinSet, Transparent, 190, Record Opener
Sleep 50
WinSet, Transparent, 150, Record Opener
Sleep 50
WinSet, Transparent, 110, Record Opener
Sleep 50				
WinSet, Transparent,  70, Record Opener		
Sleep 50				
WinSet, Transparent,  40, Record Opener	
Sleep 50				
WinSet, Transparent,  10, Record Opener	
Gui, 1:Submit
TrayTip
gosub RecordClientCodeIE
SendInput {Ctrl up}
return

OpenPatent:
Gui, 1:Submit
IniWrite, %MyRadioGroup%, C:\Users\%Computername%\AHKPrefs.ini, RecordOpener, TabOrWindow
TrayTip, Quick Record Opener, Opening a Patent in docketing.
if (liveUrl != "")
	{
	if (MyRadioGroup == "2")
		Run, iexplore.exe %liveUrl%
	else
		Run, %liveUrl%
	}
else
	{
	if (MyRadioGroup == "2")	
		Run, iexplore.exe "http://oc-docketing/CPi/patschCountryApplication.aspx"
	else
		Run, "http://oc-docketing/CPi/patschCountryApplication.aspx"
	}
SendInput {Ctrl up}
liveUrl := ""
result := ""
WinSet, Transparent, 235, Record Opener
Sleep 50
WinSet, Transparent, 190, Record Opener
Sleep 50
WinSet, Transparent, 150, Record Opener
Sleep 50
WinSet, Transparent, 110, Record Opener
Sleep 50				
WinSet, Transparent,  70, Record Opener		
Sleep 50				
WinSet, Transparent,  40, Record Opener	
Sleep 50				
WinSet, Transparent,  10, Record Opener	
Gui, 1:Submit
TrayTip
gosub RecordClientCodeIE
SendInput {Ctrl up}
return


/*
OpenDocketingLive:
Gui, 1:Submit
qry := "SELECT * FROM dbo.vwAHKMatterInfo WHERE Matter = '" Clipboard "'"
Sleep 200
result := ADOSQL(qry)
Sleep 200
liveUrl := result[2,5] ;url in live docketing system
Sleep 200
if (liveURL != "")
	{
	}
else
	{
	gosub RecordOpenerFallback
	return
	}
OutputVar := liveURL
ie := WBGet()
	if IsObject(ie) = 0
		{
		Run "iexplore.exe"
		Sleep 3000
		ie := WBGet()
		}
	else
params := [OutputVar, 32]
ie.Navigate(params*)
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
SendInput {Ctrl up}
liveUrl := ""
result := ""
OutputVar := ""
return
	
RecordOpenerFallback:
OutputVar = http://oc-docketing/CPi/patschCountryApplication.aspx
ie := WBGet()
var := ie.LocationURL ;grab current url
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
;IELoad(wb)
ie.Document.All.schstrCaseNumber_TextBox.Value := Clipboard
ie.Document.All.btnStartSearch.Click()
ie.Visible := True
WinActivate, ahk_class IEFrame
gosub RecordClientCodeIE
return

*/

;matter := result[2,1] ;matter name
;matterId := result[2,2] ;countryapp id or trademark id
;invId := result[2,3] ;if matter is a patent, otherwise 0 is returned
;system := result[2,4] ;matter type: patent or trademark
;liveUrl := result[2,5] ;url in live docketing system
;agentUrl := result[2,6] ;url in agent docketing system
;invUrl := result[2,7] ;invention url if patent, otherwise black
;display := % matter "`n" matterId "`n" invId "`n" system "`n" liveUrl "`n" agentUrl "`n" invUrl

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
;;        EFS CERT FINDER HOTSTRINGS         ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GetPassword:
ie := WBGet()
IniRead, Password, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\EFS - UNC.ini, EFS, %AttyCert%
Sleep 1000
TrayTip, %AttyCert%, Password: %Password%
ie.document.parentWindow.frames("entrustTruePassGuiFrame").document.GetElementsBytagname("INPUT")[0].Value := AttyCert ; Username
ie.document.parentWindow.frames("entrustTruePassGuiFrame").document.GetElementsBytagname("INPUT")[2].Value := Password ; Password
ie.document.parentWindow.frames("entrustTruePassGuiFrame").document.GetElementsBytagname("INPUT")[3].Click()  		   ; Checkbox
if WinActive("ahk_class SunAwtFrame") || WinActive("ahk_class ApplicationFrameWindow")
	{
	SendInput %AttyCert%
	Send {Tab}
	Sleep 1250
	Send {Tab}
	Send ^+{Left}
	Sleep 500
	Send {BackSpace}
	Sleep 200
	Send %Password%
	}
AttyCert := ""
Password := ""
Sleep 3000
TrayTip
gosub RecordEFSCertFinder
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;¿                                                           ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#If WinActive("ahk_class IEFrame") || WinActive("ahk_class SunAwtFrame") || WinActive("ahk_class ApplicationFrameWindow")

::!BJJ::
global AttyCert := "\\docs-sf\files\USPTO\Bryan.Johnson.epf"
gosub, GetPassword
return

::!ADL::
global AttyCert := "\\docs-oc\files\USPTO\Andrew.Lee.epf"
gosub, GetPassword
return

::!CZB::
global AttyCert := "\\docs-sd\files\USPTO\Caleb.Bates.epf"
gosub, GetPassword
return

::!CZH::
global AttyCert := "\\docs-sd\files\USPTO\Clayton.Henson.epf"
gosub, GetPassword
return

::!SRS::
global AttyCert := "\\sea-docs\files\USPTO\Scott.Seeley.epf"
gosub, GetPassword
return

::!TZF::
global AttyCert := "\\docs-oc\files\USPTO\Tomohisa.Fujiwara.epf"
gosub, GetPassword
return

::!RWF::
global AttyCert := "\\docs-sd\files\USPTO\Ryan.Furtado.epf"
gosub, GetPassword
return

::!DMA::
global AttyCert := "\\docs-sd\files\USPTO\Derek.Abeyta.epf"
gosub, GetPassword
return

::!ASJ::
global AttyCert := "\\docs-oc\files\USPTO\Aaron.Johnson.epf"
gosub, GetPassword
return

::!ADZ::
global AttyCert := "\\docs-oc\files\USPTO\Alexander.Zeng.epf"
gosub, GetPassword
return

::!MXR::
global AttyCert := "\\docs-sd\files\USPTO\Mark.Rubinshtein.epf"
gosub, GetPassword
return

::!NIG::
global AttyCert := "\\docs-oc\files\USPTO\Noorean.Gill.epf"
gosub, GetPassword
return

::!DXC::
global AttyCert := "\\docs-oc\files\USPTO\David.Cohen.epf"
gosub, GetPassword
return

::!DWK::
global AttyCert := "\\docs-sf\files\USPTO\David.Kellogg.epf"
gosub, GetPassword
return

::!LLS::
global AttyCert := "\\docs-sd\files\USPTO\Loni.Morrow.epf"
gosub, GetPassword
return

::!MBH::
global AttyCert := "\\ny-docs\files\USPTO\Mitch.Hadley.epf"
gosub, GetPassword
return

::!DCT::
global AttyCert := "\\docs-sd\files\USPTO\Dylan.Turner.epf"
gosub, GetPassword
return

::!RHP::
global AttyCert := "\\docs-sd\files\USPTO\Rick.Park.epf"
gosub, GetPassword
return


::!SGS::
global AttyCert := "\\docs-sf\files\USPTO\Scott.Siera.epf"
gosub, GetPassword
return

::!VXT::
global AttyCert := "\\docs-oc\files\USPTO\Vlad.Teplitskiy.epf"
gosub, GetPassword
return

::!JPL::
global AttyCert := "\\docs-oc\files\USPTO\Josepher.Li.epf"
gosub, GetPassword
return

::!BHL::
global AttyCert := "\\docs-sf\files\USPTO\Ben.Liu.epf"
gosub, GetPassword
return

::!CDD::
global AttyCert := "\\docs-sd\files\USPTO\Casey.Donahoe.epf"
gosub, GetPassword
return

::!JJC::
global AttyCert := "\\docs-oc\files\USPTO\Jeremy.Carney.epf"
gosub, GetPassword
return

::!JZA::
global AttyCert := "\\docs-oc\files\USPTO\Jessica.Achtsam.epf"
gosub, GetPassword
return

::!NJL::
global AttyCert := "\\docs-oc\files\USPTO\Nathan.Lee.epf"
gosub, GetPassword
return

::!SYW::
global AttyCert := "\\docs-oc\files\USPTO\Sabrina.Wang.epf"
gosub, GetPassword
return

::!AKD::
global AttyCert := "\\docs-oc\files\USPTO\Angela.Dremann.epf"
gosub, GetPassword
return

::!ZJH::
global AttyCert := "\\docs-oc\files\USPTO\Zach.Hong.epf"
gosub, GetPassword
return

::!AUK::
global AttyCert := "\\docs-oc\files\USPTO\Alexander.Kappner.epf"
gosub, GetPassword
return

::!AJG::
global AttyCert := "\\docs-oc\files\USPTO\Adam.Gilbert.epf"
gosub, GetPassword
return

::!AXJ::
global AttyCert := "\\docs-oc\files\USPTO\Agnes.Juang.epf"
gosub, GetPassword
return

::!AJS::
global AttyCert := "\\docs-oc\files\USPTO\Albert.Sueiras.epf"
gosub, GetPassword
return

::!AJM::
global AttyCert := "\\docs-oc\files\USPTO\Alex.Martinez.epf"
gosub, GetPassword
return

::!AZ4::
global AttyCert := "\\docs-oc\files\USPTO\Allison.Weimer.epf"
gosub, GetPassword
return

::!AGB::
global AttyCert := "\\docs-oc\files\USPTO\Allyson.Brown.epf"
gosub, GetPassword
return

::!ACC::
global AttyCert := "\\docs-oc\files\USPTO\Amy.Chun.epf"
gosub, GetPassword
return

::!AMD::
global AttyCert := "\\docs-oc\files\USPTO\Andrew.Douglas.epf"
gosub, GetPassword
return

::!AIK::
global AttyCert := "\\docs-oc\files\USPTO\Andrew.Kimmel.epf"
gosub, GetPassword
return

::!AWL::
global AttyCert := "\\docs-oc\files\USPTO\Andrew.Lloyd.epf"
gosub, GetPassword
return

::!AVS::
global AttyCert := "\\docs-oc\files\USPTO\Andrew.Schwaab.epf"
gosub, GetPassword
return

::!AHS::
global AttyCert := "\\docs-oc\files\USPTO\Andrew.Simpson.epf"
gosub, GetPassword
return

::!ASR::
global AttyCert := "\\docs-oc\files\USPTO\Art Rose.epf"
gosub, GetPassword
return

::!BJE::
global AttyCert := "\\docs-oc\files\USPTO\Ben.Everton.epf"
gosub, GetPassword
return

::!BAK::
global AttyCert := "\\docs-oc\files\USPTO\Benajmain.Katzenellenbogen.epf"
gosub, GetPassword
return

::!WBB::
global AttyCert := "\\docs-oc\files\USPTO\Bill.Bunker.epf"
gosub, GetPassword
return

::!WHS::
global AttyCert := "\\docs-oc\files\USPTO\Bill.Shreve.epf"
gosub, GetPassword
return

::!BRB::
global AttyCert := "\\docs-oc\files\USPTO\Brent Babcock.epf"
gosub, GetPassword
return

::!BMD::
global AttyCert := "\\docs-oc\files\USPTO\Brent Dougal.epf"
gosub, GetPassword
return

::!BCC::
global AttyCert := "\\docs-oc\files\USPTO\Brian Claassen.epf"
gosub, GetPassword
return

::!BZS::
global AttyCert := "\\docs-oc\files\USPTO\Bridget Smith.epf"
gosub, GetPassword
return

::!BSI::
global AttyCert := "\\docs-oc\files\USPTO\Bruce.Itchkawitz.epf"
gosub, GetPassword
return

::!BWW::
global AttyCert := "\\docs-oc\files\USPTO\Bryan.Wahl.epf"
gosub, GetPassword
return

::!CKL::
global AttyCert := "\\docs-oc\files\USPTO\Catherine.Lee.epf"
gosub, GetPassword
return

::!CYL::
global AttyCert := "\\docs-oc\files\USPTO\Chang.Lim.epf"
gosub, GetPassword
return

::!CSC::
global AttyCert := "\\docs-oc\files\USPTO\Che.Chereskin.epf"
gosub, GetPassword
return

::!CXR::
global AttyCert := "\\docs-oc\files\USPTO\Christopher Ross.epf"
gosub, GetPassword
return

::!CSS::
global AttyCert := "\\docs-oc\files\USPTO\Craig.Summers.epf"
gosub, GetPassword
return

::!CRH::
global AttyCert := "\\docs-oc\files\USPTO\Curtis.Huffmire.epf"
gosub, GetPassword
return

::!CCD::
global AttyCert := "\\docs-oc\files\USPTO\Curtiss.Dosier.epf"
gosub, GetPassword
return

::!DJH::
global AttyCert := "\\docs-oc\files\USPTO\Damien.Howard.epf"
gosub, GetPassword
return

::!DEA::
global AttyCert := "\\docs-oc\files\USPTO\Dan.Altman.epf"
gosub, GetPassword
return

::!DJF::
global AttyCert := "\\docs-oc\files\USPTO\Dan.Fischer.epf"
gosub, GetPassword
return

::!DVG::
global AttyCert := "\\docs-oc\files\USPTO\Daniel.Gibson.epf"
gosub, GetPassword
return

::!DLO::
global AttyCert := "\\docs-oc\files\USPTO\Darrell.Olson.epf"
gosub, GetPassword
return

::!DSB::
global AttyCert := "\\docs-oc\files\USPTO\David.Barnhill.epf"
gosub, GetPassword
return

::!DMD::
global AttyCert := "\\docs-oc\files\USPTO\David.Dremann.epf"
gosub, GetPassword
return

::!DGK::
global AttyCert := "\\docs-oc\files\USPTO\David.G.Kim.epf"
gosub, GetPassword
return

::!DGJ::
global AttyCert := "\\docs-oc\files\USPTO\David.Jankowski.epf"
gosub, GetPassword
return

::!DRS::
global AttyCert := "\\docs-oc\files\USPTO\David.Schmidt.epf"
gosub, GetPassword
return

::!DVK::
global AttyCert := "\\docs-oc\files\USPTO\David.T.Kim.epf"
gosub, GetPassword
return

::!DRB::
global AttyCert := "\\docs-oc\files\USPTO\Derek.Bayles.epf"
gosub, GetPassword
return

::!DXD::
global AttyCert := "\\docs-oc\files\USPTO\Devanie.Dufour.epf"
gosub, GetPassword
return

::!DGM::
global AttyCert := "\\docs-oc\files\USPTO\Doug.Muehlhauser.epf"
gosub, GetPassword
return

::!DXW::
global AttyCert := "\\docs-oc\files\USPTO\Douglas.Wentzel.epf"
gosub, GetPassword
return

::!EAS::
global AttyCert := "\\docs-oc\files\USPTO\Ed.Schlatter.epf"
gosub, GetPassword
return

::!GVH::
global AttyCert := "\\docs-oc\files\USPTO\Gerard.vonHoffmann.epf"
gosub, GetPassword
return

::!GLN::
global AttyCert := "\\docs-oc\files\USPTO\Glen.Nuttall.epf"
gosub, GetPassword
return

::!HXM::
global AttyCert := "\\docs-oc\files\USPTO\Hans.Mayer.epf"
gosub, GetPassword
return

::!HZS::
global AttyCert := "\\docs-oc\files\USPTO\Harnik.Shukla.epf"
gosub, GetPassword
return

::!HCS::
global AttyCert := "\\docs-oc\files\USPTO\Hochan.Song.epf"
gosub, GetPassword
return

::!IAL::
global AttyCert := "\\docs-oc\files\USPTO\Irfan.Lateef.epf"
gosub, GetPassword
return

::!JUP::
global AttyCert := "\\docs-oc\files\USPTO\Jacob.Peterson.epf"
gosub, GetPassword
return

::!JCB::
global AttyCert := "\\docs-oc\files\USPTO\Jared.Bunker.epf"
gosub, GetPassword
return

::!JZK::
global AttyCert := "\\docs-oc\files\USPTO\Jarom.Kesler.epf"
gosub, GetPassword
return

::!JAG::
global AttyCert := "\\docs-oc\files\USPTO\Jason.Gersting.epf"
gosub, GetPassword
return

::!JCS::
global AttyCert := "\\docs-oc\files\USPTO\Jason.Swartz.epf"
gosub, GetPassword
return

::!JUH::
global AttyCert := "\\docs-oc\files\USPTO\Jeffery.Hallstrom.epf"
gosub, GetPassword
return

::!JYC::
global AttyCert := "\\docs-oc\files\USPTO\Joan.Chan.epf"
gosub, GetPassword
return

::!HSU::
global AttyCert := "\\docs-oc\files\USPTO\Johannes.Hsu.epf"
gosub, GetPassword
return

::!JRK::
global AttyCert := "\\docs-oc\files\USPTO\John King.epf"
gosub, GetPassword
return

::!JMG::
global AttyCert := "\\docs-oc\files\USPTO\John.Grover.epf"
gosub, GetPassword
return

::!JHS::
global AttyCert := "\\docs-oc\files\USPTO\John.Sadlik.epf"
gosub, GetPassword
return

::!JBS::
global AttyCert := "\\docs-oc\files\USPTO\John.Sganga.epf"
gosub, GetPassword
return

::!JWG::
global AttyCert := "\\docs-oc\files\USPTO\Jon Gurka.epf"
gosub, GetPassword
return

::!JUC::
global AttyCert := "\\docs-oc\files\USPTO\Jordan.Cox.epf"
gosub, GetPassword
return

::!JYS::
global AttyCert := "\\docs-oc\files\USPTO\Joshua Stowell.epf"
gosub, GetPassword
return

::!JDB::
global AttyCert := "\\docs-oc\files\USPTO\Joshua.Berk.epf"
gosub, GetPassword
return

::!JJG::
global AttyCert := "\\docs-oc\files\USPTO\Justin.Gillett.epf"
gosub, GetPassword
return

::!KJL::
global AttyCert := "\\docs-oc\files\USPTO\Karen.Lenker.epf"
gosub, GetPassword
return

::!KAD::
global AttyCert := "\\docs-oc\files\USPTO\Karoline.Delaney.epf"
gosub, GetPassword
return

::!KXA::
global AttyCert := "\\docs-oc\files\USPTO\Kazuo.Aoki.epf"
gosub, GetPassword
return

::!KZL::
global AttyCert := "\\docs-oc\files\USPTO\Keith.Lim.epf"
gosub, GetPassword
return

::!KNS::
global AttyCert := "\\docs-oc\files\USPTO\Kent.Shum.epf"
gosub, GetPassword
return

::!LDS::
global AttyCert := "\\docs-oc\files\USPTO\Lance.Smemoe.epf"
gosub, GetPassword
return

::!LXK::
global AttyCert := "\\docs-oc\files\USPTO\Lauren.Keller.epf"
gosub, GetPassword
return

::!LGR::
global AttyCert := "\\docs-oc\files\USPTO\Lavanya.Rau.epf"
gosub, GetPassword
return

::!LHL::
global AttyCert := "\\docs-oc\files\USPTO\Linda.Liu.epf"
gosub, GetPassword
return

::!LLX::
global AttyCert := "\\docs-oc\files\USPTO\Linda.Xu.epf"
gosub, GetPassword
return

::!LLY::
global AttyCert := "\\docs-oc\files\USPTO\Lori.Yamato.epf"
gosub, GetPassword
return

::!MRB::
global AttyCert := "\\docs-oc\files\USPTO\Mark Benedict.epf"
gosub, GetPassword
return

::!MJG::
global AttyCert := "\\docs-oc\files\USPTO\Mark Gallagher.epf"
gosub, GetPassword
return

::!MED::
global AttyCert := "\\docs-oc\files\USPTO\Mark.Davis.epf"
gosub, GetPassword
return

::!MRZ::
global AttyCert := "\\docs-oc\files\USPTO\Marko.Zoretic.epf"
gosub, GetPassword
return

::!MPB::
global AttyCert := "\\docs-oc\files\USPTO\Michael.Burns.epf"
gosub, GetPassword
return

::!MRC::
global AttyCert := "\\docs-oc\files\USPTO\Michael.Christensen.epf"
gosub, GetPassword
return

::!MAG::
global AttyCert := "\\docs-oc\files\USPTO\Michael.Guiliana.epf"
gosub, GetPassword
return

::!MCL::
global AttyCert := "\\docs-oc\files\USPTO\Mike.Lee.epf"
gosub, GetPassword
return

::!MCK::
global AttyCert := "\\docs-oc\files\USPTO\Mincheol.Kim.epf"
gosub, GetPassword
return

::!NMZ::
global AttyCert := "\\docs-oc\files\USPTO\Nicholas.Zovko.epf"
gosub, GetPassword
return

::!NXB::
global AttyCert := "\\docs-oc\files\USPTO\Nira.Brand.epf"
gosub, GetPassword
return

::!NAM::
global AttyCert := "\\docs-oc\files\USPTO\Nora.Marachelian.epf"
gosub, GetPassword
return

::!OAM::
global AttyCert := "\\docs-oc\files\USPTO\Omar.AlMesned.epf"
gosub, GetPassword
return

::!PNC::
global AttyCert := "\\docs-oc\files\USPTO\Paul.Conover.epf"
gosub, GetPassword
return

::!PDO::
global AttyCert := "\\docs-oc\files\USPTO\Perry.Oldham.epf"
gosub, GetPassword
return

::!PQT::
global AttyCert := "\\docs-oc\files\USPTO\Peter.Tong.epf"
gosub, GetPassword
return

::!PMN::
global AttyCert := "\\docs-oc\files\USPTO\Philip.Nelson.epf"
gosub, GetPassword
return

::!RNN::
global AttyCert := "\\docs-oc\files\USPTO\Rabi.Narula.epf"
gosub, GetPassword
return

::!RDS::
global AttyCert := "\\docs-oc\files\USPTO\Raymond.Smith.epf"
gosub, GetPassword
return

::!RJR::
global AttyCert := "\\docs-oc\files\USPTO\Robb.Roby.epf"
gosub, GetPassword
return

::!ROS::
global AttyCert := "\\docs-oc\files\USPTO\Ron.Schoenbaum.epf"
gosub, GetPassword
return

::!RMJ::
global AttyCert := "\\docs-oc\files\USPTO\Russell.Jeide.epf"
gosub, GetPassword
return

::!SHL::
global AttyCert := "\\docs-oc\files\USPTO\Sabing.Lee.epf"
gosub, GetPassword
return

::!SAM::
global AttyCert := "\\docs-oc\files\USPTO\Salima Merani.epf"
gosub, GetPassword
return

::!SZC::
global AttyCert := "\\docs-oc\files\USPTO\Scott.Cromar.epf"
gosub, GetPassword
return

::!SXR::
global AttyCert := "\\docs-oc\files\USPTO\Scott.Raevsky.epf"
gosub, GetPassword
return

::!SXA::
global AttyCert := "\\docs-oc\files\USPTO\Sean.Ambrosius.epf"
gosub, GetPassword
return

::!SXL::
global AttyCert := "\\docs-oc\files\USPTO\Shannon.Lam.epf"
gosub, GetPassword
return

::!SNS::
global AttyCert := "\\docs-oc\files\USPTO\Sheila Swaroop.epf"
gosub, GetPassword
return

::!SCJ::
global AttyCert := "\\docs-oc\files\USPTO\Steve.Jensen.epf"
gosub, GetPassword
return

::!SPR::
global AttyCert := "\\docs-oc\files\USPTO\Steven Ruden.epf"
gosub, GetPassword
return

::!SJN::
global AttyCert := "\\docs-oc\files\USPTO\Steven.Nataupsky.epf"
gosub, GetPassword
return

::!TXN::
global AttyCert := "\\docs-oc\files\USPTO\Tak.Nishimura.epf"
gosub, GetPassword
return

::!TMC::
global AttyCert := "\\docs-oc\files\USPTO\Ted Cannon.epf"
gosub, GetPassword
return

::!TKT::
global AttyCert := "\\docs-oc\files\USPTO\Terry.Tullis.epf"
gosub, GetPassword
return

::!TGP::
global AttyCert := "\\docs-oc\files\USPTO\Theodore.Papagiannis.epf"
gosub, GetPassword
return

::!TYY::
global AttyCert := "\\docs-oc\files\USPTO\Thomas.Yee.epf"
gosub, GetPassword
return

::!VZB::
global AttyCert := "\\docs-oc\files\USPTO\Vikas.Bhargava.epf"
gosub, GetPassword
return

::!VSL::
global AttyCert := "\\docs-oc\files\USPTO\Vladimir.Lozan.epf"
gosub, GetPassword
return

::!JYW::
global AttyCert := "\\docs-oc\files\USPTO\YueJoyWang.epf"
gosub, GetPassword
return

::!ZAG::
global AttyCert := "\\docs-oc\files\USPTO\Zachary.Glantz.epf"
gosub, GetPassword
return

::!ABP::
global AttyCert := "\\docs-sd\files\USPTO\Adam.Powell.epf"
gosub, GetPassword
return

::!AEM::
global AttyCert := "\\docs-sd\files\USPTO\Andrew.Morrell.epf"
gosub, GetPassword
return

::!BBA::
global AttyCert := "\\docs-sd\files\USPTO\Ben.Anger.epf"
gosub, GetPassword
return

::!BSG::
global AttyCert := "\\docs-sd\files\USPTO\Brenden.Gingrich.epf"
gosub, GetPassword
return

::!PCS::
global AttyCert := "\\docs-sd\files\USPTO\Chris Steinhardt.epf"
gosub, GetPassword
return

::!CMD::
global AttyCert := "\\docs-sd\files\USPTO\Chris.DiLeo.epf"
gosub, GetPassword
return

::!CLS::
global AttyCert := "\\docs-sd\files\USPTO\Claine.Snow.epf"
gosub, GetPassword
return

::!DOH::
global AttyCert := "\\docs-sd\files\USPTO\Dan.Hart.epf"
gosub, GetPassword
return

::!DKY::
global AttyCert := "\\docs-sd\files\USPTO\Dan.Yarbrough.epf"
gosub, GetPassword
return

::!DPH::
global AttyCert := "\\docs-sd\files\USPTO\Daniel Hughes.epf"
gosub, GetPassword
return

::!DAK::
global AttyCert := "\\docs-sd\files\USPTO\Daniel.Kamkar.epf"
gosub, GetPassword
return

::!DZD::
global AttyCert := "\\docs-sd\files\USPTO\David.Dang.epf"
gosub, GetPassword
return

::!DPK::
global AttyCert := "\\docs-sd\files\USPTO\David.Kujawa.epf"
gosub, GetPassword
return

::!DCD::
global AttyCert := "\\docs-sd\files\USPTO\Derek.Dailey.epf"
gosub, GetPassword
return

::!DSH::
global AttyCert := "\\docs-sd\files\USPTO\Drew.Hamilton.epf"
gosub, GetPassword
return

::!EMN::
global AttyCert := "\\docs-sd\files\USPTO\Eric Nelson.epf"
gosub, GetPassword
return

::!ESF::
global AttyCert := "\\docs-sd\files\USPTO\Eric.Furman.epf"
gosub, GetPassword
return

::!FTH::
global AttyCert := "\\docs-sd\files\USPTO\Fred.Hale.epf"
gosub, GetPassword
return

::!FAN::
global AttyCert := "\\docs-sd\files\USPTO\Fred.Nicholson.epf"
gosub, GetPassword
return

::!GAH::
global AttyCert := "\\docs-sd\files\USPTO\Greg.Hermanson.epf"
gosub, GetPassword
return

::!GXM::
global AttyCert := "\\docs-sd\files\USPTO\Greg.Munchinsky.epf"
gosub, GetPassword
return

::!HZC::
global AttyCert := "\\docs-sd\files\USPTO\Heungsoo.Choi.epf"
gosub, GetPassword
return

::!IWG::
global AttyCert := "\\docs-sd\files\USPTO\Ian Gillies.epf"
gosub, GetPassword
return

::!JFH::
global AttyCert := "\\docs-sd\files\USPTO\James.Herkenhoff.epf"
gosub, GetPassword
return

::!JQD::
global AttyCert := "\\docs-sd\files\USPTO\Jane.Dai.epf"
gosub, GetPassword
return

::!JQX::
global AttyCert := "\\docs-sd\files\USPTO\Jane.Xia.epf"
gosub, GetPassword
return

::!JJJ::
global AttyCert := "\\docs-sd\files\USPTO\Jason Jardine.epf"
gosub, GetPassword
return

::!JZL::
global AttyCert := "\\docs-sd\files\USPTO\Jing.Liu.epf"
gosub, GetPassword
return

::!JMC::
global AttyCert := "\\docs-sd\files\USPTO\John Carson.epf"
gosub, GetPassword
return

::!JEG::
global AttyCert := "\\docs-sd\files\USPTO\Jordan.Gottdank.epf"
gosub, GetPassword
return

::!JMR::
global AttyCert := "\\docs-sd\files\USPTO\Joseph Reisman.epf"
gosub, GetPassword
return

::!JOM::
global AttyCert := "\\docs-sd\files\USPTO\Joseph.Mallon.epf"
gosub, GetPassword
return

::!KST::
global AttyCert := "\\docs-sd\files\USPTO\Kerry.Taylor.epf"
gosub, GetPassword
return

::!KJM::
global AttyCert := "\\docs-sd\files\USPTO\Kimberly Miller.epf"
gosub, GetPassword
return

::!KXW::
global AttyCert := "\\docs-sd\files\USPTO\Kun.Wang.epf"
gosub, GetPassword
return

::!LMF::
global AttyCert := "\\docs-sd\files\USPTO\Larry.Firestone.epf"
gosub, GetPassword
return

::!LEN::
global AttyCert := "\\docs-sd\files\USPTO\Lauren.Hockett.epf"
gosub, GetPassword
return

::!MVS::
global AttyCert := "\\docs-sd\files\USPTO\Maria.Stout.epf"
gosub, GetPassword
return

::!MMA::
global AttyCert := "\\docs-sd\files\USPTO\Mark.Abumeri.epf"
gosub, GetPassword
return

::!MWC::
global AttyCert := "\\docs-sd\files\USPTO\Mark.Catanese.epf"
gosub, GetPassword
return

::!MDM::
global AttyCert := "\\docs-sd\files\USPTO\Mark.Marsden.epf"
gosub, GetPassword
return

::!MLF::
global AttyCert := "\\docs-sd\files\USPTO\Mike.Fuller.epf"
gosub, GetPassword
return

::!NRL::
global AttyCert := "\\docs-sd\files\USPTO\Nate.Luman.epf"
gosub, GetPassword
return

::!NAI::
global AttyCert := "\\docs-sd\files\USPTO\Ned.Israelsen.epf"
gosub, GetPassword
return

::!NSB::
global AttyCert := "\\docs-sd\files\USPTO\Neil.Bartfeld.epf"
gosub, GetPassword
return

::!PYC::
global AttyCert := "\\docs-sd\files\USPTO\Paul.Chang.epf"
gosub, GetPassword
return

::!PXL::
global AttyCert := "\\docs-sd\files\USPTO\Peter.Law.epf"
gosub, GetPassword
return

::!RJS::
global AttyCert := "\\docs-sd\files\USPTO\Ray.Salenieks.epf"
gosub, GetPassword
return

::!RJH::
global AttyCert := "\\docs-sd\files\USPTO\Robert.Hilton.epf"
gosub, GetPassword
return

::!RMT::
global AttyCert := "\\docs-sd\files\USPTO\Rose.Thiessen.epf"
gosub, GetPassword
return

::!REM::
global AttyCert := "\\docs-sd\files\USPTO\Ryan Melnick.epf"
gosub, GetPassword
return

::!SCY::
global AttyCert := "\\docs-sd\files\USPTO\Samantha.Markley.epf"
gosub, GetPassword
return

::!TRA::
global AttyCert := "\\docs-sd\files\USPTO\Tom.Arno.epf"
gosub, GetPassword
return

::!TSC::
global AttyCert := "\\docs-sd\files\USPTO\Tom.Cowan.epf"
gosub, GetPassword
return

::!TJH::
global AttyCert := "\\docs-sd\files\USPTO\Travis.Hill.epf"
gosub, GetPassword
return

::!VCV::
global AttyCert := "\\docs-sd\files\USPTO\Victor.Vassar.epf"
gosub, GetPassword
return

::!VKG::
global AttyCert := "\\docs-sd\files\USPTO\Vijay.Gore.epf"
gosub, GetPassword
return

::!JXW::
global AttyCert := "\\docs-sd\files\USPTO\Jeffrey.Wu.epf"
gosub, GetPassword
return

::!DNW::
global AttyCert := "\\docs-la\files\USPTO\David.Weiss.epf"
gosub, GetPassword
return

::!MDK::
global AttyCert := "\\docs-la\files\USPTO\Mark.Kachner.epf"
gosub, GetPassword
return

::!MSO::
global AttyCert := "\\docs-la\files\USPTO\Mike.Okamoto.epf"
gosub, GetPassword
return

::!AXD::
global AttyCert := "\\docs-sf\files\USPTO\Aaron.Davis.epf"
gosub, GetPassword
return

::!ASA::
global AttyCert := "\\docs-sf\files\USPTO\Adeel.Akhtar.epf"
gosub, GetPassword
return

::!ANM::
global AttyCert := "\\docs-sf\files\USPTO\Andrew.Merickel.epf"
gosub, GetPassword
return

::!BMG::
global AttyCert := "\\docs-sf\files\USPTO\Brian Graham.epf"
gosub, GetPassword
return

::!DRT::
global AttyCert := "\\docs-sf\files\USPTO\David.Trossen.epf"
gosub, GetPassword
return

::!ELF::
global AttyCert := "\\docs-sf\files\USPTO\Eric.Fong.epf"
gosub, GetPassword
return

::!KZM::
global AttyCert := "\\docs-sf\files\USPTO\Kyu.Min.epf"
gosub, GetPassword
return

::!PSS::
global AttyCert := "\\docs-sf\files\USPTO\Paul.Stellman.epf"
gosub, GetPassword
return

::!VXL::
global AttyCert := "\\docs-sf\files\USPTO\V.Lakshmananepf.epf"
gosub, GetPassword
return

::!ZYW::
global AttyCert := "\\docs-sf\files\USPTO\Zi Wong.epf"
gosub, GetPassword
return

::!DJG::
global AttyCert := "\\dc-docs\files\USPTO\David.Grant.epf"
gosub, GetPassword
return

::!JUB::
global AttyCert := "\\dc-docs\files\USPTO\Julie.Burke.epf"
gosub, GetPassword
return

::!MUM::
global AttyCert := "\\dc-docs\files\USPTO\Mark.Metzke.epf"
gosub, GetPassword
return

::!AVB::
global AttyCert := "\\sea-docs\files\USPTO\Adam.Burks.epf"
gosub, GetPassword
return

::!AFQ::
global AttyCert := "\\sea-docs\files\USPTO\Andrew.Quecan.epf"
gosub, GetPassword
return

::!BPJ::
global AttyCert := "\\sea-docs\files\USPTO\Benjamin.Johnson.epf"
gosub, GetPassword
return

::!BGM::
global AttyCert := "\\sea-docs\files\USPTO\Bryan McWhorter.epf"
gosub, GetPassword
return

::!CTS::
global AttyCert := "\\sea-docs\files\USPTO\Christopher Sweeney.epf"
gosub, GetPassword
return

::!CBH::
global AttyCert := "\\sea-docs\files\USPTO\Colin Heideman.epf"
gosub, GetPassword
return

::!MCA::
global AttyCert := "\\sea-docs\files\USPTO\Maria Anderson.epf"
gosub, GetPassword
return

::!MAU::
global AttyCert := "\\sea-docs\files\USPTO\Mauricio Uribe.epf"
gosub, GetPassword
return

::!MJS::
global AttyCert := "\\sea-docs\files\USPTO\Melanie Seelig.epf"
gosub, GetPassword
return

::!SWF::
global AttyCert := "\\sea-docs\files\USPTO\Scott.Forbes.epf"
gosub, GetPassword
return

::!YXL::
global AttyCert := "\\sea-docs\files\USPTO\Yiheng.Li.epf"
gosub, GetPassword
return

::!ADM::
global AttyCert := "\\docs-sf\files\USPTO\Alejandro.Munoz.epf"
gosub, GetPassword
return

::!AVS::
global AttyCert := "\\docs-sf\files\USPTO\Andrew.Schwaab.epf"
gosub, GetPassword
return

::!JXV::
global AttyCert := "\\docs-la\files\USPTO\Josue.Villalta.epf"
gosub, GetPassword
return

::!EAL::
global AttyCert := "\\docs-sf\files\USPTO\EliLoots.epf"
gosub, GetPassword
return

;::!EYZ::
;REMOVED

;::!GRM::
;REMOVED

::!LSE::
global AttyCert := "\\dc-docs\files\USPTO\Lincoln.Essig.epf"
gosub, GetPassword
return

::!MHT::
global AttyCert := "\\docs-sf\files\USPTO\Michael.Trenholm.epf"
gosub, GetPassword
return

::!MZC::
global AttyCert := "\\docs-oc\files\USPTO\Morgan.Coates.epf"
gosub, GetPassword
return

::!JLP::
global AttyCert := "\\docs-oc\files\USPTO\John.Paik.epf"
gosub, GetPassword
return

#If


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;                 ANALYTICS                 ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

RecordEFSCertFinder:
IniRead, EFSCertFinder, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSCertFinder
EFSCertFinder++
IniWrite, %EFSCertFinder%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSCertFinder
return

RecordEFSFill:
IniRead, EFSFill, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSFill
EFSFill++
IniWrite, %EFSFill%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSFill
return

RecordEFSLogin:
IniRead, EFSLogin, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSLogin
EFSLogin++
IniWrite, %EFSLogin%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, EFSLogin
return

RecordClientCodeIE:
IniRead, ClientCodeIE, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
ClientCodeIE++
IniWrite, %ClientCodeIE%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, ClientCodeIE
return

RecordWorkSpaceOpener:
IniRead, WorkSpaceOpener, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, WorkSpaceOpener
WorkSpaceOpener++
IniWrite, %WorkSpaceOpener%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, WorkSpaceOpener
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;;                HOTSTRINGS                 ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;::#shrug::¯\_(ツ)_/¯
;::btw::by the way

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

/*
###############################################################################################################
######                                      ADOSQL v5.04L - By [VxE]                                     ######
###############################################################################################################

	Wraps the utility of ADODB to connect to a database, submit a query, and read the resulting recordset.
	Returns the result as a new object (or array of objects, if the query has multiple statements).
	To instead have this function return a string, include a delimiter option in the connection string.

	For AHK-L (v1.1 or later).
	Freely available @ http://www.autohotkey.com/community/viewtopic.php?p=558323#p558323

	IMPORTANT! Before you can use this library, you must have access to a database AND know the connection
	string to connect to your database.

	Varieties of databases will have different connection string formats, and different drivers (providers).
	Use the mighty internet to discover the connection string format and driver for your type of database.

	Example connection string for SQLServer (2005) listening on port 1234 and with a static IP:
	DRIVER={SQL SERVER};SERVER=192.168.0.12,1234\SQLEXPRESS;DATABASE=mydb;UID=admin;PWD=12345;APP=AHK
*/

Global ADOSQL_LastError, ADOSQL_LastQuery ; These super-globals are for debugging your SQL queries.


ADOSQL(Query_Statement) {
; Uses an ADODB object to connect to a database, submit a query and read the resulting recordset.
; By default, this function returns an object. If the query generates exactly one result set, the object is
; a 2-dimensional array containing that result (the first row contains the column names). Otherwise, the
; returned object is an array of all the results. To instead have this function return a string, append either
; ";RowDelim=`n" or ";ColDelim=`t" to the connection string (substitute your preferences for "`n" and "`t").
; If there is more than one table in the output string, they are separated by 3 consecutive row-delimiters.
; ErrorLevel is set to "Error" if ADODB is not available, or the COM error code if a COM error is encountered.
; Otherwise ErrorLevel is set to zero.

Connection_String := "Provider=sqloledb;Data Source=DB-Portal;Initial Catalog=KMOBPortal;Integrated Security=SSPI;"

coer := "", txtout := 0, rd := "`n", cd := "CSV", str := Connection_String ; 'str' is shorter.

; Examine the connection string for output formatting options.
	If ( 9 < oTbl := 9 + InStr( ";" str, ";RowDelim=" ) )
	{
		rd := SubStr( str, oTbl, 0 - oTbl + oRow := InStr( str ";", ";", 0, oTbl ) )
		str := SubStr( str, 1, oTbl - 11 ) SubStr( str, oRow )
		txtout := 1
	}
	If ( 9 < oTbl := 9 + InStr( ";" str, ";ColDelim=" ) )
	{
		cd := SubStr( str, oTbl, 0 - oTbl + oRow := InStr( str ";", ";", 0, oTbl ) )
		str := SubStr( str, 1, oTbl - 11 ) SubStr( str, oRow )
		txtout := 1
	}

	;ComObjError( 0 ) ; We'll manage COM errors manually.

; Create a connection object. > http://www.w3schools.com/ado/ado_ref_connection.asp
; If something goes wrong here, return blank and set the error message.
	If !( oCon := ComObjCreate( "ADODB.Connection" ) )
		Return "", ComObjError( 1 ), ErrorLevel := "Error"
		, ADOSQL_LastError := "Fatal Error: ADODB is not available."


	oCon.ConnectionTimeout := 3 ; Allow 3 seconds to connect to the server.
	oCon.CursorLocation := 3 ; Use a client-side cursor server.
	oCon.CommandTimeout := 900 ; A generous 15 minute timeout on the actual SQL statement.
	oCon.Open( str ) ; open the connection.

; Execute the query statement and get the recordset. > http://www.w3schools.com/ado/ado_ref_recordset.asp
	If !( coer := A_LastError )
		oRec := oCon.execute( ADOSQL_LastQuery := Query_Statement )

	If !( coer := A_LastError ) ; The query executed OK, so examine the recordsets.
	{
		o3DA := [] ; This is a 3-dimensional array.
		While IsObject( oRec )
			If !oRec.State ; Recordset.State is zero if the recordset is closed, so we skip it.
				oRec := oRec.NextRecordset()
			Else ; A row-returning operation returns an open recordset
			{
				oFld := oRec.Fields
				o3DA.Insert( oTbl := [] )
				oTbl.Insert( oRow := [] )

				Loop % cols := oFld.Count ; Put the column names in the first row.
					oRow[ A_Index ] := oFld.Item( A_Index - 1 ).Name

				While !oRec.EOF ; While the record pointer is not at the end of the recordset...
				{
					oTbl.Insert( oRow := [] )
					oRow.SetCapacity( cols ) ; Might improve performance on huge tables??
					Loop % cols
						oRow[ A_Index ] := oFld.Item( A_Index - 1 ).Value	
					oRec.MoveNext() ; move the record pointer to the next row of values
				}

				oRec := oRec.NextRecordset() ; Get the next recordset.
			}

		If (txtout) ; If the user wants plaintext output, copy the results into a string
		{
			Query_Statement := "x"
			Loop % o3DA.MaxIndex()
			{
				Query_Statement .= rd rd
				oTbl := o3DA[ A_Index ]
				Loop % oTbl.MaxIndex()
				{
					oRow := oTbl[ A_Index ]
					Loop % oRow.MaxIndex()
						If ( cd = "CSV" )
						{
							str := oRow[ A_Index ]
							StringReplace, str, str, ", "", A          ;"
							If !ErrorLevel || InStr( str, "," ) || InStr( str, rd )
								str := """" str """"
							Query_Statement .= ( A_Index = 1 ? rd : "," ) str
						}
						Else
							Query_Statement .= ( A_Index = 1 ? rd : cd ) oRow[ A_Index ]
				}
			}
			Query_Statement := SubStr( Query_Statement, 2 + 3 * StrLen( rd ) )
		}
	}
	Else ; Oh NOES!! Put a description of each error in 'ADOSQL_LastError'.
	{
		oErr := oCon.Errors ; > http://www.w3schools.com/ado/ado_ref_error.asp
		Query_Statement := "x"
		Loop % oErr.Count
		{
			oFld := oErr.Item( A_Index - 1 )
			str := oFld.Description
			Query_Statement .= "`n`n" SubStr( str, 1 + InStr( str, "]", 0, 2 + InStr( str, "][", 0, 0 ) ) )
				. "`n   Number: " oFld.Number
				. ", NativeError: " oFld.NativeError
				. ", Source: " oFld.Source
				. ", SQLState: " oFld.SQLState
		}
		ADOSQL_LastError := SubStr( Query_Statement, 4 )
		Query_Statement := ""
		txtout := 1
	}

; Close the connection and return the result. Local objects are cleaned up as the function returns.
	oCon.Close()
	;ComObjError( 1 )
	ErrorLevel := coer
	Return txtout ? Query_Statement : o3DA.MaxIndex() = 1 ? o3DA[1] : o3DA
} ; END - ADOSQL( Connection_String, Query_Statement )

/*
WriteDiagnostics:
IniWrite, %A_IsAdmin%, 	    % "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, Admin
IniWrite, %A_Is64bitOS%,    % "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, 64bit
IniWrite, %A_OSType%, 	    % "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, OS Type
IniWrite, %A_OSVersion%,    % "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, OS Version
IniWrite, %A_ComputerName%, % "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, Computer Name
IniWrite, %A_UserName%, 	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, Username
IniWrite, REDACTED,		 	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, IP Address 1
IniWrite, %A_MyDocuments%, 	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, My Documents
IniWrite, %A_Startup%, 		% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, Startup Folder
IniWrite, %A_Desktop%, 		% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, Desktop

FileGetVersion, iManVersion , C:\Program Files (x86)\Interwoven\WorkSite\iOutlook\imFileSiteEx.dll
	if iManVersion = ERROR
		FileGetVersion, iManVersion , C:\Program Files\Interwoven\WorkSite\iOutlook\imFileSiteEx.dll
	if iManVersion = 
		FileGetVersion, iManVersion , C:\Program Files\Interwoven\WorkSite\iOutlook\imFileSiteEx.dll		
Sleep 500
IniWrite, %iManVersion%, 	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, iManVersion

FileGetVersion, AHKVersion , C:\Program Files\AutoHotkey\AutoHotkey.exe
Sleep 500
IniWrite, %AHKVersion%, 	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, AHKVersion

FileGetVersion, IEVersion , C:\Program Files\internet explorer\iexplore.exe
Sleep 500
IniWrite, %IEVersion%, 	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, IEVersion

FileGetVersion, JabberVersion, C:\Program Files (x86)\Cisco Systems\Cisco Jabber\CiscoJabber.exe
Sleep 500
IniWrite, %JabberVersion%, 	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, JabberVersion

FileGetVersion, ChromeVersion, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
Sleep 500
IniWrite, %ChromeVersion%, 	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, ChromeVersion

FileGetVersion, ExcelVersion, C:\Program Files (x86)\Microsoft Office\Office16\EXCEL.EXE
Sleep 500
IniWrite, %ExcelVersion%, 	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, ExcelVersion

FileGetVersion, WordVersion, C:\Program Files (x86)\Microsoft Office\Office16\WINWORD.EXE
Sleep 500
IniWrite, %WordVersion%, 	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, WordVersion

FileGetVersion, OutlookVersion, C:\Program Files (x86)\Microsoft Office\Office16\OUTLOOK.EXE
Sleep 500
IniWrite, %OutlookVersion%, 	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, OutlookVersion

FileGetVersion, AdobeVersion, C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe
Sleep 500
IniWrite, %AdobeVersion%, 	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, AdobeVersion

FileGetVersion, DesktopAuthority, C:\Desktop Authority\SLstart.exe
Sleep 500
IniWrite, %DesktopAuthority%, 	% "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Diagnostics\" Computername ".ini", Diagnostic, DesktopAuthority
return
*/

