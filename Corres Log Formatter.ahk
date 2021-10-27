#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, pifmgr.dll, 14

ActionArray := ["Certificate of Corporate Nationality"
,"Certificate of Recordal"
,"Communication Regarding Extension of Time Limit"
,"Design Grant"
,"EUIPO Watch Notice"
,"FAL - Patent Grant"
,"FAL - Signed Assignment"
,"FAL - Trademark Registration"
,"FAL Notification"
,"FAL re Design Grant"
,"FAL re Foreign Filing Receipt Assignment Application"
,"FAL re Recordal/Change of Address"
,"FAL re Renewal Reminder"
,"Foreign Filing Receipt Assignment Application"
,"Foreign Trademark Registration"
,"International Preliminary Report on Patentability (IPRP)"
,"International Preliminary Report on Patentability (IPRP)"
,"Invitation to Correct Declarations"
,"Invitation to Correct Defects"
,"Invitation to Correct Defects in the Demand"
,"Invitation to Correct Priority Claim"
,"Invitation to Furnish Sequence Listing"
,"Invitation to Pay Additional Search Fees"
,"Invitation to Pay Late Fees"
,"Invitation to Pay Prescribed Fees with Surcharge"
,"Invitation to Restrict or Pay Additional Fees"
,"Invitation to Submit Amendments"
,"IPEA Miscellaneous Request"
,"Letter re Madrid Int'l Certificate of Reg."
,"Madrid Certificate of Registration"
,"Madrid Trademark Correspondence"
,"Notice of Possible Opposition"
,"Notice of Threatened Opposition"
,"Notice of Transmittal of IPRP"
,"Notification Concerning Payment of Preliminary Exam Fees"
,"Notification of European Patent Application Number"
,"Notification of Transmission to the International Bureau and Invitation to Pay Fee"
,"Patent Grant"
,"Patent Grant Front Page"
,"Search Report/Written Opinion"
,"Signed Assignment"
,"Trademark Maintenance Notice"
,"Written Opinion of the Examining Authority"
,"Assignment Recordal"
,"Publication"
,"FAL - Publication"
,"Foreign Trademark Renewal"]

SometimesArray := ["Notification Concerning Payment of Prescribed Fee"
,"Miscellaneous Communication from the PCT Receiving Office"
,"Notification Concerning Priority Documents"
,"Miscellaneous Communication from the International Bureau"]

#3::
xl := ComObjActive("Excel.Application") 	; Gets a handle to the active microsoft excel application.[/color]
;xl.Range("C4").Select 						; Selects the cell C4.[/color]

TrueOrFalse := IsObject(xl)
offset = 3
if (TrueOrFalse == 1)
	{
	while (xl.Range("A" . A_Index + 3).Value != "") 
		offset++
	}

for action in ActionArray
	{
	Loop %offset%
		{
		temp := xl.Range("A" A_Index).Value

		ifinstring, temp, % ActionArray[action]
			{
			xl.Range("A" A_Index).Select
			xl.Selection.Font.Bold := True
			xl.Selection.Font.ColorIndex := 3  ; http://access-excel.tips/excel-vba-color-code-list/
			}

		}
	}
	
for action in SometimesArray
	{
	Loop %offset%
		{
		temp := xl.Range("A" A_Index).Value

		ifinstring, temp, % SometimesArray[action]
			{
			xl.Range("A" A_Index).Select
			xl.Selection.Interior.ColorIndex := 27
			}

		}
	}
	
Loop %offset%
{
xl.Range("A" A_Index).Select
cellColor := xl.Selection.Interior.ColorIndex

if (cellColor == 27)
	{
	MsgBox, 4, Is this one urgent? - Row %A_Index%, % xl.Range("A" A_Index).Value 
		{
		IfMsgBox, Yes
			{
			xl.Selection.Font.Bold := True
			xl.Selection.Font.ColorIndex := 3  ; http://access-excel.tips/excel-vba-color-code-list/		
			xl.Selection.Interior.ColorIndex := -4142
			}
		else IfMsgBox, No
			{
			xl.Selection.Font.Bold := False
			xl.Selection.Font.ColorIndex := 1  ; http://access-excel.tips/excel-vba-color-code-list/		
			xl.Selection.Interior.ColorIndex := -4142		
			}
		}
	}
}
