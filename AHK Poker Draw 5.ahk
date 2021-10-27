#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
Enabled := ComObjError(false)
Menu, Tray, Icon, pifmgr.dll, 24

IniRead, Credits, PokerStats.ini, Stats, Credits
	if Credits = ERROR
		{
		Credits = 100
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		Sleep 200
		IniRead, Credits, PokerStats.ini, Stats, Credits		
		}
IniRead, Refills, PokerStats.ini, Stats, Refills
	if Refills = ERROR
		{
		Refills = 0
		IniWrite, %Refills%, PokerStats.ini, Stats, Refills
		Sleep 200
		IniRead, Refills, PokerStats.ini, Stats, Refills		
		}		
IniRead, TotalPlays, PokerStats.ini, Stats, TotalPlays
	if TotalPlays = ERROR
		{
		TotalPlays = 0
		IniWrite, %TotalPlays%, PokerStats.ini, Stats, TotalPlays
		Sleep 200
		IniRead, TotalPlays, PokerStats.ini, Stats, TotalPlays		
		}
IniRead, TotalSpent, PokerStats.ini, Stats, TotalSpent
	if TotalSpent = ERROR
		{
		TotalSpent = 0
		IniWrite, %TotalSpent%, PokerStats.ini, Stats, TotalSpent
		Sleep 200
		IniRead, TotalSpent, PokerStats.ini, Stats, TotalSpent		
		}
IniRead, Losses, PokerStats.ini, Stats, Losses
	if Losses = ERROR
		{
		Losses = 0
		IniWrite, %Losses%, PokerStats.ini, Stats, Losses
		Sleep 200
		IniRead, Losses, PokerStats.ini, Stats, Losses		
		}
IniRead, JacksOrBetter, PokerStats.ini, Stats, JacksOrBetter
	if JacksOrBetter = ERROR
		{
		JacksOrBetter = 0
		IniWrite, %JacksOrBetter%, PokerStats.ini, Stats, JacksOrBetter
		Sleep 200
		IniRead, JacksOrBetter, PokerStats.ini, Stats, JacksOrBetter		
		}	
IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
	if TwoPairs = ERROR
		{
		TwoPairs = 0
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		Sleep 200
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs		
		}
IniRead, ThreeOfAKinds, PokerStats.ini, Stats, ThreeOfAKinds
	if ThreeOfAKinds = ERROR
		{
		ThreeOfAKinds = 0
		IniWrite, %ThreeOfAKinds%, PokerStats.ini, Stats, ThreeOfAKinds
		Sleep 200
		IniRead, ThreeOfAKinds, PokerStats.ini, Stats, ThreeOfAKinds		
		}		
IniRead, Straights, PokerStats.ini, Stats, Straights
	if Straights = ERROR
		{
		Straights = 0
		IniWrite, %Straights%, PokerStats.ini, Stats, Straights
		Sleep 200
		IniRead, Straights, PokerStats.ini, Stats, Straights		
		}	
IniRead, Flushes, PokerStats.ini, Stats, Flushes
	if Flushes = ERROR
		{
		Flushes = 0
		IniWrite, %Flushes%, PokerStats.ini, Stats, Flushes
		Sleep 200
		IniRead, Flushes, PokerStats.ini, Stats, Flushes		
		}	
IniRead, FullHouses, PokerStats.ini, Stats, FullHouses
	if FullHouses = ERROR
		{
		FullHouses = 0
		IniWrite, %FullHouses%, PokerStats.ini, Stats, FullHouses
		Sleep 200
		IniRead, FullHouses, PokerStats.ini, Stats, FullHouses		
		}
IniRead, FourOfAKinds, PokerStats.ini, Stats, FourOfAKinds
	if FourOfAKinds = ERROR
		{
		FourOfAKinds = 0
		IniWrite, %FourOfAKinds%, PokerStats.ini, Stats, FourOfAKinds
		Sleep 200
		IniRead, FourOfAKinds, PokerStats.ini, Stats, FourOfAKinds		
		}		
IniRead, StraightFlushes, PokerStats.ini, Stats, StraightFlushes
	if StraightFlushes = ERROR
		{
		StraightFlushes = 0
		IniWrite, %StraightFlushes%, PokerStats.ini, Stats, StraightFlushes
		Sleep 200
		IniRead, StraightFlushes, PokerStats.ini, Stats, StraightFlushes		
		}		
IniRead, RoyalFlushes, PokerStats.ini, Stats, RoyalFlushes
	if RoyalFlushes = ERROR
		{
		RoyalFlushes = 0
		IniWrite, %RoyalFlushes%, PokerStats.ini, Stats, RoyalFlushes
		Sleep 200
		IniRead, RoyalFlushes, PokerStats.ini, Stats, RoyalFlushes		
		}

Gui, New, , Credits: %Credits% 	
Gui, Font,

Slot1 := "x5 y170 w60 h40 Center Border -Wrap"
Slot2 := "x70  y170 w60 h40 Center Border -Wrap"
Slot3 := "x135 y170 w60 h40 Center Border -Wrap"
Slot4 := "x200 y170 w60 h40 Center Border -Wrap"
Slot5 := "x265 y170 w60 h40 Center Border -Wrap"
Slot6 := "x330 y170 w60 h40 Center Border -Wrap"
Slot7 := "x395 y170 w60 h40 Center Border -Wrap"
Slot8 := "x460 y170 w60 h40 Center Border -Wrap"
Slot9 := "x525 y170 w60 h40 Center Border -Wrap"
Slot10 := "x590 y170 w60 h40 Center Border -Wrap"
Slot11 := "x655 y170 w60 h40 Center Border -Wrap"
Slot12 := "x720 y170 w60 h40 Center Border -Wrap"
Slot13 := "x785 y170 w60 h40 Center Border -Wrap"
Slot14 := "x5 y235 w60 h40 Center Border -Wrap"
Slot15 := "x70 y235 w60 h40 Center Border -Wrap"
Slot16 := "x135 y235 w60 h40 Center Border -Wrap"
Slot17 := "x200 y235 w60 h40 Center Border -Wrap"
Slot18 := "x265 y235 w60 h40 Center Border -Wrap"
Slot19 := "x330 y235 w60 h40 Center Border -Wrap"
Slot20 := "x395 y235 w60 h40 Center Border -Wrap"
Slot21 := "x460 y235 w60 h40 Center Border -Wrap"
Slot22 := "x525 y235 w60 h40 Center Border -Wrap"
Slot23 := "x590 y235 w60 h40 Center Border -Wrap"
Slot24 := "x655 y235 w60 h40 Center Border -Wrap"
Slot25 := "x720 y235 w60 h40 Center Border -Wrap"
Slot26 := "x785 y235 w60 h40 Center Border -Wrap"
Slot27 := "x5 y280 w60 h40 Center Border -Wrap"
Slot28 := "x70 y280 w60 h40 Center Border -Wrap"
Slot29 := "x135 y280 w60 h40 Center Border -Wrap"
Slot30 := "x200 y280 w60 h40 Center Border -Wrap"
Slot31 := "x265 y280 w60 h40 Center Border -Wrap"
Slot32 := "x330 y280 w60 h40 Center Border -Wrap"
Slot33 := "x395 y280 w60 h40 Center Border -Wrap"
Slot34 := "x460 y280 w60 h40 Center Border -Wrap"
Slot35 := "x525 y280 w60 h40 Center Border -Wrap"
Slot36 := "x590 y280 w60 h40 Center Border -Wrap"
Slot37 := "x655 y280 w60 h40 Center Border -Wrap"
Slot38 := "x720 y280 w60 h40 Center Border -Wrap"
Slot39 := "x785 y280 w60 h40 Center Border -Wrap"
Slot40 := "x5 y325 w60 h40 Center Border -Wrap"
Slot41 := "x70 y325 w60 h40 Center Border -Wrap"
Slot42 := "x135 y325 w60 h40 Center Border -Wrap"
Slot43 := "x200 y325 w60 h40 Center Border -Wrap"
Slot44 := "x265 y325 w60 h40 Center Border -Wrap"
Slot45 := "x330 y325 w60 h40 Center Border -Wrap"
Slot46 := "x395 y325 w60 h40 Center Border -Wrap"
Slot47 := "x460 y325 w60 h40 Center Border -Wrap"
Slot48 := "x525 y325 w60 h40 Center Border -Wrap"
Slot49 := "x590 y325 w60 h40 Center Border -Wrap"
Slot50 := "x655 y325 w60 h40 Center Border -Wrap"
Slot51 := "x720 y325 w60 h40 Center Border -Wrap"
Slot52 := "x785 y325 w60 h40 Center Border -Wrap"

