global tabNumber = 0


PullInfo:
PageInstance := ChromeInst.GetPage()
GrabData = 
(
var clientCode = document.getElementById("ctl00_Detail_CaseNumber_Input").value
var country = document.getElementById("ctl00_Detail_Country_Input").value
)

PageInstance.Evaluate(GrabData)
PageInstance.Evaluate("alert(document.getElementById('ctl00_Detail_CaseNumber_Input').value);")

ClientCode := PageInstance.Evaluate("clientCode").value
Country := PageInstance.Evaluate("country").value


temp := PageInstance.Evaluate("document.getElementById('ctl00_Detail_CaseNumber_Input').outerHTML").Value

MsgBox, % temp

tester = 
(
var clientCode = document.getElementById("ctl00_Detail_CaseNumber_Input").value;
var country = document.getElementById("ctl00_Detail_Country_Input").value;
var testtest = document.getElementById("testButton").value;

)

PageInstance.Evaluate(tester)

MsgBox, % PageInstance.Evaluate("clientCode").Value " | " PageInstance.Evaluate("country").Value " | " PageInstance.Evaluate("testtest").Value " | " PageInstance.Evaluate("window.location.href").Value 


PageInstance.Disconnect()
return


Inject:
PageInstance := ChromeInst.GetPage()

; Attribute := "fldstrCaseNumber_TextBox"
Attribute := "ctl00_Detail_CaseNumber_Input"
NewValue := "WHATS.UP"

; AllAsVariable = document.getElementById("fldstrCaseNumber_TextBox").value = "Test.Value";
; AllAsVariable = document.getElementById("%Attribute%").value = "%NewValue%";
AllAsVariable := "document.getElementById('" Attribute "').value = '" NewValue "';"

; BOTH AS VARIABLES 
; PageInstance.Evaluate("document.getElementById('" Attribute "').value='" NewValue "'")

; ID HARD CODED 
; PageInstance.Evaluate("document.getElementById('fldstrCaseNumber_TextBox').value='" NewValue "'")

; BOTH HARD CODED 
; PageInstance.Evaluate("document.getElementById('fldstrCaseNumber_TextBox').value = 'Test.Value';")

; ALL AS VARIABLE, EASIEST TO TYPE OUT
 PageInstance.Evaluate(AllAsVariable)

PageInstance.Disconnect()
return

; 		var temp =	{enabled:true,emptyMessage:"",validationText:"2021-02-12-00-00-00",valueAsString:"2021-02-12-00-00-00",minDateStr:"1000-01-01-00-00-00",maxDateStr:"9999-12-31-00-00-00",lastSetTextBoxValue:"12-Feb-2021"}

;		document.getElementById("ctl00_Detail_TranOutDate_dateInput_ClientState").value = temp;

TATOutDate:
PageInstance := ChromeInst.GetPage()

temp2 = 
(
try {
	document.getElementById("ctl00_Detail_EditButton_input").click();	
	this.value1 = "0";
}	
catch(err) {
	if (this.value1 == "0") {
		var today = new Date();
		var dd = String(today.getDate()).padStart(2, '0');
		var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
		var yyyy = today.getFullYear();

		today = mm + '/' + dd + '/' + yyyy;

		document.getElementById("ctl00_Detail_TranOutDate_dateInput").value = today;
		document.getElementById("ctl00_Detail_TranOutDate_dateInput").focus();		
		this.value1 = "1";
	}
	else if (this.value1 == "1") {
		document.getElementById("ctl00_Detail_UpdateButton_input").click();
		this.value1 = "0";
	}		
}	
)
PageInstance.Evaluate(temp2)
PageInstance.Disconnect()
WinActivate, ahk_class Chrome_WidgetWin_1
Sleep 500
SendInput, {Tab}
return
	
