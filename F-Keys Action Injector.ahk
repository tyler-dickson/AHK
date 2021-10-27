#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
Enabled := ComObjError(false)
SysGet, ScreenWidth, 78
SysGet, ScreenHeight, 79
global HalfScreenHeight := ScreenHeight * .50       ;964.8
;DetectHiddenWindows, On  
SetTitleMatchMode, 2
Menu, Tray, Icon, compstui.dll , 94

global ComputerName
Computername = %A_Username%

if Computername = lara.anabtawi
	Computername = lara.hamdan
if Computername = neysa.perkins
	Computername = neysa.cabudol
if Computername = jessica.george
	Computername = jessica.egigian
if Computername = sabrina.fleming
	Computername = sabrina.kellogg
	
IfNotExist,C:\Users\%Computername%\CustomFKeys.ini
	{
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point6	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point6	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point6	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point6	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point6	
	}
	
IniRead, Uses, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, FKeysInjector
	if Uses = ERROR
		IniWrite, 1, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, FKeysInjector
	else
		{
		Uses++
		IniWrite, %Uses%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, FKeysInjector
		}
	
MsgBox, , F-Keys Action Injector, Welcome to the F-Keys Action Injector!`n`nHold the Windows key and press F1 to customize your keys.`n`nIf the first option is blank, the F-Key will function normally.`n`nEach press of an F-Key will cycle to the next option. Once you reach the end (or a blank entry), it will cycle back to the beginning.`n`nIf you leave blanks in between selections, it will never cycle to the later options.
	
return

#F1::
Gui, Destroy
Gui, New, , Customize F-Keys
Gui, Add, DropDownList, Center vCustomKey gCustomKey x5 y5 w180, F1||F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12
Gui, Add, Edit, Center vChoice1 x5 y30 w180, 
Gui, Add, Edit, Center vChoice2 x5 y55 w180, 
Gui, Add, Edit, Center vChoice3 x5 y80 w180, 
Gui, Add, Edit, Center vChoice4 x5 y105 w180, 
Gui, Add, Edit, Center vChoice5 x5 y130 w180, 
Gui, Add, Edit, Center vChoice6 x5 y155 w180, 
Gui, Add, Button, gSubmitCustomKeys x5 y180, Customize
Gui, Add, Button, gCancelChanges x118 y180, Close Menu
Gui, Show, w190
gosub CustomKey
return

CancelChanges:
Gui, Destroy
return

CustomKey:
Gui, Submit, NoHide
IniRead, Choice1, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point1
IniRead, Choice2, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point2
IniRead, Choice3, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point3
IniRead, Choice4, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point4
IniRead, Choice5, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point5
IniRead, Choice6, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point6
GuiControl, , Edit1, %Choice1%
GuiControl, , Edit2, %Choice2%
GuiControl, , Edit3, %Choice3%
GuiControl, , Edit4, %Choice4%
GuiControl, , Edit5, %Choice5%
GuiControl, , Edit6, %Choice6%
return

SubmitCustomKeys:
Gui, Submit, NoHide
;MsgBox, % CustomKey " | " Choice1 " | " Choice2 " | " Choice3 " | " Choice4 " | " Choice5 " | " Choice6
IniWrite, %Choice1%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point1
IniWrite, %Choice2%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point2
IniWrite, %Choice3%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point3
IniWrite, %Choice4%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point4
IniWrite, %Choice5%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point5
IniWrite, %Choice6%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point6
MsgBox, , Shortcuts updated!, Shortcuts have been updated for this key.
return

GrabHandle:
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
return

#IfWinActive, ahk_class IEFrame