HoldSlot1 := "x5   y215 w60 h40 Center Border -Wrap"
HoldSlot2 := "x70  y215 w60 h40 Center Border -Wrap"
HoldSlot3 := "x135 y215 w60 h40 Center Border -Wrap"
HoldSlot3x := "x135 y215 w75 h40 Center Border -Wrap"
HoldSlot4 := "x200 y215 w60 h40 Center Border -Wrap"
HoldSlot5 := "x265 y215 w60 h40 Center Border -Wrap"
HoldSlot5x := "x230 y215 w95 h40 Center Border -Wrap"


Card1 := "♠ A"
Card2 := "♠ 2"
Card3 := "♠ 3"
Card4 := "♠ 4"
Card5 := "♠ 5"
Card6 := "♠ 6"
Card7 := "♠ 7"
Card8 := "♠ 8"
Card9 := "♠ 9"
Card10 := "♠ 10"
Card11 := "♠ J"
Card12 := "♠ Q"
Card13 := "♠ K"
Card14 := "♣ A"
Card15 := "♣ 2"
Card16 := "♣ 3"
Card17 := "♣ 4"
Card18 := "♣ 5"
Card19 := "♣ 6"
Card20 := "♣ 7"
Card21 := "♣ 8"
Card22 := "♣ 9"
Card23 := "♣ 10"
Card24 := "♣ J"
Card25 := "♣ Q"
Card26 := "♣ K"
Card27 := "♦ A"
Card28 := "♦ 2"
Card29 := "♦ 3"
Card30 := "♦ 4"
Card31 := "♦ 5"
Card32 := "♦ 6"
Card33 := "♦ 7"
Card34 := "♦ 8"
Card35 := "♦ 9"
Card36 := "♦ 10"
Card37 := "♦ J"
Card38 := "♦ Q"
Card39 := "♦ K"
Card40 := "♥ A"
Card41 := "♥ 2"
Card42 := "♥ 3"
Card43 := "♥ 4"
Card44 := "♥ 5"
Card45 := "♥ 6"
Card46 := "♥ 7"
Card47 := "♥ 8"
Card48 := "♥ 9"
Card49 := "♥ 10"
Card50 := "♥ J"
Card51 := "♥ Q"
Card52 := "♥ K"
CurrentBet = 0

Gui, Font,  Helvetica
Gui, Add, CheckBox, %Slot1% gHoldCard1, ; % CardOrder%A_Index%
Gui, Add, CheckBox, %Slot2% gHoldCard2, ; % CardOrder%A_Index%
Gui, Add, CheckBox, %Slot3% gHoldCard3, ; % CardOrder%A_Index%
Gui, Add, CheckBox, %Slot4% gHoldCard4, ; % CardOrder%A_Index%
Gui, Add, CheckBox, %Slot5% gHoldCard5, ; % CardOrder%A_Index%
Gui, Add, Button,   %HoldSlot1% gHold1, HOLD ; % CardOrder%A_Index%
Gui, Add, Button,   %HoldSlot2% gHold2, HOLD ; % CardOrder%A_Index%
Gui, Add, Button,   %HoldSlot3% gHold3, HOLD ; % CardOrder%A_Index%
Gui, Add, Button,   %HoldSlot4% gHold4, HOLD ; % CardOrder%A_Index%
Gui, Add, Button,   %HoldSlot5% gHold5, HOLD ; % CardOrder%A_Index%

Gui, Add, Button, x5 y280 h30 gDrawCards w80, Deal

Gui, Add, Button, x500 y280 h30 w225, You win!     ; Static1
Gui, Font, underline
Gui, Add, Text, Center x90 y280 h30 w225, You win!     ; Static1
Gui, Font, 
Gui, Add, ListBox, x5 y5  w320 h170, Hand`t`tPrize`tCombinations`tProbability|Royal Flush`t800`t41,126,022`t0.000025|Straight Flush`t50`t181,573,608`t0.000109|Four of a Kind`t25`t3,924,430,647`t0.002363|Full House`t9`t19,122,956,883`t0.011512|Flush`t`t6`t18,296,232,180`t0.011015|Straight`t`t4`t18,653,130,482`t0.011229|Three of a Kind`t3`t123,666,922,527`t0.074449|Two Pair`t`t2`t214,745,513,679`t0.129279|Jacks or Better`t1`t356,447,740,914`t0.214585|All Others`t`t0`t906,022,916,158`t0.545435|Totals`t`t-`t1,661,102,543,100`t1.000000
Gui, Add, Button,   %HoldSlot1% gBet1, Bet 1 ; % CardOrder%A_Index%
Gui, Add, Button,   %HoldSlot2% gBet5, Bet 5 ; % CardOrder%A_Index%
Gui, Add, Button,   %HoldSlot3x% gBetMax, Bet Max ; % CardOrder%A_Index%
Gui, Add, Button,   %HoldSlot5x% gAdd100, Add 100 ; % CardOrder%A_Index%

gosub ShuffleCards

GuiControl, Hide, Button1
GuiControl, Hide, Button2
GuiControl, Hide, Button3
GuiControl, Hide, Button4
GuiControl, Hide, Button5
GuiControl, Hide, Button6
GuiControl, Hide, Button7
GuiControl, Hide, Button8
GuiControl, Hide, Button9
GuiControl, Hide, Button10
GuiControl, Hide, Static1
Gui, Show, w330
return

Bet1:
if Credits < 1
	{
	MsgBox, ,You're out of credits!, You're out of credits! Add more to continue!
	return
	}
else if CurrentBet >= 10
	{
	AlreadyBet := 10 - CurrentBet
	Credits -= AlreadyBet
	CurrentBet = 10
	Gui, Show, w330, Credits: %Credits% | Bet: %CurrentBet%
	gosub DrawCards
	}
else
	{
	Credits -= 1
	CurrentBet += 1
	Gui, Show, w330, Credits: %Credits% | Bet: %CurrentBet%
		if CurrentBet >= 10
			{	
			AlreadyBet := 10 - CurrentBet
			Credits -= AlreadyBet
			CurrentBet = 10
			Gui, Show, w330, Credits: %Credits% | Bet: %CurrentBet%
			gosub DrawCards
			}
	}
return
	
Bet5:
if Credits < 5
	{
	MsgBox, ,You're out of credits!, You're out of credits! Add more to continue!
	return
	}
else if CurrentBet >= 10
	{
	AlreadyBet := 10 - CurrentBet
	Credits -= AlreadyBet
	CurrentBet = 10
	Gui, Show, w330, Credits: %Credits% | Bet: %CurrentBet%
	gosub DrawCards
	}
