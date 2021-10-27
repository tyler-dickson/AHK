#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

;				              Control + J to run GrabPeeps subroutine.
User1  = adriana.perez
User2  = angel.zehnder      
User3  = anthony.pineda     
User4  = Arlene.Tjoarman    
User5  = Chelsea.Burdeno    
User6  = cher.lancaster     
User7  = Daniela.lopez      
User8  = eddie.monroy       
User9  = heather.obrien     
User10 = Heide.Young        
User11 = jason.finn         
User12 = lara.anabtawi      
User13 = Long.Dang          
User14 = Neysa.cabudol      ; or maybe Neysa.perkins
User15 = paul.traska    
User16 = ThuyQuyen.Nguyen   
User17 = tyler.dickson      
User18 = xiomara.raymundo   
User19 = kevin.kraus        
User20 = nick.lamb      
User21 = tamara.dumas
User22 = christina.graul
User23 = Danika.Gregory
User24 = Imran.Ahmed
User25 = anthony.bonilla
User26 = jennifer.neat
User27 = jessica.egigian
;User28 = 
;User29 = 
;User30 = 
;User31 = 
;User32 = 
;User33 = 
;User34 = 
;User35 = 
;User36 = 
;User37 = 
;User38 = 
;User39 = 
;User40 = 
;User41 = 
;User42 = 
;User43 = 
;User44 = 
;User45 = 
;User46 = 
;User47 = 
;User48 = 
;User49 = 
;User50 = 

;                   When adding a new user, uncomment the next one, 
;                   the corresponding gosub on Lines ~65, ~266, and ~392, 
;                   and the subroutine Line ~506.
TotalUsers = 27   ; Update this for Loops below.
;                   Uncomment the number of users in TotalUsers
Dropdown = %User1%|%User2%|%User3%|%User4%|%User5%|%User6%|%User7%|%User8%|%User9%|%User10%|%User11%|%User12%|%User13%|%User14%|%User15%|%User16%|%User17%|%User18%|%User19%|%User20%|%User21%|%User22%|%User23%|%User24%|%User25%|%User26%|%User27%| ;%User28%|%User29%|%User30%|%User31%|%User32%|%User33%|%User34%|%User35%|%User36%|%User37%|%User38%|%User39%|%User40%|%User41%|%User42%|%User43%|%User44%|%User45%|%User46%|%User47%|%User48%|%User49%|%User50%

;Gui, Submit, NoHide
;KeystrokesTotals    = 0
;DateShortcutTotals  = 0
;SysSwitchTotals     = 0
;ExcelHLinkTotals    = 0
;EFSCertFinderTotals = 0
;CopyActionTotals    = 0
;PasteActionTotals   = 0
;SuggestRemarksTotals= 0
;ClientCodeIETotals  = 0
;AttyFinderTotals    = 0
;CalExtendTotals     = 0
;EFSFillTotals       = 0
gosub UserData1
gosub UserData2
gosub UserData3
gosub UserData4
gosub UserData5
gosub UserData6
gosub UserData7
gosub UserData8
gosub UserData9
gosub UserData10
gosub UserData11
gosub UserData12
gosub UserData13
gosub UserData14
gosub UserData15
gosub UserData16
gosub UserData17
gosub UserData18
gosub UserData19
gosub UserData20
gosub UserData21
gosub UserData22
gosub UserData23
gosub UserData24
gosub UserData25
gosub UserData26
gosub UserData27
;gosub UserData28
;gosub UserData29
;gosub UserData30
;gosub UserData31
;gosub UserData32
;gosub UserData33
;gosub UserData34
;gosub UserData35
;gosub UserData36
;gosub UserData37
;gosub UserData38
;gosub UserData39
;gosub UserData40
;gosub UserData41
;gosub UserData42
;gosub UserData43
;gosub UserData44
;gosub UserData45
;gosub UserData46
;gosub UserData47
;gosub UserData48
;gosub UserData49
;gosub UserData50

Loop, %TotalUsers%
{
KeystrokesTotals+=Keystrokes%A_Index%
DateShortcutTotals+=DateShortcut%A_Index%
AttyFinderTotals+=AttyFinder%A_Index%
CalExtendTotals+=CalExtend%A_Index%
SysSwitchTotals+=SysSwitch%A_Index%
ExcelHLinkTotals+=ExcelHLink%A_Index%
EFSCertFinderTotals+=EFSCertFinder%A_Index%
CopyActionTotals+=CopyAction%A_Index%
PasteActionTotals+=PasteAction%A_Index%
SuggestRemarksTotals+=SuggestRemarks%A_Index%
ClientCodeIETotals+=ClientCodeIE%A_Index%
EFSFillTotals+=EFSFill%A_Index%
}

IniWrite, %KeystrokesTotals%,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupKeystrokes
IniWrite, %DateShortcutTotals%,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupDateShortcut
IniWrite, %AttyFinderTotals%,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAttyFinder
IniWrite, %CalExtendTotals%,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCalExtend
IniWrite, %SysSwitchTotals%,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSysSwitch
IniWrite, %ExcelHLinkTotals%,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupExcelHLink
IniWrite, %EFSCertFinderTotals%,   C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSCertFinder
IniWrite, %CopyActionTotals%,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCopyAction
IniWrite, %PasteActionTotals%,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupPasteAction
IniWrite, %SuggestRemarksTotals%,  C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSuggestRemarks
IniWrite, %ClientCodeIETotals%,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupClientCodeIE
IniWrite, %EFSFillTotals%,         C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSFill
Sleep 1000
IniRead, GroupKeystrokesTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupKeystrokes
IniRead, GroupDateShortcutTotals,  C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupDateShortcut
IniRead, GroupAttyFinderTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAttyFinder
IniRead, GroupCalExtendTotals,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCalExtend
IniRead, GroupSysSwitchTotals,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSysSwitch
IniRead, GroupExcelHLinkTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupExcelHLink
IniRead, GroupEFSCertFinderTotals, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSCertFinder
IniRead, GroupCopyActionTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCopyAction
IniRead, GroupPasteActionTotals,   C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupPasteAction
IniRead, GroupSuggestRemarksTotals,C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSuggestRemarks
IniRead, GroupClientCodeIETotals,  C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupClientCodeIE
IniRead, GroupEFSFillTotals,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSFill

