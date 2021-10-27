#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, Force
;				              Control + J to run GrabPeeps subroutine.
formattime, Today, ,MM.dd.yyyy
formattime, ThisHour, , htt
Menu, Tray, Icon, ddores.dll , 52

User1 = adriana.perez
User2 = aimee.kazan
User3 = Allyson.Roach
User4 = angel.zehnder      
User5 = anthony.bonilla
User6 = anthony.pineda     
User7 = Caitlyn.Wolfe
User8 = Chelsea.Burdeno    ; or Chelsea.Veinot
User9 = cher.lancaster     
User10 = christina.graul
User11 = Cynthia.Hupper
User12 = daenna.thomas
User13 = Daniela.lopez      
User14 = Danika.Gregory
User15 = daryl.gurden
User16 = devin.vink
User17 = diana.cruz
User18 = doug.watson
User19 = eddie.monroy       
User20 = eric.olson
User21 = gustavo.lopez
User22 = heather.obrien     
User23 = Heide.Young        
User24 = Imran.Ahmed
User25 = jacqueline.mendoza
User26 = jason.finn         
User27 = jennifer.daily
User28 = jennifer.neat
User29 = jessica.egigian     ; or maybe Jessica.George
User30 = judy.buenrostro
User31 = kealani.aguon
User32 = kevin.kraus        
User33 = lara.hamdan        ; or maybe lara.anabtawi      
User34 = leah.ford
User35 = Long.Dang          
User36 = maya.gutierrez
User37 = nathalie.driggers
User38 = Neysa.perkins      ; or maybe Neysa.cabudol
User39 = nick.lamb      
User40 = paul.traska    
User41 = shannon.burns
User42 = tamara.dumas
User43 = ThuyQuyen.Nguyen   
User44 = tony.do
User45 = tyler.dickson      
User46 = valerie.jones
User47 = xiomara.raymundo   
User48 = zachary.galligan
User49 = Arlene.Tjoarman
User50 = Sabrina.Kellogg   ; or maybe Sabrina.Fleming
User51 = Ashley.Reed
User52 = Amy.Durrant
User53 = zughey.salcido
User54 = fabiola.esmerio
User55 = sandra.autry

global TotalUsers = 55
;                   Update this for Loops below.
;                   When adding a new user, uncomment the next one, 
;                   the corresponding gosub on Lines ~141.
;                   and the subroutine Line ~303.
;                   Uncomment the number of users in TotalUsers

Dropdown  = %User1%|%User2%|%User3%|%User4%|%User5%|%User6%|%User7%|%User8%|%User9%|%User10%|%User11%|%User12%|%User13%|%User14%|%User15%|%User16%|%User17%|%User18%|%User19%|%User20%|%User21%|%User22%|%User23%|%User24%|%User25%|%User26%|%User27%|%User28%|%User29%|%User30%|%User31%|%User32%|%User33%|%User34%|%User35%|%User36%|%User37%|%User38%|%User39%|%User40%|%User41%|%User42%|%User43%|%User44%|%User45%|%User46%|%User47%|%User48%|%User49%|%User50%|%User51%|%User52%|%User53%|%User54%|%User55%
Dropdown2 = Keystrokes|DateShortcut|SysSwitch|ExcelHLink|CalExtend|CopyAction|PasteAction|SuggestRemarks|ClientCodeIE|AttyFinder|EFSCertFinder|EFSFill|EFSLogin|AHotCornerBL|AHotCornerTR|AHotCornerBR|WorkspaceOpener|DoubleTap|FKeysInjector|WoWbar|IndivFacingEmailer

