#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force


IniRead, ChangeChatTyler, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\TestChat\tyler.dickson.ini, TestChat, TestChat
IniRead, ChangeChatEddie, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\TestChat\eddie.monroy.ini, TestChat, TestChat
IniRead, ChangeChatAnthony, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\TestChat\anthony.pineda.ini, TestChat, TestChat
IniRead, ChangeChatDiana, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\TestChat\diana.cruz.ini, TestChat, TestChat


Gui, New, , Test GUI
Gui, Add, Text, , Eddie:
	if A_Username = eddie.monroy
		{
		Gui, Add, Edit, ReadOnly w300 Center, %ChangeChatEddie%
		Gui, Add, Edit, vChangeChatEddie w300 Center, 
		Gui, Add, Button, gUpdateChat, Update
		}
	else
		Gui, Add, Edit, w300 Center ReadOnly, %ChangeChatEddie%
Gui, Add, Text, , Anthony:
	if A_Username = anthony.pineda
		{
		Gui, Add, Edit,  ReadOnly w300 Center, %ChangeChatAnthony%
		Gui, Add, Edit, vChangeChatAnthony w300 Center, 
		Gui, Add, Button, gUpdateChat, Update
		}
	else
		Gui, Add, Edit, w300 Center ReadOnly, %ChangeChatAnthony%
Gui, Add, Text, , Tyler:
	if A_Username = tyler.dickson
		{
		Gui, Add, Edit, ReadOnly w300 Center, %ChangeChatTyler%
		Gui, Add, Edit, vChangeChatTyler w300 Center, 
		Gui, Add, Button, gUpdateChat, Update
		}
	else
		Gui, Add, Edit, w300 Center ReadOnly, %ChangeChatTyler%
Gui, Add, Text, , Diana:
	if A_Username = diana.cruz
		{
		Gui, Add, Edit, ReadOnly w300 Center, %ChangeChatDiana%
		Gui, Add, Edit, vChangeChatDiana w300 Center, 
		Gui, Add, Button, gUpdateChat, Update
		}
	else
		Gui, Add, Edit, w300 Center ReadOnly, %ChangeChatDiana%
Gui, Show
SetTimer, CheckChat, 1000
return

CheckChat:
IniRead, ChangeChatTyler,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\TestChat\tyler.dickson.ini, TestChat, TestChat
IniRead, ChangeChatEddie,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\TestChat\eddie.monroy.ini, TestChat, TestChat
IniRead, ChangeChatAnthony, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\TestChat\anthony.pineda.ini, TestChat, TestChat
IniRead, ChangeChatDiana,   H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\TestChat\diana.cruz.ini, TestChat, TestChat
	if A_Username = tyler.dickson
		{
		GuiControl, , Edit1, %ChangeChatEddie%
		GuiControl, , Edit2, %ChangeChatAnthony%
		GuiControl, , Edit3, %ChangeChatTyler%
		GuiControl, , Edit4, 
		GuiControl, , Edit5, %ChangeChatDiana%
		return
		}
	else if A_Username = diana.cruz
		{
		GuiControl, , Edit1, %ChangeChatEddie%
		GuiControl, , Edit2, %ChangeChatAnthony%
		GuiControl, , Edit3, %ChangeChatTyler%
		GuiControl, , Edit4, %ChangeChatDiana%
		GuiControl, , Edit5, 
		return
		}
	else if A_Username = eddie.monroy
		{
		GuiControl, , Edit1, %ChangeChatEddie%
		GuiControl, , Edit2, 
		GuiControl, , Edit3, %ChangeChatAnthony%
		GuiControl, , Edit4, %ChangeChatTyler%
		GuiControl, , Edit5, %ChangeChatDiana%
		return
		}
	else if A_Username = anthony.pineda
		{
		GuiControl, , Edit1, %ChangeChatEddie%
		GuiControl, , Edit2, %ChangeChatAnthony%
		GuiControl, , Edit3, 
		GuiControl, , Edit4, %ChangeChatTyler%
		GuiControl, , Edit5, %ChangeChatDiana%
		return
		}
return

UpdateChat:
Gui, Submit, NoHide
if A_Username = tyler.dickson
	IniWrite, %ChangeChatTyler%, % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\TestChat\" A_Username ".ini", TestChat, TestChat
if A_Username = anthony.pineda
	IniWrite, %ChangeChatAnthony%, % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\TestChat\" A_Username ".ini", TestChat, TestChat
if A_Username = eddie.monroy
	IniWrite, %ChangeChatEddie%, % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\TestChat\" A_Username ".ini", TestChat, TestChat
if A_Username = diana.cruz
	IniWrite, %ChangeChatDiana%, % "H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\RPS\TestChat\" A_Username ".ini", TestChat, TestChat
gosub CheckChat
return


GuiClose:
ExitApp

