#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, shell32.dll , 47

SetTitleMatchMode, 2

StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
	{
	UserFolder = %A_LoopFileName%
	}

if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder	

global ClientCode
	
Gui, Test: New, AlwaysOnTop ToolWindow, BetterSaver
Gui, Test: Font, s10

itemList := "aa|ab|ad|az|aj|ay|aq|ap|"

Gui, Test: Add, ComboBox, Simple x220 y5 w600 h25 R10 vSavedDescription gTestTest, % itemList
Gui, Test: Font, s12
Gui, Test: Add, Button, xp-120 yp-1 h31 w120 gInsertText, Insert
Gui, Test: Add, Button, xp yp+31 h31 w120 gAddOption, Add To List
Gui, Test: Add, Button, xp yp+31 h45 w120 gRemoveSelected, Remove Selected
Gui, Test: Add, Button, xp yp+45 h31 w120 gRemoveAll, Remove All
Gui, Test: Add, Button, xp yp+31 h31 w120 gSortTime, Sorting by Time
Gui, Test: Add, Button, xp yp+31 h31 w120 gSortABC, Sorting by ABC
Gui, Test: Font, s8
Gui, Test: Add, Button, x0 y4 h31 w100 gGrabClientCode, Client Code
Gui, Test: Add, Edit, xp yp+31 h31 w100 vStoredClientCode,

Gui, Test: Add, Button, x853 y4  h27 w87 , Add and Save
Gui, Test: Add, Button, xp yp+32 h27 w87 , ABCD
Gui, Test: Add, Button, xp yp+32 h27 w87 , ABCD
Gui, Test: Add, Button, xp yp+32 h27 w87 , ABCD
Gui, Test: Add, Button, xp yp+33 h27 w87 , ABCD
Gui, Test: Add, Button, xp yp+33 h27 w87 , ABCD

SetTimer, RestartScript, -50400000
SetTimer, CheckWindow, 50
return

; fldstrCaseNumber_TextBox

TestTest:
Gui, Submit, NoHide
; MsgBox, % SavedDescription
ControlSetText, Edit7, %SavedDescription%, \Search Results\
return

GrabClientCode:
GuiControlGet, tempDesc, , Edit1
newDesc := tempDesc "" ClientCode
GuiControl, Test:Text, SavedDescription, %newDesc%
ControlSetText, Edit7, %newDesc%, \Search Results\
return



CheckWindow:
IfWinExist, \Search Results\
	{
	WinGetPos, saveX, saveY, saveW, saveH, \Search Results\
	; MsgBox, % saveX " | " saveY " | " saveW " | " saveH
	ControlGetPos, posX, posY, posW, posH, Edit7, \Search Results\
	GuiControl, Test:Move, SavedDescription, w%posW%
	GuiControl, Test:Move, Button8,  % "x" posX + posW + 13
	GuiControl, Test:Move, Button9,  % "x" posX + posW + 13
	GuiControl, Test:Move, Button10, % "x" posX + posW + 13
	GuiControl, Test:Move, Button11, % "x" posX + posW + 13
	GuiControl, Test:Move, Button12, % "x" posX + posW + 13
	GuiControl, Test:Move, Button13, % "x" posX + posW + 13

	newPosY := saveY + saveH - 7
	Gui, Test: Show, % "NoActivate x" saveX + 4 " y" newPosY " w" saveW - 14 ; "h100"
	
	}
else
	Gui, Test: Hide
ie := WBGet()
ClientCode := ie.document.getElementById("fldstrCaseNumber_TextBox").value
GuiControl, Test:Text, Button7, %ClientCode%

return

SortABC:
sortedList := itemList
Sort, sortedList, D|
GuiControl, Test:, SavedDescription, |%sortedList%|
return

SortTime:
GuiControl, Test:, SavedDescription, |%itemList%|
return

InsertText:
Gui, Submit, NoHide
; MsgBox, % SavedDescription
ControlSetText, Edit7, %SavedDescription%, \Search Results\
gosub AddOption
return

AddOption:
Gui, Submit, NoHide

if InStr(itemList, "|" SavedDescription "|")
	{
	GuiControl, Test:, SavedDescription, |%itemList%|
	}
else
	{
	itemList := "|" SavedDescription "|" itemList
	itemList := StrReplace(itemList, "||", "|")
	GuiControl, Test:, SavedDescription, |%itemList%|
	}
gosub SortABC

return

RemoveAll:
itemList := ""
GuiControl, Test:, SavedDescription, |%itemList%|
return

RemoveSelected:
Gui, Submit, NoHide
if (SavedDescription == "")
	return
else
	{
	tempList := StrSplit(itemList, "|")
	if (SavedDescription == tempList[tempList.Length()])
		itemList := StrReplace(itemList, "|" SavedDescription, "")
	else
		itemList := StrReplace(itemList, SavedDescription "|", "")
		
	GuiControl, Test:, SavedDescription, |%itemList%|
	tempList := ""
	}
return

RestartScript:
Reload
return

#IfWinActive, \Search Results\
Insert::
gosub FixCase
return
#IfWinActive

#IfWinActive, Properties
Insert::
gosub FixCase
return
#IfWinActive


#IfWinActive, FP-DECGRANTEP - MacroworX
Insert::
gosub FixCase
return
#IfWinActive

#IfWinActive, ahk_class rctrl_renwnd32

