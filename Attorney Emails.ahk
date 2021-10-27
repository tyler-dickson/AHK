#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^-::
                          ;https://autohotkey.com/docs/commands/StringSplit.htm
SendInput ^c
Sleep 200
TestString = %Clipboard%
MsgBox, %TestString%
StringReplace, TestString, TestString, `- , , All ; Omits periods.
StringReplace, TestString, TestString, %A_Space% , , All ; Omits periods.
MsgBox, %TestString%
StringSplit, TestString, TestString, `, , . ; Omits periods.

StringLeft, AttyString1, TestString1,   3  ; Stores first three characters.
StringLeft, AttyString2, TestString2,   3  ; Stores first three characters.
StringLeft, AttyString3, TestString3,   3  ; Stores first three characters.
StringLeft, AttyString4, TestString4,   3  ; Stores first three characters.
StringLeft, AttyString5, TestString5,   3  ; Stores first three characters.
StringLeft, AttyString6, TestString6,   3  ; Stores first three characters.
StringLeft, AttyString7, TestString7,   3  ; Stores first three characters.
StringLeft, AttyString8, TestString8,   3  ; Stores first three characters.
StringLeft, AttyString9, TestString9,   3  ; Stores first three characters.
StringLeft, AttyString10, TestString10, 3  ; Stores first three characters.




AttorneyEmails = %AttyString1% %AttyString2% %AttyString3% %AttyString4% %AttyString5% %AttyString6% %AttyString7% %AttyString8% %AttyString9% %AttyString10%

MsgBox, %AttorneyEmails%
;MsgBox, 2%AttyString1%2%AttyString2%2%AttyString3%2%AttyString4%`n`n Copying to clipboard...
Clipboard = %AttorneyEmails%



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