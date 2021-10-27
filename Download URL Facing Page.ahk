#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

F9::
InputBox, URLtoDownload, This is a test., This is a test too.
UrlDownloadToFile, %URLtoDownload%, desktoptest.txt
return

F10::   ; This is for Patents AND Trademarks.
FileRead, ReadFile, desktoptest.txt
MsgBox, %ReadFile%
StringReplace, ReadFile, ReadFile, <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">, ,All
StringReplace, ReadFile, ReadFile, <strong>, ,All
StringReplace, ReadFile, ReadFile, </strong>, ,All
StringReplace, ReadFile, ReadFile, <br><br>, `n ,All
StringReplace, ReadFile, ReadFile, <br>,`n ,All
StringReplace, ReadFile, ReadFile, <td></td>, ,All
StringReplace, ReadFile, ReadFile, <tr></tr>, ,All
StringReplace, ReadFile, ReadFile, <u>, ,All
StringReplace, ReadFile, ReadFile, </u>, ,All
StringReplace, ReadFile, ReadFile, <tr>, ,All
StringReplace, ReadFile, ReadFile, </tr>, ,All
StringReplace, ReadFile, ReadFile, <td>, ,All
StringReplace, ReadFile, ReadFile, </td>, `n ,All
StringReplace, ReadFile, ReadFile, <td align="right">, ,All
StringReplace, ReadFile, ReadFile, <html>, ,All
StringReplace, ReadFile, ReadFile, <head>, ,All
StringReplace, ReadFile, ReadFile, </head>, ,All
StringReplace, ReadFile, ReadFile, <title>, ,All
StringReplace, ReadFile, ReadFile, </title>, ,All
StringReplace, ReadFile, ReadFile, <td colspan="2">, ,All
StringReplace, ReadFile, ReadFile, <td colspan="3">, ,All
StringReplace, ReadFile, ReadFile, <td colspan="4">, ,All
StringReplace, ReadFile, ReadFile, <td valign="top">, `n ,All
StringReplace, ReadFile, ReadFile, <table width="200" border="0" cellspacing="0" cellpadding="2">, ,All
StringReplace, ReadFile, ReadFile, <span title=, ,All
StringReplace, ReadFile, ReadFile, </span>, ,All
StringReplace, ReadFile, ReadFile, <body leftmargin="25">, ,All
StringReplace, ReadFile, ReadFile, <hr size="1px" color="black">, ,All
StringReplace, ReadFile, ReadFile, <table width="100`%" cellpadding="0" cellspacing="0">, ,All
StringReplace, ReadFile, ReadFile, </table>, ,All
StringReplace, ReadFile, ReadFile, <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">, ,All
StringReplace, ReadFile, ReadFile, <font size="+1">, ,All
StringReplace, ReadFile, ReadFile, <font size="+2">, ,All
StringReplace, ReadFile, ReadFile, </font>, ,All
StringReplace, ReadFile, ReadFile,% "&nbsp;", ,All
StringReplace, ReadFile, ReadFile, Case Number,`nCase Number ,All
StringReplace, ReadFile, ReadFile, "> , %A_Space%-%A_Space% ,All 
StringReplace, ReadFile, ReadFile, " ,  ,All
StringReplace, ReadFile, ReadFile, `r`n`r`n`r`n`r`n`r`n`r`n`r`n`r`n`r`n`r`n,  ,All
StringReplace, ReadFile, ReadFile, `r`n`r`n`r`n`r`n`r`n`r`n`r`n`r`n, `n  ,All
StringReplace, ReadFile, ReadFile, `r`n`r`n`r`n`r`n`r`n`r`n`r`n,   ,All
StringReplace, ReadFile, ReadFile, `r`n`r`n`r`n`r`n`r`n`r`n,   ,All
StringReplace, ReadFile, ReadFile, `r`n`r`n`r`n`r`n`r`n,  ,All
StringReplace, ReadFile, ReadFile, `r`n`r`n`r`n`r`n,  ,All
StringReplace, ReadFile, ReadFile, `r`n`r`n`r`n, `n ,All
StringReplace, ReadFile, ReadFile, `r`n`r`n,  ,All
StringReplace, ReadFile, ReadFile, `r`n,  ,All
StringReplace, ReadFile, ReadFile, `t, ,All
StringReplace, ReadFile, ReadFile, `n`n, ,All
StringReplace, ReadFile, ReadFile, `n`n`n, ASDF ,All
StringReplace, ReadFile, ReadFile, %A_Space%%A_Space%%A_Space%, ,All
StringReplace, ReadFile, ReadFile, <td align=center - List Of User Actions,`nList Of User Actions ,All
StringReplace, ReadFile, ReadFile, <td colspan=3 align=center -, ,All
StringReplace, ReadFile, ReadFile, % "<table width=75% cellpadding=0 cellspacing=0 - Action(s) Due",`nAction(s) Due ,All
StringReplace, ReadFile, ReadFile, Remarks:,`nRemarks ,All
MsgBox, %ReadFile%
return