Gui, New, +Owner +AlwaysOnTop, Analytics
Gui, Add, Tab3, w200 h350 +Center, `Group Analytics` |` Individual Analytics` ;
Gui, Add, Button, x12  y29 w45 gCancel , Exit
Gui, Add, Button, x61  y29 w45 gData   , Data
Gui, Add, Button, x111 y29 w45 gArchive, Archive
Gui, Add, Button, x160 y29 w45 gRefresh, Refresh
Gui, Add, Button, w130 x12 y53, Total Keystrokes
Gui, Add, Edit,   ReadOnly +Center w60 x144 y54,  %GroupKeystrokesTotals%
Gui, Add, Button, w130 x12 y78, Total DateShortcut
Gui, Add, Edit,   ReadOnly +Center w60 x144 y79,  %GroupDateShortcutTotals%
Gui, Add, Button, w130 x12 y103, Total SysSwitch
Gui, Add, Edit,   ReadOnly +Center w60 x144 y104, %GroupSysSwitchTotals%
Gui, Add, Button, w130 x12 y128, Total ExcelHLink
Gui, Add, Edit,   ReadOnly +Center w60 x144 y129, %GroupExcelHLinkTotals%
Gui, Add, Button, w130 x12 y153, Total CalExtend
Gui, Add, Edit,   ReadOnly +Center w60 x144 y154, %GroupCalExtendTotals%
Gui, Add, Button, w130 x12 y178, Total CopyAction
Gui, Add, Edit,   ReadOnly +Center w60 x144 y179, %GroupCopyActionTotals%
Gui, Add, Button, w130 x12 y203, Total PasteAction
Gui, Add, Edit,   ReadOnly +Center w60 x144 y204, %GroupPasteActionTotals%
Gui, Add, Button, w130 x12 y228, Total SuggestRemarks
Gui, Add, Edit,   ReadOnly +Center w60 x144 y229, %GroupSuggestRemarksTotals%
Gui, Add, Button, w130 x12 y253, Total ClientCodeIE
Gui, Add, Edit,   ReadOnly +Center w60 x144 y254, %GroupClientCodeIETotals%
Gui, Add, Button, w130 x12 y278, Total AttyFinder
Gui, Add, Edit,   ReadOnly +Center w60 x144 y279, %GroupAttyFinderTotals%
Gui, Add, Button, w130 x12 y303, Total EFSCertFinder
Gui, Add, Edit,   ReadOnly +Center w60 x144 y304, %GroupEFSCertFinderTotals%
Gui, Add, Button, w130 x12 y328, Total EFSFill
Gui, Add, Edit,   ReadOnly +Center w60 x144 y329, %GroupEFSFillTotals%
Gui, Tab, 2
Gui, Add, DropDownList, gIndivStats AltSubmit Center x13 y29 w128 vIndivStats, %Dropdown%  ; See Line 61 for details.
Gui, Add, Button, x160 y29 w45 gRefresh2, Refresh
Gui, Add, Button, w130 x12 y53, Keystrokes
Gui, Add, Edit,   ReadOnly +Center w60 x144 y54 , % Keystrokes%IndivStats%
Gui, Add, Button, w130 x12 y78, DateShortcut
Gui, Add, Edit,   ReadOnly +Center w60 x144 y79,  % DateShortcut%IndivStats%
Gui, Add, Button, w130 x12 y103, SysSwitch
Gui, Add, Edit,   ReadOnly +Center w60 x144 y104, % SysSwitch%IndivStats%
Gui, Add, Button, w130 x12 y128, ExcelHLink
Gui, Add, Edit,   ReadOnly +Center w60 x144 y129, % ExcelHLink%IndivStats%
Gui, Add, Button, w130 x12 y153, CalExtend
Gui, Add, Edit,   ReadOnly +Center w60 x144 y154, % CalExtend%IndivStats%
Gui, Add, Button, w130 x12 y178, CopyAction
Gui, Add, Edit,   ReadOnly +Center w60 x144 y179, % CopyAction%IndivStats%
Gui, Add, Button, w130 x12 y203, PasteAction
Gui, Add, Edit,   ReadOnly +Center w60 x144 y204, % PasteAction%IndivStats%
Gui, Add, Button, w130 x12 y228, SuggestRemarks
Gui, Add, Edit,   ReadOnly +Center w60 x144 y229, % SuggestRemarks%IndivStats%
Gui, Add, Button, w130 x12 y253, ClientCodeIE
Gui, Add, Edit,   ReadOnly +Center w60 x144 y254, % ClientCodeIE%IndivStats%
Gui, Add, Button, w130 x12 y278, AttyFinder
Gui, Add, Edit,   ReadOnly +Center w60 x144 y279, % AttyFinder%IndivStats%
Gui, Add, Button, w130 x12 y303, EFSCertFinder
Gui, Add, Edit,   ReadOnly +Center w60 x144 y304, % EFSCertFinder%IndivStats%
Gui, Add, Button, w130 x12 y328, EFSFill
Gui, Add, Edit,   ReadOnly +Center w60 x144 y329, % EFSFill%IndivStats%
Gui, Show, w218
return

IndivStats:
Gui, Submit, NoHide
GuiControl, ,Edit13, % Keystrokes%IndivStats%
GuiControl, ,Edit14, % DateShortcut%IndivStats%
GuiControl, ,Edit15, % SysSwitch%IndivStats%
GuiControl, ,Edit16, % ExcelHLink%IndivStats%
GuiControl, ,Edit17, % CalExtend%IndivStats%
GuiControl, ,Edit18, % CopyAction%IndivStats%
GuiControl, ,Edit19, % PasteAction%IndivStats%
GuiControl, ,Edit20, % SuggestRemarks%IndivStats%
GuiControl, ,Edit21, % ClientCodeIE%IndivStats%
GuiControl, ,Edit22, % AttyFinder%IndivStats%
GuiControl, ,Edit23, % EFSCertFinder%IndivStats%
GuiControl, ,Edit24, % EFSFill%IndivStats%
return

Archive:
FileCreateDir, C:\Users\%A_Username%\Desktop\AHK Back-up\                                             ;Creates new folder on the desktop.
Sleep 5000
FileCopy, C:\Users\%A_Username%\Desktop\*.ahk, C:\Users\%A_Username%\Desktop\AHK Back-up              ;Copies all .ahk files from the Desktop.
Sleep 1000
FileCopy, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\*.ini, C:\Users\%A_Username%\Desktop\AHK Back-up ; Copies all user .ini files from H: drive
Sleep 1000
FileCopy, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\*.ini, C:\Users\%A_Username%\Desktop\AHK Back-up ; Copies all function .ini files from H: drive
Sleep 1000
FileCopy, H:\Docketing\AutoHotKey\AHK Instructions.docx, C:\Users\%A_Username%\Desktop\AHK Back-up    ; Copies the current AHK Instructions.docx.
Sleep 1000
FileCopy, C:\Users\%A_Username%\Desktop\AHK Masters\*.ahk, C:\Users\%A_Username%\Desktop\AHK Back-up  ; Copies all current Master .ahk files.
Sleep 1000
FileCopy, C:\Users\%A_Username%\Desktop\AHK Masters\Atty Phone Numbers.xlsx, C:\Users\%A_Username%\Desktop\AHK Back-up  ; Copies Atty Phone Number.xlsx.
Sleep 1000
return

Data:
Gui, Submit, NoHide
Run H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch
return

Cancel:
Gui, Destroy
ExitApp
return

