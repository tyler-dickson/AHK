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
FileAppend,`n::`!%InitialsGood2%`:`:`nSendInput %InitialsGood1%`nGetPassword()`nreturn`n, C:\Users\%A_Username%\Desktop\EFS.ahk
Sleep 100
IniWrite, %InitialsGood2%, C:\Users\%A_Username%\Desktop\Initials.ini, Initials, %InitialsGood1%
;MsgBox, %InitialsGood2% %InitialsGood1%
;MsgBox, `n::`!%InitialsGood2%::`nSendInput %InitialsGood1%`nGetPassword()`nreturn`n
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

GetPassword()
{
OldClipboard = %Clipboard%
Send ^a
Sleep 100
Send ^c
Sleep 200
IniRead, Password, C:\Users\%A_Username%\Desktop\EFS.ini, EFS, %Clipboard%
Sleep 200
MsgBox, %Password%
Send {Tab}
Sleep 250
Send {Tab}
Sleep 200
Send %Password%
Sleep 200
Clipboard = %OldClipboard%
return
}	

^1::
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

::!dea::
SendInput H:\USPTO\Dan.Altman.epf
GetPassword()
return

::!AJG::
SendInput H:\USPTO\Adam.Gilbert.epf
GetPassword()
return

::!AXJ::
SendInput H:\USPTO\Agnes.Juang.epf
GetPassword()
return

::!AJS::
SendInput H:\USPTO\Albert.Sueiras.epf
GetPassword()
return

::!AJM::
SendInput H:\USPTO\Alex.Martinez.epf
GetPassword()
return

::!AZ4::
SendInput H:\USPTO\Allison.Weimer.epf
GetPassword()
return

::!AGB::
SendInput H:\USPTO\Allyson.Brown.epf
GetPassword()
return

::!ACC::
SendInput H:\USPTO\Amy.Chun.epf
GetPassword()
return

::!AMD::
SendInput H:\USPTO\Andrew.Douglas.epf
GetPassword()
return

::!AIK::
SendInput H:\USPTO\Andrew.Kimmel.epf
GetPassword()
return

::!AWL::
SendInput H:\USPTO\Andrew.Lloyd.epf
GetPassword()
return

::!AVS::
SendInput H:\USPTO\Andrew.Schwaab.epf
GetPassword()
return

::!AHS::
SendInput H:\USPTO\Andrew.Simpson.epf
GetPassword()
return

::!ASR::
SendInput H:\USPTO\Art Rose.epf
GetPassword()
return

::!BJE::
SendInput H:\USPTO\Ben.Everton.epf
GetPassword()
return

::!BAK::
SendInput H:\USPTO\Benajmain.Katzenellenbogen.epf
GetPassword()
return

::!WBB::
SendInput H:\USPTO\Bill.Bunker.epf
GetPassword()
return

::!WHS::
SendInput H:\USPTO\Bill.Shreve.epf
GetPassword()
return

::!BRB::
SendInput H:\USPTO\Brent Babcock.epf
GetPassword()
return

::!BMD::
SendInput H:\USPTO\Brent Dougal.epf
GetPassword()
return

::!BCC::
SendInput H:\USPTO\Brian Claassen.epf
GetPassword()
return

::!BZS::
SendInput H:\USPTO\Bridget Smith.epf
GetPassword()
return

::!BSI::
SendInput H:\USPTO\Bruce.Itchkawitz.epf
GetPassword()
return

::!BWW::
SendInput H:\USPTO\Bryan.Wahl.epf
GetPassword()
return

::!CKL::
SendInput H:\USPTO\Catherine.Lee.epf
GetPassword()
return

::!CYL::
SendInput H:\USPTO\Chang.Lim.epf
GetPassword()
return

::!CSC::
SendInput H:\USPTO\Che.Chereskin.epf
GetPassword()
return

::!CXR::
SendInput H:\USPTO\Christopher Ross.epf
GetPassword()
return

::!CSS::
SendInput H:\USPTO\Craig.Summers.epf
GetPassword()
return

