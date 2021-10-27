#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
Menu, Tray, Icon, pifmgr.dll, 14
Enabled := ComObjError(false)
; #Include JSON.ahk

; https://jsonformatter.org/json-parser

global ClientCode

Gui, 3: New, -ToolWindow AlwaysOnTop, Select row on Patent/Trademarks Tab and press F1 to export Biblio. F2 to export Priorities/Goods. F3 to export Inventors. ; F4 for automatic.
Gui, 3: Color, DDDDDD
Gui, 3: Add, Tab3,x0 y0 w850 h600 +Background Buttons vTabName, PAIR|TSDR|BATCH (WORK IN PROGRESS)
Gui, 3: Add, Button, x5 yp+28 Center w100 h50 gSearch, Search!
Gui, 3: Add, Button, yp xp+115 Center w50 h50 gClearAll2, Clear!
Gui, 3: Add, Button, yp xp+65 Center w50 h50 gTryForAbstract, Try to`nFind Abstract
; Gui, 3: Add, Button, yp xp+65 Center w75 h50 gExport, Export`nBiblio!

; Gui, 3: Add, Button, yp+158 xp+80 Center w50 h35 gExportInventors, Export`nInventors
; Gui, 3: Add, Button, yp+92 xp Center w50 h35 gExportPriorities, Export`nPriorities

Gui, 3: Add, Text, x5 y88 Section w50 Center, App # 
Gui, 3: Add, Edit, yp-3 xp+55 Center w60 vApplicationNo, 12066485
Gui, 3: Add, Text, x5 yp+28 w50 Center, Filing Date 
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly ,
Gui, 3: Add, Text, x5 yp+28 w50 Center, Pub # 
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly ,
Gui, 3: Add, Text, x5 yp+28 w50 Center, Pub Date 
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly ,
Gui, 3: Add, Text, x5 yp+28 w50 Center, Patent #
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly , ; 16
Gui, 3: Add, Text, x5 yp+28 w50 Center, Iss. Date
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly , ; 17
Gui, 3: Add, Text, x5 yp+28 w50 Center, Examiner
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly , 
Gui, 3: Add, Text, x5 yp+28 w55 Center, PTA Adjust
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly , 
Gui, 3: Add, Text, x5 yp+28 w50 Center, Art Unit
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly , ; 12
Gui, 3: Add, Text, x5 yp+28 w50 Center, Conf #
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly , ; 13
Gui, 3: Add, Text, x5 yp+28 w50 Center, Atty Doc
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly, ; 14
Gui, 3: Add, Text, x5 yp+28 w50 Center, Status
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly , ; 15
Gui, 3: Add, Text, x265 y28 w50 Center, Title
Gui, 3: Add, Edit, yp-3 xp+55 Center w415 h70 ReadOnly , ; 10
Gui, 3: Add, Text, x265 yp+75 w50 Center, Applicant
Gui, 3: Add, Edit, yp-3 xp+55 Center w415 h70 ReadOnly , ; 10
Gui, 3: Add, Text, x265 yp+75 w50 Center, Inventors
Gui, 3: Add, Edit, yp-3 xp+55 Center w415 h70 ReadOnly vNewInventors, ; 10
Gui, 3: Add, Text, x265 yp+75 w50 Center, Priorities
Gui, 3: Add, Edit, yp-3 xp+55 Center w415 h70 ReadOnly vNewPriorities, ; 10
Gui, 3: Add, Text, x265 yp+75 w50 Center, Foreign`nPriorities
Gui, 3: Add, Edit, yp-3 xp+55 Center w415 h70 ReadOnly vNewForeigns, ; 10
Gui, 3: Add, Edit, x123 ys-3 Center w137 ReadOnly vClientCode2, 
Gui, 3: Font, underline bold
Gui, 3: Add, Text, x735 y30 w60 Center Section, Field
Gui, 3: Add, Text, xp+64 yp w50, Column
Gui, 3: Font, 
Gui, 3: Add, Text, xs yp+20 w60 Center, App #
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR1, |A|B|C|D|E|F|G|H||I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Client Code
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR2, |A||B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Filing Date
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR3, |A|B|C|D|E|F|G|H|I||J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Pub #
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR4, |A|B|C|D|E|F|G|H|I|J||K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Pub Date
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR5, |A|B|C|D|E|F|G|H|I|J|K||L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Patent #
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR6, |A|B|C|D|E|F|G|H|I|J|K|L||M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Iss. Date
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR7, |A|B|C|D|E|F|G|H|I|J|K|L|M||N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Examiner
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR8, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V||W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, PTA Adjust
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR9, |A|B|C|D|E|F|G|H|I|J|K|L|M|N||O|P|Q|R|S|T|U|V|W|X|Y|Z||AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Art Unit
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR10, |A|B|C|D|E|F|G|H|I|J|K|L|M|N||O|P|Q|R|S|T|U||V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Conf #
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR11, |A|B|C|D|E|F|G|H|I|J|K|L|M|N||O|P|Q|R|S|T||U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Atty Doc
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR12, |A|B|C|D|E|F|G|H|I|J|K|L|M|N||O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Status
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR13, |A|B|C|D|E|F|G|H|I|J|K|L|M|N||O|P|Q||R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Title
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR14, |A|B|C|D|E|F|G||H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Applicant
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR15, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P||Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|




Gui, 3: Tab, 2 ; THIS IS THE TSDR TAB

Gui, 3: Add, Button, x5 y28 Center w100 h50 gSearchTSDR, Search!
Gui, 3: Add, Button, yp xp+115 Center w50 h50 gClearAll2TSDR, Clear!
Gui, 3: Font, bold underline
Gui, 3: Add, Text, yp+48 xp+145 Center w50 h25, Options
Gui, 3: Font, 
Gui, 3: Add, Button, yp+20 xp Center w50 h50 gOpenTSDR, Open`nTSDR`nPage

Gui, 3: Add, Button, yp+55 xp Center w50 h50 gDownloadTSDR, Save`nTSDR`nas PDF

Gui, 3: Font, bold underline
Gui, 3: Add, Text, yp+56 xp Center w50 h25, Basis
Gui, 3: Font, 
Gui, 3: Add, Text, yp+17 xp+15 Center w50 h25, F  C


Gui, 3: Add, Text, yp+15 xp-22 Section Center w35 h25,Use
Gui, 3: Add, Checkbox, Checked0 yp xp+32 w15 h15,
Gui, 3: Add, Checkbox, Checked0 yp xp+16 w14 h15,
Gui, 3: Add, Text, yp+20 xs  w35 h25 Center ,ITU
Gui, 3: Add, Checkbox, Checked0 yp xp+32 w15 h15,
Gui, 3: Add, Checkbox, Checked0 yp xp+16 w14 h15,
Gui, 3: Add, Text, yp+20 xs w35 h25 Center ,44D
Gui, 3: Add, Checkbox, Checked0 yp xp+32 w15 h15,
Gui, 3: Add, Checkbox, Checked0 yp xp+16 w14 h15,
Gui, 3: Add, Text, yp+20 xs  w35 h25 Center ,44E
Gui, 3: Add, Checkbox, Checked0 yp xp+32 w15 h15,
Gui, 3: Add, Checkbox, Checked0 yp xp+16 w14 h15,
Gui, 3: Add, Text, yp+20 xs  w35 h25 Center ,66A
Gui, 3: Add, Checkbox, Checked0 yp xp+32 w15 h15,
Gui, 3: Add, Checkbox, Checked0 yp xp+16 w14 h15,
Gui, 3: Add, Text, yp+20 xs  w35 h50 Center ,No`nBasis
Gui, 3: Add, Checkbox, Checked0 yp+3 xp+32 w15 h15,
Gui, 3: Add, Checkbox, Checked0 yp xp+16 w14 h15,

;Gui, 3: Add, Button, yp xp+65 Center w75 h50 gExportTSDR, Export`nBiblio!
;Gui, 3: Add, Edit, x123 y85 Center w137 ReadOnly vClientCode2TSDR, 

Gui, 3: Add, Text, x5 y88 Section w50 -Wrap Center, App # 
Gui, 3: Add, Edit, yp-3 xp+55 Center w60 vApplicationNoTSDR, 79024434
Gui, 3: Add, Text, x5 yp+28 w50 Center, Filing Date 
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly ,
Gui, 3: Add, Text, x5 yp+28 w50 Center, Pub Date 
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly ,
Gui, 3: Add, Text, x5 yp+28 w50 Center, Allowance
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly ,
Gui, 3: Add, Text, x5 yp+28 w50 Center, Reg #
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly , ; 16
Gui, 3: Add, Text, x5 yp+28 w50 Center, Reg Date
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly , ; 17
Gui, 3: Add, Text, x5 yp+28 w50 Center, Atty Doc
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly, ; 14
Gui, 3: Add, Text, x5 yp+28 w50 Center, Status
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly , ; 15
Gui, 3: Add, Text, x5 yp+28 w50 Center, Prior #
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly , ; 15
Gui, 3: Add, Text, x5 yp+28 w50 Center, Prior Date
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly , ; 15
Gui, 3: Add, Text, x5 yp+28 w50 Center, App Type
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly , ; 15
Gui, 3: Add, Text, x5 yp+28 w50 Center, Applicant
Gui, 3: Add, Edit, yp-3 xp+55 Center w200 ReadOnly , ; 15
Gui, 3: Add, Text, x265 y28 w50 Center, Mark
Gui, 3: Add, Edit, yp-3 xp+55 Center w415 h20 ReadOnly , ; 10
Gui, 3: Add, Text, x265 yp+25 w50 Center, Goods
Gui, 3: Add, Edit, yp-3 xp+55 Center w415 h335 ReadOnly vGoodsTSDR, ; 10



Gui, 3: Add, Edit, x123 ys-3 Center w137 ReadOnly vClientCodeTSDR, 
Gui, 3: Font, underline bold
Gui, 3: Add, Text, x735 y30 w60 Center Section, Field
Gui, 3: Add, Text, xp+64 yp w50, Column
Gui, 3: Font, 
Gui, 3: Add, Text, xs yp+20 w60 Center, Client Code
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR1T, |A||B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Status
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR2T, |A|B|C|D||E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Mark Title
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR3T, |A|B|C|D|E|F|G||H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Prior #
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR4T, |A|B|C|D|E|F|G|H||I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Prior Date
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR5T, |A|B|C|D|E|F|G|H|I||J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, App No.
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR6T, |A|B|C|D|E|F|G|H|I|J||K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Filing Date
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR7T, |A|B|C|D|E|F|G|H|I|J|K||L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Reg #
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR8T, |A|B|C|D|E|F|G|H|I|J|K|L||M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Reg Date
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR9T, |A|B|C|D|E|F|G|H|I|J|K|L|M||N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Applicant
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR10T, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q||R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|
Gui, 3: Add, Text, xs yp+25 w60 Center, Assignee
Gui, 3: Add, DropdownList, xp+60 yp-3 w50 vPAIR11T, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q||R|S|T||U|V|W|X|Y|Z|AA|AB|AC|AD|AE|AF|



Gui, 3: Tab, 2

;Gui, 3: Add, Text, x5 y385 w60 Center Section, Assignments
;Gui, 3: Add, Edit, yp xp+65 Center h70 w750 ReadOnly , ; 15

Gui, 3: Add, ActiveX, x10 y400 w800 h600 vie, Shell.Explorer
ie.Navigate("https://tsdrapi.uspto.gov/ts/cd/casestatus/sn78787878/content.html")

Gui, 3: Tab, 3
Gui, 3: Add, Edit, x5 y26 w50 Center, 0
Gui, 3: Add, Radio, x68 y30 w50 Center gChangeBatchType vBatchType Checked1, PAIR
Gui, 3: Add, Radio, xp+60 yp w50 Center gChangeBatchType, TSDR

Gui, 3: Add, Button, x5 yp+25 w50 h50 Center gBatchSearch, Batch`nSearch
Gui, 3: Add, Edit, y47 xp+55 Center w125 h335 gCheckBatchNumbers vBatchNumbers
Gui, 3: Add, ListView, xp+132 yp w652 h335 Checked Right Grid vLoadedFiles ,   PAIR|PAIR1|PAIR2


Gui, 3: Show, w850 h386
return

ChangeBatchType:
Gui, 3: Submit, NoHide

if (BatchType == "1")
	{
	LV_Delete()

	LV_DeleteCol(1)
	LV_DeleteCol(1)
	LV_DeleteCol(1)
	
	LV_InsertCol(1, , "PAIR2")
	LV_InsertCol(1, , "PAIR1")
	LV_InsertCol(1, , "PAIR")
	
	}
if (BatchType == "2")
	{
	LV_Delete()
	
	LV_DeleteCol(1)
	LV_DeleteCol(1)
	LV_DeleteCol(1)
	
	LV_InsertCol(1, , "TSDR2")
	LV_InsertCol(1, , "TSDR1")
	LV_InsertCol(1, , "TSDR")	
	
	}

return


BatchSearch:

return

CheckBatchNumbers:
GuiControlGet, Edit1Status, , Edit35
StringSplit, Edit1Status, Edit1Status, `n, 
GuiControl, , Edit34, %Edit1Status0%
LV_Add("", BackEnd%A_Index%, "test", "test1")
return

return

OpenTSDR:
Gui, 3: Submit, NoHide
TempNo := StrReplace(ApplicationNoTSDR, "/", "")
Run, % "https://tsdrapi.uspto.gov/ts/cd/casestatus/sn" TempNo "/content.html"


return

DownloadTSDR:
Gui, 3: Submit, NoHide
TempNo := StrReplace(ApplicationNoTSDR, "/", "")
ie.Navigate("https://tsdrapi.uspto.gov/ts/cd/casestatus/sn" TempNo "/download.pdf")

return

SearchAssignment:
ClearAll2Assignment:
ExportAssignment:

return

;F4::
;gosub InitiateSearch
;gosub Export
;gosub ExportPriorities
;gosub ExportInventors
;return

FindBlankRow:
Sleep 500
xl := ComObjActive("Excel.Application")
offset = 1
while (xl.Range("A" . A_Index + 1).Value != "") {
	offset++
}

newaddress := xl.Range("A" . A_Index + offset + 1).Address
xl.Range(newaddress).Select()
Sleep 500
return

FindBlankRowPriority:
Sleep 500
xl := ComObjActive("Excel.Application")
offset = 1
while (xl.Range("B" . A_Index + 1).Value != "") {
	offset++
}

newaddress := xl.Range("A" . A_Index + offset + 1).Address
xl.Range(newaddress).Select()
Sleep 500
return

F2::
ExportPriorities:
Gui, 3: Submit, NoHide

if (TabName == "PAIR")
	{
	;GuiControl, 3: , Button5, Exported!
	xl.Sheets("Priorities").Select
	gosub FindBlankRowPriority
	;GuiControlGet, NewPriorities, 	, Edit16, 3
	;GuiControlGet, NewForeigns, 	, Edit17, 3

	if (NewForeigns == "" && NewPriorities == "")
		AllPriorities := "None?"
	else if (NewPriorities == "" && NewForeigns != "")
		AllPriorities := NewForeigns
	else if (NewPriorities != "" && NewForeigns == "")
		AllPriorities := NewPriorities	
	else
		AllPriorities := NewPriorities "`n" NewForeigns 

	PriorityArray := StrSplit(AllPriorities, "`n")

	tempPrior := ""
	UpdatedPriorities := ""
	Loop % PriorityArray.Length()
		{
		tempPrior := ClientCode "`t" PriorityArray[A_Index]
		
		if (UpdatedPriorities == "")
			UpdatedPriorities := tempPrior
		else
			UpdatedPriorities := UpdatedPriorities "`n" tempPrior
		}

	Clipboard := UpdatedPriorities
	xl.ActiveSheet.Paste
	SetTimer, ChangeButtonsBack, -2000
	}
	
if (TabName == "TSDR")
	{
	xl.Sheets("ClassGoods").Select
	gosub FindBlankRowPriority
	GoodsArray := StrSplit(goodsTSDR, "`n`n")
	pasteGoods := ""
	tempClass := ""
	tempGoods := ""
	Loop % GoodsArray.Length()
		{
		tempClass := Trim(SubStr(GoodsArray[A_Index], 1, 3))
		tempGoods := Trim(SubStr(GoodsArray[A_Index], 4))
		
		if (pasteGoods == "")
			pasteGoods := ClientCode "`t" tempClass "`t" tempGoods
		else
			pasteGoods := pasteGoods "`n" ClientCode "`t" tempClass "`t" tempGoods
		
		}
	Clipboard := pasteGoods
	xl.ActiveSheet.Paste
	SetTimer, ChangeButtonsBack, -2000
	Sleep 1000
	xl.Sheets("Trademarks").Select
	xl.ActiveCell.Offset(1,0).Select
	}

Sleep 1000
return

F3::
ExportInventors:
Gui, 3: Submit, NoHide
xl.Sheets("Inventors").Select
gosub FindBlankRow
;GuiControl, 3: , Button4, Exported!
; GuiControlGet, NewInventors, , Edit15, 3
NewInventors := StrReplace(NewInventors, "`n", "; ")
Clipboard := ClientCode "`t" NewInventors
xl.ActiveSheet.Paste
SetTimer, ChangeButtonsBack, -2000
Sleep 1000
xl.Sheets("Patent").Select
Sleep 1000
xl.ActiveCell.Offset(1,0).Select
return


ClearAll2:
GuiControl, 3: , Edit1, 
ClearAll:
GuiControl, 3: , Edit2, 
GuiControl, 3: , Edit3, 
GuiControl, 3: , Edit4, 
GuiControl, 3: , Edit5, 
GuiControl, 3: , Edit6, 
GuiControl, 3: , Edit7, 
GuiControl, 3: , Edit8, 
GuiControl, 3: , Edit9, 
GuiControl, 3: , Edit10, 
GuiControl, 3: , Edit11, 
GuiControl, 3: , Edit12, 
GuiControl, 3: , Edit13, 
GuiControl, 3: , Edit14, 
GuiControl, 3: , Edit15, 
GuiControl, 3: , Edit16, 
GuiControl, 3: , Edit17, 
GuiControl, 3: , Edit18, 
return

ClearAll2TSDR:
GuiControl, 3: , Edit19, 
GuiControl, 3: , Edit20, 
GuiControl, 3: , Edit21, 
GuiControl, 3: , Edit22, 
GuiControl, 3: , Edit23, 
GuiControl, 3: , Edit24, 
GuiControl, 3: , Edit25, 
GuiControl, 3: , Edit26, 
GuiControl, 3: , Edit27, 
GuiControl, 3: , Edit28, 
GuiControl, 3: , Edit29, 
GuiControl, 3: , Edit30, 
GuiControl, 3: , Edit31, 
GuiControl, 3: , Edit32, 
GuiControl, 3: , Button7, 0
GuiControl, 3: , Button8, 0
GuiControl, 3: , Button9, 0
GuiControl, 3: , Button10, 0
GuiControl, 3: , Button11, 0
GuiControl, 3: , Button12, 0
GuiControl, 3: , Button13, 0
GuiControl, 3: , Button14, 0
GuiControl, 3: , Button15, 0
GuiControl, 3: , Button16, 0
GuiControl, 3: , Button17, 0
GuiControl, 3: , Button18, 0