Gui, New, , Analytics
Gui, Add, Tab3, w200 h370 +Center, Combined|Individual|Rankings;
Gui, Add, Button, x12  y29 w45 gCancel , Exit
Gui, Add, Button, x61  y29 w45 gData   , Data
Gui, Add, Button, x111 y29 w45 gArchive, Archive
Gui, Add, Button, x160 y29 w45 gRefresh, Refresh
Gui, Add, ListView, R37 Sort Grid x12 y53 w218 h320 vListViewCombined, Total Actions|Total Uses
Gui, Tab, 2
Gui, Add, DropDownList, gIndivStats AltSubmit Center x13 y29 w133 vUserNumber, %Dropdown%  ; See Line 61 for details.
Gui, Add, Button, x160 y29 w45 gHourly, Hourly
Gui, Add, ListView, R37 Sort Grid x12 y53 w218 h320 vListViewIndiv, Action|Uses|Version
Gui, Tab, 3
Gui, Add, DropDownList, gRankings Center x13 y29 w133 vRankings, %Dropdown2%  ; See Line 61 for details.
Gui, Add, ListView, R37 Sort Grid x12 y53 w218 h320 vListViewRank, User|Uses|`%|Version
Gui, Show, w218 h380
RefreshStats()
return

Hourly:
Gui, 2:New, ,Hourly Stats
Gui, 2:Add, Tab3, w200 h370 +Center, Combined|Individual
Gui, 2:Add, Edit, Center x13 y29 w70 vStatDate, %Today%
Gui, 2:Add, DropDownList, gRefreshH Center x90 y29 w55 vStatTime, 4AM|5AM|6AM|7AM|8AM|9AM|10AM|11AM|12PM||1PM|2PM|3PM|4PM|5PM|6PM|7PM|8PM|9PM|10PM
Gui, 2:Add, ListView, R37 Sort Grid x12 y53 w218 h320 vListViewHourlyCombined, Action|Uses|Version
Gui, 2:Add, Button, gRefresh3 x150 y28 w55, Refresh
Gui, Tab, 2
Gui, 2:Add, Edit, Center x13 y29 w70 vStatDateI, %Today%
Gui, 2:Add, DropDownList, Center x90 y29 w55 vStatTimeI, 4AM|5AM|6AM|7AM|8AM|9AM|10AM|11AM|12PM||1PM|2PM|3PM|4PM|5PM|6PM|7PM|8PM|9PM|10PM
Gui, 2:Add, DropDownList, gRefresh5 AltSubmit Center x13 y53 w133 vUserNumber, %Dropdown%  ; See Line 61 for details.
Gui, 2:Add, Button, gRefresh4 x150 y28 w55, Refresh
Gui, 2:Add, Button, gExport x150 y52 w55, Export
Gui, 2:Add, ListView, R37 Sort Grid x12 y75 w218 h320 vListViewHourlyIndiv, Action|Uses|Version
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
IniRead, KeystrokesH%A_Index%,       % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, Keystrokes
IniRead, DateShortcutH%A_Index%,     % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, DateShortcut
IniRead, AttyFinderH%A_Index%,       % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, AttyFinder
IniRead, CalExtendH%A_Index%,        % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, CalExtend
IniRead, SysSwitchH%A_Index%,        % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, SysSwitch
IniRead, ExcelHLinkH%A_Index%,       % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, ExcelHLink
IniRead, EFSCertFinderH%A_Index%,    % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, EFSCertFinder
IniRead, CopyActionH%A_Index%,       % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, CopyAction
IniRead, PasteActionH%A_Index%,      % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, PasteAction
IniRead, SuggestRemarksH%A_Index%,   % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, SuggestRemarks
IniRead, ClientCodeIEH%A_Index%,     % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, ClientCodeIE
IniRead, EFSFillH%A_Index%,          % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, EFSFill
IniRead, EFSLoginH%A_Index%,         % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, EFSLogin
IniRead, AHotCornerBLH%A_Index%,     % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, AHotCornerBL	
IniRead, AHotCornerTRH%A_Index%,     % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, AHotCornerTR	
IniRead, AHotCornerBRH%A_Index%,     % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, AHotCornerBR	
IniRead, WorkspaceOpenerH%A_Index%,  % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Achievements, WorkspaceOpener	
IniRead, VersionH%A_Index%,          % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%A_Index% "-" StatDate "-" StatTime ".ini", Version, Version

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
global DoubleTapTotals = 0
global FKeysInjectorTotals = 0
global WoWbarTotals = 0
global IndivFacingEmailerTotals = 0

gosub UserData
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
DoubleTapTotals+=DoubleTap%A_Index%
FKeysInjectorTotals+=FKeysInjector%A_Index%
WoWbarTotals+=WoWbar%A_Index%
IndivFacingEmailerTotals+=IndivFacingEmailer%A_Index%

}
IniWrite, %KeystrokesTotals%,         C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupKeystrokes
IniWrite, %DateShortcutTotals%,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupDateShortcut
IniWrite, %AttyFinderTotals%,         C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAttyFinder
IniWrite, %CalExtendTotals%,          C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCalExtend
IniWrite, %SysSwitchTotals%,          C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSysSwitch
IniWrite, %ExcelHLinkTotals%,         C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupExcelHLink
IniWrite, %EFSCertFinderTotals%,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSCertFinder
IniWrite, %CopyActionTotals%,         C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCopyAction
IniWrite, %PasteActionTotals%,        C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupPasteAction
IniWrite, %SuggestRemarksTotals%,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSuggestRemarks
IniWrite, %ClientCodeIETotals%,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupClientCodeIE
IniWrite, %EFSFillTotals%,            C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSFill
IniWrite, %EFSLoginTotals%,           C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSLogin
IniWrite, %AHotCornerBLTotals%,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAHotCornerBLTotals
IniWrite, %AHotCornerTRTotals%,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAHotCornerTRTotals
IniWrite, %AHotCornerBRTotals%,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAHotCornerBRTotals
IniWrite, %WorkspaceOpenerTotals%,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupWorkspaceOpenerTotals
IniWrite, %DoubleTapTotals%,          C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupDoubleTapTotals
IniWrite, %FKeysInjectorTotals%,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupFKeysInjectorTotals
IniWrite, %WoWbarTotals%,             C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupWoWbarTotals
IniWrite, %IndivFacingEmailerTotals%, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupIndivFacingEmailerTotals

Sleep 200
gosub CombinedStats
gosub IndivStats
gosub Rankings
return
}

CombinedStats:
Gui, Submit, NoHide
IniRead, KeystrokesTotals,         C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupKeystrokes
IniRead, DateShortcutTotals,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupDateShortcut
IniRead, AttyFinderTotals,         C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAttyFinder
IniRead, CalExtendTotals,          C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCalExtend
IniRead, SysSwitchTotals,          C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSysSwitch
IniRead, ExcelHLinkTotals,         C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupExcelHLink
IniRead, EFSCertFinderTotals,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSCertFinder
IniRead, CopyActionTotals,         C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCopyAction
IniRead, PasteActionTotals,        C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupPasteAction
IniRead, SuggestRemarksTotals,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSuggestRemarks
IniRead, ClientCodeIETotals,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupClientCodeIE
IniRead, EFSFillTotals,            C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSFill
IniRead, EFSLoginTotals,           C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSLogin
IniRead, AHotCornerBLTotals,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAHotCornerBLTotals
IniRead, AHotCornerTRTotals,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAHotCornerTRTotals
IniRead, AHotCornerBRTotals,       C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAHotCornerBRTotals
IniRead, WorkspaceOpenerTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupWorkspaceOpenerTotals
IniRead, DoubleTapTotals,          C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupDoubleTapTotals
IniRead, FKeysInjectorTotals,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupFKeysInjectorTotals
IniRead, WoWbarTotals,             C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupWoWbarTotals
IniRead, IndivFacingEmailerTotals, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupIndivFacingEmailerTotals

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
LV_Add( ,"Total DoubleTap", DoubleTapTotals )
LV_Add( ,"Total FKeysInjector", FKeysInjectorTotals )
LV_Add( ,"Total WoWbar", WoWbarTotals )
LV_Add( ,"Total IndivFacingEmailer", IndivFacingEmailerTotals )
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
LV_Add( ,"DoubleTap", DoubleTap%UserNumber% )
LV_Add( ,"FKeysInjector", FKeysInjector%UserNumber% )
LV_Add( ,"WoWbar", WoWbar%UserNumber% )
LV_Add( ,"IndivFacingEmailer", IndivFacingEmailer%UserNumber% )
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
IniRead, DoubleTapI%UserNumber%,   % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, DoubleTap
IniRead, FKeysInjectorI%UserNumber%,   % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, FKeysInjector
IniRead, WoWbarI%UserNumber%,   % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, WoWbar
IniRead, IndivFacingEmailerI%UserNumber%,   % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Hourly\" User%UserNumber% "-" StatDateI "-" StatTimeI ".ini", Achievements, IndivFacingEmailer

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
if DoubleTapI%UserNumber% = ERROR
	DoubleTapI%UserNumber% = 0
if FKeysInjectorI%UserNumber% = ERROR
	FKeysInjectorI%UserNumber% = 0
if WoWbarI%UserNumber% = ERROR
	WoWbarI%UserNumber% = 0
if IndivFacingEmailerI%UserNumber% = ERROR
	IndivFacingEmailerI%UserNumber% = 0
	
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
LV_Add( ,"DoubleTap", DoubleTapI%UserNumber% )
LV_Add( ,"FKeysInjector", FKeysInjectorI%UserNumber% )
LV_Add( ,"WoWbar", WoWbarI%UserNumber% )
LV_Add( ,"IndivFacingEmailer", IndivFacingEmailerI%UserNumber% )
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
FileCopy, H:\Docketing\AutoHotKey\Scripts\*.ahk, C:\Users\%A_Username%\Desktop\AHK Back-up    ; Grabs public AHK scripts
Sleep 1000
FileCopy, H:\Docketing\AutoHotKey\AHK Instructions.docx, C:\Users\%A_Username%\Desktop\AHK Back-up    ; Copies the current AHK Instructions.docx.
Sleep 1000
FileCopy, C:\Users\%A_Username%\Desktop\OLD_Desktop_Files\AHK Masters\*.ahk, C:\Users\%A_Username%\Desktop\AHK Back-up  ; Copies all current Master .ahk files.
Sleep 1000
FileCopy, C:\Users\%A_Username%\Desktop\OLD_Desktop_Files\AHK Masters\Atty Phone Numbers.xlsx, C:\Users\%A_Username%\Desktop\AHK Back-up  ; Copies Atty Phone Number.xlsx.
Sleep 1000
FileCopy, C:\Users\%A_Username%\Desktop\OLD_Desktop_Files\Sorta Dead AHK Scripts, C:\Users\%A_Username%\Desktop\AHK Back-up  ; Copies Sorta Dead AHK Scripts
Sleep 1000
FileCopy, C:\Users\%A_Username%\Desktop\OLD_Desktop_Files\AHK Games, C:\Users\%A_Username%\Desktop\AHK Back-up  ; Copies AHK Games
Sleep 1000
FileCopy, C:\Users\%A_Username%\Desktop\OLD_Desktop_Files\Pending AHK Scripts, C:\Users\%A_Username%\Desktop\AHK Back-up  ; Copies Pending AHK Scripts
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

UserData:
Loop %TotalUsers%
{
IniRead, Keystrokes%A_Index%,         % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, Keystrokes
IniRead, DateShortcut%A_Index%,       % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, DateShortcut
IniRead, AttyFinder%A_Index%,         % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, AttyFinder
IniRead, CalExtend%A_Index%,          % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, CalExtend
IniRead, SysSwitch%A_Index%,          % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, SysSwitch
IniRead, ExcelHLink%A_Index%,         % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, ExcelHLink
IniRead, EFSCertFinder%A_Index%,      % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, EFSCertFinder
IniRead, CopyAction%A_Index%,         % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, CopyAction
IniRead, PasteAction%A_Index%,        % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, PasteAction
IniRead, SuggestRemarks%A_Index%,     % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, SuggestRemarks
IniRead, ClientCodeIE%A_Index%,       % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, ClientCodeIE
IniRead, EFSFill%A_Index%,            % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, EFSFill
IniRead, EFSLogin%A_Index%,           % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, EFSLogin
IniRead, Version%A_Index%,            % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Version, Version
IniRead, AHotcornerBL%A_Index%,       % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, AHotcornerBL
IniRead, AHotcornerTR%A_Index%,       % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, AHotcornerTR
IniRead, AHotcornerBR%A_Index%,       % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, AHotcornerBR
IniRead, WorkspaceOpener%A_Index%,    % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, WorkspaceOpener
IniRead, DoubleTap%A_Index%,          % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, DoubleTap
IniRead, FKeysInjector%A_Index%,      % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, FKeysInjector
IniRead, WoWbar%A_Index%,             % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, WoWbar
IniRead, IndivFacingEmailer%A_Index%, % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\" User%A_Index% ".ini", Achievements, IndivFacingEmailer

if Keystrokes%A_Index% = ERROR
	Keystrokes%A_Index% = 0
if DateShortcut%A_Index% = ERROR
	DateShortcut%A_Index% = 0
if AttyFinder%A_Index% = ERROR
	AttyFinder%A_Index% = 0
if CalExtend%A_Index% = ERROR
	CalExtend%A_Index% = 0
if SysSwitch%A_Index% = ERROR    
	SysSwitch%A_Index% = 0    
if ExcelHLink%A_Index% = ERROR
	ExcelHLink%A_Index% = 0
if EFSCertFinder%A_Index% = ERROR
	EFSCertFinder%A_Index% = 0
if CopyAction%A_Index% = ERROR
	CopyAction%A_Index% = 0
if PasteAction%A_Index% = ERROR
	PasteAction%A_Index% = 0
if SuggestRemarks%A_Index% = ERROR
	SuggestRemarks%A_Index% = 0
if ClientCodeIE%A_Index% = ERROR
	ClientCodeIE%A_Index% = 0
if EFSFill%A_Index% = ERROR
	EFSFill%A_Index% = 0
if EFSLogin%A_Index% = ERROR
	EFSLogin%A_Index% = 0
if AHotCornerBL%A_Index% = ERROR
	AHotCornerBL%A_Index% = 0
if AHotCornerTR%A_Index% = ERROR
	AHotCornerTR%A_Index% = 0
if AHotCornerBR%A_Index% = ERROR
	AHotCornerBR%A_Index% = 0
if WorkspaceOpener%A_Index% = ERROR
	WorkspaceOpener%A_Index% = 0
if DoubleTap%A_Index% = ERROR
	DoubleTap%A_Index% = 0
if FKeysInjector%A_Index% = ERROR
	FKeysInjector%A_Index% = 0
if WoWbar%A_Index% = ERROR
	WoWbar%A_Index% = 0
if IndivFacingEmailer%A_Index% = ERROR
	IndivFacingEmailer%A_Index% = 0

}
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

