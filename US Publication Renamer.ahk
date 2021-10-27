; Created with AutoHotkey by Tyler Dickson. 

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

formattime, Today, , MMddyy          ; yyyy-MM-dd
Gui, New, , Prepend/Append
Gui, Add, Edit, Center x20 y25 w130		  vFront,  							%Today%
Gui, Add, Edit, Center x170 y25 w130 ReadOnly vNumberOfFiles, 				0
Gui, Font, s11 
Gui, Add, Edit, Center x320 y55 w150 h400    vBackEnd gBackEnd, 			
Gui, Font
Gui, Add, Edit, Center x330 y25 w130 ReadOnly vNumberOfCodes ,				0
Gui, Font, s11 
Gui, Add, Edit, Center x480 y55 w150 h400    vPubNumbers gPubNumbers, 		
Gui, Font
Gui, Add, Edit, Center x490 y25 w130 ReadOnly vNumberOfPubs , 				0
Gui, Add, Text, Center x20  y5 w130, Date to Prepend:
Gui, Add, Text, Center x170 y5 w130, Number of Files:
Gui, Add, Text, Center x330 y5 w130, Application Numbers:
Gui, Add, Text, Center x490 y5 w130, Publication Numbers:
Gui, Add, ListView, x10 y55 Right Grid -Hdr vLoadedFiles w300 h400, Filenames||
Gui, Add, Button, Center x10 y460 w210 gAppend, Update Information on Filenames
Gui, Add, Button, Center x230 y460 w80 gClearList, Clear Files
Gui, Add, Button, Center x320 y460 w150 gClearApps, Clear Application Numbers
Gui, Add, Button, Center x480 y460 w150 gClearPubs, Clear Publication Numbers
Gui, Show, w640 h495
gosub BackEnd
gosub PubNumbers
return

ClearApps:
GuiControl, , Edit3, 
GuiControl, , Edit4, 0
return

ClearPubs:
GuiControl, , Edit5, 
GuiControl, , Edit6, 0
return

PubNumbers:
GuiControlGet, Edit5Status, , Edit5
;MsgBox, %Edit2Status%
StringSplit, Edit5Status, Edit5Status, `n, 
GuiControl, , Edit6, %Edit5Status0%
return

BackEnd:
GuiControlGet, Edit3Status, , Edit3
;MsgBox, %Edit2Status%
StringSplit, Edit3Status, Edit3Status, `n, 
GuiControl, , Edit4, %Edit3Status0%
return

ClearList:
LV_Delete()
GuiControl, , Edit2, 0
return

GuiContextMenu:
MsgBox, This is a test.
return

GuiDropFiles:
LV_Delete()
;LoadedFiles := 
GuiControl, , Edit2, 0
GuiControl, , Button1, Update Information on Filenames
Loop, parse, A_GuiEvent, `n
{
	FileName%A_Index% = %A_LoopField%
	;LoadedFiles := FileName%A_Index%  "`n" LoadedFiles
	LV_Add("", FileName%A_Index%)
	GuiControl, MoveDraw, Static1
	TotalFiles = %A_Index%
	GuiControl, , Edit2, %TotalFiles%
}
FileNameX = %A_GuiEvent%
return

Append:
Gui, Submit, NoHide
StringSplit, BackEnd, BackEnd, `n, , 
GuiControlGet, Button1Status, , Button1
GuiControlGet, Edit2Status, , Edit2
GuiControlGet, Edit4Status, , Edit4
;MsgBox, % Edit2Status " | " Edit4Status
	if Button1Status = Have more? Drag them into the window!
		{
		LoadedFiles := 
		LV_Delete()
		GuiControl, , Edit2, 0
		GuiControl, , Button1, Update Information on Filenames
		return
		}
	if Edit2Status = 0
		{
		MsgBox, ,No files selected!, You didn't select any files to update.`n`nDrag any files that need the date and Client Code added directly into the Prepend/Append window.`n`nYou can then try again.
		return
		}
		
	if (Edit2Status != Edit4Status)
		{
		MsgBox, , Number of files doesn't match Application Numbers!, The number of files you dragged in doesn't match the number of Application Numbers you've added!`n`nThat means each file won't get an appended Application Number!`n`nYou should double-check your numbers and try again.
		return
		}
	else
	Gui, Submit, NoHide
	IfNotExist, C:\Users\%A_Username%\Desktop\Appended Files
		FileCreateDir, C:\Users\%A_Username%\Desktop\Appended Files
Sleep 1000
Loop %TotalFiles%
{

CopiedFiled := FileName%A_Index%
StringSplit, CopiedFiled, CopiedFiled , \,
StringSplit, FileFormat, CopiedFiled%CopiedFiled0% , .,
FileCopy, %CopiedFiled% , % "C:\Users\" A_Username "\Desktop\Appended Files\" Front " " "UPUB" "-" BackEnd%A_Index% "." FileFormat2
}
MsgBox, 4, Filenames have been updated!, Filenames have been updated!`n`nUpdated files can be found in the Appended Files folder on your Desktop.`n`nYour original files are still wherever they were.`n`nIf you can see the appended files, then you can delete the originals.`n`nClick YES if you want to recycle the old files.`n`nYou'll be able to recover them from the Recycle Bin if you still need them.
	ifMsgBox Yes
		{
		FileRecycle, %FileName1%
		}
GuiControl, , Button1 , Have more? Drag them into the window!		
return

GuiClose:
ExitApp
return
