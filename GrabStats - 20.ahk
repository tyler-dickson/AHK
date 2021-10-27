#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

CollectKeystrokes()
CollectDateShortcut()
CollectAttyFinder()
CollectCalExtend()
CollectSysSwitch()
CollectExcelHLink()
CollectEFSCertFinder()
CollectCopyAction()
CollectPasteAction()
CollectSuggestRemarks()
CollectClientCodeIE()

IniRead, GroupKeystrokesTotals,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupKeystrokes
IniRead, GroupDateShortcutTotals,   C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupDateShortcut
IniRead, GroupCalExtendTotals,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCalExtend
IniRead, GroupSysSwitchTotals,      C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSysSwitch
IniRead, GroupExcelHLinkTotals,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupExcelHLink
IniRead, GroupEFSCertFinderTotals,  C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSCertFinder
IniRead, GroupCopyActionTotals,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCopyAction
IniRead, GroupPasteActionTotals,    C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupPasteAction
IniRead, GroupAttyFinderTotals,     C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAttyFinder
IniRead, GroupSuggestRemarksTotals, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSuggestRemarks
IniRead, GroupClientCodeIETotals,   C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupClientCodeIE

Gui, New, +Owner +AlwaysOnTop, Stat Collection
Gui, Add, Button, w130 x2 y0, Total Keystrokes
Gui, Add, Edit,   ReadOnly +Center w60 x140 y0,   %GroupKeystrokesTotals%
Gui, Add, Button, w130 x2 y25, Total DateShortcut
Gui, Add, Edit,   ReadOnly +Center w60 x140 y25,  %GroupDateShortcutTotals%
Gui, Add, Button, w130 x2 y50, Total AttyFinder
Gui, Add, Edit,   ReadOnly +Center w60 x140 y50,  %GroupAttyFinderTotals%
Gui, Add, Button, w130 x2 y75, Total CalExtend
Gui, Add, Edit,   ReadOnly +Center w60 x140 y75,  %GroupCalExtendTotals%
Gui, Add, Button, w130 x2 y100, Total SysSwitch
Gui, Add, Edit,   ReadOnly +Center w60 x140 y100, %GroupSysSwitchTotals%
Gui, Add, Button, w130 x2 y125, Total ExcelHLink
Gui, Add, Edit,   ReadOnly +Center w60 x140 y125, %GroupExcelHLinkTotals%
Gui, Add, Button, w130 x2 y150, Total EFSCertFinder
Gui, Add, Edit,   ReadOnly +Center w60 x140 y150, %GroupEFSCertFinderTotals%
Gui, Add, Button, w130 x2 y175, Total CopyAction
Gui, Add, Edit,   ReadOnly +Center w60 x140 y175, %GroupCopyActionTotals%
Gui, Add, Button, w130 x2 y200, Total PasteAction
Gui, Add, Edit,   ReadOnly +Center w60 x140 y200, %GroupPasteActionTotals%
Gui, Add, Button, w130 x2 y225, Total SuggestRemarks
Gui, Add, Edit,   ReadOnly +Center w60 x140 y225, %GroupSuggestRemarksTotals%
Gui, Add, Button, w130 x2 y250, Total ClientCodeIE
Gui, Add, Edit,   ReadOnly +Center w60 x140 y250, %GroupClientCodeIETotals%
Gui, Add, Button, x2   y280 w50 gCancel , Cancel
Gui, Add, Button, x67  y280 gData   , Go to Data
Gui, Add, Button, x146 y280 gRefresh, Refresh
Gui, Show
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
Gui, Submit
Reload
Sleep 500
MsgBox, Unable to reload script.
return

