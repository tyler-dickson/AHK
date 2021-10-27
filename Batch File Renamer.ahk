; Created with AutoHotkey by Tyler Dickson. 

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, Shell32.dll, 20

global Result := ""

Gui, Main: New, , Batch File Renamer

Gui, Main: Add, Edit, Center x2020 y25 w130		  vFront,  							%RightNow%
Gui, Main: Font, 
Gui, Main: Add, Edit, Center x40 y25 w130 ReadOnly vNumberOfFiles, 				0
Gui, Main: Font, s11 
Gui, Main: Add, Edit, Center x380 y55 w650 h400    vBackEnd gBackEnd, 			
Gui, Main: Font
Gui, Main: Add, Edit, Center x639 y25 w130 ReadOnly vNumberOfCodes ,				0
Gui, Main: Font, s11 
Gui, Main: Add, Edit, Center x1040 y55 w150 h400    vPubNumbers gPubNumbers, 		
Gui, Main: Font,
Gui, Main: Add, Edit, Center x1050 y25 w130 ReadOnly vNumberOfPubs , 				0
Gui, Main: Font, s11 bold
Gui, Main: Add, Text, Center x2020  y5 w130, Date to Prepend:
Gui, Main: Add, Text, Center x40 y5 w130, Number of Files:
Gui, Main: Add, Text, Center x639 y5 w130, New Filenames:
Gui, Main: Add, Text, Center x1050 y5 w130, > Add to END ->
Gui, Main: Add, Text, Center x230 y5 w130, <- Add to FRONT <
Gui, Main: Font,
;Gui, Main: Add, ListView, x-290 y55 w500 h400 Right Grid   vLoadedFiles , Filenames  ;-Hdr
Gui, Main: Add, ListView, x5 y55 w205 h400 Right Grid  -Hdr +Report vLoadedFiles , Filenames||  ;-Hdr
Gui, Main: Font, s14 bold 
Gui, Main: Add, Button, Center x435 y460 w592 h35 vAppend gAppend, Drag in some files to rename!
Gui, Main: Add, Button, Center x385 y460 w45 h35 gClearList, X
;Gui, Add, Button, Center x380 y25 w50 gClearApps, X
;Gui, Add, Button, Center x1040 y25 w50 gClearPubs, X
;Gui, Add, Button, Center x220 y25 w50 gClearOldRefs, X
Gui, Main: Font,
Gui, Main: Font, s11
Gui, Main: Add, Edit, Center x220 y55 w150 h400 vOldReferences gOldReferences   , 
Gui, Main: Font, 
Gui, Main: Add, Edit, Center x230 y25 w130 ReadOnly vOldClientCode  , 				0
Gui, Main: Font, 

Gui, Main: Font, s11
Gui, Main: Add, Button, Center x5 y460 w200 h30 gExportFileNames, Export Filenames
Gui, Main: Add, Button, Center x5 y495 w200 h30 gExportFileNames, Export Filenames w/o Extension
Gui, Main: Font,


;Gui, Main: Add, Button, Center x16 y24 w23 h23 gChangeWidth, <<
;Gui, Main: Add, Button, Center x170 y24 w23 h23 gChangeWidth, >>

Gui, Main: Show, w1195 h530

gosub BackEnd
gosub PubNumbers
gosub OldReferences
return


ClearList:
ClearApps:
ClearOldRefs:
ClearPubs:
GuiControl, Main: , Edit3, 
GuiControl, Main: , Edit4, 0
GuiControl, Main: , Edit5, 
GuiControl, Main: , Edit6, 0
GuiControl, Main: , Edit7, 
GuiControl, Main: , Edit8, 0
LV_Delete()
GuiControl, Main: , Edit2, 0
GuiControl, Main: , Button1, Drag in some files to rename!
return

PubNumbers:
GuiControlGet, Edit5Status, , Edit5
StringSplit, Edit5Status, Edit5Status, `n, 
GuiControl, Main: , Edit6, %Edit5Status0%
return

OldReferences:
GuiControlGet, Edit7Status, , Edit7
StringSplit, Edit7Status, Edit7Status, `n, 
GuiControl, Main: , Edit8, %Edit7Status0%
return

