#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, pifmgr.dll, 16
CoordMode, ToolTip 

global OldRemarks

global Temp

IniRead, CustomColor, C:\Users\%A_Username%\AHKPrefs.ini, Username, WindowColor

ie := WBGet()
;IMGS 		:= ie.document.GetElementsBytagname("IMG").length

;MsgBox, %IMGS%



/*
TABLES := ie.document.GetElementsByTagName("TABLE").length

Loop %TABLES%
{
; clsInfoBoxContent

Temp:= ie.document.GetElementsByTagName("TABLE")[A_Index].className
MsgBox, %Temp% | %A_Index%

}
*/


ie.document.GetElementsBytagname("IMG")[0].src := "" ; "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\DOCKETMODS.png"
ie.document.GetElementsBytagname("IMG")[0].onclick := "alert('Hello world!');"
ie.document.GetElementsBytagname("IMG")[0].onenter := "alert('Hello world!');"
ie.document.GetElementsBytagname("IMG")[0].id := "docketMods"
ie.document.GetElementsBytagname("IMG")[0].name := "docketMods"
ie.document.GetElementsBytagname("IMG")[0].alt := "DocketMods have been activated!"
ie.document.GetElementsBytagname("IMG")[0].type := "image"


tempvar := ie.document.getElementById("btnEdit")

;MsgBox, % tempvar.width
;MsgBox, % tempvar.height

testtemp = <img height="34px" width="120px" id="docketMods" name="docketMods" alt="DocketMods have been actviated!" type="image" src="\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\DOCKETMODS.png" onclick="alert('DocketMods have been activated!');">



;tempB := ie.document.getElementById("btnNew")
;tempC := ie.document.getElementById("btnCopy")

;tempC.insertAdjacentElement("beforebegin", tempB)
;tempB.insertAdjacentElement("afterend", tempA)

;tempvar.insertAdjacentHTML("beforebegin","<p>This is a test.</p>")

;testtemp = <button id="testbutton" onclick="var y = document.getElementById('testbutton').value; alert('Hello world! ' + y);">This is a test 1.</button>
;testtemp2 = <input id="testinput" oncopy="var z = document.getElementById('testinput').value; alert('Copied text! ' + z);" value="This is a test."></input>
;testtemp3 = 
;(
;<select id="mySelect" onchange="var x = document.getElementById('fldstrAppTitle').value; alert(x); document.getElementById('fldstrAppTitle').value = 'This is a test title';">
;  <option value="Audi">Audi
;  <option value="BMW">BMW
;  <option value="Mercedes">Mercedes
;  <option value="Volvo">Volvo
;</select>

;<script>
;function myFunction() {
;	alert();
;}
;</script>

;)

tempvar.insertAdjacentHTML("beforebegin",testtemp)
;tempvar.insertAdjacentHTML("beforebegin",testtemp2)
;tempvar.insertAdjacentHTML("beforebegin",testtemp3)

;tempvar.insertAdjacentHTML("afterbegin","<p>This is a test 2.</p>")
;tempvar.insertAdjacentHTML("afterend","<p>This is a test 3.</p>")
;tempvar.insertAdjacentHTML("beforeend","<p>This is a test 4.</p>")


SetTimer, UpdateColor, 50
return

UpdateColor:
ie := WBGet()
location := ie.LocationURL
ie.document.GetElementsBytagname("IMG")[0].src := "" ; "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\DOCKETMODS.png"

ie.document.getElementById("mpgMain").style.backgroundColor := CustomColor

ifnotinstring, location, Agent
	{
	ie.document.getElementsByTagName("body")[0].style.backgroundColor := CustomColor
	ie.document.GetElementsByTagName("TABLE")[8].className := clsInfoBoxWarning
	}
else
	ie.document.GetElementsByTagName("TABLE")[7].className := clsInfoBoxWarning


ie.document.getElementById("tspMain").tabHoverStyle := "background:white;color:" CustomColor ";cursor:crosshair"
ie.document.getElementById("tspMain").tabSelectedStyle := "background:" CustomColor ";color:black;cursor:crosshair"
ie.document.getElementById("tspMain").tabSelectedStyle := "background:" CustomColor ";color:black;cursor:crosshair"

;ie.document.getElementById("btnEdit").src := "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\EDIT2.png"
;ie.document.getElementById("btnSave").src := "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\SAVE2.png"
;ie.document.getElementById("btnUndo").src := "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\UNDO2.png"
;ie.document.getElementById("btnNew").src := "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\NEW2.png"
;ie.document.getElementById("btnCopy").src := "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\COPY2.png"
;ie.document.getElementById("btnDelete").src := "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\DELETE2.png"
;ie.document.getElementById("btnPrint").src := "\\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\ImageSearch\HelpImages\PRINT2.png"