/*
IniRead, *1,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, *
IniRead, *2,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\angel.zehnder.ini, Achievements, *
IniRead, *3,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\anthony.pineda.ini, Achievements, *
IniRead, *4,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Arlene.Tjoarman.ini, Achievements, *
IniRead, *5,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Chelsea.Burdeno.ini, Achievements, *
IniRead, *6,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\cher.lancaster.ini, Achievements, *
IniRead, *7,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Daniela.lopez.ini, Achievements, *
IniRead, *8,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\eddie.monroy.ini, Achievements, *
IniRead, *9,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\heather.obrien.ini, Achievements, *
IniRead, *10, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Heide.Young.ini, Achievements, *
IniRead, *11, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\jason.finn.ini, Achievements, *
IniRead, *12, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.anabtawi.ini, Achievements, *
IniRead, *13, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Long.Dang.ini, Achievements, *
IniRead, *14, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Neysa.Perkins.ini, Achievements, *
IniRead, *15, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\paul.traska.ini, Achievements, *
IniRead, *16, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\ThuyQuyen.Nguyen.ini, Achievements, *
IniRead, *17, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\tyler.dickson.ini, Achievements, *
IniRead, *18, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\xiomara.raymundo.ini, Achievements, *
IniRead, *19, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\kevin.kraus.ini, Achievements, *
IniRead, *20, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\nick.lamb.ini, Achievements, *

IniRead, Keystrokes1,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, Keystrokes
IniRead, DateShortcut1,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, DateShortcut
IniRead, AttyFinder1,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, AttyFinder
IniRead, CalExtend1,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, CalExtend
IniRead, SysSwitch1,     H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, SysSwitch
IniRead, ExcelHLink1,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, ExcelHLink
IniRead, EFSCertFinder1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, EFSCertFinder
IniRead, CopyAction1,    H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, CopyAction
IniRead, PasteAction1,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, PasteAction
IniRead, SuggestRemarks1,H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, SuggestRemarks
IniRead, ClientCodeIE1,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, ClientCodeIE
*/

CollectKeystrokes()
{
Gui, Submit, NoHide
IniRead, Keystrokes1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, Keystrokes
IniRead, Keystrokes2, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\angel.zehnder.ini, Achievements, Keystrokes
IniRead, Keystrokes3, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\anthony.pineda.ini, Achievements, Keystrokes
IniRead, Keystrokes4, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Arlene.Tjoarman.ini, Achievements, Keystrokes
IniRead, Keystrokes5, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Chelsea.Burdeno.ini, Achievements, Keystrokes
IniRead, Keystrokes6, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\cher.lancaster.ini, Achievements, Keystrokes
IniRead, Keystrokes7, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Daniela.lopez.ini, Achievements, Keystrokes
IniRead, Keystrokes8, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\eddie.monroy.ini, Achievements, Keystrokes
IniRead, Keystrokes9, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\heather.obrien.ini, Achievements, Keystrokes
IniRead, Keystrokes10, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Heide.Young.ini, Achievements, Keystrokes
IniRead, Keystrokes11, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\jason.finn.ini, Achievements, Keystrokes
IniRead, Keystrokes12, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.anabtawi.ini, Achievements, Keystrokes
IniRead, Keystrokes13, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Long.Dang.ini, Achievements, Keystrokes
IniRead, Keystrokes14, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Neysa.Perkins.ini, Achievements, Keystrokes
IniRead, Keystrokes15, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\paul.traska.ini, Achievements, Keystrokes
IniRead, Keystrokes16, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\ThuyQuyen.Nguyen.ini, Achievements, Keystrokes
IniRead, Keystrokes17, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\tyler.dickson.ini, Achievements, Keystrokes
IniRead, Keystrokes18, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\xiomara.raymundo.ini, Achievements, Keystrokes
IniRead, Keystrokes19, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\kevin.kraus.ini, Achievements, Keystrokes
IniRead, Keystrokes20, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\nick.lamb.ini, Achievements, Keystrokes
Loop, 20
{
KeystrokesTotals+=Keystrokes%A_Index%
}
;MsgBox, KeystrokesTotals = %KeystrokesTotals%.
IniWrite, %KeystrokesTotals%, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupKeystrokes
return
}

