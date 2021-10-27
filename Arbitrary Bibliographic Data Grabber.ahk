#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, Shell32.dll, 36


formattime, Today, , MMddyy          ; yyyy-MM-dd
Gui, New, , Arbitrary Bibliographic Data Grabber
Gui, Add, Edit, Center x10 y30 w150 h315 gBackEnd vBackEnd,
Gui, Font, s11 
Gui, Add, Edit, Center x10 y5 w150 h25 ReadOnly vNumberOfCodes, 0
;Gui, Add, ListView, x315 y5 w782 h340 Checked Right Grid vLoadedFiles , Client Code                   |-----------------------------|
Gui, Add, ListView, x315 y5 w270 h340 Checked Right Grid vLoadedFiles , Client Code                   |-----------------------------|
Gui, Add, ActiveX, x0 y450 w650 h0 vie, Shell.Explorer  ; The final parameter is the name of the ActiveX component.
ie.Navigate("http://kmobnetold/outsidekmobnet/cid/cidold/ClientList.aspx")  ; This is specific to the web browser control.
Gui, Font, s9
Gui, Add, DropDownList, Sort Center x190 y125 w120 gUpdateCol vSearchField  R50, -----------------------------||Case Number:|Country:|NP Instr. Date:|Application Number:|Patent Number:|Publication Number:|Entity:|Client:|Tax Due Date:|Case Type:|Filing Date:|Issued Date:|PublicationDate:|AbandonedDate:|Prosecuting:|Priority Number:|Priority Date:|Assignee:|Applicant:|Inventors:|Title:|Remarks:|Sub Case:|Status:|Expir. Date:|Agent:|Agent Ref:|BarCodeDate:|Tax Start Date:|Confirmation No.:|Client's Ref. No:|Art Unit.:|Examiner:|Invention Attorney(s):|User ID:|Date Created:|Last Update:
Gui, Add, DropDownList, Sort Center xp yp+22 wp gUpdateCol vSearchField2   R50, -----------------------------||Case Number:|Country:|NP Instr. Date:|Application Number:|Patent Number:|Publication Number:|Entity:|Client:|Tax Due Date:|Case Type:|Filing Date:|Issued Date:|PublicationDate:|AbandonedDate:|Prosecuting:|Priority Number:|Priority Date:|Assignee:|Applicant:|Inventors:|Title:|Remarks:|Sub Case:|Status:|Expir. Date:|Agent:|Agent Ref:|BarCodeDate:|Tax Start Date:|Confirmation No.:|Client's Ref. No:|Art Unit.:|Examiner:|Invention Attorney(s):|User ID:|Date Created:|Last Update:
Gui, Add, DropDownList, Sort Center xp yp+22 wp gUpdateCol vSearchField3   R50, -----------------------------||Case Number:|Country:|NP Instr. Date:|Application Number:|Patent Number:|Publication Number:|Entity:|Client:|Tax Due Date:|Case Type:|Filing Date:|Issued Date:|PublicationDate:|AbandonedDate:|Prosecuting:|Priority Number:|Priority Date:|Assignee:|Applicant:|Inventors:|Title:|Remarks:|Sub Case:|Status:|Expir. Date:|Agent:|Agent Ref:|BarCodeDate:|Tax Start Date:|Confirmation No.:|Client's Ref. No:|Art Unit.:|Examiner:|Invention Attorney(s):|User ID:|Date Created:|Last Update:
Gui, Add, DropDownList, Sort Center xp yp+22 wp gUpdateCol vSearchField4   R50, -----------------------------||Case Number:|Country:|NP Instr. Date:|Application Number:|Patent Number:|Publication Number:|Entity:|Client:|Tax Due Date:|Case Type:|Filing Date:|Issued Date:|PublicationDate:|AbandonedDate:|Prosecuting:|Priority Number:|Priority Date:|Assignee:|Applicant:|Inventors:|Title:|Remarks:|Sub Case:|Status:|Expir. Date:|Agent:|Agent Ref:|BarCodeDate:|Tax Start Date:|Confirmation No.:|Client's Ref. No:|Art Unit.:|Examiner:|Invention Attorney(s):|User ID:|Date Created:|Last Update:
Gui, Add, DropDownList, Sort Center xp yp+22 wp gUpdateCol vSearchField5   R50, -----------------------------||Case Number:|Country:|NP Instr. Date:|Application Number:|Patent Number:|Publication Number:|Entity:|Client:|Tax Due Date:|Case Type:|Filing Date:|Issued Date:|PublicationDate:|AbandonedDate:|Prosecuting:|Priority Number:|Priority Date:|Assignee:|Applicant:|Inventors:|Title:|Remarks:|Sub Case:|Status:|Expir. Date:|Agent:|Agent Ref:|BarCodeDate:|Tax Start Date:|Confirmation No.:|Client's Ref. No:|Art Unit.:|Examiner:|Invention Attorney(s):|User ID:|Date Created:|Last Update:
Gui, Add, DropDownList, Sort Center xp yp+22 wp gUpdateCol vSearchField6   R50, -----------------------------||Case Number:|Country:|NP Instr. Date:|Application Number:|Patent Number:|Publication Number:|Entity:|Client:|Tax Due Date:|Case Type:|Filing Date:|Issued Date:|PublicationDate:|AbandonedDate:|Prosecuting:|Priority Number:|Priority Date:|Assignee:|Applicant:|Inventors:|Title:|Remarks:|Sub Case:|Status:|Expir. Date:|Agent:|Agent Ref:|BarCodeDate:|Tax Start Date:|Confirmation No.:|Client's Ref. No:|Art Unit.:|Examiner:|Invention Attorney(s):|User ID:|Date Created:|Last Update:
Gui, Add, DropDownList, Sort Center xp yp+22 wp gUpdateCol vSearchField7   R50, -----------------------------||Case Number:|Country:|NP Instr. Date:|Application Number:|Patent Number:|Publication Number:|Entity:|Client:|Tax Due Date:|Case Type:|Filing Date:|Issued Date:|PublicationDate:|AbandonedDate:|Prosecuting:|Priority Number:|Priority Date:|Assignee:|Applicant:|Inventors:|Title:|Remarks:|Sub Case:|Status:|Expir. Date:|Agent:|Agent Ref:|BarCodeDate:|Tax Start Date:|Confirmation No.:|Client's Ref. No:|Art Unit.:|Examiner:|Invention Attorney(s):|User ID:|Date Created:|Last Update:
Gui, Add, DropDownList, Sort Center xp yp+22 wp gUpdateCol vSearchField8   R50, -----------------------------||Case Number:|Country:|NP Instr. Date:|Application Number:|Patent Number:|Publication Number:|Entity:|Client:|Tax Due Date:|Case Type:|Filing Date:|Issued Date:|PublicationDate:|AbandonedDate:|Prosecuting:|Priority Number:|Priority Date:|Assignee:|Applicant:|Inventors:|Title:|Remarks:|Sub Case:|Status:|Expir. Date:|Agent:|Agent Ref:|BarCodeDate:|Tax Start Date:|Confirmation No.:|Client's Ref. No:|Art Unit.:|Examiner:|Invention Attorney(s):|User ID:|Date Created:|Last Update:
Gui, Add, DropDownList, Sort Center xp yp+22 wp gUpdateCol vSearchField9   R50, -----------------------------||Case Number:|Country:|NP Instr. Date:|Application Number:|Patent Number:|Publication Number:|Entity:|Client:|Tax Due Date:|Case Type:|Filing Date:|Issued Date:|PublicationDate:|AbandonedDate:|Prosecuting:|Priority Number:|Priority Date:|Assignee:|Applicant:|Inventors:|Title:|Remarks:|Sub Case:|Status:|Expir. Date:|Agent:|Agent Ref:|BarCodeDate:|Tax Start Date:|Confirmation No.:|Client's Ref. No:|Art Unit.:|Examiner:|Invention Attorney(s):|User ID:|Date Created:|Last Update:
Gui, Add, DropDownList, Sort Center xp yp+22 wp gUpdateCol vSearchField10  R50, -----------------------------||Case Number:|Country:|NP Instr. Date:|Application Number:|Patent Number:|Publication Number:|Entity:|Client:|Tax Due Date:|Case Type:|Filing Date:|Issued Date:|PublicationDate:|AbandonedDate:|Prosecuting:|Priority Number:|Priority Date:|Assignee:|Applicant:|Inventors:|Title:|Remarks:|Sub Case:|Status:|Expir. Date:|Agent:|Agent Ref:|BarCodeDate:|Tax Start Date:|Confirmation No.:|Client's Ref. No:|Art Unit.:|Examiner:|Invention Attorney(s):|User ID:|Date Created:|Last Update:
Gui, Font, s11 
Gui, Add, Text, Center x164 y127 w20, #1:
Gui, Add, Text, Center xp yp+22  wp, #2:
Gui, Add, Text, Center xp yp+22  wp, #3:
Gui, Add, Text, Center xp yp+22  wp, #4:
Gui, Add, Text, Center xp yp+22  wp, #5:
Gui, Add, Text, Center xp yp+22  wp, #6:
Gui, Add, Text, Center xp yp+22  wp, #7:
Gui, Add, Text, Center xp yp+22  wp, #8:
Gui, Add, Text, Center xp yp+22  wp, #9:
Gui, Add, Text, Center xp yp+22  wp, #10:
Gui, Add, Radio, x163 y10  Group Checked vPatOrTM gPatToTM, Patent
Gui, Add, Radio, xp+62 yp  gPatToTM, Trademark

