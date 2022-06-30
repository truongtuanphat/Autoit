#RequireAdmin
#include <Date.au3>
#include <Crypt.au3>
#include <IE.au3>

HotKeySet("{ESC}", "_Exit")

$PCName = "DESKTOP-J2FQ7R3"
$MAC = '00:50:56:C0:00:08'
$curTime = '00:58:51'
$curDate = '7/18/2018'
$linkCheck = 'http://oygtool.freevnn.com/admin'

$partnerColor = RegRead('HKEY_CURRENT_USER\Software\OYG\AT','PC')
If $partnerColor = '' Then
   MsgBox(16,'Error 4','Chưa chọn mã màu')
   Exit
endif

$checkActive = ''
checkActive()

WinActivate('NoxPlayer')
$noxPos = WinGetPos('NoxPlayer')
$hdlNox = WinGetHandle('NoxPlayer')
BlockInput(1)
MouseClickDrag('left',$noxPos[0]+20,$noxPos[1]+20,20,20,0)
MouseClickDrag('left',$noxPos[2]-1,$noxPos[3]-1,900,536,0)
BlockInput(0)

while 1

   ;searchEXP
   if IsArray(PixelSearch(747, 431,747, 431,0xFF8436)) Then
	  $i = 0
	  $boss = PixelSearch(3, 100,897, 170,0x3A2110)

	  while $i < 31
		 $exp = PixelSearch(3, 233,896, 452,0xE0CFA3)

		 ;exp
		 if IsArray($exp) Then
			$exp_fight = PixelSearch($exp[0]-10,$exp[1]-40,$exp[0]+10,$exp[1]-150,0xF0F0FD,2)
			if IsArray($exp_fight) Then
			   ControlClick($hdlNox,'','','left',1,$exp_fight[0],$exp_fight[1])
			EndIf
		 EndIf

		 $i += 1
	  WEnd

	  ;boss
	  if IsArray($boss) Then
		 ControlClick($hdlNox,'','','left',1,$boss[0]-37,$boss[1]+8)
		 sleep(100)
	  EndIf

	  ;outPT
	  if IsArray(PixelSearch(832, 218,896, 227,0x5D7E91)) or IsArray(PixelSearch(680, 354,680, 354,0x12383C)) Then
		 ControlClick($hdlNox,'','','left',1,33, 75)
		 sleep(500)
		 ControlClick($hdlNox,'','','left',1,547, 312)
		 sleep(1000)
	  EndIf

	  ;doneBoss
	  if IsArray(PixelSearch(306, 220,622, 388,0xFFF4D3)) Then
		 ControlClick($hdlNox,'','','left',1,33, 75)
		 sleep(500)
		 ControlClick($hdlNox,'','','left',1,547, 312)
		 sleep(1000)
	  EndIf

	  ControlClick($hdlNox,'','','left',1,505, 300)

   Else

	  ;checkLV
	  if IsArray(PixelSearch(818, 409,818, 409,0xFADCB0)) then
		 sleep(1000)
		 $i = 0
		 While $i < 4
			if IsArray(PixelSearch(311, 377,508, 486,0xF4A123,4)) then
			   ControlClick($hdlNox,'','','left',2,425, 395)
			   WaitUntil(135, 516,0x4F301F)
			   BlockInput(1)
			   MouseClickDrag('left',135, 515,684, 515,10)
			   sleep(500)
			   MouseClickDrag('left',548, 436,239, 267,10)
			   sleep(500)
			   MouseClickDrag('left',636, 438,639, 283,10)
			   sleep(200)
			   ControlClick($hdlNox,'','','left',1,820, 407)
			   BlockInput(0)
