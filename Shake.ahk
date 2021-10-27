﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force


#z::
Shake:
WinGetPos, WinPosX, WinPosY, WinWidth , WinHeight, A,
WinMove, A,, WinPosX+3, WinPosY,  ; WinWidth, 941
WinMove, A,, WinPosX, WinPosY,  ; WinWidth, 941
WinMove, A,, WinPosX-3, WinPosY,  ; WinWidth, 941
WinMove, A,, WinPosX, WinPosY,  ; WinWidth, 941
WinMove, A,, WinPosX+3, WinPosY,  ; WinWidth, 941
WinMove, A,, WinPosX, WinPosY,  ; WinWidth, 941
WinMove, A,, WinPosX-3, WinPosY,  ; WinWidth, 941
WinMove, A,, WinPosX, WinPosY,  ; WinWidth, 941
return