global Columns := LV_GetCount("Column")

Gui, Add, Button, x165 yp+23 w145 h25 gAppend, Grab Info
Gui, Add, Button, xp yp+28   wp   hp  gExport, Export Data

Gui, Add, Edit, Center xp yp+22 w50 h0, % " "
Gui, Add, UpDown, horz gAddSearch vMyUpDown Range2-11 w145 h31, %Columns%

Menu, FileMenu, Add, Grab Info, MenuHandler
Menu, FileMenu, Add, Export, MenuHandler
Menu, FileMenu, Icon, Grab Info, %A_AhkPath%, -206 ; Use icon with resource identifier 206
Menu, FileMenu, Icon, Export, %A_AhkPath%, -207 ; Use icon with resource identifier 207

Menu, MyMenuBar, Add, Options, :FileMenu


Gui, Menu, MyMenuBar


TempCounter = 2
Loop 9
{
GuiControl, Hide, % "ComboBox" TempCounter
GuiControl, Hide, % "Static" TempCounter
TempCounter++
}

gosub PatToTM
Gui, Show, w595 h350
return


MenuHandler:
MsgBox, %A_ThisMenuItem% 
return


AddSearch:
Gui, Submit, NoHide
TotalColumns := LV_GetCount("Column")
if (MyUpDown == 1)
	return