return

3GuiClose:
ExitApp
return

ChangeButtonsBack:
;GuiControl, 3: , Button3, Export`nBiblio!
;GuiControl, 3: , Button4, Export`nInventors
;GuiControl, 3: , Button5, Export`nPriorities
return


F1::
InitiateSearch:
Gui, 3: Submit, NoHide
xl := ComObjActive("Excel.Application")
sheetname := xl.ActiveSheet.Name

if (sheetname == "Patent")
	{
	ClientCode := % xl.Range(PAIR2 . xl.ActiveCell.Row).Value
	GuiControl, 3: , Edit1, % xl.Range(PAIR1 . xl.ActiveCell.Row).Value
	gosub Search
	Sleep 1500
	if (Title != "")
		gosub Export
	Sleep 500
	}
else if (sheetname == "Trademarks")
	{
	ClientCode := % xl.Range(PAIR1T . xl.ActiveCell.Row).Value
	
	GuiControl, 3: , Edit19, % xl.Range(PAIR6T . xl.ActiveCell.Row).Value
	GuiControl, 3: , Edit33, % xl.Range(PAIR1T . xl.ActiveCell.Row).Value
	gosub SearchTSDR
	Sleep 1500
	if (TSDR_Mark != "")
		gosub ExportTSDR
	Sleep 500

	}
;else if (sheetname == "Priorities")
;	{
;	GuiControl, 3: , Edit1, % xl.ActiveCell.Offset(0,3).Value
;	gosub Search
;	Sleep 1500
;	gosub ExportPriorities
;	}
;else if (sheetname == "Inventors")
;	{
;	GuiControl, 3: , Edit1, % xl.ActiveCell.Offset(0,3).Value
;	gosub Search
;	Sleep 1500
;	gosub ExportInventors
;	
;	}
;else
;	return
	
return

ExportTSDR:
NewVar := ""
Gui, 3: Submit, NoHide
;GuiControl, 3: , Button3, Exported!
; NewVar := Title "`t" AppNumber3 "`t" FilingDate "`t" EarliestPub "`t" newPubDate "`t" PatentNumber "`t" IssueDate "`t"  "`t"  "`t" applicants "`t" Status "`t"  "`t" "`t" ConfirmNumber  "`t" ArtUnit  "`t" Examiner  "`t" "`t"  "`t"  "`t" "`t" PTAAdjust
;NewVar := StrReplace(NewVar, "`n", "; ")
;Clipboard := NewVar

xl := ComObjActive("Excel.Application")

if (TabName == "TSDR")
	{
	;xl.Range(PAIR14 . xl.ActiveCell.Row).Value := Title
	;xl.Range(PAIR1 . xl.ActiveCell.Row).Value := ApplicationNo
	;xl.Range(PAIR3 . xl.ActiveCell.Row).Value := FilingDate
	;xl.Range(PAIR4 . xl.ActiveCell.Row).Value := EarliestPub
	;xl.Range(PAIR5 . xl.ActiveCell.Row).Valuee := newPubDate
	;xl.Range(PAIR6 . xl.ActiveCell.Row).Value := PatentNumber
	;xl.Range(PAIR7 . xl.ActiveCell.Row).Value:= IssueDate 
	;xl.Range(PAIR15 . xl.ActiveCell.Row).Value := applicants 
	;xl.Range(PAIR13 . xl.ActiveCell.Row).Value:= Status
	;xl.Range(PAIR11 . xl.ActiveCell.Row).Value := ConfirmNumber
	;xl.Range(PAIR10 . xl.ActiveCell.Row).Value := ArtUnit 
	;xl.Range(PAIR8 . xl.ActiveCell.Row).Value := Examiner
	;xl.Range(PAIR9 . xl.ActiveCell.Row).Value:= PTAAdjust
	
	xl.Range(PAIR8T . xl.ActiveCell.Row).Value:=	TSDR_RegNo
	xl.Range(PAIR9T . xl.ActiveCell.Row).Value:=	TSDR_RegDate
	xl.Range(PAIR7T . xl.ActiveCell.Row).Value:=	TSDR_FilingDate
	xl.Range(PAIR2T . xl.ActiveCell.Row).Value:=	TSDR_Status
	xl.Range(PAIR3T . xl.ActiveCell.Row).Value:=	TSDR_Mark
	xl.Range(PAIR4T . xl.ActiveCell.Row).Value:=	TSDR_PriorNumber
	xl.Range(PAIR5T . xl.ActiveCell.Row).Value:=	TSDR_PriorDate
	xl.Range(PAIR10T . xl.ActiveCell.Row).Value:=	TSDR_Applicant
	}

SetTimer, ChangeButtonsBack, -2000
return

return


Export:
NewVar := ""
Gui, 3: Submit, NoHide
;GuiControl, 3: , Button3, Exported!
; NewVar := Title "`t" AppNumber3 "`t" FilingDate "`t" EarliestPub "`t" newPubDate "`t" PatentNumber "`t" IssueDate "`t"  "`t"  "`t" applicants "`t" Status "`t"  "`t" "`t" ConfirmNumber  "`t" ArtUnit  "`t" Examiner  "`t" "`t"  "`t"  "`t" "`t" PTAAdjust
;NewVar := StrReplace(NewVar, "`n", "; ")
;Clipboard := NewVar

xl := ComObjActive("Excel.Application")

; GuiControl, 3: , Edit1, % xl.Range(PAIR1 . xl.ActiveCell.Row).Value

; xl.ActiveCell.Offset(0,6).Value := Title
;xl.Range(PAIR14 . xl.ActiveCell.Row).Value := Title
;xl.ActiveCell.Offset(0,7).Value := ApplicationNo
;xl.ActiveCell.Offset(0,8).Value := FilingDate
;xl.ActiveCell.Offset(0,9).Value := EarliestPub
;xl.ActiveCell.Offset(0,10).Value := newPubDate
;xl.ActiveCell.Offset(0,11).Value := PatentNumber
;xl.ActiveCell.Offset(0,12).Value := IssueDate 
;xl.ActiveCell.Offset(0,15).Value := applicants 
;xl.ActiveCell.Offset(0,16).Value := Status
;xl.ActiveCell.Offset(0,19).Value := ConfirmNumber
;xl.ActiveCell.Offset(0,20).Value := ArtUnit 
;xl.ActiveCell.Offset(0,21).Value := Examiner
;xl.ActiveCell.Offset(0,25).Value := PTAAdjust

if (TabName == "PAIR")
	{
	xl.Range(PAIR14 . xl.ActiveCell.Row).Value := Title
	xl.Range(PAIR1 . xl.ActiveCell.Row).Value := ApplicationNo
	xl.Range(PAIR3 . xl.ActiveCell.Row).Value := FilingDate
	xl.Range(PAIR4 . xl.ActiveCell.Row).Value := EarliestPub
	xl.Range(PAIR5 . xl.ActiveCell.Row).Value := newPubDate
	xl.Range(PAIR6 . xl.ActiveCell.Row).Value := PatentNumber
	xl.Range(PAIR7 . xl.ActiveCell.Row).Value:= IssueDate 
	xl.Range(PAIR15 . xl.ActiveCell.Row).Value := applicants 
	xl.Range(PAIR13 . xl.ActiveCell.Row).Value:= Status
	xl.Range(PAIR11 . xl.ActiveCell.Row).Value := ConfirmNumber
	xl.Range(PAIR10 . xl.ActiveCell.Row).Value := ArtUnit 
	xl.Range(PAIR8 . xl.ActiveCell.Row).Value := Examiner
	xl.Range(PAIR9 . xl.ActiveCell.Row).Value:= PTAAdjust
	xl.Range(PAIR12 . xl.ActiveCell.Row).Value:= AttyDockNumber
	}

SetTimer, ChangeButtonsBack, -2000
return

Search:

Title := ""
ApplicationNo := ""
FilingDate := ""
EarliestPub := ""
newPubDate := ""
PatentNumber := ""
IssueDate  := ""
applicants  := ""
Status := ""
ConfirmNumber := ""
ArtUnit  := ""
Examiner := ""
PTAAdjust := ""
Gui, 3: Submit, NoHide

ApplicationNo := Trim(ApplicationNo)
GuiControl, 3: , Edit1, %ApplicationNo%

if !InStr(ApplicationNo, "/")
	{
	TempAppArray := StrSplit(ApplicationNo)
	TempAppNumber := TempAppArray[1] TempAppArray[2] "/" TempAppArray[3] TempAppArray[4] TempAppArray[5] TempAppArray[6] TempAppArray[7] TempAppArray[8]
	GuiControl, 3: , Edit1, %TempAppNumber%
	}

gosub ClearAll

EndPoint := "https://ped.uspto.gov/api/queries"

ApplicationNo := StrReplace(ApplicationNo, "/", "")

newvalue = {"searchText":"applId:(%ApplicationNo%)","qf":"applId"}

;***********API call*******************
http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http.Open("POST",EndPoint)
HTTP.SetRequestHeader("Accept","application/json, text/plain, */*")
HTTP.SetRequestHeader("Accept-Encoding","gzip, deflate, br")
HTTP.SetRequestHeader("Accept-Language","en-US,en;q=0.9")
HTTP.SetRequestHeader("ADRUM","isAjax:true")
HTTP.SetRequestHeader("Connection","keep-alive")
HTTP.SetRequestHeader("Content-Length", "493")
HTTP.SetRequestHeader("Content-Type", "application/json;charset=UTF-8")
HTTP.SetRequestHeader("Cookie","_ga=GA1.2.2084983038.1546904864; _4c_=fVLdauM8EH2Vous4kSzZlnPX%2FWEpLEuh3V2%2BK2NLY0fUkYykxpuWvntHcRpKP6gvjM6ZM2dGmnkm8w4s2bKiohUvRF3mpVyRBzgGsn0makr%2FQ%2Fo9%2BpFsyS7GKWw3m3me149him49uMNmaiPYGLIBYjR2yEJsfQS9MTaCt200zrZjNnkXQSWwGUbXIaNdCAZ8ZqyJBmUHICuinAasxOp1uS4RxydEmcgpntFCP6rYxOOUNDN0V0E%2FYOB26QC5%2FxDd%2B1bDvvUPifiFxM1t87Odm1s3GnVsbmzvzoE%2FYLXz75nrQ2vG5vuInXpnjWq%2BmKfmLj3H4mTj2FzjLQ7YMryx9xCi2Tt7bO4mALW7BDrv5gAe0dedd3u4qtKVenxW0mstuh6oZG2ppIQyr3he9yWnea8EKNS5ZPPXYItzQOihB%2B9Pbu%2FnMDg3jLBWbr9BUTAxPc1lOGcKJ%2FrGZgs74VgJw8PoVDumHFyEFf4SH%2BKA5x%2FXzc03RDmVopaccrlmhShrKmQplvjvTwQvK%2FJvWS2ZMylzwTiOM%2BIeYZSmDxXe6POOEVVryQqkuaqY5rTmvC6o6LpS14y3EisufrJgTEjK6xINJvQ75bNLuQqbkVTQ4lyOiUu5dOsP6lNzqK7%2B39wyvk9y6o85Ly%2Bv; _gid=GA1.2.2030672407.1573491524; _ga=GA1.3.2084983038.1546904864; _gid=GA1.3.2030672407.1573491524; ADRUM=s=1573514504659&r=https%3A%2F%2Fped.uspto.gov%2Fpeds%2F%3F-1274517228")
HTTP.SetRequestHeader("Host","ped.uspto.gov")
HTTP.SetRequestHeader("Referer","https://ped.uspto.gov/peds/")
HTTP.SetRequestHeader("Sec-Fetch-Mode","cors")
HTTP.SetRequestHeader("Sec-Fetch-Site","same-origin")
http.Send(newvalue)


value := JSON.Load(http.Responsetext)


Title := value.queryResults.searchResponse.response.docs[0 + 1].patentTitle
ArtUnit := value.queryResults.searchResponse.response.docs[0 + 1].appGrpArtNumber
ConfirmNumber := value.queryResults.searchResponse.response.docs[0 + 1].appConfrNumber
AttyDockNumber := value.queryResults.searchResponse.response.docs[0 + 1].appAttrDockNumber
Status := value.queryResults.searchResponse.response.docs[0 + 1].appStatus
PatentNumber := value.queryResults.searchResponse.response.docs[0 + 1].patentNumber

AppNumber := value.queryResults.searchResponse.response.docs[0 + 1].applid
AppArray := StrSplit(AppNumber)
AppNumber := AppArray[1] AppArray[2] "/" AppArray[3] AppArray[4] AppArray[5] AppArray[6] AppArray[7] AppArray[8]

tempIssue := SubStr(value.queryResults.searchResponse.response.docs[0 + 1].patentIssueDate, 1, 10)
tempIssue := StrReplace(tempIssue, "-", "")

IssueDate := ""

if (tempIssue != "")
	FormatTime, IssueDate, %tempIssue%, dd-MMM-yyyy

tempFiling := SubStr(value.queryResults.searchResponse.response.docs[0 + 1].appFilingDate, 1, 10)
tempFiling := StrReplace(tempFiling, "-", "")

if (tempFiling != "")
	FormatTime, FilingDate, %tempFiling%, dd-MMM-yyyy

applicantNumber := value.queryResults.searchResponse.response.docs[0 + 1].applicants.Length()

applicants := ""
Loop % applicantNumber
	{
	tempApplicant := value.queryResults.searchResponse.response.docs[0 + 1].applicants[A_Index].nameLineOne
	if (applicants == "")
		applicants := tempApplicant
	else
		applicants := applicants "`n" tempApplicant
	}

PriorFamily := value.queryResults.searchResponse.response.docs[0 + 1].parentContinuity.Length()

if (PriorFamily  == "")
	{
	priorities := ""
	}
else 
	{
	priorities := ""
	Loop % PriorFamily
		{
		PriorNumber := value.queryResults.searchResponse.response.docs[0 + 1].parentContinuity[A_Index].claimApplicationNumberText
		PriorDate 	:= value.queryResults.searchResponse.response.docs[0 + 1].parentContinuity[A_Index].filingDate
		
		if !InStr(PriorNumber, "PCT")
			{
			PriorCountry := "US"
			PriorArray := StrSplit(PriorNumber)
			PriorNumber := PriorArray[1] PriorArray[2] "/" PriorArray[3] PriorArray[4] PriorArray[5] PriorArray[6] PriorArray[7] PriorArray[8]
			}
		else
			{
			PriorCountry := "WO"	
		
			}
		if (priorities == "")
			priorities := PriorCountry "`t`t" PriorNumber "`t" PriorDate
		else
			priorities := priorities "`n" PriorCountry "`t`t" PriorNumber "`t" PriorDate
		}
	}

ForeignPriority := value.queryResults.searchResponse.response.docs[0 + 1].foreignPriority.Length()

if (ForeignPriority != "")
	{
	foreignpriorities := ""
	Loop % ForeignPriority
		{
		foreignPriorNum := value.queryResults.searchResponse.response.docs[0 + 1].foreignPriority[A_Index].priorityClaim
		foreignPriorCountry := value.queryResults.searchResponse.response.docs[0 + 1].foreignPriority[A_Index].countryName
		foreignFilingDate := value.queryResults.searchResponse.response.docs[0 + 1].foreignPriority[A_Index].filingDate

		if (foreignpriorities == "")
			foreignpriorities := foreignPriorCountry "`t`t" foreignPriorNum  "`t" foreignFilingDate
		else
			foreignpriorities := foreignpriorities "`n" foreignPriorCountry "`t`t" foreignPriorNum  "`t" foreignFilingDate
		}
	}
else 
	{
	foreignpriorities := ""
	}
	
; MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].foreignPriority[1].countryName
; MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].parentContinuity[1].filingDate
; MsgBOx, % value.queryResults.searchResponse.response.docs[0 + 1].parentContinuity.Length()
; MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].inventors.Length()
; MsgBox, % newInventors[1] "`n" newInventors[2]
; MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].appEarlyPubDate

tempDate := SubStr(value.queryResults.searchResponse.response.docs[0 + 1].appEarlyPubDate, 1, 10)
tempDate := StrReplace(tempDate, "-", "")

if (tempDate != "")
	FormatTime, newPubDate, %tempDate%, dd-MMM-yyyy

; inventors := value.queryResults.searchResponse.response.docs[0 + 1].inventorsFacet
; MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].inventors.Length()

inventors := ""

Loop % value.queryResults.searchResponse.response.docs[0 + 1].inventors.Length()
	{
	tempFirst := Trim(value.queryResults.searchResponse.response.docs[0 + 1].inventors[A_Index].nameLineOne)
	tempLast := Trim(value.queryResults.searchResponse.response.docs[0 + 1].inventors[A_Index].nameLineTwo)
	
	if (inventors == "")
		inventors := tempFirst ", " tempLast
	else
		inventors := inventors "`n" tempFirst ", " tempLast
	}


; StringReplace, inventors, inventors, |||
; StringReplace, inventors, inventors, |||
; newInventors := StrSplit(inventors, ",")

EarliestPub := value.queryResults.searchResponse.response.docs[0 + 1].appEarlyPubNumber

if (EarliestPub != "")
	{
	PubArray := StrSplit(EarliestPub)
	EarliestPub := PubArray[3] PubArray[4] PubArray[5] PubArray[6] "/" PubArray[7] PubArray[8] PubArray[9] PubArray[10] PubArray[11] PubArray[12] PubArray[13] " " PubArray[14] PubArray[15]
	}

	
; pub no. 2008/0222108 A1)
; priority app 60/852584) 


PTAAdjust := value.queryResults.searchResponse.response.docs[0 + 1].totalPtoDays
if (PTAAdjust == "")
	PTAAdjust := "0"

Examiner := value.queryResults.searchResponse.response.docs[0 + 1].appExamName
Examiner := Format("{1:Ts}", Examiner)

checkMiddleInitial := SubStr(Examiner, -1, 1)

if (checkMiddleInitials == "")
	Examiner := Examiner . "."

; https://the-automator.com/autohotkey-format-function-change-case-of-text-pad-it-set-decimals-much-more/


; ; ; ; ; ; ; MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].assignments.Length()

