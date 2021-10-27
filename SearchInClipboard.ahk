#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
SysGet, ScreenWidth, 78
SysGet, ScreenHeight, 79
SetWinDelay, 20  ; 20 is good for drawers.
Menu, Tray, Icon, Shell32.dll, 42

F1::
ExamineClipboard:
Search1  := "Power of Attorney"
Search2  := "Assignment"
Search3  := "Priority Docs"
Search4  := "Office Action"
Search5  := "Examiner Report"
Search6  := "POA"
Search7  := "Instructions"
Search8  := "Comments"
Search9  := "Deadline"
Search10 := "Extension"
Search11 := "Fee"
Search12 := "Renewal"
Search13 := "Annuity"
Search14 := "Annuities"
Search15 := "Certificate"
Search16 := "Letters Patent"
Search17 := "Original"
Search18 := "Courier"
Search19 := "Notarized"
Search20 := "Apostilled"
Search21 := "Abandon"
Search22 := "Extinguished"
Search23 := "Entitlement"
Search24 := "Exam"
Search25 := "Examination"
Search26 := "T"
Search27 := "U"
Search28 := "V"
Search29 := "W"
Search30 := "X"
Search31 := "Y"
Search32 := "Z"
myindex := 0
Clipboard = 
SendInput ^c
ClipWait, 1
StringSplit, ClipboardLines, Clipboard, `n ,  , 1
;MsgBox, % Clipboard
Loop 32
{
StringReplace, Clipboard, Clipboard, % Search%A_Index%, % Search%A_Index%, UseErrorLevel
Result%A_Index% := ErrorLevel

if ErrorLevel = 0
	{}
else
	{
	if Mod(myindex, 10) = 0
		{
		Gui, Add, Button, w150 ym, % Search%A_Index% " = " Result%A_Index%
		;Gui, Add, Text, w150 , Lines:
		}
	else
		{
		Gui, Add, Button, w150, % Search%A_Index% " = " Result%A_Index%
		;Gui, Add, Text, w150, Lines:
		}
myindex++	
}	
}
Gui, Add, Button, w150 gCloseWindow, Close Window
GuiControlGet, StatusButton1, , Button1
if StatusButton1 = Close Window
	Gui, Add, Text, Center w150, No keywords found.
Gui, Show
return

CloseWindow:
Gui, Destroy
return


#2::
ExamineClipboard2:
Search1  := "Power of Attorney"
Search2  := "Assignment"
Search3  := "Priority Docs"
Search4  := "Office Action"
Search1  := "Power of Attorney"
Search2  := "Assignment"
Search3  := "Priority Docs"
Search4  := "Office Action"
Search1  := "Power of Attorney"
Search2  := "Assignment"
Search3  := "Priority Docs"
Search4  := "Office Action"
Search5  := "Examiner Report"
Search6  := "POA"
Search7  := "Instructions"
Search8  := "Comments"
Search9  := "Deadline"
Search10 := "Extension"
Search11 := "Fee"
Search12 := "Renewal"
Search13 := "Annuity"
Search14 := "Annuities"
Search15 := "Certificate"
Search16 := "Letters Patent"
Search17 := "Original"
Search18 := "Courier"
Search19 := "Notarized"
Search20 := "Apostilled"
Search21 := "Abandon"
Search22 := "Extinguished"
Search23 := "Entitlement"
Search24 := "Exam"
Search25 := "Examination"
Search26 := "T"
Search27 := "U"
Search28 := "V"
Search29 := "W"
Search30 := "X"
Search31 := "Y"
Search32 := "Z"
myindex := 0
StringSplit, Words, Clipboard, %A_Space% ,  ; Omits periods. 

Xl := ComObjActive("Excel.Application") ;handle
Xl.Visible := True ;by default excel sheets are invisible
;Xl.Workbooks.Add ;add a new workbook



;Columns := Object(1,"A",2,"B",3,"C",4,"D",5,"E",6,"F",7,"G",8,"H",9,"I",10,"J") ;array of column letters
;For Key, Value In Columns
Row := 1
Loop 100
{
StringRight, Count, A_Index, 1
	if Count = 1
		Column := "A"
	if Count = 2
		Column := "B"
	if Count = 3
		Column := "C"
	if Count = 4
		Column := "D"
	if Count = 5
		Column := "E"
	if Count = 6
		Column := "F"
	if Count = 7
		Column := "G"
	if Count = 8
		Column := "H"
	if Count = 9
		Column := "I"
	if Count = 0
		Column := "J"
	;MsgBox, %Column% %Row%
XL.Range(Column . Row).Value := Words%A_Index%
	if Count = 0
		{
		Row++
		}
}

XL.Range("C1").Select

return

GuiClose:
Gui, Destroy
return



/*
Our FA hasn’t been too prompt with copies of EUIPO filings and decisions on scheduling from the EUIPO for LITHE.027ZTEM so I have pulled the attached from the IPO.  J


; How to use examples
F2::
oWord := ComObjCreate("Word.Application") ; create MS Word object

oWord.Documents.Add ; create new document

oWord.Selection.font.bold := true
oWord.Selection.TypeText("Visit ")

oWord.ActiveDocument.Hyperlinks.add(oWord.Selection.range, "http://www.reddit.com","","","Reddit.com")
oWord.Selection.font.italic := true
oWord.Selection.TypeText("`n`nIt is really cool.")
oWord.Selection.font.italic := false
oWord.Selection.TypeText("`n`nIt is really cool.")
oWord.Selection.TypeParagraph
oWord.Selection.TypeText("`n`nIt is really cool.")

oWord.visible := true


return

;oWord.Selection.Font.Bold := 1 ; bold
oWord.Selection.TypeText(Clipboard) ; type text
;oWord.ActiveDocument.Hyperlinks.Add(oWord.Selection.Range, "http://www.autohotkey.com/forum/topic61509.html"
oWord.Selection.Find.ClearFormatting
oWord.Selection.Find.Replacement.ClearFormatting
oWord.Selection.Find.Text := "Gui"
;,"","","COM Object Reference [AutoHotkey_L]") ; insert hyperlink
;oWord.Selection.TypeText("and learn how to work with ") ; type text
;oWord.Selection.Font.Italic := 1 ; italic
;oWord.Selection.TypeText("COM objects") ; type text
;oWord.Selection.Font.Bold := 0, oWord.Selection.Font.Italic := 0 ; bold and italic off
;oWord.Selection.TypeText(".") ; type text
;oWord.Selection.TypeParagraph ; type paragraph (enter, new line)

oWord.Visible := 1, oWord.Activate ; make it visible and activate it.
ExitApp
return





!w::
if  hWnd :=  WinExist("ahk_class OpusApp")
{
   For oWord in ComObjCreate("Word.Application")
   {} Until  (hWnd = oWord.hwnd)
   params := [OutputVar, 32]
}
else
{
   oWord := ComObjCreate("Word.Application")
   oWord.Visible := True
   params := [OutputVar, 32]
}

oDoc := oWord.Documents.Add()
oDoc.Range.text := clipboard "`n`n" Clipboard
Sleep 500

oDoc.Selection.Find.ClearFormatting
oDoc.Selection.Find.Replacement.ClearFormatting
oDoc.Selection.Find.Replacement.Highlight := True
    oDoc.With Selection.Find
        oDoc.Text := "power of attorney"
        oDoc.Replacement.Text := "power of attorney"
        oDoc.Forward := True
        oDoc.Wrap := wdFindContinue
        oDoc.Format := True
        oDoc.MatchCase := False
        oDoc.MatchWholeWord := False
        oDoc.MatchWildcards := False
        oDoc.MatchSoundsLike := False
        oDoc.MatchAllWordForms := False
   oDoc.End With
oDoc.Selection.Find.Execute Replace:=wdReplaceAll
return
*/

/*
Loop %ClipboardLines0%
{
	;MsgBox, % ClipboardLines0 " | " ClipboardLines%A_Index% " | " Search1

	if ClipboardLines%A_Index% contains %Search1%
		{
		GuiControlGet,  Location1, , Static1
		Location1 := Location1 . A_Index ", "
		GuiControl, , Static1, %Location1%
		}

}

Loop %ClipboardLines0%
{
	;MsgBox, % ClipboardLines0 " | " ClipboardLines%A_Index% " | " Search2

	if ClipboardLines%A_Index% contains %Search2%
		{
		GuiControlGet,  Location2, , Static2
		Location2 := Location2 . A_Index ", "
		GuiControl, , Static2, %Location2%
		}

}

Loop %ClipboardLines0%
{
	;MsgBox, % ClipboardLines0 " | " ClipboardLines%A_Index% " | " Search3

	if ClipboardLines%A_Index% contains %Search3%
		{
		GuiControlGet,  Location3, , Static3
		Location3 := Location3 . A_Index ", "
		GuiControl, , Static3, %Location3%
		}

}

Loop %ClipboardLines0%
{
	;MsgBox, % ClipboardLines0 " | " ClipboardLines%A_Index% " | " Search4

	if ClipboardLines%A_Index% contains %Search4%
		{
		GuiControlGet,  Location4, , Static4
		Location4 := Location4 . A_Index ", "
		GuiControl, , Static4, %Location4%
		}

}

Loop %ClipboardLines0%
{
	;MsgBox, % ClipboardLines0 " | " ClipboardLines%A_Index% " | " Search5

	if ClipboardLines%A_Index% contains %Search5%
		{
		GuiControlGet,  Location5, , Static5
		Location5 := Location5 . A_Index ", "
		GuiControl, , Static5, %Location5%
		}

}

Loop %ClipboardLines0%
{
	;MsgBox, % ClipboardLines0 " | " ClipboardLines%A_Index% " | " Search6

	if ClipboardLines%A_Index% contains %Search6%
		{
		GuiControlGet,  Location6, , Static6
		Location6 := Location6 . A_Index ", "
		GuiControl, , Static6, %Location6%
		}

}

Loop %ClipboardLines0%
{
	;MsgBox, % ClipboardLines0 " | " ClipboardLines%A_Index% " | " Search7

	if ClipboardLines%A_Index% contains %Search7%
		{
		GuiControlGet,  Location7, , Static7
		Location7 := Location7 . A_Index ", "
		GuiControl, , Static7, %Location7%
		}

}

Loop %ClipboardLines0%
{
	;MsgBox, % ClipboardLines0 " | " ClipboardLines%A_Index% " | " Search8

	if ClipboardLines%A_Index% contains %Search8%
		{
		GuiControlGet,  Location8, , Static8
		Location8 := Location8 . A_Index ", "
		GuiControl, , Static8, %Location8%
		}

}

Loop %ClipboardLines0%
{
	;MsgBox, % ClipboardLines0 " | " ClipboardLines%A_Index% " | " Search9

	if ClipboardLines%A_Index% contains %Search9%
		{
		GuiControlGet,  Location9, , Static9
		Location9 := Location9 . A_Index ", "
		GuiControl, , Static9, %Location9%
		}

}

Loop %ClipboardLines0%
{
	;MsgBox, % ClipboardLines0 " | " ClipboardLines%A_Index% " | " Search10

	if ClipboardLines%A_Index% contains %Search10%
		{
		GuiControlGet,  Location10, , Static10
		Location10 := Location10 . A_Index ", "
		GuiControl, , Static10, %Location10%
		}

}

Loop %ClipboardLines0%
{
	;MsgBox, % ClipboardLines0 " | " ClipboardLines%A_Index% " | " Search11

	if ClipboardLines%A_Index% contains %Search11%
		{
		GuiControlGet,  Location11, , Static11
		Location11 := Location11 . A_Index ", "
		GuiControl, , Static11, %Location11%
		}

}

Loop %ClipboardLines0%
{
	;MsgBox, % ClipboardLines0 " | " ClipboardLines%A_Index% " | " Search12

	if ClipboardLines%A_Index% contains %Search12%
		{
		GuiControlGet,  Location12, , Static12
		Location12 := Location12 . A_Index ", "
		GuiControl, , Static12, %Location12%
		}

}


Loop %ClipboardLines0%
{
	;MsgBox, % ClipboardLines0 " | " ClipboardLines%A_Index% " | " Search13

	if ClipboardLines%A_Index% contains %Search13%
		{
		GuiControlGet,  Location13, , Static13
		Location13 := Location13 . A_Index ", "
		GuiControl, , Static13, %Location13%
		}

}

Loop %ClipboardLines0%
{
	;MsgBox, % ClipboardLines0 " | " ClipboardLines%A_Index% " | " Search14

	if ClipboardLines%A_Index% contains %Search14%
		{
		GuiControlGet,  Location14, , Static14
		Location14 := Location14 . A_Index ", "
		GuiControl, , Static14, %Location14%
		}

}

Loop %ClipboardLines0%
{
	;MsgBox, % ClipboardLines0 " | " ClipboardLines%A_Index% " | " Search15

	if ClipboardLines%A_Index% contains %Search15%
		{
		GuiControlGet,  Location15, , Static15
		Location15 := Location15 . A_Index ", "
		GuiControl, , Static15, %Location15%
		}

}

*/