$F1::
IniRead, F1point1, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point1
IniRead, F1point2, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point2
IniRead, F1point3, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point3
IniRead, F1point4, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point4
IniRead, F1point5, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point5
IniRead, F1point6, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point6
	if F1point1 = 
		{
		Send {F1}
		return
		}
	else
		{
gosub GrabHandle
TrayTip, Stored Actions for F1, %F1point1%`n%F1point2%`n%F1point3%`n%F1point4%`n%F1point5%`n%F1point6%
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F1point6)
	{
	ActionType := F1point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F1point1)
	{
	ActionType := F1point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F1point2)
	{
	ActionType := F1point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F1point3)
	{
	ActionType := F1point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F1point4)
	{
	ActionType := F1point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F1point5)
	{
	ActionType := F1point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F1point1) || (ActionType != F1point2) || (ActionType != F1point3) || (ActionType != F1point4) || (ActionType != F1point5)|| (ActionType != F1point6)
	{
	ActionType := F1point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return
}

$F2::
IniRead, F2point1, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point1
IniRead, F2point2, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point2
IniRead, F2point3, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point3
IniRead, F2point4, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point4
IniRead, F2point5, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point5
IniRead, F2point6, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point6
	if F2point1 = 
		{
		Send {F2}
		return
		}
	else
		{
gosub GrabHandle
TrayTip, Stored Actions for F2, %F2point1%`n%F2point2%`n%F2point3%`n%F2point4%`n%F2point5%`n%F2point6%
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F2point6)
	{
	ActionType := F2point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F2point1)
	{
	ActionType := F2point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F2point2)
	{
	ActionType := F2point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F2point3)
	{
	ActionType := F2point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F2point4)
	{
	ActionType := F2point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F2point5)
	{
	ActionType := F2point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F2point1) || (ActionType != F2point2) || (ActionType != F2point3) || (ActionType != F2point4) || (ActionType != F2point5)|| (ActionType != F2point6)
	{
	ActionType := F2point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return
}

$F3::
IniRead, F3point1, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point1
IniRead, F3point2, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point2
IniRead, F3point3, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point3
IniRead, F3point4, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point4
IniRead, F3point5, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point5
IniRead, F3point6, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point6
	if F3point1 = 
		{
		Send {F3}
		return
		}
	else
		{
gosub GrabHandle
TrayTip, Stored Actions for F3, %F3point1%`n%F3point2%`n%F3point3%`n%F3point4%`n%F3point5%`n%F3point6%
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F3point6)
	{
	ActionType := F3point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F3point1)
	{
	ActionType := F3point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F3point2)
	{
	ActionType := F3point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F3point3)
	{
	ActionType := F3point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F3point4)
	{
	ActionType := F3point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F3point5)
	{
	ActionType := F3point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F3point1) || (ActionType != F3point2) || (ActionType != F3point3) || (ActionType != F3point4) || (ActionType != F3point5)|| (ActionType != F3point6)
	{
	ActionType := F3point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return
}


$F4::
IniRead, F4point1, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point1
IniRead, F4point2, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point2
IniRead, F4point3, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point3
IniRead, F4point4, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point4
IniRead, F4point5, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point5
IniRead, F4point6, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point6
	if F4point1 = 
		{
		Send {F4}
		return
		}
	else
		{
gosub GrabHandle
TrayTip, Stored Actions for F4, %F4point1%`n%F4point2%`n%F4point3%`n%F4point4%`n%F4point5%`n%F4point6%
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F4point6)
	{
	ActionType := F4point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F4point1)
	{
	ActionType := F4point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F4point2)
	{
	ActionType := F4point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F4point3)
	{
	ActionType := F4point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F4point4)
	{
	ActionType := F4point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F4point5)
	{
	ActionType := F4point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F4point1) || (ActionType != F4point2) || (ActionType != F4point3) || (ActionType != F4point4) || (ActionType != F4point5)|| (ActionType != F4point6)
	{
	ActionType := F4point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return
}


