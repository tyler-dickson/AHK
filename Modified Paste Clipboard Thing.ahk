#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

#Persistent
return

OnClipboardChange:
ToolTip %Clipboard%
Sleep 1000
ToolTip  ; Turn off the tip.
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Cool stuff to try out...

#r::
Computername = %A_Username%

IniRead, Username, C:\Users\%Computername%\AHKPrefs.ini, Username, Username
IniRead, ATDate, C:\Users\%Computername%\AHKPrefs.ini, Username, ATDate
Gui, New
strlist :=
( join ltrim comment
    [
        "string1","string1.5",
        "string2",
        "string3",
		"This is a test."
		       ; the comma is important
        ;                   ; make a list of arbitrary strings
    ]
)
for i in strlist
	{
    Gui, Add, Button, gInput, % strlist[i]
	}
Loop %i%
{
ListOfItems := ListOfItems . strlist[A_Index]"|"          ; ;ListOfItems := strlist[1] "|" strlist[2] "|" strlist[3]
}
Gui, Add, ComboBox, Simple R%i% vInput, %ListOfItems%
Gui, Add, Button, gTest, Send selected text.
Gui, Show
return

Input:
Gui, Hide
SendInput % ATDate " " a_guicontrol " " Username
Sleep 1000
Gui, Show
return

Test:
Gui, Submit
SendInput % ATDate " " Input " " Username
Sleep 1000
Gui, Show
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Add this to Lines ~2284.

SearchOnline:
Gui, 20: Submit
msgbox, %SearchOnline%
ifInString, SearchOnline, PCT
{
    ;Run % "https://patentscope.wipo.int/search/en/detail.jsf?docId=" SearchOnline "&recNum=1&tab=PCTDocuments"
    Run % "https://patentscope.wipo.int/search/en/detail.jsf?docId=" SearchOnline
}
else
{
    Run % "www.wipo.int/romarin/advSearch.do?ID=0&searchString=+/MARKGR/INTREGN contains " SearchOnline
}
gosub SettingsDrawer
return

SettingsDrawer:
PosFound = 0
IniRead, CustomColor, C:\Users\%Computername%\AHKPrefs.ini, Username, WindowColor
Gui, 20: Destroy
Gui, 20: New, Owner AlwaysOnTop , Drawer
Gui, 20: Add, Text, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% vgui_main_title, PCT or Madrid App #
Gui, 20: Add, Edit, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% vSearchOnline,
Gui, 20: Add, Button, x%ScreenWidthPointFive% w%ScreenWidthFourPercent% gSearchOnline, Search Online



