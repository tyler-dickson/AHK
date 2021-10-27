; Created with AutoHotkey by Tyler Dickson. 

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 62


SendOnBehalfOf := "This would be IntExams Mailbox"

#F1::
ie := WBGet()

ClientCode := ie.document.getElementById("fldstrCaseNumber_TextBox").value

EmailBodyContents := ""
olMailItem := 0
o:= ComObjActive("Outlook.Application").Session()
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
MailItem.SentOnBehalfOfName := SendOnBehalfOf
MailItem.BodyFormat := olFormatHTML

if ClientCode = 
	ClientCode := ClientCode2

WorkingAtty := ""
AttyClipboard := ""
AttorneyArray := []
NewClipboard := ie.document.getElementByID("fldstrAttorneys").innerText
AttorneyArray := StrSplit(NewClipboard, ",")

Loop % AttorneyArray.Length()
	AttorneyArray[A_Index] := Trim(AttorneyArray[A_Index])

Loop % AttorneyArray.Length()
	{
	QuickTemp := AttorneyArray[A_Index]
	if instr(AttorneyArray[A_Index], "Working")
		StringMid, WorkingAtty, QuickTemp, 1, 3
	}
	
Loop % AttorneyArray.Length()
	{
	if instr(AttorneyArray[A_Index], "IPP")
		continue
	else if instr(AttorneyArray[A_Index], "CLSP")
		continue	
	else if instr(AttorneyArray[A_Index], "USPS")
		continue
	else if instr(AttorneyArray[A_Index], "FPA")
		continue
	else
		{
		Temp := Trim(AttorneyArray[A_Index])
		StringMid, Temp, Temp, 1, 3
		
		IniRead, NewTemp, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini,  Attorneys, % Temp
		if NewTemp = ERROR   
			Temp := "2" . Temp
		else
			Temp := NewTemp
		
		if instr(Temp, WorkingAtty)
			{
			MailItem.To := Temp
			}
		else if AttyClipboard = 
			AttyClipboard := Temp
		else
			{
			if instr(AttyClipboard, Temp)
				continue
			else
				AttyClipboard := AttyClipboard . "; " . Temp 									
			}
		}
	}
	MailItem.Cc := AttyClipboard
	MailItem.Bcc := "INTFEES.Mailbox"



NumRows := ie.document.getElementById("dgdDueDate").getElementsByTagName("TR").length
LastAction := ie.document.getElementById("dgdDueDate").getElementsByTagName("TR")[NumRows - 1].getElementsByTagName("TD")[0].innerText
LastDueDate := ie.document.getElementById("dgdDueDate").getElementsByTagName("TR")[NumRows - 1].getElementsByTagName("TD")[1].innerText

EmailSubject := ClientCode
MailItem.Subject := EmailSubject " | " LastAction " | Due Date: " LastDueDate ;change to whatever your subject is.


MailItem.Display ; Make email visible

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

/*
###############################################################################################################
######                                      ADOSQL v5.04L - By [VxE]                                     ######
###############################################################################################################

	Wraps the utility of ADODB to connect to a database, submit a query, and read the resulting recordset.
	Returns the result as a new object (or array of objects, if the query has multiple statements).
	To instead have this function return a string, include a delimiter option in the connection string.

	For AHK-L (v1.1 or later).
	Freely available @ http://www.autohotkey.com/community/viewtopic.php?p=558323#p558323

	IMPORTANT! Before you can use this library, you must have access to a database AND know the connection
	string to connect to your database.

	Varieties of databases will have different connection string formats, and different drivers (providers).
	Use the mighty internet to discover the connection string format and driver for your type of database.

	Example connection string for SQLServer (2005) listening on port 1234 and with a static IP:
	DRIVER={SQL SERVER};SERVER=192.168.0.12,1234\SQLEXPRESS;DATABASE=mydb;UID=admin;PWD=12345;APP=AHK
*/

Global ADOSQL_LastError, ADOSQL_LastQuery ; These super-globals are for debugging your SQL queries.