Refresh:
Gui, Submit, NoHide
KeystrokesTotals    = 0
DateShortcutTotals  = 0
SysSwitchTotals     = 0
ExcelHLinkTotals    = 0
EFSCertFinderTotals = 0
CopyActionTotals    = 0
PasteActionTotals   = 0
SuggestRemarksTotals= 0
ClientCodeIETotals  = 0
AttyFinderTotals    = 0
CalExtendTotals     = 0
EFSFillTotals       = 0
gosub UserData1
gosub UserData2
gosub UserData3
gosub UserData4
gosub UserData5
gosub UserData6
gosub UserData7
gosub UserData8
gosub UserData9
gosub UserData10
gosub UserData11
gosub UserData12
gosub UserData13
gosub UserData14
gosub UserData15
gosub UserData16
gosub UserData17
gosub UserData18
gosub UserData19
gosub UserData20
gosub UserData21
gosub UserData22
gosub UserData23
gosub UserData24
gosub UserData25
gosub UserData26
gosub UserData27
;gosub UserData28
;gosub UserData29
;gosub UserData30
;gosub UserData31
;gosub UserData32
;gosub UserData33
;gosub UserData34
;gosub UserData35
;gosub UserData36
;gosub UserData37
;gosub UserData38
;gosub UserData39
;gosub UserData40
;gosub UserData41
;gosub UserData42
;gosub UserData43
;gosub UserData44
;gosub UserData45
;gosub UserData46
;gosub UserData47
;gosub UserData48
;gosub UserData49
;gosub UserData50

Loop, %TotalUsers%
{
KeystrokesTotals+=Keystrokes%A_Index%
DateShortcutTotals+=DateShortcut%A_Index%
AttyFinderTotals+=AttyFinder%A_Index%
CalExtendTotals+=CalExtend%A_Index%
SysSwitchTotals+=SysSwitch%A_Index%
ExcelHLinkTotals+=ExcelHLink%A_Index%
EFSCertFinderTotals+=EFSCertFinder%A_Index%
CopyActionTotals+=CopyAction%A_Index%
PasteActionTotals+=PasteAction%A_Index%
SuggestRemarksTotals+=SuggestRemarks%A_Index%
ClientCodeIETotals+=ClientCodeIE%A_Index%
EFSFillTotals+=EFSFill%A_Index%
}

IniWrite, %KeystrokesTotals%,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupKeystrokes
IniWrite, %DateShortcutTotals%,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupDateShortcut
IniWrite, %AttyFinderTotals%,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAttyFinder
IniWrite, %CalExtendTotals%,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCalExtend
IniWrite, %SysSwitchTotals%,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSysSwitch
IniWrite, %ExcelHLinkTotals%,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupExcelHLink
IniWrite, %EFSCertFinderTotals%,   C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSCertFinder
IniWrite, %CopyActionTotals%,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCopyAction
IniWrite, %PasteActionTotals%,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupPasteAction
IniWrite, %SuggestRemarksTotals%,  C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSuggestRemarks
IniWrite, %ClientCodeIETotals%,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupClientCodeIE
IniWrite, %EFSFillTotals%,         C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSFill
Sleep 1000
IniRead, GroupKeystrokesTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupKeystrokes
IniRead, GroupDateShortcutTotals,  C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupDateShortcut
IniRead, GroupAttyFinderTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAttyFinder
IniRead, GroupCalExtendTotals,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCalExtend
IniRead, GroupSysSwitchTotals,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSysSwitch
IniRead, GroupExcelHLinkTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupExcelHLink
IniRead, GroupEFSCertFinderTotals, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSCertFinder
IniRead, GroupCopyActionTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCopyAction
IniRead, GroupPasteActionTotals,   C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupPasteAction
IniRead, GroupSuggestRemarksTotals,C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSuggestRemarks
IniRead, GroupClientCodeIETotals,  C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupClientCodeIE
IniRead, GroupEFSFillTotals,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSFill

Sleep 200
GuiControl, ,Edit1,  %GroupKeystrokesTotals%
GuiControl, ,Edit2,  %GroupDateShortcutTotals%
GuiControl, ,Edit3,  %GroupSysSwitchTotals%
GuiControl, ,Edit4,  %GroupExcelHLinkTotals%
GuiControl, ,Edit5,  %GroupCalExtendTotals%
GuiControl, ,Edit6,  %GroupCopyActionTotals%
GuiControl, ,Edit7,  %GroupPasteActionTotals%
GuiControl, ,Edit8,  %GroupSuggestRemarksTotals%
GuiControl, ,Edit9,  %GroupClientCodeIETotals%
GuiControl, ,Edit10, %GroupAttyFinderTotals%
GuiControl, ,Edit11, %GroupEFSCertFinderTotals%
GuiControl, ,Edit12, %GroupEFSFillTotals%
GuiControl, ,Edit13, % Keystrokes%IndivStats%
GuiControl, ,Edit14, % DateShortcut%IndivStats%
GuiControl, ,Edit15, % SysSwitch%IndivStats%
GuiControl, ,Edit16, % ExcelHLink%IndivStats%
GuiControl, ,Edit17, % CalExtend%IndivStats%
GuiControl, ,Edit18, % CopyAction%IndivStats%
GuiControl, ,Edit19, % PasteAction%IndivStats%
GuiControl, ,Edit20, % SuggestRemarks%IndivStats%
GuiControl, ,Edit21, % ClientCodeIE%IndivStats%
GuiControl, ,Edit22, % AttyFinder%IndivStats%
GuiControl, ,Edit23, % EFSCertFinder%IndivStats%
GuiControl, ,Edit24, % EFSFill%IndivStats%
return

Refresh2:
Gui, Submit, NoHide
KeystrokesTotals    = 0
DateShortcutTotals  = 0
SysSwitchTotals     = 0
ExcelHLinkTotals    = 0
EFSCertFinderTotals = 0
CopyActionTotals    = 0
PasteActionTotals   = 0
SuggestRemarksTotals= 0
ClientCodeIETotals  = 0
AttyFinderTotals    = 0
CalExtendTotals     = 0
EFSFillTotals       = 0
gosub UserData1
gosub UserData2
gosub UserData3
gosub UserData4
gosub UserData5
gosub UserData6
gosub UserData7
gosub UserData8
gosub UserData9
gosub UserData10
gosub UserData11
gosub UserData12
gosub UserData13
gosub UserData14
gosub UserData15
gosub UserData16
gosub UserData17
gosub UserData18
gosub UserData19
gosub UserData20
gosub UserData21
gosub UserData22
gosub UserData23
gosub UserData24
gosub UserData25
gosub UserData26
gosub UserData27
;gosub UserData28
;gosub UserData29
;gosub UserData30
;gosub UserData31
;gosub UserData32
;gosub UserData33
;gosub UserData34
;gosub UserData35
;gosub UserData36
;gosub UserData37
;gosub UserData38
;gosub UserData39
;gosub UserData40
;gosub UserData41
;gosub UserData42
;gosub UserData43
;gosub UserData44
;gosub UserData45
;gosub UserData46
;gosub UserData47
;gosub UserData48
;gosub UserData49
;gosub UserData50

