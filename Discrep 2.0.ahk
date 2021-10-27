#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

rowSplits := [1]
copyRows := []
clientCodes := []

Gui, New, ToolWindow AlwaysOnTop, Excel GUI
Gui, Font, s8
; Gui, Add, Button, gGrabRow x5 y5 w100 h30, Grab Row
; Gui, Add, Button, gNewSheet x205 y5 w100 h30, New Sheet
; Gui, Add, Button, gCopyToNewSheet x105 y50 w100 h30, Copy to New Sheet
Gui, Add, Button, gSplitByCode 		x5 y5 w100 h30	, Split By Code
; Gui, Add, Button, gCheckSplits 		xp 	yp+40 wp hp	, Check Splits / Client Codes
; Gui, Add, Button, gCreateAllSheets 	xp 	yp+40 wp hp	, Create All Sheets
; Gui, Add, Button, gAddInfoToSheets 	xp 	yp+40 wp hp	, Add Info To Sheets
Gui, Add, Button, gProcessData 		xp 	yp+40 wp hp	, Process Data
Gui, Add, Button, gAddSorting 		xp 	yp+40 wp+101 hp	, Add Sorting


Gui, Font, s16
Gui, Add, Edit,	x105 y6 	w100 h28 Center	, 0
Gui, Add, Edit,	xp 	 yp+40  w100 hp Center	, 0
;Gui, Add, Edit,	xp 	 yp+40  w100 hp Center	, 0
; Gui, Add, Edit,	xp 	 yp+40  w100 hp Center	, 0
; Gui, Add, Edit,	xp 	 yp+40  w100 hp Center	, 0

;Gui, Font, 
;Gui, Add, Button, gUpdateColor x5  		y245 w50 h50, Green
;Gui, Add, Button, gUpdateColor xp+55 	yp 	 wp  hp	, Yellow
;Gui, Add, Button, gUpdateColor xp+55 	yp 	 wp  hp	, Red

Gui, Show, w210 h120 y20
return

AddSorting:
xl := ComObjActive("Excel.Application")
xl.ActiveSheet.Range("C1").AutoFilter(3)
xl.ActiveSheet.Columns("A:Q").AutoFit

MsgBox, % "Make sure to Sort by CaseNumber then ActionDue then BaseDate? for best results."

;vbTrue := -1
;xlAscending := 1
;xlYes := 1


;xl.ActiveSheet.UsedRange.Sort(Key1 := xl.ActiveSheet.Range("C1")
;		, Order1 := xlAscending,,,,,
;		, Header := xlYes)







return


ProcessData:
xl := ComObjActive("Excel.Application")

matches := []
mismatches := []
offset = 0

Loop % GrabRow() ; - 1
	{
	if (A_Index > 1)
		tempPrevious := xl.Range("F" A_Index - 1).Value
	
	tempCurrent := xl.Range("F" A_Index).Value
	tempNext := xl.Range("F" A_Index + 1).Value

	if (tempCurrent == tempNext)
		{
		
		if (xl.Range("B" A_Index).Value == xl.Range("B" A_Index + 1).Value)
			{
			
			
			xl.Range("A" A_Index ":Q" A_Index).Font.ColorIndex := 3
			xl.Range("A" A_Index+1 ":Q" A_Index+1).Font.ColorIndex := 3
			mismatches.Push(A_Index)
			mismatches.Push(A_Index + 1)
			}
		else
			{
			xl.Range("A" A_Index + 1 ":Q" A_Index + 1).Borders(9).LineStyle := 1
		;	xl.Range("A" A_Index - 1 ":Q" A_Index - 1).Borders(9).LineStyle := 1
			xl.Range("F" A_Index).Value := xl.Range("F" A_Index + 1).Value " ✅"
			xl.Range("F" A_Index + 1).Value := xl.Range("F" A_Index + 1).Value " ✅"
			xl.Range("F" A_Index).Font.ColorIndex := 4
			xl.Range("F" A_Index + 1).Font.ColorIndex := 4
			matches.Push(A_Index ":" A_Index + 1)
			}
		}
	else if (tempCurrent != tempPrevious && tempCurrent != tempNext && A_Index > 1)
		{
		xl.Range("A" A_Index ":Q" A_Index).Font.ColorIndex := 3
		
		if (xl.Range("F" A_Index).Value == "-")
			{
			xl.Rows(A_Index).Value := ""
			; xl.Range("A" A_Index).Value := "-"
			}
	;	else
	;		{
	;		xl.Range("A" A_Index).Value := "❌"
	;		}

		mismatches.Push(A_Index)
		}	
	}
	
	
