#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, Force
;				              Control + J to run GrabPeeps subroutine.
formattime, Today, ,MM.dd.yyyy
formattime, ThisHour, , htt
Menu, Tray, Icon, ddores.dll , 52

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
User12 = lara.hamdan        ; or maybe lara.anabtawi      
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
User27 = jessica.egigian     ; or maybe Jessica.George
User28 = aimee.kazan
User29 = Cynthia.Hupper
User30 = kealani.aguon
User31 = eric.olson
User32 = diana.cruz
User33 = devin.vink
User34 = jacqueline.mendoza
User35 = judy.buenrostro
User36 = leah.ford
User37 = maya.gutierrez
User38 = doug.watson
User39 = zachary.galligan
User40 = Allyson.Roach
User41 = Sabrina.Kellogg     ; or maybe Sabrina.Fleming
User42 = nathalie.driggers
User43 = daenna.thomas
User44 = Caitlyn.Wolfe
User45 = tony.do
User46 = daryl.gurden
User47 = gustavo.lopez
User48 = shannon.burns
User49 = jennifer.daily
User50 = valerie.jones


;                   When adding a new user, uncomment the next one, 
;                   the corresponding gosub on Lines ~141.
;                   and the subroutine Line ~303.
global TotalUsers = 50   ; Update this for Loops below.
;                   Uncomment the number of users in TotalUsers
Dropdown  = %User1%|%User2%|%User3%|%User4%|%User5%|%User6%|%User7%|%User8%|%User9%|%User10%|%User11%|%User12%|%User13%|%User14%|%User15%|%User16%|%User17%|%User18%|%User19%|%User20%|%User21%|%User22%|%User23%|%User24%|%User25%|%User26%|%User27%|%User28%|%User29%|%User30%|%User31%|%User32%|%User33%|%User34%|%User35%|%User36%|%User37%|%User38%|%User39%|%User40%|%User41%|%User42%|%User43%|%User44%|%User45%|%User46%|%User47%|%User48%|%User49%|%User50%
Dropdown2 = Keystrokes|DateShortcut|SysSwitch|ExcelHLink|CalExtend|CopyAction|PasteAction|SuggestRemarks|ClientCodeIE|AttyFinder|EFSCertFinder|EFSFill|EFSLogin|AHotCornerBL|AHotCornerTR|AHotCornerBR|WorkspaceOpener