reel  := value.queryResults.searchResponse.response.docs[0 + 1].assignments[1].reelNumber
frame := value.queryResults.searchResponse.response.docs[0 + 1].assignments[1].frameNumber
recordDate := value.queryResults.searchResponse.response.docs[0 + 1].assignments[1].recordedDate
mailDate := value.queryResults.searchResponse.response.docs[0 + 1].assignments[1].mailDate
conveyance := value.queryResults.searchResponse.response.docs[0 + 1].assignments[1].converyanceName
assignor := value.queryResults.searchResponse.response.docs[0 + 1].assignments[1].assignors[1].assignorName

;MsgBox, % assignor

assignee := value.queryResults.searchResponse.response.docs[0 + 1].assignments[1].assignee[1].assigneeName

;MsgBox, % assignee

assignmentCombined := "From: " assignor "`nTo: " assignee "`nConveyance: " conveyance "`nMail Date: " mailDate "`nRecord Date: " recordDate "`nReel/Frame: " reel "/" frame



; https://the-automator.com/xml-parsing-is-super-easy-with-this-autohotkey-class/
; https://assignment-api.uspto.gov/patent/advancedSearch?applicationNumber=12940747
; https://assignment-api.uspto.gov/documentation-patent/#!/advancedSearch/advancedSearch
; https://assignment.uspto.gov/patent/index.html#/patent/search



GuiControl, 3: , Edit36, % assignmentCombined

GuiControl, 3: , Edit3, % EarliestPub
GuiControl, 3: , Edit4, % newPubDate
GuiControl, 3: , Edit7, % Examiner
GuiControl, 3: , Edit8, % PTAAdjust
GuiControl, 3: , Edit15, % inventors
GuiControl, 3: , Edit16, % priorities
GuiControl, 3: , Edit17, % foreignpriorities
GuiControl, 3: , Edit14, % applicants
GuiControl, 3: , Edit13, % Title
GuiControl, 3: , Edit9, % ArtUnit
GuiControl, 3: , Edit10, % ConfirmNumber
GuiControl, 3: , Edit11, % AttyDockNumber
GuiControl, 3: , Edit12, % Status
GuiControl, 3: , Edit5, % PatentNumber
GuiControl, 3: , Edit6, % IssueDate
GuiControl, 3: , Edit2, % FilingDate
GuiControl, 3: , Edit18, % ClientCode






;Loop % value.queryResults.searchResponse.response.docs[0 + 1].inventors.Length()
;	MsgBox, % 	value.queryResults.searchResponse.response.docs[0 + 1].inventors[A_Index].nameLineOne " " value.queryResults.searchResponse.response.docs[0 + 1].inventors[A_Index].nameLineTwo ", " value.queryResults.searchResponse.response.docs[0 + 1].inventors[A_Index].city " " value.queryResults.searchResponse.response.docs[0 + 1].inventors[A_Index].geoCode " " value.queryResults.searchResponse.response.docs[0 + 1].inventors[A_Index].country ", " 				value.queryResults.searchResponse.response.docs[0 + 1].inventors[A_Index].rankNo



; MsgBox, % ApplicationNo

 tempURL = https://www.patentsview.org/api/Knobbes/query?q={"app_number":"%ApplicationNo%"}&f=["patent_abstract"]&format=xml
; Run, % tempURL


;whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
;whr.Open("GET", tempURL, true)
;Run, % tempURL
;whr.Send()
;whr.Send()
;whr.Send()
; Using 'true' above and the call below allows the script to remain responsive.
;whr.WaitForResponse()
;version := whr.ResponseText
; MsgBox % version
;abstract := StrSplit(version, "<patent_abstract>")
;newAbstract := StrSplit(abstract[2], "</patent_abstract>")
;MsgBox, % newAbstract[1]


;EndPoint1a = https://www.patentsview.org/api/Knobbes/query?q={"app_number":
;EndPoint2a = "%ApplicationNo%"
;EndPoint3a = }&f=["patent_abstract"]&format=json

;searchURL := EndPoint1a .  EndPoint2a . EndPoint3a

; MsgBox, % searchURL

;http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
;http.Open("GET", searchURL)

;HTTP.SetRequestHeader("Accept","application/json")
;http.Send()

;value := JSON.Load(http.Responsetext)

;MsgBOx, % value.Length()

return

TryForAbstract:
Gui, 3: Submit, NoHide
ApplicationNo := Trim(ApplicationNo)
GuiControl, 3: , Edit1, %ApplicationNo%
if !InStr(ApplicationNo, "/")
	{
	TempAppArray := StrSplit(ApplicationNo)
	TempAppNumber := TempAppArray[1] TempAppArray[2] "/" TempAppArray[3] TempAppArray[4] TempAppArray[5] TempAppArray[6] TempAppArray[7] TempAppArray[8]
	GuiControl, 3: , Edit1, %TempAppNumber%
	}

ApplicationNo := StrReplace(ApplicationNo, "/", "")
tempURL = https://www.patentsview.org/api/Knobbes/query?q={"app_number":"%ApplicationNo%"}&f=["patent_abstract"]&format=xml
Run, % tempURL

;whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
;whr.Open("GET", tempURL, true)
;Run, % tempURL
;whr.Send()
;whr.Send()
;whr.Send()
; Using 'true' above and the call below allows the script to remain responsive.
;whr.WaitForResponse()
;version := whr.ResponseText
; MsgBox % version
;abstract := StrSplit(version, "<patent_abstract>")
;newAbstract := StrSplit(abstract[2], "</patent_abstract>")
;MsgBox, % newAbstract[1]

return



SearchTSDR:
Gui, 3: Submit, NoHide

ApplicationNoTSDR := Trim(ApplicationNoTSDR)
GuiControl, 3: , Edit19, %ApplicationNoTSDR%

GuiControl, 3: , Edit30, Grabbing Applicant...


TSDR_RegNo := ""
TSDR_RegDate := ""
TSDR_FilingDate := ""
TSDR_PubNo := ""
TSDR_PubDate := ""
TSDR_AttyDocket := ""
TSDR_Status := ""
TSDR_PriorNumber := ""
TSDR_PriorDate := ""
TSDR_Mark := ""
TSDR_Applicant:= ""
TypeOfApp:= ""
TSDR_Allowance:= ""

if !InStr(ApplicationNoTSDR, "/")
	{
	TempAppArray := StrSplit(ApplicationNoTSDR)
	TempAppNumber := TempAppArray[1] TempAppArray[2] "/" TempAppArray[3] TempAppArray[4] TempAppArray[5] TempAppArray[6] TempAppArray[7] TempAppArray[8]
	GuiControl, 3: , Edit19, %TempAppNumber%
	}
	
ApplicationNoTSDR := StrReplace(ApplicationNoTSDR, "/", "")


EndPoint1 := "https://tsdrapi.uspto.gov/ts/cd/casestatus/sn"
EndPoint2 := ApplicationNoTSDR
EndPoint3 := "/info.json"

http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http.Open("GET", EndPoint1 . EndPoint2 . EndPoint3)

HTTP.SetRequestHeader("Accept","application/json")
http.Send()

value := JSON.Load(http.Responsetext)

;MsgBox, % value.trademarks[0 + 1].status.serialNumber

TSDR_RegNo := value.trademarks[0 + 1].status.usRegistrationNumber


TSDR_RegDate := value.trademarks[0 + 1].status.usRegistrationDate
TSDR_RegDate := StrReplace(TSDR_RegDate, "-", "")
if (TSDR_RegDate != "")
	FormatTime, TSDR_RegDate, %TSDR_RegDate%, dd-MMM-yyyy

TSDR_AttyDocket := value.trademarks[0 + 1].status.attrnyDktNumber

TSDR_FilingDate := value.trademarks[0 + 1].status.filingDate
TSDR_FilingDate := StrReplace(TSDR_FilingDate, "-", "")
if (TSDR_FilingDate != "")
	FormatTime, TSDR_FilingDate, %TSDR_FilingDate%, dd-MMM-yyyy


TSDR_PubNo := value.trademarks[0 + 1].publication.serialNumber
if !InStr(TSDR_PubNo, "/")
	{
	TempAAAppArray := StrSplit(TSDR_PubNo)
	TSDR_PubNo := TempAAAppArray[1] TempAAAppArray[2] "/" TempAAAppArray[3] TempAAAppArray[4] TempAAAppArray[5] TempAAAppArray[6] TempAAAppArray[7] TempAAAppArray[8]
	}

TSDR_PubDate := value.trademarks[0 + 1].publication.datePublished
TSDR_PubDate := StrReplace(TSDR_PubDate, "-", "")
if (TSDR_PubDate != "")
	FormatTime, TSDR_PubDate, %TSDR_PubDate%, dd-MMM-yyyy


TSDR_Allowance := value.trademarks[0 + 1].publication.noticeOfAllowanceDate
TSDR_Allowance := StrReplace(TSDR_Allowance, "-", "")
if (TSDR_Allowance != "")
	FormatTime, TSDR_Allowance, %TSDR_Allowance%, dd-MMM-yyyy

TSDR_Status := value.trademarks[0 + 1].status.tm5StatusDesc ; extStatusDesc

;MsgBox, % value.trademarks[0 + 1].intlRegistrationList.Length() " | madrid? "
;MsgBox, % value.trademarks[0 + 1].foreignInfoList.Length() " | foreign? "
;MsgBox, % value.trademarks[0 + 1].divisional.childOf " | div? "



TypeOfApp := "Standard"


if (value.trademarks[0 + 1].divisional.childOf != "")
	{
	TypeOfApp := "Divisional"
	TSDR_PriorNumber := value.trademarks[0 + 1].divisional.childOf
	
	if !InStr(TSDR_PriorNumber, "/")
		{
		TempAAAppArray := StrSplit(TSDR_PriorNumber)
		TSDR_PriorNumber := TempAAAppArray[1] TempAAAppArray[2] "/" TempAAAppArray[3] TempAAAppArray[4] TempAAAppArray[5] TempAAAppArray[6] TempAAAppArray[7] TempAAAppArray[8]
		}
	
	TSDR_PriorDate := value.trademarks[0 + 1].status.filingDate
	
	TSDR_PriorDate := StrReplace(TSDR_PriorDate, "-", "")
	if (TSDR_PriorDate != "")
		FormatTime, TSDR_PriorDate, %TSDR_PriorDate%, dd-MMM-yyyy
	}

if (value.trademarks[0 + 1].foreignInfoList.Length() > 0)
	{
	TypeOfApp := "Foreign"

	TSDR_PriorNumber := value.trademarks[0 + 1].foreignInfoList[1].frgnApplNum
	TSDR_PriorDate := value.trademarks[0 + 1].foreignInfoList[1].frgnApplFilingDt	
	
	TSDR_PriorNumber := value.trademarks[0 + 1].foreignInfoList[1].frgnCountryCd " " TSDR_PriorNumber
	
	TSDR_PriorDate := StrReplace(TSDR_PriorDate, "-", "")
	if (TSDR_PriorDate != "")
		FormatTime, TSDR_PriorDate, %TSDR_PriorDate%, dd-MMM-yyyy
	
	}
	
if (value.trademarks[0 + 1].intlRegistrationList.Length() > 0)
	{
	TypeOfApp := "Madrid"
	TSDR_PriorNumber := value.trademarks[0 + 1].intlRegistrationList[1].registrationNum
	TSDR_PriorDate := value.trademarks[0 + 1].intlRegistrationList[1].registrationDate
	
	TSDR_PriorDate := StrReplace(TSDR_PriorDate, "-", "")
	if (TSDR_PriorDate != "")
		FormatTime, TSDR_PriorDate, %TSDR_PriorDate%, dd-MMM-yyyy
	}

if (value.trademarks[0 + 1].status.markElement != "")
	TSDR_Mark := value.trademarks[0 + 1].status.markElement
else
	TSDR_Mark := value.trademarks[0 + 1].status.descOfMark


; MsgBox, % value.trademarks[0 + 1].parties.ownerGroups.Length()

; http://trademarkesearch.com/tsdrapi.html

GuiControl, 3: , Edit23, % TSDR_RegNo
GuiControl, 3: , Edit24, % TSDR_RegDate
GuiControl, 3: , Edit20, % TSDR_FilingDate
GuiControl, 3: , Edit21, % TSDR_PubDate
GuiControl, 3: , Edit22, % TSDR_Allowance
GuiControl, 3: , Edit25, % TSDR_AttyDocket
GuiControl, 3: , Edit26, % TSDR_Status
GuiControl, 3: , Edit27, % TSDR_PriorNumber
GuiControl, 3: , Edit28, % TSDR_PriorDate
GuiControl, 3: , Edit29, % TypeOfApp
GuiControl, 3: , Edit31, % TSDR_Mark

;MsgBOx, % value.trademarks[0 + 1].intlRegistrationList[0 + 1].registrationNum
;MsgBOx, % value.trademarks[0 + 1].intlRegistrationList[0 + 1].registrationDate

goodsTSDR := ""
Loop % value.trademarks[0 + 1].gsList.Length()
	{
	tempClass := value.trademarks[0 + 1].gsList[A_Index].primeClassCode
	tempGoods := value.trademarks[0 + 1].gsList[A_Index].description

	if (goodsTSDR == "")
		goodsTSDR := tempClass " " tempGoods
	else
		goodsTSDR := goodsTSDR "`n`n" tempClass " " tempGoods		
	}
GuiControl, 3: , Edit32, % goodsTSDR


TSDR_FiledUse 		:= value.trademarks[0 + 1].status.filedUse
TSDR_FiledITU 		:= value.trademarks[0 + 1].status.filedItu
TSDR_Filed44D 		:= value.trademarks[0 + 1].status.filed44d
TSDR_Filed44E 		:= value.trademarks[0 + 1].status.filed44e
TSDR_Filed66A 		:= value.trademarks[0 + 1].status.filed66a
TSDR_FiledNoBasis 	:= value.trademarks[0 + 1].status.filedNoBasis
TSDR_CurrentUse 	:= value.trademarks[0 + 1].status.useCurr
TSDR_CurrentITU 	:= value.trademarks[0 + 1].status.ituCurr
TSDR_Current44D 	:= value.trademarks[0 + 1].status.sect44dCurr
TSDR_Current44E 	:= value.trademarks[0 + 1].status.sect44eCurr
TSDR_Current66A 	:= value.trademarks[0 + 1].status.sect66aCurr
TSDR_CurrentNoBasis := value.trademarks[0 + 1].status.noBasisCurr


GuiControl, 3: , Button7,  %TSDR_FiledUse%
GuiControl, 3: , Button8,  %TSDR_CurrentUse%
GuiControl, 3: , Button9,  %TSDR_FiledITU%
GuiControl, 3: , Button10, %TSDR_CurrentITU%
GuiControl, 3: , Button11, %TSDR_Filed44D%
GuiControl, 3: , Button12, %TSDR_Current44D%
GuiControl, 3: , Button13, %TSDR_Filed44E%
GuiControl, 3: , Button14, %TSDR_Current44E%
GuiControl, 3: , Button15, %TSDR_Filed66A%
GuiControl, 3: , Button16, %TSDR_Current66A%
GuiControl, 3: , Button17, %TSDR_FiledNoBasis%
GuiControl, 3: , Button18, %TSDR_CurrentNoBasis%

ie.Navigate("https://tsdrapi.uspto.gov/ts/cd/casestatus/sn" ApplicationNoTSDR "/content.html")
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
TSDR_Applicant := ie.document.getElementById("relatedProp-section").getElementsByClassName("value")[0].innerText

if (TSDR_Applicant == "")
	GuiControl, 3: , Edit30, Hmm... Couldn't find it. Open TSDR to check.
else
	GuiControl, 3: , Edit30, % TSDR_Applicant

return

; https://www.patentsview.org/api/Knobbes/query?q={"_gte":{"patent_number":"9518974"}}&f=["patent_number","patent_date"]
; https://www.patentsview.org/api/Knobbes/query?q={%22_gte%22:{%22patent_number%22:%229518974%22}}&f=[%22app_number%22]


#5::

ApplicationNo := "14/707972"
EndPoint := "https://developer.uspto.gov/ibd-api/v1/patent/package"

;newvalue = {"applicationNumbers":"%ApplicationNo%)","email":"Paperboy@knobbe.com","includePedData":"false"}
newvalue := "applicationNumbers=14707972&email=tyler.dickson%40knobbe.com&includePedData=false"

;***********API call*******************
http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http.Open("POST",EndPoint)
HTTP.SetRequestHeader(":authority","developer.uspto.gov")
HTTP.SetRequestHeader(":method","POST")
HTTP.SetRequestHeader(":path","/ibd-api/v1/patent/package")
HTTP.SetRequestHeader(":scheme","https")
HTTP.SetRequestHeader("Accept","application/json")
HTTP.SetRequestHeader("Accept-Encoding","gzip, deflate, br")
HTTP.SetRequestHeader("Accept-Language","en-US,en;q=0.9")
HTTP.SetRequestHeader("Connection","keep-alive")
HTTP.SetRequestHeader("Content-Length", "84")
HTTP.SetRequestHeader("Content-Type", "application/x-www-form-urlencode")
HTTP.SetRequestHeader("Cookie","_ga=GA1.2.861757589.1581031058; _4c_=dVPbbtswDP2VQs9RIjmSI%2Betu2AoMAwFuq2PhiMxtlBHMmTFXlrk30eljju0mAFD5CF5xEPTL2RswJEtl4qzNedcMSYX5AlOPdm%2BkGBNOgayJbsdk2CgomvJMipYxmkh85wWe7nb5LlQghuyIH8uXEqxDZOqKOR5QQZ75TC5MByqNdVCcSp0XlC1hx0t1vss3zNphJQzB%2FaTqcSRL0iMLWLYGz7IqLuJ8YVobwCZebHkfMmxOD6jS4ViaINLt%2FaxRvvbbfnr7gu6KucbuUHi5SQaG8X4MeAVpImx67er1TiOy2PfRb%2Bs%2FbCKoTJwqMLTm0WPnaki9LRyBl%2Fnj07DAVzsV85qoFUd4OJTfQwhnWBstN7RAUKfzhochKql4cLXYwtd8OaoYxlPXdI0wu6mN08YMDAgZzlaE5skNruom9AGbN3EBLNMJLgLyUFrtM748X3ZhM5lRZZy71EMNo%2F%2BD%2FR%2BXmVegbv78ns1lve%2BtfpU3rm9nwK%2FAdnCv8jtUNm2%2FNqCjsHjLMpP9rl8OM1MLrblrY52wHHAfCH00R68O5UPHYBu5sAu%2BLGHpOhzE%2FwBbjYFoj6FHy9C0uAC7AGHHN59wNr7uoWl9ocVJvU2pqnOX3WCcNWvKH1Fu2GaX%2Bt11aYa%2FEPO81pyvhGy4Hw9raXKxXUvu3baS%2F62xEKmbKauSyzesocP2RM3Kz5yvw6Cgvt%2FGWfvy87nvw%3D%3D; _gid=GA1.2.596402629.1581723419; _ga=GA1.3.861757589.1581031058; _gid=GA1.3.596402629.1581723419")
HTTP.SetRequestHeader("Referer","https://developer.uspto.gov/ibd-api-docs/")
HTTP.SetRequestHeader("Sec-Fetch-Mode","cors")
HTTP.SetRequestHeader("Sec-Fetch-Site","same-origin")
http.Send(newvalue)