ADOSQL(Query_Statement) {
; Uses an ADODB object to connect to a database, submit a query and read the resulting recordset.
; By default, this function returns an object. If the query generates exactly one result set, the object is
; a 2-dimensional array containing that result (the first row contains the column names). Otherwise, the
; returned object is an array of all the results. To instead have this function return a string, append either
; ";RowDelim=`n" or ";ColDelim=`t" to the connection string (substitute your preferences for "`n" and "`t").
; If there is more than one table in the output string, they are separated by 3 consecutive row-delimiters.
; ErrorLevel is set to "Error" if ADODB is not available, or the COM error code if a COM error is encountered.
; Otherwise ErrorLevel is set to zero.

Connection_String := "Provider=sqloledb;Data Source=DB-Portal;Initial Catalog=KMOBPortal;Integrated Security=SSPI;"

coer := "", txtout := 0, rd := "`n", cd := "CSV", str := Connection_String ; 'str' is shorter.

; Examine the connection string for output formatting options.
	If ( 9 < oTbl := 9 + InStr( ";" str, ";RowDelim=" ) )
	{
		rd := SubStr( str, oTbl, 0 - oTbl + oRow := InStr( str ";", ";", 0, oTbl ) )
		str := SubStr( str, 1, oTbl - 11 ) SubStr( str, oRow )
		txtout := 1
	}
	If ( 9 < oTbl := 9 + InStr( ";" str, ";ColDelim=" ) )
	{
		cd := SubStr( str, oTbl, 0 - oTbl + oRow := InStr( str ";", ";", 0, oTbl ) )
		str := SubStr( str, 1, oTbl - 11 ) SubStr( str, oRow )
		txtout := 1
	}

	;ComObjError( 0 ) ; We'll manage COM errors manually.

; Create a connection object. > http://www.w3schools.com/ado/ado_ref_connection.asp
; If something goes wrong here, return blank and set the error message.
	If !( oCon := ComObjCreate( "ADODB.Connection" ) )
		Return "", ComObjError( 1 ), ErrorLevel := "Error"
		, ADOSQL_LastError := "Fatal Error: ADODB is not available."


	oCon.ConnectionTimeout := 3 ; Allow 3 seconds to connect to the server.
	oCon.CursorLocation := 3 ; Use a client-side cursor server.
	oCon.CommandTimeout := 900 ; A generous 15 minute timeout on the actual SQL statement.
	oCon.Open( str ) ; open the connection.

; Execute the query statement and get the recordset. > http://www.w3schools.com/ado/ado_ref_recordset.asp
	If !( coer := A_LastError )
		oRec := oCon.execute( ADOSQL_LastQuery := Query_Statement )

	If !( coer := A_LastError ) ; The query executed OK, so examine the recordsets.
	{
		o3DA := [] ; This is a 3-dimensional array.
		While IsObject( oRec )
			If !oRec.State ; Recordset.State is zero if the recordset is closed, so we skip it.
				oRec := oRec.NextRecordset()
			Else ; A row-returning operation returns an open recordset
			{
				oFld := oRec.Fields
				o3DA.Insert( oTbl := [] )
				oTbl.Insert( oRow := [] )

				Loop % cols := oFld.Count ; Put the column names in the first row.
					oRow[ A_Index ] := oFld.Item( A_Index - 1 ).Name

				While !oRec.EOF ; While the record pointer is not at the end of the recordset...
				{
					oTbl.Insert( oRow := [] )
					oRow.SetCapacity( cols ) ; Might improve performance on huge tables??
					Loop % cols
						oRow[ A_Index ] := oFld.Item( A_Index - 1 ).Value	
					oRec.MoveNext() ; move the record pointer to the next row of values
				}

				oRec := oRec.NextRecordset() ; Get the next recordset.
			}

		If (txtout) ; If the user wants plaintext output, copy the results into a string
		{
			Query_Statement := "x"
			Loop % o3DA.MaxIndex()
			{
				Query_Statement .= rd rd
				oTbl := o3DA[ A_Index ]
				Loop % oTbl.MaxIndex()
				{
					oRow := oTbl[ A_Index ]
					Loop % oRow.MaxIndex()
						If ( cd = "CSV" )
						{
							str := oRow[ A_Index ]
							StringReplace, str, str, ", "", A                   ; "
							If !ErrorLevel || InStr( str, "," ) || InStr( str, rd )
								str := """" str """"
							Query_Statement .= ( A_Index = 1 ? rd : "," ) str
						}
						Else
							Query_Statement .= ( A_Index = 1 ? rd : cd ) oRow[ A_Index ]
				}
			}
			Query_Statement := SubStr( Query_Statement, 2 + 3 * StrLen( rd ) )
		}
	}
	Else ; Oh NOES!! Put a description of each error in 'ADOSQL_LastError'.
	{
		oErr := oCon.Errors ; > http://www.w3schools.com/ado/ado_ref_error.asp
		Query_Statement := "x"
		Loop % oErr.Count
		{
			oFld := oErr.Item( A_Index - 1 )
			str := oFld.Description
			Query_Statement .= "`n`n" SubStr( str, 1 + InStr( str, "]", 0, 2 + InStr( str, "][", 0, 0 ) ) )
				. "`n   Number: " oFld.Number
				. ", NativeError: " oFld.NativeError
				. ", Source: " oFld.Source
				. ", SQLState: " oFld.SQLState
		}
		ADOSQL_LastError := SubStr( Query_Statement, 4 )
		Query_Statement := ""
		txtout := 1
	}

; Close the connection and return the result. Local objects are cleaned up as the function returns.
	oCon.Close()
	;ComObjError( 1 )
	ErrorLevel := coer
	Return txtout ? Query_Statement : o3DA.MaxIndex() = 1 ? o3DA[1] : o3DA
} ; END - ADOSQL( Connection_String, Query_Statement )

