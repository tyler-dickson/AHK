#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, pifmgr.dll, 7

Gui, New, AlwaysOnTop, Excel Row Grabber
Gui, Font, s8
Gui, Add, Button, gGrabExcel x5 y5 w125 h30, Grab Current Row
Gui, Add, Button, gClear xp+145 y5 w125 h30, Clear Info Below
Gui, Add, Button, gInject xp+145 y5 w125 h30, Inject Bibliographic Data
Gui, Add, Edit, Center ReadOnly x5 yp+36 w125 h20, Previous Counsel Ref.
Gui, Add, Edit, Center xp+125 yp w290 h20 , 
Gui, Add, Edit, Center ReadOnly x5 yp+20 w125 h20, App Type
Gui, Add, Edit, Center xp+125 yp w290 h20 , 
Gui, Add, Edit, Center ReadOnly x5 yp+20 w125 h20, Case Number
Gui, Add, Edit, Center xp+125 yp w290 h20 , 
Gui, Add, Edit, Center ReadOnly x5 yp+20 w125 h60, Title
Gui, Add, Edit, Center xp+125 yp w290 h60 , 
Gui, Add, Edit, Center ReadOnly x5 yp+60 w125 h20, Country
Gui, Add, Edit, Center xp+125 yp w290 h20 , 
Gui, Add, Edit, Center ReadOnly x5 yp+20 w125 h20, Application #
Gui, Add, Edit, Center xp+125 yp w290 h20 , 
Gui, Add, Edit, Center ReadOnly x5 yp+20 w125 h20, Filing Date
Gui, Add, Edit, Center xp+125 yp w290 h20 , 
Gui, Add, Edit, Center ReadOnly x5 yp+20 w125 h20, Publication #
Gui, Add, Edit, Center xp+125 yp w290 h20 , 
Gui, Add, Edit, Center ReadOnly x5 yp+20 w125 h20, Publication Date
Gui, Add, Edit, Center xp+125 yp w290 h20 , 
Gui, Add, Edit, Center ReadOnly x5 yp+20 w125 h20, Patent Number
Gui, Add, Edit, Center xp+125 yp w290 h20 , 
Gui, Add, Edit, Center ReadOnly x5 yp+20 w125 h20, Issue Date
Gui, Add, Edit, Center xp+125 yp w290 h20 , 
Gui, Add, Edit, Center ReadOnly x5 yp+20 w125 h20, FA Code
Gui, Add, Edit, Center xp+125 yp w290 h20 ,
Gui, Add, Edit, Center ReadOnly x5 yp+20 w125 h20, FA Reference
Gui, Add, Edit, Center xp+125 yp w290 h20 ,
Gui, Add, Edit, Center ReadOnly x5 yp+20 w125 h20, Assignee/Applicant
Gui, Add, Edit, Center xp+125 yp w290 h20 ,
Gui, Add, Edit, Center ReadOnly x5 yp+20 w125 h20, Status
Gui, Add, Edit, Center xp+125 yp w290 h20 ,
Gui, Add, Edit, Center ReadOnly x5 yp+20 w125 h20, Client Reference
Gui, Add, Edit, Center xp+125 yp w290 h20 ,
Gui, Add, Edit, Center ReadOnly x5 yp+20 w125 h20, Client Reference
Gui, Add, Edit, Center xp+125 yp w290 h20 ,
Gui, Add, Edit, Center ReadOnly x5 yp+20 w125 h20, Client Reference
Gui, Add, Edit, Center xp+125 yp w290 h20 ,


;Gui, Add, Edit, Center ReadOnly x395 y41 w100 h20, FA Code
;Gui, Add, Edit, Center xp+100 yp w290 h20 ,
;Gui, Add, Edit, Center ReadOnly x395 yp+20 w100 h20, FA Reference
;Gui, Add, Edit, Center xp+100 yp w290 h20 ,
;Gui, Add, Edit, Center ReadOnly x395 yp+20 w100 h20, Assignee/Applicant
;Gui, Add, Edit, Center xp+100 yp w290 h20 ,
;Gui, Add, Edit, Center ReadOnly x395 yp+20 w100 h20, Status
;Gui, Add, Edit, Center xp+100 yp w290 h20 ,
;Gui, Add, Edit, Center ReadOnly x395 yp+20 w100 h20, Client Reference
;Gui, Add, Edit, Center xp+100 yp w290 h20 ,

 
Gui, Show, w425
SetTimer, GrabExcel, 100
return

GuiClose:
ExitApp
return


GrabExcel:
xl := ComObjActive("Excel.Application")
; MsgBox, % xl.ActiveCell.Address
; MsgBox, % xl.ActiveCell.Row
; MsgBox, % xl.ActiveCell.Column


