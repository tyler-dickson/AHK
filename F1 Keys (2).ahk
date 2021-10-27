#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

SysGet, ScreenWidth, 78
SysGet, ScreenHeight, 79
global HalfScreenHeight := ScreenHeight * .50       ;964.8
;DetectHiddenWindows, On  
SetTitleMatchMode, 2


;^F1::SendRaw You pressed Control + F1.
;F2::SendInput You pressed F2.
;F3::SendInput You pressed F3.
;F4::SendInput You pressed F4.
;F6::SendInput You pressed F6.
;F7::SendInput You pressed F7.
;F8::SendInput You pressed F8.
;F9::SendInput You pressed F9                                                      
;F10::SendInput You pressed F10.
;F11::SendInput You pressed F11.
;F12::SendInput You pressed F12.

MsgBox, , Remapped Function Keys, Please remember that this will only work in the FIRST tab you opened in each Internet Explorer window.`n`nIf you're on the second tab, it will still interact with the first tab.`n`nIf you need to have another tab open, consider opening that one AFTER this one, and keep docketing in your FIRST tab.`n`nFor best results, keep docketing in the FIRST tab you opened.
return


/*
$*Escape::                         
KeyWait, Escape
KeyWait, Escape, D T0.15           
if ErrorLevel = 1
	{
	SendInput {Escape}
	return
	}
else if ErrorLevel = 0
	{
    toggle    := !toggle
	Gui, +AlwaysOnTop +ToolWindow
	Gui, Add, Button, x5   y105 w50 h50 Center, PAT STATUS	
	Gui, Add, Button, x5   y55  w50 h50 Center, TM STATUS
	Gui, Add, Button, x5   y155 w50 h50, F1`n`nSTATUS

	Gui, Add, Button, x55  y5   w50 h50 Center, TM`nOA	
	Gui, Add, Button, x55  y55  w50 h50 Center, PAT`nDIV OA	
	Gui, Add, Button, x55  y105 w50 h50 Center, PAT`nOA	
	Gui, Add, Button, x55  y155 w50 h50, F2`n`nOA	
	
	Gui, Add, Button, x105 y5   w50 h50 Center, TM`nOA	
	Gui, Add, Button, x105 y55  w50 h50 Center, PAT`nDIV OA	
	Gui, Add, Button, x105 y105 w50 h50 Center, PAT`nOA
	Gui, Add, Button, x105 y155 w50 h50 , F3`n`nPUB
	

	Gui, Add, Button, x155 y155 w50 h50, F4
	
	Gui, Add, Button, x215 y155 w50 h50, F5`n`nPOA
	Gui, Add, Button, x265 y155 w50 h50, F6`n`nASSIGN
	Gui, Add, Button, x315 y155 w50 h50, F7`n`nPRIOR
	Gui, Add, Button, x365 y155 w50 h50, F8`n`nFORMAL
	
	Gui, Add, Button, x425 y155 w50 h50, F9
	Gui, Add, Button, x475 y155 w50 h50, F10
	Gui, Add, Button, x525 y155 w50 h50, F11
	Gui, Add, Button, x575 y155 w50 h50, F12
	
	Gui, Color, 000111,  F1 Keys.ahk

    if (toggle = 1)
	{
    Gui, Show, w630 xCenter y%HalfScreenHeight%
	WinSet, Transcolor, 000111, F1 Keys.ahk
    }
	else
	{
	Gui, Hide
    }
	}
return

ShowFKeys:
    toggle    := !toggle
	Gui, New
	Gui, Add, Button, , Test.
    if (toggle = 1)
	{
    Gui, Show
    }
	else
	{
    Gui, Destroy
    }
return
*/


Picture:
PostMessage, 0xA1, 2,,, A
return