Loop, %TotalUsers%
{
KeystrokesTotals+=Keystrokes%A_Index%
DateShortcutTotals+=DateShortcut%A_Index%
AttyFinderTotals+=AttyFinder%A_Index%
CalExtendTotals+=CalExtend%A_Index%
SysSwitchTotals+=SysSwitch%A_Index%
ExcelHLinkTotals+=ExcelHLink%A_Index%
EFSCertFinderTotals+=EFSCertFinder%A_Index%
CopyActionTotals+=CopyAction%A_Index%
PasteActionTotals+=PasteAction%A_Index%
SuggestRemarksTotals+=SuggestRemarks%A_Index%
ClientCodeIETotals+=ClientCodeIE%A_Index%
EFSFillTotals+=EFSFill%A_Index%
}

IniWrite, %KeystrokesTotals%,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupKeystrokes
IniWrite, %DateShortcutTotals%,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupDateShortcut
IniWrite, %AttyFinderTotals%,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAttyFinder
IniWrite, %CalExtendTotals%,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCalExtend
IniWrite, %SysSwitchTotals%,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSysSwitch
IniWrite, %ExcelHLinkTotals%,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupExcelHLink
IniWrite, %EFSCertFinderTotals%,   C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSCertFinder
IniWrite, %CopyActionTotals%,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCopyAction
IniWrite, %PasteActionTotals%,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupPasteAction
IniWrite, %SuggestRemarksTotals%,  C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSuggestRemarks
IniWrite, %ClientCodeIETotals%,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupClientCodeIE
IniWrite, %EFSFillTotals%,         C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSFill
Sleep 1000
IniRead, GroupKeystrokesTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupKeystrokes
IniRead, GroupDateShortcutTotals,  C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupDateShortcut
IniRead, GroupCalExtendTotals,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCalExtend
IniRead, GroupSysSwitchTotals,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSysSwitch
IniRead, GroupExcelHLinkTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupExcelHLink
IniRead, GroupEFSCertFinderTotals, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSCertFinder
IniRead, GroupCopyActionTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCopyAction
IniRead, GroupPasteActionTotals,   C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupPasteAction
IniRead, GroupAttyFinderTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAttyFinder
IniRead, GroupSuggestRemarksTotals,C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSuggestRemarks
IniRead, GroupClientCodeIETotals,  C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupClientCodeIE
IniRead, GroupEFSFillTotals,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSFill
Sleep 200
GuiControl, ,Edit1,  %GroupKeystrokesTotals%
GuiControl, ,Edit2,  %GroupDateShortcutTotals%
GuiControl, ,Edit3,  %GroupSysSwitchTotals%
GuiControl, ,Edit4,  %GroupExcelHLinkTotals%
GuiControl, ,Edit5,  %GroupCalExtendTotals%
GuiControl, ,Edit6,  %GroupCopyActionTotals%
GuiControl, ,Edit7,  %GroupPasteActionTotals%
GuiControl, ,Edit8,  %GroupSuggestRemarksTotals%
GuiControl, ,Edit9,  %GroupClientCodeIETotals%
GuiControl, ,Edit10, %GroupAttyFinderTotals%
GuiControl, ,Edit11, %GroupEFSCertFinderTotals%
GuiControl, ,Edit12, %GroupEFSFillTotals%
GuiControl, ,Edit13, % Keystrokes%IndivStats%
GuiControl, ,Edit14, % DateShortcut%IndivStats%
GuiControl, ,Edit15, % SysSwitch%IndivStats%
GuiControl, ,Edit16, % ExcelHLink%IndivStats%
GuiControl, ,Edit17, % CalExtend%IndivStats%
GuiControl, ,Edit18, % CopyAction%IndivStats%
GuiControl, ,Edit19, % PasteAction%IndivStats%
GuiControl, ,Edit20, % SuggestRemarks%IndivStats%
GuiControl, ,Edit21, % ClientCodeIE%IndivStats%
GuiControl, ,Edit22, % AttyFinder%IndivStats%
GuiControl, ,Edit23, % EFSCertFinder%IndivStats%
GuiControl, ,Edit24, % EFSFill%IndivStats%
return

UserData1:
IniRead, Keystrokes1,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, Keystrokes
IniRead, DateShortcut1,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, DateShortcut
IniRead, AttyFinder1,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, AttyFinder
IniRead, CalExtend1,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, CalExtend
IniRead, SysSwitch1,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, SysSwitch
IniRead, ExcelHLink1,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, EFSCertFinder
IniRead, CopyAction1,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, CopyAction
IniRead, PasteAction1,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, PasteAction
IniRead, SuggestRemarks1,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE1,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, ClientCodeIE
IniRead, EFSFill1,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, EFSFill
return

UserData2:
IniRead, Keystrokes2,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, Keystrokes
IniRead, DateShortcut2,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, DateShortcut
IniRead, AttyFinder2,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, AttyFinder
IniRead, CalExtend2,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, CalExtend
IniRead, SysSwitch2,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, SysSwitch
IniRead, ExcelHLink2,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder2, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, EFSCertFinder
IniRead, CopyAction2,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, CopyAction
IniRead, PasteAction2,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, PasteAction
IniRead, SuggestRemarks2,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE2,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, ClientCodeIE
IniRead, EFSFill2,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, EFSFill
return

UserData3:
IniRead, Keystrokes3,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, Keystrokes
IniRead, DateShortcut3,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, DateShortcut
IniRead, AttyFinder3,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, AttyFinder
IniRead, CalExtend3,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, CalExtend
IniRead, SysSwitch3,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, SysSwitch
IniRead, ExcelHLink3,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder3, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, EFSCertFinder
IniRead, CopyAction3,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, CopyAction
IniRead, PasteAction3,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, PasteAction
IniRead, SuggestRemarks3,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE3,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, ClientCodeIE
IniRead, EFSFill3,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, EFSFill
return

UserData4:
IniRead, Keystrokes4,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, Keystrokes
IniRead, DateShortcut4,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, DateShortcut
IniRead, AttyFinder4,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, AttyFinder
IniRead, CalExtend4,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, CalExtend
IniRead, SysSwitch4,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, SysSwitch
IniRead, ExcelHLink4,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder4, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, EFSCertFinder
IniRead, CopyAction4,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, CopyAction
IniRead, PasteAction4,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, PasteAction
IniRead, SuggestRemarks4,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE4,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, ClientCodeIE
IniRead, EFSFill4,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, EFSFill
return

UserData5:
IniRead, Keystrokes5,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, Keystrokes
IniRead, DateShortcut5,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, DateShortcut
IniRead, AttyFinder5,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, AttyFinder
IniRead, CalExtend5,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, CalExtend
IniRead, SysSwitch5,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, SysSwitch
IniRead, ExcelHLink5,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder5, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, EFSCertFinder
IniRead, CopyAction5,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, CopyAction
IniRead, PasteAction5,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, PasteAction
IniRead, SuggestRemarks5,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE5,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, ClientCodeIE
IniRead, EFSFill5,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, EFSFill
return