TATInDate:
PageInstance := ChromeInst.GetPage()
temp2 = 
(
try {
	document.getElementById("ctl00_Detail_EditButton_input").click();	
	this.value1 = "0";
}	
catch(err) {
	if (this.value1 == "0") {
		var today = new Date();
		var dd = String(today.getDate()).padStart(2, '0');
		var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
		var yyyy = today.getFullYear();

		today = mm + '/' + dd + '/' + yyyy;

		document.getElementById("ctl00_Detail_TranInDate_dateInput").value = today;
		document.getElementById("ctl00_Detail_TranInDate_dateInput").focus();		
		this.value1 = "1";
	}
	else if (this.value1 == "1") {
		document.getElementById("ctl00_Detail_UpdateButton_input").click();
		this.value1 = "0";
	}		
}	
)
PageInstance.Evaluate(temp2)
PageInstance.Disconnect()
WinActivate, ahk_class Chrome_WidgetWin_1
Sleep 500
SendInput, {Tab}
return
	

return

UpdateStatus:
PageInstance := ChromeInst.GetPage()

temp2 = 
(
try {
	document.getElementById("ctl00_Detail_EditButton_input").click();	
	this.value1 = "0";
}	
catch(err) {
	if (this.value1 == "0") {
		document.getElementById("ctl00_Detail_ApplicationStatus_Arrow").click();
		document.getElementById("ctl00_Detail_ApplicationStatus_Input").focus();
		var status = "Abandoned";
		document.getElementById("ctl00_Detail_ApplicationStatus_Input").value = status;
		var temp = {logEntries:[],value:"27",text:"Abandoned",enabled:true,checkedIndices:[],checkedItemsTextOverflows:false};
		document.getElementById("ctl00_Detail_ApplicationStatus_ClientState").value = temp;
		document.getElementById("ctl00_Detail_ApplicationStatus_Input").blur();		
		this.value1 = "1";
	}
	else if (this.value1 == "1") {
		document.getElementsByClassName("rcbHovered")[0].click()
		document.getElementById("ctl00_Detail_UpdateButton_input").click();
		this.value1 = "0";
	}		
}	
)
 PageInstance.Evaluate(temp2)
 PageInstance.Disconnect()
 return


; Attribute := "fldstrCaseNumber_TextBox"
Attribute := "ctl00_Detail_CaseNumber_Input"
NewValue := "WHATS.UP"

; AllAsVariable = document.getElementById("fldstrCaseNumber_TextBox").value = "Test.Value";
; AllAsVariable = document.getElementById("%Attribute%").value = "%NewValue%";
AllAsVariable := "document.getElementById('" Attribute "').value = '" NewValue "';"

; BOTH AS VARIABLES 
; PageInstance.Evaluate("document.getElementById('" Attribute "').value='" NewValue "'")

; ID HARD CODED 
; PageInstance.Evaluate("document.getElementById('fldstrCaseNumber_TextBox').value='" NewValue "'")

; BOTH HARD CODED 
; PageInstance.Evaluate("document.getElementById('fldstrCaseNumber_TextBox').value = 'Test.Value';")

; ALL AS VARIABLE, EASIEST TO TYPE OUT
; PageInstance.Evaluate(AllAsVariable)

PageInstance.Disconnect()
return





addButton:
PageInstance := ChromeInst.GetPage()
Attribute := "rsmMain_btnLastRecord"
NewValue := "Hello.Value"
; AllAsVariable = document.getElementById("fldstrCaseNumber_TextBox").value = "Test.Value";
; AllAsVariable = document.getElementById("%Attribute%").value = "%NewValue%";
AllAsVariable := "document.getElementById('" Attribute "').insertAdjacentHTML('afterend', '<button>Test</button>')"
PageInstance.Evaluate(AllAsVariable)
PageInstance.Disconnect()
return

Bookmarklet:
PageInstance := ChromeInst.GetPage()
PageInstance.Evaluate("var test = 'inserted'; document.getElementsByTagName('H1')[0].style.color = 'red'; document.getElementsByTagName('H1')[0].innerText = 'hello';")
PageInstance.Evaluate("document.getElementsByTagName('P')[0].style.color = 'red';")
PageInstance.Evaluate("document.getElementsByTagName('A')[0].style.color = 'red';")
PageInstance.Disconnect()
return