::!CRH::
SendInput H:\USPTO\Curtis.Huffmire.epf
GetPassword()
return

::!CCD::
SendInput H:\USPTO\Curtiss.Dosier.epf
GetPassword()
return

::!DJH::
SendInput H:\USPTO\Damien.Howard.epf
GetPassword()
return

::!DEA::
SendInput H:\USPTO\Dan.Altman.epf
GetPassword()
return

::!DJF::
SendInput H:\USPTO\Dan.Fischer.epf
GetPassword()
return

::!DVG::
SendInput H:\USPTO\Daniel.Gibson.epf
GetPassword()
return

::!DLO::
SendInput H:\USPTO\Darrell.Olson.epf
GetPassword()
return

::!DSB::
SendInput H:\USPTO\David.Barnhill.epf
GetPassword()
return

::!DMD::
SendInput H:\USPTO\David.Dremann.epf
GetPassword()
return

::!DGK::
SendInput H:\USPTO\David.G.Kim.epf
GetPassword()
return

::!DGJ::
SendInput H:\USPTO\David.Jankowski.epf
GetPassword()
return

::!DRS::
SendInput H:\USPTO\David.Schmidt.epf
GetPassword()
return

::!DVK::
SendInput H:\USPTO\David.T.Kim.epf
GetPassword()
return

::!DRB::
SendInput H:\USPTO\Derek.Bayles.epf
GetPassword()
return

::!DXD::
SendInput H:\USPTO\Devanie.Dufour.epf
GetPassword()
return

::!DGM::
SendInput H:\USPTO\Doug.Muehlhauser.epf
GetPassword()
return

::!DXW::
SendInput H:\USPTO\Douglas.Wentzel.epf
GetPassword()
return

::!EAS::
SendInput H:\USPTO\Ed.Schlatter.epf
GetPassword()
return

::!EYZ::
SendInput H:\USPTO\Eric.Zhou.epf
GetPassword()
return

::!GVH::
SendInput H:\USPTO\Gerard.vonHoffmann.epf
GetPassword()
return

::!GLN::
SendInput H:\USPTO\Glen.Nuttall.epf
GetPassword()
return

::!GRM::
SendInput H:\USPTO\Grant.McAdams.epf
GetPassword()
return

::!HXM::
SendInput H:\USPTO\Hans.Mayer.epf
GetPassword()
return

::!HZS::
SendInput H:\USPTO\Harnik.Shukla.epf
GetPassword()
return

::!HCS::
SendInput H:\USPTO\Hochan.Song.epf
GetPassword()
return

::!IAL::
SendInput H:\USPTO\Irfan.Lateef.epf
GetPassword()
return

::!JUP::
SendInput H:\USPTO\Jacob.Peterson.epf
GetPassword()
return

::!JCB::
SendInput H:\USPTO\Jared.Bunker.epf
GetPassword()
return

::!JZK::
SendInput H:\USPTO\Jarom.Kesler.epf
GetPassword()
return

::!JAG::
SendInput H:\USPTO\Jason.Gersting.epf
GetPassword()
return

::!JCS::
SendInput H:\USPTO\Jason.Swartz.epf
GetPassword()
return

::!JUH::
SendInput H:\USPTO\Jeffery.Hallstrom.epf
GetPassword()
return

::!JYC::
SendInput H:\USPTO\Joan.Chan.epf
GetPassword()
return

::!HSU::
SendInput H:\USPTO\Johannes.Hsu.epf
GetPassword()
return

::!JRK::
SendInput H:\USPTO\John King.epf
GetPassword()
return

::!JMG::
SendInput H:\USPTO\John.Grover.epf
GetPassword()
return

::!JHS::
SendInput H:\USPTO\John.Sadlik.epf
GetPassword()
return

::!JBS::
SendInput H:\USPTO\John.Sganga.epf
GetPassword()
return

::!JWG::
SendInput H:\USPTO\Jon Gurka.epf
GetPassword()
return

::!JUC::
SendInput H:\USPTO\Jordan.Cox.epf
GetPassword()
return