/*
The version for AHK-Basic can be found here.

Here's a sample showing the use of microsoft's ODBC text driver with a csv file.SetWorkingDir, % A_ScriptDir
IfNotExist, products.csv
	FileAppend,
(
P_CODE,P_DESCRIPT,P_INDATE,P_QOH,P_MIN,P_PRICE,P_DISCOUNT,V_CODE
"11QER/31","Power painter,15 psi.,3-nozzle","03-NOV-2011",8,5,109.99,0.00,25595
"13-Q2/P2","7.25-in. pwr. saw blade","13-DEC-2011",32,15,14.99,0.05,21344
"14-Q1/L3","9.00-in. pwr. saw blade","13-NOV-2011",18,12,17.49,0.00,21344
"1546-QQ2","Hrd. cloth,1/4-in.,2x50","15-JAN-2012",15,8,39.95,0.00,23119
"1558-QW1","Hrd. cloth,1/2-in.,3x50","15-JAN-2012",23,5,43.99,0.00,23119
"2232/QTY","B\&D jigsaw,12-in. blade","30-DEC-2011",8,5,109.92,0.05,24288
"2232/QWE","B\&D jigsaw,8-in. blade","24-DEC-2011",6,5,99.87,0.05,24288
"2238/QPD","B\&D cordless drill,1/2-in.","20-JAN-2012",12,5,38.95,0.05,25595
"23109-HB","Claw hammer","20-JAN-2012",23,10,9.95,0.10,21225
"23114-AA","Sledge hammer,12 lb.","02-JAN-2012",8,5,14.40,0.05,NULL 
"54778-2T","Rat-tail file,1/8-in. fine","15-DEC-2011",43,20,4.99,0.00,21344
"89-WRE-Q","Hicut chain saw,16 in.","07-FEB-2012",11,5,256.99,0.05,24288
"PVC23DRT","PVC pipe,3.5-in.,8-ft","20-FEB-2011",188,75,5.87,0.00,NULL 
"SM-18277","1.25-in. metal screw,25","01-MAR-2012",172,75,6.99,0.00,21225
"SW-23116","2.5-in. wd. screw,50","24-FEB-2012",237,100,8.45,0.00,21231
"WR3/TT3","Steel matting,4""x8""x1/6",.5" mesh","17-JAN-2012",18,5,119.95,0.10,25595
), products.csv

connection_string =
( ltrim join;
	Driver={Microsoft Text Driver (*.txt; *.csv)}
	Extensions=asc,csv,tab,txt
	Persist Security Info=False
)

MsgBox % ADOSQL( connection_string ";coldelim=   `t", "
(
	SELECT P_CODE, P_PRICE, P_DESCRIPT
	FROM products.csv
	WHERE P_PRICE > ( SELECT AVG( P_PRICE ) FROM products.csv )
)")

filedelete, products.csv
*/


/*
#F3:: ;windowskey+F3
Send, ^c
ClipWait, .5
selText := Clipboard

qry := "SELECT * FROM dbo.vwAHKWorkspace WHERE WorkspaceName = '" selText "'"

result := ADOSQL(qry)

workspaceName := result[2,1] ;workspace name
miscId := result[2,2] ;miscellaneous folder Id

display := % miscId "`n" workspaceName

MsgBox, 0, Workspace Opener, % display
Return


#F4::
Send, ^c
ClipWait, .5
selText := Clipboard

qry := "SELECT * FROM dbo.vwAHKMatterInfo WHERE Matter = '" selText "'"

result := ADOSQL(qry)

matter := result[2,1] ;matter name
matterId := result[2,2] ;countryapp id or trademark id
invId := result[2,3] ;if matter is a patent, otherwise 0 is returned
system := result[2,4] ;matter type: patent or trademark
liveUrl := result[2,5] ;url in live docketing system
agentUrl := result[2,6] ;url in agent docketing system
invUrl := result[2,7] ;invention url if patent, otherwise black

display := % matter "`n" matterId "`n" invId "`n" system "`n" liveUrl "`n" agentUrl "`n" invUrl

MsgBox, 0, Matter Urls, % display
Return
*/