ReloadPage:
PageInstance := ChromeInst.GetPage()
PageInstance.Call("Page.reload")
PageInstance.Disconnect()
return

CloseTab:
PageInstance := ChromeInst.GetPage()
PageInstance.Call("Page.close")
PageInstance.Disconnect()
return

OpenDocketing:
PageInstance := ChromeInst.GetPage()
; PageInstance.Call("Page.navigate", {"url": "https://autohotkey.com"})

; url1 := "https://www.autohotkey.com"
url2 := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplication.aspx?key=225602"

PageInstance.Call("Target.createTarget", {"url" : url2 })


PageInstance.Disconnect()
return

ShowURL:
Page := ChromeInst.GetPage()
Page.silent := true
;  MsgBox, % Page
Page.Evaluate("alert(window.location.href);")
Page.Evaluate("console.log('this is a test');")
Page.Evaluate("console.clear();")
Page.Disconnect()
return

CloseChrome:
; Escape::
Page := ChromeInst.GetPage()
Page.Call("Browser.close")
; Page.Disconnect()
ExitApp
return



RCtrl & Right::
PageInstance := ChromeInst.GetPage()

if (tabNumber < 3)
	tabNumber++
else
	tabNumber = 3

moveRight =
(

try { document.getElementsByClassName("rtsLink")[%tabNumber%].click();}
catch(err) {document.getElementsByClassName("rtsLink")[%tabNumber%].click();}
)
	
PageInstance.Evaluate(moveRight)	
PageInstance.Disconnect()
return

RCtrl & Left::
PageInstance := ChromeInst.GetPage()

if (tabNumber > 0)
	tabNumber--
else
	tabNumber = 0
	
moveLeft =
(

try { document.getElementsByClassName("rtsLink")[%tabNumber%].click();}
catch(err) {document.getElementsByClassName("rtsLink")[0].click();}
)
	
PageInstance.Evaluate(moveLeft)	
PageInstance.Disconnect()
return

RCtrl & Down::
tabNumber = 0
return

SystemSwitch2:
PageInstance := ChromeInst.GetPage()
GrabData = 
(
var locationURL = window.location.href
)

PageInstance.Evaluate(GrabData)
PageInstance.Evaluate("alert(locationURL);")

location := PageInstance.Evaluate("locationURL").value

SystemSwitch3(location)
PageInstance.Disconnect()
return

SystemSwitch3(URL) 
{
if InStr(URL, "ActionDue") ; Inside Actions
	{
	; AT Patent Action to Live Page	
	if InStr(URL, "patfrmActionDueAgent")
		{
		appId := SubStr(URL, -5, 6)
		newURL := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplication.aspx?key=" appId	
		}
	; Live Patent Action to AT Page	
	else if InStr(URL, "patfrmActionDue")
		{
		appId := SubStr(URL, -5, 6)
		newURL := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplicationAgent.aspx?key=" appId	
		}	
	; AT TM Action to Live Page	
	else if InStr(URL, "tmkfrmActionDueAgent")
		{
		appId := SubStr(URL, -5, 6)
		newURL := "https://web05.computerpackages.com/knobbe/trademark/tmkfrmTrademark.aspx?nkey=" appId	
		}
	; Live TM Action to AT Page	
	else if InStr(URL, "tmkfrmActionDue")
		{
		appId := SubStr(URL, -5, 6)
		newURL := "https://web05.computerpackages.com/knobbe/trademark/tmkfrmTrademarkAgent.aspx?nkey=" appId	
		}	
	}
else  ; On Main Pages
	{
	if InStr(URL, "patfrmCountryApplicationAgent")
		{
		tempApp := StrSplit(URL, "key=")
		appId := SubStr(tempApp[2], 1, 6)
		newURL := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplication.aspx?key=" appId			
		}
	else if InStr(URL, "patfrmCountryApplication")
		{
		tempApp := StrSplit(URL, "key=")
		appId := SubStr(tempApp[2], 1, 6)
		newURL := "https://web05.computerpackages.com/knobbe/patent/patfrmCountryApplicationAgent.aspx?key=" appId			
		}
	else if InStr(URL, "tmkfrmTrademarkAgent")
		{
		tempApp := StrSplit(URL, "key=")
		appId := SubStr(tempApp[2], 1, 6)
		newURL := "https://web05.computerpackages.com/knobbe/trademark/tmkfrmTrademark.aspx?nkey=" appId			
		}
	else if InStr(URL, "tmkfrmTrademark")
		{
		tempApp := StrSplit(URL, "key=")
		appId := SubStr(tempApp[2], 1, 6)
		newURL := "https://web05.computerpackages.com/knobbe/trademark/tmkfrmTrademarkAgent.aspx?nkey=" appId			
		}
	}
	
PageInstance := ChromeInst.GetPage()
url2 := newURL
PageInstance.Call("Target.createTarget", {"url" : url2 })
PageInstance.Disconnect()
return

}




















































































































