UserData6:
IniRead, Keystrokes6,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, Keystrokes
IniRead, DateShortcut6,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, DateShortcut
IniRead, AttyFinder6,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, AttyFinder
IniRead, CalExtend6,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, CalExtend
IniRead, SysSwitch6,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, SysSwitch
IniRead, ExcelHLink6,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder6, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, EFSCertFinder
IniRead, CopyAction6,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, CopyAction
IniRead, PasteAction6,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, PasteAction
IniRead, SuggestRemarks6,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE6,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, ClientCodeIE
IniRead, EFSFill6,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, EFSFill
return

UserData7:
IniRead, Keystrokes7,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, Keystrokes
IniRead, DateShortcut7,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, DateShortcut
IniRead, AttyFinder7,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, AttyFinder
IniRead, CalExtend7,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, CalExtend
IniRead, SysSwitch7,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, SysSwitch
IniRead, ExcelHLink7,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder7, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, EFSCertFinder
IniRead, CopyAction7,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, CopyAction
IniRead, PasteAction7,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, PasteAction
IniRead, SuggestRemarks7,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE7,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, ClientCodeIE
IniRead, EFSFill7,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, EFSFill
return

UserData8:
IniRead, Keystrokes8,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, Keystrokes
IniRead, DateShortcut8,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, DateShortcut
IniRead, AttyFinder8,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, AttyFinder
IniRead, CalExtend8,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, CalExtend
IniRead, SysSwitch8,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, SysSwitch
IniRead, ExcelHLink8,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder8, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, EFSCertFinder
IniRead, CopyAction8,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, CopyAction
IniRead, PasteAction8,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, PasteAction
IniRead, SuggestRemarks8,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE8,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, ClientCodeIE
IniRead, EFSFill8,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, EFSFill
return

UserData9:
IniRead, Keystrokes9,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, Keystrokes
IniRead, DateShortcut9,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, DateShortcut
IniRead, AttyFinder9,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, AttyFinder
IniRead, CalExtend9,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, CalExtend
IniRead, SysSwitch9,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, SysSwitch
IniRead, ExcelHLink9,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder9, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, EFSCertFinder
IniRead, CopyAction9,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, CopyAction
IniRead, PasteAction9,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, PasteAction
IniRead, SuggestRemarks9,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE9,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, ClientCodeIE
IniRead, EFSFill9,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, EFSFill
return

UserData10:
IniRead, Keystrokes10,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, Keystrokes
IniRead, DateShortcut10,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, DateShortcut
IniRead, AttyFinder10,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, AttyFinder
IniRead, CalExtend10,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, CalExtend
IniRead, SysSwitch10,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, SysSwitch
IniRead, ExcelHLink10,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder10, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, EFSCertFinder
IniRead, CopyAction10,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, CopyAction
IniRead, PasteAction10,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, PasteAction
IniRead, SuggestRemarks10,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE10,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, ClientCodeIE
IniRead, EFSFill10,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, EFSFill
return

UserData11:
IniRead, Keystrokes11,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, Keystrokes
IniRead, DateShortcut11,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, DateShortcut
IniRead, AttyFinder11,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, AttyFinder
IniRead, CalExtend11,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, CalExtend
IniRead, SysSwitch11,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, SysSwitch
IniRead, ExcelHLink11,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder11, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, EFSCertFinder
IniRead, CopyAction11,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, CopyAction
IniRead, PasteAction11,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, PasteAction
IniRead, SuggestRemarks11,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE11,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, ClientCodeIE
IniRead, EFSFill11,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, EFSFill
return

UserData12:
IniRead, Keystrokes12,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, Keystrokes
IniRead, DateShortcut12,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, DateShortcut
IniRead, AttyFinder12,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, AttyFinder
IniRead, CalExtend12,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, CalExtend
IniRead, SysSwitch12,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, SysSwitch
IniRead, ExcelHLink12,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder12, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, EFSCertFinder
IniRead, CopyAction12,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, CopyAction
IniRead, PasteAction12,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, PasteAction
IniRead, SuggestRemarks12,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE12,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, ClientCodeIE
IniRead, EFSFill12,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, EFSFill
return

UserData13:
IniRead, Keystrokes13,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, Keystrokes
IniRead, DateShortcut13,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, DateShortcut
IniRead, AttyFinder13,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, AttyFinder
IniRead, CalExtend13,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, CalExtend
IniRead, SysSwitch13,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, SysSwitch
IniRead, ExcelHLink13,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder13, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, EFSCertFinder
IniRead, CopyAction13,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, CopyAction
IniRead, PasteAction13,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, PasteAction
IniRead, SuggestRemarks13,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE13,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, ClientCodeIE
IniRead, EFSFill13,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, EFSFill
return

UserData14:
IniRead, Keystrokes14,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, Keystrokes
IniRead, DateShortcut14,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, DateShortcut
IniRead, AttyFinder14,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, AttyFinder
IniRead, CalExtend14,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, CalExtend
IniRead, SysSwitch14,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, SysSwitch
IniRead, ExcelHLink14,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder14, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, EFSCertFinder
IniRead, CopyAction14,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, CopyAction
IniRead, PasteAction14,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, PasteAction
IniRead, SuggestRemarks14,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE14,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, ClientCodeIE
IniRead, EFSFill14,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, EFSFill
return

UserData15:
IniRead, Keystrokes15,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, Keystrokes
IniRead, DateShortcut15,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, DateShortcut
IniRead, AttyFinder15,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, AttyFinder
IniRead, CalExtend15,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, CalExtend
IniRead, SysSwitch15,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, SysSwitch
IniRead, ExcelHLink15,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder15, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, EFSCertFinder
IniRead, CopyAction15,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, CopyAction
IniRead, PasteAction15,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, PasteAction
IniRead, SuggestRemarks15,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE15,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, ClientCodeIE
IniRead, EFSFill15,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, EFSFill
return

UserData16:
IniRead, Keystrokes16,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, Keystrokes
IniRead, DateShortcut16,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, DateShortcut
IniRead, AttyFinder16,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, AttyFinder
IniRead, CalExtend16,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, CalExtend
IniRead, SysSwitch16,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, SysSwitch
IniRead, ExcelHLink16,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder16, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, EFSCertFinder
IniRead, CopyAction16,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, CopyAction
IniRead, PasteAction16,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, PasteAction
IniRead, SuggestRemarks16,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE16,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, ClientCodeIE
IniRead, EFSFill16,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, EFSFill
return

UserData17:
IniRead, Keystrokes17,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, Keystrokes
IniRead, DateShortcut17,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, DateShortcut
IniRead, AttyFinder17,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, AttyFinder
IniRead, CalExtend17,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, CalExtend
IniRead, SysSwitch17,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, SysSwitch
IniRead, ExcelHLink17,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder17, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, EFSCertFinder
IniRead, CopyAction17,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, CopyAction
IniRead, PasteAction17,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, PasteAction
IniRead, SuggestRemarks17,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE17,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, ClientCodeIE
IniRead, EFSFill17,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, EFSFill
return

