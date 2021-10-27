#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^-::
CoordMode, Pixel, Relative       ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
Gui, New, ,Copy to WorkSpace;
Gui, Add, Text, ,Enter WorkSpaces here, one WorkSpace per line.
Gui, Add, Button, x23 y180 w100 h25 gIP, Continue
Gui, Add, Button, x136 y180 w100 h25 gNVM, Nevermind!
Gui, Font, s12, Verdana
Gui, Add, Edit, x15 y23 h150 w225 +Center vRecords, %Records%
Gui, Show
return

IP:
Gui, Submit
StringSplit, Records, Records, `n , %A_Space% `n ; Omits periods. 
;Gui, 2: New, , Copy to WorkSpace
;Gui, 2: Add, Text, ,Just to confirm, here is what you typed:
;Gui, 2: Font, s12, Verdana
;Gui, 2: Add, Text, , %Records%
;Gui, 2: Font, , 
;Gui, 2: Add, Button, g2Alright, I'm Totes Ready
;Gui, 2: Add, Button, g2NVM, Wait... I changed my mind!
;Gui, 2: Show
gosub, TestGUI
return

NVM:
Gui, Destroy
MsgBox, Changed your mind? No worries.
return

;2Alright:
;Gui, Submit
;Msgbox, Cool! First, we need to open all of the WorkSpaces in iManage.
;StringSplit, Records, Records, `n, , 
;gosub, TestGUI
;return

;2NVM:
;Gui, Destroy
;Msgbox, OK, not a problem. Come back when you're ready.
;return

TestGUI:
Gui, 3: New, , Temp GUI
Gui, 3: Add, Picture, x10 y5, C:\Users\%A_Username%\Desktop\ImageSearch\1SearchWorkspaces.PNG
Gui, 3: Add, Button, x30 y5 h20 w130 gSearchWork, Search Workspaces
Gui, 3: Add, Picture, x10 y35, C:\Users\%A_Username%\Desktop\ImageSearch\2Name.PNG
Gui, 3: Add, Edit, x10 y48 h20 w150, 
Gui, 3: Add, Picture, x10 y85, C:\Users\%A_Username%\Desktop\ImageSearch\3Alias.PNG
Gui, 3: Add, Button, x30 y85 h20 w130 gClientCode, CLIENT.CODE
Gui, 3: Add, Picture, x10 y115, C:\Users\%A_Username%\Desktop\ImageSearch\4SavetoWorkspace.PNG
Gui, 3: Add, Edit, x90 y115 h20 w100, 
Gui, 3: Add, Picture, x10 y150 gHistory, C:\Users\%A_Username%\Desktop\ImageSearch\5Corres.PNG
;Gui, 3: Add, Button, x220 y150 h20 w130 gHistory, File History
Gui, 3: Add, Picture, x10 y185 gAddToFolder, C:\Users\%A_Username%\Desktop\ImageSearch\7AddToFolder.PNG
Gui, 3: Add, Button, x10 y215 gWSTest, Open WorkSpaces
Gui, 3: Add, Picture, x150 y215 gSelect, C:\Users\%A_Username%\Desktop\ImageSearch\6Select.PNG
Gui, 3: Show, 
return

AddToFolder:
MsgBox, You clicked Add to Folder!
return

ClientCode:
MsgBox, You clicked the Client Code!
return

SearchWork:
MsgBox, You clicked the Search WorkSpaces button!
return

History:
MsgBox, You clicked the File History button!
return

Select:
MsgBox, You clicked the Select button!
return

WSTest:
Gui, Submit, NoHide
MsgBox, Opening WorkSpaces... NOW!
gosub, Loop1
return

Loop1:
Loops = 1
Loop, %Records0%
{
gosub, Part1
Loops++
MsgBox, Keep going? If it didn't work, right-click the H icon in your taskbar and close this script.
}
MsgBox, Opened %Records0% WorkSpaces.
gosub, CopyToWorkspace
return

Part1:
Loop
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, *TransWhite C:\Users\%A_Username%\Desktop\ImageSearch\1SearchWorkspaces.PNG
	If ErrorLevel = 1
		msgbox, Unable to find Search Workspaces button.
	If ErrorLevel = 0
		break
}
msgbox, Search Workspaces button found at: %CoordsX%, %CoordsY%
CoordMode, Mouse, Relative      ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
PushX := CoordsX + 55
PushY := CoordsY + 8
MouseMove, %PushX%, %PushY%, 0 ; [, Speed, R]
SendInput {Click}
Sleep 800
;SendInput, This is a test.
;Sleep 200
gosub, Part2
return

Part2:
Loop
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, *TransWhite C:\Users\%A_Username%\Desktop\ImageSearch\2Name.PNG
	If ErrorLevel = 1
		msgbox, Unable to find Name: text.
	If ErrorLevel = 0
		break
}
msgbox, Name: text found at: %CoordsX%, %CoordsY%
CoordMode, Mouse, Relative      ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
PushX := CoordsX + 55
PushY := CoordsY + 25
MouseMove, %PushX%, %PushY%, 0 ; [, Speed, R]
SendInput {Click 2}
SendInput {Delete}
Sleep 200
SendInput, % Records%Loops%
Sleep 200
SendInput {Enter}
gosub, Part3
return
		
Part3:
Loop
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, *TransWhite C:\Users\%A_Username%\Desktop\ImageSearch\3Alias.PNG
	If ErrorLevel = 1
		msgbox, Unable to find red folder below Alias.
	If ErrorLevel = 0
		break
}
msgbox, Red folder below Alias found at: %CoordsX%, %CoordsY%
CoordMode, Mouse, Relative      ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
PushX := CoordsX + 55
PushY := CoordsY + 60
MouseMove, %PushX%, %PushY%, 0 ; [, Speed, R]
SendInput {Click 2}
Sleep 500
;SendInput, This is a test.
;Sleep 200
return

^j::
CopytoWorkspace:
Gui, 4: New, , Copy to WorkSpaces
Gui, 4: Add, Text, ,Alright!`n`nIf everything worked, all of the WorkSpaces should be opened in iManage.`n`nNow, select the items you'd like to save to every WorkSpace.`n`nThis assumes you saved the items to the first WorkSpace in the list.`n`nWhen you're ready to start copying, click OK.
Gui, 4: Add, Button, gCopy, OK, let's do it.
Gui, 4: Add, Button, gNVM3, Cancel
Gui, 4: Show
return

Copy:
Gui, Submit
Msgbox, Here we go!
gosub, Loop2
return

NVM3:
Gui, Destroy
Msgbox, Cold feet, eh? No worries.
return

Loop2:
Loops2 = 2
RecordsNew := Records0 - 1
Loop, %RecordsNew%
{
gosub, Part3.5
Loops2++
MsgBox, Keep going? If it didn't work, right-click the H icon in your taskbar and close this script.
}
MsgBox, Copied documents to %RecordsNew% WorkSpaces.
return

Part3.5:      ; files to copy should already be selected at this point
Loop
{
SendInput {AppsKey}
Sleep 500
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, *TransWhite C:\Users\%A_Username%\Desktop\ImageSearch\7AddToFolder.PNG
	If ErrorLevel = 1
		msgbox, Unable to find Add To Folder option.
	If ErrorLevel = 0
		break
}
;msgbox, Add To Folder option found at: %CoordsX%, %CoordsY%
CoordMode, Mouse, Relative      ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
PushX := CoordsX + 55
PushY := CoordsY + 8
MouseMove, %PushX%, %PushY%, 0 ; [, Speed, R]
SendInput {Click}
Sleep 500
gosub, Part4
return

Part4:
Loop
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, *TransWhite C:\Users\%A_Username%\Desktop\ImageSearch\4SaveToWorkspace.PNG
	If ErrorLevel = 1
		msgbox, Unable to find Workspace button with down arrow.
	If ErrorLevel = 0
		break
}
msgbox, Workspace button with down arrow found at: %CoordsX%, %CoordsY%
CoordMode, Mouse, Relative      ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
PushX := CoordsX + 100
PushY := CoordsY + 8
MouseMove, %PushX%, %PushY%, 0 ; [, Speed, R]
SendInput {Click}
Sleep 200
SendInput, % Records%Loops2%
Sleep 200
SendInput {Enter}
Sleep 200
gosub, Part5
return

Part5:
Loop
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, *TransWhite C:\Users\%A_Username%\Desktop\ImageSearch\3Alias.PNG
	If ErrorLevel = 1
		msgbox, Unable to find red folder below Alias.
	If ErrorLevel = 0
		break
}
msgbox, Red folder below Alias found at: %CoordsX%, %CoordsY%
CoordMode, Mouse, Relative      ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
PushX := CoordsX + 55
PushY := CoordsY + 24
MouseMove, %PushX%, %PushY%, 0 ; [, Speed, R]
SendInput {Click 2}
;Sleep 200
;SendInput, This is a test.
;Sleep 200
gosub, Part6
return

Part6:
MouseMove, 100, 100, 0 ; [, Speed, R]
Sleep 500
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, *TransWhite C:\Users\%A_Username%\Desktop\ImageSearch\5Scanned.PNG
Loop
{
	If ErrorLevel = 1
		{
		MsgBox,Wasn't a patent. Let's check for TM. 
		ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, *TransWhite C:\Users\%A_Username%\Desktop\ImageSearch\5Corres.PNG
		MsgBox, %CoordsX%, %CoordsY%
		}
	If ErrorLevel = 0
		break
}
	If ErrorLevel = 0
		{
		msgbox, Corres or Scanned File History folder found at: %CoordsX%, %CoordsY%
		CoordMode, Mouse, Relative      ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
		PushX := CoordsX + 100
		PushY := CoordsY + 8
		MouseMove, %PushX%, %PushY%, 0 ; [, Speed, R]
		SendInput {Click 2}
		;Sleep 200
		;SendInput, This is a test.
		;Sleep 200
		gosub, Part7
		}
	else
		Msgbox, Correct folder not found. WorkSpace missing correct folder? Manually select correct folder.
return

Part7:
Loop
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, *TransWhite C:\Users\%A_Username%\Desktop\ImageSearch\6Select.PNG
	If ErrorLevel = 1
		msgbox, Couldn't locate Select button.
	If ErrorLevel = 0
		break
}
msgbox, Select Button found at: %CoordsX%, %CoordsY%
CoordMode, Mouse, Relative      ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
PushX := CoordsX + 55
PushY := CoordsY + 8
MouseMove, %PushX%, %PushY%, 0 ; [, Speed, R]
SendInput {Click}
;Sleep 200
;SendInput, This is a test.
;Sleep 200
;gosub, Part8
return

Part8:
return

^l::
CoordMode, Mouse, Relative      ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, C:\Users\%A_Username%\Desktop\ImageSearch\5Scanned.PNG
MsgBox, %CoordsX%, %CoordsY%
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, C:\Users\%A_Username%\Desktop\ImageSearch\5Corres.PNG
MsgBox, %CoordsX%, %CoordsY%
return



^2::
CoordMode, Pixel, Relative       ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)
DetectHiddenText, Off
WinGetText, OutputVar , A
msgbox, %OutputVar%
return