::!JYS::
SendInput H:\USPTO\Joshua Stowell.epf
GetPassword()
return

::!JDB::
SendInput H:\USPTO\Joshua.Berk.epf
GetPassword()
return

::!JXV::
SendInput H:\USPTO\Josue.Villalta.epf
GetPassword()
return

::!JJG::
SendInput H:\USPTO\Justin.Gillett.epf
GetPassword()
return

::!KJL::
SendInput H:\USPTO\Karen.Lenker.epf
GetPassword()
return

::!KAD::
SendInput H:\USPTO\Karoline.Delaney.epf
GetPassword()
return

::!KXA::
SendInput H:\USPTO\Kazuo.Aoki.epf
GetPassword()
return

::!KZL::
SendInput H:\USPTO\Keith.Lim.epf
GetPassword()
return

::!KNS::
SendInput H:\USPTO\Kent.Shum.epf
GetPassword()
return

::!LDS::
SendInput H:\USPTO\Lance.Smemoe.epf
GetPassword()
return

::!LXK::
SendInput H:\USPTO\Lauren.Keller.epf
GetPassword()
return

::!LGR::
SendInput H:\USPTO\Lavanya.Rau.epf
GetPassword()
return

::!LSE::
SendInput H:\USPTO\Lincoln.Essig.epf
GetPassword()
return

::!LHL::
SendInput H:\USPTO\Linda.Liu.epf
GetPassword()
return

::!LLX::
SendInput H:\USPTO\Linda.Xu.epf
GetPassword()
return

::!LLY::
SendInput H:\USPTO\Lori.Yamato.epf
GetPassword()
return

::!MRB::
SendInput H:\USPTO\Mark Benedict.epf
GetPassword()
return

::!MJG::
SendInput H:\USPTO\Mark Gallagher.epf
GetPassword()
return

::!MED::
SendInput H:\USPTO\Mark.Davis.epf
GetPassword()
return

::!MRZ::
SendInput H:\USPTO\Marko.Zoretic.epf
GetPassword()
return

::!MPB::
SendInput H:\USPTO\Michael.Burns.epf
GetPassword()
return

::!MRC::
SendInput H:\USPTO\Michael.Christensen.epf
GetPassword()
return

::!MAG::
SendInput H:\USPTO\Michael.Guiliana.epf
GetPassword()
return

::!MHT::
SendInput H:\USPTO\Michael.Trenholm.epf
GetPassword()
return

::!MCL::
SendInput H:\USPTO\Mike.Lee.epf
GetPassword()
return

::!MCK::
SendInput H:\USPTO\Mincheol.Kim.epf
GetPassword()
return

::!MZC::
SendInput H:\USPTO\Morgan.Coates.epf
GetPassword()
return

::!NMZ::
SendInput H:\USPTO\Nicholas.Zovko.epf
GetPassword()
return

::!NXB::
SendInput H:\USPTO\Nira.Brand.epf
GetPassword()
return

::!NAM::
SendInput H:\USPTO\Nora.Marachelian.epf
GetPassword()
return

::!OAM::
SendInput H:\USPTO\Omar.AlMesned.epf
GetPassword()
return

::!PNC::
SendInput H:\USPTO\Paul.Conover.epf
GetPassword()
return

::!PDO::
SendInput H:\USPTO\Perry.Oldham.epf
GetPassword()
return

::!PQT::
SendInput H:\USPTO\Peter.Tong.epf
GetPassword()
return

::!PMN::
SendInput H:\USPTO\Philip.Nelson.epf
GetPassword()
return

::!RNN::
SendInput H:\USPTO\Rabi.Narula.epf
GetPassword()
return

::!RDS::
SendInput H:\USPTO\Raymond.Smith.epf
GetPassword()
return

::!RJR::
SendInput H:\USPTO\Robb.Roby.epf
GetPassword()
return

::!ROS::
SendInput H:\USPTO\Ron.Schoenbaum.epf
GetPassword()
return

