#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^k::
SavingToggle = 0
FailureToggle = 0
Gui, 2:New, ,Tester Window
Gui, 2:Add, Button, gHideSaving, Hide Saving
Gui, 2:Add, Button, gHideFailure, Hide Failure
Gui, 3:New
Gui, 4:New
Gui, 2:Add, Picture, x108 y93 w93 h19 , C:\Users\%A_Username%\Desktop\ImageSearch\ClientCode.PNG
Gui, 2:Add, Picture, x94 y237 w107 h23 , C:\Users\%A_Username%\Desktop\ImageSearch\ActionType.PNG
Gui, 2:Add, Edit, x204 y92 w143 h21 , TESTER.123WO
Gui, 2:Add, Picture, x792 y90 w70 h20 gButCopy, C:\Users\%A_Username%\Desktop\ImageSearch\Copy.png
Gui, 2:Add, Picture, x711 y89 w70 h20 gButEdit, C:\Users\%A_Username%\Desktop\ImageSearch\Edit.png
Gui, 2:Add, Picture, x626 y90 w70 h20 gButSave, C:\Users\%A_Username%\Desktop\ImageSearch\Save.PNG
Gui, 3:Add, Picture,  , C:\Users\%A_Username%\Desktop\ImageSearch\SavingRecord.png
Gui, 4:Add, Picture,  , C:\Users\%A_Username%\Desktop\ImageSearch\UnableToCopy.png
Gui, 2:Add, Edit, x201 y238 w143 h21 , INT-PAT STATUS CHECK
; Generated using SmartGUI Creator 4.0
Gui, 2:Show, x257 y345 h319 w939, Tester Window
Return

HideSaving:
	if SavingToggle = 0
		{
		Gui, 3:Show, w300 h200
		SavingToggle = 1
		return
		}
	if SavingToggle = 1
		{
		Gui, 3:Hide
		SavingToggle = 0
		return
		}
return

HideFailure:
	if FailureToggle = 0
		{
		Gui, 4:Show, w300 h200
		FailureToggle = 1
		return
		}
	if FailureToggle = 1
		{
		Gui, 4:Hide
		FailureToggle = 0
		return
		}
return

ButCopy:
MsgBox, You clicked the Copy button!
return

ButEdit:
MsgBox, You clicked the Edit button!
return

ButSave:
MsgBox, You clicked the Save button!
return

GuiClose:
ExitApp

^j::
global RecordLoops = 1
CoordMode, Pixel, Relative       ; Place mouse coordinates at absolute Relative coordinates (multiple monitor)

Gui, New, ,Docket Actions
Gui, Add, Text, ,Enter records here, one record per line.
Gui, Add, Button, x23 y180 w100 h25 gDocketAction, Continue
Gui, Add, Button, x136 y180 w100 h25 gWaitNvm, Nevermind!
Gui, Font, s12, Verdana
Gui, Add, Edit, x15 y23 h150 w225 +Center vMatters, %Records%
Gui, Show
return

WaitNvm:
Gui, Destroy
return

DocketAction:
Gui, Submit
StringSplit, Matters, Matters, `n , %A_Space% `n ; Omits periods. 
Sleep 200
MsgBox, %Matters0%, %Matters1% %Matters2% %Matters3%
Loop %Matters0%
{
CopyAction()
RecordLoops++
}
MsgBox, Copied action to records.`n`nUse the arrows at the bottom left of the window to confirm.
return

