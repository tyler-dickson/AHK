;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                              ;;
;;            If you're here to fix your shortcuts,             ;;
;;       scroll all the way to the end! (hit Ctrl + End)        ;;
;;     Make sure you don't modify anything except the values    ;;
;;          at the bottom under the "Shortcuts" heading.        ;;
;;                                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;           Tester Window            ;;
;;              Ctrl + ~              ;;
;;      To test pasting passwords     ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#`::
TesterWindow()
return

TesterWindow()
{
Gui, New, +Owner, 
Gui, Add, Button, x1   y0  w50 h30 gGrabEPF, Grab EPFs 
Gui, Add, Button, x55  y0  w70 h30 gPasswordUpdate, Update Password
Gui, Add, Button, x130 y0  w80 h30 gInitialShortcut, Create Initial Shortcut
Gui, Add, Text, x10 y40 w200 h20 +Center, Test Attorney Initials w/ ! (e.g. !xxx):                                                            
Gui, Add, Edit, x10 y55 w200 h20 +Center,  
Gui, Add, Text, x10 y80 w200 h20 +Center, This is a spacer since it hits Tab twice.                                           
Gui, Add, Edit, x10 y95 w200 h20 +Center,
Gui, Add, Text, x10 y120 w200 h20 +Center, Password will Autofill if it exists:                                             
Gui, Add, Edit, x10 y135 w200 h20 +Center,
Gui, Add, Button, Default gDoNothing, Submit 
Gui, Show
return

DoNothing:
Gui, Submit
MsgBox, Done.
return

GrabEPF:
Gui, Submit
gosub, GrabEPFs
return

PasswordUpdate:
Gui, Submit
gosub, UpdatePasswords
return

InitialShortcut:
Gui, Submit
gosub, CreateHotstring
return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;  Grab all .epf files from folder   ;;
;;              Ctrl + J              ;;
;;        Stores data in EFS.ini      ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^j::                                             ; This grabs all filenames from a folder and adds any with .epf extension to EFS.ini.
gosub, GrabEPFs
return

GrabEPFs:
Arrayed := Object()                                                          ; Working.
test = % list_files(A_WinDir)
MsgBox, %test%
Sort, test, U D`n \
StringSplit, Arrayed, test, `n, 
AttysAdded = 0
AttysNotAdded = 0

Loop, %Arrayed0%
{
IfInString, Arrayed%A_Index%, lnk
	{
	AttysNotAdded++
	}
else IfInString, Arrayed%A_Index%, epf                                      ;  Grabs all .EPF files. Can accept %Format% too.
	{
	FileAppend, % Arrayed%A_Index% "=`n", C:\Users\%A_Username%\Desktop\EFS.ini
	AttysAdded++
	}
else
	AttysNotAdded++
}
MsgBox, %AttysAdded% attorneys added to EFS.ini. %AttysNotAdded% not added.
return

list_files(Directory)
{
	files =
	Loop H:\USPTO\*.*                                                      ; H: = OC, S: = SD, etc.  THIS ONE WORKS BRO.
	{
		files = %files%`n%A_LoopFileFullPath%
	}
	return files
}

;Loop C:\Users\%A_Username%\Desktop\*.*
;H:\USPTO\*.*

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;    Update Password for Attorney    ;;
;;              Ctrl + K              ;;
;;        Stores data in EFS.ini      ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^k::
gosub, UpdatePasswords
return

UpdatePasswords:
FileRead, AttorneyData, C:\Users\%A_Username%\Desktop\EFS.ini
Loops = ;
Start = 2

Loop, 5
{
gosub, UpdatePassword
Loops++
}
MsgBox, Looped %Loops% times.
return

UpdatePassword:
StringSplit, Attorney, AttorneyData, `n, ,                                                                ; GOOD
StringSplit, AttorneyGood, % Attorney%Start%, =,                                                          ; GOOD
;MsgBox, Number of parts = %AttorneyGood0% `nAttorney = %AttorneyGood1% `nPassword = %AttorneyGood2%      ; GOOD - No need for variable beyond Start since it changes each iteration!
Gui, New, , Update Password                                                                               ; GOOD
Gui, Add, Text, x10 y8 w200 h20 +Center, %AttorneyGood1%                                                  ; GOOD
Gui, Add, Edit, x10 y25 w200 h20 Limit8 +Center vAttorneyGood2, %AttorneyGood2%                           ; GOOD
Gui, Add, Button, Default gSubmit, Submit                                                                 ; GOOD
Gui, Add, Button, gCancel, Cancel                                                                         ; GOOD
Gui, Show                                                                                                 ; GOOD
WinWaitClose, Update Password                                                                             ; GOOD
Start++                                                                                                   ; GOOD
return                                                                                                    ; GOOD

Submit:
{
Gui, Submit
IniWrite, %AttorneyGood2%, C:\Users\%A_Username%\Desktop\EFS.ini, EFS, %AttorneyGood1%
Gui, Destroy
}

Cancel:
Gui, Destroy
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;; Create Hotstring for Cert/Password ;;
;;              Ctrl + =              ;;
;;     Stores data in Initials.ini    ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^=::
gosub, CreateHotstring`
return

CreateHotstring:
FileRead, InitialData, C:\Users\%A_Username%\Desktop\Initials.ini
Loops = ;`
Initialsa = 2
Colon2 = ::

Loop, 245
{
gosub, HotstringCreator
Loops++
}
MsgBox, Looped %Loops% times.
Reload
Sleep 500 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, The script could not be reloaded. 
return

HotstringCreator:
#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t

StringSplit, Initials, InitialData, `n, ,                                                                  ; GOOD
StringSplit, InitialsGood, % Initials%Initialsa%, =,                                                       ; GOOD
;MsgBox, Number of parts = %InitialsGood0% `nAttorney = %InitialsGood1% `nInitials = %InitialsGood2%       ; GOOD - No need for variable beyond Start since it changes each iteration!

Gui, New, +AlwaysOnTop, Create Shortcut
Gui, Add, Text, w180 h78 +Center, Add initials for Attorney shortcut.`n`nAttorney Name:`n%InitialsGood1%`n`nEnter Attorney's Initials:
Gui, Add, Edit, w180 h20 Limit +Center vExtended, %InitialsGood2%
Gui, Add, Button, x22 y120 w50 h30 Default gInitialsUpdate , Update
Gui, Add, Button, x130 y120 w50 h30 gInitialsCancel , Cancel
Gui, Add, Button, x22 y160 w160 h30 +Center gInitialsFix , Need to delete a mistake?
Gui, Show, 
WinWaitClose, Create Shortcut                                                                              ; GOOD
Initialsa++                                                                                                ; GOOD
return                                                                                                     ; GOOD

InitialsUpdate:
{
Gui, Submit
StringLeft, InitialsGood2, InitialsGood2, 3                             ; Stores first three characters. 
FileAppend,`n::`!%InitialsGood2%`:`:`nSendInput %InitialsGood1%`ngosub, GetPassword`nreturn`n, C:\Users\%A_Username%\Desktop\EFS.ahk
Sleep 100
IniWrite, %InitialsGood2%, C:\Users\%A_Username%\Desktop\Initials.ini, Initials, %InitialsGood1%
;MsgBox, %InitialsGood2% %InitialsGood1%
;MsgBox, `n::`!%InitialsGood2%::`nSendInput %InitialsGood1%`ngosub, GetPassword`nreturn`n
return
}

InitialsCancel:
{
Gui, Destroy
MsgBox, Shortcut NOT saved.
ExitApp
Return
}

InitialsFix:
{
Gui, Destroy
MsgBox, OK, let's open the file so you can fix any mistakes.
Run, C:\Windows\Notepad.exe "C:\Users\%A_Username%\Desktop\EFS.ahk"
Sleep 200
SendInput ^{End} ; Takes the user to the bottom of the document.
Return
}

GetPassword:
OldClipboard = %Clipboard%
Send ^a
Sleep 200
Send ^c
Sleep 200
IniRead, Password, C:\Users\%A_Username%\Desktop\EFS.ini, EFS, %Clipboard%
Sleep 200
SplashTextOn, 65,, %Password%
;MsgBox, %Password%
Send {Tab}
Sleep 1250
SplashTextOff
Send {Tab}
Sleep 200
Send %Password%
Sleep 200
Clipboard = %OldClipboard%
return

;^1::
;CreatePassword()

;FileRead, PasswordData, C:\Users\%A_Username%\Desktop\Initials.ini
;Sleep 100
;MsgBox, %PasswordData%

;StringSplit, AttyInitialExt, PasswordData, `n, ,                                                                ; GOOD
;MsgBox, %AttyInitialExt0% %InitialExt1% %InitialExt2%

;StringSplit, InitialExt, AttyInitialExt2, =, , 
;MsgBox, %InitialExt0%`n%InitialExt1%`n%InitialExt2%
;return














































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

::!AJG::
SendInput H:\USPTO\Adam.Gilbert.epf
gosub, GetPassword
return

::!AXJ::
SendInput H:\USPTO\Agnes.Juang.epf
gosub, GetPassword
return

::!AJS::
SendInput H:\USPTO\Albert.Sueiras.epf
gosub, GetPassword
return

::!AJM::
SendInput H:\USPTO\Alex.Martinez.epf
gosub, GetPassword
return

::!AZ4::
SendInput H:\USPTO\Allison.Weimer.epf
gosub, GetPassword
return

::!AGB::
SendInput H:\USPTO\Allyson.Brown.epf
gosub, GetPassword
return

::!ACC::
SendInput H:\USPTO\Amy.Chun.epf
gosub, GetPassword
return

::!AMD::
SendInput H:\USPTO\Andrew.Douglas.epf
gosub, GetPassword
return

::!AIK::
SendInput H:\USPTO\Andrew.Kimmel.epf
gosub, GetPassword
return

::!AWL::
SendInput H:\USPTO\Andrew.Lloyd.epf
gosub, GetPassword
return

::!AVS::
SendInput H:\USPTO\Andrew.Schwaab.epf
gosub, GetPassword
return

::!AHS::
SendInput H:\USPTO\Andrew.Simpson.epf
gosub, GetPassword
return

::!ASR::
SendInput H:\USPTO\Art Rose.epf
gosub, GetPassword
return

::!BJE::
SendInput H:\USPTO\Ben.Everton.epf
gosub, GetPassword
return

::!BAK::
SendInput H:\USPTO\Benajmain.Katzenellenbogen.epf
gosub, GetPassword
return

::!WBB::
SendInput H:\USPTO\Bill.Bunker.epf
gosub, GetPassword
return

::!WHS::
SendInput H:\USPTO\Bill.Shreve.epf
gosub, GetPassword
return

::!BRB::
SendInput H:\USPTO\Brent Babcock.epf
gosub, GetPassword
return

::!BMD::
SendInput H:\USPTO\Brent Dougal.epf
gosub, GetPassword
return

::!BCC::
SendInput H:\USPTO\Brian Claassen.epf
gosub, GetPassword
return

::!BZS::
SendInput H:\USPTO\Bridget Smith.epf
gosub, GetPassword
return

::!BSI::
SendInput H:\USPTO\Bruce.Itchkawitz.epf
gosub, GetPassword
return

::!BWW::
SendInput H:\USPTO\Bryan.Wahl.epf
gosub, GetPassword
return

::!CKL::
SendInput H:\USPTO\Catherine.Lee.epf
gosub, GetPassword
return

::!CYL::
SendInput H:\USPTO\Chang.Lim.epf
gosub, GetPassword
return

::!CSC::
SendInput H:\USPTO\Che.Chereskin.epf
gosub, GetPassword
return

::!CXR::
SendInput H:\USPTO\Christopher Ross.epf
gosub, GetPassword
return

::!CSS::
SendInput H:\USPTO\Craig.Summers.epf
gosub, GetPassword
return

::!CRH::
SendInput H:\USPTO\Curtis.Huffmire.epf
gosub, GetPassword
return

::!CCD::
SendInput H:\USPTO\Curtiss.Dosier.epf
gosub, GetPassword
return

::!DJH::
SendInput H:\USPTO\Damien.Howard.epf
gosub, GetPassword
return

::!DEA::
SendInput H:\USPTO\Dan.Altman.epf
gosub, GetPassword
return

::!DJF::
SendInput H:\USPTO\Dan.Fischer.epf
gosub, GetPassword
return

::!DVG::
SendInput H:\USPTO\Daniel.Gibson.epf
gosub, GetPassword
return

::!DLO::
SendInput H:\USPTO\Darrell.Olson.epf
gosub, GetPassword
return

::!DSB::
SendInput H:\USPTO\David.Barnhill.epf
gosub, GetPassword
return

::!DMD::
SendInput H:\USPTO\David.Dremann.epf
gosub, GetPassword
return

::!DGK::
SendInput H:\USPTO\David.G.Kim.epf
gosub, GetPassword
return

::!DGJ::
SendInput H:\USPTO\David.Jankowski.epf
gosub, GetPassword
return

::!DRS::
SendInput H:\USPTO\David.Schmidt.epf
gosub, GetPassword
return

::!DVK::
SendInput H:\USPTO\David.T.Kim.epf
gosub, GetPassword
return

::!DRB::
SendInput H:\USPTO\Derek.Bayles.epf
gosub, GetPassword
return

::!DXD::
SendInput H:\USPTO\Devanie.Dufour.epf
gosub, GetPassword
return

::!DGM::
SendInput H:\USPTO\Doug.Muehlhauser.epf
gosub, GetPassword
return

::!DXW::
SendInput H:\USPTO\Douglas.Wentzel.epf
gosub, GetPassword
return

::!EAS::
SendInput H:\USPTO\Ed.Schlatter.epf
gosub, GetPassword
return

::!GVH::
SendInput H:\USPTO\Gerard.vonHoffmann.epf
gosub, GetPassword
return

::!GLN::
SendInput H:\USPTO\Glen.Nuttall.epf
gosub, GetPassword
return

::!HXM::
SendInput H:\USPTO\Hans.Mayer.epf
gosub, GetPassword
return

::!HZS::
SendInput H:\USPTO\Harnik.Shukla.epf
gosub, GetPassword
return

::!HCS::
SendInput H:\USPTO\Hochan.Song.epf
gosub, GetPassword
return

::!IAL::
SendInput H:\USPTO\Irfan.Lateef.epf
gosub, GetPassword
return

::!JUP::
SendInput H:\USPTO\Jacob.Peterson.epf
gosub, GetPassword
return

::!JCB::
SendInput H:\USPTO\Jared.Bunker.epf
gosub, GetPassword
return

::!JZK::
SendInput H:\USPTO\Jarom.Kesler.epf
gosub, GetPassword
return

::!JAG::
SendInput H:\USPTO\Jason.Gersting.epf
gosub, GetPassword
return

::!JCS::
SendInput H:\USPTO\Jason.Swartz.epf
gosub, GetPassword
return

::!JUH::
SendInput H:\USPTO\Jeffery.Hallstrom.epf
gosub, GetPassword
return

::!JYC::
SendInput H:\USPTO\Joan.Chan.epf
gosub, GetPassword
return

::!HSU::
SendInput H:\USPTO\Johannes.Hsu.epf
gosub, GetPassword
return

::!JRK::
SendInput H:\USPTO\John King.epf
gosub, GetPassword
return

::!JMG::
SendInput H:\USPTO\John.Grover.epf
gosub, GetPassword
return

::!JHS::
SendInput H:\USPTO\John.Sadlik.epf
gosub, GetPassword
return

::!JBS::
SendInput H:\USPTO\John.Sganga.epf
gosub, GetPassword
return

::!JWG::
SendInput H:\USPTO\Jon Gurka.epf
gosub, GetPassword
return

::!JUC::
SendInput H:\USPTO\Jordan.Cox.epf
gosub, GetPassword
return

::!JYS::
SendInput H:\USPTO\Joshua Stowell.epf
gosub, GetPassword
return

::!JDB::
SendInput H:\USPTO\Joshua.Berk.epf
gosub, GetPassword
return

::!JJG::
SendInput H:\USPTO\Justin.Gillett.epf
gosub, GetPassword
return

::!KJL::
SendInput H:\USPTO\Karen.Lenker.epf
gosub, GetPassword
return

::!KAD::
SendInput H:\USPTO\Karoline.Delaney.epf
gosub, GetPassword
return

::!KXA::
SendInput H:\USPTO\Kazuo.Aoki.epf
gosub, GetPassword
return

::!KZL::
SendInput H:\USPTO\Keith.Lim.epf
gosub, GetPassword
return

::!KNS::
SendInput H:\USPTO\Kent.Shum.epf
gosub, GetPassword
return

::!LDS::
SendInput H:\USPTO\Lance.Smemoe.epf
gosub, GetPassword
return

::!LXK::
SendInput H:\USPTO\Lauren.Keller.epf
gosub, GetPassword
return

::!LGR::
SendInput H:\USPTO\Lavanya.Rau.epf
gosub, GetPassword
return

::!LHL::
SendInput H:\USPTO\Linda.Liu.epf
gosub, GetPassword
return

::!LLX::
SendInput H:\USPTO\Linda.Xu.epf
gosub, GetPassword
return

::!LLY::
SendInput H:\USPTO\Lori.Yamato.epf
gosub, GetPassword
return

::!MRB::
SendInput H:\USPTO\Mark Benedict.epf
gosub, GetPassword
return

::!MJG::
SendInput H:\USPTO\Mark Gallagher.epf
gosub, GetPassword
return

::!MED::
SendInput H:\USPTO\Mark.Davis.epf
gosub, GetPassword
return

::!MRZ::
SendInput H:\USPTO\Marko.Zoretic.epf
gosub, GetPassword
return

::!MPB::
SendInput H:\USPTO\Michael.Burns.epf
gosub, GetPassword
return

::!MRC::
SendInput H:\USPTO\Michael.Christensen.epf
gosub, GetPassword
return

::!MAG::
SendInput H:\USPTO\Michael.Guiliana.epf
gosub, GetPassword
return

::!MCL::
SendInput H:\USPTO\Mike.Lee.epf
gosub, GetPassword
return

::!MCK::
SendInput H:\USPTO\Mincheol.Kim.epf
gosub, GetPassword
return

::!NMZ::
SendInput H:\USPTO\Nicholas.Zovko.epf
gosub, GetPassword
return

::!NXB::
SendInput H:\USPTO\Nira.Brand.epf
gosub, GetPassword
return

::!NAM::
SendInput H:\USPTO\Nora.Marachelian.epf
gosub, GetPassword
return

::!OAM::
SendInput H:\USPTO\Omar.AlMesned.epf
gosub, GetPassword
return

::!PNC::
SendInput H:\USPTO\Paul.Conover.epf
gosub, GetPassword
return

::!PDO::
SendInput H:\USPTO\Perry.Oldham.epf
gosub, GetPassword
return

::!PQT::
SendInput H:\USPTO\Peter.Tong.epf
gosub, GetPassword
return

::!PMN::
SendInput H:\USPTO\Philip.Nelson.epf
gosub, GetPassword
return

::!RNN::
SendInput H:\USPTO\Rabi.Narula.epf
gosub, GetPassword
return

::!RDS::
SendInput H:\USPTO\Raymond.Smith.epf
gosub, GetPassword
return

::!RJR::
SendInput H:\USPTO\Robb.Roby.epf
gosub, GetPassword
return

::!ROS::
SendInput H:\USPTO\Ron.Schoenbaum.epf
gosub, GetPassword
return

::!RMJ::
SendInput H:\USPTO\Russell.Jeide.epf
gosub, GetPassword
return

::!SHL::
SendInput H:\USPTO\Sabing.Lee.epf
gosub, GetPassword
return

::!SAM::
SendInput H:\USPTO\Salima Merani.epf
gosub, GetPassword
return

::!SZC::
SendInput H:\USPTO\Scott.Cromar.epf
gosub, GetPassword
return

::!SXR::
SendInput H:\USPTO\Scott.Raevsky.epf
gosub, GetPassword
return

::!SXA::
SendInput H:\USPTO\Sean.Ambrosius.epf
gosub, GetPassword
return

::!SXL::
SendInput H:\USPTO\Shannon.Lam.epf
gosub, GetPassword
return

::!SNS::
SendInput H:\USPTO\Sheila Swaroop.epf
gosub, GetPassword
return

::!SCJ::
SendInput H:\USPTO\Steve.Jensen.epf
gosub, GetPassword
return

::!SPR::
SendInput H:\USPTO\Steven Ruden.epf
gosub, GetPassword
return

::!SJN::
SendInput H:\USPTO\Steven.Nataupsky.epf
gosub, GetPassword
return

::!TXN::
SendInput H:\USPTO\Tak.Nishimura.epf
gosub, GetPassword
return

::!TMC::
SendInput H:\USPTO\Ted Cannon.epf
gosub, GetPassword
return

::!TKT::
SendInput H:\USPTO\Terry.Tullis.epf
gosub, GetPassword
return

::!TGP::
SendInput H:\USPTO\Theodore.Papagiannis.epf
gosub, GetPassword
return

::!TYY::
SendInput H:\USPTO\Thomas.Yee.epf
gosub, GetPassword
return

::!VZB::
SendInput H:\USPTO\Vikas.Bhargava.epf
gosub, GetPassword
return

::!VSL::
SendInput H:\USPTO\Vladimir.Lozan.epf
gosub, GetPassword
return

::!JYW::
SendInput H:\USPTO\YueJoyWang.epf
gosub, GetPassword
return

::!ZAG::
SendInput H:\USPTO\Zachary.Glantz.epf
gosub, GetPassword
return

::!ABP::
SendInput S:\USPTO\Adam.Powell.epf
gosub, GetPassword
return

::!AEM::
SendInput S:\USPTO\Andrew.Morrell.epf
gosub, GetPassword
return

::!BBA::
SendInput S:\USPTO\Ben.Anger.epf
gosub, GetPassword
return

::!BSG::
SendInput S:\USPTO\Brenden.Gingrich.epf
gosub, GetPassword
return

::!PCS::
SendInput S:\USPTO\Chris Steinhardt.epf
gosub, GetPassword
return

::!CMD::
SendInput S:\USPTO\Chris.DiLeo.epf
gosub, GetPassword
return

::!CLS::
SendInput S:\USPTO\Claine.Snow.epf
gosub, GetPassword
return

::!DOH::
SendInput S:\USPTO\Dan.Hart.epf
gosub, GetPassword
return

::!DKY::
SendInput S:\USPTO\Dan.Yarbrough.epf
gosub, GetPassword
return

::!DPH::
SendInput S:\USPTO\Daniel Hughes.epf
gosub, GetPassword
return

::!DAK::
SendInput S:\USPTO\Daniel.Kamkar.epf
gosub, GetPassword
return

::!DZD::
SendInput S:\USPTO\David.Dang.epf
gosub, GetPassword
return

::!DPK::
SendInput S:\USPTO\David.Kujawa.epf
gosub, GetPassword
return

::!DCD::
SendInput S:\USPTO\Derek.Dailey.epf
gosub, GetPassword
return

::!DSH::
SendInput S:\USPTO\Drew.Hamilton.epf
gosub, GetPassword
return

::!EMN::
SendInput S:\USPTO\Eric Nelson.epf
gosub, GetPassword
return

::!ESF::
SendInput S:\USPTO\Eric.Furman.epf
gosub, GetPassword
return

::!FTH::
SendInput S:\USPTO\Fred.Hale.epf
gosub, GetPassword
return

::!FAN::
SendInput S:\USPTO\Fred.Nicholson.epf
gosub, GetPassword
return

::!GAH::
SendInput S:\USPTO\Greg.Hermanson.epf
gosub, GetPassword
return

::!GXM::
SendInput S:\USPTO\Greg.Munchinsky.epf
gosub, GetPassword
return

::!HZC::
SendInput S:\USPTO\Heungsoo.Choi.epf
gosub, GetPassword
return

::!IWG::
SendInput S:\USPTO\Ian Gillies.epf
gosub, GetPassword
return

::!JFH::
SendInput S:\USPTO\James.Herkenhoff.epf
gosub, GetPassword
return

::!JQD::
SendInput S:\USPTO\Jane.Dai.epf
gosub, GetPassword
return

::!JQX::
SendInput S:\USPTO\Jane.Xia.epf
gosub, GetPassword
return

::!JJJ::
SendInput S:\USPTO\Jason Jardine.epf
gosub, GetPassword
return

::!JZL::
SendInput S:\USPTO\Jing.Liu.epf
gosub, GetPassword
return

::!JMC::
SendInput S:\USPTO\John Carson.epf
gosub, GetPassword
return

::!JEG::
SendInput S:\USPTO\Jordan.Gottdank.epf
gosub, GetPassword
return

::!JMR::
SendInput S:\USPTO\Joseph Reisman.epf
gosub, GetPassword
return

::!JOM::
SendInput S:\USPTO\Joseph.Mallon.epf
gosub, GetPassword
return

::!KST::
SendInput S:\USPTO\Kerry.Taylor.epf
gosub, GetPassword
return

::!KJM::
SendInput S:\USPTO\Kimberly Miller.epf
gosub, GetPassword
return

::!KXW::
SendInput S:\USPTO\Kun.Wang.epf
gosub, GetPassword
return

::!LMF::
SendInput S:\USPTO\Larry.Firestone.epf
gosub, GetPassword
return

::!LEN::
SendInput S:\USPTO\Lauren.Hockett.epf
gosub, GetPassword
return

::!MVS::
SendInput S:\USPTO\Maria.Stout.epf
gosub, GetPassword
return

::!MMA::
SendInput S:\USPTO\Mark.Abumeri.epf
gosub, GetPassword
return

::!MWC::
SendInput S:\USPTO\Mark.Catanese.epf
gosub, GetPassword
return

::!MDM::
SendInput S:\USPTO\Mark.Marsden.epf
gosub, GetPassword
return

::!MLF::
SendInput S:\USPTO\Michael.Fuller.epf
gosub, GetPassword
return

::!NRL::
SendInput S:\USPTO\Nate.Luman.epf
gosub, GetPassword
return

::!NAI::
SendInput S:\USPTO\Ned.Israelsen.epf
gosub, GetPassword
return

::!NSB::
SendInput S:\USPTO\Neil.Bartfeld.epf
gosub, GetPassword
return

::!PYC::
SendInput S:\USPTO\Paul.Chang.epf
gosub, GetPassword
return

::!PXL::
SendInput S:\USPTO\Peter.Law.epf
gosub, GetPassword
return

::!RJS::
SendInput S:\USPTO\Ray.Salenieks.epf
gosub, GetPassword
return

::!RJH::
SendInput S:\USPTO\Robert.Hilton.epf
gosub, GetPassword
return

::!RMT::
SendInput S:\USPTO\Rose.Thiessen.epf
gosub, GetPassword
return

::!REM::
SendInput S:\USPTO\Ryan Melnick.epf
gosub, GetPassword
return

::!SCY::
SendInput S:\USPTO\Samantha.Markley.epf
gosub, GetPassword
return

::!TRA::
SendInput S:\USPTO\Tom.Arno.epf
gosub, GetPassword
return

::!TSC::
SendInput S:\USPTO\Tom.Cowan.epf
gosub, GetPassword
return

::!TJH::
SendInput S:\USPTO\Travis.Hill.epf
gosub, GetPassword
return

::!VCV::
SendInput S:\USPTO\Victor.Vassar.epf
gosub, GetPassword
return

::!VKG::
SendInput S:\USPTO\Vijay.Gore.epf
gosub, GetPassword
return

::!DNW::
SendInput L:\USPTO\David.Weiss.epf
gosub, GetPassword
return

::!MDK::
SendInput L:\USPTO\Mark.Kachner.epf
gosub, GetPassword
return

::!MSO::
SendInput L:\USPTO\Mike.Okamoto.epf
gosub, GetPassword
return

::!AXD::
SendInput W:\USPTO\Aaron.Davis.epf
gosub, GetPassword
return

::!ASA::
SendInput W:\USPTO\Adeel.Akhtar.epf
gosub, GetPassword
return

::!ANM::
SendInput W:\USPTO\Andrew.Merickel.epf
gosub, GetPassword
return

::!BMG::
SendInput W:\USPTO\Brian Graham.epf
gosub, GetPassword
return

::!DRT::
SendInput W:\USPTO\David.Trossen.epf
gosub, GetPassword
return


::!ELF::
SendInput W:\USPTO\Eric.Fong.epf
gosub, GetPassword
return

::!KZM::
SendInput W:\USPTO\Kyu.Min.epf
gosub, GetPassword
return

::!PSS::
SendInput W:\USPTO\Paul.Stellman.epf
gosub, GetPassword
return

::!VXL::
SendInput W:\USPTO\V.Lakshmananepf.epf
gosub, GetPassword
return

::!ZYW::
SendInput W:\USPTO\Zi Wong.epf
gosub, GetPassword
return

::!DJG::
SendInput U:\USPTO\David.Grant.epf
gosub, GetPassword
return

::!JUB::
SendInput U:\USPTO\Julie.Burke.epf
gosub, GetPassword
return

::!MUM::
SendInput U:\USPTO\Mark.Metzke.epf
gosub, GetPassword
return

::!AVB::
SendInput V:\USPTO\Adam.Burks.epf
gosub, GetPassword
return

::!AFQ::
SendInput V:\USPTO\Andrew.Quecan.epf
gosub, GetPassword
return

::!BPJ::
SendInput V:\USPTO\Benjamin.Johnson.epf
gosub, GetPassword
return

::!BGM::
SendInput V:\USPTO\Bryan McWhorter.epf
gosub, GetPassword
return

::!CTS::
SendInput V:\USPTO\Christopher Sweeney.epf
gosub, GetPassword
return

::!CBH::
SendInput V:\USPTO\Colin Heideman.epf
gosub, GetPassword
return

::!MCA::
SendInput V:\USPTO\Maria Anderson.epf
gosub, GetPassword
return

::!MAU::
SendInput V:\USPTO\Mauricio Uribe.epf
gosub, GetPassword
return

::!MJS::
SendInput V:\USPTO\Melanie Seelig.epf
gosub, GetPassword
return

::!SWF::
SendInput V:\USPTO\Scott.Forbes.epf
gosub, GetPassword
return

::!YXL::
SendInput V:\USPTO\Yiheng.Li.epf
gosub, GetPassword
return

::!ADM::
SendInput Q:\USPTO\Alejandro.Munoz.epf
gosub, GetPassword
return

::!AVS::
SendInput Q:\USPTO\Andrew.Schwaab.epf
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
Sleep 200
gosub, GetPassword
return

EAL2:
Gui, Submit
Sleep 200
SendInput W:\USPTO\EliLoots.epf
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
Sleep 200
gosub, GetPassword
return

EYZ2:
Gui, Submit
Sleep 200
SendInput H:\USPTO\Eric.Zhou.epf
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
Sleep 200
gosub, GetPassword
return

GRM2:
Gui, Submit
Sleep 200
SendInput W:\USPTO\Grant.McAdams.epf
Sleep 200
gosub, GetPassword
return

GRM3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

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
Sleep 200
gosub, GetPassword
return

LSE2:
Gui, Submit
Sleep 200
SendInput U:\USPTO\Lincoln.Essig.epf
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
Sleep 200
gosub, GetPassword
return

MHT2:
Gui, Submit
Sleep 200
SendInput Q:\USPTO\Michael.Trenholm.epf
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
Sleep 200
gosub, GetPassword
return

MZC2:
Gui, Submit
Sleep 200
SendInput S:\USPTO\Morgan.Coates.epf
Sleep 200
gosub, GetPassword
return

MZC3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

::!SGS::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gSGS1, SF - W:\USPTO
Gui, Add, Button, x112  y25 gSGS2, SD - S:\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gSGS3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

SGS1:
Gui, Submit
Sleep 200
SendInput W:\USPTO\Scott.Siera.epf
Sleep 200
gosub, GetPassword
return

SGS2:
Gui, Submit
Sleep 200
SendInput S:\USPTO\Scott.Siera.epf
Sleep 200
gosub, GetPassword
return

SGS3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}

::!VXT::
{
CoordMode, Mouse, Screen       ; Place mouse coordinates at absolute screen coordinates (multiple monitor)
MouseGetPos, xpos, ypos 
NewXPos := xpos - 108
NewYPos := ypos - 60
SendInput ^a
SendInput {DELETE}
Gui, New, +Owner +AlwaysOnTop,Choose Certificate Location
Gui, Add, Text, , Which is the correct certificate location?
Gui, Add, Button, x10 y25 gVXT1, OC - H:\USPTO
Gui, Add, Button, x112  y25 gVXT2, SEA - V:\USPTO
Gui, Add, Text, x20, Do you need to map a Branch drive?
Gui, Add, Button, x55 gVXT3, Click here to MapIt!
SendInput ^a
SendInput {Delete}
Sleep 200
Gui, Show, x%NewXPos% y%NewYPos% , 
return

VXT1:
Gui, Submit
Sleep 200
SendInput H:\USPTO\Vlad.Teplitskiy.epf
Sleep 200
gosub, GetPassword
return

VXT2:
Gui, Submit
Sleep 200
SendInput V:\USPTO\Vlad.Teplitskiy.epf
Sleep 200
gosub, GetPassword
return

VXT3:
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
Sleep 200
gosub, GetPassword
return

JLP2:
Gui, Submit
Sleep 200
SendInput H:\USPTO\John.Paik.epf
Sleep 200
gosub, GetPassword
return

JLP3:
Run \\docs-oc\applications\MapIt\MapIt.Client.application
return
}