$F5::
IniRead, F5point1, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point1
IniRead, F5point2, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point2
IniRead, F5point3, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point3
IniRead, F5point4, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point4
IniRead, F5point5, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point5
IniRead, F5point6, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point6
	if F5point1 = 
		{
		Send {F5}
		return
		}
	else
		{
gosub GrabHandle
TrayTip, Stored Actions for F5, %F5point1%`n%F5point2%`n%F5point3%`n%F5point4%`n%F5point5%`n%F5point6%
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F5point6)
	{
	ActionType := F5point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F5point1)
	{
	ActionType := F5point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F5point2)
	{
	ActionType := F5point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F5point3)
	{
	ActionType := F5point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F5point4)
	{
	ActionType := F5point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F5point5)
	{
	ActionType := F5point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F5point1) || (ActionType != F5point2) || (ActionType != F5point3) || (ActionType != F5point4) || (ActionType != F5point5)|| (ActionType != F5point6)
	{
	ActionType := F5point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return
}

$F6::
IniRead, F6point1, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point1
IniRead, F6point2, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point2
IniRead, F6point3, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point3
IniRead, F6point4, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point4
IniRead, F6point5, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point5
IniRead, F6point6, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point6
	if F6point1 = 
		{
		Send {F6}
		return
		}
	else
		{
gosub GrabHandle
TrayTip, Stored Actions for F6, %F6point1%`n%F6point2%`n%F6point3%`n%F6point4%`n%F6point5%`n%F6point6%
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F6point6)
	{
	ActionType := F6point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F6point1)
	{
	ActionType := F6point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F6point2)
	{
	ActionType := F6point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F6point3)
	{
	ActionType := F6point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F6point4)
	{
	ActionType := F6point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F6point5)
	{
	ActionType := F6point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F6point1) || (ActionType != F6point2) || (ActionType != F6point3) || (ActionType != F6point4) || (ActionType != F6point5)|| (ActionType != F6point6)
	{
	ActionType := F6point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return
}

$F7::
IniRead, F7point1, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point1
IniRead, F7point2, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point2
IniRead, F7point3, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point3
IniRead, F7point4, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point4
IniRead, F7point5, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point5
IniRead, F7point6, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point6
	if F7point1 = 
		{
		Send {F1}
		return
		}
	else
		{
gosub GrabHandle
TrayTip, Stored Actions for F7, %F7point1%`n%F7point2%`n%F7point3%`n%F7point4%`n%F7point5%`n%F7point6%
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F7point6)
	{
	ActionType := F7point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F7point1)
	{
	ActionType := F7point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F7point2)
	{
	ActionType := F7point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F7point3)
	{
	ActionType := F7point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F7point4)
	{
	ActionType := F7point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F7point5)
	{
	ActionType := F7point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F7point1) || (ActionType != F7point2) || (ActionType != F7point3) || (ActionType != F7point4) || (ActionType != F7point5)|| (ActionType != F7point6)
	{
	ActionType := F7point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return
}

$F8::
IniRead, F8point1, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point1
IniRead, F8point2, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point2
IniRead, F8point3, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point3
IniRead, F8point4, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point4
IniRead, F8point5, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point5
IniRead, F8point6, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point6
	if F8point1 = 
		{
		Send {F8}
		return
		}
	else
		{
gosub GrabHandle
TrayTip, Stored Actions for F8, %F8point1%`n%F8point2%`n%F8point3%`n%F8point4%`n%F8point5%`n%F8point6%
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F8point6)
	{
	ActionType := F8point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F8point1)
	{
	ActionType := F8point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F8point2)
	{
	ActionType := F8point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F8point3)
	{
	ActionType := F8point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F8point4)
	{
	ActionType := F8point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F8point5)
	{
	ActionType := F8point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F8point1) || (ActionType != F8point2) || (ActionType != F8point3) || (ActionType != F8point4) || (ActionType != F8point5)|| (ActionType != F8point6)
	{
	ActionType := F8point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return
}


