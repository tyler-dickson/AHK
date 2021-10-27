#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

Gui, New,
Gui, Add, Button,   x10 y10 w45 h45 vOne gOne,
Gui, Add, Button,   x60 y10 w45 h45 vTwo gTwo,
Gui, Add, Button,  x110 y10 w45 h45 vThr gThr,
Gui, Add, Button,   x10 y60 w45 h45 vFou gFou,
Gui, Add, Button,   x60 y60 w45 h45 vFiv gFiv,
Gui, Add, Button,  x110 y60 w45 h45 vSix gSix,
Gui, Add, Button,  x10 y110 w45 h45 vSev gSev,
Gui, Add, Button,  x60 y110 w45 h45 vEig gEig,
Gui, Add, Button, x110 y110 w45 h45 vNin gNin,
Gui, Add, Button,  x10 y160 w150 h20 vTurn gTurn, X's Turn
Gui, Show
return

CheckWinner:
GuiControlGet,  But1,  , Button1
GuiControlGet,  But2,  , Button2
GuiControlGet,  But3,  , Button3
GuiControlGet,  But4,  , Button4
GuiControlGet,  But5,  , Button5
GuiControlGet,  But6,  , Button6
GuiControlGet,  But7,  , Button7
GuiControlGet,  But8,  , Button8
GuiControlGet,  But9,  , Button9
Scenario1 = %But1%%But2%%But3%
Scenario2 = %But4%%But5%%But6%
Scenario3 = %But7%%But8%%But9%
Scenario4 = %But1%%But4%%But7%
Scenario5 = %But2%%But5%%But8%
Scenario6 = %But3%%But6%%But9%
Scenario7 = %But1%%But5%%But9%
Scenario8 = %But3%%But5%%But7%
Scenario9 = %But1%%But2%%But3%%But4%%But5%%But6%%But7%%But8%%But9%
StringLen, Scenario9, Scenario9
		 if Scenario1 = XXX
				GuiControl, , Button10, X's win! Click to restart!
	else if Scenario1 = OOO
				GuiControl, , Button10, O's win! Click to restart!
	else if Scenario2 = XXX
				GuiControl, , Button10, X's win! Click to restart!
	else if Scenario2 = OOO
				GuiControl, , Button10, O's win! Click to restart!	
	else if Scenario3 = XXX
				GuiControl, , Button10, X's win! Click to restart!
	else if Scenario3 = OOO
				GuiControl, , Button10, O's win! Click to restart!		
	else if Scenario4 = XXX
				GuiControl, , Button10, X's win! Click to restart!
	else if Scenario4 = OOO
				GuiControl, , Button10, O's win! Click to restart!		
	else if Scenario5 = XXX
				GuiControl, , Button10, X's win! Click to restart!
	else if Scenario5 = OOO
				GuiControl, , Button10, O's win! Click to restart!		
	else if Scenario6 = XXX
				GuiControl, , Button10, X's win! Click to restart! 
	else if Scenario6 = OOO
				GuiControl, , Button10, O's win! Click to restart!		
	else if Scenario7 = XXX
				GuiControl, , Button10, X's win! Click to restart!
	else if Scenario7 = OOO
				GuiControl, , Button10, O's win! Click to restart!		
	else if Scenario8 = XXX
				GuiControl, , Button10, X's win! Click to restart!
	else if Scenario8 = OOO
				GuiControl, , Button10, O's win! Click to restart!		
	else if Scenario9 = 9
				GuiControl, , Button10, Cat's game! Click to restart!
return

One:
GuiControlGet,  But1,  , Button1	
GuiControlGet,  But10, , Button10
	if (But10 = "X's Turn") && (But1 = "" )
		{
		GuiControl, ,  Button1, X	         
		GuiControl, , Button10, O's Turn	 
		}
	if (But10 = "O's Turn") && (But1 = "" )
		{
		GuiControl, ,  Button1, O	         
		GuiControl, , Button10, X's Turn	 
		}
gosub CheckWinner
return

Two:
GuiControlGet,  But2,  , Button2	
GuiControlGet,  But10, , Button10
	if (But10 = "X's Turn") && (But2 = "" )
		{
		GuiControl, ,  Button2, X	         
		GuiControl, , Button10, O's Turn	 
		}
	if (But10 = "O's Turn") && (But2 = "" )
		{
		GuiControl, ,  Button2, O	         
		GuiControl, , Button10, X's Turn	 
		}