GuiControl, , Edit1, % xl.Range("A1").text ; Previous Counsel Ref.
GuiControl, , Edit3, % xl.Range("B1").text ; Previous Counsel Ref.
GuiControl, , Edit5, % xl.Range("C1").text ; Previous Counsel Ref.
GuiControl, , Edit7, % xl.Range("D1").text ; Previous Counsel Ref.
GuiControl, , Edit9, % xl.Range("E1").text ; Previous Counsel Ref.
GuiControl, , Edit11, % xl.Range("F1").text ; Previous Counsel Ref.
GuiControl, , Edit13, % xl.Range("G1").text ; Previous Counsel Ref.
GuiControl, , Edit15, % xl.Range("H1").text ; Previous Counsel Ref.
GuiControl, , Edit17, % xl.Range("I1").text ; Previous Counsel Ref.
GuiControl, , Edit19, % xl.Range("J1").text ; Previous Counsel Ref.
GuiControl, , Edit21, % xl.Range("K1").text ; Previous Counsel Ref.
GuiControl, , Edit23, % xl.Range("L1").text ; Previous Counsel Ref.
GuiControl, , Edit25, % xl.Range("M1").text ; Previous Counsel Ref.
GuiControl, , Edit27, % xl.Range("N1").text ; Previous Counsel Ref.
GuiControl, , Edit29, % xl.Range("O1").text ; Previous Counsel Ref.
GuiControl, , Edit31, % xl.Range("P1").text ; Previous Counsel Ref.
GuiControl, , Edit33, % xl.Range("Q1").text ; Previous Counsel Ref.
GuiControl, , Edit35, % xl.Range("R1").text ; Previous Counsel Ref.

	


GuiControl, , Edit2, % xl.Range("A" xl.ActiveCell.Row).text ; Previous Counsel Ref.
GuiControl, , Edit4, % xl.Range("B" xl.ActiveCell.Row).text 
GuiControl, , Edit6, % xl.Range("C" xl.ActiveCell.Row).text
GuiControl, , Edit8, % xl.Range("D" xl.ActiveCell.Row).text  ; Title
GuiControl, , Edit10, % xl.Range("E" xl.ActiveCell.Row).text
GuiControl, , Edit12, % xl.Range("F" xl.ActiveCell.Row).text ; App Number
GuiControl, , Edit14, % xl.Range("G" xl.ActiveCell.Row).text ; Filing Date
GuiControl, , Edit16, % xl.Range("H" xl.ActiveCell.Row).text ; Pub Number
GuiControl, , Edit18, % xl.Range("I" xl.ActiveCell.Row).text ; Pub Date
GuiControl, , Edit20, % xl.Range("J" xl.ActiveCell.Row).text ; Patent Number
GuiControl, , Edit22, % xl.Range("K" xl.ActiveCell.Row).text ; Issue Date
GuiControl, , Edit24, % xl.Range("L" xl.ActiveCell.Row).text
GuiControl, , Edit26, % xl.Range("M" xl.ActiveCell.Row).text ; FA Reference
GuiControl, , Edit28, % xl.Range("N" xl.ActiveCell.Row).text
GuiControl, , Edit30, % xl.Range("O" xl.ActiveCell.Row).text
GuiControl, , Edit32, % xl.Range("P" xl.ActiveCell.Row).text
GuiControl, , Edit34, % xl.Range("Q" xl.ActiveCell.Row).text
GuiControl, , Edit36, % xl.Range("R" xl.ActiveCell.Row).text
return

Clear:
GuiControl, , Edit2,
GuiControl, , Edit4, 
GuiControl, , Edit6, 
GuiControl, , Edit8, 
GuiControl, , Edit10, 
GuiControl, , Edit12, 
GuiControl, , Edit14, 
GuiControl, , Edit16, 
GuiControl, , Edit18,
GuiControl, , Edit20,
GuiControl, , Edit22,
GuiControl, , Edit24, 
GuiControl, , Edit26, 
GuiControl, , Edit28,
GuiControl, , Edit30,
GuiControl, , Edit32,
return

Inject:
ie := WBGet()
GuiControlGet, temp1, , Edit2,  ; % "Previous Counsel Ref. " xl.Range("E" xl.ActiveCell.Row).text ; Previous Counsel Ref.
GuiControlGet, temp2, , Edit8,  ; % xl.Range("H" xl.ActiveCell.Row).text  ; Title
GuiControlGet, temp3, , Edit12, ; % xl.Range("J" xl.ActiveCell.Row).text  ; App Number
GuiControlGet, temp4, , Edit14, ; % xl.Range("K" xl.ActiveCell.Row).text  ; Filing Date
GuiControlGet, temp5, , Edit16, ; % xl.Range("L" xl.ActiveCell.Row).text  ; Pub Number
GuiControlGet, temp6, , Edit18, ; % xl.Range("M" xl.ActiveCell.Row).text  ; Pub Date
GuiControlGet, temp7, , Edit20, ; % xl.Range("N" xl.ActiveCell.Row).text  ; Patent Number
GuiControlGet, temp8, , Edit22, ; % xl.Range("O" xl.ActiveCell.Row).text  ; Issue Date
GuiControlGet, temp9, , Edit26, ; % xl.Range("Q" xl.ActiveCell.Row).text  ; FA Reference
GuiControlGet, temp10, ,Edit32, ; % xl.Range("Q" xl.ActiveCell.Row).text  ; Client Reference

CurrentRemarks := ie.document.getElementById("fldstrRemarks").value 

ie.document.getElementById("fldstrRemarks").value 		:= temp1 "`n" CurrentRemarks
ie.document.getElementById("fldstrAppTitle").value 		:= temp2
ie.document.getElementById("fldstrAppNumber").value 	:= temp3
ie.document.getElementById("flddteFilDate").value		:= temp4
ie.document.getElementById("fldstrPubNumber").value 	:= temp5
ie.document.getElementById("flddtePubDate").value 		:= temp6
ie.document.getElementById("fldstrPatNumber").value 	:= temp7
ie.document.getElementById("flddteIssDate").value 		:= temp8
ie.document.getElementById("fldstrAgentRef").value 		:= temp9
ie.document.getElementById("fldstrAppClientRef").value 	:= temp10

return














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



