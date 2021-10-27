#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#CapsLock::             ;https://autohotkey.com/docs/commands/StringSplit.htm                   
SendInput ^c
Sleep 200
TestString = %Clipboard%
StringReplace, TestString, TestString, `- , , All ; Omits periods.
StringReplace, TestString, TestString, %A_Space% , , All ; Omits periods.
StringSplit, TestString, TestString, `, , . ; Omits periods.

Check1 = 1
Check2 = 2 
Check3 = 3 
Check4 = 4 
Check5 = 5 
Check6 = 6 
Check7 = 7 
Check8 = 8 
Check9 = 9 
Check10 = 10 

StringLeft, AttyString0, TestString0, 3  ; Stores first three characters.
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

IniRead, AttyTest1, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString1%
IniRead, AttyTest2, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString2%
IniRead, AttyTest3, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString3%
IniRead, AttyTest4, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString4%
IniRead, AttyTest5, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString5%
IniRead, AttyTest6, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString6%
IniRead, AttyTest7, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString7%
IniRead, AttyTest8, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString8%
IniRead, AttyTest9, C:\Users\tbone\Desktop\Attorneys.ini,  Attorneys, %AttyString9%
IniRead, AttyTest10, C:\Users\tbone\Desktop\Attorneys.ini, Attorneys, %AttyString10%

MsgBox, %AttyString0%            ; this equals 4 right now.

if Check1 <= AttyString0 && AttyTest1 = ERROR
	AttyTest1 = %AttyString1%
else
	return

if Check2 <= AttyString0 && AttyTest2 = ERROR
	AttyTest2 = %AttyString2%
else
	return	
	
if Check3 <= AttyString0 && AttyTest3 = ERROR
	AttyTest3 = %AttyString3%
else
	return	

if Check4 <= AttyString0 && AttyTest4 = ERROR
	AttyTest4 = %AttyString4%
else
	return	
	
if Check5 <= AttyString0 && AttyTest5 = ERROR
	AttyTest5 = %AttyString5%
else
	return
	
MsgBox %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%
return	
	
	
/*
if Check2 <= AttyString0
     {
     if AttyTest2 = ERROR
          AttyTest2 = %AttyString2%
	 else{}
	 }
else
	return
	
if Check3 <= AttyString0
     {
     if AttyTest3 = ERROR
          AttyTest3 = %AttyString3%
	 else{}
	 }
else
	return

if Check4 <= AttyString0
     {
     if AttyTest4 = ERROR
          AttyTest4 = %AttyString4%
	 else{}
	 }
else
	return
	
if Check5 <= AttyString0
     {
     if AttyTest5 = ERROR
		  AttyTest5 = %AttyString5%
	 else
	      StringLeft, AttyTest5, AttyTest5, 0 ; Stores zero characters.
	 }
else
	return
*/

;MsgBox, %AttyString1% %AttyString2% %AttyString3% %AttyString4% %AttyString5% 
MsgBox %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5% 



;AttorneyEmails = %AttyString1% %AttyString2% %AttyString3% %AttyString4% %AttyString5% 

;MsgBox, %AttorneyEmails%
;MsgBox, 2%AttyString1%2%AttyString2%2%AttyString3%2%AttyString4%`n`n Copying to clipboard...
;Clipboard = %AttorneyEmails%



Return

/*
Colors = red,green,blue
StringSplit, ColorArray, Colors, `,
Loop, %ColorArray0%
{
    this_color := ColorArray%a_index%
    MsgBox, Color number %a_index% is %this_color%.
}
*/