else if (MyUpDown == TotalColumns)
	return
else if (MyUpDown > TotalColumns)
	{
	GuiControlGet, Position, Pos, LoadedFiles
	PositionW += 128
	GuiControl, Move, LoadedFiles, % "w" PositionW
	WinGetPos, , , GUIWidth, , Arbitrary Bibliographic Data Grabber,
	GUIWidth += 122
	GuiControl, Show, % "ComboBox" TotalColumns
	GuiControl, Show, % "Static" TotalColumns
	LV_InsertCol(10000, AutoHdr, "-----------------------------" )
	Gui, Show, w%GUIWidth%
	}
else
	{
	LV_DeleteCol(LV_GetCount("Column"))
	TotalColumns := LV_GetCount("Column")
	GuiControlGet, Position, Pos, LoadedFiles
	PositionW -= 128
	GuiControl, Move, LoadedFiles, % "w" PositionW
	WinGetPos, , , GUIWidth, , Arbitrary Bibliographic Data Grabber,
	GUIWidth -= 134
	GuiControl, Hide, % "ComboBox" TotalColumns
	GuiControl, Hide, % "Static" TotalColumns
	
	if PatOrTM = 1	
		GuiControl, , % "ComboBox" TotalColumns, |-----------------------------||Case Number:|Country:|NP Instr. Date:|Application Number:|Patent Number:|Publication Number:|Entity:|Client:|Tax Due Date:|Case Type:|Filing Date:|Issued Date:|PublicationDate:|AbandonedDate:|Prosecuting:|Priority Number:|Priority Date:|Assignee:|Applicant:|Inventors:|Title:|Remarks:|Sub Case:|Status:|Expir. Date:|Agent:|Agent Ref:|BarCodeDate:|Tax Start Date:|Confirmation No.:|Client's Ref. No:|Art Unit.:|Examiner:|Invention Attorney(s):|User ID:|Date Created:|Last Update:
	else if PatOrTM = 2	
		GuiControl, , % "ComboBox" TotalColumns, |-----------------------------||Case Number:|Class:|Goods:|Country:|Application Number:|Filing Date:|Publication Number:|PublicationDate:|Priority Date:|Date Created:|Status:|Mark:|Attorneys:
		
	Gui, Show, w%GUIWidth%
	}