BackEnd:
GuiControlGet, Edit3Status, , Edit3
StringSplit, Edit3Status, Edit3Status, `n, 
GuiControl, Main: , Edit4, %Edit3Status0%
return

ExportFileNames:
Gui, Submit, NoHide
StringSplit, BackEnd, BackEnd, `n, , 
GuiControlGet, Edit2Status, , Edit2

NewFile := ""
Loop %Edit2Status%
		{
		StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, :, _, A
		StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, /, _ , A
		StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, \, _ , A
		StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, *, _ , A
		StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, ?, _ , A
		StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, ", _ , A	   ; "
		StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, <, _ , A
		StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, >, _ , A		
		StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, |, _ , A
		
		CopiedFiled := FileName%A_Index%
		SplitPath, CopiedFiled, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
		
		IfInString, A_GuiControl, Extension
			NewText := OutNameNoExt
		else
			NewText := OutFileName
			
		if (NewFile != "")
			NewFile := NewFile "`r`n" NewText
		else
			NewFile := NewText
		}

Clipboard := NewFile	
MsgBox, 0, List of Doc #s save to Clipboard., Go ahead and paste into Excel to find the missing documents.

return



CheckWhatToDo(Files, Names, Fronts, Backs)
{
if ((Names == 0) && (Fronts == 0) && (Backs == 0))
	Result := "000"
else if ((Names != 0) && (Fronts != 0) && (Backs != 0))
	{
	if ((Files == Names) && (Files == Fronts) && (Files == Backs))
		Result := "111"
	else
		Result := "111 MISMATCH"
	}
else if ((Names != 0) && (Fronts != 0) && (Backs == 0))	
	{
	if ((Files == Names) && (Files == Fronts))
		Result := "110"
	else
		Result := "110 MISMATCH"
	}
else if ((Names != 0) && (Fronts == 0) && (Backs != 0))	
	{
	if ((Files == Names) && (Files == Backs))
		Result := "101"
	else
		Result := "101 MISMATCH"
	}
else if ((Names == 0) && (Fronts != 0) && (Backs != 0))	
	{
	if ((Files == Fronts) && (Files == Backs))
		Result := "011"
	else
		Result := "011 MISMATCH"
	}
else if ((Names != 0) && (Fronts == 0) && (Backs == 0))	
	{
	if (Files == Names)
		Result := "100"
	else
		Result := "100 MISMATCH"
	}
else if ((Names == 0) && (Fronts != 0) && (Backs == 0))	
	{
	if (Files == Fronts)
		Result := "010"
	else
		Result := "010 MISMATCH"
	}
else if ((Names == 0) && (Fronts == 0) && (Backs != 0))	
	{
	if (Files == Backs)
		Result := "001"
	else
		Result := "001 MISMATCH"
	}
}

;GuiContextMenu:
;MsgBox, This is a test.
;return

MainGuiDropFiles:
LV_Delete()
;LoadedFiles := 
GuiControl, Main:, Edit2, 0
GuiControl, Main:, Button1, Click to rename files.
Loop, parse, A_GuiEvent, `n
{
	FileName%A_Index% = %A_LoopField%
	;LoadedFiles := FileName%A_Index%  "`n" LoadedFiles
	LV_Add("", FileName%A_Index%)
	LV_ModifyCol(, Auto)
	LV_ModifyCol(, Right)
	TotalFiles = %A_Index%
	GuiControl, , Edit2, %TotalFiles%
}
FileNameX = %A_GuiEvent%
return

Append:
formattime, RightNow, , hh.mm.ss          ; yyyy-MM-dd
Gui, Main: Submit, NoHide