value := http.Responsetext

MsgBox,  % value
return

;MsgBox, % value["queryResults"]["indexLastUpdatedDate"]
MsgBox, % value.queryResults.queryId
;MsgBox, % value.queryResults.searchResponse.response.numFound
;MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].applid
;MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].corrAddrCountryname
;MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].appExamName
;MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].appEarlyPubNumber
;MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].appGrpArtNumber
;MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].appStatus_txt
;MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].patentTitle
;MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].appAttrDockNumber
;MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].firstNamedApplicantFacet
;MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].corrAddrCustNo
;MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].appConfrNumber
;MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].appCustNumber
;MsgBox, % value.queryResults.searchResponse.response.docs[0 + 1].inventors.Length()


inventors := value.queryResults.searchResponse.response.docs[0 + 1].inventorsFacet

StringReplace, inventors, inventors, |||
StringReplace, inventors, inventors, |||

newInventors := StrSplit(inventors, ",")

MsgBox, % newInventors[1] " | " newInventors[2]


return

/*

{
  "queryResults": {
    "indexLastUpdatedDate": "Tue Nov 12 15:11:20 EST 2019",
    "searchResponse": {
      "responseHeader": {
        "zkConnected": true,
        "status": 0,
        "QTime": 93
      },
      "response": {
        "numFound": 1,
        "start": 0,
        "docs": [
          {
            "corrAddrCountryName": "UNITED STATES",
            "applId": "16184764",
            "assignments": [],
            "applicants": [
              {
                "nameLineOne": "11 Health and Technologies Inc.",
                "nameLineTwo": " ",
                "suffix": "",
                "streetOne": "",
                "streetTwo": "",
                "city": "Tustin, ",
                "geoCode": "CA",
                "country": "()",
                "rankNo": "1"
              }
            ],
            "applicantsFacet": "{||11 Health and Technologies Inc.||||Tustin|CA||ORG|1}",
            "appFilingDate": "2018-11-08T00:00:00Z",
            "appExamName": "ZALUKAEVA, TATYANA",
            "appExamNameFacet": "ZALUKAEVA, TATYANA",
            "publicInd": "Y",
            "APP_IND": "5",
            "inventorName": "Anupriya Jai Tilak Naik",
            "inventorNameFacet": "Anupriya Jai Tilak Naik",
            "appEarlyPubDate": "2019-05-09T00:00:00Z",
            "corrAddrGeoRegionCode": "CA",
            "appLocation": "ELECTRONIC",
            "appEarlyPubNumber": "US20190133810A1",
            "id": "16184764",
            "appGrpArtNumber": "3781",
            "appGrpArtNumberFacet": "3781",
            "applIdStr": "16184764",
            "appl_id_txt": "16184764",
            "appSubCls": "332000",
            "LAST_MOD_TS": "2019-11-12T09:21:49Z",
            "transactions": [
              {
                "recordDate": "2019-11-08 00:00:00",
                "code": "PA..",
                "description": "Change in Power of Attorney (May Include Associate POA)"
              },
              {
                "recordDate": "2019-10-08 00:00:00",
                "code": "DOCK",
                "description": "Case Docketed to Examiner in GAU"
              },
              {
                "recordDate": "2019-06-20 00:00:00",
                "code": "WIDS",
                "description": "Information Disclosure Statement (IDS) Filed"
              },
              {
                "recordDate": "2019-06-20 00:00:00",
                "code": "M844",
                "description": "Information Disclosure Statement (IDS) Filed"
              },
              {
                "recordDate": "2019-05-14 00:00:00",
                "code": "WIDS",
                "description": "Information Disclosure Statement (IDS) Filed"
              },
              {
                "recordDate": "2019-05-14 00:00:00",
                "code": "M844",
                "description": "Information Disclosure Statement (IDS) Filed"
              },
              {
                "recordDate": "2019-05-10 00:00:00",
                "code": "EML_NTR",
                "description": "Email Notification"
              },
              {
                "recordDate": "2019-05-09 00:00:00",
                "code": "CCRDY",
                "description": "Application ready for PDX access by participating foreign offices"
              },
              {
                "recordDate": "2019-05-09 00:00:00",
                "code": "PG-ISSUE",
                "description": "PG-Pub Issue Notification"
              },
              {
                "recordDate": "2019-03-12 00:00:00",
                "code": "M844",
                "description": "Information Disclosure Statement (IDS) Filed"
              },
              {
                "recordDate": "2019-04-25 00:00:00",
                "code": "MPTGR",
                "description": "Mail-Petition Decision - Granted"
              },
              {
                "recordDate": "2019-02-27 00:00:00",
                "code": "PTGR",
                "description": "Petition Decision - Granted"
              },
              {
                "recordDate": "2018-11-08 00:00:00",
                "code": "PET.",
                "description": "Petition Entered"
              },
              {
                "recordDate": "2019-03-12 00:00:00",
                "code": "WIDS",
                "description": "Information Disclosure Statement (IDS) Filed"
              },
              {
                "recordDate": "2019-02-28 00:00:00",
                "code": "EML_NTR",
                "description": "Email Notification"
              },
              {
                "recordDate": "2019-02-27 00:00:00",
                "code": "MTCPTG",
                "description": "Mail TC Petition Granted"
              },
              {
                "recordDate": "2019-02-25 00:00:00",
                "code": "TCPTG",
                "description": "TC Petition Granted"
              },
              {
                "recordDate": "2019-02-20 00:00:00",
                "code": "EML_NTR",
                "description": "Email Notification"
              },
              {
                "recordDate": "2019-02-20 00:00:00",
                "code": "R48ACLT",
                "description": "Letter Accepting Correction of Inventorship Under Rule 1.48"
              },
              {
                "recordDate": "2019-02-20 00:00:00",
                "code": "FLRCPT.U",
                "description": "Filing Receipt - Updated"
              },
              {
                "recordDate": "2019-01-24 00:00:00",
                "code": "DOCK",
                "description": "Case Docketed to Examiner in GAU"
              },
              {
                "recordDate": "2019-01-15 00:00:00",
                "code": "DOCK",
                "description": "Case Docketed to Examiner in GAU"
              },
              {
                "recordDate": "2019-01-08 00:00:00",
                "code": "OIPE",
                "description": "Application Dispatched from OIPE"
              },
              {
                "recordDate": "2018-12-17 00:00:00",
                "code": "EML_NTR",
                "description": "Email Notification"
              },
              {
                "recordDate": "2018-12-14 00:00:00",
                "code": "PGPC",
                "description": "Sent to Classification Contractor"
              },
              {
                "recordDate": "2018-12-14 00:00:00",
                "code": "FTFS",
                "description": "FITF set to YES - revise initial setting"
              },
              {
                "recordDate": "2018-11-08 00:00:00",
                "code": "PTA.RFE",
                "description": "Patent Term Adjustment - Ready for Examination"
              },
              {
                "recordDate": "2018-12-17 00:00:00",
                "code": "COMP",
                "description": "Application Is Now Complete"
              },
              {
                "recordDate": "2018-12-17 00:00:00",
                "code": "FLRCPT.O",
                "description": "Filing Receipt"
              },
              {
                "recordDate": "2018-12-17 00:00:00",
                "code": "COMP",
                "description": "Application Is Now Complete"
              },
              {
                "recordDate": "2018-12-13 00:00:00",
                "code": "SMAL",
                "description": "Applicant Has Filed a Verified Statement of Small Entity Status in Compliance with 37 CFR 1.27"
              },
              {
                "recordDate": "2018-11-08 00:00:00",
                "code": "SREXR141",
                "description": "PTO/SB/69-Authorize EPO Access to Search Results"
              },
              {
                "recordDate": "2018-11-08 00:00:00",
                "code": "APPERMS",
                "description": "Applicants have given acceptable permission for participating foreign "
              },
              {
                "recordDate": "2018-11-30 00:00:00",
                "code": "L128",
                "description": "Cleared by L&R (LARS)"
              },
              {
                "recordDate": "2018-11-16 00:00:00",
                "code": "L198",
                "description": "Referred to Level 2 (LARS) by OIPE CSR"
              },
              {
                "recordDate": "2018-11-08 00:00:00",
                "code": "SCAN",
                "description": "IFW Scan & PACR Auto Security Review"
              },
              {
                "recordDate": "2018-11-08 00:00:00",
                "code": "BIG.",
                "description": "ENTITY STATUS SET TO UNDISCOUNTED (INITIAL DEFAULT SETTING OR STATUS CHANGE)"
              },
              {
                "recordDate": "2018-11-08 00:00:00",
                "code": "IEXX",
                "description": "Initial Exam Team nn"
              }
            ],
            "LAST_INSERT_TIME": "2019-11-12T10:00:01Z",
            "appCls": "604",
            "appStatus": "Docketed New Case - Ready for Examination",
            "appStatusFacet": "Docketed New Case - Ready for Examination",
            "appStatus_txt": "Docketed New Case - Ready for Examination",
            "corrAddrStreetLineTwo": "FOURTEENTH FLOOR",
            "patentTitle": "OSTOMY MONITORING SYSTEM AND METHOD",
            "appStatusDate": "2019-01-15T00:00:000Z",
            "appAttrDockNumber": "11H.001A1",
            "inventors": [
              {
                "nameLineOne": "Naik",
                "nameLineTwo": "Anupriya Jai Tilak",
                "suffix": "",
                "streetOne": "",
                "streetTwo": "",
                "city": "Irvine, ",
                "geoCode": "CA",
                "country": "(US)",
                "rankNo": "2"
              },
              {
                "nameLineOne": "Wu",
                "nameLineTwo": "Yumeng ",
                "suffix": "",
                "streetOne": "",
                "streetTwo": "",
                "city": "Tustin, ",
                "geoCode": "CA",
                "country": "(US)",
                "rankNo": "4"
              },
              {
                "nameLineOne": "Seres",
                "nameLineTwo": "Michael ",
                "suffix": "",
                "streetOne": "",
                "streetTwo": "",
                "city": "Radlett, ",
                "geoCode": "",
                "country": "(GB)",
                "rankNo": "1"
              },
              {
                "nameLineOne": "Ramirez-Ayala",
                "nameLineTwo": "David ",
                "suffix": "",
                "streetOne": "",
                "streetTwo": "",
                "city": "Baldwin Park, ",
                "geoCode": "CA",
                "country": "(US)",
                "rankNo": "3"
              },
              {
                "nameLineOne": "Went",
                "nameLineTwo": "Bryan ",
                "suffix": "",
                "streetOne": "",
                "streetTwo": "",
                "city": "Camarillo, ",
                "geoCode": "CA",
                "country": "(US)",
                "rankNo": "5"
              },
              {
                "nameLineOne": "Kaefer",
                "nameLineTwo": "Sabrina ",
                "suffix": "",
                "streetOne": "",
                "streetTwo": "",
                "city": "Tustin, ",
                "geoCode": "CA",
                "country": "(US)",
                "rankNo": "7"
              },
              {
                "nameLineOne": "Went",
                "nameLineTwo": "Erick ",
                "suffix": "",
                "streetOne": "",
                "streetTwo": "",
                "city": "Camarillo, ",
                "geoCode": "CA",
                "country": "(US)",
                "rankNo": "6"
              },
              {
                "nameLineOne": "Dorofeeva",
                "nameLineTwo": "Irina ",
                "suffix": "",
                "streetOne": "",
                "streetTwo": "",
                "city": "Riverside, ",
                "geoCode": "CA",
                "country": "(US)",
                "rankNo": "8"
              },
              {
                "nameLineOne": "Zhao",
                "nameLineTwo": "Tianbin ",
                "suffix": "",
                "streetOne": "",
                "streetTwo": "",
                "city": "Irvine, ",
                "geoCode": "CA",
                "country": "(US)",
                "rankNo": "9"
              }
            ],
            "inventorsFacet": "{Anupriya|Jai Tilak|Naik||||Irvine|CA|US|IND|2},{Yumeng||Wu||||Tustin|CA|US|IND|4},{Michael||Seres||||Radlett||GB|IND|1},{David||Ramirez-Ayala||||Baldwin Park|CA|US|IND|3},{Bryan||Went||||Camarillo|CA|US|IND|5},{Sabrina||Kaefer||||Tustin|CA|US|IND|7},{Erick||Went||||Camarillo|CA|US|IND|6},{Irina||Dorofeeva||||Riverside|CA|US|IND|8},{Tianbin||Zhao||||Irvine|CA|US|IND|9}",
            "corrAddrStreetLineOne": "2040 MAIN STREET",
            "firstInventorFile": "Yes",
            "childContinuity": [
              {
                "claimApplicationNumberText": "16548662",
                "applicationNumberText": "16184764",
                "filingDate": "08-22-2019",
                "aiaIndicator": "Y",
                "patentNumberText": "",
                "applicationStatus": "Pending",
                "applicationStatusDescription": "claims the benefit of"
              }
            ],
            "appType": "Utility",
            "appTypeFacet": "Utility",
            "corrAddrPostalCode": "92614",
            "appCustNumber": "20995",
            "appClsSubCls": "604/332000",
            "appClsSubClsFacet": "604/332000",
            "corrAddrNameLineOne": "KNOBBE MARTENS OLSON & BEAR LLP",
            "firstNamedApplicant": [
              "  11 Health and Technologies Inc."
            ],
            "firstNamedApplicantFacet": "  11 Health and Technologies Inc.",
            "parentContinuity": [
              {
                "claimApplicationNumberText": "62584018",
                "applicationNumberText": "16184764",
                "filingDate": "11-09-2017",
                "aiaIndicator": "",
                "patentNumberText": "",
                "applicationStatus": "Expired",
                "applicationStatusDescription": "This application Claims Priority from Provisional Application"
              },
              {
                "claimApplicationNumberText": "62584611",
                "applicationNumberText": "16184764",
                "filingDate": "11-10-2017",
                "aiaIndicator": "",
                "patentNumberText": "",
                "applicationStatus": "Expired",
                "applicationStatusDescription": "This application Claims Priority from Provisional Application"
              },
              {
                "claimApplicationNumberText": "62637974",
                "applicationNumberText": "16184764",
                "filingDate": "03-02-2018",
                "aiaIndicator": "",
                "patentNumberText": "",
                "applicationStatus": "Expired",
                "applicationStatusDescription": "This application Claims Priority from Provisional Application"
              },
              {
                "claimApplicationNumberText": "62650511",
                "applicationNumberText": "16184764",
                "filingDate": "03-30-2018",
                "aiaIndicator": "",
                "patentNumberText": "",
                "applicationStatus": "Expired",
                "applicationStatusDescription": "This application Claims Priority from Provisional Application"
              },
              {
                "claimApplicationNumberText": "62675360",
                "applicationNumberText": "16184764",
                "filingDate": "05-23-2018",
                "aiaIndicator": "",
                "patentNumberText": "",
                "applicationStatus": "Expired",
                "applicationStatusDescription": "This application Claims Priority from Provisional Application"
              }
            ],
            "corrAddrCustNo": "20995",
            "corrAddrCountryCd": "US",
            "corrAddrCity": "IRVINE",
            "appEntityStatus": "SMALL",
            "appConfrNumber": "5658",
            "lastUpdatedTimestamp": "2019-11-12T18:45:41.265Z",
            "appAttrDockNumberFacet": "11H.001A1",
            "appEntityStatusFacet": "SMALL",
            "appCustNumberFacet": "20995",
            "_version_": 1650022855215153200,
            "firstInventorFileFacet": "Yes",
            "appLocationFacet": "ELECTRONIC",
            "appEarlyPubNumberFacet": "US20190133810A1"
          }
        ]
      },
      "facet_counts": {
        "facet_queries": {},
        "facet_fields": {
          "appClsSubClsFacet": [
            "604/332000",
            1,
            " /006000",
            0,
            " /013000",
            0,
            " /022000",
            0,
            " /094400",
            0,
            " /121000",
            0,
            " /174000",
            0,
            " /390100",
            0,
            " /544000",
            0,
            " /591100",
            0,
            " /PCT007",
            0,
            "0/",
            0,
            "000/",
            0,
            "000/00000",
            0,
            "000/000000",
            0,
            "001/",
            0,
            "001/001000",
            0,
            "001/PCT001",
            0,
            "001/PCT002",
            0,
            "001/PCT003",
            0,
            null,
            0
          ],
          "appGrpArtNumberFacet": [
            "3781",
            1,
            "0",
            0,
            "1037",
            0,
            "1101",
            0,
            "1102",
            0,
            "1103",
            0,
            "1104",
            0,
            "1105",
            0,
            "1106",
            0,
            "1107",
            0,
            "1108",
            0,
            "1109",
            0,
            "1111",
            0,
            "1112",
            0,
            "1113",
            0,
            "1201",
            0,
            "1202",
            0,
            "1203",
            0,
            "1204",
            0,
            "1205",
            0,
            null,
            0
          ],
          "appAttrDockNumberFacet": [
            "11H.001A1",
            1,
            "\tRI-38",
            0,
            "!93-019",
            0,
            "\" E-BOARD / USA \"",
            0,
            "\" The Space Saver\"",
            0,
            "\"24768-031\"",
            0,
            "\"52-3157\"",
            0,
            "\"AG\"",
            0,
            "\"B\"",
            0,
            "\"BD\"",
            0,
            "\"BJS-3977-12\"",
            0,
            "\"BM\"",
            0,
            "\"BO\"",
            0,
            "\"C\"",
            0,
            "\"C\" FILE",
            0,
            "\"CA\"",
            0,
            "\"DIVISION 1\"",
            0,
            "\"DQ\"",
            0,
            "\"E\"",
            0,
            "\"F167222\"",
            0,
            null,
            0
          ],
          "appCustNumberFacet": [
            "20995",
            1,
            "1",
            0,
            "100",
            0,
            "100001",
            0,
            "10004",
            0,
            "100064",
            0,
            "100065",
            0,
            "100070",
            0,
            "100072",
            0,
            "100074",
            0,
            "100081",
            0,
            "100083",
            0,
            "100085",
            0,
            "100087",
            0,
            "10009",
            0,
            "100097",
            0,
            "100098",
            0,
            "100101",
            0,
            "100102",
            0,
            "100109",
            0,
            null,
            0
          ],
          "appExamNameFacet": [
            "ZALUKAEVA, TATYANA",
            1,
            "A, MINH D",
            0,
            "A, PHI DIEU TRAN",
            0,
            "ABAD, FARLEY J",
            0,
            "ABAZA, AYMAN A",
            0,
            "ABBASZADEH, JAWEED A",
            0,
            "ABBOTT, BARBARA E",
            0,
            "ABBOTT-LEWIS, YVONNE RENEE",
            0,
            "ABD EL LATIF, HOSSAM M",
            0,
            "ABDALLA, KHALID M",
            0,
            "ABDEL RAHMAN, AHMED",
            0,
            "ABDEL-RAHMAN, AHMAD",
            0,
            "ABDELAZIEZ, YASSER A",
            0,
            "ABDELLAOUI, HAKEEM M",
            0,
            "ABDELNOUR, AHMED F",
            0,
            "ABDELNOUR, DENNIS J",
            0,
            "ABDELSALAM, FATHI K",
            0,
            "ABDELWAHED, ALI F",
            0,
            "ABDI, AMARA",
            0,
            "ABDI, KAMBIZ",
            0,
            null,
            0
          ],
          "applicantsFacet": [
            "{||11 Health and Technologies Inc.||||Tustin|CA||ORG|1}",
            1,
            "{'COMPAGNIE INDUSTRIELLE ET|FINANCIERE|D'INGENIERIE' INGENICO||||Paris||FR|IND|3}",
            0,
            "{(INDIANA)||CO STANDARD OIL||||CHICAGO|IL|US|IND|4}",
            0,
            "{(NO|FIRST NAME)|SARAVANAN||||WESTMONT|IL|US|IND|0},{||SPX CORPORATION||||CHARLOTTE|NC|US|ORG|1}",
            0,
            "{(SHERRY)|XU|XIAOLING||||SANTA CLARA|CA|US|IND|0},{ELAINE||POON||||SAN JOSE|CA|US|IND|0},{||ADVANCED MICRO DEVICES||||SUNNYVALE|CA|US|ORG|1}",
            0,
            "{(STUP)||FREYSSINET INTERNATIONAL||||PARIS||FR|IND|2}",
            0,
            "{(UNDER|35 USC 118)|LUCENT TECHNOLOGIES, INC.|||||||IND|2}",
            0,
            "{-HOFFMANN|CARLOS|WITTE||APT. 5D||BOSTON|MA|US|IND|0},{NATALIA|E.|BROUDE||||NATICK|MA|US|IND|0},{CHARLES|R.|CANTOR||||DEL MAR|CA|US|IND|0},{||THE TRUSTEES OF BOSTON UNIVERSITY||||BOSTON|MA|US|ORG|1}",
            0,
            "{.||ANTHONIUS||||SINGAPORE||SG|IND|0},{KAM POI||CHIA||||SINGAPORE||SG|IND|0},{SHIOW|SHYA|LING||||SINGAPORE||SG|IND|0},{||3M INNOVATIVE PROPERTIES COMPANY||||SAINT PAUL|MN|US|ORG|1}",
            0,
            "{.||Samsung Electronics Co., Ltd||||Suwon-si||KR|IND|4}",
            0,
            "{.||THE LAITRAM CORPORATION||||NEW ORLEANS|LA|US|IND|2}",
            0,
            "{1ST|VERMONT BANK & TRUST|CO.,A BANKING CORP. OF VT||||BELLOWS FALS|VT|US|IND|2}",
            0,
            "{303, INC.||CAREFUSION||||SAN DIEGO|CA|US|IND|0},{||CAREFUSION 303, INC.||||SAN DIEGO|CA|US|ORG|1}",
            0,
            "{38th Research Institute, China Electronics||Technology Group Corporation||||Hefei||CN|IND|2}",
            0,
            "{3M Innovative Properties||Company||||St. Paul|MN|US|IND|7}",
            0,
            "{3M Innovative||Properties Company||||St. Paul|MN|US|IND|7}",
            0,
            "{A-HAMID||HAKKI||||DUNEDIN|FL|US|IND|0},{SAID|I.|HAKKY||||LARGO|FL|US|IND|1}",
            0,
            "{A-NAN||CHEN||||Lukang Township||TW|IND|0},{||CHING FENG HOME FASHIONS CO., LTD.||||Fuxing Shiang||TW|ORG|0}",
            0,
            "{A-Nan||Chen||||Lukang Township||TW|IND|0},{||CHING FENG HOME FASHIONS CO., LTD.||||Fuxing Shiang||TW|ORG|0}",
            0,
            "{A. C. M.||HAMERS||||BERKEL-ENSCHOT||NL|IND|0},{E. J.||WORMMEESTER||||BEST||NL|IND|0},{||HONEYWELL INTERNATIONAL INC.||||MORRISTOWN|NJ|US|ORG|1}",
            0,
            null,
            0
          ],
          "inventorsFacet": [
            "{Anupriya|Jai Tilak|Naik||||Irvine|CA|US|IND|2},{Yumeng||Wu||||Tustin|CA|US|IND|4},{Michael||Seres||||Radlett||GB|IND|1},{David||Ramirez-Ayala||||Baldwin Park|CA|US|IND|3},{Bryan||Went||||Camarillo|CA|US|IND|5},{Sabrina||Kaefer||||Tustin|CA|US|IND|7},{Erick||Went||||Camarillo|CA|US|IND|6},{Irina||Dorofeeva||||Riverside|CA|US|IND|8},{Tianbin||Zhao||||Irvine|CA|US|IND|9}",
            1,
            "{'Afa|Kehaati|Palu||||Orem|UT|US|IND|1},{Brett|Justin|West||||Orem|UT|US|IND|2},{Claude|Jarakae|Jensen||||Cedar Hills|UT|US|IND|3},{Chen||Su||||West Jordan|UT|US|IND|4},{Bing-Nan||Zhou||||Sandy|UT|US|IND|5},{Stephen|P.|Story||||Alpine|UT|US|IND|6}",
            0,
            "{'Afa|Kehaati|Palu||||Provo|UT||IND|1},{Chen||Su||||Provo|UT||IND|2},{Bing-Nan||Zhou||||Provo|UT||IND|3},{Claude|Jarakae|Jensen||||Provo|UT||IND|4},{Stephen||Story||||Provo|UT||IND|5}",
            0,
            "{'Flavio||Fava||||Parabiago||IT|IND|1},{Angelica||Marson||||Basel||CH|IND|2},{Pascal||Steffanut||||Vilage-Neuf||FR|IND|3},{Laure||Johann||||Sierentz||FR|IND|4}",
            0,
            "{'Tom'|Dong|Soo||||Addison|IL||IND|1}",
            0,
            "{(Alex) Yu Sing||Hooi||||London||GB|IND|1}",
            0,
            "{(Alex)|Yu Sing|Hooi||||London||GB|IND|1}",
            0,
            "{(Andy)|Andrew|Buck||||Everton||CA|IND|1},{Arnold|Wayne|Carney||||Auburn|PA|US|IND|2}",
            0,
            "{(Belle)|Mary|Alger||||Des Moines|IA||IND|1}",
            0,
            "{(Bruce)|Yiqun|Wang||||Maple Grove|MN|US|IND|1},{John||Chen||||Plymouth|MN|US|IND|2},{Lixiao||Wang||||Maple Grove|MN|US|IND|3}",
            0,
            "{(Eric)|Zheng|Yuan||||Fremont|CA|US|IND|1},{David||Knight||||Fremont|CA|US|IND|2},{Shawn||Farshchi||||San Carlos|CA|US|IND|3},{Eric||Montoya||||Santa Clara|CA|US|IND|4}",
            0,
            "{(Gerhard) Wilfried||Schilles||||Kandel||DE|IND|1},{Sabine||Lindemann||||Habichtswald||DE|IND|2}",
            0,
            "{(Johnson Li)|Li|Zhaofu||||Beijing||CN|IND|1},{(Bin Kuang)|Kuang|Bin||||Beijing||CN|IND|2},{(Allen Huang )|Huang|Aijun||||Beijing||CN|IND|3}",
            0,
            "{(LARS)|LAURITZ B.|SCHIBBYE||||SALTSJO-DUFNAS||SE|IND|1},{ROLF|A.|ENGLUND||||SPANGA||SE|IND|2}",
            0,
            "{(LARS)|LAURITZ B.|SCHIBBYE||||SALTSJO-DUVNAS||SE|IND|1},{ROLF|A.|ENGLUND||||SPANGA||SE|IND|2}",
            0,
            "{(LARS)|LAURITZ B.|SCHIBBYE||||SALTSJO-DUVNAS||SE|IND|1},{STURE||FREDLUND||||VALLINGBY||SE|IND|2}",
            0,
            "{(Lawrence) Iek Hoi||Pun||||Shanghai||CN|IND|1},{Yun||Jin||||Issaquah|WA|US|IND|2},{Guang||Yang||||Shanghai||CN|IND|3},{Ping||Song||||Shanghai||CN|IND|4}",
            0,
            "{(MAX) ZONG-MING||CHENG||||Knoxville|TN|US|IND|1},{Xia||Ye||||Knoxville|TN|US|IND|2}",
            0,
            "{(Max) Zong-Ming||Cheng||||Knoxville|TN|US|IND|1},{Xia||Ye||||Zhengzhou||CN|IND|2}",
            0,
            "{(Mike) Michael||Bizal||||Minneapolis|MN|US|IND|1}",
            0,
            null,
            0
          ],
          "inventorNameFacet": [
            "ANUPRIYA JAI TILAK NAIK",
            1,
            "10158309",
            0,
            "10069766",
            0,
            "10002717",
            0,
            "10087593",
            0,
            "10153403",
            0,
            "10041865",
            0,
            "10091855",
            0,
            "10059011",
            0,
            "10053095",
            0,
            ".",
            0,
            "10006243",
            0,
            "10026281",
            0,
            "10132140",
            0,
            "10087622",
            0,
            "10162216",
            0,
            ".6909340",
            0,
            "10006492",
            0,
            "08934396",
            0,
            "10109779",
            0
          ],
          "appTypeFacet": [
            "Utility",
            1,
            "Design",
            0,
            "N/A",
            0,
            "PCT",
            0,
            "Plant",
            0,
            "Provisional",
            0,
            "Re-Examination",
            0,
            "Re-Issue",
            0,
            null,
            0
          ],
          "firstNamedApplicantFacet": [
            "11 HEALTH AND TECHNOLOGIES INC.",
            1,
            "SUMITOMO CHEMICAL COMPANY, LIMITED",
            0,
            "INTEL IP CORPORATION",
            0,
            "FORTINET, INC.",
            0,
            "!OBAC LTD",
            0,
            "MICRON TECHNOLOGY, INC.",
            0,
            "!MAGINETHIS RENOVATIONS, LLC",
            0,
            "ELENION TECHNOLOGIES, LLC",
            0,
            "SNAP INC.",
            0,
            "THE GOVERNMENT OF THE UNITED STATES OF",
            0,
            "TOTAL RAFFINAGE CHIMIE",
            0,
            "DEXTERA SURGICAL INCORPORATED",
            0,
            "FM MARKETING GMBH",
            0,
            "MEDTRONIC NAVIGATION, INC.",
            0,
            "HEWLETT PACKARD ENTERPRISE DEVELOPMENT LP",
            0,
            "#1A LIFESAFER, INC.",
            0,
            "IOWA STATE UNIVERSITY RESEARCH FOUNDATION, INC",
            0,
            "!OBAC LIMITED",
            0,
            "''NEXTGEN'' COMPANY LIMITED",
            0
          ],
          "appStatusFacet": [
            "Docketed New Case - Ready for Examination",
            1,
            "\"Decision on Petition Denied, Reexam Request Denied, Terminated\"",
            0,
            "'Decision on Petition Denied, Reexam Request Denied, Terminated'",
            0,
            "ABANDONED - RESTORED",
            0,
            "AWAITING RESPONSE FOR INFORMALITY, FEE DEFICIENCY OR CRF ACTION",
            0,
            "Abandoned  --  After Examiner's Answer or Board of Appeals Decision",
            0,
            "Abandoned  --  Failure to Pay Issue Fee",
            0,
            "Abandoned  --  Failure to Respond to an Office Action",
            0,
            "Abandoned  --  File-Wrapper-Continuation Parent Application",
            0,
            "Abandoned  --  Incomplete (Filing Date Under Rule 53 (b) - PreExam)",
            0,
            "Abandoned  --  Incomplete Application (Pre-examination)",
            0,
            "Abandonment for Failure to Correct Drawings/Oath/NonPub Request",
            0,
            "Advisory Action Counted, Not Yet Mailed",
            0,
            "Advisory Action Mailed",
            0,
            "Allowed -- Notice of Allowance Mailed -- Issue Revision Completed",
            0,
            "Allowed -- Notice of Allowance Not Yet Mailed",
            0,
            "Amendment / Argument after Board of Appeals Decision",
            0,
            "Amendment after notice of appeal",
            0,
            "Appeal Brief (or Supplemental Brief) Entered and Forwarded to Examiner",
            0,
            "Appeal Brief Filed (or Remand from Board) - Awaiting Examiner Action",
            0,
            null,
            0
          ],
          "appEntityStatusFacet": [
            "SMALL",
            1,
            " ",
            0,
            "MICRO",
            0,
            "UNDISCOUNTED",
            0,
            null,
            0
          ],
          "inventorsFullNameFacet": [
            "'AFA KEHAATI PALU",
            0,
            "(LARS) LAURITZ B. SCHIBBYE",
            0,
            "(BELLE) MARY ALGER",
            0,
            "(NONE)  ROOPNARINE",
            0,
            "(NO FIRST NAME) AKHTERUZZAMAN",
            0,
            "(GERHARD) WILFRIED  SCHILLES",
            0,
            "'TOM' DONG SOO",
            0,
            "(ERIC) ZHENG YUAN",
            0,
            "(BRUCE) YIQUN WANG",
            0,
            "(JOHNSON LI) LI ZHAOFU",
            0,
            "(ALEX) YU SING HOOI",
            0,
            "(LAWRENCE) IEK HOI  PUN",
            0,
            "(MIKE) MICHAEL  BIZAL",
            0,
            "(ALEX) YU SING  HOOI",
            0,
            "(ANDY) ANDREW BUCK",
            0,
            "'FLAVIO  FAVA",
            0,
            "(MAX) ZONG-MING  CHENG",
            0
          ],
          "appStatus": [
            "Docketed New Case - Ready for Examination",
            1,
            "\"Decision on Petition Denied, Reexam Request Denied, Terminated\"",
            0,
            "'Decision on Petition Denied, Reexam Request Denied, Terminated'",
            0,
            "ABANDONED - RESTORED",
            0,
            "AWAITING RESPONSE FOR INFORMALITY, FEE DEFICIENCY OR CRF ACTION",
            0,
            "Abandoned  --  After Examiner's Answer or Board of Appeals Decision",
            0,
            "Abandoned  --  Failure to Pay Issue Fee",
            0,
            "Abandoned  --  Failure to Respond to an Office Action",
            0,
            "Abandoned  --  File-Wrapper-Continuation Parent Application",
            0,
            "Abandoned  --  Incomplete (Filing Date Under Rule 53 (b) - PreExam)",
            0,
            "Abandoned  --  Incomplete Application (Pre-examination)",
            0,
            "Abandonment for Failure to Correct Drawings/Oath/NonPub Request",
            0,
            "Advisory Action Counted, Not Yet Mailed",
            0,
            "Advisory Action Mailed",
            0,
            "Allowed -- Notice of Allowance Mailed -- Issue Revision Completed",
            0,
            "Allowed -- Notice of Allowance Not Yet Mailed",
            0,
            "Amendment / Argument after Board of Appeals Decision",
            0,
            "Amendment after notice of appeal",
            0,
            "Appeal Brief (or Supplemental Brief) Entered and Forwarded to Examiner",
            0,
            "Appeal Brief Filed (or Remand from Board) - Awaiting Examiner Action",
            0,
            null,
            0
          ]
        },
        "facet_ranges": {
          "patentIssueDate": {
            "counts": [
              "1970-01-01T00:00:00Z",
              0,
              "1971-01-01T00:00:00Z",
              0,
              "1972-01-01T00:00:00Z",
              0,
              "1973-01-01T00:00:00Z",
              0,
              "1974-01-01T00:00:00Z",
              0,
              "1975-01-01T00:00:00Z",
              0,
              "1976-01-01T00:00:00Z",
              0,
              "1977-01-01T00:00:00Z",
              0,
              "1978-01-01T00:00:00Z",
              0,
              "1979-01-01T00:00:00Z",
              0,
              "1980-01-01T00:00:00Z",
              0,
              "1981-01-01T00:00:00Z",
              0,
              "1982-01-01T00:00:00Z",
              0,
              "1983-01-01T00:00:00Z",
              0,
              "1984-01-01T00:00:00Z",
              0,
              "1985-01-01T00:00:00Z",
              0,
              "1986-01-01T00:00:00Z",
              0,
              "1987-01-01T00:00:00Z",
              0,
              "1988-01-01T00:00:00Z",
              0,
              "1989-01-01T00:00:00Z",
              0,
              "1990-01-01T00:00:00Z",
              0,
              "1991-01-01T00:00:00Z",
              0,
              "1992-01-01T00:00:00Z",
              0,
              "1993-01-01T00:00:00Z",
              0,
              "1994-01-01T00:00:00Z",
              0,
              "1995-01-01T00:00:00Z",
              0,
              "1996-01-01T00:00:00Z",
              0,
              "1997-01-01T00:00:00Z",
              0,
              "1998-01-01T00:00:00Z",
              0,
              "1999-01-01T00:00:00Z",
              0,
              "2000-01-01T00:00:00Z",
              0,
              "2001-01-01T00:00:00Z",
              0,
              "2002-01-01T00:00:00Z",
              0,
              "2003-01-01T00:00:00Z",
              0,
              "2004-01-01T00:00:00Z",
              0,
              "2005-01-01T00:00:00Z",
              0,
              "2006-01-01T00:00:00Z",
              0,
              "2007-01-01T00:00:00Z",
              0,
              "2008-01-01T00:00:00Z",
              0,
              "2009-01-01T00:00:00Z",
              0,
              "2010-01-01T00:00:00Z",
              0,
              "2011-01-01T00:00:00Z",
              0,
              "2012-01-01T00:00:00Z",
              0,
              "2013-01-01T00:00:00Z",
              0,
              "2014-01-01T00:00:00Z",
              0,
              "2015-01-01T00:00:00Z",
              0,
              "2016-01-01T00:00:00Z",
              0,
              "2017-01-01T00:00:00Z",
              0,
              "2018-01-01T00:00:00Z",
              0,
              "2019-01-01T00:00:00Z",
              0
            ],
            "gap": "+1YEAR",
            "before": 0,
            "start": "1970-01-01T00:00:00Z",
            "end": "2020-01-01T00:00:00Z"
          },
          "appEarlyPubDate": {
            "counts": [
              "1970-01-01T00:00:00Z",
              0,
              "1971-01-01T00:00:00Z",
              0,
              "1972-01-01T00:00:00Z",
              0,
              "1973-01-01T00:00:00Z",
              0,
              "1974-01-01T00:00:00Z",
              0,
              "1975-01-01T00:00:00Z",
              0,
              "1976-01-01T00:00:00Z",
              0,
              "1977-01-01T00:00:00Z",
              0,
              "1978-01-01T00:00:00Z",
              0,
              "1979-01-01T00:00:00Z",
              0,
              "1980-01-01T00:00:00Z",
              0,
              "1981-01-01T00:00:00Z",
              0,
              "1982-01-01T00:00:00Z",
              0,
              "1983-01-01T00:00:00Z",
              0,
              "1984-01-01T00:00:00Z",
              0,
              "1985-01-01T00:00:00Z",
              0,
              "1986-01-01T00:00:00Z",
              0,
              "1987-01-01T00:00:00Z",
              0,
              "1988-01-01T00:00:00Z",
              0,
              "1989-01-01T00:00:00Z",
              0,
              "1990-01-01T00:00:00Z",
              0,
              "1991-01-01T00:00:00Z",
              0,
              "1992-01-01T00:00:00Z",
              0,
              "1993-01-01T00:00:00Z",
              0,
              "1994-01-01T00:00:00Z",
              0,
              "1995-01-01T00:00:00Z",
              0,
              "1996-01-01T00:00:00Z",
              0,
              "1997-01-01T00:00:00Z",
              0,
              "1998-01-01T00:00:00Z",
              0,
              "1999-01-01T00:00:00Z",
              0,
              "2000-01-01T00:00:00Z",
              0,
              "2001-01-01T00:00:00Z",
              0,
              "2002-01-01T00:00:00Z",
              0,
              "2003-01-01T00:00:00Z",
              0,
              "2004-01-01T00:00:00Z",
              0,
              "2005-01-01T00:00:00Z",
              0,
              "2006-01-01T00:00:00Z",
              0,
              "2007-01-01T00:00:00Z",
              0,
              "2008-01-01T00:00:00Z",
              0,
              "2009-01-01T00:00:00Z",
              0,
              "2010-01-01T00:00:00Z",
              0,
              "2011-01-01T00:00:00Z",
              0,
              "2012-01-01T00:00:00Z",
              0,
              "2013-01-01T00:00:00Z",
              0,
              "2014-01-01T00:00:00Z",
              0,
              "2015-01-01T00:00:00Z",
              0,
              "2016-01-01T00:00:00Z",
              0,
              "2017-01-01T00:00:00Z",
              0,
              "2018-01-01T00:00:00Z",
              0,
              "2019-01-01T00:00:00Z",
              1
            ],
            "gap": "+1YEAR",
            "before": 0,
            "start": "1970-01-01T00:00:00Z",
            "end": "2020-01-01T00:00:00Z"
          },
          "wipoEarlyPubDate": {
            "counts": [
              "1970-01-01T00:00:00Z",
              0,
              "1971-01-01T00:00:00Z",
              0,
              "1972-01-01T00:00:00Z",
              0,
              "1973-01-01T00:00:00Z",
              0,
              "1974-01-01T00:00:00Z",
              0,
              "1975-01-01T00:00:00Z",
              0,
              "1976-01-01T00:00:00Z",
              0,
              "1977-01-01T00:00:00Z",
              0,
              "1978-01-01T00:00:00Z",
              0,
              "1979-01-01T00:00:00Z",
              0,
              "1980-01-01T00:00:00Z",
              0,
              "1981-01-01T00:00:00Z",
              0,
              "1982-01-01T00:00:00Z",
              0,
              "1983-01-01T00:00:00Z",
              0,
              "1984-01-01T00:00:00Z",
              0,
              "1985-01-01T00:00:00Z",
              0,
              "1986-01-01T00:00:00Z",
              0,
              "1987-01-01T00:00:00Z",
              0,
              "1988-01-01T00:00:00Z",
              0,
              "1989-01-01T00:00:00Z",
              0,
              "1990-01-01T00:00:00Z",
              0,
              "1991-01-01T00:00:00Z",
              0,
              "1992-01-01T00:00:00Z",
              0,
              "1993-01-01T00:00:00Z",
              0,
              "1994-01-01T00:00:00Z",
              0,
              "1995-01-01T00:00:00Z",
              0,
              "1996-01-01T00:00:00Z",
              0,
              "1997-01-01T00:00:00Z",
              0,
              "1998-01-01T00:00:00Z",
              0,
              "1999-01-01T00:00:00Z",
              0,
              "2000-01-01T00:00:00Z",
              0,
              "2001-01-01T00:00:00Z",
              0,
              "2002-01-01T00:00:00Z",
              0,
              "2003-01-01T00:00:00Z",
              0,
              "2004-01-01T00:00:00Z",
              0,
              "2005-01-01T00:00:00Z",
              0,
              "2006-01-01T00:00:00Z",
              0,
              "2007-01-01T00:00:00Z",
              0,
              "2008-01-01T00:00:00Z",
              0,
              "2009-01-01T00:00:00Z",
              0,
              "2010-01-01T00:00:00Z",
              0,
              "2011-01-01T00:00:00Z",
              0,
              "2012-01-01T00:00:00Z",
              0,
              "2013-01-01T00:00:00Z",
              0,
              "2014-01-01T00:00:00Z",
              0,
              "2015-01-01T00:00:00Z",
              0,
              "2016-01-01T00:00:00Z",
              0,
              "2017-01-01T00:00:00Z",
              0,
              "2018-01-01T00:00:00Z",
              0,
              "2019-01-01T00:00:00Z",
              0
            ],
            "gap": "+1YEAR",
            "before": 0,
            "start": "1970-01-01T00:00:00Z",
            "end": "2020-01-01T00:00:00Z"
          },
          "appIntlPubDate": {
            "counts": [
              "1970-01-01T00:00:00Z",
              0,
              "1971-01-01T00:00:00Z",
              0,
              "1972-01-01T00:00:00Z",
              0,
              "1973-01-01T00:00:00Z",
              0,
              "1974-01-01T00:00:00Z",
              0,
              "1975-01-01T00:00:00Z",
              0,
              "1976-01-01T00:00:00Z",
              0,
              "1977-01-01T00:00:00Z",
              0,
              "1978-01-01T00:00:00Z",
              0,
              "1979-01-01T00:00:00Z",
              0,
              "1980-01-01T00:00:00Z",
              0,
              "1981-01-01T00:00:00Z",
              0,
              "1982-01-01T00:00:00Z",
              0,
              "1983-01-01T00:00:00Z",
              0,
              "1984-01-01T00:00:00Z",
              0,
              "1985-01-01T00:00:00Z",
              0,
              "1986-01-01T00:00:00Z",
              0,
              "1987-01-01T00:00:00Z",
              0,
              "1988-01-01T00:00:00Z",
              0,
              "1989-01-01T00:00:00Z",
              0,
              "1990-01-01T00:00:00Z",
              0,
              "1991-01-01T00:00:00Z",
              0,
              "1992-01-01T00:00:00Z",
              0,
              "1993-01-01T00:00:00Z",
              0,
              "1994-01-01T00:00:00Z",
              0,
              "1995-01-01T00:00:00Z",
              0,
              "1996-01-01T00:00:00Z",
              0,
              "1997-01-01T00:00:00Z",
              0,
              "1998-01-01T00:00:00Z",
              0,
              "1999-01-01T00:00:00Z",
              0,
              "2000-01-01T00:00:00Z",
              0,
              "2001-01-01T00:00:00Z",
              0,
              "2002-01-01T00:00:00Z",
              0,
              "2003-01-01T00:00:00Z",
              0,
              "2004-01-01T00:00:00Z",
              0,
              "2005-01-01T00:00:00Z",
              0,
              "2006-01-01T00:00:00Z",
              0,
              "2007-01-01T00:00:00Z",
              0,
              "2008-01-01T00:00:00Z",
              0,
              "2009-01-01T00:00:00Z",
              0,
              "2010-01-01T00:00:00Z",
              0,
              "2011-01-01T00:00:00Z",
              0,
              "2012-01-01T00:00:00Z",
              0,
              "2013-01-01T00:00:00Z",
              0,
              "2014-01-01T00:00:00Z",
              0,
              "2015-01-01T00:00:00Z",
              0,
              "2016-01-01T00:00:00Z",
              0,
              "2017-01-01T00:00:00Z",
              0,
              "2018-01-01T00:00:00Z",
              0,
              "2019-01-01T00:00:00Z",
              0
            ],
            "gap": "+1YEAR",
            "before": 0,
            "start": "1970-01-01T00:00:00Z",
            "end": "2020-01-01T00:00:00Z"
          },
          "appFilingDate": {
            "counts": [
              "1970-01-01T00:00:00Z",
              0,
              "1971-01-01T00:00:00Z",
              0,
              "1972-01-01T00:00:00Z",
              0,
              "1973-01-01T00:00:00Z",
              0,
              "1974-01-01T00:00:00Z",
              0,
              "1975-01-01T00:00:00Z",
              0,
              "1976-01-01T00:00:00Z",
              0,
              "1977-01-01T00:00:00Z",
              0,
              "1978-01-01T00:00:00Z",
              0,
              "1979-01-01T00:00:00Z",
              0,
              "1980-01-01T00:00:00Z",
              0,
              "1981-01-01T00:00:00Z",
              0,
              "1982-01-01T00:00:00Z",
              0,
              "1983-01-01T00:00:00Z",
              0,
              "1984-01-01T00:00:00Z",
              0,
              "1985-01-01T00:00:00Z",
              0,
              "1986-01-01T00:00:00Z",
              0,
              "1987-01-01T00:00:00Z",
              0,
              "1988-01-01T00:00:00Z",
              0,
              "1989-01-01T00:00:00Z",
              0,
              "1990-01-01T00:00:00Z",
              0,
              "1991-01-01T00:00:00Z",
              0,
              "1992-01-01T00:00:00Z",
              0,
              "1993-01-01T00:00:00Z",
              0,
              "1994-01-01T00:00:00Z",
              0,
              "1995-01-01T00:00:00Z",
              0,
              "1996-01-01T00:00:00Z",
              0,
              "1997-01-01T00:00:00Z",
              0,
              "1998-01-01T00:00:00Z",
              0,
              "1999-01-01T00:00:00Z",
              0,
              "2000-01-01T00:00:00Z",
              0,
              "2001-01-01T00:00:00Z",
              0,
              "2002-01-01T00:00:00Z",
              0,
              "2003-01-01T00:00:00Z",
              0,
              "2004-01-01T00:00:00Z",
              0,
              "2005-01-01T00:00:00Z",
              0,
              "2006-01-01T00:00:00Z",
              0,
              "2007-01-01T00:00:00Z",
              0,
              "2008-01-01T00:00:00Z",
              0,
              "2009-01-01T00:00:00Z",
              0,
              "2010-01-01T00:00:00Z",
              0,
              "2011-01-01T00:00:00Z",
              0,
              "2012-01-01T00:00:00Z",
              0,
              "2013-01-01T00:00:00Z",
              0,
              "2014-01-01T00:00:00Z",
              0,
              "2015-01-01T00:00:00Z",
              0,
              "2016-01-01T00:00:00Z",
              0,
              "2017-01-01T00:00:00Z",
              0,
              "2018-01-01T00:00:00Z",
              1,
              "2019-01-01T00:00:00Z",
              0
            ],
            "gap": "+1YEAR",
            "before": 0,
            "start": "1970-01-01T00:00:00Z",
            "end": "2020-01-01T00:00:00Z"
          },
          "appStatusDate": {
            "counts": [
              "1970-01-01T00:00:00Z",
              0,
              "1971-01-01T00:00:00Z",
              0,
              "1972-01-01T00:00:00Z",
              0,
              "1973-01-01T00:00:00Z",
              0,
              "1974-01-01T00:00:00Z",
              0,
              "1975-01-01T00:00:00Z",
              0,
              "1976-01-01T00:00:00Z",
              0,
              "1977-01-01T00:00:00Z",
              0,
              "1978-01-01T00:00:00Z",
              0,
              "1979-01-01T00:00:00Z",
              0,
              "1980-01-01T00:00:00Z",
              0,
              "1981-01-01T00:00:00Z",
              0,
              "1982-01-01T00:00:00Z",
              0,
              "1983-01-01T00:00:00Z",
              0,
              "1984-01-01T00:00:00Z",
              0,
              "1985-01-01T00:00:00Z",
              0,
              "1986-01-01T00:00:00Z",
              0,
              "1987-01-01T00:00:00Z",
              0,
              "1988-01-01T00:00:00Z",
              0,
              "1989-01-01T00:00:00Z",
              0,
              "1990-01-01T00:00:00Z",
              0,
              "1991-01-01T00:00:00Z",
              0,
              "1992-01-01T00:00:00Z",
              0,
              "1993-01-01T00:00:00Z",
              0,
              "1994-01-01T00:00:00Z",
              0,
              "1995-01-01T00:00:00Z",
              0,
              "1996-01-01T00:00:00Z",
              0,
              "1997-01-01T00:00:00Z",
              0,
              "1998-01-01T00:00:00Z",
              0,
              "1999-01-01T00:00:00Z",
              0,
              "2000-01-01T00:00:00Z",
              0,
              "2001-01-01T00:00:00Z",
              0,
              "2002-01-01T00:00:00Z",
              0,
              "2003-01-01T00:00:00Z",
              0,
              "2004-01-01T00:00:00Z",
              0,
              "2005-01-01T00:00:00Z",
              0,
              "2006-01-01T00:00:00Z",
              0,
              "2007-01-01T00:00:00Z",
              0,
              "2008-01-01T00:00:00Z",
              0,
              "2009-01-01T00:00:00Z",
              0,
              "2010-01-01T00:00:00Z",
              0,
              "2011-01-01T00:00:00Z",
              0,
              "2012-01-01T00:00:00Z",
              0,
              "2013-01-01T00:00:00Z",
              0,
              "2014-01-01T00:00:00Z",
              0,
              "2015-01-01T00:00:00Z",
              0,
              "2016-01-01T00:00:00Z",
              0,
              "2017-01-01T00:00:00Z",
              0,
              "2018-01-01T00:00:00Z",
              0,
              "2019-01-01T00:00:00Z",
              1
            ],
            "gap": "+1YEAR",
            "before": 0,
            "start": "1970-01-01T00:00:00Z",
            "end": "2020-01-01T00:00:00Z"
          }
        },
        "facet_intervals": {},
        "facet_heatmaps": {}
      }
    },
    "queryId": "21fd93a2-ffdf-4b92-85c5-7cce02d76c19"
  },
  "jobStatus": null,
  "queryId": "21fd93a2-ffdf-4b92-85c5-7cce02d76c19",
  "page": 1,
  "count": 0,
  "createQueryRequest": {
    "searchText": "applId:(16184764)",
    "facet": null,
    "facetField": null,
    "facetLimit": null,
    "facetMissing": null,
    "facetDate": null,
    "facetDateGap": null,
    "facetDateStart": null,
    "facetDateEnd": null,
    "facetDateOther": null,
    "facetDateInclude": null,
    "mm": null,
    "sort": null,
    "qf": "applId",
    "wt": null,
    "df": null,
    "fl": null,
    "start": null,
    "fq": null,
    "rows": null,
    "parameters": {
      "qf": "applId"
    }
  },
  "links": [
    {
      "rel": "self",
      "href": "https://ped.uspto.gov/api/queries/21fd93a2-ffdf-4b92-85c5-7cce02d76c19?format=XML"
    },
    {
      "rel": "results",
      "href": "https://ped.uspto.gov/api/queries/21fd93a2-ffdf-4b92-85c5-7cce02d76c19/results?page=1"
    },
    {
      "rel": "package",
      "href": "https://ped.uspto.gov/api/queries/21fd93a2-ffdf-4b92-85c5-7cce02d76c19/package?format=XML"
    },
    {
      "rel": "first",
      "href": "https://ped.uspto.gov/api/queries/21fd93a2-ffdf-4b92-85c5-7cce02d76c19/results?page=1"
    },
    {
      "rel": "next",
      "href": "https://ped.uspto.gov/api/queries/21fd93a2-ffdf-4b92-85c5-7cce02d76c19/results?page=2"
    },
    {
      "rel": "self",
      "href": "https://ped.uspto.gov/api/queries/21fd93a2-ffdf-4b92-85c5-7cce02d76c19?format=JSON"
    },
    {
      "rel": "results",
      "href": "https://ped.uspto.gov/api/queries/21fd93a2-ffdf-4b92-85c5-7cce02d76c19/results?page=1"
    },
    {
      "rel": "package",
      "href": "https://ped.uspto.gov/api/queries/21fd93a2-ffdf-4b92-85c5-7cce02d76c19/package?format=JSON"
    },
    {
      "rel": "first",
      "href": "https://ped.uspto.gov/api/queries/21fd93a2-ffdf-4b92-85c5-7cce02d76c19/results?page=1"
    },
    {
      "rel": "next",
      "href": "https://ped.uspto.gov/api/queries/21fd93a2-ffdf-4b92-85c5-7cce02d76c19/results?page=2"
    }
  ]
}

{
  "trademarks": [
    {
      "status": {
        "staff": {
          "examiner": null,
          "paralegal": null,
          "ituParalegal": null,
          "lie": null,
          "chargeTo": null
        },
        "correspondence": {
          "freeFormAddress": [],
          "address": {
            "line1": "2040 Main Street, 14th Floor",
            "city": "Irvine",
            "region": {
              "stateCountry": {
                "code": "CA",
                "name": "CALIFORNIA"
              },
              "isoRegion": {
                "code": "CA",
                "name": "CALIFORNIA"
              },
              "iso": {
                "code": "US",
                "name": "CALIFORNIA"
              },
              "wipo": null
            },
            "postalCode": "92614",
            "countryCode": "US",
            "countryName": "UNITED STATES"
          },
          "attorneyName": "Alexander D. Zeng",
          "attorneyEmail": {
            "authIndicator": "Y",
            "addresses": [
              "efiling@knobbe.com"
            ]
          },
          "individualFullName": "Alexander D. Zeng",
          "firmName": "Knobbe, Martens, Olson & Bear, LLP",
          "correspondantPhone": "310-551-3450",
          "correspondantFax": "949-760-9502",
          "correspondantEmail": {
            "authIndicator": "Y",
            "addresses": [
              "efiling@knobbe.com"
            ]
          }
        },
        "serialNumber": 88326251,
        "designSearchList": [
          {
            "code": "24.15.25",
            "descriptions": [
              "Other arrows"
            ]
          },
          {
            "code": "26.17.01",
            "descriptions": [
              "Bars, straight",
              "Lines, straight",
              "Bands, straight",
              "Straight line(s), band(s) or bar(s)"
            ]
          },
          {
            "code": "26.17.05",
            "descriptions": [
              "Bands, horizontal",
              "Bars, horizontal",
              "Horizontal line(s), band(s) or bar(s)",
              "Lines, horizontal"
            ]
          }
        ],
        "filingDate": "2019-03-05",
        "usRegistrationNumber": "5845537",
        "usRegistrationDate": "2019-08-27",
        "filedAsTeasPlusApp": false,
        "currentlyAsTeasPlusApp": false,
        "filedAsTeasRfApp": true,
        "currentlyAsTeasRfApp": true,
        "supplementalRegister": false,
        "amendPrincipal": false,
        "amendSupplemental": false,
        "trademark": false,
        "certificationMark": false,
        "serviceMark": true,
        "collectiveMembershipMark": false,
        "collectiveServiceMark": false,
        "collectiveTradeMark": false,
        "status": 700,
        "statusDate": "2019-08-27",
        "standardChar": false,
        "markDrawingCd": "3",
        "colorDrawingCurr": false,
        "section2f": false,
        "section2fPartial": false,
        "others": false,
        "publishedPrevRegMark": false,
        "clsTotal": 3,
        "filedUse": true,
        "filedItu": false,
        "filed44d": false,
        "filed44e": false,
        "filed66a": false,
        "filedNoBasis": false,
        "useCurr": true,
        "ituCurr": false,
        "sect44dCurr": false,
        "sect44eCurr": false,
        "sect66aCurr": false,
        "noBasisCurr": false,
        "useAmended": false,
        "ituAmended": false,
        "sect44dAmended": false,
        "sect44eAmended": false,
        "attrnyDktNumber": "88RIS.007T",
        "sect8Filed": false,
        "sect8Acpt": false,
        "sect8PartialAcpt": false,
        "sect15Filed": false,
        "sect15Ack": false,
        "sect71Filed": false,
        "sect71Acpt": false,
        "sect71PartialAcpt": false,
        "renewalFiled": false,
        "changeInReg": false,
        "lawOffAsgnCd": "L60",
        "currLocationCd": "650",
        "currLocationDt": "2019-08-27",
        "chargeToLocation": null,
        "phyLocation": null,
        "phyLocationDt": null,
        "extStatusDesc": "Registered.  The registration date is used to determine when post-registration maintenance documents are due.",
        "intStatusDesc": null,
        "markDrawDesc": "AN ILLUSTRATION DRAWING WHICH INCLUDES WORD(S)/ LETTER(S)/NUMBER(S)",
        "currentLoc": "PUBLICATION AND ISSUE SECTION",
        "colorClaimed": "Color is not claimed as a feature of the mark.",
        "descOfMark": "The mark consists of the number \"88\" adjacent to an upward facing arrow, all of which are positioned above the terms \"HEAD IN THE\" and \"CLOUDS\" in a stacked position with the terms \"in the\" which set between horizontal lines.",
        "markElement": "88 HEAD IN THE CLOUDS",
        "parentOf": [],
        "prevRegNumList": [],
        "newLawOffAsgnCd": "106",
        "lawOffAssigned": "LAW OFFICE 106",
        "tm5Status": 8,
        "tm5StatusDesc": "LIVE/REGISTRATION/Issued and Active",
        "tm5StatusDef": "The trademark application has been registered with the Office.",
        "physicalLocationHistory": [
          {
            "eventDate": "2019-03-08",
            "physicalLocation": "OUT",
            "physicalLocationDescription": "NO PHYSICAL FILE",
            "rsn": "20382547"
          },
          {
            "eventDate": "2019-03-22",
            "physicalLocation": "MADCD",
            "physicalLocationDescription": "NO PHYSICAL FILE",
            "rsn": "20424588"
          }
        ],
        "pseudoMark": null
      },
      "parties": {
        "ownerGroups": {
          "10": [
            {
              "serialNumber": 88326251,
              "partyType": 10,
              "partyTypeDescription": "ORIGINAL APPLICANT",
              "reelFrame": null,
              "entityNum": 1,
              "entityType": {
                "code": 3,
                "description": "CORPORATION"
              },
              "name": "88Rising, Inc.",
              "composedOf": null,
              "dbaAkaFormerly": null,
              "assignment": null,
              "address1": "#401",
              "address2": "135 W. 20th Street",
              "city": "New York",
              "addressStateCountry": {
                "stateCountry": {
                  "code": "NY",
                  "name": "NEW YORK"
                },
                "isoRegion": {
                  "code": "NY",
                  "name": "NEW YORK"
                },
                "iso": {
                  "code": "US",
                  "name": "NEW YORK"
                },
                "wipo": null
              },
              "zip": "10011",
              "citizenship": {
                "stateCountry": {
                  "code": "DE",
                  "name": "DELAWARE"
                },
                "isoRegion": {
                  "code": "DE",
                  "name": "DELAWARE"
                },
                "iso": {
                  "code": "US",
                  "name": "DELAWARE"
                },
                "wipo": null
              }
            }
          ],
          "20": [
            {
              "serialNumber": 88326251,
              "partyType": 20,
              "partyTypeDescription": "OWNER AT PUBLICATION",
              "reelFrame": null,
              "entityNum": 1,
              "entityType": {
                "code": 3,
                "description": "CORPORATION"
              },
              "name": "88Rising, Inc.",
              "composedOf": null,
              "dbaAkaFormerly": null,
              "assignment": null,
              "address1": "#401",
              "address2": "135 W. 20th Street",
              "city": "New York",
              "addressStateCountry": {
                "stateCountry": {
                  "code": "NY",
                  "name": "NEW YORK"
                },
                "isoRegion": {
                  "code": "NY",
                  "name": "NEW YORK"
                },
                "iso": {
                  "code": "US",
                  "name": "NEW YORK"
                },
                "wipo": null
              },
              "zip": "10011",
              "citizenship": {
                "stateCountry": {
                  "code": "DE",
                  "name": "DELAWARE"
                },
                "isoRegion": {
                  "code": "DE",
                  "name": "DELAWARE"
                },
                "iso": {
                  "code": "US",
                  "name": "DELAWARE"
                },
                "wipo": null
              }
            }
          ],
          "30": [
            {
              "serialNumber": 88326251,
              "partyType": 30,
              "partyTypeDescription": "ORIGINAL REGISTRANT",
              "reelFrame": null,
              "entityNum": 1,
              "entityType": {
                "code": 3,
                "description": "CORPORATION"
              },
              "name": "88Rising, Inc.",
              "composedOf": null,
              "dbaAkaFormerly": null,
              "assignment": null,
              "address1": "#401",
              "address2": "135 W. 20th Street",
              "city": "New York",
              "addressStateCountry": {
                "stateCountry": {
                  "code": "NY",
                  "name": "NEW YORK"
                },
                "isoRegion": {
                  "code": "NY",
                  "name": "NEW YORK"
                },
                "iso": {
                  "code": "US",
                  "name": "NEW YORK"
                },
                "wipo": null
              },
              "zip": "10011",
              "citizenship": {
                "stateCountry": {
                  "code": "DE",
                  "name": "DELAWARE"
                },
                "isoRegion": {
                  "code": "DE",
                  "name": "DELAWARE"
                },
                "iso": {
                  "code": "US",
                  "name": "DELAWARE"
                },
                "wipo": null
              }
            }
          ]
        }
      },
      "gsList": [
        {
          "serialNumber": 88326251,
          "internationalClassPrime": true,
          "usClasses": [
            {
              "code": "100",
              "description": "Miscellaneous"
            },
            {
              "code": "101",
              "description": "Advertising and Business"
            },
            {
              "code": "107",
              "description": "Education and Entertainment"
            }
          ],
          "internationalClasses": [
            {
              "code": "041",
              "description": "Education and Entertainment"
            }
          ],
          "pseudoClasses": [],
          "statusCode": "6",
          "statusDescription": "ACTIVE",
          "statusDate": "2019-03-22",
          "firstUseDate": 20180922,
          "firstUseInCommerceDate": 20180922,
          "firstUseDateDescription": null,
          "firstUseInCommerceDateDescription": null,
          "description": "Entertainment services, namely, arranging and conducting music and art festival",
          "classBasis": null,
          "primeClassCode": "041"
        }
      ],
      "foreignInfoList": [],
      "prosecutionHistory": [
        {
          "entryNumber": 11,
          "entryCode": "ARAA",
          "entryType": "I",
          "proceedingNum": 0,
          "entryDate": "2019-10-24T04:00:00.000+0000",
          "entryDesc": "ATTORNEY/DOM.REP.REVOKED AND/OR APPOINTED"
        },
        {
          "entryNumber": 10,
          "entryCode": "REAP",
          "entryType": "I",
          "proceedingNum": 0,
          "entryDate": "2019-10-24T04:00:00.000+0000",
          "entryDesc": "TEAS REVOKE/APP/CHANGE ADDR OF ATTY/DOM REP RECEIVED"
        },
        {
          "entryNumber": 9,
          "entryCode": "R.PR",
          "entryType": "A",
          "proceedingNum": 0,
          "entryDate": "2019-08-27T04:00:00.000+0000",
          "entryDesc": "REGISTERED-PRINCIPAL REGISTER"
        },
        {
          "entryNumber": 8,
          "entryCode": "NPUB",
          "entryType": "E",
          "proceedingNum": 0,
          "entryDate": "2019-06-11T04:00:00.000+0000",
          "entryDesc": "OFFICIAL GAZETTE PUBLICATION CONFIRMATION E-MAILED"
        },
        {
          "entryNumber": 7,
          "entryCode": "PUBO",
          "entryType": "A",
          "proceedingNum": 0,
          "entryDate": "2019-06-11T04:00:00.000+0000",
          "entryDesc": "PUBLISHED FOR OPPOSITION"
        },
        {
          "entryNumber": 6,
          "entryCode": "NONP",
          "entryType": "E",
          "proceedingNum": 0,
          "entryDate": "2019-05-22T04:00:00.000+0000",
          "entryDesc": "NOTIFICATION OF NOTICE OF PUBLICATION E-MAILED"
        },
        {
          "entryNumber": 5,
          "entryCode": "CNSA",
          "entryType": "O",
          "proceedingNum": 0,
          "entryDate": "2019-05-01T04:00:00.000+0000",
          "entryDesc": "APPROVED FOR PUB - PRINCIPAL REGISTER"
        },
        {
          "entryNumber": 4,
          "entryCode": "DOCK",
          "entryType": "D",
          "proceedingNum": 78477,
          "entryDate": "2019-04-26T04:00:00.000+0000",
          "entryDesc": "ASSIGNED TO EXAMINER"
        },
        {
          "entryNumber": 3,
          "entryCode": "MDSM",
          "entryType": "E",
          "proceedingNum": 0,
          "entryDate": "2019-03-23T04:00:00.000+0000",
          "entryDesc": "NOTICE OF DESIGN SEARCH CODE E-MAILED"
        },
        {
          "entryNumber": 2,
          "entryCode": "NWOS",
          "entryType": "I",
          "proceedingNum": 0,
          "entryDate": "2019-03-22T04:00:00.000+0000",
          "entryDesc": "NEW APPLICATION OFFICE SUPPLIED DATA ENTERED IN TRAM"
        },
        {
          "entryNumber": 1,
          "entryCode": "NWAP",
          "entryType": "I",
          "proceedingNum": 0,
          "entryDate": "2019-03-08T05:00:00.000+0000",
          "entryDesc": "NEW APPLICATION ENTERED IN TRAM"
        }
      ],
      "relationshipBundleList": [],
      "internationalData": false,
      "publication": {
        "serialNumber": 88326251,
        "datePublished": "2019-06-11",
        "officialGazettes": []
      },
      "divisional": {
        "serialNumber": 88326251,
        "childOf": null,
        "parentOfList": []
      }
    }
  ]
}


*/