else
	{
	Credits -= 5
	CurrentBet += 5
	Gui, Show, w330, Credits: %Credits% | Bet: %CurrentBet%
		if CurrentBet >= 10
			{
			AlreadyBet := 10 - CurrentBet
			Credits -= AlreadyBet
			CurrentBet = 10
			Gui, Show, w330, Credits: %Credits% | Bet: %CurrentBet%
			gosub DrawCards
			}
	}
return

BetMax:
if Credits < 10
	{
	MsgBox, ,You're out of credits!, You're out of credits! Add more to continue!
	return
	}
else if CurrentBet = 0
	{
	Credits -= 10
	CurrentBet += 10
	Gui, Show, w330, Credits: %Credits% | Bet: %CurrentBet%
	gosub DrawCards
	}
else
	{
	AlreadyBet := 10 - CurrentBet
	Credits -= AlreadyBet
	CurrentBet = 10
	Gui, Show, w330, Credits: %Credits% | Bet: %CurrentBet%
	gosub DrawCards
	}
return

Add100:
Credits += 100
	if CurrentBet > 1
		Gui, Show, w330, Credits: %Credits% | Bet: %CurrentBet%
	else
		Gui, Show, w330, Credits: %Credits%
IniWrite, %Credits%, PokerStats.ini, Stats, Credits
IniRead, Refills, PokerStats.ini, Stats, Refills
Refills++
IniWrite, %Refills%, PokerStats.ini, Stats, Refills
return

Hold1:
GuiControl, , Button1, 0
GuiControl, Hide, Button6
return

Hold2:
GuiControl, , Button2, 0
GuiControl, Hide, Button7
return

Hold3:
GuiControl, , Button3, 0
GuiControl, Hide, Button8
return

Hold4:
GuiControl, , Button4, 0
GuiControl, Hide, Button9
return

Hold5:
GuiControl, , Button5, 0
GuiControl, Hide, Button10
return

HoldCard1:
Gui, Submit, NoHide
GuiControlGet, KeepCard1, ,Button1
	if KeepCard1 = 0
		GuiControl, Hide,  Button6
	else
		GuiControl, Show,  Button6
return

HoldCard2:
Gui, Submit, NoHide
GuiControlGet, KeepCard2, ,Button2
	if KeepCard2 = 0
		GuiControl, Hide,  Button7
	else
		GuiControl, Show,  Button7
return

HoldCard3:
Gui, Submit, NoHide
GuiControlGet, KeepCard3, ,Button3
	if KeepCard3 = 0
		GuiControl, Hide,  Button8
	else
		GuiControl, Show,  Button8
return

HoldCard4:
Gui, Submit, NoHide
GuiControlGet, KeepCard4, ,Button4
	if KeepCard4 = 0
		GuiControl, Hide,  Button9
	else
		GuiControl, Show,  Button9
return

HoldCard5:
Gui, Submit, NoHide
GuiControlGet, KeepCard5, ,Button5
	if KeepCard5 = 0
		GuiControl, Hide,  Button10
	else
		GuiControl, Show,  Button10
return


DrawCards:
GuiControlGet, WhereInProcess, , Button11
GuiControlGet, KeepCard1, ,Button1
GuiControlGet, KeepCard2, ,Button2
GuiControlGet, KeepCard3, ,Button3
GuiControlGet, KeepCard4, ,Button4
GuiControlGet, KeepCard5, ,Button5
CardStatus := KeepCard1 KeepCard2 KeepCard3 KeepCard4 KeepCard5

if WhereInProcess = Deal
	{
	if CurrentBet = 0
		MsgBox, , You didn't bet anything!, Bet an amount and try again!
	else	
	{
	GuiControl, Show, Button1
	GuiControl, Show, Button2
	GuiControl, Show, Button3
	GuiControl, Show, Button4
	GuiControl, Show, Button5
	GuiControl, Hide, Button13
	GuiControl, Hide, Button14
	GuiControl, Hide, Button15
	GuiControl, Hide, Button16
	GuiControl, , Button11, Draw
	IniRead, TotalPlays, PokerStats.ini, Stats, TotalPlays
	TotalPlays++
	IniWrite, %TotalPlays%, PokerStats.ini, Stats, TotalPlays

	IniRead, TotalSpent, PokerStats.ini, Stats, TotalSpent
	TotalSpent := TotalSpent + CurrentBet
	IniWrite, %TotalSpent%, PokerStats.ini, Stats, TotalSpent	
	}
	return	
	}

if WhereInProcess = Restart
	{
	GuiControl, Choose, ListBox1, 0
	GuiControl, , Button11, Deal
	GuiControl, , Button1, 0
	GuiControl, , Button2, 0
	GuiControl, , Button3, 0
	GuiControl, , Button4, 0
	GuiControl, , Button5, 0
	GuiControl, Enable, Button1
	GuiControl, Enable, Button2
	GuiControl, Enable, Button3
	GuiControl, Enable, Button4
	GuiControl, Enable, Button5
	GuiControl, Hide, Button1
	GuiControl, Hide, Button2
	GuiControl, Hide, Button3
	GuiControl, Hide, Button4
	GuiControl, Hide, Button5
	GuiControl, Hide, Button6
	GuiControl, Hide, Button7
	GuiControl, Hide, Button8
	GuiControl, Hide, Button9
	GuiControl, Hide, Button10
	GuiControl, Hide, Static1
	GuiControl, Show, Button13
	GuiControl, Show, Button14
	GuiControl, Show, Button15
	GuiControl, Show, Button16
	CurrentBet = 0
	IniRead, Credits, PokerStats.ini, Stats, Credits
	Gui, Show, w330, Credits: %Credits%
	gosub ShuffleCards
	}
	