::!RMJ::
SendInput H:\USPTO\Russell.Jeide.epf
GetPassword()
return

::!SHL::
SendInput H:\USPTO\Sabing.Lee.epf
GetPassword()
return

::!SAM::
SendInput H:\USPTO\Salima Merani.epf
GetPassword()
return

::!SZC::
SendInput H:\USPTO\Scott.Cromar.epf
GetPassword()
return

::!SXR::
SendInput H:\USPTO\Scott.Raevsky.epf
GetPassword()
return

::!SXA::
SendInput H:\USPTO\Sean.Ambrosius.epf
GetPassword()
return

::!SXL::
SendInput H:\USPTO\Shannon.Lam.epf
GetPassword()
return

::!SNS::
SendInput H:\USPTO\Sheila Swaroop.epf
GetPassword()
return

::!SCJ::
SendInput H:\USPTO\Steve.Jensen.epf
GetPassword()
return

::!SPR::
SendInput H:\USPTO\Steven Ruden.epf
GetPassword()
return

::!SJN::
SendInput H:\USPTO\Steven.Nataupsky.epf
GetPassword()
return

::!TXN::
SendInput H:\USPTO\Tak.Nishimura.epf
GetPassword()
return

::!TMC::
SendInput H:\USPTO\Ted Cannon.epf
GetPassword()
return

::!TKT::
SendInput H:\USPTO\Terry.Tullis.epf
GetPassword()
return

::!TGP::
SendInput H:\USPTO\Theodore.Papagiannis.epf
GetPassword()
return

::!TYY::
SendInput H:\USPTO\Thomas.Yee.epf
GetPassword()
return

::!VZB::
SendInput H:\USPTO\Vikas.Bhargava.epf
GetPassword()
return

::!VXT::
SendInput H:\USPTO\Vlad.Teplitskiy.epf
GetPassword()
return

::!VSL::
SendInput H:\USPTO\Vladimir.Lozan.epf
GetPassword()
return

::!JYW::
SendInput H:\USPTO\YueJoyWang.epf
GetPassword()
return

::!ZAG::
SendInput H:\USPTO\Zachary.Glantz.epf
GetPassword()
return

::!ABP::
SendInput S:\USPTO\Adam.Powell.epf
GetPassword()
return

::!AEM::
SendInput S:\USPTO\Andrew.Morrell.epf
GetPassword()
return

::!BBA::
SendInput S:\USPTO\Ben.Anger.epf
GetPassword()
return

::!BSG::
SendInput S:\USPTO\Brenden.Gingrich.epf
GetPassword()
return

::!PCS::
SendInput S:\USPTO\Chris Steinhardt.epf
GetPassword()
return

::!CMD::
SendInput S:\USPTO\Chris.DiLeo.epf
GetPassword()
return

::!CLS::
SendInput S:\USPTO\Claine.Snow.epf
GetPassword()
return

::!DOH::
SendInput S:\USPTO\Dan.Hart.epf
GetPassword()
return

::!DKY::
SendInput S:\USPTO\Dan.Yarbrough.epf
GetPassword()
return

::!DPH::
SendInput S:\USPTO\Daniel Hughes.epf
GetPassword()
return

::!DAK::
SendInput S:\USPTO\Daniel.Kamkar.epf
GetPassword()
return

::!DZD::
SendInput S:\USPTO\David.Dang.epf
GetPassword()
return

::!DPK::
SendInput S:\USPTO\David.Kujawa.epf
GetPassword()
return

::!DCD::
SendInput S:\USPTO\Derek.Dailey.epf
GetPassword()
return

::!DSH::
SendInput S:\USPTO\Drew.Hamilton.epf
GetPassword()
return

::!EAL::
SendInput S:\USPTO\EliLoots.epf
GetPassword()
return

::!EMN::
SendInput S:\USPTO\Eric Nelson.epf
GetPassword()
return

::!ESF::
SendInput S:\USPTO\Eric.Furman.epf
GetPassword()
return

::!FTH::
SendInput S:\USPTO\Fred.Hale.epf
GetPassword()
return