UserData18:
IniRead, Keystrokes18,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, Keystrokes
IniRead, DateShortcut18,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, DateShortcut
IniRead, AttyFinder18,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, AttyFinder
IniRead, CalExtend18,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, CalExtend
IniRead, SysSwitch18,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, SysSwitch
IniRead, ExcelHLink18,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder18, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, EFSCertFinder
IniRead, CopyAction18,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, CopyAction
IniRead, PasteAction18,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, PasteAction
IniRead, SuggestRemarks18,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE18,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, ClientCodeIE
IniRead, EFSFill18,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, EFSFill
return

UserData19:
IniRead, Keystrokes19,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, Keystrokes
IniRead, DateShortcut19,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, DateShortcut
IniRead, AttyFinder19,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, AttyFinder
IniRead, CalExtend19,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, CalExtend
IniRead, SysSwitch19,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, SysSwitch
IniRead, ExcelHLink19,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder19, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, EFSCertFinder
IniRead, CopyAction19,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, CopyAction
IniRead, PasteAction19,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, PasteAction
IniRead, SuggestRemarks19,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE19,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, ClientCodeIE
IniRead, EFSFill19,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, EFSFill
return

UserData20:
IniRead, Keystrokes20,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, Keystrokes
IniRead, DateShortcut20,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, DateShortcut
IniRead, AttyFinder20,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, AttyFinder
IniRead, CalExtend20,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, CalExtend
IniRead, SysSwitch20,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, SysSwitch
IniRead, ExcelHLink20,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder20, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, EFSCertFinder
IniRead, CopyAction20,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, CopyAction
IniRead, PasteAction20,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, PasteAction
IniRead, SuggestRemarks20,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE20,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, ClientCodeIE
IniRead, EFSFill20,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, EFSFill
return

UserData21:
IniRead, Keystrokes21,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, Keystrokes
IniRead, DateShortcut21,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, DateShortcut
IniRead, AttyFinder21,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, AttyFinder
IniRead, CalExtend21,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, CalExtend
IniRead, SysSwitch21,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, SysSwitch
IniRead, ExcelHLink21,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder21, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, EFSCertFinder
IniRead, CopyAction21,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, CopyAction
IniRead, PasteAction21,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, PasteAction
IniRead, SuggestRemarks21,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE21,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, ClientCodeIE
IniRead, EFSFill21,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, EFSFill
return

UserData22:
IniRead, Keystrokes22,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, Keystrokes
IniRead, DateShortcut22,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, DateShortcut
IniRead, AttyFinder22,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, AttyFinder
IniRead, CalExtend22,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, CalExtend
IniRead, SysSwitch22,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, SysSwitch
IniRead, ExcelHLink22,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder22, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, EFSCertFinder
IniRead, CopyAction22,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, CopyAction
IniRead, PasteAction22,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, PasteAction
IniRead, SuggestRemarks22,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE22,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, ClientCodeIE
IniRead, EFSFill22,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, EFSFill
return

UserData23:
IniRead, Keystrokes23,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, Keystrokes
IniRead, DateShortcut23,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, DateShortcut
IniRead, AttyFinder23,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, AttyFinder
IniRead, CalExtend23,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, CalExtend
IniRead, SysSwitch23,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, SysSwitch
IniRead, ExcelHLink23,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder23, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, EFSCertFinder
IniRead, CopyAction23,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, CopyAction
IniRead, PasteAction23,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, PasteAction
IniRead, SuggestRemarks23,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE23,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, ClientCodeIE
IniRead, EFSFill23,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, EFSFill
return

UserData24:
IniRead, Keystrokes24,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, Keystrokes
IniRead, DateShortcut24,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, DateShortcut
IniRead, AttyFinder24,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, AttyFinder
IniRead, CalExtend24,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, CalExtend
IniRead, SysSwitch24,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, SysSwitch
IniRead, ExcelHLink24,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder24, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, EFSCertFinder
IniRead, CopyAction24,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, CopyAction
IniRead, PasteAction24,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, PasteAction
IniRead, SuggestRemarks24,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE24,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, ClientCodeIE
IniRead, EFSFill24,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, EFSFill
return


UserData25:
IniRead, Keystrokes25,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, Keystrokes
IniRead, DateShortcut25,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, DateShortcut
IniRead, AttyFinder25,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, AttyFinder
IniRead, CalExtend25,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, CalExtend
IniRead, SysSwitch25,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, SysSwitch
IniRead, ExcelHLink25,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder25, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, EFSCertFinder
IniRead, CopyAction25,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, CopyAction
IniRead, PasteAction25,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, PasteAction
IniRead, SuggestRemarks25,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE25,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, ClientCodeIE
IniRead, EFSFill25,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, EFSFill
return

UserData26:
IniRead, Keystrokes26,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, Keystrokes
IniRead, DateShortcut26,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, DateShortcut
IniRead, AttyFinder26,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, AttyFinder
IniRead, CalExtend26,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, CalExtend
IniRead, SysSwitch26,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, SysSwitch
IniRead, ExcelHLink26,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder26, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, EFSCertFinder
IniRead, CopyAction26,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, CopyAction
IniRead, PasteAction26,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, PasteAction
IniRead, SuggestRemarks26,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE26,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, ClientCodeIE
IniRead, EFSFill26,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, EFSFill
return

UserData27:
IniRead, Keystrokes27,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, Keystrokes
IniRead, DateShortcut27,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, DateShortcut
IniRead, AttyFinder27,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, AttyFinder
IniRead, CalExtend27,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, CalExtend
IniRead, SysSwitch27,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, SysSwitch
IniRead, ExcelHLink27,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder27, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, EFSCertFinder
IniRead, CopyAction27,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, CopyAction
IniRead, PasteAction27,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, PasteAction
IniRead, SuggestRemarks27,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE27,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, ClientCodeIE
IniRead, EFSFill27,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, EFSFill
return

