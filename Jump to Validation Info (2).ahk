#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
Enabled := ComObjError(false)
Menu, Tray, Icon, mmcndmgr.dll , 63


#v::
ie := ""
ie := WBGet()
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 100
ClientCode := ie.document.getElementByID("fldstrCaseNumber_TextBox").Value
Country :=  ie.document.getElementByID("fldstrCountry_TextBox").Value
AppNumber :=  ie.document.getElementByID("fldstrAppNumber").Value
	StringReplace, AppNumber, AppNumber, EP, , 
PubNumber := ie.document.getElementByID("fldstrPubNumber").Value
EPAppNumber := "EP" . AppNumber
StringLeft, FirstEight, AppNumber, 8
EPFirstEight := "EP" . FirstEight
EPPubNumber := "EP" . PubNumber
Sleep 500
if Country = AT
	{
	OutputVar := "http://seeip.patentamt.at/EPatentSuche/EPRegister/" PubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = CZ
	{
	OutputVar := "http://isdv.upv.cz/portal/pls/portal/portlets.pta.det?pskup=5&pciod=" PubNumber "&plang=en"
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = LT
	{
	OutputVar := "http://www.vpb.lt/db_eu_patentai/rezult-singl.php?db=vpb_europat&extidpatent=" PubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = RO
	{
	OutputVar := "http://rnb.osim.ro/?pn=" PubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = SI
	{
	OutputVar := "http://www2.uil-sipo.si/ds1.htm?A=107100&Q=PN%3D" PubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = SK
	{
	OutputVar := "http://www.upv.sk/patentView/?id=" PubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = BE
	{
	OutputVar := "http://bpp.economie.fgov.be/fo-eregister-view/application?lng=fr&number=" EPPubNumber "&table=EInvention"
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = CH
	{
	OutputVar := "https://www.swissreg.ch/srclient/en/pat/" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = FR
	{
	OutputVar := "http://bases-brevets.inpi.fr/en/document-en/" EPPubNumber ".html"	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = GB
	{
	OutputVar := "http://www.ipo.gov.uk/p-ipsum/Case/PublicationNumber/" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = GR
	{
	OutputVar := "http://www.obi.gr/dl/emtservice/regviewer_pn?pn=" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = IS
	{
	OutputVar := "http://els.is/einkaleyfi/leit-i-gagnabonkum?application-number=" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = IT
	{
	OutputVar := "http://www.uibm.gov.it/uibm/dati/Tmview.aspx?load=espacenet&PubblicationNumber=" EPPubNumber "&table=EInvention"	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = LU
	{
	OutputVar := "http://patent.public.lu/fo-eregister-view/application?lng=en&number=" EPPubNumber	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = NL
	{
	OutputVar := "http://mijnoctrooi.rvo.nl/fo-eregister-view/application?lng=en&number=" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = PT
	{
	OutputVar := "http://servicosonline.inpi.pt/pesquisas/main/patentesdirecto.jsp?lang=en&fpubnumber=" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if Country = TR
	{
	OutputVar := "http://online.turkpatent.gov.tr/EPATENT/epo_search.jsp?param=" EPPubNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = SE
	{
	OutputVar := "http://was.prv.se/spd/ep/an/" FirstEight	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = BG
	{
	OutputVar := "https://portal.bpo.bg/en/rd?epo_key=" EPFirstEight
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = PL
	{
	OutputVar := "http://regserv.uprp.pl/register/application?number=" EPFirstEight "&lng=en"	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = ES
	{
	EFirstEight := "E" . FirstEight
	OutputVar := "http://sitadex.oepm.es/SitadexWS/index.jsp?numExp=" EFirstEight ; E04753697
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = HU
	{
	EFirstEight := "E" . FirstEight
	OutputVar := "http://epub.hpo.hu/e-kutatas/index.html?lang=en&service=ADATLAP&appId=" EFirstEight	
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = DK
	{
	OutputVar := "http://onlineweb.dkpto.dk/pvsonline/Patent?action=102&language=gb&sagID=" AppNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
if Country = IE
	{
	OutputVar := "https://eregister.patentsoffice.ie/register/PTRegister.aspx?idappli=" AppNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = EE
	{
	OutputVar := "http://www1.epa.ee/ep/data.asp?NroParam=" EPAppNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = FI
	{
	OutputVar := "http://patent.prh.fi/FiEp/tiedot.asp?NroParam=" EPAppNumber
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}		
if Country = DE
	{
	EAppNumber := "E" . AppNumber
	StringReplace, ENoPeriod, EAppNumber, ., , 
	OutputVar := "http://register.dpma.de/DPMAregister/pat/register?lang=en&AKZ=" ENoPeriod ; E047536974 
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
	
if Country = CY
	gosub NoWebsite
if Country = LI
	gosub NoWebsite
if Country = LV
	gosub NoWebsite
if Country = AL
	gosub NoWebsite	
if Country = BA
	gosub NoWebsite	
if Country = HR
	gosub NoWebsite
if Country = ME
	gosub NoWebsite
if Country = MK
	gosub NoWebsite
if Country = MT
	gosub NoWebsite
if Country = RS
	gosub NoWebsite
if Country = SM
	gosub NoWebsite
	
if Country = EP
	{
	Gui, New, , Where on the EPO website do you want to go?
	Gui, Add, Button, gOption1, About This File
	Gui, Add, Button, gOption1, Federated Register	
	Gui, Add, Button, gOption1, All Documents	
	Gui, Show, NoActivate
	Gui, Flash
	return
	}
else
	MsgBox, , Not on an EP or Validation record., You aren't on an EP or Validation record.`n`nCheck your Client Code and try again.
return

NoWebsite:
MsgBox, , No website information., No website information available.`n`nKnow the right website? Let Tyler know.
return

Option1:
Gui, Submit
if A_GuiControl = About This File
	{
	OutputVar := "https://register.epo.org/application?number=" EPFirstEight "&lng=en&tab=main"
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if A_GuiControl = Federated Register
	{
	OutputVar := "https://register.epo.org/application?number=" EPFirstEight "&lng=en&tab=federated"
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}
if A_GuiControl = All Documents
	{
	OutputVar := "https://register.epo.org/application?number=" EPFirstEight "&lng=en&tab=doclist"
	params := [OutputVar, 65536]   ;32 
	ie.Navigate(params*)
	return
	}	
	
GuiClose:
Gui, Destroy
return

	
;App No: 04753697.4
;Pub No: 1635739

;About This File:    https://register.epo.org/application?number=EP10006511&lng=en&tab=main
;Federated Register: https://register.epo.org/application?number=EP10006511&lng=en&tab=federated
;All Documents:      https://register.epo.org/application?number=EP10006511&lng=en&tab=doclist
---



;				PubNumber

;AT: "http://seeip.patentamt.at/EPatentSuche/EPRegister/" PubNumber
;CZ: "http://isdv.upv.cz/portal/pls/portal/portlets.pta.det?pskup=5&pciod=" PubNumber "&plang=en"
;LT: "http://www.vpb.lt/db_eu_patentai/rezult-singl.php?db=vpb_europat&extidpatent=" PubNumber
;RO: "http://rnb.osim.ro/?pn=" PubNumber
;SI: "http://www2.uil-sipo.si/ds1.htm?A=107100&Q=PN%3D" PubNumber
;SK: "http://www.upv.sk/patentView/?id=" PubNumber

;				EPPubNumber

;BE: "http://bpp.economie.fgov.be/fo-eregister-view/application?lng=fr&number=" EPPubNumber "&table=EInvention"
;CH: "https://www.swissreg.ch/srclient/en/pat/" EPPubNumber
;FR: "http://bases-brevets.inpi.fr/en/document-en/" EPPubNumber ".html"	
;GB: "http://www.ipo.gov.uk/p-ipsum/Case/PublicationNumber/" EPPubNumber
;GR: "http://www.obi.gr/dl/emtservice/regviewer_pn?pn=" EPPubNumber
;IS: "http://els.is/einkaleyfi/leit-i-gagnabonkum?application-number=" EPPubNumber
;IT: "http://www.uibm.gov.it/uibm/dati/Tmview.aspx?load=espacenet&PubblicationNumber=" EPPubNumber "&table=EInvention"	
;LU: "http://patent.public.lu/fo-eregister-view/application?lng=en&number=" EPPubNumber
;NL: "http://mijnoctrooi.rvo.nl/fo-eregister-view/application?lng=en&number=" EPPubNumber
;PT: "http://servicosonline.inpi.pt/pesquisas/main/patentesdirecto.jsp?lang=en&fpubnumber=" EPPubNumber
;TR: "http://online.turkpatent.gov.tr/EPATENT/epo_search.jsp?param="	EPPubNumber

;				EPNoPeriod

;DE: "http://register.dpma.de/DPMAregister/pat/register?lang=en&AKZ=" EPNoPeriod ; E047536974 

;				FirstEight

;SE: "http://was.prv.se/spd/ep/an/" FirstEight

;				EPFirstEight

;BG:	"https://portal.bpo.bg/en/rd?epo_key=" EPFirstEight
;PL: "http://regserv.uprp.pl/register/application?number=" EPFirstEight "&lng=en"	

;				EFirstEight

;ES: "http://sitadex.oepm.es/SitadexWS/index.jsp?numExp=" EFirstEight ; E04753697
;HU: "http://epub.hpo.hu/e-kutatas/index.html?lang=en&service=ADATLAP&appId=" EFirstEight

;				AppNumber

;DK: "http://onlineweb.dkpto.dk/pvsonline/Patent?action=102&language=gb&sagID=" AppNumber
;IE: "https://eregister.patentsoffice.ie/register/PTRegister.aspx?idappli=" AppNumber

				;EPAppNumber

;EE: "http://www1.epa.ee/ep/data.asp?NroParam=" EPAppNumber
;FI: "http://patent.prh.fi/FiEp/tiedot.asp?NroParam=" EPAppNumber

;				No site.

;CY: No site.
;LI: No site.
;LV: No site.

;AL BA HR ME MK MT RS SM

/*
AT: "http://seeip.patentamt.at/EPatentSuche/EPRegister/" PubNumber
BE: "http://bpp.economie.fgov.be/fo-eregister-view/application?lng=fr&number=" EPPubNumber "&table=EInvention"
BG:	"https://portal.bpo.bg/en/rd?epo_key=" EPFirstEight
CH: "https://www.swissreg.ch/srclient/en/pat/" EPPubNumber
CY: No site.
CZ: "http://isdv.upv.cz/portal/pls/portal/portlets.pta.det?pskup=5&pciod=" PubNumber "&plang=en"
DE: "http://register.dpma.de/DPMAregister/pat/register?lang=en&AKZ=" EPNoPeriod ; E047536974 
DK: "http://onlineweb.dkpto.dk/pvsonline/Patent?action=102&language=gb&sagID=" AppNumber
EE: "http://www1.epa.ee/ep/data.asp?NroParam=" EPAppNumber
ES: "http://sitadex.oepm.es/SitadexWS/index.jsp?numExp=" EFirstEight ; E04753697		
FI: "http://patent.prh.fi/FiEp/tiedot.asp?NroParam=" EPAppNumber
FR: "http://bases-brevets.inpi.fr/en/document-en/" EPPubNumber ".html"											
GB: "http://www.ipo.gov.uk/p-ipsum/Case/PublicationNumber/" EPPubNumber
GR: "http://www.obi.gr/dl/emtservice/regviewer_pn?pn=" EPPubNumber
HU: "http://epub.hpo.hu/e-kutatas/index.html?lang=en&service=ADATLAP&appId=" EFirstEight
IE: "https://eregister.patentsoffice.ie/register/PTRegister.aspx?idappli=" AppNumber
IS: "http://els.is/einkaleyfi/leit-i-gagnabonkum?application-number=" EPPubNumber
IT: "http://www.uibm.gov.it/uibm/dati/Tmview.aspx?load=espacenet&PubblicationNumber=" EPPubNumber "&table=EInvention"	
LI: No site.
LT: "http://www.vpb.lt/db_eu_patentai/rezult-singl.php?db=vpb_europat&extidpatent=" PubNumber
LU: "http://patent.public.lu/fo-eregister-view/application?lng=en&number=" EPPubNumber
LV: No site.
MC: "https://mcipo.gouv.mc/register/data/patent/pn/" EPPubNumber
NL: "http://mijnoctrooi.rvo.nl/fo-eregister-view/application?lng=en&number=" EPPubNumber
PL: "http://regserv.uprp.pl/register/application?number=" EPFirstEight "&lng=en"								
PT: "http://servicosonline.inpi.pt/pesquisas/main/patentesdirecto.jsp?lang=en&fpubnumber=" EPPubNumber
RO: "http://rnb.osim.ro/?pn=" PubNumber
SE: "http://was.prv.se/spd/ep/an/" FirstEight
SI: "http://www2.uil-sipo.si/ds1.htm?A=107100&Q=PN%3D" PubNumber
SK: "http://www.upv.sk/patentView/?id=" PubNumber
TR: "http://online.turkpatent.gov.tr/EPATENT/epo_search.jsp?param="	EPPubNumber
*/


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
