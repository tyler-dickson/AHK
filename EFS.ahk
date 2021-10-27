#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


^j::
Arrayed := Object()
;Msgbox % list_files(A_WinDir)
test = % list_files(A_WinDir)
Sort, test, U D`n \
StringSplit, Arrayed, test, `n, 
;MsgBox, %Arrayed%
AttysAdded = ;
AttysNotAdded = ;

Loop, %Arrayed0%
{
IfInString, Arrayed%A_Index%, lnk
	{
	AttysNotAdded++
	}
else IfInString, Arrayed%A_Index%, epf
	{
	FileAppend, % Arrayed%A_Index% "=`n", C:\Users\%A_Username%\Desktop\EFS.ini
	AttysAdded++
	}
else
	AttysNotAdded++
}

MsgBox, %AttysAdded% attorneys added to EFS.ini. %AttysNotAdded% not added.
return


list_files(Directory)
{
	files =
	Loop S:\USPTO\*.*
	{
		files = %files%`n%A_LoopFileFullPath%
	}
	return files
}

^k::
OldClipboard = %clipboard%
SendInput ^c
Sleep 200
NewClipboard = %Clipboard%

IniRead, Password, C:\Users\%A_Username%\Desktop\EFS.ini, EFS, %NewClipboard%

MsgBox, %Password%


return


;;;;;;

::!dea::H:\USPTO\Dan.Altman.epf