$Insert::
if instr((Name := ComObjType(ComObjActive("Outlook.Application").ActiveWindow, "Name")), "Inspector")
	{
	PCTRcvd := OpenEmail.Subject
	IniRead, ATPartner, C:\Users\%Computername%\AHKPrefs.ini, Username, ATPartner
	SendInput, % ATPartner "{Tab}"
	}
else
	{
	SendInput, {Insert}
	}

#IfWinActive

FixCase:
IfWinActive, \Search Results\
	ControlGetText, Filename, Edit7, \Search Results\
else IfWinActive, Properties
	ControlGetText, Filename, Edit9, Properties
else IfWinActive, FP-DECGRANTEP - MacroworX
	{
	ControlGetText, NewFilename, WindowsForms10.EDIT.app.0.3455735_r96_ad212, FP-DECGRANTEP - MacroworX
	
	NewFilename := RegExReplace(NewFilename,"\bAL\b","Albania,")		
	NewFilename := RegExReplace(NewFilename,"\bAT\b","Austria,")		
	NewFilename := RegExReplace(NewFilename,"\bBA\b","Bosnia and Herzegovina,")		
	NewFilename := RegExReplace(NewFilename,"\bBE\b","Belgium,")		
	NewFilename := RegExReplace(NewFilename,"\bBG\b","Bulgaria,")		
	NewFilename := RegExReplace(NewFilename,"\bCH\b","Switzerland,")		
	NewFilename := RegExReplace(NewFilename,"\bCY\b","Republic of Cyprus,")		
	NewFilename := RegExReplace(NewFilename,"\bCZ\b","Czech Republic,")		
	NewFilename := RegExReplace(NewFilename,"\bDE\b","Germany,")
	NewFilename := RegExReplace(NewFilename,"\bDK\b","Denmark,")
	NewFilename := RegExReplace(NewFilename,"\bEE\b","Estonia,")
	NewFilename := RegExReplace(NewFilename,"\bES\b","Spain,")
	NewFilename := RegExReplace(NewFilename,"\bFI\b","Finland,")
	NewFilename := RegExReplace(NewFilename,"\bFR\b","France,")
	NewFilename := RegExReplace(NewFilename,"\bGB\b","United Kingdom,")	
	NewFilename := RegExReplace(NewFilename,"\bGR\b","Greece,")	
	NewFilename := RegExReplace(NewFilename,"\bHR\b","Croatia,")	
	NewFilename := RegExReplace(NewFilename,"\bHU\b","Hungary,")	
	NewFilename := RegExReplace(NewFilename,"\bIE\b","Ireland,")	
	NewFilename := RegExReplace(NewFilename,"\bIS\b","Iceland,")	
	NewFilename := RegExReplace(NewFilename,"\bIT\b","Italy,")	
	NewFilename := RegExReplace(NewFilename,"\bLI\b","Liechtenstein,")	
	NewFilename := RegExReplace(NewFilename,"\bLT\b","Lithuania,")	
	NewFilename := RegExReplace(NewFilename,"\bLU\b","Luxembourg,")	
	NewFilename := RegExReplace(NewFilename,"\bLV\b","Latvia,")	
	NewFilename := RegExReplace(NewFilename,"\bMC\b","Monaco,")	
	NewFilename := RegExReplace(NewFilename,"\bME\b","Montenegro,")	
	NewFilename := RegExReplace(NewFilename,"\bMK\b","Macedonia,")	
	NewFilename := RegExReplace(NewFilename,"\bMT\b","Malta,")	
	NewFilename := RegExReplace(NewFilename,"\bNL\b","Netherlands,")	
	NewFilename := RegExReplace(NewFilename,"\bNO\b","Norway,")	
	NewFilename := RegExReplace(NewFilename,"\bPL\b","Poland,")	
	NewFilename := RegExReplace(NewFilename,"\bPT\b","Portugal,")	
	NewFilename := RegExReplace(NewFilename,"\bRO\b","Romania,")	
	NewFilename := RegExReplace(NewFilename,"\bRS\b","Serbia,")	
	NewFilename := RegExReplace(NewFilename,"\bSE\b","Sweden,")	
	NewFilename := RegExReplace(NewFilename,"\bSI\b","Slovenia,")	
	NewFilename := RegExReplace(NewFilename,"\bSK\b","Slovakia,")	
	NewFilename := RegExReplace(NewFilename,"\bSM\b","San Marino,")	
	NewFilename := RegExReplace(NewFilename,"\bTR\b","Turkey,")	
	
	NewFilename := SubStr(NewFilename, 1 , -1)

	ControlSetText, WindowsForms10.EDIT.app.0.3455735_r96_ad212, %NewFilename%, FP-DECGRANTEP - MacroworX
	
	return
	}
	

Filename := StrReplace(Filename, "/", " / ")

StringUpper, Filename, Filename, T

Chunks := StrSplit(Filename, "-")

ClientCode := Chunks[Chunks.Length()]

NewFilename := ""
Loop % Chunks.Length() - 1
	{
	if (NewFilename == "")
		NewFilename := Chunks[A_Index]
	else
		NewFilename := NewFilename "-" Chunks[A_Index]
	}

StringUpper, ClientCode, ClientCode	
NewFilename := NewFilename "-" ClientCode

#Include \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Text Case Replacements.ini

NewFilename := StrReplace(NewFilename, " / ", "/")

IfWinActive, \Search Results\
	ControlSetText, Edit7, %NewFilename%, \Search Results\
else IfWinActive, Properties
	ControlSetText, Edit9, %NewFilename%, Properties
return

;;;;; Don't worry about this. This is where all the IE magic comes from.
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