::!FAN::
SendInput S:\USPTO\Fred.Nicholson.epf
GetPassword()
return

::!GAH::
SendInput S:\USPTO\Greg.Hermanson.epf
GetPassword()
return

::!GXM::
SendInput S:\USPTO\Greg.Munchinsky.epf
GetPassword()
return

::!HZC::
SendInput S:\USPTO\Heungsoo.Choi.epf
GetPassword()
return

::!IWG::
SendInput S:\USPTO\Ian Gillies.epf
GetPassword()
return

::!JFH::
SendInput S:\USPTO\James.Herkenhoff.epf
GetPassword()
return

::!JQD::
SendInput S:\USPTO\Jane.Dai.epf
GetPassword()
return

::!JQX::
SendInput S:\USPTO\Jane.Xia.epf
GetPassword()
return

::!JJJ::
SendInput S:\USPTO\Jason Jardine.epf
GetPassword()
return

::!JZL::
SendInput S:\USPTO\Jing.Liu.epf
GetPassword()
return

::!JMC::
SendInput S:\USPTO\John Carson.epf
GetPassword()
return

::!JLP::
SendInput S:\USPTO\John.Paik.epf
GetPassword()
return

::!JEG::
SendInput S:\USPTO\Jordan.Gottdank.epf
GetPassword()
return

::!JMR::
SendInput S:\USPTO\Joseph Reisman.epf
GetPassword()
return

::!JOM::
SendInput S:\USPTO\Joseph.Mallon.epf
GetPassword()
return

::!KST::
SendInput S:\USPTO\Kerry.Taylor.epf
GetPassword()
return

::!KJM::
SendInput S:\USPTO\Kimberly Miller.epf
GetPassword()
return

::!KXW::
SendInput S:\USPTO\Kun.Wang.epf
GetPassword()
return

::!LMF::
SendInput S:\USPTO\Larry.Firestone.epf
GetPassword()
return

::!LEN::
SendInput S:\USPTO\Lauren.Hockett.epf
GetPassword()
return

::!MVS::
SendInput S:\USPTO\Maria.Stout.epf
GetPassword()
return

::!MMA::
SendInput S:\USPTO\Mark.Abumeri.epf
GetPassword()
return

::!MWC::
SendInput S:\USPTO\Mark.Catanese.epf
GetPassword()
return

::!MDM::
SendInput S:\USPTO\Mark.Marsden.epf
GetPassword()
return

::!MLF::
SendInput S:\USPTO\Michael.Fuller.epf
GetPassword()
return

::!MZC::
SendInput S:\USPTO\Morgan.Coates.epf
GetPassword()
return

::!NRL::
SendInput S:\USPTO\Nate.Luman.epf
GetPassword()
return

::!NAI::
SendInput S:\USPTO\Ned.Israelsen.epf
GetPassword()
return

::!NSB::
SendInput S:\USPTO\Neil.Bartfeld.epf
GetPassword()
return

::!PYC::
SendInput S:\USPTO\Paul.Chang.epf
GetPassword()
return

::!PXL::
SendInput S:\USPTO\Peter.Law.epf
GetPassword()
return

::!RJS::
SendInput S:\USPTO\Ray.Salenieks.epf
GetPassword()
return

::!RJH::
SendInput S:\USPTO\Robert.Hilton.epf
GetPassword()
return

::!RMT::
SendInput S:\USPTO\Rose.Thiessen.epf
GetPassword()
return

::!REM::
SendInput S:\USPTO\Ryan Melnick.epf
GetPassword()
return

::!SCY::
SendInput S:\USPTO\Samantha.Markley.epf
GetPassword()
return

::!SGS::
SendInput S:\USPTO\Scott.Siera.epf
GetPassword()
return

::!TRA::
SendInput S:\USPTO\Tom.Arno.epf
GetPassword()
return

::!TSC::
SendInput S:\USPTO\Tom.Cowan.epf
GetPassword()
return

