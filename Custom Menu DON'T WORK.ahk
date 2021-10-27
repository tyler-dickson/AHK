#SingleInstance, force
CoordMode, mouse, screen
SetWinDelay, -1
SetBatchLines, -1
CoordMode, tooltip, screen
DetectHiddenWindows, On


	Gui, +LastFound -Caption +ToolWindow +AlwaysOnTop 
	hGui := WinExist()
	Gui, Font,s8 , Webdings	
	Gui, Add, Picture, x0 y0 +0x8000 gOnClick, enable.ico
	WinSet ExStyle, 0x08000008, ahk_id %hGui%  



	Gui, Color, 0
	WinSet, TransColor, 0

;	Dock_HostClass := "#32770"
	Dock_ClientId := hGui

	Dock("R","T",0,0,-90,5)
	Gui, Show, AutoSize
	Gui, Hide
	
return



GuiContextMenu:
	hwnd := WinExist("A")
	WinGetClass class, ahk_id %hwnd%
	msgbox Exclude %class% ?
return

OnClick:
	FMA_SHOW    = 3
	WM_FAVMENU	= 0x399
	PostMessage, WM_FAVMENU, FMA_SHOW,,,ahk_id 0xFFFF	
return


Dock(H="R",V="T", sizeX="", sizeY="", dx=0, dy=0 ) {
	local hwnd, msg


	hwnd := WinExist("ahk_pid " . DllCall("GetCurrentProcessId","Uint"))
	Dock_msg := 0x550

	HookDll = wineventhook.dll
	
	Dock_pH := H 
	Dock_pV := V
	Dock_dx := dx 
	Dock_dy := dy
	Dock_sizeX := sizeX 
	Dock_sizeY := sizeY

	Dock_hHookDll := API_LoadLibrary(HookDll)

	Dock_hHook0 := Hook(hwnd, Dock_msg, 3)								;   EVENT_SYSTEM_FOREGROUND
	Dock_hHook1 := Hook(hwnd, Dock_msg, 22, 23)							;   EVENT_SYSTEM_MINIMIZEEND
	Dock_hHook2 := Hook(hwnd, Dock_msg, 2)		
	Dock_hHook4 := Hook(hwnd, Dock_msg, 10, 11, "Dock_HookHandler")		;	EVENT_SYSTEM_MOVESIZESTART :=  10	EVENT_SYSTEM_MOVESIZEEND :=  11

	return Dock_hHook & Dock_hHookDll
}

