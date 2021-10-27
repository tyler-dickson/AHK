#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Enabled := ComObjError(false)
Menu, Tray, Icon, pifmgr.dll, 26
CoordMode, ToolTip 



StringSplit, FirstName, A_Username, . ,
Loop, Files, C:/Users/%FirstName1%.*, D
{
UserFolder = %A_LoopFileName%
}

if A_Username = UserFolder 
	Computername := A_Username
else
	Computername := UserFolder	

Gui, New, , Splitscreen
Gui, Font, bold
Gui, Add, ActiveX, vLive w1280 h600 x0 y-68, Shell.Explorer


OnMessage(0x100, "WB_OnKeyPress", 2) ; [color=green]; This when the GUI is initialized.[/color]
ComObjConnect(Live, Live_events)  ; Connect ie's events to the ie_events class object.
ComObjConnect(Agent, Agent_events)  ; Connect ie's events to the ie_events class object.
ComObjConnect(Interface, Interface_events)  ; Connect ie's events to the ie_events class object.

Live.silent := true

Live.navigate("https://workforcenow.adp.com/workforcenow/login.html?TYPE=33554433&REALMOID=06-dc2a3c54-b061-101f-ae21-844af8f80cb3&GUID=&SMAUTHREASON=0&METHOD=GET&SMAGENTNAME=-SM-6jDwbsoK7gMhGG%2b5XxVxJDXsLYkEM%2fkwLSsCX%2fnHupOY2LJ%2b9hW3BC8fSFuyDZ4o&TARGET=-SM-https%3a%2f%2fworkforcenow%2eadp%2ecom%2ftheme%2findex%2ehtml#")
; Agent.navigate("http://oc-docketing/CPiAgent/patfrmActionDueAgent.aspx?key=10939709&bc=1&key2=1275806")

Display(Interface,HTML_page)
Gui, Show, w1260
return

Display(WB,html_str) {
	Count:=0
	while % FileExist(f:=A_Temp "\" A_TickCount A_NowUTC "-tmp" Count ".DELETEME.html")
		Count+=1
	FileAppend,%html_str%,%f%
	WB.Navigate("file://" . f)
}

GuiClose:
Reload
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