/*


InsertText:
Page := ChromeInst.GetPage()
Page.Evaluate("var test = 'inserted'; document.getElementsByTagName('H1')[0].innerText = test;")
Page.Disconnect()
return

InsertText2:
Page := ChromeInst.GetPage()
Page.Evaluate("var test = 'inserted2'; document.getElementsByTagName('P')[0].innerText = test;")
Page.Disconnect()
return

InsertText3:
Page := ChromeInst.GetPage()
Page.Evaluate("var test = 'inserted3'; document.getElementsByTagName('A')[0].innerText = test;")
Page.Disconnect()
return


GrabText:
GrabText2:
GrabText3:
Page := ChromeInst.GetPage()

Page.Evaluate("var person = window.prompt('Enter some text here or something, whatever.','This is some default text.');")
Page.Evaluate("alert(person);")
Sleep 1000

testperson := Page.Evaluate("person")

; testperson := Page.Evaluate("document.getElementById('" Attribute "').value").Value
MsgBox, % testperson
Page.Disconnect()
return

StartTitle:
Page := ChromeInst.GetPage()
Page.silent := true
Page.Evaluate("var test = document.getElementsByTagName('H1')[0].innerText")
Page.Evaluate("alert(test);")

Page.Evaluate("var test = 'hello'; document.getElementsByTagName('H1')[0].innerText = test;")
Page.Evaluate("alert('Hello World!');")
SetTimer, NewTitleLoop, 1000
Page.Disconnect()
return

NewTitleLoop:
formattime, NewToday, ,  hh:mm:ss
Page := ChromeInst.GetPage()
Page.silent := true
; Page.WaitForLoad()
Page.Evaluate("var currentTime = '" NewToday "';")
Page.Evaluate("document.title = 'I am connected. ' + currentTime")

; Page.Evaluate("var colcol = 'red'; try { var test = document.getElementById('testButton').value;} catch (ex) {	var test = '1';}")
; Page.Evaluate("var colcol = 'red'; var test = '1';")



; MSgBOx, % Page.Evaluate("test").Value

;if (checkButton == "")
;	{
;	testButton = 
;	(
;	document.getElementsByTagName("H1")[0].insertAdjacentHTML("beforebegin", "<input type='button' onclick='alert(this.value); this.style.color = colcol;' value='5' id='testButton';'>")
;	)
;	Page.Evaluate(testButton)
;	}

Page.Disconnect()
return





^7::
Page := ChromeInst.GetPage()

tester = 
(
var hello = "what's up";
var clientCode = document.getElementById("fldstrCaseNumber_TextBox").value;
var country = document.getElementById("fldstrCountry_TextBox").value;


)


Page.Evaluate(tester)

MsgBox, % Page.Evaluate("clientCode").Value " | " Page.Evaluate("country").Value 

Page.Call("Page.navigate", {"url": "https://autohotkey.com/"})
Page.WaitForLoad()

; Execute some JavaScript
Page.Evaluate("alert('Hello World!');")
Page.Disconnect()
return

^8::

Loop 10
	{
	Page := ChromeInst.GetPage()
	Position := Page.Evaluate("window.pageYOffset / (document.body.clientHeight - window.innerHeight)").value
	ToolTip, %Position% | %A_Index%
	Page.Disconnect()
	Sleep 1000
	}

return

; PageInst.Evaluate("document.getElementsByTagName('html')[0].textContent;").Value
; PageInst.Evaluate("document.getElementsByTagName('html')[0].outerHTML;").Value

; Page.Evaluate("document.URL;").Value
; or
; Page.Evaluate("window.location.href;").Value
;   PageInst.Evaluate("window.location.href")

; ChromeInst := new Chrome("", "https://example.com", "--headless")

; You should be able to check the page readiness state by running PageInst.Evaluate("document.readyState"), which should return how loaded the page is. For the rest of your post I'm not sure.

^0::
Page := ChromeInst.GetTabs()
; Chrome.GetTabs() returns an array of all loaded tabs/pages/documents (including also extension configuration pages).
; Code: Select all

for Index, Tab in Page
    MsgBox, % "type: " Tab.type "`nurl: " Tab.url

Page.Disconnect()

return


;Page.Evaluate("alert('What\'s up dude bro?????\n\n\nControl + K -  Back\nControl + L - Forward\nControl + \; - Prompt Test');")

; Close the browser (note: this closes *all* pages/tabs)
;Page.Call("Browser.close")
;Page.Disconnect()

;ExitApp
return

F1::
testButton:
Page := ChromeInst.GetPage()
Page.Evaluate("var colcol = 'red'; try { var test = document.getElementById('testButton').value;} catch (ex) {	var test = '';}")
checkButton := Page.Evaluate("test").Value

if (checkButton == "")
	{
	testButton = 
	(
	document.getElementsByTagName("H1")[0].insertAdjacentHTML("beforebegin", "<input type='button' onclick='alert(this.value); this.style.color = colcol;' value='5' id='testButton';'>")
	)
	Page.Evaluate(testButton)
	}

Page.Disconnect()
return




F2::
SetTimer, UpdateTitle, 1000
return

UpdateTitle:
formattime, NewToday, ,  hh:mm:ss
Page := ChromeInst.GetPage()
Page.WaitForLoad()
Page.Evaluate("var currentTime = '" NewToday "';")
Page.WaitForLoad()
Page.Evaluate("document.title = 'I am connected. ' + currentTime")
Page.WaitForLoad()

TempVar := Page.Evaluate("document.getElementById('testButton').value").Value
Page.WaitForLoad()

TempVar++

Page.Evaluate("document.getElementById('testButton').value = " TempVar ";")
Page.WaitForLoad()
Page.Evaluate("document.getElementById('testButton').innerText = " TempVar ";")
Page.WaitForLoad()

Page.Disconnect()
gosub testButton
return




^j::
Page := ChromeInst.GetPage()
Page.Evaluate("alert('The current website is: ' + window.location.href);")
Attribute := "gsc-i-id1"
NewValue := "blah"
TempVar := Page.Evaluate("document.getElementById('" Attribute "').value").Value
MsgBox, %TempVar%
Sleep 2000
Page.Evaluate("document.getElementById('" Attribute "').value='" NewValue "'").Value
Page.Disconnect()
return

^k::
Page := ChromeInst.GetPage()
Page.Evaluate("window.history.back();")
Page.Disconnect()
return

^l::
TestTest = window.history.forward();
Page := ChromeInst.GetPage()
Page.Evaluate(TestTest)
Page.Disconnect()
return

^;::
Attribute := "gsc-i-id1"
Page := ChromeInst.GetPage()
Page.Evaluate("var person = window.prompt('Enter some text here or something, whatever.','This is some default text.');")
Page.Evaluate("alert(person);")
Page.Evaluate("document.getElementsByTagName('BODY')[0].insertAdjacentHTML('afterbegin', '<button>test</button>')")
; Page.Evaluate("document.getElementById('" Attribute "').value= person ")
Sleep 1000

testperson := Page.Evaluate("person").Value
; testperson := Page.Evaluate("document.getElementById('" Attribute "').value").Value
MsgBox, % testperson

MsgBox, % "Variable pulled from Javascript! - " Page.Evaluate("person").Value
return

*/


