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
Country := ie.document.getElementByID("fldstrCountry_TextBox").Value
AppNumber :=  ie.document.getElementByID("fldstrAppNumber").Value
PubNumber := ie.document.getElementByID("fldstrPubNumber").Value
EPPubNumber := "EP" . PubNumber
EPAppNumber := "EP" . AppNumber
StringLeft, FirstEight, AppNumber, 8
EPFirstEight := "EP" . FirstEight

EPNoPeriod :=
Sleep 500
MsgBox, %ClientCode% %PubNumber% %Country%

if Country = AT
	{

	OutputVar := "http://seeip.patentamt.at/EPatentSuche/EPRegister/" PubNumber
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
if Country = BG
	{

	BGAppNo := "EP"
	OutputVar := "http://bpp.economie.fgov.be/fo-eregister-view/application?lng=fr&number=" EPPubNumber "&table=EInvention"
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


AppNumber
PubNumber
EPPubNumber
EPAppNumber
EPNoPeriod
FirstEight
EPFirstEight

	
App No: 04753697.4
Pub No: 1635739

About This File:    https://register.epo.org/application?number=EP10006511&lng=en&tab=main
Federated Register: https://register.epo.org/application?number=EP10006511&lng=en&tab=federated
All Documents:      https://register.epo.org/application?number=EP10006511&lng=en&tab=doclist
---
AT: "http://seeip.patentamt.at/EPatentSuche/EPRegister/" PubNumber
BE: "http://bpp.economie.fgov.be/fo-eregister-view/application?lng=fr&number=" EPPubNumber "&table=EInvention"
BG:	https://portal.bpo.bg/en/rd?epo_key=EP04753697 EPFirstEight
CH: https://www.swissreg.ch/srclient/en/pat/EP1635739 EPPubNumber
CY: No site.
CZ: http://isdv.upv.cz/portal/pls/portal/portlets.pta.det?pskup=5&pciod=1635739&plang=en PubNumber
DE: http://register.dpma.de/DPMAregister/pat/register?lang=en&AKZ=E047536974 EPNoPeriod
DK: http://onlineweb.dkpto.dk/pvsonline/Patent?action=102&language=gb&sagID=04753697.4
EE: http://www1.epa.ee/ep/data.asp?NroParam=EP04753697.4
ES: http://sitadex.oepm.es/SitadexWS/index.jsp?numExp=E04753697
FI: http://patent.prh.fi/FiEp/tiedot.asp?NroParam=EP04753697.4
FR: http://bases-brevets.inpi.fr/en/document-en/EP1635739.html
GB: http://www.ipo.gov.uk/p-ipsum/Case/PublicationNumber/EP1635739
GR: http://www.obi.gr/dl/emtservice/regviewer_pn?pn=EP1635739
HU: http://epub.hpo.hu/e-kutatas/index.html?lang=en&service=ADATLAP&appId=E04753697
IE: https://eregister.patentsoffice.ie/register/PTRegister.aspx?idappli=04753697.4
IS: http://els.is/einkaleyfi/leit-i-gagnabonkum?application-number=EP2335707
IT: http://www.uibm.gov.it/uibm/dati/Tmview.aspx?load=espacenet&PubblicationNumber=EP1635739&table=EInvention
LI: No site.
LT: http://www.vpb.lt/db_eu_patentai/rezult-singl.php?db=vpb_europat&extidpatent=2335707
LU: http://patent.public.lu/fo-eregister-view/application?lng=en&number=EP1635739
LV: No site.
MC: https://mcipo.gouv.mc/register/data/patent/pn/EP1635739
NL: http://mijnoctrooi.rvo.nl/fo-eregister-view/application?lng=en&number=EP1635739
PL: http://regserv.uprp.pl/register/application?number=EP04753697&lng=en
PT: http://servicosonline.inpi.pt/pesquisas/main/patentesdirecto.jsp?lang=en&fpubnumber=EP1635739
RO: http://rnb.osim.ro/?pn=1635739
SE: http://was.prv.se/spd/ep/an/047536974
SI: http://www2.uil-sipo.si/ds1.htm?A=107100&Q=PN%3D1635739
SK: http://www.upv.sk/patentView/?id=1635739
TR: http://online.turkpatent.gov.tr/EPATENT/epo_search.jsp?param=EP1635739


	

SwitchSystem()
{

OutputVar = http://oc-docketing/CPiAgent/patschCountryApplicationAgent.aspx
params := [OutputVar, 65536]   ;32 
ie.Navigate(params*)
while ie.busy or ie.ReadyState != 4 ;Wait for page to load
	Sleep, 500
ie2 := WBGet()
while ie2.busy or ie2.ReadyState != 4 ;Wait for page to load
	Sleep, 500
ie2.Visible := True
WinActivate, ahk_class IEFrame

return
}

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

