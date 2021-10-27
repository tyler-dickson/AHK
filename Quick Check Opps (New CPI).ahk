; Created with AutoHotkey by Tyler Dickson.  

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, Shell32.dll, 23

global CleanedApps := ""
global CurrentRows

global Computername
StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
	UserFolder = %A_LoopFileName%
if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder	

IniRead,  APIUses, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements,  APIUses
	if  APIUses = ERROR
		{
		APIUses = 0
		IniWrite, %APIUses%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements,  APIUses
		IniRead,  APIUses, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements,  APIUses
		}


TrayTip, Windows + D to grab apps., Windows + D to grab apps.
return

#d::
CleanedApps := ""
Clipboard := ""
Sleep 500
SendInput ^c
ClipWait, 2

StringSplit, AllApps, Clipboard, `r`n

Loop %AllApps0%
{
if (AllApps%A_Index% != " ") && (AllApps%A_Index% != "") && (AllApps%A_Index% != "     ")
	{
	;MsgBox, % "|" AllApps%A_Index% "|"
	
	Temp := AllApps%A_Index%
	
	if (CleanedApps == "")
		CleanedApps := Temp
	else
		CleanedApps := CleanedApps "`n" Temp
	}
}

StringReplace, CleanedApps, CleanedApps, % "App " , , A

formattime, Today, , MMddyy          ; yyyy-MM-dd
Gui, New, , Check for Existing Possible Oppositions (New CPI)
Gui, Add, Edit, Center x10 y55 w150 h400 gBackEnd vBackEnd, %CleanedApps%		
Gui, Font
Gui, Add, Edit, Center x10 y25 w130 ReadOnly vNumberOfCodes , 0
Gui, Font, s11 
Gui, Add, Text, Center x10 y5 w130, Client Code Count:
Gui, Add, ListView, x165 y55 w600 h400 Checked Right Grid vLoadedFiles , App Number|Found?           ; gCheckRowClick                                               |Due Date         |Date Taken
Gui, Add, Button, x165 y25 w200 h22 gNewCPIGrabTMData, Check For Existing Poss Opps
gosub BackEnd
Gui, Show, w775
return

BackEnd:
GuiControlGet, Edit1Status, , Edit1
StringSplit, Edit1Status, Edit1Status, `n, 
GuiControl, , Edit2, %Edit1Status0%

LV_Delete()
Loop %Edit1Status0%
{
LV_Add("", Edit1Status%A_Index%, "Click button to search records.", "--", "--")
LV_ModifyCol(1, "AutoHdr")
}

return

Append:
Gui, Submit, NoHide
StringSplit, BackEnd, BackEnd, `n, , 
; LV_Delete()
Sleep 1000
AppNumber = 1

Loop %BackEnd0%
{
LV_Modify(A_Index, "-Check", Edit1Status%A_Index%, "Pending search in 000Z...", "--", "--")
LV_ModifyCol(1, "AutoHdr")
}


Loop %BackEnd0%
{
LV_Modify(AppNumber, "", Edit1Status%AppNumber%, "Searching 000Z for " Edit1Status%AppNumber%, "--", "--")
Info := ""
BaseNumber := ""
Var2 := ie.document.GetElementsByTagName("TD").length

Loop %Var2%
	{
	NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
	NewInfoLength := StrLen(NewInfo)

	if (NewInfoLength < 100)
		{
		ifinstring, NewInfo, % BackEnd%AppNumber%
			{
			BaseNumber := A_Index - 1
			Action1 := ie.document.GetElementsByTagName("TD")[BaseNumber].InnerText
			Action2 := ie.document.GetElementsByTagName("TD")[BaseNumber + 1].InnerText
			Action4 := ie.document.GetElementsByTagName("TD")[BaseNumber + 3].InnerText
			LV_Modify(AppNumber, "Check", BackEnd%AppNumber%, Action1, Action2, Action4)
			AppNumber++
			break
			}
		}
	}
	
	if (BaseNumber == "")
		{
		Action1 := "Not on 000Z! Double-click to check for ZT."
		Action2 := "--"
		Action4 := "--"
		LV_Modify(AppNumber, "", BackEnd%AppNumber%, Action1, Action2, Action4)
		Sleep 250
		;gosub CheckRow
		AppNumber++
		}
		LV_ModifyCol(A_Index, "AutoHdr")
}
return