$F9::
IniRead, F9point1, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point1
IniRead, F9point2, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point2
IniRead, F9point3, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point3
IniRead, F9point4, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point4
IniRead, F9point5, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point5
IniRead, F9point6, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point6
	if F9point1 = 
		{
		Send {F9}
		return
		}
	else
		{
gosub GrabHandle
TrayTip, Stored Actions for F9, %F9point1%`n%F9point2%`n%F9point3%`n%F9point4%`n%F9point5%`n%F9point6%
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F9point6)
	{
	ActionType := F9point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F9point1)
	{
	ActionType := F9point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F9point2)
	{
	ActionType := F9point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F9point3)
	{
	ActionType := F9point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F9point4)
	{
	ActionType := F9point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F9point5)
	{
	ActionType := F9point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F9point1) || (ActionType != F9point2) || (ActionType != F9point3) || (ActionType != F9point4) || (ActionType != F9point5)|| (ActionType != F9point6)
	{
	ActionType := F9point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return
}

$F10::
IniRead, F10point1, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point1
IniRead, F10point2, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point2
IniRead, F10point3, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point3
IniRead, F10point4, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point4
IniRead, F10point5, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point5
IniRead, F10point6, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point6
	if F10point1 = 
		{
		Send {F10}
		return
		}
	else
		{
gosub GrabHandle
TrayTip, Stored Actions for F10, %F10point1%`n%F10point2%`n%F10point3%`n%F10point4%`n%F10point5%`n%F10point6%
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F10point6)
	{
	ActionType := F10point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F10point1)
	{
	ActionType := F10point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F10point2)
	{
	ActionType := F10point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F10point3)
	{
	ActionType := F10point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F10point4)
	{
	ActionType := F10point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F10point5)
	{
	ActionType := F10point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F10point1) || (ActionType != F10point2) || (ActionType != F10point3) || (ActionType != F10point4) || (ActionType != F10point5)|| (ActionType != F10point6)
	{
	ActionType := F10point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return
}

