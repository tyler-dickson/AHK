#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#^CapsLock::

SendInput ^c
Sleep 200
TestString = %Clipboard%
Sleep 200
MsgBox %TestString%


StringReplace, TestString, TestString, `r`n, `, , All
StringReplace, TestString, TestString, %A_Space% , , All ; Omits periods.
StringSplit, TestString, TestString, `, , . ; Omits periods.

StringLeft, AttyString0, TestString0, 3  ; Stores first three characters.
StringLeft, AttyString1, TestString1, 3  ; Stores first three characters.
StringLeft, AttyString2, TestString2, 3  ; Stores first three characters.
StringLeft, AttyString3, TestString3, 3  ; Stores first three characters.
StringLeft, AttyString4, TestString4, 3  ; Stores first three characters.
StringLeft, AttyString5, TestString5, 3  ; Stores first three characters.
StringLeft, AttyString6, TestString6, 3  ; Stores first three characters.

MsgBox, %AttyTest1%, %AttyTest2%, %AttyTest3%, %AttyTest4%, %AttyTest5%
return	

;StringReplace, TestString, TestString, %A_Space% , , All ; Omits periods.
;StringSplit, TestString, TestString, `, , . ; Omits periods.

; AXD   Working  
; ASA   Billing  
; EOV   IPP  