;~ 			   CheckActive()
			   ExitLoop
			EndIf
			$i += 1
		 WEnd

		 ControlClick($hdlNox,'','','left',1,820, 407)			;ready

	  EndIf

	  ;target
	  if IsArray(PixelSearch(619, 527,619, 527,0xFDFFFF)) then
		 ControlClick($hdlNox,'','','left',3,451, 142)
		 sleep(300)
	  EndIf

	  ;continuePT
	  if IsArray(PixelSearch(504, 330,504, 330,0xF4B25F)) then
		 ControlClick($hdlNox,'','','left',1,504, 330)
		 sleep(5000)
	  EndIf

	  ;createPT
	  if IsArray(PixelSearch(864, 432,864, 432,0x44332B)) then
		 ControlClick($hdlNox,'','','left',1,864, 432)
		 WaitUntil(486, 409,0xF4B25F)
		 ControlClick($hdlNox,'','','left',1,459, 405)
		 WaitUntil(371, 132,0x986546)
		 ControlClick($hdlNox,'','','left',1,368, 123)	;bạn bè
		 sleep(1500)
	  EndIf

	  ;invite
	  if IsArray(PixelSearch(384, 135,384, 135,0xE0B68E)) then

		 if IsArray(PixelSearch(251, 163,647, 406,0xB5CACB)) then ;mời khi đã chọn được
			ControlClick($hdlNox,'','','left',1,545, 434)
			sleep(5000)
		 Else
			$partnerPos = PixelSearch(250, 148,516, 403,$partnerColor,2)
			if IsArray($partnerPos) then
			   ControlClick($hdlNox,'','','left',1,$partnerPos[0],$partnerPos[1])
			   sleep(100)
			   ControlClick($hdlNox,'','','left',1,547, 434)
			   sleep(5000)
			Else
			   while IsArray(PixelSearch(629, 405,629, 405,0xCCB49B)) <> 1
				  BlockInput(1)
				  MouseClickDrag('left',630, 396,629, 150,15)
				  BlockInput(0)
				  sleep(500)
				  $j = 0
				  While $j < 3
					 $partnerPos = PixelSearch(250, 148,516, 403,$partnerColor,2)
					 if IsArray($partnerPos) then
						ControlClick($hdlNox,'','','left',1,$partnerPos[0],$partnerPos[1])
						sleep(100)
						ExitLoop
					 EndIf
					 $j += 1
				  WEnd
				  if IsArray(PixelSearch(251, 163,647, 406,0xB5CACB)) = 1 Then
					 ExitLoop
				  EndIf
			   WEnd
			   if IsArray(PixelSearch(251, 163,647, 406,0xB5CACB)) <> 1 then
				  ControlClick($hdlNox,'','','left',1,864, 432)
				  WaitUntil(486, 409,0xF4B25F)
				  ControlClick($hdlNox,'','','left',1,459, 405)
				  WaitUntil(371, 132,0x986546)
				  ControlClick($hdlNox,'','','left',1,368, 123)
				  sleep(1500)
			   EndIf
			EndIf
		 EndIf
	  EndIf

	  ;endGame
	  if IsArray(PixelSearch(717, 433,717, 433,0x223638)) or IsArray(PixelSearch(532, 393,532, 393,0xD09118,10)) then
		 ControlClick($hdlNox,'','','left',1,715, 441)
		 sleep(500)
	  EndIf

	  ;Q
	  if IsArray(PixelSearch(598, 326,598, 326,0x59B461)) then
		 ControlClick($hdlNox,'','','left',1,598, 326)
		 sleep(100)
	  EndIf

   EndIf

WEnd

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Func WaitUntil($x,$y,$color)
   Do
	  sleep(100)
   Until IsArray(PixelSearch($x,$y,$x,$y,$color)) = 1
EndFunc

Func CheckActive()
   Run("RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess " & '8')	;delete cache
   $ie = _IECreate($linkCheck)
   WinSetState($linkCheck,'',@SW_HIDE)
   $checkActive = StringSplit(_IEBodyReadText($ie), @LF, $STR_ENTIRESPLIT)[1]
   _IEQuit($ie)

   if $checkActive = 0 Then
	  MsgBox(16,'Error 2 ','Phiên bản đã hết hạn')
	  Exit
   EndIf
EndFunc

Func GetColorPartner()
   $pnPos = MouseGetPos()
   $partnerColor = PixelGetColor($pnPos[0],$pnPos[1])
EndFunc

Func GET_MAC($_MACsIP)
    Local $_MAC,$_MACSize
    Local $_MACi,$_MACs,$_MACr,$_MACiIP
    $_MAC = DllStructCreate("byte[6]")
    $_MACSize = DllStructCreate("int")
    DllStructSetData($_MACSize,1,6)
    $_MACr = DllCall ("Ws2_32.dll", "int", "inet_addr", "str", $_MACsIP)
    $_MACiIP = $_MACr[0]
    $_MACr = DllCall ("iphlpapi.dll", "int", "SendARP", "int", $_MACiIP, "int", 0, "ptr", DllStructGetPtr($_MAC), "ptr", DllStructGetPtr($_MACSize))
    $_MACs  = ""
    For $_MACi = 0 To 5
    If $_MACi Then $_MACs = $_MACs & ":"
        $_MACs = $_MACs & Hex(DllStructGetData($_MAC,1,$_MACi+1),2)
    Next
    DllClose($_MAC)
    DllClose($_MACSize)
    Return $_MACs
 EndFunc

Func _Exit()
   Exit
EndFunc