AttyEmailFinder(Attys)
{
ie := WBGet()
location := ie.LocationURL
global inventCountry
ClientCode := ""
ClientCode2 := ""
Country := ""
ThreeString := ""
TestString := ""
IniRead, ATPartner, C:\Users\%Computername%\AHKPrefs.ini, Username, ATPartner
Loop 10
{
AttyTest%A_Index% := ""
AttyString%A_Index% := ""
ThreeString%A_Index% := "" 
TestString%A_Index% := ""
}

Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
ClientCode2 := ie.document.getElementByID("fldstrCaseNumber").Value

StringReplace, ClientCode, ClientCode, %A_Space%, , A
StringReplace, ClientCode2, ClientCode2, %A_Space%, , A

if Country = ; Meaning we're on the Invention screen, probably.
	{
	newvar := "http://kmobnet/insidekmobnet/Patent_TM_Reports/facesheet.cfm?&casenumber=" . ClientCode2
	Gui, InventionCountry: Add, ActiveX, w800 h500 vinventCountry, Shell.Explorer  	; The final parameter is the name of the ActiveX component.
	inventCountry.Navigate(newvar)  												; This is specific to the web browser control.
	while inventCountry.busy or inventCountry.ReadyState != 4 						;Wait for page to load
		Sleep, 100
	Temp := % inventCountry.document.GetElementsByTagName("TR")[4].innerText
	ifinstring, Temp, US
		Country = US
	else
		Country = Not US
	Gui, InventionCountry: Destroy	
	}
	
if (instr(location, "tmkfrmTrademark") || instr(location, "patfrmInvention"))
	{
	attyRows := ie.document.getElementByID("dgdAttorneys").getElementsByTagName("tbody")[0].getElementsByTagName("tr")
	
	Loop % attyRows.length - 1  
		{
		if TestString = 
			TestString := attyRows[A_Index].getElementsByTagName("TD")[0].getElementsByTagName("A")[0].innerText
		else
			TestString := TestString . ", " . attyRows[A_Index].getElementsByTagName("TD")[0].getElementsByTagName("A")[0].innerText
		}
	} 
else	
	TestString := Attys

StringReplace, TestString, TestString, `- , , All                        ; Removes all dashes.
StringReplace, TestString, TestString, `r`n, `, , All                    ; Removes all hard returns. 
StringReplace, TestString, TestString, %A_Space% , , All ;               ; Removes all spaces, replaces with commas.
StringSplit, TestString, TestString, `, , . ; Omits periods.             ; Splits into array at commas.

if TestString%TestString0% = 
	TestString0--

Loop %TestString0%
{
StringLeft, AttyString%A_Index%, TestString%A_Index%, 3				; Stores first three characters of string.
	if ThreeString = 
		ThreeString := AttyString%A_Index%
	else
		ThreeString := ThreeString . " " . AttyString%A_Index%
}
Sort, ThreeString, U D%A_Space% 
StringSplit, ThreeString, ThreeString, %A_Space% , . ; Omits periods.     ; Splits into array at commas.

Loop %TestString0%
{
IniRead, AttyTest%A_Index%, \\docs-oc\files\Docketing\AutoHotKey\.ini Files - DO NOT TOUCH!\Attorneys.ini,  Attorneys, % ThreeString%A_Index% 
if AttyTest%A_Index% = ERROR                  ; If attorney is not an irregular one, sets AttyTest to 2aty team.
     AttyTest%A_Index% := "2" . ThreeString%A_Index%

StringLen, Atty%A_Index%Len, AttyTest%A_Index%	 
if Atty%A_Index%Len > 30                       ; If string is greater than 30 characters, meaning a runaway/blank array, sets array to blank.
	AttyTest%A_Index% = ;
}

Clipboard := ""
Loop %ThreeString0%
{
if Clipboard = 
	Clipboard := AttyTest%A_Index%
else
	Clipboard := Clipboard . "; " . AttyTest%A_Index%
}
if ClientCode = 
	ClientCode := ClientCode2

if Country = US
	{
	if ATPartner = -none-
		Clipboard := Clipboard . "; *FORUS, " . ClientCode . ".kmob@iwcs.kmob.com" 
	else
		Clipboard := Clipboard . "; " ATPartner . ", *FORUS, " . ClientCode . ".kmob@iwcs.kmob.com" 	
	}
else if Country != 
	{
	if ATPartner = -none-
		Clipboard := Clipboard
	else
		Clipboard := Clipboard . "; " ATPartner
	}
/*
else if Country = 
	{
	MsgBox, 0, Is this *FORUS?,Click OK if it is.`n`nOtherwise`, I'll assume it isn't., 3
		ifMsgBox OK
			{
			if ATPartner = -none-
				Clipboard := Clipboard . ", *FORUS, " . ClientCode . ".kmob@iwcs.kmob.com" 
			else
				Clipboard := Clipboard . ", " ATPartner . ", *FORUS, " . ClientCode . ".kmob@iwcs.kmob.com" 	
			}
		ifMsgBox TIMEOUT		
			{
			if ATPartner = -none-
				Clipboard := Clipboard
			else
				Clipboard := Clipboard . ", " ATPartner
			}
	}
*/

TrayTip, Attorneys saved to clipboard., Paste into CC: field and drag to To: field.
return
}
