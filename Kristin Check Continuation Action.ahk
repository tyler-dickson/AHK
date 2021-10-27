#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)


Gui, New, , QuickDocket
Gui, Add, Radio, vPatOrTM Checked, Patent
Gui, Add, Edit, vClientCode w100, Client Code
Gui, Add, Button, gGrabInfo, Grab!
Gui, Add, Text, w300, a
Gui, Add, Text, w300, b
Gui, Add, Text, w300, c
Gui, Add, Text, w300, d


Gui, Add, Edit, w500 h250, %Info%
Gui, Add, ActiveX, w500 h150 vie, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
ie.Navigate("http://kmobnetold/outsidekmobnet/cid/cidold/ClientList.aspx")  ; This is specific to the web browser control.
Gui, Add, Button, gTest, Test
Gui, Add, Text, , Client Code:
GUi, Add, Edit, w300 ReadOnly, 
Gui, Show
return

;   "http://kmobnet/insidekmobnet/Patent_TM_Reports/TMfacesheet.cfm?&casenumber=" . ClientCode . "&country=" . Country

;   "http://kmobnet/insidekmobnet/Patent_TM_Reports/facesheet.cfm?&casenumber=" . ClientCode . "&country=" . Country

; 	File Continuing Application?


GrabInfo:
Gui, Submit, NoHide
;MsgBox, %ClientCode% | %Country% | %PatOrTM%
if PatOrTM = 1
	Website := "http://kmobnet/insidekmobnet/Patent_TM_Reports/facesheet.cfm?&casenumber=" . ClientCode . "&country=US"

params := [Website, 64]
ie.Navigate(params*)	
Sleep 500
Info := ""
BaseNumber := ""
if PatOrTM = 1
{
var := ie.LocationURL ;grab current url	
Var2 := ie.document.GetElementsByTagName("TD").length
Loop %Var2%
{
NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
Info := Info . "`n" . NewInfo . " | " . A_Index
	if NewInfo = File Continuing Application? Patent to Issue
		{
		BaseNumber := A_Index - 1
		break
	}
}
Action1 := ie.document.GetElementsByTagName("TD")[BaseNumber].InnerText
Action2 := ie.document.GetElementsByTagName("TD")[BaseNumber + 1].InnerText
Action3 := ie.document.GetElementsByTagName("TD")[BaseNumber + 2].InnerText
Action4 := ie.document.GetElementsByTagName("TD")[BaseNumber + 3].InnerText


GuiControl, , Static1, %Action1%
GuiControl, , Static2, %Action2%
GuiControl, , Static3, %Action3%
GuiControl, , Static4, %Action4%



ie.Quit()
Sleep 500
;GuiControl, , Edit3, %Info%
}
GuiControl, , Edit2, %Info%	
return


Test:
Gui, Submit, NoHide
FileRead, Info, TestGrab.txt
Sleep 500
GuiControl, , Edit2, %Info%

return


/*
PATENT
1 = nil
2 = Country Application
3 = Current Date
4 = nil
5 = Client Code
6 = Subcase
7 = Country
8 = Instructed Date
9 = Case Type
10 = Status
11 = App Number
12 = Filing Date
13 = Patent Number
14 = Issued Date
15 = Publication Number
16 = Publication Date
17 = Expiration Date
18 = Entity
19 = Abandoned Date
20 = Agent
21 = Client
22 = Prosecuting
23 = Agent Ref
24 = Tax Due Date
25-26 = nil
27 = BarcodeDate
28 = Priority Number
29 = Tax Start Date
30 = Priority Date
31 = Confirmation Number
32 = Assignee
33 = Client Ref
34 = nil
35 = Art Unit
36 = nil
37 = Examiner
38 = Applicant
39 = Inventors
40 = Attorneys (spread out)
41 = Working?
42 = Billing?
43 = ?
44 = ?
45 = IPP
46 = ?
47 = ?
48 = Title
49 = Remarks
50 = User ID
51 = Date Created
52 = Last Update
53 = nil
54 = List of User Actions
55 = nil
56 = ALLLLLL ACTIONS! (Not helpful)
57 = Action(s) Due
58 = Due Date
59 = Indicator
60 = Action

61 = Deferred Exam (Action Type)
62 = 07-Oct-2021 (Base Date?)
63 = Due Date
64 = nil
65 = nil

66 = Instruct FA to Request Examination FINAL / Exam Desk
67 = 08-Apr-2020 (Base Date?)
68 = Due Date
69 = nil
70 = nil

---

96 = Filing Receipt or Particulars Received? / IPP
97 = 05-Apr-2017
98 = Due Date
99 = 26-Oct-2016
100 = nil





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