/**
 * Lib: JSON.ahk
 *     JSON lib for AutoHotkey.
 * Version:
 *     v2.1.3 [updated 04/18/2016 (MM/DD/YYYY)]
 * License:
 *     WTFPL [http://wtfpl.net/]
 * Requirements:
 *     Latest version of AutoHotkey (v1.1+ or v2.0-a+)
 * Installation:
 *     Use #Include JSON.ahk or copy into a function library folder and then
 *     use #Include <JSON>
 * Links:
 *     GitHub:     - https://github.com/cocobelgica/AutoHotkey-JSON
 *     Forum Topic - http://goo.gl/r0zI8t
 *     Email:      - cocobelgica <at> gmail <dot> com
 */


/**
 * Class: JSON
 *     The JSON object contains methods for parsing JSON and converting values
 *     to JSON. Callable - NO; Instantiable - YES; Subclassable - YES;
 *     Nestable(via #Include) - NO.
 * Methods:
 *     Load() - see relevant documentation before method definition header
 *     Dump() - see relevant documentation before method definition header
 */
class JSON
{
	/**
	 * Method: Load
	 *     Parses a JSON string into an AHK value
	 * Syntax:
	 *     value := JSON.Load( text [, reviver ] )
	 * Parameter(s):
	 *     value      [retval] - parsed value
	 *     text    [in, ByRef] - JSON formatted string
	 *     reviver   [in, opt] - function object, similar to JavaScript's
	 *                           JSON.parse() 'reviver' parameter
	 */
	class Load extends JSON.Functor
	{
		Call(self, ByRef text, reviver:="")
		{
			this.rev := IsObject(reviver) ? reviver : false
		; Object keys(and array indices) are temporarily stored in arrays so that
		; we can enumerate them in the order they appear in the document/text instead
		; of alphabetically. Skip if no reviver function is specified.
			this.keys := this.rev ? {} : false

			static quot := Chr(34), bashq := "\" . quot
			     , json_value := quot . "{[01234567890-tfn"
			     , json_value_or_array_closing := quot . "{[]01234567890-tfn"
			     , object_key_or_object_closing := quot . "}"

			key := ""
			is_key := false
			root := {}
			stack := [root]
			next := json_value
			pos := 0

			while ((ch := SubStr(text, ++pos, 1)) != "") {
				if InStr(" `t`r`n", ch)
					continue
				if !InStr(next, ch, 1)
					this.ParseError(next, text, pos)

				holder := stack[1]
				is_array := holder.IsArray

				if InStr(",:", ch) {
					next := (is_key := !is_array && ch == ",") ? quot : json_value

				} else if InStr("}]", ch) {
					ObjRemoveAt(stack, 1)
					next := stack[1]==root ? "" : stack[1].IsArray ? ",]" : ",}"

				} else {
					if InStr("{[", ch) {
					; Check if Array() is overridden and if its return value has
					; the 'IsArray' property. If so, Array() will be called normally,
					; otherwise, use a custom base object for arrays
						static json_array := Func("Array").IsBuiltIn || ![].IsArray ? {IsArray: true} : 0
					
					; sacrifice readability for minor(actually negligible) performance gain
						(ch == "{")
							? ( is_key := true
							  , value := {}
							  , next := object_key_or_object_closing )
						; ch == "["
							: ( value := json_array ? new json_array : []
							  , next := json_value_or_array_closing )
						
						ObjInsertAt(stack, 1, value)

						if (this.keys)
							this.keys[value] := []
					
					} else {
						if (ch == quot) {
							i := pos
							while (i := InStr(text, quot,, i+1)) {
								value := StrReplace(SubStr(text, pos+1, i-pos-1), "\\", "\u005c")

								static tail := A_AhkVersion<"2" ? 0 : -1
								if (SubStr(value, tail) != "\")
									break
							}

							if (!i)
								this.ParseError("'", text, pos)

							  value := StrReplace(value,  "\/",  "/")
							, value := StrReplace(value, bashq, quot)
							, value := StrReplace(value,  "\b", "`b")
							, value := StrReplace(value,  "\f", "`f")
							, value := StrReplace(value,  "\n", "`n")
							, value := StrReplace(value,  "\r", "`r")
							, value := StrReplace(value,  "\t", "`t")

							pos := i ; update pos
							
							i := 0
							while (i := InStr(value, "\",, i+1)) {
								if !(SubStr(value, i+1, 1) == "u")
									this.ParseError("\", text, pos - StrLen(SubStr(value, i+1)))

								uffff := Abs("0x" . SubStr(value, i+2, 4))
								if (A_IsUnicode || uffff < 0x100)
									value := SubStr(value, 1, i-1) . Chr(uffff) . SubStr(value, i+6)
							}

							if (is_key) {
								key := value, next := ":"
								continue
							}
						
						} else {
							value := SubStr(text, pos, i := RegExMatch(text, "[\]\},\s]|$",, pos)-pos)

							static number := "number", integer :="integer"
							if value is %number%
							{
								if value is %integer%
									value += 0
							}
							else if (value == "true" || value == "false")
								value := %value% + 0
							else if (value == "null")
								value := ""
							else
							; we can do more here to pinpoint the actual culprit
							; but that's just too much extra work.
								this.ParseError(next, text, pos, i)

							pos += i-1
						}

						next := holder==root ? "" : is_array ? ",]" : ",}"
					} ; If InStr("{[", ch) { ... } else

					is_array? key := ObjPush(holder, value) : holder[key] := value

					if (this.keys && this.keys.HasKey(holder))
						this.keys[holder].Push(key)
				}
			
			} ; while ( ... )

			return this.rev ? this.Walk(root, "") : root[""]
		}

		ParseError(expect, ByRef text, pos, len:=1)
		{
			static quot := Chr(34), qurly := quot . "}"
			
			line := StrSplit(SubStr(text, 1, pos), "`n", "`r").Length()
			col := pos - InStr(text, "`n",, -(StrLen(text)-pos+1))
			msg := Format("{1}`n`nLine:`t{2}`nCol:`t{3}`nChar:`t{4}"
			,     (expect == "")     ? "Extra data"
			    : (expect == "'")    ? "Unterminated string starting at"
			    : (expect == "\")    ? "Invalid \escape"
			    : (expect == ":")    ? "Expecting ':' delimiter"
			    : (expect == quot)   ? "Expecting object key enclosed in double quotes"
			    : (expect == qurly)  ? "Expecting object key enclosed in double quotes or object closing '}'"
			    : (expect == ",}")   ? "Expecting ',' delimiter or object closing '}'"
			    : (expect == ",]")   ? "Expecting ',' delimiter or array closing ']'"
			    : InStr(expect, "]") ? "Expecting JSON value or array closing ']'"
			    :                      "Expecting JSON value(string, number, true, false, null, object or array)"
			, line, col, pos)

			static offset := A_AhkVersion<"2" ? -3 : -4
			throw Exception(msg, offset, SubStr(text, pos, len))
		}

		Walk(holder, key)
		{
			value := holder[key]
			if IsObject(value) {
				for i, k in this.keys[value] {
					; check if ObjHasKey(value, k) ??
					v := this.Walk(value, k)
					if (v != JSON.Undefined)
						value[k] := v
					else
						ObjDelete(value, k)
				}
			}
			
			return this.rev.Call(holder, key, value)
		}
	}

	/**
	 * Method: Dump
	 *     Converts an AHK value into a JSON string
	 * Syntax:
	 *     str := JSON.Dump( value [, replacer, space ] )
	 * Parameter(s):
	 *     str        [retval] - JSON representation of an AHK value
	 *     value          [in] - any value(object, string, number)
	 *     replacer  [in, opt] - function object, similar to JavaScript's
	 *                           JSON.stringify() 'replacer' parameter
	 *     space     [in, opt] - similar to JavaScript's JSON.stringify()
	 *                           'space' parameter
	 */
	class Dump extends JSON.Functor
	{
		Call(self, value, replacer:="", space:="")
		{
			this.rep := IsObject(replacer) ? replacer : ""

			this.gap := ""
			if (space) {
				static integer := "integer"
				if space is %integer%
					Loop, % ((n := Abs(space))>10 ? 10 : n)
						this.gap .= " "
				else
					this.gap := SubStr(space, 1, 10)

				this.indent := "`n"
			}

			return this.Str({"": value}, "")
		}

		Str(holder, key)
		{
			value := holder[key]

			if (this.rep)
				value := this.rep.Call(holder, key, ObjHasKey(holder, key) ? value : JSON.Undefined)

			if IsObject(value) {
			; Check object type, skip serialization for other object types such as
			; ComObject, Func, BoundFunc, FileObject, RegExMatchObject, Property, etc.
				static type := A_AhkVersion<"2" ? "" : Func("Type")
				if (type ? type.Call(value) == "Object" : ObjGetCapacity(value) != "") {
					if (this.gap) {
						stepback := this.indent
						this.indent .= this.gap
					}

					is_array := value.IsArray
				; Array() is not overridden, rollback to old method of
				; identifying array-like objects. Due to the use of a for-loop
				; sparse arrays such as '[1,,3]' are detected as objects({}). 
					if (!is_array) {
						for i in value
							is_array := i == A_Index
						until !is_array
					}

					str := ""
					if (is_array) {
						Loop, % value.Length() {
							if (this.gap)
								str .= this.indent
							
							v := this.Str(value, A_Index)
							str .= (v != "") ? v . "," : "null,"
						}
					} else {
						colon := this.gap ? ": " : ":"
						for k in value {
							v := this.Str(value, k)
							if (v != "") {
								if (this.gap)
									str .= this.indent

								str .= this.Quote(k) . colon . v . ","
							}
						}
					}

					if (str != "") {
						str := RTrim(str, ",")
						if (this.gap)
							str .= stepback
					}

					if (this.gap)
						this.indent := stepback

					return is_array ? "[" . str . "]" : "{" . str . "}"
				}
			
			} else ; is_number ? value : "value"
				return ObjGetCapacity([value], 1)=="" ? value : this.Quote(value)
		}

		Quote(string)
		{
			static quot := Chr(34), bashq := "\" . quot

			if (string != "") {
				  string := StrReplace(string,  "\",  "\\")
				; , string := StrReplace(string,  "/",  "\/") ; optional in ECMAScript
				, string := StrReplace(string, quot, bashq)
				, string := StrReplace(string, "`b",  "\b")
				, string := StrReplace(string, "`f",  "\f")
				, string := StrReplace(string, "`n",  "\n")
				, string := StrReplace(string, "`r",  "\r")
				, string := StrReplace(string, "`t",  "\t")

				static rx_escapable := A_AhkVersion<"2" ? "O)[^\x20-\x7e]" : "[^\x20-\x7e]"
				while RegExMatch(string, rx_escapable, m)
					string := StrReplace(string, m.Value, Format("\u{1:04x}", Ord(m.Value)))
			}

			return quot . string . quot
		}
	}

	/**
	 * Property: Undefined
	 *     Proxy for 'undefined' type
	 * Syntax:
	 *     undefined := JSON.Undefined
	 * Remarks:
	 *     For use with reviver and replacer functions since AutoHotkey does not
	 *     have an 'undefined' type. Returning blank("") or 0 won't work since these
	 *     can't be distnguished from actual JSON values. This leaves us with objects.
	 *     Replacer() - the caller may return a non-serializable AHK objects such as
	 *     ComObject, Func, BoundFunc, FileObject, RegExMatchObject, and Property to
	 *     mimic the behavior of returning 'undefined' in JavaScript but for the sake
	 *     of code readability and convenience, it's better to do 'return JSON.Undefined'.
	 *     Internally, the property returns a ComObject with the variant type of VT_EMPTY.
	 */
	Undefined[]
	{
		get {
			static empty := {}, vt_empty := ComObject(0, &empty, 1)
			return vt_empty
		}
	}

	class Functor
	{
		__Call(method, ByRef arg, args*)
		{
		; When casting to Call(), use a new instance of the "function object"
		; so as to avoid directly storing the properties(used across sub-methods)
		; into the "function object" itself.
			if IsObject(method)
				return (new this).Call(method, arg, args*)
			else if (method == "")
				return (new this).Call(arg, args*)
		}
	}
}

/*
{
  "trademarks" : [ {
    "status" : {
      "staff" : {
        "examiner" : null,
        "paralegal" : null,
        "ituParalegal" : null,
        "lie" : null,
        "chargeTo" : null
      },
      "correspondence" : {
        "freeFormAddress" : [ ],
        "address" : {
          "line1" : "2040 Main Street, 14th Floor",
          "city" : "Irvine",
          "region" : {
            "stateCountry" : {
              "code" : "CA",
              "name" : "CALIFORNIA"
            },
            "isoRegion" : {
              "code" : "CA",
              "name" : "CALIFORNIA"
            },
            "iso" : {
              "code" : "US",
              "name" : "CALIFORNIA"
            },
            "wipo" : null
          },
          "postalCode" : "92614",
          "countryCode" : "US",
          "countryName" : "UNITED STATES"
        },
        "attorneyName" : "Alexander D. Zeng",
        "attorneyEmail" : {
          "authIndicator" : "Y",
          "addresses" : [ "efiling@knobbe.com" ]
        },
        "individualFullName" : "Alexander D. Zeng",
        "firmName" : "Knobbe, Martens, Olson & Bear, LLP",
        "correspondantPhone" : "310-551-3450",
        "correspondantFax" : "949-760-9502",
        "correspondantEmail" : {
          "authIndicator" : "Y",
          "addresses" : [ "efiling@knobbe.com" ]
        }
      },
      "serialNumber" : 88326251,
      "designSearchList" : [ {
        "code" : "24.15.25",
        "descriptions" : [ "Other arrows" ]
      }, {
        "code" : "26.17.01",
        "descriptions" : [ "Bars, straight", "Lines, straight", "Bands, straight", "Straight line(s), band(s) or bar(s)" ]
      }, {
        "code" : "26.17.05",
        "descriptions" : [ "Bands, horizontal", "Bars, horizontal", "Horizontal line(s), band(s) or bar(s)", "Lines, horizontal" ]
      } ],
      "filingDate" : "2019-03-05",
      "usRegistrationNumber" : "5845537",
      "usRegistrationDate" : "2019-08-27",
      "filedAsTeasPlusApp" : false,
      "currentlyAsTeasPlusApp" : false,
      "filedAsTeasRfApp" : true,
      "currentlyAsTeasRfApp" : true,
      "supplementalRegister" : false,
      "amendPrincipal" : false,
      "amendSupplemental" : false,
      "trademark" : false,
      "certificationMark" : false,
      "serviceMark" : true,
      "collectiveMembershipMark" : false,
      "collectiveServiceMark" : false,
      "collectiveTradeMark" : false,
      "status" : 700,
      "statusDate" : "2019-08-27",
      "standardChar" : false,
      "markDrawingCd" : "3",
      "colorDrawingCurr" : false,
      "section2f" : false,
      "section2fPartial" : false,
      "others" : false,
      "publishedPrevRegMark" : false,
      "clsTotal" : 3,
      "filedUse" : true,
      "filedItu" : false,
      "filed44d" : false,
      "filed44e" : false,
      "filed66a" : false,
      "filedNoBasis" : false,
      "useCurr" : true,
      "ituCurr" : false,
      "sect44dCurr" : false,
      "sect44eCurr" : false,
      "sect66aCurr" : false,
      "noBasisCurr" : false,
      "useAmended" : false,
      "ituAmended" : false,
      "sect44dAmended" : false,
      "sect44eAmended" : false,
      "attrnyDktNumber" : "88RIS.007T",
      "sect8Filed" : false,
      "sect8Acpt" : false,
      "sect8PartialAcpt" : false,
      "sect15Filed" : false,
      "sect15Ack" : false,
      "sect71Filed" : false,
      "sect71Acpt" : false,
      "sect71PartialAcpt" : false,
      "renewalFiled" : false,
      "changeInReg" : false,
      "lawOffAsgnCd" : "L60",
      "currLocationCd" : "650",
      "currLocationDt" : "2019-08-27",
      "chargeToLocation" : null,
      "phyLocation" : null,
      "phyLocationDt" : null,
      "extStatusDesc" : "Registered.  The registration date is used to determine when post-registration maintenance documents are due.",
      "intStatusDesc" : null,
      "markDrawDesc" : "AN ILLUSTRATION DRAWING WHICH INCLUDES WORD(S)/ LETTER(S)/NUMBER(S)",
      "currentLoc" : "PUBLICATION AND ISSUE SECTION",
      "colorClaimed" : "Color is not claimed as a feature of the mark.",
      "descOfMark" : "The mark consists of the number \"88\" adjacent to an upward facing arrow, all of which are positioned above the terms \"HEAD IN THE\" and \"CLOUDS\" in a stacked position with the terms \"in the\" which set between horizontal lines.",
      "markElement" : "88 HEAD IN THE CLOUDS",
      "parentOf" : [ ],
      "prevRegNumList" : [ ],
      "newLawOffAsgnCd" : "106",
      "lawOffAssigned" : "LAW OFFICE 106",
      "tm5Status" : 8,
      "tm5StatusDesc" : "LIVE/REGISTRATION/Issued and Active",
      "tm5StatusDef" : "The trademark application has been registered with the Office.",
      "physicalLocationHistory" : [ {
        "eventDate" : "2019-03-08",
        "physicalLocation" : "OUT",
        "physicalLocationDescription" : "NO PHYSICAL FILE",
        "rsn" : "20382547"
      }, {
        "eventDate" : "2019-03-22",
        "physicalLocation" : "MADCD",
        "physicalLocationDescription" : "NO PHYSICAL FILE",
        "rsn" : "20424588"
      } ],
      "pseudoMark" : null
    },
    "parties" : {
      "ownerGroups" : {
        "30" : [ {
          "serialNumber" : 88326251,
          "partyType" : 30,
          "partyTypeDescription" : "ORIGINAL REGISTRANT",
          "reelFrame" : null,
          "entityNum" : 1,
          "entityType" : {
            "code" : 3,
            "description" : "CORPORATION"
          },
          "name" : "88Rising, Inc.",
          "composedOf" : null,
          "dbaAkaFormerly" : null,
          "assignment" : null,
          "address1" : "#401",
          "address2" : "135 W. 20th Street",
          "city" : "New York",
          "addressStateCountry" : {
            "stateCountry" : {
              "code" : "NY",
              "name" : "NEW YORK"
            },
            "isoRegion" : {
              "code" : "NY",
              "name" : "NEW YORK"
            },
            "iso" : {
              "code" : "US",
              "name" : "NEW YORK"
            },
            "wipo" : null
          },
          "zip" : "10011",
          "citizenship" : {
            "stateCountry" : {
              "code" : "DE",
              "name" : "DELAWARE"
            },
            "isoRegion" : {
              "code" : "DE",
              "name" : "DELAWARE"
            },
            "iso" : {
              "code" : "US",
              "name" : "DELAWARE"
            },
            "wipo" : null
          }
        } ],
        "20" : [ {
          "serialNumber" : 88326251,
          "partyType" : 20,
          "partyTypeDescription" : "OWNER AT PUBLICATION",
          "reelFrame" : null,
          "entityNum" : 1,
          "entityType" : {
            "code" : 3,
            "description" : "CORPORATION"
          },
          "name" : "88Rising, Inc.",
          "composedOf" : null,
          "dbaAkaFormerly" : null,
          "assignment" : null,
          "address1" : "#401",
          "address2" : "135 W. 20th Street",
          "city" : "New York",
          "addressStateCountry" : {
            "stateCountry" : {
              "code" : "NY",
              "name" : "NEW YORK"
            },
            "isoRegion" : {
              "code" : "NY",
              "name" : "NEW YORK"
            },
            "iso" : {
              "code" : "US",
              "name" : "NEW YORK"
            },
            "wipo" : null
          },
          "zip" : "10011",
          "citizenship" : {
            "stateCountry" : {
              "code" : "DE",
              "name" : "DELAWARE"
            },
            "isoRegion" : {
              "code" : "DE",
              "name" : "DELAWARE"
            },
            "iso" : {
              "code" : "US",
              "name" : "DELAWARE"
            },
            "wipo" : null
          }
        } ],
        "10" : [ {
          "serialNumber" : 88326251,
          "partyType" : 10,
          "partyTypeDescription" : "ORIGINAL APPLICANT",
          "reelFrame" : null,
          "entityNum" : 1,
          "entityType" : {
            "code" : 3,
            "description" : "CORPORATION"
          },
          "name" : "88Rising, Inc.",
          "composedOf" : null,
          "dbaAkaFormerly" : null,
          "assignment" : null,
          "address1" : "#401",
          "address2" : "135 W. 20th Street",
          "city" : "New York",
          "addressStateCountry" : {
            "stateCountry" : {
              "code" : "NY",
              "name" : "NEW YORK"
            },
            "isoRegion" : {
              "code" : "NY",
              "name" : "NEW YORK"
            },
            "iso" : {
              "code" : "US",
              "name" : "NEW YORK"
            },
            "wipo" : null
          },
          "zip" : "10011",
          "citizenship" : {
            "stateCountry" : {
              "code" : "DE",
              "name" : "DELAWARE"
            },
            "isoRegion" : {
              "code" : "DE",
              "name" : "DELAWARE"
            },
            "iso" : {
              "code" : "US",
              "name" : "DELAWARE"
            },
            "wipo" : null
          }
        } ]
      }
    },
    "gsList" : [ {
      "serialNumber" : 88326251,
      "internationalClassPrime" : true,
      "usClasses" : [ {
        "code" : "100",
        "description" : "Miscellaneous"
      }, {
        "code" : "101",
        "description" : "Advertising and Business"
      }, {
        "code" : "107",
        "description" : "Education and Entertainment"
      } ],
      "internationalClasses" : [ {
        "code" : "041",
        "description" : "Education and Entertainment"
      } ],
      "pseudoClasses" : [ ],
      "statusCode" : "6",
      "statusDescription" : "ACTIVE",
      "statusDate" : "2019-03-22",
      "firstUseDate" : 20180922,
      "firstUseInCommerceDate" : 20180922,
      "firstUseDateDescription" : null,
      "firstUseInCommerceDateDescription" : null,
      "description" : "Entertainment services, namely, arranging and conducting music and art festival",
      "classBasis" : null,
      "primeClassCode" : "041"
    } ],
    "foreignInfoList" : [ ],
    "prosecutionHistory" : [ {
      "entryNumber" : 11,
      "entryCode" : "ARAA",
      "entryType" : "I",
      "proceedingNum" : 0,
      "entryDate" : "2019-10-24T04:00:00.000+0000",
      "entryDesc" : "ATTORNEY/DOM.REP.REVOKED AND/OR APPOINTED"
    }, {
      "entryNumber" : 10,
      "entryCode" : "REAP",
      "entryType" : "I",
      "proceedingNum" : 0,
      "entryDate" : "2019-10-24T04:00:00.000+0000",
      "entryDesc" : "TEAS REVOKE/APP/CHANGE ADDR OF ATTY/DOM REP RECEIVED"
    }, {
      "entryNumber" : 9,
      "entryCode" : "R.PR",
      "entryType" : "A",
      "proceedingNum" : 0,
      "entryDate" : "2019-08-27T04:00:00.000+0000",
      "entryDesc" : "REGISTERED-PRINCIPAL REGISTER"
    }, {
      "entryNumber" : 8,
      "entryCode" : "NPUB",
      "entryType" : "E",
      "proceedingNum" : 0,
      "entryDate" : "2019-06-11T04:00:00.000+0000",
      "entryDesc" : "OFFICIAL GAZETTE PUBLICATION CONFIRMATION E-MAILED"
    }, {
      "entryNumber" : 7,
      "entryCode" : "PUBO",
      "entryType" : "A",
      "proceedingNum" : 0,
      "entryDate" : "2019-06-11T04:00:00.000+0000",
      "entryDesc" : "PUBLISHED FOR OPPOSITION"
    }, {
      "entryNumber" : 6,
      "entryCode" : "NONP",
      "entryType" : "E",
      "proceedingNum" : 0,
      "entryDate" : "2019-05-22T04:00:00.000+0000",
      "entryDesc" : "NOTIFICATION OF NOTICE OF PUBLICATION E-MAILED"
    }, {
      "entryNumber" : 5,
      "entryCode" : "CNSA",
      "entryType" : "O",
      "proceedingNum" : 0,
      "entryDate" : "2019-05-01T04:00:00.000+0000",
      "entryDesc" : "APPROVED FOR PUB - PRINCIPAL REGISTER"
    }, {
      "entryNumber" : 4,
      "entryCode" : "DOCK",
      "entryType" : "D",
      "proceedingNum" : 78477,
      "entryDate" : "2019-04-26T04:00:00.000+0000",
      "entryDesc" : "ASSIGNED TO EXAMINER"
    }, {
      "entryNumber" : 3,
      "entryCode" : "MDSM",
      "entryType" : "E",
      "proceedingNum" : 0,
      "entryDate" : "2019-03-23T04:00:00.000+0000",
      "entryDesc" : "NOTICE OF DESIGN SEARCH CODE E-MAILED"
    }, {
      "entryNumber" : 2,
      "entryCode" : "NWOS",
      "entryType" : "I",
      "proceedingNum" : 0,
      "entryDate" : "2019-03-22T04:00:00.000+0000",
      "entryDesc" : "NEW APPLICATION OFFICE SUPPLIED DATA ENTERED IN TRAM"
    }, {
      "entryNumber" : 1,
      "entryCode" : "NWAP",
      "entryType" : "I",
      "proceedingNum" : 0,
      "entryDate" : "2019-03-08T05:00:00.000+0000",
      "entryDesc" : "NEW APPLICATION ENTERED IN TRAM"
    } ],
    "relationshipBundleList" : [ ],
    "internationalData" : false,
    "publication" : {
      "serialNumber" : 88326251,
      "datePublished" : "2019-06-11",
      "officialGazettes" : [ ]
    },
    "divisional" : {
      "serialNumber" : 88326251,
      "childOf" : null,
      "parentOfList" : [ ]
    }
  } ]
}
*/