$F11::
IniRead, F11point1, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point1
IniRead, F11point2, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point2
IniRead, F11point3, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point3
IniRead, F11point4, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point4
IniRead, F11point5, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point5
IniRead, F11point6, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point6
	if F11point1 = 
		{
		Send {F11}
		return
		}
	else
		{
gosub GrabHandle
TrayTip, Stored Actions for F11, %F11point1%`n%F11point2%`n%F11point3%`n%F11point4%`n%F11point5%`n%F11point6%
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F11point6)
	{
	ActionType := F11point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F11point1)
	{
	ActionType := F11point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F11point2)
	{
	ActionType := F11point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F11point3)
	{
	ActionType := F11point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F11point4)
	{
	ActionType := F11point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F11point5)
	{
	ActionType := F11point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F11point1) || (ActionType != F11point2) || (ActionType != F11point3) || (ActionType != F11point4) || (ActionType != F11point5)|| (ActionType != F11point6)
	{
	ActionType := F11point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return
}

$F12::
IniRead, F12point1, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point1
IniRead, F12point2, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point2
IniRead, F12point3, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point3
IniRead, F12point4, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point4
IniRead, F12point5, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point5
IniRead, F12point6, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point6
	if F12point1 = 
		{
		Send {F12}
		return
		}
	else
		{
gosub GrabHandle
TrayTip, Stored Actions for F12, %F12point1%`n%F12point2%`n%F12point3%`n%F12point4%`n%F12point5%`n%F12point6%
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") || (ActionType = F12point6)
	{
	ActionType := F12point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F12point1)
	{
	ActionType := F12point2
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F12point2)
	{
	ActionType := F12point3
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
if (ActionType = F12point3)
	{
	ActionType := F12point4
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType = F12point4)
	{
	ActionType := F12point5
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}		
if (ActionType = F12point5)
	{
	ActionType := F12point6
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}	
if (ActionType != F12point1) || (ActionType != F12point2) || (ActionType != F12point3) || (ActionType != F12point4) || (ActionType != F12point5)|| (ActionType != F12point6)
	{
	ActionType := F12point1
	ie.document.getElementByID("fldstrActionType_TextBox").Value := ActionType
	return
	}
return
}

/*
[CustomFKeys]
F1point1=INT-PAT STATUS CHECK
F1point2=INT-TM STATUS ACTION
F1point3=
F1point4=
F1point5=
F1point6=
F2point1=INT-PAT OFFICE ACTION
F2point2=INT-PAT DIV OFFICE ACTION
F2point3=INT-TM OFFICE ACTION
F2point4=
F2point5=
F2point6=
F3point1=INT-PAT PCT PUBLICATION RECVD
F3point2=INT-PAT PCT REPUBLICATION RECVD
F3point3=INT-PAT APPLICATION PUBLICATION
F3point4=INT-PAT SECOND PUBLICATION
F3point5=INT-TM FIRST PUBLICATION
F3point6=INT-TM SECOND PUBLICATION
F4point1=
F4point2=
F4point3=
F4point4=
F4point5=
F4point6=
F5point1=INT-PAT POWER OF ATTORNEY REQUEST
F5point2=INT-PAT POWER OF ATTORNEY REQUEST NO DATE
F5point3=INT-TM POWER OF ATTORNEY REQUEST
F5point4=INT-TM POWER OF ATTORNEY REQUEST NO DATE
F5point5=
F5point6=
F6point1=INT-PAT ASSIGNMENT REQUEST
F6point2=INT-PAT ASSIGNMENT REQUEST NO DATE
F6point3=INT-TM ASSIGNMENT REQUEST
F6point4=INT-TM ASSIGNMENT REQUEST NO DATE
F6point5=
F6point6=
F7point1=INT-PAT PRIORITY DOCUMENT REQUEST
F7point2=INT-PAT PRIORITY DOCUMENT REQUEST NO DATE
F7point3=INT-TM PRIORITY DOCUMENT REQUEST
F7point4=INT-TM PRIORITY DOCUMENT REQUEST NO DATE
F7point5=
F7point6=
F8point1=INT-PAT FORMAL DOCUMENT REQUEST
F8point2=INT-PAT FORMAL DOCUMENT REQUEST NO DATE
F8point3=INT-TM FORMAL DOCUMENT REQUEST
F8point4=INT-TM FORMAL DOCUMENT REQUEST NO DATE
F8point5=
F8point6=
F9point1=
F9point2=
F9point3=
F9point4=
F9point5=
F9point6=
F10point1=
F10point2=
F10point3=
F10point4=
F10point5=
F10point6=
F11point1=
F11point2=
F11point3=
F11point4=
F11point5=
F11point6=
F12point1=
F12point2=
F12point3=
F12point4=
F12point5=
F12point6=
*/

;************Pointer to Open IE Window******************
WBGet(WinTitle="ahk_class IEFrame", Svr#=1) {               ;// based on ComObjQuery docs
   static msg := DllCall("RegisterWindowMessage", "str", "WM_HTML_GETOBJECT")
        , IID := "{0002DF05-0000-0000-C000-000000000046}"   ;// IID_IWebBrowserApp
;//     , IID := "{332C4427-26CB-11D0-B483-00C04FD90119}"   ;// IID_IHTMLWindow2
   SendMessage msg, 0, 0, Internet Explorer_Server%Svr#%, %WinTitle%

   if (ErrorLevel != "FAIL") {
      lResult:=ErrorLevel, VarSetCapacity(GUID,16,0)
      if DllCall("ole32\CLSIDFromString", "wstr","{332C4425-26CB-11D0-B483-00C04FD90119}", "ptr",&GUID) >= 0 {
         DllCall("oleacc\ObjectFromLresult", "ptr",lResult, "ptr",&GUID, "ptr",0, "ptr*",pdoc)
         return ComObj(9,ComObjQuery(pdoc,IID,IID),1), ObjRelease(pdoc)
      }
   }
}