StringSplit, BackEnd, BackEnd, `n, ,         ; This is Filenames
StringSplit, ClientCode, PubNumbers, `n, ,   ; this is Add to End
StringSplit, PriorRef, OldReferences, `n, ,  ; this is Add to Front
GuiControlGet, Button1Status, , Button1
GuiControlGet, Edit2Status, , Edit2  		 ; Number of Files:
GuiControlGet, Edit4Status, , Edit4  		 ; Filenames
GuiControlGet, Edit8Status, , Edit8  		 ; Add to Front
GuiControlGet, Edit6Status, , Edit6  		 ; Add to Back

	if Button1Status = Have more? Drag them into the window!
		{
		LoadedFiles := 
		; LV_Delete()
		;GuiControl, Main: , Edit2, 0
		GuiControl, Main: , Button1, Click to Rename Files
		return
		}
	else if Edit2Status = 0
		{
		Gui, Main: Font, s11 bold 
		GuiControl, Main: Font, Button1	
		GuiControl, Main: , Button1, % "You didn't select any files to rename! Drag some in and try again."
		Loop 10
		{
			Gui Flash
			Sleep 500  ; It's quite sensitive to this value; altering it may change the behavior in unexpected ways.
		}
		Gui, Main: Font, s14 bold 
		GuiControl, Main: Font, Button1		
		GuiControl, Main: , Button1, Drag in some files to rename!
		return
		}
	else
		{	
		
		IfNotExist, C:\Users\%A_Username%\Desktop\Renamed Files
			FileCreateDir, C:\Users\%A_Username%\Desktop\Renamed Files
		Sleep 1000

		;;;;;;; FIGURE OUT WHAT WE'RE DOING!!!
		
		
		; If not changing filenames, not adding to front, not adding to end.

		CheckWhatToDo(Edit2Status, Edit4Status, Edit8Status, Edit6Status)

		UpdatedItems := "#,Original,Updated,Front,Filename,End"		
		GuiControl, Main:, Button1, 0 / %Edit2Status% 	
		Gui, Main: Add, Progress, x435 y497 w597 h30 cBlue BackgroundWhite vProgressBar Range0-%Edit2Status%, 0
		Gui, Main: Show, w1200 h530
		
		Loop %Edit2Status%  ; Loops as many times as files dragged in.
		{
		NewFile := ""
		FrontPart := "C:\Users\" A_Username "\Desktop\Renamed Files\"
		CopiedFiled := FileName%A_Index%
		SplitPath, CopiedFiled, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive	
		
		ifinstring, Result, MISMATCH
			{
			Gui, Main: Font, s12 bold 
			GuiControl, Main: Font, Button1	
			GuiControl, Main: , Button1, % "Number mismatch! Check your numbers to make sure they match!"
			Loop 10
			{
				Gui Flash
				Sleep 500  ; It's quite sensitive to this value; altering it may change the behavior in unexpected ways.
			}
			Gui, Main: Font, s14 bold 
			GuiControl, Main: Font, Button1		
			GuiControl, Main: , Button1, Click to rename files.
			return
			}
			
		if (Result = 000)
			{
			Gui, Main: Font, s11 bold 
			GuiControl, Main: Font, Button1	
			GuiControl, Main: , Button1, % "No updates requested. Add some parameters and try again."
			Loop 10
			{
				Gui Flash
				Sleep 500  ; It's quite sensitive to this value; altering it may change the behavior in unexpected ways.
			}
			Gui, Main: Font, s14 bold 
			GuiControl, Main: Font, Button1		
			GuiControl, Main: , Button1, Drag in some files to rename!
			return
			}
	
		GuiControl, Main:  Show, msctls_progress321
		
		if (Result = 001)	
			{
			IfNotExist, % NewFile
				NewFile := FrontPart OutNameNoExt " - " ClientCode%A_Index% "." OutExtension				
			else
				NewFile := FrontPart OutNameNoExt " - " ClientCode%A_Index% " - " A_Index "." OutExtension				
			}

		if (Result = 010)	
			{
			IfNotExist, % NewFile
				NewFile := FrontPart PriorRef%A_Index% " - " OutNameNoExt "." OutExtension				
			else
				NewFile := FrontPart PriorRef%A_Index% " - " OutNameNoExt " - " A_Index "." OutExtension				
			}			

		if (Result = 011)	
			{
			IfNotExist, % NewFile
				NewFile := FrontPart PriorRef%A_Index% " - " OutNameNoExt " - " ClientCode%A_Index% "." OutExtension				
			else
				NewFile := FrontPart PriorRef%A_Index% " - " OutNameNoExt " - " ClientCode%A_Index% " - " A_Index "." OutExtension				
			}	
		
		if (Result = 100)	
			{
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, :, _, A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, /, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, \, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, *, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, ?, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, ", _ , A	   ; "
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, <, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, >, _ , A		
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, |, _ , A
			
			IfNotExist, % NewFile
				NewFile := FrontPart BackEnd%A_Index% "." OutExtension				
			else
				NewFile := FrontPart BackEnd%A_Index% " - " A_Index "." OutExtension				
			}	
			
		if (Result = 101)	
			{
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, :, _, A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, /, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, \, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, *, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, ?, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, ", _ , A	   ; "
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, <, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, >, _ , A		
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, |, _ , A
			
			IfNotExist, % NewFile
				NewFile := FrontPart BackEnd%A_Index% " - " ClientCode%A_Index% "." OutExtension				
			else
				NewFile := FrontPart BackEnd%A_Index% " - " ClientCode%A_Index% " - " A_Index "." OutExtension				
			}	

		if (Result = 110)	
			{
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, :, _, A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, /, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, \, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, *, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, ?, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, ", _ , A	   ; "
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, <, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, >, _ , A		
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, |, _ , A
			
			IfNotExist, % NewFile
				NewFile := FrontPart PriorRef%A_Index% " - " BackEnd%A_Index% "." OutExtension				
			else
				NewFile := FrontPart PriorRef%A_Index% " - " BackEnd%A_Index% " - " A_Index "." OutExtension				
			}			
			
		if (Result = 111)	
			{
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, :, _, A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, /, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, \, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, *, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, ?, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, ", _ , A	   ; "
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, <, _ , A
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, >, _ , A		
			StringReplace, BackEnd%A_Index%, BackEnd%A_Index%, |, _ , A
			
			IfNotExist, % NewFile
				NewFile := FrontPart PriorRef%A_Index% " - " BackEnd%A_Index% " - " ClientCode%A_Index% "." OutExtension				
			else
				NewFile := FrontPart PriorRef%A_Index% " - " BackEnd%A_Index% " - " ClientCode%A_Index% " - " A_Index "." OutExtension				
			}	
		FileCopy, %CopiedFiled% , % NewFile
		
		SplitPath, CopiedFiled, COutFileName
		SplitPath, NewFile, NOutFileName
		
		UpdatedItems := UpdatedItems "`r`n" A_Index "," COutFileName "," NOutFileName "," PriorRef%A_Index% "," BackEnd%A_Index% "," ClientCode%A_Index%

		GuiControl, Main: , ProgressBar, %A_Index%
		GuiControl, Main:, Button1, %A_Index% / %Edit2Status%
		}
		
		Gui, Main: Font, s10 bold 
		GuiControl, Main: Font, Button1	
		GuiControl, Main: , Button1, We're done! Look for the Renamed Files folder on your desktop.`nThe original files are untouched.
		Loop 10
		{
			Gui Flash
			Sleep 500  ; It's quite sensitive to this value; altering it may change the behavior in unexpected ways.
		}
		Gui, Main: Font, s14 bold 
		GuiControl, Main: Font, Button1		
		GuiControl, Main: , Button1, Have more? Drag them into the window!
		GuiControl, Main: , ProgressBar, %A_Index%
		GuiControl, Main:  Hide, msctls_progress321
		
		FileAppend, %UpdatedItems%, % "C:\Users\" A_Username "\Desktop\Renamed Files\Updated Items (" Edit2Status ") - " RightNow ".csv"
		;MsgBox, 4, Filenames have been updated!, Filenames have been updated!`n`nUpdated files can be found in the Appended Files folder on your Desktop.`n`nYour original files are still wherever they were.`n`nIf you can see the appended files, then you can delete the originals.`n`nClick YES if you want to recycle the old files.`n`nYou'll be able to recover them from the Recycle Bin if you still need them.
		
		;	ifMsgBox Yes
		;		{
		;		FileRecycle, %FileName1%
		;		}
	
		Loop %Edit2Status%
		{
		PriorRef%A_Index% := ""
		BackEnd%A_Index% := ""
		ClientCode%A_Index% := ""
		}
	}
return

MainGuiClose:
ExitApp
return
