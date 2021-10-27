#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 119
formattime, Today, , yyyy-MM-dd	

::PCT1201:: 
SendInput, %Today% WIPO EM PCT EP FORM 1201 - Notification of European Patent Application Number -
return

::PCT301:: 
SendInput, %Today% WIPO EM PCT/IB/301 - Notification of Receipt of Record Copy by International Bureau -
return

::PCT304:: 
SendInput, %Today% WIPO EM PCT/IB/304 - Notification Concerning Priority Documents -
return

::PCT306:: 
SendInput, %Today% WIPO EM PCT/IB/306 - Notification of Recording of Change -
return

::PCT307:: 
SendInput, %Today% WIPO EM PCT/IB/307 - Notification of Withdrawal of Applications or Designations -
return

::PCT308:: 
SendInput, %Today% WIPO EM PCT/IB/308 - Notification Concerning Transmission of Application to Designated Offices -
return

::PCT311:: 
SendInput, %Today% WIPO EM PCT/IB/311 - Notice of Publication -
return

::PCT313:: 
SendInput, %Today% WIPO EM PCT/IB/313 - Notification of Defects in International Application -
return

::PCT316:: 
SendInput, %Today% WIPO EM PCT/IB/316 - Invitation to Correct Priority Claim -
return

::PCT318:: 
SendInput, %Today% WIPO EM PCT/IB/318 - Notification Relating to Priority Claim -
return

::PCT326:: 
SendInput, %Today% WIPO EM PCT/IB/326 373 237 - International Preliminary Report on Patentability (IPRP) -
return

::PCT332:: 
SendInput, %Today% WIPO EM PCT/IB/332 - Information Concerning Elected Offices -
return

::PCT345:: 
SendInput, %Today% WIPO EM PCT/IB/345 - Miscellaneous Communication from the International Bureau -
return

::PCT368:: 
SendInput, %Today% WIPO EM PCT/IB/368 - Notification of Transmittal of Demand to IPEA -
return

::PCT370:: 
SendInput, %Today% WIPO EM PCT/IB/370 - Invitation to Correct Declarations -
return

::PCT371:: 
SendInput, %Today% WIPO EM PCT/IB/371 - Notification Relating to Declaration under PCT Rule 4.17 -
return

::PCT402:: 
SendInput, %Today% WIPO EM PCT/IPEA/402 - Notification of Receipt of Demand -
return

::PCT403:: 
SendInput, %Today% WIPO EM PCT/IPEA/403 - Notification Concerning Payment of Preliminary Exam Fees -
return

::PCT404:: 
SendInput, %Today% WIPO EM PCT/IPEA/404 - Invitation to Correct Defects in the Demand -
return

::PCT405:: 
SendInput, %Today% WIPO EM PCT/IPEA/405 - Invitation to Restrict or Pay Additional Fees -
return

::PCT408:: 
SendInput, %Today% WIPO EM PCT/IPEA/408 - Written Opinion of the Examining Authority -
return

::PCT416:: 
SendInput, %Today% WIPO EM PCT/IPEA/416 409 - International Preliminary Report on Patentability (IPRP) -
return

::PCT424:: 
SendInput, %Today% WIPO EM PCT/IPEA/424 - IPEA Miscellaneous Request -
return

::PCT427:: 
SendInput, %Today% WIPO EM PCT/IPEA/427 - Communication Regarding Extension of Time Limit -
return

::PCT429:: 
SendInput, %Today% WIPO EM PCT/IPEA/429 - Notice from IPEA Concerning Informal Communication with Applicant -
return

::PCT440:: 
SendInput, %Today% WIPO EM PCT/IPEA/440 - Invitation to Pay Late Fees -
return

::PCT441:: 
SendInput, %Today% WIPO EM PCT/IPEA/441 - Invitation to Furnish Sequence Listing -
return

::PCT202:: 
SendInput, %Today% WIPO EM PCT/ISA/202 - Notification of Receipt of Record Copy by Search Authority -
return

::PCT205:: 
SendInput, %Today% WIPO EM PCT/ISA/205 - Notification of Modification of Abstract -
return

::PCT206:: 
SendInput, %Today% WIPO EM PCT/ISA/206 - Invitation to Pay Additional Search Fees -
return

::PCT207:: 
SendInput, %Today% WIPO EM PCT/ISA/207 - Informal Clarification – Note/Invitation – from ISA -
return

::PCT210:: 
SendInput, %Today% WIPO EM PCT/ISA/210 - International Search Report -
return

::PCT220:: 
SendInput, %Today% WIPO EM PCT/ISA/220 210 237 - Search Report/Written Opinion -
return

::PCT224:: 
SendInput, %Today% WIPO EM PCT/ISA/224 - Form When No Other Form Is Applicable -
return

::PCT225:: 
SendInput, %Today% WIPO EM PCT/ISA/225 - Invitation to Furnish Sequence Listing -
return

::PCT102:: 
SendInput, %Today% WIPO EM PCT/RO/102 - Notification Concerning Payment of Prescribed Fee -
return

::PCT105:: 
SendInput, %Today% WIPO EM PCT/RO/105 - Filing Receipt -
return

::PCT106:: 
SendInput, %Today% WIPO EM PCT/RO/106 - PCT Invitation to Correct Defects -
return

::PCT107:: 
SendInput, %Today% WIPO EM PCT/RO/107 - Invitation Relating to Multiple Parts -
return

::PCT110:: 
SendInput, %Today% WIPO EM PCT/RO/110 - Invitation to Correct Priority Claim -
return

::PCT111:: 
SendInput, %Today% WIPO EM PCT/RO/111 - Notification Relating to Priority Claim -
return

::PCT117:: 
SendInput, %Today% WIPO EM PCT/RO/117 - Notification of Withdrawal of Intl Application -
return

::PCT119:: 
SendInput, %Today% WIPO EM PCT/RO/119 - Notification of Refund of Fees -
return

::PCT132:: 
SendInput, %Today% WIPO EM PCT/RO/132 - Miscellaneous Communication from the PCT Receiving Office -
return

::PCT133:: 
SendInput, %Today% WIPO EM PCT/RO/133 - Invitation to Pay Prescribed Fees with Surcharge -
return

::PCT151:: 
SendInput, %Today% WIPO EM PCT/RO/151 - Notification of Transmission to the International Bureau and Invitation to Pay Fee -
return

::PCT199:: 
SendInput, %Today% WIPO EM PCT/RO/199 - Ack Receipt for 19.4 Applications -
return