Dock_Timer:
	WinGetPos, Dock_hX, Dock_hY, Dock_hW, Dock_hH,  ahk_id %Dock_HookHwnd%
	WinGetPos, Dock_cX, Dock_cY, Dock_cW, Dock_cH,  ahk_id %Dock_ClientId%
	Dock_H := Dock_cH
	Dock_W := Dock_cW

	
	if (Dock_sizeX)
		StringReplace, Dock_W, Dock_sizeX, A_DockHostWidth, %Dock_hW%

	if (Dock_sizeY)	
		StringReplace, Dock_H, Dock_sizeY, A_DockHostHeight, %Dock_hH%

	
	Dock_x := Dock_hX 
	if (Dock_pH = "R")
			Dock_x := Dock_hX + Dock_hW
	else if (Dock_pH = "M") 
		Dock_x := Dock_hX + (Dock_hW//2) - (Dock_cW//2)

	Dock_y := Dock_hY
	if (Dock_pV = "B")
		Dock_y := Dock_hY + Dock_hH
	else if (Dock_pV = "M") 
		Dock_y := Dock_hY + (Dock_hH//2) - (Dock_cH//2)


	Dock_x += Dock_dx, Dock_y += Dock_dy
	WinMove, ahk_id %Dock_ClientId%, ,%Dock_X%, %Dock_Y%, %Dock_W%, %Dock_H%
	WinSet, Top,, ahk_id %Dock_ClientId%
	API_ShowWindow(Dock_ClientId, 4)
return


Undock(){
	goSub Dock_Timer
	Unhook(Dock_hHook, Dock_msg)
	API_FreeLibrary(HookDll)
}
	
Dock_HookHandler(wParam, lParam, msg, hwnd) {
	local e, cls, title
	static alert 
	
	GetHookParams(lparam, Dock_event, Dock_HookHwnd)	   
	WinGetClass Dock_cls, ahk_id %Dock_HookHwnd% 

	if Dock_event = 2
	{
		alert := Dock_HookHwnd
		return
	}

	if (alert = Dock_HookHwnd)	;skip alert windows
		return

    WinGetTitle, title, ahk_id %Dock_HookHwnd% 
    if (title = "")
		return
	

	if StrLen(s)>200
		s =
	s .= Dock_event "`n"



	
	if (Dock_HookHwnd = Dock_ClientId) {
;		if !WinExist("ahk_class " Dock_HostClass)
;			WinHide, ahk_id %Dock_ClientId%
		return
	}
;	if (Dock_cls != Dock_HostClass){
;		if (Dock_event = 3)
;			WinHide, ahk_id %Dock_ClientId%
;		return
;	}
	Tooltip %s%, 0, 0
	if (Dock_event = 10)  {		;movesize start
		SetTimer, Dock_Timer, 0
		return
	}

	if (Dock_event = 11) {		;movesize end
		SetTimer, Dock_Timer, off
		gosub Dock_Timer
		return
	}

	if (Dock_event = 3)	{		;foreground
		Sleep 100
		gosub Dock_Timer
	}
	
	if (Dock_event = 23) or (Dock_event=0x800B)	;maximized
		gosub Dock_Timer
	

	if Dock_event = 22			;minimized
		WinHide, ahk_id %Dock_ClientId%
}


GetHookParams(lparam, ByRef event, ByRef hwnd="", ByRef idObject="", ByRef idChild="", ByRef dwEventThread="", ByRef dwmsEventTime="") {
	event			:=GetDeRefInteger(lParam+4)
	hwnd			:=GetDeRefInteger(lParam+8)
	idObject		:=GetDeRefInteger(lParam+12)
	idChild			:=GetDeRefInteger(lParam+16)
	dwEventThread	:=GetDeRefInteger(lParam+20)
	dwmsEventTime	:=GetDeRefInteger(lParam+24)
}

Hook(comm_hwnd, comm_msg, s_event, e_event="", function="", wparam=0) { 
	global HookDll 
    
	r := DllCall(HookDll "\reghook", "UInt", comm_hwnd, "UInt", COMM_MSG, "UInt", s_event, "UInt", e_event ? e_event : s_event, "UInt", wparam) 
	if !r 
		return 0 

	if (function)
		OnMessage(COMM_MSG, function) 

	return r 
}

Unhook(handle, com_msg) { 
   OnMessage(com_msg) 
   return DllCall("UnhookWinEvent", "UInt", handle) 
} 

API_LoadLibrary( dll ) { 
   return DllCall("LoadLibrary", "str", dll) 
}

API_FreeLibrary( h ) {
    return DllCall("FreeLibrary", "uint", h) 
}

API_ShowWindow(hwnd, flag){
   return DllCall("ShowWindow", "UInt", hwnd, "int", flag) 	
}



GetDeRefInteger(pSource, pIsSigned = false, pSize = 4)
; pSource is an integer pointer to a raw/binary integer
; The caller should pass true for pSigned to interpret the result as signed vs. unsigned.
; pSize is the size of PSource's integer in bytes (e.g. 4 bytes for a DWORD or Int).
{
   Loop %pSize%  ; Build the integer by adding up its bytes.
      result += *(pSource + A_Index-1) << 8*(A_Index-1)
   if (!pIsSigned OR pSize > 4 OR result < 0x80000000)
      return result  ; Signed vs. unsigned doesn't matter in these cases.
   ; Otherwise, convert the value (now known to be 32-bit) to its signed counterpart:
   return -(0xFFFFFFFF - result + 1)
}

SetDeRefInteger(pInteger, pDest, pSize = 4)
; The caller must ensure that *pDest has sufficient capacity and that pDest is a valid dereferencable integer pointer.
; To preserve any existing contents at *pDest, only pSize number of bytes are altered.
{
   Loop %pSize%  ; Copy each byte in the integer into the structure as raw binary data.
      DllCall("RtlFillMemory", UInt, pDest + A_Index-1, UInt, 1, UChar, pInteger >> 8*(A_Index-1) & 0xFF)
}