/*
CheckRowClick:
if (A_GuiEvent == "DoubleClick")
	CurrentRows := A_EventInfo
else
	return

LV_GetText(AppNoSearch, A_EventInfo , 1)

Action1 := "Checking for a ZT record..."
Action2 := "--"
Action4 := "--"
LV_Modify(CurrentRows, "", AppNoSearch, Action1, Action2, Action4)

Sleep, 1000
OutputVar := "http://oc-docketing/CPi/tmkschActionDue.aspx"
ie2.Navigate(OutputVar)
Sleep 1500
ie2.Document.All.schstrActionDue_TextBox.Value := "*" AppNoSearch "*"
Sleep 1500

Loop 25
{
if (ie2.Document.All.schstrActionDue_TextBox.Value == "")
	Sleep 250
else
	break
}
ie2.Document.All.btnStartSearch.Click()
Sleep 1500

Loop 25
{
FoundClientCode := ie2.Document.All.fldstrCaseNumber_TextBox.Value
;MsgBox, %FoundClientCode%
	if (FoundClientCode == "")
		Sleep 150
	else
		{
		LV_Modify(A_EventInfo,"Check" ,AppNoSearch, "Found on " FoundClientCode, "OK", "OK")
		LV_ModifyCol(2, "AutoHdr")
		break
		}
}
	
if (FoundClientCode == "")
	{
	Action1 := "Still not found! Checking one more thing..."
	Action2 := "-"
	Action4 := "-"
	LV_Modify(A_EventInfo, ,AppNoSearch, Action1, Action2, Action4)
	LV_ModifyCol(2, "AutoHdr")
	Sleep 2000
	
		Loop 10
			{
			AS := ie2.document.GetElementsBytagname("A").length
				if AS = 0 
					Sleep 250
				else
					break
			}
		
		Sleep 1000
		
		Loop %AS%
		{
		TempAction := ie2.document.GetElementsBytagname("A")[A_Index-1].InnerText
			ifinstring, TempAction, ZT
				{
				TempAction := Trim(TempAction)
				LV_Modify(A_EventInfo,"Check" ,AppNoSearch, "Found on " TempAction, "OK", "OK")
				LV_ModifyCol(2, "AutoHdr")
				return
				}
		}
	LV_Modify(A_EventInfo,  ,AppNoSearch, "Still didn't find it. Go ahead and docket it.", "--", "--")
	LV_ModifyCol(2, "AutoHdr")	

	;Var2 := ie.document.GetElementsByTagName("TD").length

	/*
	Loop %Var2%
		{
		NewInfo := ie.document.GetElementsByTagName("TD")[A_Index-1].InnerText
		NewInfoLength := StrLen(NewInfo)

		if (NewInfoLength < 100)
			{
			ifinstring, NewInfo, %AppNoSearch%
				{
				BaseNumber := A_Index - 1
				Action1 := ie.document.GetElementsByTagName("TD")[BaseNumber].InnerText
				Action2 := ie.document.GetElementsByTagName("TD")[BaseNumber + 1].InnerText
				Action4 := ie.document.GetElementsByTagName("TD")[BaseNumber + 3].InnerText
				LV_Modify(A_EventInfo,"Check" ,AppNoSearch, Action1, Action2, Action4)
				break
				}
			}
		}
	*/
	; }
 return

*/

CheckRow:
CurrentRows := LV_GetCount()
AppNoSearch := BackEnd%CurrentRows%
Sleep, 1000
OutputVar := "http://oc-docketing/CPi/tmkschActionDue.aspx"
ie2.Navigate(OutputVar)
Sleep 500
ie2.Document.All.schstrActionDue_TextBox.Value := "*" AppNoSearch "*"
Sleep 1500
ie2.Document.All.btnStartSearch.Click()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100

Loop 8
{
FoundClientCode := ie2.Document.All.fldstrCaseNumber_TextBox.Value
	if (FoundClientCode != "")
		break
	else
		Sleep 250
}	
	
if (FoundClientCode != "")
	{
	LV_Modify(LV_GetCount(),"Check" ,AppNoSearch, "Found on " FoundClientCode, "OK", "OK")
	LV_ModifyCol(2, "AutoHdr")
	return
	}