;ie.document.getElementById("btnEdit").width := "120"
;ie.document.getElementById("btnSave").width := "120"
;ie.document.getElementById("btnUndo").width := "120"
;ie.document.getElementById("btnNew").width := "120"
;ie.document.getElementById("btnCopy").width := "120"
;ie.document.getElementById("btnDelete").width := "120"
;ie.document.getElementById("btnPrint").width := "120"

;ie.document.getElementById("btnEdit").style.border := "thick dotted " CustomColor 
;ie.document.getElementById("btnSave").style.border := "thick dashed " CustomColor 
;ie.document.getElementById("btnUndo").style.border := "thick groove " CustomColor 
;ie.document.getElementById("btnNew").style.border := "thick dashed " CustomColor 
;ie.document.getElementById("btnCopy").style.border := "thick inset " CustomColor 
;ie.document.getElementById("btnDelete").style.border := "thick outset " CustomColor 
 
;ie.document.getElementById("btnPrint").style.border := "thick solid" ; CustomColor 
;ie.document.getElementById("btnPrint").style.borderColor := "red green blue yellow" ; CustomColor 


ie.document.getElementById("btnPrint").alt := "Prints ya dingus!"


; ToolTip, % ie.document.activeElement.tagName " | " ie.document.activeElement.id



return



/*
test2 := "
(
javascript: 
alert(Date()); 
var test = document.getElementById('mpgMain').style.backgroundColor; 
alert(test);
var test = document.getElementById('mpgMain').style.color; 
alert(test);



)"



ie.Navigate(test2)
*/

return


;// document.write(Date());
;var test = document.getElementById('mpgMain').style;
;alert(test);




#a::
ie := WBGet()
INPUTS 		:= ie.document.GetElementsBytagname("INPUT").length
Loop %INPUTS%
{
Temp := ie.document.GetElementsBytagname("INPUT")[A_Index-1].OuterHTML
ifInString, Temp, ActDueDate
	break
}
StringSplit, Temp, Temp, `'
StringSplit, ActionKey, Temp2, =
MsgBox, %ActionKey2%

return

Pause::
ie := WBGet()
;MsgBOx, % ie.LocationURL

;ie.Navigate("javascript:var x = document.getElementByID('"fldstrCaseNumber_TextBox"').Value; alert(x);")

;ie.Navigate("javascript:var x = window.location.href; alert('The current website is: ' + x);")

ClientCode := "fldstrCaseNumber_TextBox"
Country := "fldstrCountry_TextBox"
NewCountry := "US"

runJavascript :=  "
(
javascript:
alert(5 + 6 + ' | ' + x);  
alert(document.getElementById('" ClientCode "').value);
)" 

test := "
(
javascript: 
var x = window.location.href; 
alert('The current website is: ' + x);

var ClientCode = document.getElementById('" ClientCode "').value;
var Country = document.getElementById('" Country "').value;

alert('This is the current client code: ' + ClientCode + '\r\n\r\nThis is the current country: ' + Country);

document.getElementById('btnEdit').click();
document.getElementById('" Country "').value = new String('test');


)"

test2 := "
(
javascript: 
alert('This is the current client code: ' + document.getElementById('" ClientCode "').value);
alert('test2');


)"

ie.Navigate(test)


return






;************Pointer to Open IE Window******************
WBGet(WinTitle="ahk_class IEFrame", Svr#=1) {               ;// based on ComObjQuery docs
   static msg := DllCall("RegisterWindowMessage", "str", "WM_HTML_GETOBJECT")
        , IID := "{0002DF05-0000-0000-C000-000000000046}"   ;// IID_IWebBrowserApp
;//     , IID := "{332C4427-26CB-11D0-B483-00C04FD90119}"   ;// IID_IHTMLWindow2
   SendMessage msg, 0, 0, Internet Explorer_Server%Svr#%, %WinTitle%

   if (ErrorLevel != "FAIL") {
      lResult:=ErrorLevel, VarSetCapacity(GUID,16,0)
      if DllCall("ole32\CLSIDFromString", "wstr","{332C4425-26CB-11D0-B483-00C04FD90119}", "ptr",&GUID) >= 0 {
         DllCall("oleacc\ObjectFromLresult", "ptr",lResult, "ptr",&GUID, "ptr",0, "ptr*",pdoc)
         return ComObj(9,ComObjQuery(pdoc,IID,IID),1), ObjRelease(pdoc)
      }
   }
}