CopyAction()
{
Loop 10
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, C:\Users\%A_Username%\Desktop\ImageSearch\ActionType.PNG
	If ErrorLevel = 1
		{
		msgbox, Unable to find Action Type:.
		Sleep 500
		}
	If ErrorLevel = 0
	{
	MsgBox, I see Action Type: at %CoordsX%, %CoordsY%.
	ActionTypeCoordsX := CoordsX + 120
	ActionTypeCoordsY := CoordsY + 10
	MsgBox, Box next to Action Type: at %ActionTypeCoordsX%, %ActionTypeCoordsY%.
	MouseMove, %ActionTypeCoordsX%, %ActionTypeCoordsY%, 0 ; [, Speed, R]
	break
	}	
	If (A_Index = 10)
	{
	MsgBox, Unable to find Action Type:. Giving up...
	return
	}
}
Loop 10
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, C:\Users\%A_Username%\Desktop\ImageSearch\ClientCode.PNG
	If ErrorLevel = 1
		{
		msgbox, Unable to find Client Code:.
		Sleep 500
		}
	If ErrorLevel = 0
	{
	MsgBox, I see Client Code: at %CoordsX%, %CoordsY%.
	ClientCodeCoordsX := CoordsX + 100
	ClientCodeCoordsY := CoordsY + 9
	MsgBox, Box next to Client Code: at %ClientCodeCoordsX%, %ClientCodeCoordsY%.
	MouseMove, %ClientCodeCoordsX%, %ClientCodeCoordsY%, 0 ; [, Speed, R]
	SendInput {Click 2}
	Sleep 200
	SendInput % Matters%RecordLoops%
	break
	}
	If (A_Index = 10)
	{
	MsgBox, Unable to find Client Code:. Giving up...
	return
	}
}
Loop 10
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, C:\Users\%A_Username%\Desktop\ImageSearch\Edit.PNG
	If ErrorLevel = 1
		{
		msgbox, Unable to find the Edit button.
		Sleep 500
		}
	If ErrorLevel = 0
	{
	MsgBox, I see the Edit button at %CoordsX%, %CoordsY%.
	EditCoordsX := CoordsX + 37
	EditCoordsY := CoordsY + 10
	MsgBox, Click the Edit button at %EditCoordsX%, %EditCoordsY%.
	MouseMove, %EditCoordsX%, %EditCoordsY%, 0 ; [, Speed, R]
	break
	}
	If (A_Index = 10)
	{
	MsgBox, Unable to find the Edit button. Giving up...
	return
	}
}
Loop 10
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, C:\Users\%A_Username%\Desktop\ImageSearch\Copy.PNG
	If ErrorLevel = 1
		{
		msgbox, Unable to find Copy button.
		Sleep 500
		}
	If ErrorLevel = 0
	{
	MsgBox, I see the Copy button at %CoordsX%, %CoordsY%.
	CopyCoordsX := CoordsX + 37
	CopyCoordsY := CoordsY + 10
	MsgBox, Click the Copy button at %CopyCoordsX%, %CopyCoordsY%.
	MouseMove, %CopyCoordsX%, %CopyCoordsY%, 0 ; [, Speed, R]
	break
	}
	If (A_Index = 10)
	{
	MsgBox, Unable to find the Copy button. Giving up...
	return
	}
}
Loop 10
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, C:\Users\%A_Username%\Desktop\ImageSearch\Save.PNG
	If ErrorLevel = 1
		{
		msgbox, Unable to find Save button.
		Sleep 500
		}
		If ErrorLevel = 0
	{
	MsgBox, I see the Save button at %CoordsX%, %CoordsY%.
	SaveCoordsX := CoordsX + 37
	SaveCoordsY := CoordsY + 10
	MsgBox, Click the Save button at %SaveCoordsX%, %SaveCoordsY%.
	MouseMove, %SaveCoordsX%, %SaveCoordsY%, 0 ; [, Speed, R]
	break
	}
	If (A_Index = 10)
	{
	MsgBox, Unable to find the Save button. Giving up...
	return
	}
}
Loop 20
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, C:\Users\%A_Username%\Desktop\ImageSearch\SavingRecord.PNG
	If ErrorLevel = 1
		{
		Sleep 500
		break
		;msgbox, Unable to find Saving Record prompt. Checking to see if it was unable to copy the action.
		}
	If ErrorLevel = 0
		{
		SplashTextOn, 500, ,Saving Record prompt still on screen. Waiting for it to close...
		Sleep 500
		SplashTextOff
		}
	If (A_Index = 20)
		{
		MsgBox, Is docketing running slow so the Saving Record prompt is still there?`n`nWe've waited over 10 seconds, so I'm going to stop trying.`n`nIt will eventually work, or tell you it couldn't copy.
		return
		}
}
Loop 5
{
ImageSearch, CoordsX, CoordsY, 0, 0, 2560, 1440, C:\Users\%A_Username%\Desktop\ImageSearch\UnableToCopy.PNG
	If ErrorLevel = 1
		{
		msgbox, Seems like it was able to copy without issue.
		Sleep 500
		break
		}
	If ErrorLevel = 0
		{
		msgbox, "Unable to Copy" warning on screen at %CoordsX%, %CoordsY%.
		Sleep 500
		}
	If (A_Index = 5)
		{
		MsgBox, Moving on...
		break
		}
return
}
}

; As the user drags the left mouse button, a ToolTip displays the size of the region inside the drag-area.

CoordMode, Mouse, Screen

/*
~LButton::
    MouseGetPos, begin_x, begin_y
    while GetKeyState("LButton")
    {
        MouseGetPos, x, y
        ToolTip, % begin_x ", " begin_y "`n" Abs(begin_x-x) " x " Abs(begin_y-y)
        Sleep, 10
    }
    ToolTip
return
*/
