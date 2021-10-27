#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


^j::
global Option1
global Option2
global Option3
global Option4
global Option5
global Option6
Gui, Add, Checkbox, Checked vOption1, Option 1
Gui, Add, Checkbox, Checked vOption2, Option 2
Gui, Add, Checkbox, Checked vOption3, Option 3
Gui, Add, Checkbox, Checked vOption4, Option 4
Gui, Add, Checkbox, Checked vOption5, Option 5
Gui, Add, Checkbox, Checked vOption6, Option 6
Gui, Add, Button, gButton, Submit
Gui, Show
return

Button:
Gui, Submit
MsgBox, %Option1% %Option2% %Option3% %Option4% %Option5% %Option6%
Gui, Destroy
return

^CapsLock::
	if Option1 = 1
		{
		MsgBox, %Option1%
		ShortcutTips()
		return
		}
	else if Option1 = 0
		{
		MsgBox, %Option1%
		MsgBox, Button 1 not checked.
		return
		}
	else	
		return
return

ShortcutTips()
{
;SplashTextOn,350 ,, Quick Shortcuts                                         (Press Enter/ESC to close.), Ctrl+`` = Open Docketing in Opposite System `n Ctrl+1 = Open Hyperlink from Excel `n`n Ctrl+5 = Store Extra Clipboard Items `n Ctrl+6 = Paste Stored Clipboard Items `n`n Ctrl+3 = Set Username for Remarks `n Shift+CapsLock = Paste current date and initials. `n`n Ctrl+= = Create Shortcut Abbreviations `n`n Highlight text, then Ctrl+RightClick:`n     Suggest Action Remarks`n     Extend Docketing Date`n     Generate Attorney Emails
Msgbox, Test.
Return
}

^k::
MsgBox, %Option1% %Option2% %Option3% %Option4% %Option5% %Option6%
return