CollectDateShortcut()
{
Gui, Submit, NoHide
IniRead, DateShortcut1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, DateShortcut
IniRead, DateShortcut2, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\angel.zehnder.ini, Achievements, DateShortcut
IniRead, DateShortcut3, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\anthony.pineda.ini, Achievements, DateShortcut
IniRead, DateShortcut4, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Arlene.Tjoarman.ini, Achievements, DateShortcut
IniRead, DateShortcut5, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Chelsea.Burdeno.ini, Achievements, DateShortcut
IniRead, DateShortcut6, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\cher.lancaster.ini, Achievements, DateShortcut
IniRead, DateShortcut7, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Daniela.lopez.ini, Achievements, DateShortcut
IniRead, DateShortcut8, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\eddie.monroy.ini, Achievements, DateShortcut
IniRead, DateShortcut9, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\heather.obrien.ini, Achievements, DateShortcut
IniRead, DateShortcut10, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Heide.Young.ini, Achievements, DateShortcut
IniRead, DateShortcut11, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\jason.finn.ini, Achievements, DateShortcut
IniRead, DateShortcut12, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.anabtawi.ini, Achievements, DateShortcut
IniRead, DateShortcut13, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Long.Dang.ini, Achievements, DateShortcut
IniRead, DateShortcut14, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Neysa.Perkins.ini, Achievements, DateShortcut
IniRead, DateShortcut15, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\paul.traska.ini, Achievements, DateShortcut
IniRead, DateShortcut16, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\ThuyQuyen.Nguyen.ini, Achievements, DateShortcut
IniRead, DateShortcut17, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\tyler.dickson.ini, Achievements, DateShortcut
IniRead, DateShortcut18, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\xiomara.raymundo.ini, Achievements, DateShortcut
IniRead, DateShortcut19, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\kevin.kraus.ini, Achievements, DateShortcut
IniRead, DateShortcut20, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\nick.lamb.ini, Achievements, DateShortcut
Loop, 20
{
DateShortcutTotals+=DateShortcut%A_Index%
}
;MsgBox, DateShortcut = %DateShortcutTotals%.
IniWrite, %DateShortcutTotals%, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupDateShortcut
return
}

CollectAttyFinder()
{
Gui, Submit, NoHide
IniRead, AttyFinder1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, AttyFinder
IniRead, AttyFinder2, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\angel.zehnder.ini, Achievements, AttyFinder
IniRead, AttyFinder3, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\anthony.pineda.ini, Achievements, AttyFinder
IniRead, AttyFinder4, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Arlene.Tjoarman.ini, Achievements, AttyFinder
IniRead, AttyFinder5, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Chelsea.Burdeno.ini, Achievements, AttyFinder
IniRead, AttyFinder6, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\cher.lancaster.ini, Achievements, AttyFinder
IniRead, AttyFinder7, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Daniela.lopez.ini, Achievements, AttyFinder
IniRead, AttyFinder8, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\eddie.monroy.ini, Achievements, AttyFinder
IniRead, AttyFinder9, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\heather.obrien.ini, Achievements, AttyFinder
IniRead, AttyFinder10, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Heide.Young.ini, Achievements, AttyFinder
IniRead, AttyFinder11, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\jason.finn.ini, Achievements, AttyFinder
IniRead, AttyFinder12, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.anabtawi.ini, Achievements, AttyFinder
IniRead, AttyFinder13, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Long.Dang.ini, Achievements, AttyFinder
IniRead, AttyFinder14, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Neysa.Perkins.ini, Achievements, AttyFinder
IniRead, AttyFinder15, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\paul.traska.ini, Achievements, AttyFinder
IniRead, AttyFinder16, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\ThuyQuyen.Nguyen.ini, Achievements, AttyFinder
IniRead, AttyFinder17, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\tyler.dickson.ini, Achievements, AttyFinder
IniRead, AttyFinder18, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\xiomara.raymundo.ini, Achievements, AttyFinder
IniRead, AttyFinder19, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\kevin.kraus.ini, Achievements, AttyFinder
IniRead, AttyFinder20, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\nick.lamb.ini, Achievements, AttyFinder
Loop, 20
{
AttyFinderTotals+=AttyFinder%A_Index%
}
;MsgBox, AttyFinder = %AttyFinderTotals%.
IniWrite, %AttyFinderTotals%, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupAttyFinder
return
}

CollectCalExtend()
{
Gui, Submit, NoHide
IniRead, CalExtend1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, CalExtend
IniRead, CalExtend2, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\angel.zehnder.ini, Achievements, CalExtend
IniRead, CalExtend3, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\anthony.pineda.ini, Achievements, CalExtend
IniRead, CalExtend4, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Arlene.Tjoarman.ini, Achievements, CalExtend
IniRead, CalExtend5, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Chelsea.Burdeno.ini, Achievements, CalExtend
IniRead, CalExtend6, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\cher.lancaster.ini, Achievements, CalExtend
IniRead, CalExtend7, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Daniela.lopez.ini, Achievements, CalExtend
IniRead, CalExtend8, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\eddie.monroy.ini, Achievements, CalExtend
IniRead, CalExtend9, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\heather.obrien.ini, Achievements, CalExtend
IniRead, CalExtend10, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Heide.Young.ini, Achievements, CalExtend
IniRead, CalExtend11, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\jason.finn.ini, Achievements, CalExtend
IniRead, CalExtend12, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.anabtawi.ini, Achievements, CalExtend
IniRead, CalExtend13, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Long.Dang.ini, Achievements, CalExtend
IniRead, CalExtend14, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Neysa.Perkins.ini, Achievements, CalExtend
IniRead, CalExtend15, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\paul.traska.ini, Achievements, CalExtend
IniRead, CalExtend16, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\ThuyQuyen.Nguyen.ini, Achievements, CalExtend
IniRead, CalExtend17, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\tyler.dickson.ini, Achievements, CalExtend
IniRead, CalExtend18, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\xiomara.raymundo.ini, Achievements, CalExtend
IniRead, CalExtend19, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\kevin.kraus.ini, Achievements, CalExtend
IniRead, CalExtend20, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\nick.lamb.ini, Achievements, CalExtend
Loop, 20
{
CalExtendTotals+=CalExtend%A_Index%
}
;MsgBox, CalExtend = %CalExtendTotals%.
IniWrite, %CalExtendTotals%, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCalExtend
return
}

