







^j::
IniRead, Username, C:\Users\%A_Username%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%A_Username%\AHKPrefs.ini, Username, ATDate
StringLen, NameLen, Username
NameLen3 := NameLen + 3
SendInput %MyMonthCal%
SendInput {TAB 5} ; I think it is 5 TABS. Could be 6.


SendInput ^a
Sleep 80
SentInput ^c
Sleep 80
AllClipboard = %Clipboard%


ReadyToPaste = %ATDate%{Space}-{Space}Extend 1M per .{Space}-%Username%
Clipboard = %ReadyToPaste%
Sleep 80
SendInput ^v


SendInput {Left %NameLen3%} 


Clipboard = %OldClipboard%
gosub RecordCalExtend
return