if WhereInProcess = Draw
	{
	if CardStatus = 11111
		{
		}
	if CardStatus = 11110
		GuiControl, , Button5, % CardOrder6
	if CardStatus = 11101
		GuiControl, , Button4, % CardOrder6
	if CardStatus = 11100
		{
		GuiControl, , Button4, % CardOrder6
		GuiControl, , Button5, % CardOrder7
		}
	if CardStatus = 11011
		GuiControl, , Button3, % CardOrder6
	if CardStatus = 11010
		{
		GuiControl, , Button3, % CardOrder6
		GuiControl, , Button5, % CardOrder7
		}
	if CardStatus = 11001
		{
		GuiControl, , Button3, % CardOrder6
		GuiControl, , Button4, % CardOrder7
		}
	if CardStatus = 11000
		{
		GuiControl, , Button3, % CardOrder6
		GuiControl, , Button4, % CardOrder7
		GuiControl, , Button5, % CardOrder8
		}
	if CardStatus = 10111
		GuiControl, , Button2, % CardOrder6
	if CardStatus = 10110
		{
		GuiControl, , Button2, % CardOrder6
		GuiControl, , Button5, % CardOrder7
		}
	if CardStatus = 10101
		{
		GuiControl, , Button2, % CardOrder6
		GuiControl, , Button4, % CardOrder7
		}
	if CardStatus = 10100
		{
		GuiControl, , Button2, % CardOrder6
		GuiControl, , Button4, % CardOrder7
		GuiControl, , Button5, % CardOrder8
		}
	if CardStatus = 10011
		{
		GuiControl, , Button2, % CardOrder6
		GuiControl, , Button3, % CardOrder7
		}
	if CardStatus = 10010
		{
		GuiControl, , Button2, % CardOrder6
		GuiControl, , Button3, % CardOrder7
		GuiControl, , Button5, % CardOrder8
		}
	if CardStatus = 10001
		{
		GuiControl, , Button2, % CardOrder6
		GuiControl, , Button3, % CardOrder7
		GuiControl, , Button4, % CardOrder8
		}
	if CardStatus = 10000
		{
		GuiControl, , Button2, % CardOrder6
		GuiControl, , Button3, % CardOrder7
		GuiControl, , Button4, % CardOrder8
		GuiControl, , Button5, % CardOrder9
		}
	if CardStatus = 01111
		GuiControl, , Button1, % CardOrder6
	if CardStatus = 01110
		{
		GuiControl, , Button1, % CardOrder6
		GuiControl, , Button5, % CardOrder7
		}
	if CardStatus = 01101
		{
		GuiControl, , Button1, % CardOrder6
		GuiControl, , Button4, % CardOrder7
		}
	if CardStatus = 01100
		{
		GuiControl, , Button1, % CardOrder6
		GuiControl, , Button4, % CardOrder7
		GuiControl, , Button5, % CardOrder8
		}
	if CardStatus = 01011
		{
		GuiControl, , Button1, % CardOrder6
		GuiControl, , Button3, % CardOrder7
		}
	if CardStatus = 01010
		{
		GuiControl, , Button1, % CardOrder6
		GuiControl, , Button3, % CardOrder7
		GuiControl, , Button5, % CardOrder8
		}
	if CardStatus = 01001
		{
		GuiControl, , Button1, % CardOrder6
		GuiControl, , Button3, % CardOrder7
		GuiControl, , Button4, % CardOrder8
		}
	if CardStatus = 01000
		{
		GuiControl, , Button1, % CardOrder6
		GuiControl, , Button3, % CardOrder7
		GuiControl, , Button4, % CardOrder8
		GuiControl, , Button5, % CardOrder9
		}
	if CardStatus = 00111
		{
		GuiControl, , Button1, % CardOrder6
		GuiControl, , Button2, % CardOrder7
		}
	if CardStatus = 00110
		{
		GuiControl, , Button1, % CardOrder6
		GuiControl, , Button2, % CardOrder7
		GuiControl, , Button5, % CardOrder8
		}
	if CardStatus = 00101
		{
		GuiControl, , Button1, % CardOrder6
		GuiControl, , Button2, % CardOrder7
		GuiControl, , Button4, % CardOrder8
		}
	if CardStatus = 00100
		{
		GuiControl, , Button1, % CardOrder6
		GuiControl, , Button2, % CardOrder7
		GuiControl, , Button4, % CardOrder8
		GuiControl, , Button5, % CardOrder9
		}
	if CardStatus = 00011
		{
		GuiControl, , Button1, % CardOrder6
		GuiControl, , Button2, % CardOrder7
		GuiControl, , Button3, % CardOrder8
		}
	if CardStatus = 00010
		{
		GuiControl, , Button1, % CardOrder6
		GuiControl, , Button2, % CardOrder7
		GuiControl, , Button3, % CardOrder8
		GuiControl, , Button5, % CardOrder9
		}
	if CardStatus = 00001
		{
		GuiControl, , Button1, % CardOrder6
		GuiControl, , Button2, % CardOrder7
		GuiControl, , Button3, % CardOrder8
		GuiControl, , Button4, % CardOrder9
		}
	if CardStatus = 00000
		{
		GuiControl, , Button1, % CardOrder6
		GuiControl, , Button2, % CardOrder7
		GuiControl, , Button3, % CardOrder8
		GuiControl, , Button4, % CardOrder9
		GuiControl, , Button5, % CardOrder10
		}
	GuiControl, , Button11, Restart

GuiControlGet, TextCard1, ,Button1, Text
GuiControlGet, TextCard2, ,Button2, Text
GuiControlGet, TextCard3, ,Button3, Text
GuiControlGet, TextCard4, ,Button4, Text
GuiControlGet, TextCard5, ,Button5, Text

ifinstring, TextCard1, ♥
	{
	Gui, Font, cRed 
	GuiControl, Font, Button1
	Gui, Font, s14 Helvetica 
	}
ifinstring, TextCard1, ♦
	{
	Gui, Font, cRed
	GuiControl, Font, Button1
	Gui, Font, s14 Helvetica
	}
ifinstring, TextCard1, ♠
	{
	Gui, Font, cBlack
	GuiControl, Font, Button1
	Gui, Font, s14 Helvetica
	}
ifinstring, TextCard1, ♣
	{
	Gui, Font, cBlack
	GuiControl, Font, Button1
	Gui, Font, s14 Helvetica
	}
ifinstring, TextCard2, ♥
	{
	Gui, Font, cRed 
	GuiControl, Font, Button2
	Gui, Font, s14 Helvetica
	}
ifinstring, TextCard2, ♦
	{
	Gui, Font, cRed
	GuiControl, Font, Button2
	Gui, Font, s14 Helvetica
	}
ifinstring, TextCard2, ♠
	{
	Gui, Font, cBlack
	GuiControl, Font, Button2
	Gui, Font, s14 Helvetica
	}
ifinstring, TextCard2, ♣
	{
	Gui, Font, cBlack
	GuiControl, Font, Button2
	Gui, Font, s14 Helvetica
	}
ifinstring, TextCard3, ♥
	{
	Gui, Font, cRed 
	GuiControl, Font, Button3
	Gui, Font, s14 Helvetica
	}
ifinstring, TextCard3, ♦
	{
	Gui, Font, cRed
	GuiControl, Font, Button3
	Gui, Font, s14 Helvetica 
	}
ifinstring, TextCard3, ♠
	{
	Gui, Font, cBlack
	GuiControl, Font, Button3
	Gui, Font, s14 Helvetica 
	}
ifinstring, TextCard3, ♣
	{
	Gui, Font, cBlack
	GuiControl, Font, Button3
	Gui, Font, s14 Helvetica 
	}
ifinstring, TextCard4, ♥
	{
	Gui, Font, cRed 
	GuiControl, Font, Button4
	Gui, Font, s14 Helvetica
	}
ifinstring, TextCard4, ♦
	{
	Gui, Font, cRed
	GuiControl, Font, Button4
	Gui, Font, s14 Helvetica
	}
ifinstring, TextCard4, ♠
	{
	Gui, Font, cBlack
	GuiControl, Font, Button4
	Gui, Font, s14 Helvetica
	}
ifinstring, TextCard4, ♣
	{
	Gui, Font, cBlack
	GuiControl, Font, Button4
	Gui, Font, s14 Helvetica 
	}
ifinstring, TextCard5, ♥
	{
	Gui, Font, cRed 
	GuiControl, Font, Button5
	Gui, Font, s14 Helvetica
	}
ifinstring, TextCard5, ♦
	{
	Gui, Font, cRed
	GuiControl, Font, Button5
	Gui, Font, s14 Helvetica 
	}
ifinstring, TextCard5, ♠
	{
	Gui, Font, cBlack
	GuiControl, Font, Button5
	Gui, Font, s14 Helvetica
	}
ifinstring, TextCard5, ♣
	{
	Gui, Font, cBlack
	GuiControl, Font, Button5
	Gui, Font, s14 Helvetica
	}
	
GuiControlGet, TextCard1, ,Button1, Text
GuiControlGet, TextCard2, ,Button2, Text
GuiControlGet, TextCard3, ,Button3, Text
GuiControlGet, TextCard4, ,Button4, Text
GuiControlGet, TextCard5, ,Button5, Text

global FinalResults := TextCard1 "|" TextCard2 "|" TextCard3 "|" TextCard4 "|" TextCard5



;  ♥
;  ♦
;  ♠
;  ♣

SearchResults := ""

Search1  := "♥"
Search2  := "♦"
Search3  := "♠"
Search4  := "♣"
Search5  := "J"
Search6  := "Q"
Search7  := "K"
Search8  := "A"
Search9  := "2"
Search10 := "3"
Search11 := "4"
Search12 := "5"
Search13 := "6"
Search14 := "7"
Search15 := "8"
Search16 := "9"
Search17 := "10"

Loop 17
{
StringReplace, FinalResults, FinalResults, % Search%A_Index%, % Search%A_Index%, UseErrorLevel
Result%A_Index% := ErrorLevel

if ErrorLevel = 0
	{
	}
else
	{
SearchResults = % SearchResults . Search%A_Index% " = " Result%A_Index% "`n"
	}	
}

if (InStr(SearchResults,"2 = 1") AND InStr(SearchResults,"3 = 1") AND InStr(SearchResults,"4 = 1") AND InStr(SearchResults,"5 = 1") AND InStr(SearchResults,"6 = 1") )
	If (InStr(SearchResults,"♥ = 5") OR InStr(SearchResults,"♦ = 5") OR InStr(SearchResults,"♠ = 5") OR InStr(SearchResults,"♣ = 5"))
		{
		AmountWon := CurrentBet * 50
		GuiControl, , Static1, You win! - Straight Flush! (2-6)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 3
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, StraightFlushes, PokerStats.ini, Stats, StraightFlushes
		StraightFlushes++
		IniWrite, %StraightFlushes%, PokerStats.ini, Stats, StraightFlushes
		return
		}
	else
		{
		AmountWon := CurrentBet * 4
		GuiControl, , Static1, You win! - Straight. (2-6)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 7
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, Straights, PokerStats.ini, Stats, Straights
		Straight++
		IniWrite, %Straights%, PokerStats.ini, Stats, Straights
		return
		}
	
else if (InStr(SearchResults,"3 = 1") AND InStr(SearchResults,"4 = 1") AND InStr(SearchResults,"5 = 1") AND InStr(SearchResults,"6 = 1") AND InStr(SearchResults,"7 = 1") )
	If (InStr(SearchResults,"♥ = 5") OR InStr(SearchResults,"♦ = 5") OR InStr(SearchResults,"♠ = 5") OR InStr(SearchResults,"♣ = 5"))
		{
		AmountWon := CurrentBet * 50
		GuiControl, , Static1, You win! - Straight Flush! (3-7)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 3
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, StraightFlushes, PokerStats.ini, Stats, StraightFlushes
		StraightFlushes++
		IniWrite, %StraightFlushes%, PokerStats.ini, Stats, StraightFlushes
		return
		}
	else
		{
		AmountWon := CurrentBet * 4
		GuiControl, , Static1, You win! - Straight. (3-7)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 7
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, Straights, PokerStats.ini, Stats, Straights
		Straight++
		IniWrite, %Straights%, PokerStats.ini, Stats, Straights
		return
		}
	
else if (InStr(SearchResults,"4 = 1") AND InStr(SearchResults,"5 = 1") AND InStr(SearchResults,"6 = 1") AND InStr(SearchResults,"7 = 1") AND InStr(SearchResults,"8 = 1") )
	If (InStr(SearchResults,"♥ = 5") OR InStr(SearchResults,"♦ = 5") OR InStr(SearchResults,"♠ = 5") OR InStr(SearchResults,"♣ = 5"))
		{
		AmountWon := CurrentBet * 50
		GuiControl, , Static1, You win! - Straight Flush! (4-8)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 3
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, StraightFlushes, PokerStats.ini, Stats, StraightFlushes
		StraightFlushes++
		IniWrite, %StraightFlushes%, PokerStats.ini, Stats, StraightFlushes
		return
		}
	else
		{
		AmountWon := CurrentBet * 4
		GuiControl, , Static1, You win! - Straight. (4-8)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 7
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, Straights, PokerStats.ini, Stats, Straights
		Straight++
		IniWrite, %Straights%, PokerStats.ini, Stats, Straights
		return
		}
	
else if (InStr(SearchResults,"5 = 1") AND InStr(SearchResults,"6 = 1") AND InStr(SearchResults,"7 = 1") AND InStr(SearchResults,"8 = 1") AND InStr(SearchResults,"9 = 1") )
	If (InStr(SearchResults,"♥ = 5") OR InStr(SearchResults,"♦ = 5") OR InStr(SearchResults,"♠ = 5") OR InStr(SearchResults,"♣ = 5"))	
		{
		AmountWon := CurrentBet * 50
		GuiControl, , Static1, You win! - Straight Flush! (5-9)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 3
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, StraightFlushes, PokerStats.ini, Stats, StraightFlushes
		StraightFlushes++
		IniWrite, %StraightFlushes%, PokerStats.ini, Stats, StraightFlushes
		return
		}
	else
		{
		AmountWon := CurrentBet * 4
		GuiControl, , Static1, You win! - Straight. (5-9)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 7
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, Straights, PokerStats.ini, Stats, Straights
		Straight++
		IniWrite, %Straights%, PokerStats.ini, Stats, Straights
		return
		}
		
else if (InStr(SearchResults,"6 = 1") AND InStr(SearchResults,"7 = 1") AND InStr(SearchResults,"8 = 1") AND InStr(SearchResults,"9 = 1") AND InStr(SearchResults,"10 = 1") )
	If (InStr(SearchResults,"♥ = 5") OR InStr(SearchResults,"♦ = 5") OR InStr(SearchResults,"♠ = 5") OR InStr(SearchResults,"♣ = 5"))	
		{
		AmountWon := CurrentBet * 50
		GuiControl, , Static1, You win! - Straight Flush! (6-10)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 3
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, StraightFlushes, PokerStats.ini, Stats, StraightFlushes
		StraightFlushes++
		IniWrite, %StraightFlushes%, PokerStats.ini, Stats, StraightFlushes
		return
		}
	else
		{
		AmountWon := CurrentBet * 4
		GuiControl, , Static1, You win! - Straight. (6-10)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 7
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, Straights, PokerStats.ini, Stats, Straights
		Straight++
		IniWrite, %Straights%, PokerStats.ini, Stats, Straights
		return
		}

else if (InStr(SearchResults,"7 = 1") AND InStr(SearchResults,"8 = 1") AND InStr(SearchResults,"9 = 1") AND InStr(SearchResults,"10 = 1") AND InStr(SearchResults,"J = 1") )
	If (InStr(SearchResults,"♥ = 5") OR InStr(SearchResults,"♦ = 5") OR InStr(SearchResults,"♠ = 5") OR InStr(SearchResults,"♣ = 5"))
		{
		AmountWon := CurrentBet * 50
		GuiControl, , Static1, You win! - Straight Flush! (7-J)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 3
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, StraightFlushes, PokerStats.ini, Stats, StraightFlushes
		StraightFlushes++
		IniWrite, %StraightFlushes%, PokerStats.ini, Stats, StraightFlushes
		return
		}
	else
		{
		AmountWon := CurrentBet * 4
		GuiControl, , Static1, You win! - Straight. (7-J)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 7
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, Straights, PokerStats.ini, Stats, Straights
		Straight++
		IniWrite, %Straights%, PokerStats.ini, Stats, Straights
		return
		}

else if (InStr(SearchResults,"7 = 1") AND InStr(SearchResults,"8 = 1") AND InStr(SearchResults,"9 = 1") AND InStr(SearchResults,"10 = 1") AND InStr(SearchResults,"J = 1") )
	If (InStr(SearchResults,"♥ = 5") OR InStr(SearchResults,"♦ = 5") OR InStr(SearchResults,"♠ = 5") OR InStr(SearchResults,"♣ = 5"))	
		{
		AmountWon := CurrentBet * 50
		GuiControl, , Static1, You win! - Straight Flush! (7-J)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 3
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, StraightFlushes, PokerStats.ini, Stats, StraightFlushes
		StraightFlushes++
		IniWrite, %StraightFlushes%, PokerStats.ini, Stats, StraightFlushes
		return
		}
	else
		{
		AmountWon := CurrentBet * 4
		GuiControl, , Static1, You win! - Straight. (7-J)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 7
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, Straights, PokerStats.ini, Stats, Straights
		Straight++
		IniWrite, %Straights%, PokerStats.ini, Stats, Straights
		return
		}

else if (InStr(SearchResults,"8 = 1") AND InStr(SearchResults,"9 = 1") AND InStr(SearchResults,"10 = 1") AND InStr(SearchResults,"J = 1") AND InStr(SearchResults,"Q = 1") )
	If (InStr(SearchResults,"♥ = 5") OR InStr(SearchResults,"♦ = 5") OR InStr(SearchResults,"♠ = 5") OR InStr(SearchResults,"♣ = 5"))		
		{
		AmountWon := CurrentBet * 50
		GuiControl, , Static1, You win! - Straight Flush! (8-Q)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 3
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, StraightFlushes, PokerStats.ini, Stats, StraightFlushes
		StraightFlushes++
		IniWrite, %StraightFlushes%, PokerStats.ini, Stats, StraightFlushes
		return
		}
	else
		{
		AmountWon := CurrentBet * 4
		GuiControl, , Static1, You win! - Straight. (8-Q)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 7
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, Straights, PokerStats.ini, Stats, Straights
		Straight++
		IniWrite, %Straights%, PokerStats.ini, Stats, Straights
		return
		}

else if (InStr(SearchResults,"9 = 1") AND InStr(SearchResults,"10 = 1") AND InStr(SearchResults,"J = 1") AND InStr(SearchResults,"Q = 1") AND InStr(SearchResults,"K = 1") )
		If (InStr(SearchResults,"♥ = 5") OR InStr(SearchResults,"♦ = 5") OR InStr(SearchResults,"♠ = 5") OR InStr(SearchResults,"♣ = 5"))		
		{
		AmountWon := CurrentBet * 50
		GuiControl, , Static1, You win! - Straight Flush! (9-K)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 3
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, StraightFlushes, PokerStats.ini, Stats, StraightFlushes
		StraightFlushes++
		IniWrite, %StraightFlushes%, PokerStats.ini, Stats, StraightFlushes
		return
		}
	else
		{
		AmountWon := CurrentBet * 4
		GuiControl, , Static1, You win! - Straight. (9-K)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 7
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, Straights, PokerStats.ini, Stats, Straights
		Straight++
		IniWrite, %Straights%, PokerStats.ini, Stats, Straights
		return
		}

else if (InStr(SearchResults,"10 = 1") AND InStr(SearchResults,"J = 1") AND InStr(SearchResults,"Q = 1") AND InStr(SearchResults,"K = 1") AND InStr(SearchResults,"A = 1") )
	If (InStr(SearchResults,"♥ = 5") OR InStr(SearchResults,"♦ = 5") OR InStr(SearchResults,"♠ = 5") OR InStr(SearchResults,"♣ = 5"))		
		{
		AmountWon := CurrentBet * 800
		GuiControl, , Static1, You win! - Royal Flush! (10-A)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 2
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, RoyalFlushes, PokerStats.ini, Stats, RoyalFlushes
		RoyalFlushes++
		IniWrite, %RoyalFlushes%, PokerStats.ini, Stats, RoyalFlushes
		return
		}
	else
		{
		AmountWon := CurrentBet * 4
		GuiControl, , Static1, You win! - Straight. (10-A)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 7
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, Straights, PokerStats.ini, Stats, Straights
		Straight++
		IniWrite, %Straights%, PokerStats.ini, Stats, Straights
		return
		}
	

else If (InStr(SearchResults,"♥ = 5") OR InStr(SearchResults,"♦ = 5") OR InStr(SearchResults,"♠ = 5") OR InStr(SearchResults,"♣ = 5"))
	{
	AmountWon := CurrentBet * 6
	GuiControl, , Static1, You win! - Flush.`nAmount Won: %AmountWon%
	GuiControl, Show, Static1
	GuiControl, Choose, ListBox1, 6
	Credits := Credits + AmountWon
	IniWrite, %Credits%, PokerStats.ini, Stats, Credits
	IniRead, Flushes, PokerStats.ini, Stats, Flushes
	Flushes++
	IniWrite, %Flushes%, PokerStats.ini, Stats, Flushes
	return
	}
	
else If (InStr(SearchResults,"A = 4") OR InStr(SearchResults,"2 = 4") OR InStr(SearchResults,"3 = 4") OR InStr(SearchResults,"4 = 4") OR InStr(SearchResults,"5 = 4") OR InStr(SearchResults,"6 = 4") OR InStr(SearchResults,"7 = 4") OR InStr(SearchResults,"8 = 4") OR InStr(SearchResults,"9 = 4") OR InStr(SearchResults,"10 = 4") OR InStr(SearchResults,"J = 4") OR InStr(SearchResults,"Q = 4") OR InStr(SearchResults,"K = 4"))	
	{
	AmountWon := CurrentBet * 25
	GuiControl, , Static1, You win! - 4 of a Kind.`nAmount Won: %AmountWon%
	GuiControl, Show, Static1
	GuiControl, Choose, ListBox1, 4
	Credits := Credits + AmountWon
	IniWrite, %Credits%, PokerStats.ini, Stats, Credits
	IniRead, FourOfAKinds, PokerStats.ini, Stats, FourOfAKinds
	FourOfAKinds++
	IniWrite, %FourOfAKinds%, PokerStats.ini, Stats, FourOfAKinds
	return
	}
	
else If (InStr(SearchResults,"A = 3") OR InStr(SearchResults,"2 = 3") OR InStr(SearchResults,"3 = 3") OR InStr(SearchResults,"4 = 3") OR InStr(SearchResults,"5 = 3") OR InStr(SearchResults,"6 = 3") OR InStr(SearchResults,"7 = 3") OR InStr(SearchResults,"8 = 3") OR InStr(SearchResults,"9 = 3") OR InStr(SearchResults,"10 = 3") OR InStr(SearchResults,"J = 3") OR InStr(SearchResults,"Q = 3") OR InStr(SearchResults,"K = 3"))	
	If (InStr(SearchResults,"A = 2") OR InStr(SearchResults,"2 = 2") OR InStr(SearchResults,"3 = 2") OR InStr(SearchResults,"4 = 2") OR InStr(SearchResults,"5 = 2") OR InStr(SearchResults,"6 = 2") OR InStr(SearchResults,"7 = 2") OR InStr(SearchResults,"8 = 2") OR InStr(SearchResults,"9 = 2") OR InStr(SearchResults,"10 = 2") OR InStr(SearchResults,"J = 2") OR InStr(SearchResults,"Q = 2") OR InStr(SearchResults,"K = 2"))	
		{
		AmountWon := CurrentBet * 9
		GuiControl, , Static1, You win! - Full House.`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 5
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, FullHouses, PokerStats.ini, Stats, FullHouses
		FullHouses++
		IniWrite, %FullHouses%, PokerStats.ini, Stats, FullHouses
		return
		}	
	else
		{
		AmountWon := CurrentBet * 3
		GuiControl, , Static1, You win! - 3 of a Kind.`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 8
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, ThreeOfAKinds, PokerStats.ini, Stats, ThreeOfAKinds
		ThreeOfAKinds++
		IniWrite, %ThreeOfAKinds%, PokerStats.ini, Stats, ThreeOfAKinds
		return
		}	
	
else If (InStr(SearchResults,"2 = 2") OR InStr(SearchResults,"3 = 2") OR InStr(SearchResults,"4 = 2") OR InStr(SearchResults,"5 = 2") OR InStr(SearchResults,"6 = 2") OR InStr(SearchResults,"7 = 2") OR InStr(SearchResults,"8 = 2") OR InStr(SearchResults,"9 = 2") OR InStr(SearchResults,"10 = 2") OR InStr(SearchResults,"J = 2") OR InStr(SearchResults,"Q = 2") OR InStr(SearchResults,"K = 2") OR InStr(SearchResults,"A = 2"))	
		If (InStr(SearchResults,"2 = 2") AND InStr(SearchResults,"3 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (2-3)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}
		else If (InStr(SearchResults,"2 = 2") AND InStr(SearchResults,"4 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (2-4)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}
		else If (InStr(SearchResults,"2 = 2") AND InStr(SearchResults,"5 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (2-5)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"2 = 2") AND InStr(SearchResults,"6 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (2-6)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"2 = 2") AND InStr(SearchResults,"7 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (2-7)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}		
		else If (InStr(SearchResults,"2 = 2") AND InStr(SearchResults,"8 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (2-8)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"2 = 2") AND InStr(SearchResults,"9 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (2-9)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"2 = 2") AND InStr(SearchResults,"10 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (2-10)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"2 = 2") AND InStr(SearchResults,"J = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (2-J)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"2 = 2") AND InStr(SearchResults,"Q = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (2-Q)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"2 = 2") AND InStr(SearchResults,"K = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (2-K)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"2 = 2") AND InStr(SearchResults,"A = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (2-A)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}			
		else If (InStr(SearchResults,"3 = 2") AND InStr(SearchResults,"4 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (3-4)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}
		else If (InStr(SearchResults,"3 = 2") AND InStr(SearchResults,"5 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (3-5)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"3 = 2") AND InStr(SearchResults,"6 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (3-6)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"3 = 2") AND InStr(SearchResults,"7 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (3-7)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}		
		else If (InStr(SearchResults,"3 = 2") AND InStr(SearchResults,"8 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (3-8)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"3 = 2") AND InStr(SearchResults,"9 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (3-9)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"3 = 2") AND InStr(SearchResults,"10 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (3-10)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}
		else If (InStr(SearchResults,"3 = 2") AND InStr(SearchResults,"J = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (3-J)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"3 = 2") AND InStr(SearchResults,"Q = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (3-Q)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"3 = 2") AND InStr(SearchResults,"K = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (3-K)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"3 = 2") AND InStr(SearchResults,"A = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (3-A)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"4 = 2") AND InStr(SearchResults,"5 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (4-5)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"4 = 2") AND InStr(SearchResults,"6 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (4-6)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"4 = 2") AND InStr(SearchResults,"7 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (4-7)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}		
		else If (InStr(SearchResults,"4 = 2") AND InStr(SearchResults,"8 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (4-8)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"4 = 2") AND InStr(SearchResults,"9 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (4-9)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"4 = 2") AND InStr(SearchResults,"10 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (4-10)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"4 = 2") AND InStr(SearchResults,"J = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (4-J)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"4 = 2") AND InStr(SearchResults,"Q = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (4-Q)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"4 = 2") AND InStr(SearchResults,"K = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (4-K)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"4 = 2") AND InStr(SearchResults,"A = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (4-A)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"5 = 2") AND InStr(SearchResults,"6 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (5-6)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"5 = 2") AND InStr(SearchResults,"7 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (5-7)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}		
		else If (InStr(SearchResults,"5 = 2") AND InStr(SearchResults,"8 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (5-8)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"5 = 2") AND InStr(SearchResults,"9 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (5-9)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"5 = 2") AND InStr(SearchResults,"10 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (5-10)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"5 = 2") AND InStr(SearchResults,"J = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (5-J)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"5 = 2") AND InStr(SearchResults,"Q = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (5-Q)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"5 = 2") AND InStr(SearchResults,"K = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (5-K)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"5 = 2") AND InStr(SearchResults,"A = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (5-A)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}		
		else If (InStr(SearchResults,"6 = 2") AND InStr(SearchResults,"7 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (6-7)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}		
		else If (InStr(SearchResults,"6 = 2") AND InStr(SearchResults,"8 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (6-8)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"6 = 2") AND InStr(SearchResults,"9 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (6-9)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"6 = 2") AND InStr(SearchResults,"10 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (6-10)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"6 = 2") AND InStr(SearchResults,"J = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (6-J)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"6 = 2") AND InStr(SearchResults,"Q = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (6-Q)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"6 = 2") AND InStr(SearchResults,"K = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (6-K)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"6 = 2") AND InStr(SearchResults,"A = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (6-A)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}		
		else If (InStr(SearchResults,"7 = 2") AND InStr(SearchResults,"8 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (7-8)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"7 = 2") AND InStr(SearchResults,"9 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (7-9)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"7 = 2") AND InStr(SearchResults,"10 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (7-10)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"7 = 2") AND InStr(SearchResults,"J = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (7-J)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"7 = 2") AND InStr(SearchResults,"Q = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (7-Q)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"7 = 2") AND InStr(SearchResults,"K = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (7-K)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"7 = 2") AND InStr(SearchResults,"A = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (7-A)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"8 = 2") AND InStr(SearchResults,"9 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (8-9)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"8 = 2") AND InStr(SearchResults,"10 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (8-10)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"8 = 2") AND InStr(SearchResults,"J = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (8-J)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"8 = 2") AND InStr(SearchResults,"Q = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (8-Q)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"8 = 2") AND InStr(SearchResults,"K = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (8-K)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"8 = 2") AND InStr(SearchResults,"A = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (8-A)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}			
		else If (InStr(SearchResults,"9 = 2") AND InStr(SearchResults,"10 = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (9-10)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"9 = 2") AND InStr(SearchResults,"J = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (9-J)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"9 = 2") AND InStr(SearchResults,"Q = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (9-Q)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"9 = 2") AND InStr(SearchResults,"K = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (9-K)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"9 = 2") AND InStr(SearchResults,"A = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (9-A)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}		
		else If (InStr(SearchResults,"10 = 2") AND InStr(SearchResults,"J = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (10-J)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"10 = 2") AND InStr(SearchResults,"Q = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (10-Q)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"10 = 2") AND InStr(SearchResults,"K = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (10-K)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"10 = 2") AND InStr(SearchResults,"A = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (10-A)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"J = 2") AND InStr(SearchResults,"Q = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (J-Q)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"J = 2") AND InStr(SearchResults,"K = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (J-K)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return		
		}	
		else If (InStr(SearchResults,"J = 2") AND InStr(SearchResults,"A = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (J-A)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}			
		else If (InStr(SearchResults,"Q = 2") AND InStr(SearchResults,"K = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (Q-K)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"Q = 2") AND InStr(SearchResults,"A = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (Q-A)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}			
		else If (InStr(SearchResults,"K = 2") AND InStr(SearchResults,"A = 2"))
		{
		AmountWon := CurrentBet * 2
		GuiControl, , Static1, You win! - Two Pair. (K-A)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 9
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"J = 2"))
		{
		AmountWon := CurrentBet * 1
		GuiControl, , Static1, You win! - Jacks or Better. (J)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 10
		Credits := Credits + (CurrentBet * 1)
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, TwoPairs, PokerStats.ini, Stats, TwoPairs
		TwoPairs++
		IniWrite, %TwoPairs%, PokerStats.ini, Stats, TwoPairs
		return
		}	
		else If (InStr(SearchResults,"Q = 2"))
		{
		AmountWon := CurrentBet * 1
		GuiControl, , Static1, You win! - Jacks or Better. (Q)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 10
		Credits := Credits + (CurrentBet * 1)
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, JacksOrBetter, PokerStats.ini, Stats, JacksOrBetter
		JacksOrBetter++
		IniWrite, %JacksOrBetter%, PokerStats.ini, Stats, JacksOrBetter
		return
		}	
		else If (InStr(SearchResults,"K = 2"))
		{
		AmountWon := CurrentBet * 1
		GuiControl, , Static1, You win! - Jacks or Better. (K)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 10
		Credits := Credits + (CurrentBet * 1)
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, JacksOrBetter, PokerStats.ini, Stats, JacksOrBetter
		JacksOrBetter++
		IniWrite, %JacksOrBetter%, PokerStats.ini, Stats, JacksOrBetter
		return
		}	
		else If (InStr(SearchResults,"A = 2"))
		{
		AmountWon := CurrentBet * 1
		GuiControl, , Static1, You win! - Jacks or Better. (A)`nAmount Won: %AmountWon%
		GuiControl, Show, Static1
		GuiControl, Choose, ListBox1, 10
		Credits := Credits + AmountWon
		IniWrite, %Credits%, PokerStats.ini, Stats, Credits
		IniRead, JacksOrBetter, PokerStats.ini, Stats, JacksOrBetter
		JacksOrBetter++
		IniWrite, %JacksOrBetter%, PokerStats.ini, Stats, JacksOrBetter
		return
		}	
else
	{
	GuiControl, , Static1, You didn't win....
	GuiControl, Show, Static1
	GuiControl, Choose, ListBox1, 11
	IniWrite, %Credits%, PokerStats.ini, Stats, Credits
	IniRead, Losses, PokerStats.ini, Stats, Losses
	Losses++
	IniWrite, %Losses%, PokerStats.ini, Stats, Losses
	return
	}
else
	{
	GuiControl, , Static1, You didn't win....
	GuiControl, Show, Static1
	GuiControl, Choose, ListBox1, 11
	IniWrite, %Credits%, PokerStats.ini, Stats, Credits
	IniRead, Losses, PokerStats.ini, Stats, Losses
	Losses++
	IniWrite, %Losses%, PokerStats.ini, Stats, Losses
	return
	}
}
return

CloseWindow:
Gui, Destroy
return

ShuffleCards:
Gui, Font, s14 Helvetica
;Gui, 2: Font, s14 Helvetica
CardOrder := ""
NextCard = 0
Loop 52
{  
NextCard++
CardOrder := CardOrder "`n" NextCard
}

StringReplace, CardOrder, CardOrder, `n,  , ; This just removes the first hard return.
Sort, CardOrder, N Random                  ; Randomizes order.
StringSplit, CardOrder, CardOrder, `n       ; Splits string into 52 pieces.

Loop 52                                     ; This replaces the numbers with card names.
{
if CardOrder%A_Index% = 1
	CardOrder%A_Index% := Card1
if CardOrder%A_Index% = 2
	CardOrder%A_Index% := Card2
if CardOrder%A_Index% = 3
	CardOrder%A_Index% := Card3
if CardOrder%A_Index% = 4
	CardOrder%A_Index% := Card4
if CardOrder%A_Index% = 5
	CardOrder%A_Index% := Card5
if CardOrder%A_Index% = 6
	CardOrder%A_Index% := Card6
if CardOrder%A_Index% = 7
	CardOrder%A_Index% := Card7
if CardOrder%A_Index% = 8
	CardOrder%A_Index% := Card8
if CardOrder%A_Index% = 9
	CardOrder%A_Index% := Card9
if CardOrder%A_Index% = 10
	CardOrder%A_Index% := Card10
if CardOrder%A_Index% = 11
	CardOrder%A_Index% := Card11
if CardOrder%A_Index% = 12
	CardOrder%A_Index% := Card12
if CardOrder%A_Index% = 13
	CardOrder%A_Index% := Card13
if CardOrder%A_Index% = 14
	CardOrder%A_Index% := Card14
if CardOrder%A_Index% = 15
	CardOrder%A_Index% := Card15
if CardOrder%A_Index% = 16
	CardOrder%A_Index% := Card16
if CardOrder%A_Index% = 17
	CardOrder%A_Index% := Card17
if CardOrder%A_Index% = 18
	CardOrder%A_Index% := Card18
if CardOrder%A_Index% = 19
	CardOrder%A_Index% := Card19
if CardOrder%A_Index% = 20
	CardOrder%A_Index% := Card20
if CardOrder%A_Index% = 21
	CardOrder%A_Index% := Card21
if CardOrder%A_Index% = 22
	CardOrder%A_Index% := Card22
if CardOrder%A_Index% = 23
	CardOrder%A_Index% := Card23
if CardOrder%A_Index% = 24
	CardOrder%A_Index% := Card24
if CardOrder%A_Index% = 25
	CardOrder%A_Index% := Card25
if CardOrder%A_Index% = 26
	CardOrder%A_Index% := Card26
if CardOrder%A_Index% = 27
	CardOrder%A_Index% := Card27
if CardOrder%A_Index% = 28
	CardOrder%A_Index% := Card28
if CardOrder%A_Index% = 29
	CardOrder%A_Index% := Card29
if CardOrder%A_Index% = 30
	CardOrder%A_Index% := Card30
if CardOrder%A_Index% = 31
	CardOrder%A_Index% := Card31
if CardOrder%A_Index% = 32
	CardOrder%A_Index% := Card32
if CardOrder%A_Index% = 33
	CardOrder%A_Index% := Card33
if CardOrder%A_Index% = 34
	CardOrder%A_Index% := Card34
if CardOrder%A_Index% = 35
	CardOrder%A_Index% := Card35
if CardOrder%A_Index% = 36
	CardOrder%A_Index% := Card36
if CardOrder%A_Index% = 37
	CardOrder%A_Index% := Card37
if CardOrder%A_Index% = 38
	CardOrder%A_Index% := Card38
if CardOrder%A_Index% = 39
	CardOrder%A_Index% := Card39
if CardOrder%A_Index% = 40
	CardOrder%A_Index% := Card40
if CardOrder%A_Index% = 41
	CardOrder%A_Index% := Card41
if CardOrder%A_Index% = 42
	CardOrder%A_Index% := Card42
if CardOrder%A_Index% = 43
	CardOrder%A_Index% := Card43
if CardOrder%A_Index% = 44
	CardOrder%A_Index% := Card44
if CardOrder%A_Index% = 45
	CardOrder%A_Index% := Card45
if CardOrder%A_Index% = 46
	CardOrder%A_Index% := Card46
if CardOrder%A_Index% = 47
	CardOrder%A_Index% := Card47
if CardOrder%A_Index% = 48
	CardOrder%A_Index% := Card48
if CardOrder%A_Index% = 49
	CardOrder%A_Index% := Card49
if CardOrder%A_Index% = 50
	CardOrder%A_Index% := Card50
if CardOrder%A_Index% = 51
	CardOrder%A_Index% := Card51
if CardOrder%A_Index% = 52
	CardOrder%A_Index% := Card52	
ifinstring, CardOrder%A_Index%, ♥
	{
	Gui, Font, cRed 
	GuiControl, Font, Button%A_Index%
	Gui, Font, s14 Helvetica
	}
ifinstring, CardOrder%A_Index%, ♦
	{
	Gui, Font, cRed
	GuiControl, Font, Button%A_Index%
	Gui, Font, s14 Helvetica
	}
ifinstring, CardOrder%A_Index%, ♠
	{
	Gui, Font, cBlack
	GuiControl, Font, Button%A_Index%
	Gui, Font, s14 Helvetica
	}
ifinstring, CardOrder%A_Index%, ♣
	{
	Gui, Font, cBlack 
	GuiControl, Font, Button%A_Index%
	Gui, Font, s14 Helvetica
	}
}
GuiControl, , Button1, % CardOrder1
GuiControl, , Button2, % CardOrder2
GuiControl, , Button3, % CardOrder3
GuiControl, , Button4, % CardOrder4
GuiControl, , Button5, % CardOrder5
return

GuiClose:
ExitApp
return