CollectSysSwitch()
{
Gui, Submit, NoHide
IniRead, SysSwitch1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, SysSwitch
IniRead, SysSwitch2, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\angel.zehnder.ini, Achievements, SysSwitch
IniRead, SysSwitch3, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\anthony.pineda.ini, Achievements, SysSwitch
IniRead, SysSwitch4, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Arlene.Tjoarman.ini, Achievements, SysSwitch
IniRead, SysSwitch5, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Chelsea.Burdeno.ini, Achievements, SysSwitch
IniRead, SysSwitch6, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\cher.lancaster.ini, Achievements, SysSwitch
IniRead, SysSwitch7, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Daniela.lopez.ini, Achievements, SysSwitch
IniRead, SysSwitch8, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\eddie.monroy.ini, Achievements, SysSwitch
IniRead, SysSwitch9, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\heather.obrien.ini, Achievements, SysSwitch
IniRead, SysSwitch10, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Heide.Young.ini, Achievements, SysSwitch
IniRead, SysSwitch11, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\jason.finn.ini, Achievements, SysSwitch
IniRead, SysSwitch12, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.anabtawi.ini, Achievements, SysSwitch
IniRead, SysSwitch13, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Long.Dang.ini, Achievements, SysSwitch
IniRead, SysSwitch14, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Neysa.Perkins.ini, Achievements, SysSwitch
IniRead, SysSwitch15, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\paul.traska.ini, Achievements, SysSwitch
IniRead, SysSwitch16, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\ThuyQuyen.Nguyen.ini, Achievements, SysSwitch
IniRead, SysSwitch17, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\tyler.dickson.ini, Achievements, SysSwitch
IniRead, SysSwitch18, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\xiomara.raymundo.ini, Achievements, SysSwitch
IniRead, SysSwitch19, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\kevin.kraus.ini, Achievements, SysSwitch
IniRead, SysSwitch20, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\nick.lamb.ini, Achievements, SysSwitch
Loop, 20
{
SysSwitchTotals+=SysSwitch%A_Index%
}
;MsgBox, SysSwitch = %SysSwitchTotals%.
IniWrite, %SysSwitchTotals%, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSysSwitch
return
}

CollectExcelHLink()
{
Gui, Submit, NoHide
IniRead, ExcelHLink1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, ExcelHLink
IniRead, ExcelHLink2, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\angel.zehnder.ini, Achievements, ExcelHLink
IniRead, ExcelHLink3, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\anthony.pineda.ini, Achievements, ExcelHLink
IniRead, ExcelHLink4, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Arlene.Tjoarman.ini, Achievements, ExcelHLink
IniRead, ExcelHLink5, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Chelsea.Burdeno.ini, Achievements, ExcelHLink
IniRead, ExcelHLink6, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\cher.lancaster.ini, Achievements, ExcelHLink
IniRead, ExcelHLink7, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Daniela.lopez.ini, Achievements, ExcelHLink
IniRead, ExcelHLink8, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\eddie.monroy.ini, Achievements, ExcelHLink
IniRead, ExcelHLink9, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\heather.obrien.ini, Achievements, ExcelHLink
IniRead, ExcelHLink10, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Heide.Young.ini, Achievements, ExcelHLink
IniRead, ExcelHLink11, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\jason.finn.ini, Achievements, ExcelHLink
IniRead, ExcelHLink12, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.anabtawi.ini, Achievements, ExcelHLink
IniRead, ExcelHLink13, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Long.Dang.ini, Achievements, ExcelHLink
IniRead, ExcelHLink14, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Neysa.Perkins.ini, Achievements, ExcelHLink
IniRead, ExcelHLink15, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\paul.traska.ini, Achievements, ExcelHLink
IniRead, ExcelHLink16, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\ThuyQuyen.Nguyen.ini, Achievements, ExcelHLink
IniRead, ExcelHLink17, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\tyler.dickson.ini, Achievements, ExcelHLink
IniRead, ExcelHLink18, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\xiomara.raymundo.ini, Achievements, ExcelHLink
IniRead, ExcelHLink19, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\kevin.kraus.ini, Achievements, ExcelHLink
IniRead, ExcelHLink20, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\nick.lamb.ini, Achievements, ExcelHLink
Loop, 20
{
ExcelHLinkTotals+=ExcelHLink%A_Index%
}
;MsgBox, ExcelHLink = %ExcelHLinkTotals%.
IniWrite, %ExcelHLinkTotals%, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupExcelHLink
return
}

