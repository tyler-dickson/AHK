; Created with AutoHotkey by Tyler Dickson. 

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

StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}

if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder	
	
IfNotExist,C:\Users\%Computername%\CustomFKeys.ini
	{
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point8
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point9
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F1point10
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point8
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point9
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F2point10
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point8
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point9
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F3point10
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point6	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point7	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point8	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point9	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F4point10	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point8
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point9
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F5point10
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point8
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point9
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F6point10
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point8
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point9
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F7point10
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point6
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point8
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point9
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F8point10
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point6	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point7	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point8	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point9	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F9point10	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point6	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point8	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point9	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F10point10	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point6	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point7	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point8	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point9	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F11point10	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point1
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point2
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point3
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point4
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point5
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point6	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point7
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point8	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point9	
	IniWrite, % "", C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, F12point10	
	}
	
IniRead, Uses, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, FKeysInjector
	if Uses = ERROR
		IniWrite, 1, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, FKeysInjector
	else
		{
		Uses++
		IniWrite, %Uses%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, FKeysInjector
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
Gui, Add, Edit, Center vChoice7 x5 yp+25 w180, 
Gui, Add, Edit, Center vChoice8 x5 yp+25 w180, 
Gui, Add, Edit, Center vChoice9 x5 yp+25 w180, 
Gui, Add, Edit, Center vChoice10 x5 yp+25 w180, 
Gui, Add, Button, gSubmitCustomKeys x5 yp+25, Customize
Gui, Add, Button, gCancelChanges x118 yp, Close Menu
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
IniRead, Choice7, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point7
IniRead, Choice8, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point8
IniRead, Choice9, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point9
IniRead, Choice10, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point10
GuiControl, , Edit1, %Choice1%
GuiControl, , Edit2, %Choice2%
GuiControl, , Edit3, %Choice3%
GuiControl, , Edit4, %Choice4%
GuiControl, , Edit5, %Choice5%
GuiControl, , Edit6, %Choice6%
GuiControl, , Edit7, %Choice7%
GuiControl, , Edit8, %Choice8%
GuiControl, , Edit9, %Choice9%
GuiControl, , Edit10, %Choice10%
return

SubmitCustomKeys:
Gui, Submit, NoHide
IniWrite, %Choice1%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point1
IniWrite, %Choice2%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point2
IniWrite, %Choice3%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point3
IniWrite, %Choice4%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point4
IniWrite, %Choice5%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point5
IniWrite, %Choice6%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point6
IniWrite, %Choice7%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point7
IniWrite, %Choice8%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point8
IniWrite, %Choice9%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point9
IniWrite, %Choice10%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %CustomKey%point10
MsgBox, , Shortcuts updated!, Shortcuts have been updated for this key.
return

GrabHandle:
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
return

#IfWinActive, ahk_class IEFrame

$F1::
$F2::
$F3::
$F4::
$F5::
$F6::
$F7::
$F8::
$F9::
$F10::
$F11::
$F12::
PressedKey := StrReplace(A_ThisHotKey, "$", "")

Loop 10
	IniRead, %PressedKey%point%A_Index%, C:\Users\%Computername%\CustomFKeys.ini, CustomFKeys, %PressedKey%point%A_Index%

	if %PressedKey%point1 = 
		{
		Send {%PressedKey%}
		return
		}
	else
		{
gosub GrabHandle
ie.document.getElementByID("flddteBaseDate").Focus()
ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value  ; GRAB VALUE

Temp1  := %PressedKey%point1
Temp2  := %PressedKey%point2
Temp3  := %PressedKey%point3
Temp4  := %PressedKey%point4
Temp5  := %PressedKey%point5
Temp6  := %PressedKey%point6
Temp7  := %PressedKey%point
Temp8  := %PressedKey%point8
Temp9  := %PressedKey%point9
Temp10 := %PressedKey%point10

if ActionType = %Temp1%
	ie.document.getElementByID("fldstrActionType_TextBox").Value := Temp2
else if ActionType = %Temp2%
	ie.document.getElementByID("fldstrActionType_TextBox").Value := Temp3
else if ActionType = %Temp3%
	ie.document.getElementByID("fldstrActionType_TextBox").Value := Temp4
else if ActionType = %Temp4%
	ie.document.getElementByID("fldstrActionType_TextBox").Value := Temp5
else if ActionType = %Temp5%
	ie.document.getElementByID("fldstrActionType_TextBox").Value := Temp6
else if ActionType = %Temp6%
	ie.document.getElementByID("fldstrActionType_TextBox").Value := Temp7
else if ActionType = %Temp7%
	ie.document.getElementByID("fldstrActionType_TextBox").Value := Temp8
else if ActionType = %Temp8%
	ie.document.getElementByID("fldstrActionType_TextBox").Value := Temp9
else if ActionType = %Temp9%
	ie.document.getElementByID("fldstrActionType_TextBox").Value := Temp10
else if ActionType = %Temp10%
	ie.document.getElementByID("fldstrActionType_TextBox").Value := Temp1
else if (ActionType != Temp1) || (ActionType != Temp2) || (ActionType != Temp3) || (ActionType != Temp4) || (ActionType != Temp5)|| (ActionType != Temp6) || (ActionType != Temp7) || (ActionType != Temp8) || (ActionType != Temp9) || (ActionType != Temp10)
	ie.document.getElementByID("fldstrActionType_TextBox").Value := Temp1

ActionType := ie.document.getElementByID("fldstrActionType_TextBox").Value
if (ActionType = "") 
	ie.document.getElementByID("fldstrActionType_TextBox").Value := Temp1
return
}

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

