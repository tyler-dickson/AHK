#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;                            https://msdn.microsoft.com/en-us/library/dd565688(v=vs.85).aspx

; Add at lines 468ish
IniRead, EFSPayEmail,    C:\Users\%A_Username%\AHKPrefs.ini, Username, EFSPayEmail
IniRead, EFSPayPassword, C:\Users\%A_Username%\AHKPrefs.ini, Username, EFSPassword

; Add at lines 990ish
IniWrite, %EFSPayEmail%,    C:\Users\%A_Username%\AHKPrefs.ini, Username, EFSPayEmail
IniWrite, %EFSPayPassword%, C:\Users\%A_Username%\AHKPrefs.ini, Username, EFSPayPassword

; Add at lines 737ish
PopEFSButton:
Gui, 20: New, AlwaysOnTop Owner, EFS Functions
Gui, 20: Add, Button, x5 y2 w100 gFillEFS, Fill EFS Sections
Gui, 20: Add, Button, x107 y2 w100 gEFSPayLogIn, Log into EFS
Gui, 20: +ToolWindow
Gui, 20: Show
return

; Update Gui, 5 as follows:

Gui, 5:New, +AlwaysOnTop +Owner, Record Opener Options
Gui, 5:+ToolWindow -Caption 
Gui, 5:Color, D3D3D3
Gui, 5:Font, bold underline
Gui, 5:Add, Text, x5 y2 w145 +Center,Record Opener Options:
Gui, 5:Add, Text, x150 y2 w145 +Center,EFS Options:
Gui, 5:Font
Gui, 5:Add, Text, x2 y20 w70 +Center,Patent:
Gui, 5:Add, Text, x2 y40 w70 +Center,Trademark:
Gui, 5:Add, Text, x2 y60 w70 +Center,Invention:
Gui, 5:Add, Checkbox, x70 y20  Checked%RecordBoxes1% gClearA vRecordBox1, Live
Gui, 5:Add, Checkbox, x113 y20  Checked%RecordBoxes2% gClearB vRecordBox2, AT
Gui, 5:Add, Checkbox, x70 y40 Checked%RecordBoxes5% gClearC vRecordBox5, Live
Gui, 5:Add, Checkbox, x113 y40 Checked%RecordBoxes6% gClearD vRecordBox6, AT
Gui, 5:Add, Checkbox, x70 y60 Checked%RecordBoxes3% gClearE vRecordBox3, Live
Gui, 5:Add, Checkbox, x113 y60 Checked%RecordBoxes4% gClearF vRecordBox4, AT
Gui, 5:Font, bold 
Gui, 5:Add, Text, x5 y83 w145 +Center, Force Only Patent/TM?
Gui, 5:Font
Gui, 5:Font, italic
Gui, 5:Add, Text, x5 y98 w145 +Center, No pop-up or AT option.
Gui, 5:Font
Gui, 5:Add, Radio, x2 y115 h20 w32          Checked%RadioChoice1% vRadioChoice1, Off
Gui, 5:Add, Radio, x35 y115 h20 w48 gClear1 Checked%RadioChoice2% vRadioChoice2, Patent
Gui, 5:Add, Radio, x85 y115 h20 w70 gClear2 Checked%RadioChoice3% vRadioChoice3, Trademark
Gui, 5:Add, Text, x153 h20 y20  w146 +Center, First Name:
Gui, 5:Add, Edit, x153 h20 y35  w146 Limit +Center vEFSFirst, %EFSFirst%
Gui, 5:Add, Text, x153 h20 y60  w146 +Center, Last Name:
Gui, 5:Add, Edit, x153 h20 y75  w146 Limit +Center vEFSLast, %EFSLast%
Gui, 5:Add, Text, x153 h20 y100 w146 +Center, Filing Email Address:
	if EFSEmail = instructions@knobbe.com
		Gui, 5:Add, DropDownList, R2 x153 h20 y115 w146 +Center vEFSEmail, %EFSEmail%||efiling@knobbe.com
	if EFSEmail = efiling@knobbe.com
		Gui, 5:Add, DropDownList, R2 x153 h20 y115 w146 +Center vEFSEmail, %EFSEmail%||instructions@knobbe.com
Gui, 5:Add, Text, x153 h20 y140 w146 +Center, EFS Payment Email/Username:
Gui, 5:Add, Edit, x153 h20 y155 w146 +Center vEFSPayEmail, %EFSPayEmail%
Gui, 5:Add, Text, x153 h20 y180 w146 +Center, EFS Payment Password:
Gui, 5:Add, Edit, x153 h20 y195 w146 +Center Password vEFSPayPassword, %EFSPayPassword%
Gui, 5:Add, Button, x5 y140 w142 h75 gNothingButton, Button that doesn't do anything yet.
Gui, 5:Add, Button, x264 y0 w35 h35 gPopEFSButton,EFS Fill
return

NothingButton:
var = C:\Users\%A_Username%\Desktop\giphy.gif ;location of gif you want to show
	Gui, 69:New, AlwaysOnTop Owner
	Gui, 69:Add, ActiveX, w520 h364 vWB, shell explorer
	wb.Navigate("about:blank")
	html := "<html>`n<title>name</title>`n<body>`n<center>`n<img src=""" var """ >`n</center>`n</body>`n</html>"
	wb.document.write(html)
	;Gui, 69:Show, x0 y0 w500 h344
	Gui, 69: Show, AutoSize Center
	Sleep 3000
	Gui, 69:Destroy
return

; Stick this somewhere.

EFSPayLogIn:
IniRead, EFSPayEmail,    C:\Users\%A_Username%\AHKPrefs.ini, Username, EFSPayEmail
IniRead, EFSPayPassword, C:\Users\%A_Username%\AHKPrefs.ini, Username, EFSPassword
EFSPayEmail = %EFSPayEmail%
EFSPayPassword  = %EFSPayPassword%
OutputVar = https://fees.uspto.gov/pay/
ie := ComObjCreate("InternetExplorer.Application")
ie.Visible := False
;params := [OutputVar, 4096]
params := [OutputVar, 32]
ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
ie.Document.All.headerSignInLink.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
SplashTextOn, 200, , Signing into EFS...
ie.Document.All.uniqName_11_9.Value := EFSPayEmail
ie.Document.All.uniqName_11_10.Value := EFSPayPassword
Sleep 250
ie.Document.All.dijit_form_Button_10.Click()
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
IELoad(wb)
Sleep 10000
;ie.Visible := True
ie.Quit() ; this is if you want the ie browser to close once the string as been found
SplashTextOff
return		


