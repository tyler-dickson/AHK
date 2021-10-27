#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent


;^F1::SendRaw You pressed Control + F1.
;F2::SendInput You pressed F2.
;F3::SendInput You pressed F3.
;F4::SendInput You pressed F4.
;F6::SendInput You pressed F6.
;F7::SendInput You pressed F7.
;F8::SendInput You pressed F8.
;F9::SendInput You pressed F9.
;F10::SendInput You pressed F10.
;F11::SendInput You pressed F11.
;F12::SendInput You pressed F12.

MsgBox, , Remapped Function Keys, Please remember that this will only work in the FIRST tab you opened in each Internet Explorer window.`n`nIf you're on the second tab, it will still interact with the first tab.`n`nIf you need to have another tab open, consider opening that one AFTER this one, and keep docketing in your FIRST tab.`n`nFor best results, keep docketing in the FIRST tab you opened.
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