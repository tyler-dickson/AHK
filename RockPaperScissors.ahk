#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

Gui, New, AlwaysOnTop +ToolWindow, The Knobbe Martens AutoHotKey Rock Paper Scissors Battle Royale #1 - Submit for a chance to win $20!
Gui, Add, Listbox, y30 x10  w60 AltSubmit vChoice1,  Rock||Paper|Scissors
Gui, Add, ListBox, y30 x80  w60 AltSubmit vChoice2,  Rock||Paper|Scissors
Gui, Add, ListBox, y30 x150 w60 AltSubmit vChoice3,  Rock||Paper|Scissors
Gui, Add, ListBox, y30 x220 w60 AltSubmit vChoice4,  Rock||Paper|Scissors
Gui, Add, ListBox, y30 x290 w60 AltSubmit vChoice5,  Rock||Paper|Scissors
Gui, Add, ListBox, y30 x360 w60 AltSubmit vChoice6,  Rock||Paper|Scissors
Gui, Add, ListBox, y30 x430 w60 AltSubmit vChoice7,  Rock||Paper|Scissors
Gui, Add, ListBox, y30 x500 w60 AltSubmit vChoice8,  Rock||Paper|Scissors
Gui, Add, ListBox, y30 x570 w60 AltSubmit vChoice9,  Rock||Paper|Scissors
Gui, Add, ListBox, y30 x640 w60 AltSubmit vChoice10, Rock||Paper|Scissors
Gui, Add, Text, Center y10 x10  w60, Throw #1
Gui, Add, Text, Center y10 x80  w60, Throw #2
Gui, Add, Text, Center y10 x150 w60, Throw #3
Gui, Add, Text, Center y10 x220 w60, Throw #4
Gui, Add, Text, Center y10 x290 w60, Throw #5
Gui, Add, Text, Center y10 x360 w60, Throw #6
Gui, Add, Text, Center y10 x430 w60, Throw #7
Gui, Add, Text, Center y10 x500 w60, Throw #8
Gui, Add, Text, Center y10 x570 w60, Throw #9
Gui, Add, Text, Center y10 x640 w60, Throw #10
Gui, Add, Button, Center y80 x10 w60 gRandomize, Randomize 
Gui, Add, Button, Center y80 x640 w60 gSubmitChoices, Submit
Gui, Show
return

Randomize:
Loop 10
{
Random, List%A_Index%,  1, 3
	if List%A_Index% = 1
		 List%A_Index% = Rock||Paper|Scissors
	if List%A_Index% = 2
		 List%A_Index% = Rock|Paper||Scissors
	if List%A_Index% = 3
		 List%A_Index% = Rock|Paper|Scissors||
GuiControl, , ListBox%A_Index%,  |		 
GuiControl, , ListBox%A_Index%,  % List%A_Index%
}
return

SubmitChoices:
Gui, Submit
Submission = %Choice1%%Choice2%%Choice3%%Choice4%%Choice5%%Choice6%%Choice7%%Choice8%%Choice9%%Choice10%
IniWrite, %Submission%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\%A_Username%.ini, RPS, SubmissionNum
StringReplace, Submission, Submission, 1, R, 1
StringReplace, Submission, Submission, 2, P, 1
StringReplace, Submission, Submission, 3, S, 1
IniWrite, %Submission%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\%A_Username%.ini, RPS, SubmissionLet
MsgBox, , Thanks for playing!, Thanks for participating in the Rock Paper Scissors tournament!`n`nResults will be posted on Friday, 3/10/2017.`n`nMay the odds be ever in your favor!
return

#Space::
Gui, New, AlwaysOnTop +ToolWindow, 
Gui, Add, Button, Center x10 gTally, Tally Results
Gui, Show
return

Tally:
Gui, Submit
IniRead, 1Seed,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\%A_Username%.ini, RPS, SubmissionLet
IniRead, 2Seed,  H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\%A_Username%.ini, RPS, SubmissionLet

IniRead, 1NSeed, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\%A_Username%.ini, RPS, SubmissionNum
IniRead, 2NSeed, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\%A_Username%.ini, RPS, SubmissionNum


Loop 4
{
StringSplit,  %A_Index%Seed, %A_Index%Seed
StringSplit, %A_Index%NSeed, %A_Index%NSeed
}

Loop 10
{
Result%A_Index% := 1NSeed%A_Index% . 2NSeed%A_Index%
	if (Result%A_Index% = "11") OR (Result%A_Index% = "22") OR (Result%A_Index% = "33")
		Result%A_Index% = x
	if (Result%A_Index% = "13") OR (Result%A_Index% = "21") OR (Result%A_Index% = "32")
		Result%A_Index% = ↑
	if (Result%A_Index% = "12") OR (Result%A_Index% = "23") OR (Result%A_Index% = "31")
		Result%A_Index% = ↓
}