CollectEFSCertFinder()
{
Gui, Submit, NoHide
IniRead, EFSCertFinder1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder2, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\angel.zehnder.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder3, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\anthony.pineda.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder4, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Arlene.Tjoarman.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder5, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Chelsea.Burdeno.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder6, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\cher.lancaster.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder7, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Daniela.lopez.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder8, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\eddie.monroy.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder9, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\heather.obrien.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder10, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Heide.Young.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder11, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\jason.finn.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder12, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.anabtawi.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder13, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Long.Dang.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder14, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Neysa.Perkins.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder15, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\paul.traska.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder16, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\ThuyQuyen.Nguyen.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder17, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\tyler.dickson.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder18, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\xiomara.raymundo.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder19, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\kevin.kraus.ini, Achievements, EFSCertFinder
IniRead, EFSCertFinder20, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\nick.lamb.ini, Achievements, EFSCertFinder
Loop, 20
{
EFSCertFinderTotals+=EFSCertFinder%A_Index%
}
;MsgBox, EFSCertFinder = %EFSCertFinderTotals%.
IniWrite, %EFSCertFinderTotals%, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupEFSCertFinder
return
}

CollectCopyAction()
{
Gui, Submit, NoHide
IniRead, CopyAction1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, CopyAction
IniRead, CopyAction2, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\angel.zehnder.ini, Achievements, CopyAction
IniRead, CopyAction3, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\anthony.pineda.ini, Achievements, CopyAction
IniRead, CopyAction4, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Arlene.Tjoarman.ini, Achievements, CopyAction
IniRead, CopyAction5, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Chelsea.Burdeno.ini, Achievements, CopyAction
IniRead, CopyAction6, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\cher.lancaster.ini, Achievements, CopyAction
IniRead, CopyAction7, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Daniela.lopez.ini, Achievements, CopyAction
IniRead, CopyAction8, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\eddie.monroy.ini, Achievements, CopyAction
IniRead, CopyAction9, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\heather.obrien.ini, Achievements, CopyAction
IniRead, CopyAction10, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Heide.Young.ini, Achievements, CopyAction
IniRead, CopyAction11, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\jason.finn.ini, Achievements, CopyAction
IniRead, CopyAction12, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.anabtawi.ini, Achievements, CopyAction
IniRead, CopyAction13, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Long.Dang.ini, Achievements, CopyAction
IniRead, CopyAction14, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Neysa.Perkins.ini, Achievements, CopyAction
IniRead, CopyAction15, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\paul.traska.ini, Achievements, CopyAction
IniRead, CopyAction16, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\ThuyQuyen.Nguyen.ini, Achievements, CopyAction
IniRead, CopyAction17, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\tyler.dickson.ini, Achievements, CopyAction
IniRead, CopyAction18, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\xiomara.raymundo.ini, Achievements, CopyAction
IniRead, CopyAction19, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\kevin.kraus.ini, Achievements, CopyAction
IniRead, CopyAction20, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\nick.lamb.ini, Achievements, CopyAction
Loop, 20
{
CopyActionTotals+=CopyAction%A_Index%
}
;MsgBox, CopyAction = %CopyActionTotals%.
IniWrite, %CopyActionTotals%, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupCopyAction
return
}

