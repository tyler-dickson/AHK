#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

/*
https://autohotkey.com/board/topic/69033-basic-ahk-l-com-tutorial-for-excel/

In this tutorial I will focus on using COM to script simple commands that will be used to automate Microsoft Office Excel. 
Before you can do anything with the Excel DOM you have to create a handle to the application. There are 2 ways to do this:
Xl := ComObjCreate("Excel.Application") ;create a handle to a new excel application
Xl := ComObjActive("Excel.Application") ;creates a handle to your currently active excel sheet

Let's look at each type individually:
ComObjCreate:
Xl := ComObjCreate("Excel.Application") ;handle
Xl.Visible := True ;by default excel sheets are invisible
Xl.Workbooks.Add ;add a new workbook

The most basic and useful way to use COM is to set individual cells in the sheet.
Xl.Range("A1").Value := "hello world!" ;set cell 'A1' to a string
helloworld := "hello world!"
Xl.Range("A1").Value := helloworld ;set cell to a variable

You can also set a variable to data inside a cell:
helloworld := Xl.Range("A1").Value

It's not too useful to set specific cells in a script especially in large files. 
Here's how to loop through the cells in a column:

while (Xl.Range("A" . A_Index).Value != "") {
Xl.Range("A" . A_Index).Value := value
}

And how to loop through a row:
Row := "1"
Columns := Object(1,"A",2,"B",3,"C",4,"D",5,"E",6,"F",7,"G",8,"H",9,"I",10,"J",11,"K",12,"L",13,"M",14,"N",15,"O",16,"P",17,"Q") ;array of column letters
For Key, Value In Columns
XL.Range(Value . Row).Value := value ;set values of each cell in a row

Now that you can use the basic's of excel let's look at a few more specific 

Examples:
Xl.Range("A:A").Copy ;copy cell to clipboard
Xl.Range("A:A").PasteSpecial(-4163) ;'-4163' is the constant for values only
Xl.Range("A:A").NumberFormat := "@" ;change the column format to 'text'
Xl.CutCopyMode := False ;deselect cells (use this with copy)

2 Save Methods:
XL.ActiveWorkbook.SaveAs(BookName) ;'bookname' is a variable with the path and name of the file you desire
Xl_Workbook := Xl.Workbooks.Open(Path) ;handle to specific workbook
Xl_Workbook.Save() ;quick save already existing file

Sort sheet by column:
Xl.Range("A1:Q100").Sort(Xl.Columns(1), 1) ;sort sheet by data in the 'a' column

MsgBox, %HWND%

MsgBox, % ComObjType(window)

MsgBox, % ComObjType(window, "Name")

*/

Gui, New
Gui, Add, Button, gGrabText, Grab Text from Excel
Gui, Add, Button, gRestoreText, Restore Text from File
Gui, Add, Button, gExceptionList, Grab Exception List
Gui, Add, DropDownList, vRecordType, Trademark||Patent
Gui, Add, Button, gCreateRecord, Create New Record

Gui, Show
return

CreateRecord:
Gui, Submit, NoHide
if RecordType = Trademark
	{
	Xl := ComObjActive("Excel.Application")
	ClientCode := Xl.Range("A3").Value
	Country := Xl.Range("B3").Value
	CaseType := Xl.Range("C3").Value
	Status := Xl.Range("D3").Value
	Agent := Xl.Range("E3").Value
	Assignee := Xl.Range("F3").Value
	ClientRef := Xl.Range("G3").Value
	AgentRef := Xl.Range("H3").Value
	Title := Xl.Range("I3").Value
	AppNumber := Xl.Range("J3").Value
	FilingDate := Xl.Range("K3").Value
	PubNumber := Xl.Range("L3").Value
	PubDate := Xl.Range("M3").Value
	2ndPubNumber := Xl.Range("N3").Value
	2ndPubDate := Xl.Range("O3").Value
	IssueNumber := Xl.Range("P3").Value
	IssueDate := Xl.Range("Q3").Value
	ParentPCTNumber := Xl.Range("R3").Value
	ParentPCTDate := Xl.Range("S3").Value
	ParentPatentNumber := Xl.Range("T3").Value
	ParentPatentDate := Xl.Range("U3").Value
	ConfirmNumber := Xl.Range("V3").Value
	ExpirationDate := Xl.Range("W3").Value
	Claims := Xl.Range("X3").Value
	Applicant := Xl.Range("Y3").Value
	TranInDate := Xl.Range("Z3").Value
	}