return


UpdateCol:
Gui, Submit, NoHide
LV_Delete()
LV_ModifyCol(2,  , SearchField)
LV_ModifyCol(3,  , SearchField2)
LV_ModifyCol(4,  , SearchField3)
LV_ModifyCol(5,  , SearchField4)
LV_ModifyCol(6,  , SearchField5)
LV_ModifyCol(7,  , SearchField6)
LV_ModifyCol(8,  , SearchField7)
LV_ModifyCol(9,  , SearchField8)
LV_ModifyCol(10, , SearchField9)
LV_ModifyCol(11, , SearchField10)
return

PatToTM:
Gui, Submit, NoHide
if PatOrTM = 1
	{
	Loop 10
		GuiControl, , % "ComboBox" A_Index, |-----------------------------||Case Number:|Country:|NP Instr. Date:|Application Number:|Patent Number:|Publication Number:|Entity:|Client:|Tax Due Date:|Case Type:|Filing Date:|Issued Date:|PublicationDate:|AbandonedDate:|Prosecuting:|Priority Number:|Priority Date:|Assignee:|Applicant:|Inventors:|Title:|Remarks:|Sub Case:|Status:|Expir. Date:|Agent:|Agent Ref:|BarCodeDate:|Tax Start Date:|Confirmation No.:|Client's Ref. No:|Art Unit.:|Examiner:|Invention Attorney(s):|User ID:|Date Created:|Last Update:
	}
else if PatOrTM = 2
	{
	Loop 10
		GuiControl, , % "ComboBox" A_Index, |-----------------------------||Case Number:|Class:|Goods:|Country:|Application Number:|Filing Date:|Publication Number:|PublicationDate:|Priority Date:|Date Created:|Status:|Mark:|Attorneys:
	}
gosub UpdateCol
return

BackEnd:
GuiControlGet, Edit1Status, , Edit1
StringSplit, Edit1Status, Edit1Status, `n, 
GuiControl, , Edit2, %Edit1Status0%
return

Append:
Gui, Submit, NoHide
StringSplit, BackEnd, BackEnd, `n, , 
LV_Delete()
Sleep 1000
Loop %BackEnd0%
{
if PatOrTM = 1
	Website := "http://kmobnet/insidekmobnet/Patent_TM_Reports/facesheet.cfm?&casenumber=" . BackEnd%A_Index%
if PatOrTM = 2 
	Website := "http://kmobnet/insidekmobnet/Patent_TM_Reports/TMfacesheet.cfm?&casenumber=" . BackEnd%A_Index% . "&country="
params := [Website, 64]
ie.Navigate(params*)	
Sleep 500
Info := ""
BaseNumber := ""
Data1 := ""
Data2 := ""
Data3 := ""
Data4 := ""
Data5 := ""
Data6 := ""
Data7 := ""
Data8 := ""
Data9 := ""
Data10 := ""

if PatOrTM = 1
	{
	var := ie.LocationURL ;grab current url	
	Var2 := ie.document.GetElementsByTagName("TD").length
	
	if SearchField != -----------------------------
		{
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField
				{
				BaseNumber := A_Index - 1
				break
				}
			}
			Data1 := StrReplace(ie.document.GetElementsByTagName("TD")[BaseNumber].InnerText, SearchField, "")
		}
	if SearchField2 != -----------------------------
		{		
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField2
				{
				BaseNumber := A_Index - 1
				break
				}
			}		
			Data2 := StrReplace(ie.document.GetElementsByTagName("TD")[BaseNumber].InnerText, SearchField2, "")
		}

	if SearchField3 != -----------------------------
		{		
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField3
				{
				BaseNumber := A_Index - 1
				break
				}
			}		
			Data3 := StrReplace(ie.document.GetElementsByTagName("TD")[BaseNumber].InnerText, SearchField3, "")
		}

	if SearchField4 != -----------------------------
		{		
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField4
				{
				BaseNumber := A_Index - 1
				break
				}
			}		
			Data4 := StrReplace(ie.document.GetElementsByTagName("TD")[BaseNumber].InnerText, SearchField4, "")
		}

	if SearchField5 != -----------------------------
		{		
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField5
				{
				BaseNumber := A_Index - 1
				break
				}
			}
			Data5 := StrReplace(ie.document.GetElementsByTagName("TD")[BaseNumber].InnerText, SearchField5, "")
		}

	if SearchField6 != -----------------------------
		{		
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField6
				{
				BaseNumber := A_Index - 1
				break
				}
			}
			Data6 := StrReplace(ie.document.GetElementsByTagName("TD")[BaseNumber].InnerText, SearchField6, "")
		}

	if SearchField7 != -----------------------------
		{		
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField7
				{
				BaseNumber := A_Index - 1
				break
				}
			}
			Data7 := StrReplace(ie.document.GetElementsByTagName("TD")[BaseNumber].InnerText, SearchField7, "")
		}

	if SearchField8 != -----------------------------
		{		
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField8
				{
				BaseNumber := A_Index - 1
				break
				}
			}
			Data8 := StrReplace(ie.document.GetElementsByTagName("TD")[BaseNumber].InnerText, SearchField8, "")
		}

	if SearchField9 != -----------------------------
		{		
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField9
				{
				BaseNumber := A_Index - 1
				break
				}
			}
			Data9 := StrReplace(ie.document.GetElementsByTagName("TD")[BaseNumber].InnerText, SearchField9, "")
		}

	if SearchField10 != -----------------------------
		{		
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField10
				{
				BaseNumber := A_Index - 1
				break
				}
			}
			Data10 := StrReplace(ie.document.GetElementsByTagName("TD")[BaseNumber].InnerText, SearchField10, "")
		}
		
		LV_Add("", BackEnd%A_Index%, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10)
	}
	