$`::
KeyWait, ``
KeyWait, ``, D T0.15
if ErrorLevel = 1
	{
	SendInput ``
	return
	}
else if ErrorLevel = 0
	{
1x1 = Test	
    toggle    := !toggle
    if (toggle = 1)
	{
	gosub CreateGUI
    }
	else
	{
	WinGetPos, FKeysPosX, FKeysPosY, , , F1 Keys.ahk,
	IniWrite, %FKeysPosX%, F1 Keys.ahk, Position, FKeysPosX
	IniWrite, %FKeysPosY%, F1 Keys.ahk, Position, FKeysPosY	
	Gui, Destroy
    }
	}
return

CreateGUI:
global FKeysPosX
global FKeysPosY
IniRead, FKeysPosX, F1 Keys.ahk, Position, FKeysPosX
IniRead, FKeysPosY, F1 Keys.ahk, Position, FKeysPosY
IniRead, 1x1, F1 Keys.ahk, Saved, 1x1
	if FKeysPosX = ERROR
		FKeysPosX = 0
	if FKeysPosY = ERROR
		FKeysPosY = 0
	Gui, +AlwaysOnTop +ToolWindow -Caption
	
	Gui, Add, Picture,x0   y0  w630 h5 gPicture, top-left.png
	
	Gui, Add, Button, x5   y5   w50 h50 Center v1x1 g1x1, %1x1%       ; Column x Row
	Gui, Add, Button, x5   y55  w50 h50 Center v1x2 g1x2, %1x2%
	Gui, Add, Button, x5   y105 w50 h50 Center v1x3 g1x3, %1x3%
	Gui, Add, Button, x5   y155 w50 h50 Center v1x4 g1x4, %1x4%

	Gui, Add, Button, x55  y5   w50 h50 Center v2x1 g2x1, %2x1%		; Column x Row
	Gui, Add, Button, x55  y55  w50 h50 Center v2x2 g2x2, %2x2%
	Gui, Add, Button, x55  y105 w50 h50 Center v2x3 g2x3, %2x3%
	Gui, Add, Button, x55  y155 w50 h50 Center v2x4 g2x4, %2x4%
	
	Gui, Add, Button, x105 y5   w50 h50 Center v3x1 g3x1, %3x1%		; Column x Row
	Gui, Add, Button, x105 y55  w50 h50 Center v3x2 g3x2, %3x2%	
	Gui, Add, Button, x105 y105 w50 h50 Center v3x3 g3x3, %3x3%
	Gui, Add, Button, x105 y155 w50 h50 Center v3x4 g3x4, %3x4%
	
	Gui, Add, Button, x155 y5   w50 h50 Center v4x1 g4x1, %4x1%		; Column x Row
	Gui, Add, Button, x155 y55  w50 h50 Center v4x2 g4x2, %4x2%	
	Gui, Add, Button, x155 y105 w50 h50 Center v4x3 g4x3, %4x3%
	Gui, Add, Button, x155 y155 w50 h50 Center v4x4 g4x4, %4x4%
		
	Gui, Add, Button, x215 y5   w50 h50 Center v5x1 g5x1, %5x1%
	Gui, Add, Button, x215 y55  w50 h50 Center v5x2 g5x2, %5x2%	
	Gui, Add, Button, x215 y105 w50 h50 Center v5x3 g5x3, %5x3%	
	Gui, Add, Button, x215 y155 w50 h50 Center v5x4 g5x4, %5x4%
	
	Gui, Add, Button, x265 y5   w50 h50 Center v6x1 g6x1, %6x1%
	Gui, Add, Button, x265 y55  w50 h50 Center v6x2 g6x2, %6x2%	
	Gui, Add, Button, x265 y105 w50 h50 Center v6x3 g6x3, %6x3%		
	Gui, Add, Button, x265 y155 w50 h50 Center v6x4 g6x4, %6x4%
	
	Gui, Add, Button, x315 y5   w50 h50 Center v7x1 g7x1, %7x1%
	Gui, Add, Button, x315 y55  w50 h50 Center v7x2 g7x2, %7x2%	
	Gui, Add, Button, x315 y105 w50 h50 Center v7x3 g7x3, %7x3%			
	Gui, Add, Button, x315 y155 w50 h50 Center v7x4 g7x4, %7x4%
	
	Gui, Add, Button, x365 y5   w50 h50 Center v8x1 g8x1, %8x1%
	Gui, Add, Button, x365 y55  w50 h50 Center v8x2 g8x2, %8x2%	
	Gui, Add, Button, x365 y105 w50 h50 Center v8x3 g8x3, %8x3%	
	Gui, Add, Button, x365 y155 w50 h50 Center v8x4 g8x4, %8x4%
	
	Gui, Add, Button, x425 y5   w50 h50 Center v9x1 g9x1, %9x1%
	Gui, Add, Button, x425 y55  w50 h50 Center v9x2 g9x2, %9x2%	
	Gui, Add, Button, x425 y105 w50 h50 Center v9x3 g9x3, %9x3%		
	Gui, Add, Button, x425 y155 w50 h50 Center v9x4 g9x4, %9x4%
	
	Gui, Add, Button, x475 y5   w50 h50 Center v10x1 g10x1, %10x1%
	Gui, Add, Button, x475 y55  w50 h50 Center v10x2 g10x2, %10x2%	
	Gui, Add, Button, x475 y105 w50 h50 Center v10x3 g10x3, %10x3%	
	Gui, Add, Button, x475 y155 w50 h50 Center v10x4 g10x4, %10x4%
	
	Gui, Add, Button, x525 y5   w50 h50 Center v11x1 g11x1, %11x1%
	Gui, Add, Button, x525 y55  w50 h50 Center v11x2 g11x2, %11x2%	
	Gui, Add, Button, x525 y105 w50 h50 Center v11x3 g11x3, %11x3%		
	Gui, Add, Button, x525 y155 w50 h50 Center v11x4 g11x4, %11x4%
	
	Gui, Add, Button, x575 y5   w50 h50 Center v12x1 g12x1, %12x1%
	Gui, Add, Button, x575 y55  w50 h50 Center v12x2 g12x2, %12x2%	
	Gui, Add, Button, x575 y105 w50 h50 Center v12x3 g12x3, %12x3%		
	Gui, Add, Button, x575 y155 w50 h50 Center v12x4 g12x4, %12x4%
	
	Gui, Add, Button, x5   y205 w50 h20 Center gCustomize, Edit
	Gui, Color, 000111,  F1 Keys.ahk	

    Gui, Show, w630 x%FKeysPosX% y%FKeysPosY%	, F1 Keys.ahk

	WinSet, Transcolor, 000111, F1 Keys.ahk
	WinMove, F1 Keys.ahk, x%FKeysPosX% y%FKeysPosY%	
return


Customize:
InputBox, 1x1, Update 1x1, New Action for 1x1
GuiControl, , Button1, %1x1%
IniWrite, %1x1%, F1 Keys.ahk, Saved, 1x1
return



1x1:
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		InputBox, 1x1, Update 1x1, New Action for 1x1
		GuiControl, , Button1, %1x1%
		IniWrite, %1x1%, F1 Keys.ahk, Saved, 1x1
		return
		}
	else
		MsgBox, Boom.
return

1x2:
GetKeyState, IsCtrlDown, Control
	if (IsCtrlDown = "D")
		{
		InputBox, 1x2, Update 1x2, New Action for 1x2
		GuiControl, , Button2, %1x2%
		IniWrite, %1x2%, F1 Keys.ahk, Saved, 1x2
		return
		}
	else
		MsgBox, Boom2.
return

1x3:
1x4:
2x1:
2x2:
2x3:
2x4:
3x1:
3x2:
3x3:
3x4:
4x1:
4x2:
4x3:
4x4:
5x1:
5x2:
5x3:
5x4:
6x1:
6x2:
6x3:
6x4:
7x1:
7x2:
7x3:
7x4:
8x1:
8x2:
8x3:
8x4:
9x1:
9x2:
9x3:
9x4:
10x1:
10x2:
10x3:
10x4:
11x1:
11x2:
11x3:
11x4:
12x1:
12x2:
12x3:
12x4:
MsgBox, Test.
return




























































#IfWinActive ahk_class IEFrame

GrabHandle:
;ObjRelease(ie)
if  hWnd :=  WinExist("ahk_class IEFrame")
{
   For ie in ComObjCreate("Shell.Application").Windows
   {} Until  (hWnd = ie.hwnd)
   params := [OutputVar, 32]
}
else
{
   ie := ComObjCreate("InternetExplorer.Application")
  ie.Visible := True
   params := [OutputVar, 32]
}
;ie.Navigate(params*)
While IE.Busy ; simple wait for page to load
Sleep, 100 ; 1/10 second
return

F1::
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = "INT-TM STATUS ACTION")
	{
	ActionType := "INT-PAT STATUS CHECK"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if ActionType = INT-PAT STATUS CHECK
	{
	ActionType := "INT-TM STATUS ACTION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != "INT-PAT STATUS CHECK") || (ActionType != "INT-TM STATUS ACTION")
	{
	ActionType := "INT-PAT STATUS CHECK"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return

F2::
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = "INT-TM OFFICE ACTION")
	{
	ActionType := "INT-PAT OFFICE ACTION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if ActionType = INT-PAT OFFICE ACTION
	{
	ActionType := "INT-PAT DIV OFFICE ACTION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if ActionType = INT-PAT DIV OFFICE ACTION
	{
	ActionType := "INT-TM OFFICE ACTION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType != "INT-PAT OFFICE ACTION") || (ActionType != "INT-PAT DIV OFFICE ACTION") || (ActionType != "INT-TM OFFICE ACTION")
	{
	ActionType := "INT-PAT OFFICE ACTION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return

F3::
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = "INT-TM SECOND PUBLICATION")
	{
	ActionType := "INT-PAT PCT PUBLICATION RECVD"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if ActionType = INT-PAT PCT PUBLICATION RECVD
	{
	ActionType := "INT-PAT PCT REPUBLICATION RECVD"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if ActionType = INT-PAT PCT REPUBLICATION RECVD
	{
	ActionType := "INT-PAT APPLICATION PUBLICATION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if ActionType = INT-PAT APPLICATION PUBLICATION
	{
	ActionType := "INT-PAT SECOND PUBLICATION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}			
if ActionType = INT-PAT SECOND PUBLICATION
	{
	ActionType := "INT-TM FIRST PUBLICATION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if ActionType = INT-TM FIRST PUBLICATION
	{
	ActionType := "INT-TM SECOND PUBLICATION"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
	
if (ActionType != "INT-PAT PCT PUBLICATION RECVD") || (ActionType != "INT-PAT PCT REPUBLICATION RECVD") || (ActionType != "INT-PAT APPLICATION PUBLICATION") || (ActionType != "INT-PAT SECOND PUBLICATION") || (ActionType != "INT-TM FIRST PUBLICATION") || (ActionType != "INT-TM SECOND PUBLICATION")
	{
	ActionType := "INT-PAT PCT PUBLICATION RECVD"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return


F5::
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = "INT-TM POWER OF ATTORNEY REQUEST NO DATE")
	{
	ActionType := "INT-PAT POWER OF ATTORNEY REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if ActionType = INT-PAT POWER OF ATTORNEY REQUEST
	{
	ActionType := "INT-PAT POWER OF ATTORNEY REQUEST NO DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if ActionType = INT-PAT POWER OF ATTORNEY REQUEST NO DATE
	{
	ActionType := "INT-TM POWER OF ATTORNEY REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if ActionType = INT-TM POWER OF ATTORNEY REQUEST
	{
	ActionType := "INT-TM POWER OF ATTORNEY REQUEST NO DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != "INT-PAT POWER OF ATTORNEY REQUEST") || (ActionType != "INT-PAT POWER OF ATTORNEY REQUEST NO DATE") || (ActionType != "INT-TM POWER OF ATTORNEY REQUEST") || (ActionType != "INT-TM POWER OF ATTORNEY REQUEST NO DATE")
	{
	ActionType := "INT-PAT POWER OF ATTORNEY REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return	
	
F6::
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = "INT-TM ASSIGNMENT REQUEST NO DATE")
	{
	ActionType := "INT-PAT ASSIGNMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if ActionType = INT-PAT ASSIGNMENT REQUEST
	{
	ActionType := "INT-PAT ASSIGNMENT REQUEST NO DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if ActionType = INT-PAT ASSIGNMENT REQUEST NO DATE
	{
	ActionType := "INT-TM ASSIGNMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if ActionType = INT-TM ASSIGNMENT REQUEST
	{
	ActionType := "INT-TM ASSIGNMENT REQUEST NO DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != "INT-PAT ASSIGNMENT REQUEST") || (ActionType != "INT-PAT ASSIGNMENT REQUEST NO DATE") || (ActionType != "INT-TM ASSIGNMENT REQUEST") || (ActionType != "INT-TM ASSIGNMENT REQUEST NO DATE")
	{
	ActionType := "INT-PAT ASSIGNMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return		
	
F7::
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = "INT-TM PRIORITY DOCUMENT REQUEST NO DATE")
	{
	ActionType := "INT-PAT PRIORITY DOCUMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if ActionType = INT-PAT PRIORITY DOCUMENT REQUEST
	{
	ActionType := "INT-PAT PRIORITY DOCUMENT REQUEST NO DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if ActionType = INT-PAT PRIORITY DOCUMENT REQUEST NO DATE
	{
	ActionType := "INT-TM PRIORITY DOCUMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if ActionType = INT-TM PRIORITY DOCUMENT REQUEST
	{
	ActionType := "INT-TM PRIORITY DOCUMENT REQUEST NO DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != "INT-PAT PRIORITY DOCUMENT REQUEST") || (ActionType != "INT-PAT PRIORITY DOCUMENT REQUEST NO DATE") || (ActionType != "INT-TM PRIORITY DOCUMENT REQUEST") || (ActionType != "INT-TM PRIORITY DOCUMENT REQUEST NO DATE")
	{
	ActionType := "INT-PAT PRIORITY DOCUMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return	

F8::
gosub GrabHandle
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = "INT-TM FORMAL DOCUMENT REQUEST NO DATE")
	{
	ActionType := "INT-PAT FORMAL DOCUMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if ActionType = INT-PAT FORMAL DOCUMENT REQUEST
	{
	ActionType := "INT-PAT FORMAL DOCUMENT REQUEST NO DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if ActionType = INT-PAT FORMAL DOCUMENT REQUEST NO DATE
	{
	ActionType := "INT-TM FORMAL DOCUMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if ActionType = INT-TM FORMAL DOCUMENT REQUEST
	{
	ActionType := "INT-TM FORMAL DOCUMENT REQUEST NO DATE"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != "INT-PAT FORMAL DOCUMENT REQUEST") || (ActionType != "INT-PAT FORMAL DOCUMENT REQUEST NO DATE") || (ActionType != "INT-TM FORMAL DOCUMENT REQUEST") || (ActionType != "INT-TM FORMAL DOCUMENT REQUEST NO DATE")
	{
	ActionType := "INT-PAT FORMAL DOCUMENT REQUEST"
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return	

Escape::
ExitApp

#IfWinActive

/*

[Position]
FKeysPosX=1668
FKeysPosY=632


[Saved]
1x1=fda
*/