CollectPasteAction()
{
Gui, Submit, NoHide
IniRead, PasteAction1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, PasteAction
IniRead, PasteAction2, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\angel.zehnder.ini, Achievements, PasteAction
IniRead, PasteAction3, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\anthony.pineda.ini, Achievements, PasteAction
IniRead, PasteAction4, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Arlene.Tjoarman.ini, Achievements, PasteAction
IniRead, PasteAction5, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Chelsea.Burdeno.ini, Achievements, PasteAction
IniRead, PasteAction6, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\cher.lancaster.ini, Achievements, PasteAction
IniRead, PasteAction7, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Daniela.lopez.ini, Achievements, PasteAction
IniRead, PasteAction8, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\eddie.monroy.ini, Achievements, PasteAction
IniRead, PasteAction9, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\heather.obrien.ini, Achievements, PasteAction
IniRead, PasteAction10, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Heide.Young.ini, Achievements, PasteAction
IniRead, PasteAction11, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\jason.finn.ini, Achievements, PasteAction
IniRead, PasteAction12, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.anabtawi.ini, Achievements, PasteAction
IniRead, PasteAction13, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Long.Dang.ini, Achievements, PasteAction
IniRead, PasteAction14, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Neysa.Perkins.ini, Achievements, PasteAction
IniRead, PasteAction15, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\paul.traska.ini, Achievements, PasteAction
IniRead, PasteAction16, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\ThuyQuyen.Nguyen.ini, Achievements, PasteAction
IniRead, PasteAction17, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\tyler.dickson.ini, Achievements, PasteAction
IniRead, PasteAction18, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\xiomara.raymundo.ini, Achievements, PasteAction
IniRead, PasteAction19, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\kevin.kraus.ini, Achievements, PasteAction
IniRead, PasteAction20, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\nick.lamb.ini, Achievements, PasteAction
Loop, 20
{
PasteActionTotals+=PasteAction%A_Index%
}
;MsgBox, PasteAction = %PasteActionTotals%.
IniWrite, %PasteActionTotals%, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupPasteAction
return
}

CollectSuggestRemarks()
{
Gui, Submit, NoHide
IniRead, SuggestRemarks1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks2, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\angel.zehnder.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks3, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\anthony.pineda.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks4, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Arlene.Tjoarman.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks5, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Chelsea.Burdeno.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks6, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\cher.lancaster.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks7, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Daniela.lopez.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks8, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\eddie.monroy.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks9, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\heather.obrien.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks10, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Heide.Young.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks11, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\jason.finn.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks12, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.anabtawi.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks13, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Long.Dang.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks14, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Neysa.Perkins.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks15, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\paul.traska.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks16, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\ThuyQuyen.Nguyen.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks17, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\tyler.dickson.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks18, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\xiomara.raymundo.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks19, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\kevin.kraus.ini, Achievements, SuggestRemarks
IniRead, SuggestRemarks20, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\nick.lamb.ini, Achievements, SuggestRemarks
Loop, 20
{
SuggestRemarksTotals+=SuggestRemarks%A_Index%
}
;MsgBox, SuggestRemarks = %SuggestRemarksTotals%.
IniWrite, %SuggestRemarksTotals%, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupSuggestRemarks
return
}

CollectClientCodeIE()
{
Gui, Submit, NoHide
IniRead, ClientCodeIE1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\adriana.perez.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE2, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\angel.zehnder.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE3, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\anthony.pineda.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE4, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Arlene.Tjoarman.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE5, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Chelsea.Burdeno.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE6, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\cher.lancaster.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE7, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Daniela.lopez.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE8, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\eddie.monroy.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE9, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\heather.obrien.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE10, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Heide.Young.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE11, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\jason.finn.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE12, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\lara.anabtawi.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE13, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Long.Dang.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE14, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\Neysa.Perkins.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE15, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\paul.traska.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE16, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\ThuyQuyen.Nguyen.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE17, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\tyler.dickson.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE18, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\xiomara.raymundo.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE19, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\kevin.kraus.ini, Achievements, ClientCodeIE
IniRead, ClientCodeIE20, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\nick.lamb.ini, Achievements, ClientCodeIE
Loop, 20
{
ClientCodeIETotals+=ClientCodeIE%A_Index%
}
;MsgBox, ClientCodeIE = %ClientCodeIETotals%.
IniWrite, %ClientCodeIETotals%, C:\Users\%A_Username%\Desktop\Stats2.ini, Totals, GroupClientCodeIE
return
}

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