Loop % matches.Length()
	{
	rows := StrSplit(matches[A_Index], ":")

	if (xl.Range("H" rows[1]).Value == xl.Range("H" rows[2]).Value)
		{
		xl.Range("H" rows[1]).Value := xl.Range("H" rows[1]).Value " ✅"
		xl.Range("H" rows[2]).Value := xl.Range("H" rows[2]).Value " ✅"		
		xl.Range("H" rows[1]).Font.ColorIndex := 4
		xl.Range("H" rows[2]).Font.ColorIndex := 4
		}
	else
		{
		xl.Range("H" rows[1]).Value := xl.Range("H" rows[1]).Value " ❌"
		xl.Range("H" rows[2]).Value := xl.Range("H" rows[2]).Value " ❌"		
		xl.Range("H" rows[1]).Font.ColorIndex := 3
		xl.Range("H" rows[2]).Font.ColorIndex := 3
		}	


	if (xl.Range("I" rows[1]).Value == xl.Range("I" rows[2]).Value)
		{
		xl.Range("I" rows[1]).Value := xl.Range("I" rows[1]).Value " ✅"
		xl.Range("I" rows[2]).Value := xl.Range("I" rows[2]).Value " ✅"		
		xl.Range("I" rows[1]).Font.ColorIndex := 4
		xl.Range("I" rows[2]).Font.ColorIndex := 4
		}
	else
		{
		xl.Range("I" rows[1]).Value := xl.Range("I" rows[1]).Value " ❌"
		xl.Range("I" rows[2]).Value := xl.Range("I" rows[2]).Value " ❌"		
		xl.Range("I" rows[1]).Font.ColorIndex := 3
		xl.Range("I" rows[2]).Font.ColorIndex := 3
		}


	if (xl.Range("J" rows[1]).Value == xl.Range("J" rows[2]).Value)
		{
		xl.Range("J" rows[1]).Value := xl.Range("J" rows[1]).Value " ✅"
		xl.Range("J" rows[2]).Value := xl.Range("J" rows[2]).Value " ✅"		
		xl.Range("J" rows[1]).Font.ColorIndex := 4
		xl.Range("J" rows[2]).Font.ColorIndex := 4
		}
	else
		{
		xl.Range("J" rows[1]).Value := xl.Range("J" rows[1]).Value " ❌"
		xl.Range("J" rows[2]).Value := xl.Range("J" rows[2]).Value " ❌"		
		xl.Range("J" rows[1]).Font.ColorIndex := 3
		xl.Range("J" rows[2]).Font.ColorIndex := 3
		}	

	if (xl.Range("K" rows[1]).Value == xl.Range("K" rows[2]).Value)
		{
		xl.Range("K" rows[1]).Value := xl.Range("K" rows[1]).Value " ✅"
		xl.Range("K" rows[2]).Value := xl.Range("K" rows[2]).Value " ✅"		
		xl.Range("K" rows[1]).Font.ColorIndex := 4
		xl.Range("K" rows[2]).Font.ColorIndex := 4
		}
	else
		{
		xl.Range("K" rows[1]).Value := xl.Range("K" rows[1]).Value " ❌"
		xl.Range("K" rows[2]).Value := xl.Range("K" rows[2]).Value " ❌"		
		xl.Range("K" rows[1]).Font.ColorIndex := 3
		xl.Range("K" rows[2]).Font.ColorIndex := 3
		}	
	GuiControl, , Edit2, %A_Index%		
	}		

offset := 0

Loop % mismatches.Length()
	{
	tempRow := mismatches[mismatches.Length() - offset]

	
	if (xl.Range("A" tempRow).text != "")
		{
		xl.Rows(tempRow + 1).Insert
		
		xl.Range("A" tempRow + 1).Value := "-"
		
		if InStr(xl.Range("B" tempRow).Value,"Agent")
			xl.Range("B" tempRow + 1).Value := "Live"
		else
			xl.Range("B" tempRow + 1).Value := "Agent"



		xl.Range("C" tempRow + 1).Value := "-"			
		xl.Range("D" tempRow + 1).Value := "-"			
		xl.Range("E" tempRow + 1).Value := "-"			
		xl.Range("F" tempRow + 1).Value := "-"
		xl.Range("G" tempRow + 1).Value := "-"			
		xl.Range("H" tempRow + 1).Value := "-"			
		xl.Range("I" tempRow + 1).Value := "-"			
		xl.Range("J" tempRow + 1).Value := "-"			
		xl.Range("K" tempRow + 1).Value := "-"			
		xl.Range("L" tempRow + 1).Value := "-"			
		xl.Range("M" tempRow + 1).Value := "-"			
		xl.Range("N" tempRow + 1).Value := "-"			
		xl.Range("O" tempRow + 1).Value := "-"			
		xl.Range("P" tempRow + 1).Value := "-"			
		xl.Range("Q" tempRow + 1).Value := "-"			
		
		xl.Range("A" tempRow + 1 ":Q" tempRow + 1).Borders(9).LineStyle := 1
		; xl.Rows(tempRow).Interior.ColorIndex := 27
		; xl.Rows(tempRow + 1).Interior.ColorIndex := 27
		
		}	
	offset++
	}
	
