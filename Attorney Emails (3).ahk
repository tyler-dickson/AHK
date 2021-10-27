#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^-::                            
SendInput ^c
Sleep 200
TestString = %Clipboard%
StringReplace, TestString, TestString, `- , , All                                        ; Removes all dashes.
StringReplace, TestString, TestString, `r`n, `, , All                                    ; Removes all hard returns. 
StringReplace, TestString, TestString, %A_Space% , , All ; Omits periods.                ; Removes all spaces, replaces with commas.
StringSplit, TestString, TestString, `, , . ; Omits periods.                             ; Splits into array at commas.

StringLeft, AttyString0, TestString0, 3  ; Stores first three characters.                ; Stores first three characters of string.
StringLeft, AttyString1, TestString1, 3  ; Stores first three characters.
StringLeft, AttyString2, TestString2, 3  ; Stores first three characters.
StringLeft, AttyString3, TestString3, 3  ; Stores first three characters.
StringLeft, AttyString4, TestString4, 3  ; Stores first three characters.
StringLeft, AttyString5, TestString5, 3  ; Stores first three characters.
StringLeft, AttyString6, TestString6, 3  ; Stores first three characters.
StringLeft, AttyString7, TestString7, 3  ; Stores first three characters.
StringLeft, AttyString8, TestString8, 3  ; Stores first three characters.
StringLeft, AttyString9, TestString9, 3  ; Stores first three characters.
StringLeft, AttyString10, TestString10,3 ; Stores first three characters.

IniRead, AttyTest1, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString1%      ; Compares attorney to .ini file.
IniRead, AttyTest2, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString2%
IniRead, AttyTest3, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString3%
IniRead, AttyTest4, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString4%
IniRead, AttyTest5, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString5%
IniRead, AttyTest6, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString6%
IniRead, AttyTest7, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString7%
IniRead, AttyTest8, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString8%
IniRead, AttyTest9, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString9%
IniRead, AttyTest10, C:\Users\tbone\Desktop\Attorneys.ini, Attorneys, %AttyString10%

if AttyTest1 = Error                  ; If attorney is not an irregular one, sets AttyTest to 2aty team.
     AttyTest1 = 2%AttyString1%             
if AttyTest2 = Error
     AttyTest2 = 2%AttyString2%
if AttyTest3 = Error
     AttyTest3 = 2%AttyString3%	 
if AttyTest4 = Error
     AttyTest4 = 2%AttyString4%	 
if AttyTest5 = Error
     AttyTest5 = 2%AttyString5%	 	 
if AttyTest6 = Error
     AttyTest6 = 2%AttyString6%	 
if AttyTest7 = Error
     AttyTest7 = 2%AttyString7%	 
if AttyTest8 = Error
     AttyTest8 = 2%AttyString8%	 
if AttyTest9 = Error
     AttyTest9 = 2%AttyString9%	 
if AttyTest10 = Error
     AttyTest10 = 2%AttyString10%	
	 
StringLen, Atty1Len, AttyTest1      ; Gets the length of each string of the array.
StringLen, Atty2Len, AttyTest2
StringLen, Atty3Len, AttyTest3
StringLen, Atty4Len, AttyTest4
StringLen, Atty5Len, AttyTest5
StringLen, Atty6Len, AttyTest6
StringLen, Atty7Len, AttyTest7
StringLen, Atty8Len, AttyTest8
StringLen, Atty9Len, AttyTest9
StringLen, Atty10Len, AttyTest10

if Atty1Len > 30                    ; If string is greater than 30 characters, meaning a blank array, sets array to blank.
	AttyTest1 = ;
if Atty2Len > 30
	AttyTest2 = ;	
if Atty3Len > 30
	AttyTest3 = ;
if Atty4Len > 30
	AttyTest4 = ;
if Atty5Len > 30
	AttyTest5 = ;
if Atty6Len > 30
	AttyTest6 = ;
if Atty7Len > 30
	AttyTest7 = ;
if Atty8Len > 30
	AttyTest8 = ;
if Atty9Len > 30
	AttyTest9 = ;	
if Atty10Len > 30
	AttyTest10 = ;

MsgBox Copied to clipboard. `n Paste into CC field, then drag Working/IPP/TMPL as needed. `n`n%AttyTest1%`n%AttyTest2%`n%AttyTest3%`n%AttyTest4%`n%AttyTest5%`n%AttyTest6%`n%AttyTest7%`n%AttyTest8%`n%AttyTest9%`n%AttyTest10%
Clipboard = %AttyTest1%`n%AttyTest2%`n%AttyTest3%`n%AttyTest4%`n%AttyTest5%`n%AttyTest6%`n%AttyTest7%`n%AttyTest8%`n%AttyTest9%`n%AttyTest10%

Return