gosub CheckWinner
return

Thr:
GuiControlGet,  But3,  , Button3	
GuiControlGet,  But10, , Button10
	if (But10 = "X's Turn") && (But3 = "" )
		{
		GuiControl, ,  Button3, X	         
		GuiControl, , Button10, O's Turn	 
		}
	if (But10 = "O's Turn") && (But3 = "" )
		{
		GuiControl, ,  Button3, O	         
		GuiControl, , Button10, X's Turn	 
		}
gosub CheckWinner
return

Fou:
GuiControlGet,  But4,  , Button4	
GuiControlGet,  But10, , Button10
	if (But10 = "X's Turn") && (But4 = "" )
		{
		GuiControl, ,  Button4, X	         
		GuiControl, , Button10, O's Turn	 
		}
	if (But10 = "O's Turn") && (But4 = "" )
		{
		GuiControl, ,  Button4, O	         
		GuiControl, , Button10, X's Turn	 
		}
gosub CheckWinner
return

Fiv:
GuiControlGet,  But5,  , Button5	
GuiControlGet,  But10, , Button10
	if (But10 = "X's Turn") && (But5 = "" )
		{
		GuiControl, ,  Button5, X	         
		GuiControl, , Button10, O's Turn	 
		}
	if (But10 = "O's Turn") && (But5 = "" )
		{
		GuiControl, ,  Button5, O	         
		GuiControl, , Button10, X's Turn	 
		}
gosub CheckWinner
return

Six:
GuiControlGet,  But6,  , Button6	
GuiControlGet,  But10, , Button10
	if (But10 = "X's Turn") && (But6 = "" )
		{
		GuiControl, ,  Button6, X	         
		GuiControl, , Button10, O's Turn	 
		}
	if (But10 = "O's Turn") && (But6 = "" )
		{
		GuiControl, ,  Button6, O	         
		GuiControl, , Button10, X's Turn	 
		}
gosub CheckWinner
return

Sev:
GuiControlGet,  But7,  , Button7	
GuiControlGet,  But10, , Button10
	if (But10 = "X's Turn") && (But7 = "" )
		{
		GuiControl, ,  Button7, X	         
		GuiControl, , Button10, O's Turn	 
		}
	if (But10 = "O's Turn") && (But7 = "" )
		{
		GuiControl, ,  Button7, O	         
		GuiControl, , Button10, X's Turn	 
		}
gosub CheckWinner
return

Eig:
GuiControlGet,  But8,  , Button8	
GuiControlGet,  But10, , Button10
	if (But10 = "X's Turn") && (But8 = "" )
		{
		GuiControl, ,  Button8, X	         
		GuiControl, , Button10, O's Turn	 
		}
	if (But10 = "O's Turn") && (But8 = "" )
		{
		GuiControl, ,  Button8, O	         
		GuiControl, , Button10, X's Turn	 
		}
gosub CheckWinner
return

Nin:
GuiControlGet,  But9,  , Button9	
GuiControlGet,  But10, , Button10
	if (But10 = "X's Turn") && (But9 = "" )
		{
		GuiControl, ,  Button9, X	         
		GuiControl, , Button10, O's Turn	 
		}
	if (But10 = "O's Turn") && (But9 = "" )
		{
		GuiControl, ,  Button9, O	         
		GuiControl, , Button10, X's Turn	 
		}
gosub CheckWinner
return

Turn:
GuiControlGet,  But10, , Button10
	if (But10 = "O's win! Click to restart!") OR (But10 = "X's win! Click to restart!") OR (But10 = "Cat's game! Click to restart!")
		{
		GuiControl, ,  Button1,
		GuiControl, ,  Button2,
		GuiControl, ,  Button3,
		GuiControl, ,  Button4,
		GuiControl, ,  Button5,
		GuiControl, ,  Button6,
		GuiControl, ,  Button7,
		GuiControl, ,  Button8,
		GuiControl, ,  Button9,
		GuiControl, ,  Button10, X's Turn	
		}
return 

GuiClose:
ExitApp
return