xl.ActiveSheet.Columns("A:Q").AutoFit
;xl.ActiveWindow.SplitRow := 1
;xl.ActiveWindow.SplitColumn := 0
;xl.ActiveWindow.FreezePanes := 1
GuiControl, , Edit2, DONE
return


SplitByCode:
xl := ComObjActive("Excel.Application")
gosub AddSorting
startPos := 1
Loop 
	{
	if (xl.Range("C" A_Index + 1 + startPos).text != xl.Range("C" A_Index + startPos).text)
		{
		xl.Rows(A_Index + 1 + startPos).Insert
		startPos += 1
		xl.Rows(A_Index + startPos).Value := "-"
		xl.Rows(A_Index + startPos).Interior.ColorIndex := 1
		GuiControl, , Edit1, %startPos%
		}
	else if (xl.Range("C" A_Index + 1 + startPos).text == "")
		{
		GuiControl, , Edit1, %startPos% DONE
		break
		}
		
	}
return


GrabRow()
	{
	xl := ComObjActive("Excel.Application")
	startRow = 1

	Loop 
		{
		if (xl.Range("C" A_Index + startRow).text == "")
			{
			temp := A_Index
			break
			}
		}
	return temp
	}

/* 

/* 

ActiveWorkbook.Worksheets("Sheet1").AutoFilter.Sort.SortFields.Clear
ActiveWorkbook.Worksheets("Sheet1").AutoFilter.Sort.SortFields.Add Key:=Range _
	("C2:C100"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:= _
	xlSortNormal
ActiveWorkbook.Worksheets("Sheet1").AutoFilter.Sort.SortFields.Add Key:=Range _
	("F2:F100"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:= _
	xlSortNormal
ActiveWorkbook.Worksheets("Sheet1").AutoFilter.Sort.SortFields.Add Key:=Range _
	("J2:J100"), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:= _
	xlSortNormal
With ActiveWorkbook.Worksheets("Sheet1").AutoFilter.Sort
	.Header = xlYes
	.MatchCase = False
	.Orientation = xlTopToBottom
	.SortMethod = xlPinYin
	.Apply
End With



return

UpdateColor:
xl := ComObjActive("Excel.Application")

if (A_GuiControl == "Green")
	xl.ActiveSheet.Tab.ColorIndex := 4
else if (A_GuiControl == "Yellow")
	xl.ActiveSheet.Tab.ColorIndex := 6
else if (A_GuiControl == "Red")
	xl.ActiveSheet.Tab.ColorIndex := 3

; https://docs.microsoft.com/en-us/office/vba/api/excel.colorindex

; xl.ActiveSheet.Range("A1:B10").Sort(xl.Range("B1"),,,,,,,1)

;xl.ActiveSheet.Range("A1").AutoFilter	
;xl.ActiveSheet.Range("A1").AutoFilter(6)	

return



MsgBox, % xl.ActiveCell.Address
MsgBox, % xl.ActiveCell.Row
MsgBox, % xl.ActiveCell.Column
GuiControl, , Edit2, % xl.Range("A" xl.ActiveCell.Row).text

AddInfoToSheets:

rowPosition = 2
Loop % clientCodes.Length()
	{
	tempClientCode := xl.Worksheets("Sheet1").Range("C" A_Index + 1).text
	
	if (tempClientCode != "-")
		{
		xl.Worksheets(tempClientCode).Range("A" rowPosition).Value := xl.Worksheets("Sheet1").Range("A" . A_Index + 1).Value
		xl.Worksheets(tempClientCode).Range("B" rowPosition).Value := xl.Worksheets("Sheet1").Range("B" . A_Index + 1).Value
		xl.Worksheets(tempClientCode).Range("C" rowPosition).Value := xl.Worksheets("Sheet1").Range("C" . A_Index + 1).Value
		xl.Worksheets(tempClientCode).Range("D" rowPosition).Value := xl.Worksheets("Sheet1").Range("D" . A_Index + 1).Value
		xl.Worksheets(tempClientCode).Range("E" rowPosition).Value := xl.Worksheets("Sheet1").Range("E" . A_Index + 1).Value
		xl.Worksheets(tempClientCode).Range("F" rowPosition).Value := xl.Worksheets("Sheet1").Range("F" . A_Index + 1).Value
		xl.Worksheets(tempClientCode).Range("G" rowPosition).Value := xl.Worksheets("Sheet1").Range("G" . A_Index + 1).Value
		xl.Worksheets(tempClientCode).Range("H" rowPosition).Value := xl.Worksheets("Sheet1").Range("H" . A_Index + 1).Value
		xl.Worksheets(tempClientCode).Range("I" rowPosition).Value := xl.Worksheets("Sheet1").Range("I" . A_Index + 1).Value
		xl.Worksheets(tempClientCode).Range("J" rowPosition).Value := xl.Worksheets("Sheet1").Range("J" . A_Index + 1).Value
		xl.Worksheets(tempClientCode).Range("K" rowPosition).Value := xl.Worksheets("Sheet1").Range("K" . A_Index + 1).Value
		xl.Worksheets(tempClientCode).Range("L" rowPosition).Value := xl.Worksheets("Sheet1").Range("L" . A_Index + 1).Value
		xl.Worksheets(tempClientCode).Range("M" rowPosition).Value := xl.Worksheets("Sheet1").Range("M" . A_Index + 1).Value
		xl.Worksheets(tempClientCode).Range("N" rowPosition).Value := xl.Worksheets("Sheet1").Range("N" . A_Index + 1).Value
		xl.Worksheets(tempClientCode).Range("O" rowPosition).Value := xl.Worksheets("Sheet1").Range("O" . A_Index + 1).Value
		xl.Worksheets(tempClientCode).Range("P" rowPosition).Value := xl.Worksheets("Sheet1").Range("P" . A_Index + 1).Value
		xl.Worksheets(tempClientCode).Range("Q" rowPosition).Value := xl.Worksheets("Sheet1").Range("Q" . A_Index + 1).Value
		
		rowPosition++
		xl.Worksheets(tempClientCode).Range("A1").AutoFilter(Field := 6)	
		xl.Worksheets(tempClientCode).Columns("A:Q").AutoFit	
		}

	if (tempClientCode == "-")
		{
		rowPosition = 1
		
		}		
	
	GuiControl, , Edit4, % A_Index
	}


return

CreateAllSheets:
xl := ComObjActive("Excel.Application")
Loop % clientCodes.Length()
	{
	oSheet := xl.Worksheets.Add()					; add a new Sheet
	oSheet.Name :=  clientCodes[A_Index]			; name new sheet to "Data1"
	xl.Worksheets(clientCodes[A_Index]).Range("A1").Value := "RecId"
	xl.Worksheets(clientCodes[A_Index]).Range("B1").Value := "System"
	xl.Worksheets(clientCodes[A_Index]).Range("C1").Value := "CaseNumber"
	xl.Worksheets(clientCodes[A_Index]).Range("D1").Value := "Country"
	xl.Worksheets(clientCodes[A_Index]).Range("E1").Value := "ActionType"
	xl.Worksheets(clientCodes[A_Index]).Range("F1").Value := "ActionDue"
	xl.Worksheets(clientCodes[A_Index]).Range("G1").Value := "Indicator"
	xl.Worksheets(clientCodes[A_Index]).Range("H1").Value := "DueDate"
	xl.Worksheets(clientCodes[A_Index]).Range("I1").Value := "DateTaken"
	xl.Worksheets(clientCodes[A_Index]).Range("J1").Value := "BaseDate"
	xl.Worksheets(clientCodes[A_Index]).Range("K1").Value := "ResponseDate"
	xl.Worksheets(clientCodes[A_Index]).Range("L1").Value := "UserID"
	xl.Worksheets(clientCodes[A_Index]).Range("M1").Value := "DateCreated"
	xl.Worksheets(clientCodes[A_Index]).Range("N1").Value := "LastUpdate"
	xl.Worksheets(clientCodes[A_Index]).Range("O1").Value := "TranInDate"
	xl.Worksheets(clientCodes[A_Index]).Range("P1").Value := "TranOutDate"
	xl.Worksheets(clientCodes[A_Index]).Range("Q1").Value := "..."
	GuiControl, , Edit3, % A_Index
	}
xl.Worksheets("Sheet1").Activate
return

CheckSplits:
xl := ComObjActive("Excel.Application")

Loop % GrabRow()
	{
	if (xl.Range("A" A_Index).text == "-")
		{
		rowSplits.Push(A_Index)
		clientCodes.Push(xl.Range("C" A_Index - 1).text)
		GuiControl, , Edit2, % clientCodes.Length()
		}
		
	else if (xl.Range("A" A_Index).text != "-" && A_Index > 1) 
		{
		copyRows.Push(A_Index)
		}

	else if (xl.Range("A" A_Index).text == " ")
		{
		break
		}			
	}
MsgBox, % clientCodes.Length()
return



NewSheet:
xl := ComObjActive("Excel.Application")
oSheet := xl.Worksheets.Add()		; add a new Sheet
oSheet.Name := "Data1"				; name new sheet to "Data1"
xl.Worksheets("Data1").Range("A2").Value := "Test 2"	
return

*/