/*
UserData28:
IniRead, Keystrokes28,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, Keystrokes
IniRead, DateShortcut28,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, DateShortcut
IniRead, AttyFinder28,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, AttyFinder
IniRead, CalExtend28,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, CalExtend
IniRead, SysSwitch28,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, SysSwitch
IniRead, ExcelHLink28,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder28, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, EFSCertFinder
IniRead, CopyAction28,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, CopyAction
IniRead, PasteAction28,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, PasteAction
IniRead, SuggestRemarks28,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE28,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, ClientCodeIE
IniRead, EFSFill28,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, EFSFill
return

UserData29:
IniRead, Keystrokes29,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, Keystrokes
IniRead, DateShortcut29,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, DateShortcut
IniRead, AttyFinder29,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, AttyFinder
IniRead, CalExtend29,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, CalExtend
IniRead, SysSwitch29,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, SysSwitch
IniRead, ExcelHLink29,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder29, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, EFSCertFinder
IniRead, CopyAction29,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, CopyAction
IniRead, PasteAction29,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, PasteAction
IniRead, SuggestRemarks29,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE29,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, ClientCodeIE
IniRead, EFSFill29,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, EFSFill
return

UserData30:
IniRead, Keystrokes30,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, Keystrokes
IniRead, DateShortcut30,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, DateShortcut
IniRead, AttyFinder30,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, AttyFinder
IniRead, CalExtend30,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, CalExtend
IniRead, SysSwitch30,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, SysSwitch
IniRead, ExcelHLink30,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder30, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, EFSCertFinder
IniRead, CopyAction30,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, CopyAction
IniRead, PasteAction30,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, PasteAction
IniRead, SuggestRemarks30,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE30,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, ClientCodeIE
IniRead, EFSFill30,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, EFSFill
return

UserData31:
IniRead, Keystrokes31,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, Keystrokes
IniRead, DateShortcut31,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, DateShortcut
IniRead, AttyFinder31,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, AttyFinder
IniRead, CalExtend31,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, CalExtend
IniRead, SysSwitch31,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, SysSwitch
IniRead, ExcelHLink31,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder31, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, EFSCertFinder
IniRead, CopyAction31,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, CopyAction
IniRead, PasteAction31,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, PasteAction
IniRead, SuggestRemarks31,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE31,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, ClientCodeIE
IniRead, EFSFill31,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, EFSFill
return

UserData32:
IniRead, Keystrokes32,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, Keystrokes
IniRead, DateShortcut32,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, DateShortcut
IniRead, AttyFinder32,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, AttyFinder
IniRead, CalExtend32,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, CalExtend
IniRead, SysSwitch32,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, SysSwitch
IniRead, ExcelHLink32,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder32, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, EFSCertFinder
IniRead, CopyAction32,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, CopyAction
IniRead, PasteAction32,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, PasteAction
IniRead, SuggestRemarks32,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE32,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, ClientCodeIE
IniRead, EFSFill32,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, EFSFill
return

UserData33:
IniRead, Keystrokes33,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, Keystrokes
IniRead, DateShortcut33,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, DateShortcut
IniRead, AttyFinder33,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, AttyFinder
IniRead, CalExtend33,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, CalExtend
IniRead, SysSwitch33,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, SysSwitch
IniRead, ExcelHLink33,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder33, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, EFSCertFinder
IniRead, CopyAction33,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, CopyAction
IniRead, PasteAction33,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, PasteAction
IniRead, SuggestRemarks33,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE33,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, ClientCodeIE
IniRead, EFSFill33,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, EFSFill
return

UserData34:
IniRead, Keystrokes34,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, Keystrokes
IniRead, DateShortcut34,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, DateShortcut
IniRead, AttyFinder34,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, AttyFinder
IniRead, CalExtend34,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, CalExtend
IniRead, SysSwitch34,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, SysSwitch
IniRead, ExcelHLink34,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder34, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, EFSCertFinder
IniRead, CopyAction34,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, CopyAction
IniRead, PasteAction34,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, PasteAction
IniRead, SuggestRemarks34,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE34,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, ClientCodeIE
IniRead, EFSFill34,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, EFSFill
return

UserData35:
IniRead, Keystrokes35,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, Keystrokes
IniRead, DateShortcut35,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, DateShortcut
IniRead, AttyFinder35,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, AttyFinder
IniRead, CalExtend35,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, CalExtend
IniRead, SysSwitch35,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, SysSwitch
IniRead, ExcelHLink35,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder35, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, EFSCertFinder
IniRead, CopyAction35,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, CopyAction
IniRead, PasteAction35,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, PasteAction
IniRead, SuggestRemarks35,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE35,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, ClientCodeIE
IniRead, EFSFill35,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, EFSFill
return

UserData36:
IniRead, Keystrokes36,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, Keystrokes
IniRead, DateShortcut36,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, DateShortcut
IniRead, AttyFinder36,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, AttyFinder
IniRead, CalExtend36,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, CalExtend
IniRead, SysSwitch36,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, SysSwitch
IniRead, ExcelHLink36,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder36, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, EFSCertFinder
IniRead, CopyAction36,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, CopyAction
IniRead, PasteAction36,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, PasteAction
IniRead, SuggestRemarks36,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE36,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, ClientCodeIE
IniRead, EFSFill36,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, EFSFill
return

UserData37:
IniRead, Keystrokes37,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, Keystrokes
IniRead, DateShortcut37,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, DateShortcut
IniRead, AttyFinder37,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, AttyFinder
IniRead, CalExtend37,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, CalExtend
IniRead, SysSwitch37,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, SysSwitch
IniRead, ExcelHLink37,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder37, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, EFSCertFinder
IniRead, CopyAction37,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, CopyAction
IniRead, PasteAction37,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, PasteAction
IniRead, SuggestRemarks37,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE37,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, ClientCodeIE
IniRead, EFSFill37,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, EFSFill
return

UserData38:
IniRead, Keystrokes38,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, Keystrokes
IniRead, DateShortcut38,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, DateShortcut
IniRead, AttyFinder38,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, AttyFinder
IniRead, CalExtend38,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, CalExtend
IniRead, SysSwitch38,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, SysSwitch
IniRead, ExcelHLink38,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder38, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, EFSCertFinder
IniRead, CopyAction38,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, CopyAction
IniRead, PasteAction38,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, PasteAction
IniRead, SuggestRemarks38,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE38,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, ClientCodeIE
IniRead, EFSFill38,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, EFSFill
return

UserData39:
IniRead, Keystrokes39,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, Keystrokes
IniRead, DateShortcut39,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, DateShortcut
IniRead, AttyFinder39,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, AttyFinder
IniRead, CalExtend39,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, CalExtend
IniRead, SysSwitch39,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, SysSwitch
IniRead, ExcelHLink39,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder39, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, EFSCertFinder
IniRead, CopyAction39,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, CopyAction
IniRead, PasteAction39,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, PasteAction
IniRead, SuggestRemarks39,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE39,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, ClientCodeIE
IniRead, EFSFill39,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, EFSFill
return

UserData40:
IniRead, Keystrokes40,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, Keystrokes
IniRead, DateShortcut40,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, DateShortcut
IniRead, AttyFinder40,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, AttyFinder
IniRead, CalExtend40,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, CalExtend
IniRead, SysSwitch40,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, SysSwitch
IniRead, ExcelHLink40,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder40, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, EFSCertFinder
IniRead, CopyAction40,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, CopyAction
IniRead, PasteAction40,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, PasteAction
IniRead, SuggestRemarks40,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE40,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, ClientCodeIE
IniRead, EFSFill40,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, EFSFill
return

UserData41:
IniRead, Keystrokes41,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, Keystrokes
IniRead, DateShortcut41,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, DateShortcut
IniRead, AttyFinder41,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, AttyFinder
IniRead, CalExtend41,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, CalExtend
IniRead, SysSwitch41,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, SysSwitch
IniRead, ExcelHLink41,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder41, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, EFSCertFinder
IniRead, CopyAction41,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, CopyAction
IniRead, PasteAction41,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, PasteAction
IniRead, SuggestRemarks41,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE41,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, ClientCodeIE
IniRead, EFSFill41,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, EFSFill
return

UserData42:
IniRead, Keystrokes42,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, Keystrokes
IniRead, DateShortcut42,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, DateShortcut
IniRead, AttyFinder42,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, AttyFinder
IniRead, CalExtend42,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, CalExtend
IniRead, SysSwitch42,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, SysSwitch
IniRead, ExcelHLink42,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder42, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, EFSCertFinder
IniRead, CopyAction42,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, CopyAction
IniRead, PasteAction42,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, PasteAction
IniRead, SuggestRemarks42,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE42,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, ClientCodeIE
IniRead, EFSFill42,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, EFSFill
return

UserData43:
IniRead, Keystrokes43,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, Keystrokes
IniRead, DateShortcut43,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, DateShortcut
IniRead, AttyFinder43,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, AttyFinder
IniRead, CalExtend43,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, CalExtend
IniRead, SysSwitch43,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, SysSwitch
IniRead, ExcelHLink43,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder43, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, EFSCertFinder
IniRead, CopyAction43,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, CopyAction
IniRead, PasteAction43,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, PasteAction
IniRead, SuggestRemarks43,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE43,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, ClientCodeIE
IniRead, EFSFill43,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, EFSFill
return

UserData44:
IniRead, Keystrokes44,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, Keystrokes
IniRead, DateShortcut44,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, DateShortcut
IniRead, AttyFinder44,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, AttyFinder
IniRead, CalExtend44,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, CalExtend
IniRead, SysSwitch44,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, SysSwitch
IniRead, ExcelHLink44,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder44, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, EFSCertFinder
IniRead, CopyAction44,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, CopyAction
IniRead, PasteAction44,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, PasteAction
IniRead, SuggestRemarks44,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE44,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, ClientCodeIE
IniRead, EFSFill44,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, EFSFill
return

UserData45:
IniRead, Keystrokes45,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, Keystrokes
IniRead, DateShortcut45,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, DateShortcut
IniRead, AttyFinder45,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, AttyFinder
IniRead, CalExtend45,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, CalExtend
IniRead, SysSwitch45,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, SysSwitch
IniRead, ExcelHLink45,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder45, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, EFSCertFinder
IniRead, CopyAction45,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, CopyAction
IniRead, PasteAction45,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, PasteAction
IniRead, SuggestRemarks45,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE45,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, ClientCodeIE
IniRead, EFSFill45,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, EFSFill
return

UserData46:
IniRead, Keystrokes46,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, Keystrokes
IniRead, DateShortcut46,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, DateShortcut
IniRead, AttyFinder46,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, AttyFinder
IniRead, CalExtend46,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, CalExtend
IniRead, SysSwitch46,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, SysSwitch
IniRead, ExcelHLink46,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder46, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, EFSCertFinder
IniRead, CopyAction46,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, CopyAction
IniRead, PasteAction46,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, PasteAction
IniRead, SuggestRemarks46,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE46,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, ClientCodeIE
IniRead, EFSFill46,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, EFSFill
return

UserData47:
IniRead, Keystrokes47,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, Keystrokes
IniRead, DateShortcut47,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, DateShortcut
IniRead, AttyFinder47,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, AttyFinder
IniRead, CalExtend47,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, CalExtend
IniRead, SysSwitch47,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, SysSwitch
IniRead, ExcelHLink47,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder47, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, EFSCertFinder
IniRead, CopyAction47,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, CopyAction
IniRead, PasteAction47,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, PasteAction
IniRead, SuggestRemarks47,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE47,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, ClientCodeIE
IniRead, EFSFill47,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, EFSFill
return

UserData48:
IniRead, Keystrokes48,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, Keystrokes
IniRead, DateShortcut48,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, DateShortcut
IniRead, AttyFinder48,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, AttyFinder
IniRead, CalExtend48,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, CalExtend
IniRead, SysSwitch48,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, SysSwitch
IniRead, ExcelHLink48,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder48, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, EFSCertFinder
IniRead, CopyAction48,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, CopyAction
IniRead, PasteAction48,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, PasteAction
IniRead, SuggestRemarks48,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE48,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, ClientCodeIE
IniRead, EFSFill48,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, EFSFill
return

UserData49:
IniRead, Keystrokes49,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, Keystrokes
IniRead, DateShortcut49,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, DateShortcut
IniRead, AttyFinder49,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, AttyFinder
IniRead, CalExtend49,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, CalExtend
IniRead, SysSwitch49,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, SysSwitch
IniRead, ExcelHLink49,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder49, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, EFSCertFinder
IniRead, CopyAction49,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, CopyAction
IniRead, PasteAction49,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, PasteAction
IniRead, SuggestRemarks49,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE49,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, ClientCodeIE
IniRead, EFSFill49,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, EFSFill
return

UserData50:
IniRead, Keystrokes50,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, Keystrokes
IniRead, DateShortcut50,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, DateShortcut
IniRead, AttyFinder50,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, AttyFinder
IniRead, CalExtend50,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, CalExtend
IniRead, SysSwitch50,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, SysSwitch
IniRead, ExcelHLink50,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder50, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, EFSCertFinder
IniRead, CopyAction50,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, CopyAction
IniRead, PasteAction50,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, PasteAction
IniRead, SuggestRemarks50,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE50,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, ClientCodeIE
IniRead, EFSFill50,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, EFSFill
return

*/