::!TJH::
SendInput S:\USPTO\Travis.Hill.epf
GetPassword()
return

::!VCV::
SendInput S:\USPTO\Victor.Vassar.epf
GetPassword()
return

::!VKG::
SendInput S:\USPTO\Vijay.Gore.epf
GetPassword()
return

::!DNW::
SendInput L:\USPTO\David.Weiss.epf
GetPassword()
return

::!JXV::
SendInput L:\USPTO\Josue.Villalta.epf
GetPassword()
return

::!MDK::
SendInput L:\USPTO\Mark.Kachner.epf
GetPassword()
return

::!MSO::
SendInput L:\USPTO\Mike.Okamoto.epf
GetPassword()
return

::!AXD::
SendInput W:\USPTO\Aaron.Davis.epf
GetPassword()
return

::!ASA::
SendInput W:\USPTO\Adeel.Akhtar.epf
GetPassword()
return

::!ANM::
SendInput W:\USPTO\Andrew.Merickel.epf
GetPassword()
return

::!BMG::
SendInput W:\USPTO\Brian Graham.epf
GetPassword()
return

::!DRT::
SendInput W:\USPTO\David.Trossen.epf
GetPassword()
return

::!EAL::
SendInput W:\USPTO\EliLoots.epf
GetPassword()
return

::!ELF::
SendInput W:\USPTO\Eric.Fong.epf
GetPassword()
return

::!GRM::
SendInput W:\USPTO\Grant.McAdams.epf
GetPassword()
return

::!KZM::
SendInput W:\USPTO\Kyu.Min.epf
GetPassword()
return

::!PSS::
SendInput W:\USPTO\Paul.Stellman.epf
GetPassword()
return

::!SGS::
SendInput W:\USPTO\Scott.Siera.epf
GetPassword()
return

::!VXL::
SendInput W:\USPTO\V.Lakshmananepf.epf
GetPassword()
return

::!ZYW::
SendInput W:\USPTO\Zi Wong.epf
GetPassword()
return

::!DJG::
SendInput U:\USPTO\David.Grant.epf
GetPassword()
return

::!JUB::
SendInput U:\USPTO\Julie.Burke.epf
GetPassword()
return

::!LSE::
SendInput U:\USPTO\Lincoln.Essig.epf
GetPassword()
return

::!MUM::
SendInput U:\USPTO\Mark.Metzke.epf
GetPassword()
return

::!AVB::
SendInput V:\USPTO\Adam.Burks.epf
GetPassword()
return

::!AFQ::
SendInput V:\USPTO\Andrew.Quecan.epf
GetPassword()
return

::!BPJ::
SendInput V:\USPTO\Benjamin.Johnson.epf
GetPassword()
return

::!BGM::
SendInput V:\USPTO\Bryan McWhorter.epf
GetPassword()
return

::!CTS::
SendInput V:\USPTO\Christopher Sweeney.epf
GetPassword()
return

::!CBH::
SendInput V:\USPTO\Colin Heideman.epf
GetPassword()
return

::!MCA::
SendInput V:\USPTO\Maria Anderson.epf
GetPassword()
return

::!MAU::
SendInput V:\USPTO\Mauricio Uribe.epf
GetPassword()
return

::!MJS::
SendInput V:\USPTO\Melanie Seelig.epf
GetPassword()
return

::!SWF::
SendInput V:\USPTO\Scott.Forbes.epf
GetPassword()
return

::!VXT::
SendInput V:\USPTO\Vlad.Teplitskiy.epf
GetPassword()
return

::!YXL::
SendInput V:\USPTO\Yiheng.Li.epf
GetPassword()
return

::!ADM::
SendInput Q:\USPTO\Alejandro.Munoz.epf
GetPassword()
return

::!AVS::
SendInput Q:\USPTO\Andrew.Schwaab.epf
GetPassword()
return

::!EYZ::
SendInput Q:\USPTO\Eric.Zhou.epf
GetPassword()
return

::!MHT::
SendInput Q:\USPTO\Michael.Trenholm.epf
GetPassword()
return

