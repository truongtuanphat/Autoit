HotKeySet("{F5}", "GetColorPartner")

Global $partnerColor

Do
   sleep(100)
Until $partnerColor <> ''
RegWrite('HKEY_CURRENT_USER\Software\OYG\AT','PC','REG_MULTI_SZ',$partnerColor)
MsgBox(0,'','OK')

Func GetColorPartner()
   $pnPos = MouseGetPos()
   $partnerColor = PixelGetColor($pnPos[0],$pnPos[1])
EndFunc