if RecordType = Patent
	{
	Xl := ComObjActive("Excel.Application")
	ClientCode := Xl.Range("A3").Value
	Country := Xl.Range("B3").Value
	CaseType := Xl.Range("C3").Value
	Status := Xl.Range("D3").Value
	Agent := Xl.Range("E3").Value
	Assignee := Xl.Range("F3").Value
	ClientRef := Xl.Range("G3").Value
	AgentRef := Xl.Range("H3").Value
	Title := Xl.Range("I3").Value
	AppNumber := Xl.Range("J3").Value
	FilingDate := Xl.Range("K3").Value
	PubNumber := Xl.Range("L3").Value
	PubDate := Xl.Range("M3").Value
	2ndPubNumber := Xl.Range("N3").Value
	2ndPubDate := Xl.Range("O3").Value
	IssueNumber := Xl.Range("P3").Value
	IssueDate := Xl.Range("Q3").Value
	ParentPCTNumber := Xl.Range("R3").Value
	ParentPCTDate := Xl.Range("S3").Value
	ParentPatentNumber := Xl.Range("T3").Value
	ParentPatentDate := Xl.Range("U3").Value
	ConfirmNumber := Xl.Range("V3").Value
	ExpirationDate := Xl.Range("W3").Value
	Claims := Xl.Range("X3").Value
	Applicant := Xl.Range("Y3").Value
	TranInDate := Xl.Range("Z3").Value
	}
	
	
	
	
	
Sleep 1000

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

ie.document.getElementByID("fldstrCaseNumber_TextBox").Value := ClientCode
ie.document.getElementByID("fldstrCountry_TextBox").Value := Country
ie.document.getElementByID("fldstrCaseType_TextBox").Value := CaseType
ie.document.getElementByID("fldstrApplicationStatus_TextBox").Value := Status
ie.document.getElementByID("fldstrAgent_TextBox").Value := Agent
ie.document.getElementByID("ldstrAppOwner_TextBox").Value := Assignee
ie.document.getElementByID("fldstrAppClientRef").Value := ClientRef
ie.document.getElementByID("fldstrAgentRef").Value := AgentRef
ie.document.getElementByID("fldstrAppTitle").Value := Title
ie.document.getElementByID("fldstrAppNumber").Value := AppNumber
ie.document.getElementByID("flddteFilDate").Value := FilingDate
ie.document.getElementByID("fldstrPubNumber").Value := PubNumber
ie.document.getElementByID("flddtePubDate").Value := PubDate
ie.document.getElementByID("fldstrPubNumber2").Value := 2ndPubNumber
ie.document.getElementByID("flddtePubDate_2").Value := 2ndPubDate
ie.document.getElementByID("fldstrPatNumber").Value := IssueNumber
ie.document.getElementByID("flddteIssDate").Value := IssueDate
ie.document.getElementByID("fldstrParentPCTNumber").Value := ParentPCTNumber
ie.document.getElementByID("flddteParentPCTDate").Value := ParentPCTDate
ie.document.getElementByID("fldstrParentPatNumber").Value := ParentPatentNumber
ie.document.getElementByID("flddteParentPCTDate").Value := ParentPatentDate
ie.document.getElementByID("fldstrConfirmationNumber").Value := ConfirmNumber
ie.document.getElementByID("flddteExpDate").Value := ExpirationDate
ie.document.getElementByID("fldstrNumberOfClaims").Value := Claims
ie.document.getElementByID("fldstrApplicant").Value := Applicant 
ie.document.getElementByID("flddteTranInDate").Value := TranInDate

return

GrabText:
TestText = This is a test.
Xl := ComObjActive("Excel.Application") ;creates a handle to your currently active excel sheet
Xl.Range("A1:U1000").Copy   ;:= "this is a test" ;set cell 'A1' to a string
;Xl.Range("B1").Value := "What are you doing" ;set cell 'A1' to a string
;Xl.Range("C1").Value := "Why you do this" ;set cell 'A1' to a string
;Xl.Range("D1").Value := "Nooooo" ;set cell 'A1' to a string
;Xl.Range("E1").Value := "Getting sleepy" ;set cell 'A1' to a string
;Xl.Range("F1").Value := "Awwww yeahhhh" ;copy cell to clipboard
;Xl.Range("G4").Value := TestText ;copy cell to clipboard
;test1 := Xl.Range("A1").Value
;test2 := Xl.Range("B1").Value
;test3 := Xl.Range("C1").Value
;test4 := Xl.Range("D1").Value
;test5 := Xl.Range("E1").Value
;test6 := Xl.Range("F1").Value
FileAppend, %ClipboardAll%, C:\Users\%A_Username%\Desktop\TestExcel.clip ; The file extension does not matter.
return

RestoreText:
FileRead, Clipboard, *c C:\Users\%A_Username%\Desktop\TestExcel.clip ; Note the use of *c, which must precede the filename.
Xl.Range("A1").Select
Xl.ActiveSheet.PasteSpecial
Sleep 1000
return

ExceptionList:
FileRead, Clipboard, *c H:\Docketing\Exception List.xls\
return

GuiClose:
ExitApp
return