else if PatOrTM = 2
	{
	var := ie.LocationURL ;grab current url	
	Var2 := ie.document.GetElementsByTagName("TD").length
	
	if SearchField != -----------------------------
		{	
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField
				{
				StringSplit, SplitInfo, NewInfo, `r`n
				Loop %SplitInfo0%
					{
					ifinstring, SplitInfo%A_Index%, % SearchField
						{
						Data1 := Trim(SplitInfo%A_Index%)
						Data1 := StrReplace(Data1, SearchField, "")
						
						if SearchField = Attorneys:
							{
							Data1 := ""
							Atty1 := A_Index + 2
							Atty2 := A_Index + 4		
							Atty3 := A_Index + 6	
							Atty4 := A_Index + 8		
							Atty5 := A_Index + 10								
							Atty6 := A_Index + 12	
							Atty7 := A_Index + 14	
							Atty8 := A_Index + 16							
							Attorneys := [SplitInfo%Atty1%, SplitInfo%Atty2%, SplitInfo%Atty3%, SplitInfo%Atty4%, SplitInfo%Atty5%, SplitInfo%Atty6%, SplitInfo%Atty7%, SplitInfo%Atty8%]
							
							for names in Attorneys
								{
								Temp := Attorneys[names]
								
								if Data1 =
									Data1 := Temp 								
								else ifnotinstring, Temp, Status
									Data1 := Data1 ", " Temp 
								else
									break
								}
							}
						break
						}
					}
				}
			}
		}
	
		if SearchField2 != -----------------------------
		{	
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField2
				{
				StringSplit, SplitInfo, NewInfo, `r`n
				Loop %SplitInfo0%
					{
					ifinstring, SplitInfo%A_Index%, % SearchField2
						{
						Data2 := Trim(SplitInfo%A_Index%)
						Data2 := StrReplace(Data2, SearchField2, "")
						
						if SearchField2 = Attorneys:
							{
							Data2 := ""
							Atty1 := A_Index + 2
							Atty2 := A_Index + 4		
							Atty3 := A_Index + 6	
							Atty4 := A_Index + 8		
							Atty5 := A_Index + 10								
							Atty6 := A_Index + 12	
							Atty7 := A_Index + 14	
							Atty8 := A_Index + 16							
							Attorneys := [SplitInfo%Atty1%, SplitInfo%Atty2%, SplitInfo%Atty3%, SplitInfo%Atty4%, SplitInfo%Atty5%, SplitInfo%Atty6%, SplitInfo%Atty7%, SplitInfo%Atty8%]
							
							for names in Attorneys
								{
								Temp := Attorneys[names]
								
								if Data2 =
									Data2 := Temp 								
								else ifnotinstring, Temp, Status
									Data2 := Data2 ", " Temp 
								else
									break
								}
							}
						break
						}
					}
				}
			}
		}
	
		if SearchField3 != -----------------------------
		{	
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField3
				{
				StringSplit, SplitInfo, NewInfo, `r`n
				Loop %SplitInfo0%
					{
					ifinstring, SplitInfo%A_Index%, % SearchField3
						{
						Data3 := Trim(SplitInfo%A_Index%)
						Data3 := StrReplace(Data3, SearchField3, "")
						
						if SearchField3 = Attorneys:
							{
							Data3 := ""
							Atty1 := A_Index + 2
							Atty2 := A_Index + 4		
							Atty3 := A_Index + 6	
							Atty4 := A_Index + 8		
							Atty5 := A_Index + 10								
							Atty6 := A_Index + 12	
							Atty7 := A_Index + 14	
							Atty8 := A_Index + 16							
							Attorneys := [SplitInfo%Atty1%, SplitInfo%Atty2%, SplitInfo%Atty3%, SplitInfo%Atty4%, SplitInfo%Atty5%, SplitInfo%Atty6%, SplitInfo%Atty7%, SplitInfo%Atty8%]
							
							for names in Attorneys
								{
								Temp := Attorneys[names]
								
								if Data3 =
									Data3 := Temp 								
								else ifnotinstring, Temp, Status
									Data3 := Data3 ", " Temp 
								else
									break
								}
							}
						break
						}
					}
				}
			}
		}
	
		if SearchField4 != -----------------------------
		{	
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField4
				{
				StringSplit, SplitInfo, NewInfo, `r`n
				Loop %SplitInfo0%
					{
					ifinstring, SplitInfo%A_Index%, % SearchField4
						{
						Data4 := Trim(SplitInfo%A_Index%)
						Data4 := StrReplace(Data4, SearchField4, "")
						
						if SearchField4 = Attorneys:
							{
							Data4 := ""
							Atty1 := A_Index + 2
							Atty2 := A_Index + 4		
							Atty3 := A_Index + 6	
							Atty4 := A_Index + 8		
							Atty5 := A_Index + 10								
							Atty6 := A_Index + 12	
							Atty7 := A_Index + 14	
							Atty8 := A_Index + 16							
							Attorneys := [SplitInfo%Atty1%, SplitInfo%Atty2%, SplitInfo%Atty3%, SplitInfo%Atty4%, SplitInfo%Atty5%, SplitInfo%Atty6%, SplitInfo%Atty7%, SplitInfo%Atty8%]
							
							for names in Attorneys
								{
								Temp := Attorneys[names]
								
								if Data4 =
									Data4 := Temp 								
								else ifnotinstring, Temp, Status
									Data4 := Data4 ", " Temp 
								else
									break
								}
							}
						break
						}
					}
				}
			}
		}
	
		if SearchField5 != -----------------------------
		{	
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField5
				{
				StringSplit, SplitInfo, NewInfo, `r`n
				Loop %SplitInfo0%
					{
					ifinstring, SplitInfo%A_Index%, % SearchField5
						{
						Data5 := Trim(SplitInfo%A_Index%)
						Data5 := StrReplace(Data5, SearchField5, "")
						
						if SearchField5 = Attorneys:
							{
							Data5 := ""
							Atty1 := A_Index + 2
							Atty2 := A_Index + 4		
							Atty3 := A_Index + 6	
							Atty4 := A_Index + 8		
							Atty5 := A_Index + 10								
							Atty6 := A_Index + 12	
							Atty7 := A_Index + 14	
							Atty8 := A_Index + 16							
							Attorneys := [SplitInfo%Atty1%, SplitInfo%Atty2%, SplitInfo%Atty3%, SplitInfo%Atty4%, SplitInfo%Atty5%, SplitInfo%Atty6%, SplitInfo%Atty7%, SplitInfo%Atty8%]
							
							for names in Attorneys
								{
								Temp := Attorneys[names]
								
								if Data5 =
									Data5 := Temp 								
								else ifnotinstring, Temp, Status
									Data5 := Data5 ", " Temp 
								else
									break
								}
							}
						break
						}
					}
				}
			}
		}
	
		if SearchField6 != -----------------------------
		{	
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField6
				{
				StringSplit, SplitInfo, NewInfo, `r`n
				Loop %SplitInfo0%
					{
					ifinstring, SplitInfo%A_Index%, % SearchField6
						{
						Data6 := Trim(SplitInfo%A_Index%)
						Data6 := StrReplace(Data6, SearchField6, "")
							
						if SearchField6 = Attorneys:
							{
							Data6 := ""
							Atty1 := A_Index + 2
							Atty2 := A_Index + 4		
							Atty3 := A_Index + 6	
							Atty4 := A_Index + 8		
							Atty5 := A_Index + 10								
							Atty6 := A_Index + 12	
							Atty7 := A_Index + 14	
							Atty8 := A_Index + 16							
							Attorneys := [SplitInfo%Atty1%, SplitInfo%Atty2%, SplitInfo%Atty3%, SplitInfo%Atty4%, SplitInfo%Atty5%, SplitInfo%Atty6%, SplitInfo%Atty7%, SplitInfo%Atty8%]
							
							for names in Attorneys
								{
								Temp := Attorneys[names]
								
								if Data6 =
									Data6 := Temp 								
								else ifnotinstring, Temp, Status
									Data6 := Data6 ", " Temp 
								else
									break
								}
							}
						break
						}
					}
				}
			}
		}
	
		if SearchField7 != -----------------------------
		{	
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField7
				{
				StringSplit, SplitInfo, NewInfo, `r`n
				Loop %SplitInfo0%
					{
					ifinstring, SplitInfo%A_Index%, % SearchField7
						{
						Data7 := Trim(SplitInfo%A_Index%)
						Data7 := StrReplace(Data7, SearchField7, "")
						
						if SearchField7 = Attorneys:
							{
							Data7 := ""
							Atty1 := A_Index + 2
							Atty2 := A_Index + 4		
							Atty3 := A_Index + 6	
							Atty4 := A_Index + 8		
							Atty5 := A_Index + 10								
							Atty6 := A_Index + 12	
							Atty7 := A_Index + 14	
							Atty8 := A_Index + 16							
							Attorneys := [SplitInfo%Atty1%, SplitInfo%Atty2%, SplitInfo%Atty3%, SplitInfo%Atty4%, SplitInfo%Atty5%, SplitInfo%Atty6%, SplitInfo%Atty7%, SplitInfo%Atty8%]
							
							for names in Attorneys
								{
								Temp := Attorneys[names]
								
								if Data7 =
									Data7 := Temp 								
								else ifnotinstring, Temp, Status
									Data7 := Data7 ", " Temp 
								else
									break
								}
							}
						break
						}
					}
				}
			}
		}
	
		if SearchField8 != -----------------------------
		{	
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField8
				{
				StringSplit, SplitInfo, NewInfo, `r`n
				Loop %SplitInfo0%
					{
					ifinstring, SplitInfo%A_Index%, % SearchField8
						{
						Data8 := Trim(SplitInfo%A_Index%)
						Data8 := StrReplace(Data8, SearchField8, "")
							
						if SearchField8 = Attorneys:
							{
							Data8 := ""
							Atty1 := A_Index + 2
							Atty2 := A_Index + 4		
							Atty3 := A_Index + 6	
							Atty4 := A_Index + 8		
							Atty5 := A_Index + 10								
							Atty6 := A_Index + 12	
							Atty7 := A_Index + 14	
							Atty8 := A_Index + 16							
							Attorneys := [SplitInfo%Atty1%, SplitInfo%Atty2%, SplitInfo%Atty3%, SplitInfo%Atty4%, SplitInfo%Atty5%, SplitInfo%Atty6%, SplitInfo%Atty7%, SplitInfo%Atty8%]
							
							for names in Attorneys
								{
								Temp := Attorneys[names]
								
								if Data8 =
									Data8 := Temp 								
								else ifnotinstring, Temp, Status
									Data8 := Data8 ", " Temp 
								else
									break
								}
							}
						break
						}
					}
				}
			}
		}
	
		if SearchField9 != -----------------------------
		{	
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField9
				{
				StringSplit, SplitInfo, NewInfo, `r`n
				Loop %SplitInfo0%
					{
					ifinstring, SplitInfo%A_Index%, % SearchField9
						{
						Data9 := Trim(SplitInfo%A_Index%)
						Data9 := StrReplace(Data9, SearchField9, "")
						
						if SearchField9 = Attorneys:
							{
							Data9 := ""
							Atty1 := A_Index + 2
							Atty2 := A_Index + 4		
							Atty3 := A_Index + 6	
							Atty4 := A_Index + 8		
							Atty5 := A_Index + 10								
							Atty6 := A_Index + 12	
							Atty7 := A_Index + 14	
							Atty8 := A_Index + 16							
							Attorneys := [SplitInfo%Atty1%, SplitInfo%Atty2%, SplitInfo%Atty3%, SplitInfo%Atty4%, SplitInfo%Atty5%, SplitInfo%Atty6%, SplitInfo%Atty7%, SplitInfo%Atty8%]
							
							for names in Attorneys
								{
								Temp := Attorneys[names]
								
								if Data9 =
									Data9 := Temp 								
								else ifnotinstring, Temp, Status
									Data9 := Data9 ", " Temp 
								else
									break
								}
							}
						break
						}
					}
				}
			}
		}
	
		if SearchField10 != -----------------------------
		{	
		Loop %Var2%
			{
			NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
			ifinstring, NewInfo, % SearchField10
				{
				StringSplit, SplitInfo, NewInfo, `r`n
				Loop %SplitInfo0%
					{
					ifinstring, SplitInfo%A_Index%, % SearchField10
						{
						Data10 := Trim(SplitInfo%A_Index%)
						Data10 := StrReplace(Data10, SearchField10, "")
						
						if SearchField10 = Attorneys:
							{
							Data10 := ""
							Atty1 := A_Index + 2
							Atty2 := A_Index + 4		
							Atty3 := A_Index + 6	
							Atty4 := A_Index + 8		
							Atty5 := A_Index + 10								
							Atty6 := A_Index + 12	
							Atty7 := A_Index + 14	
							Atty8 := A_Index + 16							
							Attorneys := [SplitInfo%Atty1%, SplitInfo%Atty2%, SplitInfo%Atty3%, SplitInfo%Atty4%, SplitInfo%Atty5%, SplitInfo%Atty6%, SplitInfo%Atty7%, SplitInfo%Atty8%]
							
							for names in Attorneys
								{
								Temp := Attorneys[names]
								
								if Data10 =
									Data10 := Temp 								
								else ifnotinstring, Temp, Status
									Data10 := Data10 ", " Temp 
								else
									break
								}
							}
						break
						}
					}
				}
			}
		}
		
	LV_Add("", BackEnd%A_Index%, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10)
	}
}
return