else
	{
	Action1 := "Still not found! Checking one more thing..."
	Action2 := "-"
	Action4 := "-"
	LV_Modify(LV_GetCount(), ,AppNoSearch, Action1, Action2, Action4)
	LV_ModifyCol(2, "AutoHdr")
	
		Loop 8
			{
			AS := ie2.document.GetElementsBytagname("A").length
				if AS = 0 
					Sleep 250
				else
					break
			}

		Loop %AS%
		{
		TempAction := ie2.document.GetElementsBytagname("A")[A_Index-1].InnerText
			ifinstring, TempAction, ZT
				{
				TempAction := Trim(TempAction)
				LV_Modify(LV_GetCount(),"Check" ,AppNoSearch, "Found on " TempAction, "OK", "OK")
				LV_ModifyCol(2, "AutoHdr")
				return
				}
		}
	LV_Modify(LV_GetCount(),  ,AppNoSearch, "Unable to locate in 000Z or ZTCN.", "--", "--")
	LV_ModifyCol(2, "AutoHdr")			
	}
return

GuiClose:
ExitApp
return

NewCPIGrabTMData:
Gui, Submit, NoHide
StringSplit, BackEnd, BackEnd, `n, , 

Loop %BackEnd0%
{
	LV_Modify(A_Index, "-Check", Edit1Status%A_Index%, "Pending search in 000Z...", "--", "--")
	LV_ModifyCol(1, "AutoHdr")
}

value := ""
user := "Paperboy@knobbe.com"
pass := "knobbedocket"
EndPoint1 := "https://web05.computerpackages.com/knobbews/api/Knobbe?queryString="
EndPoint2 = 
(
SELECT CaseNumber, ActionType, BaseDate, ResponseDate %A_Space%
FROM tblTmkActionDue  %A_Space%
WHERE %A_Space%
)

Loop %BackEnd0%
{
EndPoint3 := " ActionType LIKE '%(" BackEnd%A_Index% ")%'"

/*

42777803
40911230
40911231

*/

http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http.Open("GET", EndPoint1 . EndPoint2 . EndPoint3, true)
http.SetRequestHeader("Authorization", "Basic "  Base64Encode(user ":" pass) )
http.Send()

while (http.Responsetext == "")
	Sleep 100

value := JSON.Load(http.Responsetext)

gosub RecordAPIUses
; MsgBox, % http.Responsetext
; MsgBox, % value.Table.length()

if (value.Table.length() == 1)
	{
	LV_Modify(A_Index,"Check" , Edit1Status%A_Index%, "Found on " value.Table[1].CaseNumber, value.Table[1].BaseDate, value.Table[1].ResponseDate)
	LV_ModifyCol(2, "AutoHdr")
	}
else if (value.Table.length() > 1)
	{
	LV_Modify(A_Index,"Check" , Edit1Status%A_Index%, "Multiple hits? That's weird." , "--", "--")
	LV_ModifyCol(2, "AutoHdr")
	}
else
	{
	LV_Modify(A_Index,  , Edit1Status%A_Index%, "Unable to locate in 000Z or ZTCN.", "--", "--")
	LV_ModifyCol(2, "AutoHdr")			
	}
}
return

Base64Encode(String) ;by Uberi @ https://autohotkey.com/board/topic/5545-base64-coderdecoder/page-3#entry690930
{
    static CharSet := "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    VarSetCapacity(Output,Ceil(Length / 3) << 2)
    Index := 1, Length := StrLen(String)
    Loop, % Length // 3
    {
        Value := Asc(SubStr(String,Index,1)) << 16
            | Asc(SubStr(String,Index + 1,1)) << 8
            | Asc(SubStr(String,Index + 2,1))
        Index += 3
        Output .= SubStr(CharSet,(Value >> 18) + 1,1)
            . SubStr(CharSet,((Value >> 12) & 63) + 1,1)
            . SubStr(CharSet,((Value >> 6) & 63) + 1,1)
            . SubStr(CharSet,(Value & 63) + 1,1)
    }
    Length := Mod(Length,3)
    If Length = 0 ;no characters remain
        Return, Output
    Value := Asc(SubStr(String,Index,1)) << 10
    If Length = 1
    {
        Return, Output ;one character remains
            . SubStr(CharSet,(Value >> 12) + 1,1)
            . SubStr(CharSet,((Value >> 6) & 63) + 1,1) . "=="
    }
    Value |= Asc(SubStr(String,Index + 1,1)) << 2 ;insert the third character
    Return, Output ;two characters remain
        . SubStr(CharSet,(Value >> 12) + 1,1)
        . SubStr(CharSet,((Value >> 6) & 63) + 1,1)
        . SubStr(CharSet,(Value & 63) + 1,1) . "="
}


/**
 * Lib: JSON.ahk
 *     JSON lib for AutoHotkey.
 * Version:
 *     v2.1.3 [updated 04/18/2016 (MM/DD/YYYY)]
 * License:
 *     WTFPL [http://wtfpl.net/]
 * Requirements:
 *     Latest version of AutoHotkey (v1.1+ or v2.0-a+)
 * Installation:
 *     Use #Include JSON.ahk or copy into a function library folder and then
 *     use #Include <JSON>
 * Links:
 *     GitHub:     - https://github.com/cocobelgica/AutoHotkey-JSON
 *     Forum Topic - http://goo.gl/r0zI8t
 *     Email:      - cocobelgica <at> gmail <dot> com
 */


/**
 * Class: JSON
 *     The JSON object contains methods for parsing JSON and converting values
 *     to JSON. Callable - NO; Instantiable - YES; Subclassable - YES;
 *     Nestable(via #Include) - NO.
 * Methods:
 *     Load() - see relevant documentation before method definition header
 *     Dump() - see relevant documentation before method definition header
 */
class JSON
{
	/**
	 * Method: Load
	 *     Parses a JSON string into an AHK value
	 * Syntax:
	 *     value := JSON.Load( text [, reviver ] )
	 * Parameter(s):
	 *     value      [retval] - parsed value
	 *     text    [in, ByRef] - JSON formatted string
	 *     reviver   [in, opt] - function object, similar to JavaScript's
	 *                           JSON.parse() 'reviver' parameter
	 */
	class Load extends JSON.Functor
	{
		Call(self, ByRef text, reviver:="")
		{
			this.rev := IsObject(reviver) ? reviver : false
		; Object keys(and array indices) are temporarily stored in arrays so that
		; we can enumerate them in the order they appear in the document/text instead
		; of alphabetically. Skip if no reviver function is specified.
			this.keys := this.rev ? {} : false

			static quot := Chr(34), bashq := "\" . quot
			     , json_value := quot . "{[01234567890-tfn"
			     , json_value_or_array_closing := quot . "{[]01234567890-tfn"
			     , object_key_or_object_closing := quot . "}"

			key := ""
			is_key := false
			root := {}
			stack := [root]
			next := json_value
			pos := 0

			while ((ch := SubStr(text, ++pos, 1)) != "") {
				if InStr(" `t`r`n", ch)
					continue
				if !InStr(next, ch, 1)
					this.ParseError(next, text, pos)

				holder := stack[1]
				is_array := holder.IsArray

				if InStr(",:", ch) {
					next := (is_key := !is_array && ch == ",") ? quot : json_value

				} else if InStr("}]", ch) {
					ObjRemoveAt(stack, 1)
					next := stack[1]==root ? "" : stack[1].IsArray ? ",]" : ",}"

				} else {
					if InStr("{[", ch) {
					; Check if Array() is overridden and if its return value has
					; the 'IsArray' property. If so, Array() will be called normally,
					; otherwise, use a custom base object for arrays
						static json_array := Func("Array").IsBuiltIn || ![].IsArray ? {IsArray: true} : 0
					
					; sacrifice readability for minor(actually negligible) performance gain
						(ch == "{")
							? ( is_key := true
							  , value := {}
							  , next := object_key_or_object_closing )
						; ch == "["
							: ( value := json_array ? new json_array : []
							  , next := json_value_or_array_closing )
						
						ObjInsertAt(stack, 1, value)

						if (this.keys)
							this.keys[value] := []
					
					} else {
						if (ch == quot) {
							i := pos
							while (i := InStr(text, quot,, i+1)) {
								value := StrReplace(SubStr(text, pos+1, i-pos-1), "\\", "\u005c")

								static tail := A_AhkVersion<"2" ? 0 : -1
								if (SubStr(value, tail) != "\")
									break
							}

							if (!i)
								this.ParseError("'", text, pos)

							  value := StrReplace(value,  "\/",  "/")
							, value := StrReplace(value, bashq, quot)
							, value := StrReplace(value,  "\b", "`b")
							, value := StrReplace(value,  "\f", "`f")
							, value := StrReplace(value,  "\n", "`n")
							, value := StrReplace(value,  "\r", "`r")
							, value := StrReplace(value,  "\t", "`t")

							pos := i ; update pos
							
							i := 0
							while (i := InStr(value, "\",, i+1)) {
								if !(SubStr(value, i+1, 1) == "u")
									this.ParseError("\", text, pos - StrLen(SubStr(value, i+1)))

								uffff := Abs("0x" . SubStr(value, i+2, 4))
								if (A_IsUnicode || uffff < 0x100)
									value := SubStr(value, 1, i-1) . Chr(uffff) . SubStr(value, i+6)
							}

							if (is_key) {
								key := value, next := ":"
								continue
							}
						
						} else {
							value := SubStr(text, pos, i := RegExMatch(text, "[\]\},\s]|$",, pos)-pos)

							static number := "number", integer :="integer"
							if value is %number%
							{
								if value is %integer%
									value += 0
							}
							else if (value == "true" || value == "false")
								value := %value% + 0
							else if (value == "null")
								value := ""
							else
							; we can do more here to pinpoint the actual culprit
							; but that's just too much extra work.
								this.ParseError(next, text, pos, i)

							pos += i-1
						}

						next := holder==root ? "" : is_array ? ",]" : ",}"
					} ; If InStr("{[", ch) { ... } else

					is_array? key := ObjPush(holder, value) : holder[key] := value

					if (this.keys && this.keys.HasKey(holder))
						this.keys[holder].Push(key)
				}
			
			} ; while ( ... )

			return this.rev ? this.Walk(root, "") : root[""]
		}

		ParseError(expect, ByRef text, pos, len:=1)
		{
			static quot := Chr(34), qurly := quot . "}"
			
			line := StrSplit(SubStr(text, 1, pos), "`n", "`r").Length()
			col := pos - InStr(text, "`n",, -(StrLen(text)-pos+1))
			msg := Format("{1}`n`nLine:`t{2}`nCol:`t{3}`nChar:`t{4}"
			,     (expect == "")     ? "Extra data"
			    : (expect == "'")    ? "Unterminated string starting at"
			    : (expect == "\")    ? "Invalid \escape"
			    : (expect == ":")    ? "Expecting ':' delimiter"
			    : (expect == quot)   ? "Expecting object key enclosed in double quotes"
			    : (expect == qurly)  ? "Expecting object key enclosed in double quotes or object closing '}'"
			    : (expect == ",}")   ? "Expecting ',' delimiter or object closing '}'"
			    : (expect == ",]")   ? "Expecting ',' delimiter or array closing ']'"
			    : InStr(expect, "]") ? "Expecting JSON value or array closing ']'"
			    :                      "Expecting JSON value(string, number, true, false, null, object or array)"
			, line, col, pos)

			static offset := A_AhkVersion<"2" ? -3 : -4
			throw Exception(msg, offset, SubStr(text, pos, len))
		}

		Walk(holder, key)
		{
			value := holder[key]
			if IsObject(value) {
				for i, k in this.keys[value] {
					; check if ObjHasKey(value, k) ??
					v := this.Walk(value, k)
					if (v != JSON.Undefined)
						value[k] := v
					else
						ObjDelete(value, k)
				}
			}
			
			return this.rev.Call(holder, key, value)
		}
	}

	/**
	 * Method: Dump
	 *     Converts an AHK value into a JSON string
	 * Syntax:
	 *     str := JSON.Dump( value [, replacer, space ] )
	 * Parameter(s):
	 *     str        [retval] - JSON representation of an AHK value
	 *     value          [in] - any value(object, string, number)
	 *     replacer  [in, opt] - function object, similar to JavaScript's
	 *                           JSON.stringify() 'replacer' parameter
	 *     space     [in, opt] - similar to JavaScript's JSON.stringify()
	 *                           'space' parameter
	 */
	class Dump extends JSON.Functor
	{
		Call(self, value, replacer:="", space:="")
		{
			this.rep := IsObject(replacer) ? replacer : ""

			this.gap := ""
			if (space) {
				static integer := "integer"
				if space is %integer%
					Loop, % ((n := Abs(space))>10 ? 10 : n)
						this.gap .= " "
				else
					this.gap := SubStr(space, 1, 10)

				this.indent := "`n"
			}

			return this.Str({"": value}, "")
		}

		Str(holder, key)
		{
			value := holder[key]

			if (this.rep)
				value := this.rep.Call(holder, key, ObjHasKey(holder, key) ? value : JSON.Undefined)

			if IsObject(value) {
			; Check object type, skip serialization for other object types such as
			; ComObject, Func, BoundFunc, FileObject, RegExMatchObject, Property, etc.
				static type := A_AhkVersion<"2" ? "" : Func("Type")
				if (type ? type.Call(value) == "Object" : ObjGetCapacity(value) != "") {
					if (this.gap) {
						stepback := this.indent
						this.indent .= this.gap
					}

					is_array := value.IsArray
				; Array() is not overridden, rollback to old method of
				; identifying array-like objects. Due to the use of a for-loop
				; sparse arrays such as '[1,,3]' are detected as objects({}). 
					if (!is_array) {
						for i in value
							is_array := i == A_Index
						until !is_array
					}

					str := ""
					if (is_array) {
						Loop, % value.Length() {
							if (this.gap)
								str .= this.indent
							
							v := this.Str(value, A_Index)
							str .= (v != "") ? v . "," : "null,"
						}
					} else {
						colon := this.gap ? ": " : ":"
						for k in value {
							v := this.Str(value, k)
							if (v != "") {
								if (this.gap)
									str .= this.indent

								str .= this.Quote(k) . colon . v . ","
							}
						}
					}

					if (str != "") {
						str := RTrim(str, ",")
						if (this.gap)
							str .= stepback
					}

					if (this.gap)
						this.indent := stepback

					return is_array ? "[" . str . "]" : "{" . str . "}"
				}
			
			} else ; is_number ? value : "value"
				return ObjGetCapacity([value], 1)=="" ? value : this.Quote(value)
		}

		Quote(string)
		{
			static quot := Chr(34), bashq := "\" . quot

			if (string != "") {
				  string := StrReplace(string,  "\",  "\\")
				; , string := StrReplace(string,  "/",  "\/") ; optional in ECMAScript
				, string := StrReplace(string, quot, bashq)
				, string := StrReplace(string, "`b",  "\b")
				, string := StrReplace(string, "`f",  "\f")
				, string := StrReplace(string, "`n",  "\n")
				, string := StrReplace(string, "`r",  "\r")
				, string := StrReplace(string, "`t",  "\t")

				static rx_escapable := A_AhkVersion<"2" ? "O)[^\x20-\x7e]" : "[^\x20-\x7e]"
				while RegExMatch(string, rx_escapable, m)
					string := StrReplace(string, m.Value, Format("\u{1:04x}", Ord(m.Value)))
			}

			return quot . string . quot
		}
	}

	/**
	 * Property: Undefined
	 *     Proxy for 'undefined' type
	 * Syntax:
	 *     undefined := JSON.Undefined
	 * Remarks:
	 *     For use with reviver and replacer functions since AutoHotkey does not
	 *     have an 'undefined' type. Returning blank("") or 0 won't work since these
	 *     can't be distnguished from actual JSON values. This leaves us with objects.
	 *     Replacer() - the caller may return a non-serializable AHK objects such as
	 *     ComObject, Func, BoundFunc, FileObject, RegExMatchObject, and Property to
	 *     mimic the behavior of returning 'undefined' in JavaScript but for the sake
	 *     of code readability and convenience, it's better to do 'return JSON.Undefined'.
	 *     Internally, the property returns a ComObject with the variant type of VT_EMPTY.
	 */
	Undefined[]
	{
		get {
			static empty := {}, vt_empty := ComObject(0, &empty, 1)
			return vt_empty
		}
	}

	class Functor
	{
		__Call(method, ByRef arg, args*)
		{
		; When casting to Call(), use a new instance of the "function object"
		; so as to avoid directly storing the properties(used across sub-methods)
		; into the "function object" itself.
			if IsObject(method)
				return (new this).Call(method, arg, args*)
			else if (method == "")
				return (new this).Call(arg, args*)
		}
	}
}

RecordAPIUses:	
IniRead, APIUses, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, APIUses
APIUses++
IniWrite, %APIUses%, H:\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\%Computername%.ini, Achievements, APIUses
return	

