#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, shell32.dll , 46

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
	
	
MsgText  =
(
I thought of some other things to add to the Insert button, so maybe I'll keep adding context-based things if I come up with them.

I also updated this so it will restart overnight like DocketMods does.

-----
1) Case Fixer - This will update your iManage filenames to Title Case. It works both while saving and when you edit the Properties.

2) Validation State Fixer - This is for the 97(1) LC. You can type in DE FR GB IT and it will automatically convert to the full country names.

3) AT Partner for Outlook - This will grab your current AT Partner from your AHK settings and insert in your To or Cc field. Good for if your partner keeps switching throughout the week!
-----

Can you think of any other things this could be used for?
)
	
MsgBox, 0, Welcome to SuperInsert!, % MsgText


SetTimer, RestartScript, -50400000
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