GuiClose:
ExitApp
return

Export:
NewFile := ""
Gui, Submit, NoHide

Loop 11
	{
	LV_GetText(Header%A_Index%,  0 , A_Index)
	;MsgBox, % Header%A_Index%
	}	
NewFile := Header1 "," Header2 "," Header3 "," Header4 "," Header5 "," Header6 "," Header7 "," Header8 "," Header9 "," Header10 "," Header11
	
Loop % LV_GetCount()
	{
	LV_GetText(Var1,  A_Index , 1)
	LV_GetText(Var2,  A_Index , 2)
	LV_GetText(Var3,  A_Index , 3)
	LV_GetText(Var4,  A_Index , 4)	
	LV_GetText(Var5,  A_Index , 5)
	LV_GetText(Var6,  A_Index , 6)
	LV_GetText(Var7,  A_Index , 7)
	LV_GetText(Var8,  A_Index , 8)
	LV_GetText(Var9,  A_Index , 9)	
	LV_GetText(Var10, A_Index , 10)
	LV_GetText(Var11, A_Index , 11)
	
	NewFile := NewFile "`n" Var1 "," Var2 "," Var3 "," Var4 "," Var5 "," Var6 "," Var7 "," Var8 "," Var9 "," Var10 "," Var11
	}

FileAppend, %NewFile%, % "C:\Users\" A_Username "\Desktop\Exported Data - " Today ".csv"
Sleep 3000
Run, % "C:\Users\" A_Username "\Desktop\Exported Data - " Today ".csv"

return

