#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

formattime, Today, ,yyyy-MM-dd

Gui, New, , Prepend/Append
;Gui, Add, Button, gHQ,1_ HQ_Photo - OldFilename - HQ
;Gui, Add, Button, gLQ,2_ LQ_Photo - OldFilename - LQ
;Gui, Add, Button, gCrap,3_ Crap_Photo - OldFilename - Crap
Gui, Add, Text, Center x10  y13 w120, Date to Prepend:
Gui, Add, Edit, Center x130 y10 w120 vFront,  %Today%
Gui, Add, Text, Center x10  y43 w120, Client Code to Append:
Gui, Add, Edit, Center x130 y40 w120 vBackEnd , CLIENT.CODE
Gui, Add, Text, Center x10  y73 w120, Number of Files:
Gui, Add, Edit, Center x130 y70 w120 ReadOnly vNumberOfFiles, 0
Gui, Add, Button, Center x10 w240 gAppend, Prepend/Append Information to Filenames
Gui, Add, Edit, x10 ReadOnly vLoadedFiles w240 h165,

Gui, Show, w260 h300
return

GuiContextMenu:
MsgBox, This is a test.
return

GuiDropFiles:
LoadedFiles := 
GuiControl, , Edit4,
GuiControl, , Edit3, 0
GuiControl, , Button1, Prepend/Append Information to Filenames
Loop, parse, A_GuiEvent, `n
{
	;MsgBox, %A_LoopField%
    ;MsgBox, 4,, File number %A_Index% is:`n%A_LoopField%.`n`nContinue?
    ;IfMsgBox, No, Break
	FileName%A_Index% = %A_LoopField%
	;MsgBox, % FileName%A_Index%
	LoadedFiles := FileName%A_Index%  "`n" LoadedFiles
	GuiControl, , Edit4, %LoadedFiles%
	;GuiControl, , Static%A_Index%, % FileName%A_Index%
	GuiControl, MoveDraw, Static1
	TotalFiles = %A_Index%
	GuiControl, , Edit3, %TotalFiles%
}
;GuiControl, , Static1, %FileName1%`n%FileName2%1n%FileName3%
FileNameX = %A_GuiEvent%
return
/*

HQ:
StringSplit, FileNameX, FileNameX , \,
StringSplit, FileFormat, FileNameX%FileNameX0% , .,
FileCopy, %FileNameX%, % "C:\Users\" A_Username "\Desktop\Test\1_HQ_Photo - " FileFormat1 " -HQ." FileFormat2
return

LQ:
StringSplit, FileNameX, FileNameX , \,
StringSplit, FileFormat, FileNameX%FileNameX0% , .,
FileCopy, %FileNameX%, % "C:\Users\" A_Username "\Desktop\Test\2_LQ_Photo - " FileFormat1 " -LQ." FileFormat2
return

Crap:
StringSplit, FileNameX, FileNameX , \,
StringSplit, FileFormat, FileNameX%FileNameX0% , .,
FileCopy, %FileNameX%, % "C:\Users\" A_Username "\Desktop\Test\3_Crap_Photo - " FileFormat1 " -Crap." FileFormat2
return

*/

Append:
GuiControlGet, Button1Status, , Button1
GuiControlGet, Edit3Status, , Edit3
;MsgBox, %Button1Status%`n`n%Edit3Status%
	if Button1Status = More files to update? Drag them into the window!
		{
		LoadedFiles := 
		GuiControl, , Edit4,
		GuiControl, , Edit3, 0
		GuiControl, , Button1, Prepend/Append Information to Filenames
		return
		}
	if Edit3Status = 0
		{
		MsgBox, ,No files selected!, You didn't select any files to update.`n`nDrag any files that need the date and Client Code added directly into the Prepend/Append window.`n`nYou can then try again.
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
FileCopy, %CopiedFiled% , % "C:\Users\" A_Username "\Desktop\Appended Files\" Front " - " FileFormat1 " - " BackEnd "." FileFormat2
}
MsgBox, 4, Filenames have been updated!, Filenames have been updated!`n`nUpdated files can be found in the Appended Files folder on your Desktop.`n`nYour original files are still wherever they were.`n`nIf you can see the appended files, then you can delete the originals.`n`nClick YES if you want to recycle the old files.`n`nYou'll be able to recover them from the Recycle Bin if you still need them.
	ifMsgBox Yes
		{
		FileRecycle, %FileName1%
		}
GuiControl, , Button1 , More files to update? Drag them into the window!		
return




#3::
Gui Add, Edit, w930 r1 vURL, https://autohotkey.com/boards/
Gui Add, Button, x+6 yp w44 Default, Go
Gui Add, ActiveX, xm w1280 h720 vWB, Shell.Explorer
ComObjConnect(WB, WB_events)  ; Connect WB's events to the WB_events class object.
Gui Show
; Continue on to load the initial page:
ButtonGo:
Gui Submit, NoHide
WB.Navigate(URL)
return

class WB_events
{
    NavigateComplete2(wb, NewURL)
    {
        GuiControl,, URL, %NewURL%  ; Update the URL edit control.
    }
}

GuiClose:
ExitApp

return
