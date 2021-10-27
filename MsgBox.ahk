#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, pifmgr.dll, 29
CoordMode, ToolTip 

global interface

ShowTipsGUI("PCTAppNoExpirationDate")


return

Display(WB,html_str) {
	Count:=0
	while % FileExist(f:=A_Temp "\" A_TickCount A_NowUTC "-tmp" Count ".DELETEME.html")
		Count+=1
	FileAppend,%html_str%,%f%
	WB.Navigate("file://" . f)
}

AHKTipsGuiClose:
Reload
; Gui, AHKTips: Destroy
return

WB_OnKeyPress(wParam, lParam, nMsg, hWnd)
{
   WinGetClass WinClass, ahk_id %hWnd%
   if (WinClass == "Internet Explorer_Server")
   {
      static riid_IDispatch
      if !VarSetCapacity(riid_IDispatch)
      {
         VarSetCapacity(riid_IDispatch, 16)
         DllCall("ole32\CLSIDFromString", "WStr", "{00020400-0000-0000-C000-000000000046}", "Ptr", &riid_IDispatch)
      }
      DllCall("oleacc\AccessibleObjectFromWindow", "Ptr", hWnd, "UInt", 0xFFFFFFFC, "Ptr", &riid_IDispatch, "Ptr*", pacc) ; OBJID_CLIENT:=0xFFFFFFFC
      
      static IID_IHTMLWindow2 := "{332C4427-26CB-11D0-B483-00C04FD90119}"
      pwin := ComObjQuery(pacc, IID_IHTMLWindow2, IID_IHTMLWindow2)
         ObjRelease(pacc)
      
      static IID_IWebBrowserApp := "{0002DF05-0000-0000-C000-000000000046}"
           , SID_SWebBrowserApp := IID_IWebBrowserApp
      pweb := ComObjQuery(pwin, SID_SWebBrowserApp, IID_IWebBrowserApp)
         ObjRelease(pwin)
      wb := ComObject(9, pweb, 1)

      static IID_IOleInPlaceActiveObject := "{00000117-0000-0000-C000-000000000046}"
      pIOIPAO := ComObjQuery(wb, IID_IOleInPlaceActiveObject)

      VarSetCapacity(MSG, 48, 0)                      ; http://goo.gl/GX6GNm
      , NumPut(A_GuiY                                 ; POINT.y
      , NumPut(A_GuiX                                 ; POINT.x
      , NumPut(A_EventInfo                            ; time
      , NumPut(lParam                                 ; lParam
      , NumPut(wParam                                 ; wParam
      , NumPut(nMsg                                   ; message
      , NumPut(hWnd, MSG)))), "UInt"), "Int"), "Int") ; hwnd

      TranslateAccelerator := NumGet(NumGet(pIOIPAO + 0) + 5*A_PtrSize)
      Loop 2
         r := DllCall(TranslateAccelerator, "Ptr", pIOIPAO, "Ptr", &MSG)
      until (wParam != 9 || wb.Document.activeElement != "")
      ObjRelease(pIOIPAO)
      if (r == 0)
         return 0
   }
}

ShowTipsGUI(whichTip)
{
MYAPP_PROTOCOL:="myapp"

if whichTip = CARegFee/Declaration of Use
	{
	header := "CA Reg Fee/Declaration of Use"
	description := "If your base date is later than 6/17/2019, a Declaration of Use is no longer required for registration in Canada.<br><br>Confirm with the TMPL if a Declaration of Use is needed.<br><br>If not, you should use the standard Registration Fee action."
	height := 155
	}
else if whichTip = PCTAppNoExpirationDate
	{
	header := "PCT App: No Expiration Date"
	description := "It looks like the Expiration Date didn't generate for some reason. To fix it:<br><br>1) Copy the Filing Date.<br>2) Remove the Filing Date and click Save.<br>3) Paste it back in and Save again.<br><br> The Expiration Date should now generate."
	height := 145
	}
else 
	{
	header := "Test Header"
	description := "There would be some text here."
	height := 60
	}
	

HTML_page =
( 
<!DOCTYPE html>
<html>
	<head>
		<style>
			body {
			  font-family:sans-serif;
			  background-color:#eeeeee;
			  line-height: 1.1;
			}
			
			div {
			  position: fixed; 
			  top: 1px;
			  left: 1px;
			  unselectable: on;
			}
			
			table {
			  width: 298px; 
			  text-align: center;
			}

			td {
			  color: blue;
			  font-size: 12px;
			  font-weight: bold;
			  width: 100`%;
			  cursor: default;
				}	

			h4 {
			  color: black;
			  text-align: center;
			  font-style: italic;
			  margin-bottom: 3px;
			  border-bottom: 1px solid black
			}
		</style>
			<script>
			function testFunction() {
				alert("This is a test function.");
			}
		</script>
	</head>

	<body>
		<div>
			<table >
				<tr>
					<td>
						<h4 unselectable="on">%header%</h4>
					</td>
				</tr>
				
				<tr>
					<td style="padding-left: 20px; padding-right: 20px;" unselectable="on">
						%description%
					</td>
				</tr>
				
				
			</table>		
		</div>
	</body>
</html>
)

Gui, AHKTips: New, ToolWindow Border, %header%
Gui, AHKTips: Add, ActiveX, vInterface w320 h250 x0 y0, Shell.Explorer
OnMessage(0x100, "WB_OnKeyPress", 2) 
ComObjConnect(Interface, Interface_events)  ; Connect ie's events to the ie_events class object.
Interface.silent := true
Display(Interface,HTML_page)
Gui, AHKTips: Show, w300 h%height%
return

}