^j::                                             ; This grabs all filenames from a folder and adds any with .ini extension to Stats.ini.
gosub, GrabPeeps
return

GrabPeeps:
Arrayed := Object()                                                          ; Working.
test = % list_files(A_WinDir)
MsgBox, %test%
Sort, test, U D`n \
StringSplit, Arrayed, test, `n, 
StatsAdded = 0
StatsNotAdded = 0

Loop, %Arrayed0%
{
IfInString, Arrayed%A_Index%, png
	{
	StatsNotAdded++
	}
else IfInString, Arrayed%A_Index%, db
	{
	StatsNotAdded++
	}
else IfInString, Arrayed%A_Index%, ini                                     ;  Grabs all .EPF files. Can accept %Format% too.
	{
	FileAppend, % Arrayed%A_Index% "`n", C:\Users\%A_Username%\Desktop\Stats.ini
	StatsAdded++
	}
else
	StatsNotAdded++
}
MsgBox, %StatsAdded% files added to Stats.ini. %StatsNotAdded% not added.
return

list_files(Directory)
{
	files =
	Loop H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\*.*    ;
	{
		files = %files%`n%A_LoopFileFullPath%
	}
	return files
}
;FileRead, StatsData, C:\Users\%A_Username%\Desktop\Stats.ini
;Sleep 100
;StringSplit, StatsSplit, StatsData, `n