FinalTally = %Result1%%Result2%%Result3%%Result4%%Result5%%Result6%%Result7%%Result8%%Result9%%Result10%

StringReplace, 1PWins, FinalTally, ↑, ↑,UseErrorLevel
1PWins = %ErrorLevel%
StringReplace, 2PWins, FinalTally, ↓, ↓,UseErrorLevel
2PWins = %ErrorLevel%

/*

R > S  
S > P 
P > R
  
R = 1
P = 2
S = 3
  
11 = Tie             ;    Rock  Versus Rock
12 = Player 2 Wins   ;    Rock  Versus Paper
13 = Player 1 Wins   ;    Rock  Versus Scissors
21 = Player 1 Wins   ;    Paper Versus Rock
22 = Tie             ;    Paper Versus Paper
23 = Player 2 Wins   ;    Paper Versus Scissors
31 = Player 2 Wins   ; Scissors Versus Rock
32 = Player 1 Wins   ; Scissors Versus Paper
33 = Tie             ; Scissors Versus Scissors
  
*/

Gui, New, AlwaysOnTop +ToolWindow, 
Gui, Add, Text,    x10 y10, Seed #1 - Tyler 
Gui, Add, Button,  x10 y25 w15 h25, %1Seed1%
Gui, Add, Button,  x25 y25 w15 h25, %1Seed2%
Gui, Add, Button,  x40 y25 w15 h25, %1Seed3%
Gui, Add, Button,  x55 y25 w15 h25, %1Seed4%
Gui, Add, Button,  x70 y25 w15 h25, %1Seed5%
Gui, Add, Button,  x85 y25 w15 h25, %1Seed6%
Gui, Add, Button, x100 y25 w15 h25, %1Seed7%
Gui, Add, Button, x115 y25 w15 h25, %1Seed8%
Gui, Add, Button, x130 y25 w15 h25, %1Seed9%
Gui, Add, Button, x145 y25 w15 h25, %1Seed10%

Gui, Add, Text,    x10 y102, Seed #2 - Bro
Gui, Add, Button,  x10 y75 w15 h25, %2Seed1%
Gui, Add, Button,  x25 y75 w15 h25, %2Seed2%
Gui, Add, Button,  x40 y75 w15 h25, %2Seed3%
Gui, Add, Button,  x55 y75 w15 h25, %2Seed4%
Gui, Add, Button,  x70 y75 w15 h25, %2Seed5%
Gui, Add, Button,  x85 y75 w15 h25, %2Seed6%
Gui, Add, Button, x100 y75 w15 h25, %2Seed7%
Gui, Add, Button, x115 y75 w15 h25, %2Seed8%
Gui, Add, Button, x130 y75 w15 h25, %2Seed9%
Gui, Add, Button, x145 y75 w15 h25, %2Seed10%

Gui, Add, Button,  x10 y50 w15 h25, %Result1%
Gui, Add, Button,  x25 y50 w15 h25, %Result2%
Gui, Add, Button,  x40 y50 w15 h25, %Result3%
Gui, Add, Button,  x55 y50 w15 h25, %Result4%
Gui, Add, Button,  x70 y50 w15 h25, %Result5%
Gui, Add, Button,  x85 y50 w15 h25, %Result6%
Gui, Add, Button, x100 y50 w15 h25, %Result7%
Gui, Add, Button, x115 y50 w15 h25, %Result8%
Gui, Add, Button, x130 y50 w15 h25, %Result9%
Gui, Add, Button, x145 y50 w15 h25, %Result10%
Gui, Add, Button, x160 y50 w60 h25, %1PWins% - %2PWins%
	if (1PWins > 2PWins)
		{
		Gui, Add, Button, x160 y25 w60 h25, Winner!
		Gui, Add, Button, x160 y75 w60 h25, Loser...
		Gui, Show, w400 h400
		}
	if (1PWins < 2PWins)
		{
		Gui, Add, Button, x160 y25 w60 h25, Loser...
		Gui, Add, Button, x160 y75 w60 h25, Winner!
		Gui, Show, w400 h400
		}
	if (1PWins == 2PWins)
		{
		Gui, Add, Button, x160 y25 w60 h25, TIE!
		Gui, Add, Button, x160 y75 w60 h25, TIE!
		Gui, Show, w400 h400
		}
return