Gui, New, , Analytics
Gui, Add, Tab3, w200 h370 +Center, Combined|Individual|Rankings;
Gui, Add, Button, x12  y29 w45 gCancel , Exit
Gui, Add, Button, x61  y29 w45 gData   , Data
Gui, Add, Button, x111 y29 w45 gArchive, Archive
Gui, Add, Button, x160 y29 w45 gRefresh, Refresh
Gui, Add, ListView, R36 Sort Grid x12 y53 w218 h335 vListViewCombined, Total Actions|Total Uses
Gui, Tab, 2
Gui, Add, DropDownList, gIndivStats AltSubmit Center x13 y29 w133 vUserNumber, %Dropdown%  ; See Line 61 for details.
Gui, Add, Button, x160 y29 w45 gHourly, Hourly
Gui, Add, ListView, R36 Sort Grid x12 y53 w218 h335 vListViewIndiv, Action|Uses|Version
Gui, Tab, 3
Gui, Add, DropDownList, gRankings Center x13 y29 w133 vRankings, %Dropdown2%  ; See Line 61 for details.
Gui, Add, ListView, R36 Sort Grid x12 y53 w218 h335 vListViewRank, User|Uses|`%|Version
Gui, Show, w218 h380
RefreshStats()
return

Hourly:
Gui, 2:New, ,Hourly Stats
Gui, 2:Add, Tab3, w200 h370 +Center, Combined|Individual
Gui, 2:Add, Edit, Center x13 y29 w70 vStatDate, %Today%
Gui, 2:Add, DropDownList, gRefreshH Center x90 y29 w55 vStatTime, 4AM|5AM|6AM|7AM|8AM|9AM|10AM|11AM|12PM||1PM|2PM|3PM|4PM|5PM|6PM|7PM|8PM|9PM|10PM
Gui, 2:Add, ListView, R36 Sort Grid x12 y53 w218 h335 vListViewHourlyCombined, Action|Uses|Version
Gui, 2:Add, Button, gRefresh3 x150 y28 w55, Refresh
Gui, Tab, 2
Gui, 2:Add, Edit, Center x13 y29 w70 vStatDateI, %Today%
Gui, 2:Add, DropDownList, Center x90 y29 w55 vStatTimeI, 4AM|5AM|6AM|7AM|8AM|9AM|10AM|11AM|12PM||1PM|2PM|3PM|4PM|5PM|6PM|7PM|8PM|9PM|10PM
Gui, 2:Add, DropDownList, gRefresh5 AltSubmit Center x13 y53 w133 vUserNumber, %Dropdown%  ; See Line 61 for details.
Gui, 2:Add, Button, gRefresh4 x150 y28 w55, Refresh
Gui, 2:Add, Button, gExport x150 y52 w55, Export
Gui, 2:Add, ListView, R36 Sort Grid x12 y75 w218 h335 vListViewHourlyIndiv, Action|Uses|Version
Gui, 2:Show, w218 h380
return

Export:
MsgBox, Not implemented yet...
return

RefreshH:
Refresh3:
global StatDate
global StatTime
Gui, Submit, NoHide
GrabHourly()
gosub CombinedHourlyStats
return

Refresh4:
Refresh5:
global StatDateI
global StatTimeI
Gui, Submit, NoHide
gosub IndivHourlyStats
return

GrabHourly()
{
global KeystrokesHTotals        = 0
global DateShortcutHTotals      = 0
global SysSwitchHTotals         = 0
global ExcelHLinkHTotals        = 0
global EFSCertFinderHTotals     = 0
global CopyActionHTotals        = 0
global PasteActionHTotals       = 0
global SuggestRemarksHTotals    = 0
global ClientCodeIEHTotals      = 0
global AttyFinderHTotals        = 0
global CalExtendHTotals         = 0
global EFSFillHTotals           = 0
global EFSLoginHTotals          = 0
global AHotCornerBLHTotals      = 0
global AHotCornerTRHTotals      = 0
global AHotCornerBRHTotals      = 0
global WorkspaceOpenerHTotals   = 0

Loop %TotalUsers%
	{
IniRead, KeystrokesH%A_Index%,    % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, Keystrokes
IniRead, DateShortcutH%A_Index%,  % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, DateShortcut
IniRead, AttyFinderH%A_Index%,    % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, AttyFinder
IniRead, CalExtendH%A_Index%,     % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, CalExtend
IniRead, SysSwitchH%A_Index%,     % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, SysSwitch
IniRead, ExcelHLinkH%A_Index%,    % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, ExcelHLink
IniRead, EFSCertFinderH%A_Index%, % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, EFSCertFinder
IniRead, CopyActionH%A_Index%,    % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, CopyAction
IniRead, PasteActionH%A_Index%,   % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, PasteAction
IniRead, SuggestRemarksH%A_Index%,% "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, SuggestRemarks
IniRead, ClientCodeIEH%A_Index%,  % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, ClientCodeIE
IniRead, EFSFillH%A_Index%,       % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, EFSFill
IniRead, EFSLoginH%A_Index%,      % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, EFSLogin
IniRead, AHotCornerBLH%A_Index%,  % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, AHotCornerBL	
IniRead, AHotCornerTRH%A_Index%,  % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, AHotCornerTR	
IniRead, AHotCornerBRH%A_Index%,  % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, AHotCornerBR	
IniRead, WorkspaceOpenerH%A_Index%,  % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, WorkspaceOpener	
IniRead, VersionH%A_Index%,       % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Version, Version


if KeystrokesH%A_Index% = ERROR
	KeystrokesH%A_Index% = 0
if DateShortcutH%A_Index% = ERROR
	DateShortcutH%A_Index% = 0
if AttyFinderH%A_Index% = ERROR
	AttyFinderH%A_Index% = 0
if CalExtendH%A_Index% = ERROR
	CalExtendH%A_Index% = 0
if SysSwitchH%A_Index% = ERROR    
	SysSwitchH%A_Index% = 0    
if ExcelHLinkH%A_Index% = ERROR
	ExcelHLinkH%A_Index% = 0
if EFSCertFinderH%A_Index% = ERROR
	EFSCertFinderH%A_Index% = 0
if CopyActionH%A_Index% = ERROR
	CopyActionH%A_Index% = 0
if PasteActionH%A_Index% = ERROR
	PasteActionH%A_Index% = 0
if SuggestRemarksH%A_Index% = ERROR
	SuggestRemarksH%A_Index% = 0
if ClientCodeIEH%A_Index% = ERROR
	ClientCodeIEH%A_Index% = 0
if EFSFillH%A_Index% = ERROR
	EFSFillH%A_Index% = 0
if EFSLoginH%A_Index% = ERROR
	EFSLoginH%A_Index% = 0
if AHotCornerBLH%A_Index% = ERROR
	AHotCornerBLH%A_Index% = 0
if AHotCornerTRH%A_Index% = ERROR
	AHotCornerTRH%A_Index% = 0
if AHotCornerBRH%A_Index% = ERROR
	AHotCornerBRH%A_Index% = 0
if WorkspaceOpenerH%A_Index% = ERROR
	WorkspaceOpenerH%A_Index% = 0
	
	
KeystrokesHTotals+=KeystrokesH%A_Index%
DateShortcutHTotals+=DateShortcutH%A_Index%
AttyFinderHTotals+=AttyFinderH%A_Index%
CalExtendHTotals+=CalExtendH%A_Index%
SysSwitchHTotals+=SysSwitchH%A_Index%
ExcelHLinkHTotals+=ExcelHLinkH%A_Index%
EFSCertFinderHTotals+=EFSCertFinderH%A_Index%
CopyActionHTotals+=CopyActionH%A_Index%
PasteActionHTotals+=PasteActionH%A_Index%
SuggestRemarksHTotals+=SuggestRemarksH%A_Index%
ClientCodeIEHTotals+=ClientCodeIEH%A_Index%
EFSFillHTotals+=EFSFillH%A_Index%
EFSLoginHTotals+=EFSLoginH%A_Index%
AHotCornerBLHTotals+=AHotCornerBLH%A_Index%
AHotCornerTRHTotals+=AHotCornerTRH%A_Index%
AHotCornerBRHTotals+=AHotCornerBRH%A_Index%	
WorkspaceOpenerHTotals+=WorkspaceOpenerH%A_Index%
;MsgBox, % StatDate " `n " StatTime " `n " User%A_Index% " `n " KeystrokesH%A_Index% " `n " DateShortcutH%A_Index% " `n " AttyFinderH%A_Index% " `n " CalExtendH%A_Index% " `n " SysSwitchH%A_Index% " `n " ExcelHLinkH%A_Index% " `n " EFSCertFinderH%A_Index% " `n " CopyActionH%A_Index% " `n " PasteActionH%A_Index% " `n " SuggestRemarksH%A_Index% " `n " ClientCodeIEH%A_Index% " `n " EFSFillH%A_Index% " `n " EFSLoginH%A_Index% " `n " KeystrokesHTotals " `n " DateShortcutHTotals " `n " AttyFinderHTotals " `n " CalExtendHTotals " `n " SysSwitchHTotals " `n " ExcelHLinkHTotals " `n " EFSCertFinderHTotals " `n " CopyActionHTotals " `n " PasteActionHTotals " `n " SuggestRemarksHTotals " `n " ClientCodeIEHTotals " `n " EFSFillHTotals " `n " EFSLoginHTotals
}
return
}

RefreshStats()
{
global KeystrokesTotals     = 0
global DateShortcutTotals   = 0
global SysSwitchTotals      = 0
global ExcelHLinkTotals     = 0
global EFSCertFinderTotals  = 0
global CopyActionTotals     = 0
global PasteActionTotals    = 0
global SuggestRemarksTotals = 0
global ClientCodeIETotals   = 0
global AttyFinderTotals     = 0
global CalExtendTotals      = 0
global EFSFillTotals        = 0
global EFSLoginTotals       = 0
global AHotCornerBLTotals  = 0
global AHotCornerTRTotals  = 0
global AHotCornerBRTotals  = 0
global WorkspaceOpenerTotals  = 0
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
gosub UserData28
gosub UserData29
gosub UserData30
gosub UserData31
gosub UserData32
gosub UserData33
gosub UserData34
gosub UserData35
gosub UserData36
gosub UserData37
gosub UserData38
gosub UserData39
gosub UserData40
gosub UserData41
gosub UserData42
gosub UserData43
gosub UserData44
gosub UserData45
gosub UserData46
gosub UserData47
gosub UserData48
gosub UserData49
gosub UserData50
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
EFSLoginTotals+=EFSLogin%A_Index%
EFSLoginHTotals+=EFSLoginH%A_Index%
AHotCornerBLTotals+=AHotCornerBL%A_Index%
AHotCornerTRTotals+=AHotCornerTR%A_Index%
AHotCornerBRTotals+=AHotCornerBR%A_Index%	
WorkspaceOpenerTotals+=WorkspaceOpener%A_Index%
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
IniWrite, %EFSLoginTotals%,        C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSLogin
IniWrite, %AHotCornerBLTotals%,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAHotCornerBLTotals
IniWrite, %AHotCornerTRTotals%,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAHotCornerTRTotals
IniWrite, %AHotCornerBRTotals%,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAHotCornerBRTotals
IniWrite, %WorkspaceOpenerTotals%,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupWorkspaceOpenerTotals
Sleep 200
gosub CombinedStats
gosub IndivStats
gosub Rankings
return
}

CombinedStats:
Gui, Submit, NoHide
IniRead, KeystrokesTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupKeystrokes
IniRead, DateShortcutTotals,  C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupDateShortcut
IniRead, AttyFinderTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAttyFinder
IniRead, CalExtendTotals,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCalExtend
IniRead, SysSwitchTotals,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSysSwitch
IniRead, ExcelHLinkTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupExcelHLink
IniRead, EFSCertFinderTotals, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSCertFinder
IniRead, CopyActionTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCopyAction
IniRead, PasteActionTotals,   C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupPasteAction
IniRead, SuggestRemarksTotals,C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSuggestRemarks
IniRead, ClientCodeIETotals,  C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupClientCodeIE
IniRead, EFSFillTotals,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSFill
IniRead, EFSLoginTotals,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSLogin
IniRead, AHotCornerBLTotals,  C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAHotCornerBLTotals
IniRead, AHotCornerTRTotals,  C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAHotCornerTRTotals
IniRead, AHotCornerBRTotals,  C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAHotCornerBRTotals
IniRead, WorkspaceOpenerTotals,  C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupWorkspaceOpenerTotals

Gui, ListView, ListViewCombined
LV_Delete()
LV_Add( ,"Total Keystrokes", KeystrokesTotals )
LV_Add( ,"Total DateShortcut", DateShortcutTotals )
LV_Add( ,"Total SysSwitch", SysSwitchTotals )
LV_Add( ,"Total ExcelHLink", ExcelHLinkTotals )
LV_Add( ,"Total CalExtend", CalExtendTotals )
LV_Add( ,"Total CopyAction", CopyActionTotals )
LV_Add( ,"Total PasteAction", PasteActionTotals )
LV_Add( ,"Total SuggestRemarks", SuggestRemarksTotals )
LV_Add( ,"Total ClientCodeIE", ClientCodeIETotals )
LV_Add( ,"Total AttyFinder", AttyFinderTotals )
LV_Add( ,"Total EFSCertFinder", EFSCertFinderTotals )
LV_Add( ,"Total EFSFill", EFSFillTotals )
LV_Add( ,"Total EFSLogin", EFSLoginTotals )
LV_Add( ,"Total HotCornerBL", AHotCornerBLTotals )
LV_Add( ,"Total HotCornerTR", AHotCornerTRTotals )
LV_Add( ,"Total HotCornerBR", AHotCornerBRTotals )
LV_Add( ,"Total WorkspaceOpener", WorkspaceOpenerTotals )
LV_ModifyCol()
LV_ModifyCol(2, "Integer")
LV_ModifyCol(2, "SortDesc")
return

CombinedHourlyStats:
Gui, Submit, NoHide
Gui, ListView, ListViewHourlyCombined
LV_Delete()
LV_Add( ,"Total Keystrokes", KeystrokesHTotals )
LV_Add( ,"Total DateShortcut", DateShortcutHTotals )
LV_Add( ,"Total SysSwitch", SysSwitchHTotals )
LV_Add( ,"Total ExcelHLink", ExcelHLinkHTotals )
LV_Add( ,"Total CalExtend", CalExtendHTotals )
LV_Add( ,"Total CopyAction", CopyActionHTotals )
LV_Add( ,"Total PasteAction", PasteActionHTotals )
LV_Add( ,"Total SuggestRemarks", SuggestRemarksHTotals )
LV_Add( ,"Total ClientCodeIE", ClientCodeIEHTotals )
LV_Add( ,"Total AttyFinder", AttyFinderHTotals )
LV_Add( ,"Total EFSCertFinder", EFSCertFinderHTotals )
LV_Add( ,"Total EFSFill", EFSFillHTotals )
LV_Add( ,"Total EFSLogin", EFSLoginHTotals )
LV_Add( ,"Total HotCornerBL", AHotCornerBLHTotals )
LV_Add( ,"Total HotCornerTR", AHotCornerTRHTotals )
LV_Add( ,"Total HotCornerBR", AHotCornerBRHTotals )
LV_Add( ,"Total WorkspaceOpener", WorkspaceOpenerHTotals )
LV_ModifyCol()
LV_ModifyCol(2, "Integer")
LV_ModifyCol(2, "SortDesc")
return

IndivStats:
Gui, Submit, NoHide
Gui, ListView, ListViewIndiv
LV_Delete()
LV_Add( ,"Keystrokes", Keystrokes%UserNumber%, Version%UserNumber%)
LV_Add( ,"DateShortcut", DateShortcut%UserNumber% )
LV_Add( ,"SysSwitch", SysSwitch%UserNumber% )
LV_Add( ,"ExcelHLink", ExcelHLink%UserNumber% )
LV_Add( ,"CalExtend", CalExtend%UserNumber% )
LV_Add( ,"CopyAction", CopyAction%UserNumber% )
LV_Add( ,"PasteAction", PasteAction%UserNumber% )
LV_Add( ,"SuggestRemarks", SuggestRemarks%UserNumber% )
LV_Add( ,"ClientCodeIE", ClientCodeIE%UserNumber% )
LV_Add( ,"AttyFinder", AttyFinder%UserNumber% )
LV_Add( ,"EFSCertFinder", EFSCertFinder%UserNumber% )
LV_Add( ,"EFSFill", EFSFill%UserNumber% )
LV_Add( ,"EFSLogin", EFSLogin%UserNumber% )
LV_Add( ,"HotCornerBL", AHotCornerBL%UserNumber% )
LV_Add( ,"HotCornerTR", AHotCornerTR%UserNumber% )
LV_Add( ,"HotCornerBR", AHotCornerBR%UserNumber% )
LV_Add( ,"WorkspaceOpener", WorkspaceOpener%UserNumber% )
LV_ModifyCol()
LV_ModifyCol(2, "Integer")
LV_ModifyCol(2, "SortDesc")
return

IndivHourlyStats:
Gui, Submit, NoHide
IniRead, KeystrokesI%UserNumber%,    % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, Keystrokes
IniRead, DateShortcutI%UserNumber%,  % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, DateShortcut
IniRead, AttyFinderI%UserNumber%,    % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, AttyFinder
IniRead, CalExtendI%UserNumber%,     % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, CalExtend
IniRead, SysSwitchI%UserNumber%,     % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, SysSwitch
IniRead, ExcelHLinkI%UserNumber%,    % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, ExcelHLink
IniRead, EFSCertFinderI%UserNumber%, % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, EFSCertFinder
IniRead, CopyActionI%UserNumber%,    % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, CopyAction
IniRead, PasteActionI%UserNumber%,   % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, PasteAction
IniRead, SuggestRemarksI%UserNumber%,% "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, SuggestRemarks
IniRead, ClientCodeIEI%UserNumber%,  % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, ClientCodeIE
IniRead, EFSFillI%UserNumber%,       % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, EFSFill
IniRead, EFSLoginI%UserNumber%,      % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, EFSLogin
IniRead, VersionI%UserNumber%,       % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Version, Version	
IniRead, AHotCornerBLI%UserNumber%,   % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, AHotCornerBL
IniRead, AHotCornerTRI%UserNumber%,   % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, AHotCornerTR
IniRead, AHotCornerBRI%UserNumber%,   % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, AHotCornerBR
IniRead, WorkspaceOpenerI%UserNumber%,   % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, WorkspaceOpener


if KeystrokesI%UserNumber% = ERROR
	KeystrokesI%UserNumber% = 0
if DateShortcutI%UserNumber% = ERROR
	DateShortcutI%UserNumber% = 0
if AttyFinderI%UserNumber% = ERROR
	AttyFinderI%UserNumber% = 0
if CalExtendI%UserNumber% = ERROR
	CalExtendI%UserNumber% = 0
if SysSwitchI%UserNumber% = ERROR    
	SysSwitchI%UserNumber% = 0    
if ExcelHLinkI%UserNumber% = ERROR
	ExcelHLinkI%UserNumber% = 0
if EFSCertFinderI%UserNumber% = ERROR
	EFSCertFinderI%UserNumber% = 0
if CopyActionI%UserNumber% = ERROR
	CopyActionI%UserNumber% = 0
if PasteActionI%UserNumber% = ERROR
	PasteActionI%UserNumber% = 0
if SuggestRemarksI%UserNumber% = ERROR
	SuggestRemarksI%UserNumber% = 0
if ClientCodeIEI%UserNumber% = ERROR
	ClientCodeIEI%UserNumber% = 0
if EFSFillI%UserNumber% = ERROR
	EFSFillI%UserNumber% = 0
if EFSLoginI%UserNumber% = ERROR
	EFSLoginI%UserNumber% = 0
if AHotCornerBLI%UserNumber% = ERROR
	AHotCornerBLI%UserNumber% = 0
if AHotCornerTRI%UserNumber% = ERROR
	AHotCornerTRI%UserNumber% = 0
if AHotCornerBRI%UserNumber% = ERROR
	AHotCornerBRI%UserNumber% = 0
if WorkspaceOpenerI%UserNumber% = ERROR
	WorkspaceOpenerI%UserNumber% = 0
	
Gui, ListView, ListViewHourlyIndiv
LV_Delete()
LV_Add( ,"Keystrokes", KeystrokesI%UserNumber%, Version%UserNumber%)
LV_Add( ,"DateShortcut", DateShortcutI%UserNumber% )
LV_Add( ,"SysSwitch", SysSwitchI%UserNumber% )
LV_Add( ,"ExcelHLink", ExcelHLinkI%UserNumber% )
LV_Add( ,"CalExtend", CalExtendI%UserNumber% )
LV_Add( ,"CopyAction", CopyActionI%UserNumber% )
LV_Add( ,"PasteAction", PasteActionI%UserNumber% )
LV_Add( ,"SuggestRemarks", SuggestRemarksI%UserNumber% )
LV_Add( ,"ClientCodeIE", ClientCodeIEI%UserNumber% )
LV_Add( ,"AttyFinder", AttyFinderI%UserNumber% )
LV_Add( ,"EFSCertFinder", EFSCertFinderI%UserNumber% )
LV_Add( ,"EFSFill", EFSFillI%UserNumber% )
LV_Add( ,"EFSLogin", EFSLoginI%UserNumber% )
LV_Add( ,"HotCornerBL", AHotCornerBLI%UserNumber% )
LV_Add( ,"HotCornerTR", AHotCornerTRI%UserNumber% )
LV_Add( ,"HotCornerBR", AHotCornerBRI%UserNumber% )
LV_Add( ,"WorkspaceOpener", WorkspaceOpenerI%UserNumber% )
LV_ModifyCol()
LV_ModifyCol(2, "Integer")
LV_ModifyCol(2, "SortDesc")
return

Rankings:
Gui, Submit, NoHide
Gui, ListView, ListViewRank
LV_Delete()

Loop, %TotalUsers%
{
LV_Add("", User%A_Index%, %Rankings%%A_Index%, %Rankings%%A_Index% / (%Rankings%Totals) * 100 ,Version%A_Index% )
}
LV_ModifyCol()
LV_ModifyCol(2, "Integer")
LV_ModifyCol(2, "SortDesc")
LV_ModifyCol(3, "Integer")
return

Archive:
FileCreateDir, C:\Users\%A_Username%\Desktop\AHK Back-up\                                             ;Creates new folder on the desktop.
Sleep 5000
FileCopy, C:\Users\%A_Username%\Desktop\*.ahk, C:\Users\%A_Username%\Desktop\AHK Back-up              ;Copies all .ahk files from the Desktop.
Sleep 1000
FileCopy, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\*.ini, C:\Users\%A_Username%\Desktop\AHK Back-up ; Copies all user .ini files from H: drive
Sleep 1000
FileCopy, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\*.png, C:\Users\%A_Username%\Desktop\AHK Back-up ; Copies all HelpImages .png files from H: drive
Sleep 1000
FileCopy, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\*.ini, C:\Users\%A_Username%\Desktop\AHK Back-up ; Copies all function .ini files from H: drive
Sleep 1000
FileCopy, H:\Docketing\AutoHotKey\AHK Instructions.docx, C:\Users\%A_Username%\Desktop\AHK Back-up    ; Copies the current AHK Instructions.docx.
Sleep 1000
FileCopy, C:\Users\%A_Username%\Desktop\AHK Masters\*.ahk, C:\Users\%A_Username%\Desktop\AHK Back-up  ; Copies all current Master .ahk files.
Sleep 1000
FileCopy, C:\Users\%A_Username%\Desktop\AHK Masters\Atty Phone Numbers.xlsx, C:\Users\%A_Username%\Desktop\AHK Back-up  ; Copies Atty Phone Number.xlsx.
Sleep 1000
FileCopy, C:\Users\%A_Username%\Desktop\Sorta Dead AHK Scripts, C:\Users\%A_Username%\Desktop\AHK Back-up  ; Copies Sorta Dead AHK Scripts
Sleep 1000
FileCopy, C:\Users\%A_Username%\Desktop\AHK Games, C:\Users\%A_Username%\Desktop\AHK Back-up  ; Copies AHK Games
Sleep 1000
FileCopy, C:\Users\%A_Username%\Desktop\Pending AHK Scripts, C:\Users\%A_Username%\Desktop\AHK Back-up  ; Copies Pending AHK Scripts
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
Refresh2:
Gui, Submit, NoHide
RefreshStats()
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
IniRead, EFSLogin1,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, EFSLogin
IniRead, Version1,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Version, Version
IniRead, AHotcornerBL1,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR1,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR1,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener1,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User1%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin2,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, EFSLogin
IniRead, Version2,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Version, Version
IniRead, AHotcornerBL2,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR2,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR2,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener2,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User2%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin3,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, EFSLogin
IniRead, Version3,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Version, Version
IniRead, AHotcornerBL3,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR3,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR3,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener3,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User3%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin4,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, EFSLogin
IniRead, Version4,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Version, Version
IniRead, AHotcornerBL4,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR4,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR4,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener4,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User4%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin5,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, EFSLogin
IniRead, Version5,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Version, Version
IniRead, AHotcornerBL5,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR5,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR5,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener5,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User5%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin6,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, EFSLogin
IniRead, Version6,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Version, Version
IniRead, AHotcornerBL6,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR6,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR6,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener6,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User6%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin7,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, EFSLogin
IniRead, Version7,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Version, Version
IniRead, AHotcornerBL7,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR7,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR7,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener7,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User7%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin8,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, EFSLogin
IniRead, Version8,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Version, Version
IniRead, AHotcornerBL8,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR8,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR8,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener8,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User8%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin9,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, EFSLogin
IniRead, Version9,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Version, Version
IniRead, AHotcornerBL9,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR9,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR9,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener9,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User9%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin10,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, EFSLogin
IniRead, Version10,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Version, Version
IniRead, AHotcornerBL10,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR10,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR10,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener10,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User10%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin11,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, EFSLogin
IniRead, Version11,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Version, Version
IniRead, AHotcornerBL11,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR11,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR11,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener11,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User11%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin12,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, EFSLogin
IniRead, Version12,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Version, Version
IniRead, AHotcornerBL12,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR12,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR12,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener12,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User12%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin13,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, EFSLogin
IniRead, Version13,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Version, Version
IniRead, AHotcornerBL13,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR13,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR13,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener13,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User13%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin14,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, EFSLogin
IniRead, Version14,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Version, Version
IniRead, AHotcornerBL14,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR14,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR14,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener14,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User14%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin15,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, EFSLogin
IniRead, Version15,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Version, Version
IniRead, AHotcornerBL15,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR15,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR15,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener15,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User15%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin16,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, EFSLogin
IniRead, Version16,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Version, Version
IniRead, AHotcornerBL16,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR16,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR16,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener16,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User16%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin17,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, EFSLogin
IniRead, Version17,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Version, Version
IniRead, AHotcornerBL17,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR17,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR17,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener17,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User17%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin18,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, EFSLogin
IniRead, Version18,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Version, Version
IniRead, AHotcornerBL18,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR18,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR18,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener18,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User18%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin19,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, EFSLogin
IniRead, Version19,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Version, Version
IniRead, AHotcornerBL19,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR19,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR19,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener19,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User19%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin20,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, EFSLogin
IniRead, Version20,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Version, Version
IniRead, AHotcornerBL20,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR20,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR20,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener20,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User20%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin21,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, EFSLogin
IniRead, Version21,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Version, Version
IniRead, AHotcornerBL21,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR21,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR21,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener21,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User21%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin22,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, EFSLogin
IniRead, Version22,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Version, Version
IniRead, AHotcornerBL22,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR22,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR22,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener22,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User22%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin23,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, EFSLogin
IniRead, Version23,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Version, Version
IniRead, AHotcornerBL23,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR23,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR23,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener23,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User23%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin24,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, EFSLogin
IniRead, Version24,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Version, Version
IniRead, AHotcornerBL24,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR24,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR24,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener24,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User24%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin25,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, EFSLogin
IniRead, Version25,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Version, Version
IniRead, AHotcornerBL25,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR25,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR25,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener25,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User25%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin26,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, EFSLogin
IniRead, Version26,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini,Version, Version
IniRead, AHotcornerBL26,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR26,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR26,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener26,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User26%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin27,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, EFSLogin
IniRead, Version27,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Version, Version
IniRead, AHotcornerBL27,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR27,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR27,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener27,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User27%.ini, Achievements, WorkspaceOpener
return

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
IniRead, EFSLogin28,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, EFSLogin
IniRead, Version28,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Version, Version
IniRead, AHotcornerBL28,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR28,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR28,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener28,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User28%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin29,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, EFSLogin
IniRead, Version29,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Version, Version
IniRead, AHotcornerBL29,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR29,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR29,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener29,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User29%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin30,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, EFSLogin
IniRead, Version30,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Version, Version
IniRead, AHotcornerBL30,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR30,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR30,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener30,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User30%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin31,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, EFSLogin
IniRead, Version31,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Version, Version
IniRead, AHotcornerBL31,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR31,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR31,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener31,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User31%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin32,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, EFSLogin
IniRead, Version32,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Version, Version
IniRead, AHotcornerBL32,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR32,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR32,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener32,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User32%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin33,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, EFSLogin
IniRead, Version33,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Version, Version
IniRead, AHotcornerBL33,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR33,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR33,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener33,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User33%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin34,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, EFSLogin
IniRead, Version34,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Version, Version
IniRead, AHotcornerBL34,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR34,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR34,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener34,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User34%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin35,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, EFSLogin
IniRead, Version35,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Version, Version
IniRead, AHotcornerBL35,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR35,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR35,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener35,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User35%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin36,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, EFSLogin
IniRead, Version36,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Version, Version
IniRead, AHotcornerBL36,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR36,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR36,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener36,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User36%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin37,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, EFSLogin
IniRead, Version37,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Version, Version
IniRead, AHotcornerBL37,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR37,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR37,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener37,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User37%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin38,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, EFSLogin
IniRead, Version38,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Version, Version
IniRead, AHotcornerBL38,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR38,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR38,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener38,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User38%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin39,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, EFSLogin
IniRead, Version39,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Version, Version
IniRead, AHotcornerBL39,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR39,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR39,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener39,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User39%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin40,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, EFSLogin
IniRead, Version40,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Version, Version
IniRead, AHotcornerBL40,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR40,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR40,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener40,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User40%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin41,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, EFSLogin
IniRead, Version41,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Version, Version
IniRead, AHotcornerBL41,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR41,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR41,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener41,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User41%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin42,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, EFSLogin
IniRead, Version42,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Version, Version
IniRead, AHotcornerBL42,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR42,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR42,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener42,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User42%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin43,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, EFSLogin
IniRead, Version43,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Version, Version
IniRead, AHotcornerBL43,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR43,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR43,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener43,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User43%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin44,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, EFSLogin
IniRead, Version44,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Version, Version
IniRead, AHotcornerBL44,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR44,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR44,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener44,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User44%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin45,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, EFSLogin
IniRead, Version45,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Version, Version
IniRead, AHotcornerBL45,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR45,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR45,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener45,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User45%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin46,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, EFSLogin
IniRead, Version46,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Version, Version
IniRead, AHotcornerBL46,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR46,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR46,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener46,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User46%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin47,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, EFSLogin
IniRead, Version47,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Version, Version
IniRead, AHotcornerBL47,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR47,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR47,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener47,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User47%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin48,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, EFSLogin
IniRead, Version48,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Version, Version
IniRead, AHotcornerBL48,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR48,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR48,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener48,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User48%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin49,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, EFSLogin
IniRead, Version49,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Version, Version
IniRead, AHotcornerBL49,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR49,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR49,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener49,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User49%.ini, Achievements, WorkspaceOpener
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
IniRead, EFSLogin50,      H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, EFSLogin
IniRead, Version50,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Version, Version
IniRead, AHotcornerBL50,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, AHotcornerBL
IniRead, AHotcornerTR50,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, AHotcornerTR
IniRead, AHotcornerBR50,       H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, AHotcornerBR
IniRead, WorkspaceOpener50,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%User50%.ini, Achievements, WorkspaceOpener
return



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

