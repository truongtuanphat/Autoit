#comments-start

   Error 1: Sai MAC, tên PC, ngày, giờ
   Error 2: Hết hạn lúc khởi động
   Error 3: Hết hạn lúc đang chạy
   Error 4: Chọn màu partner

#comments-end

#include <Date.au3>
#include <Crypt.au3>
#include <IE.au3>

HotKeySet("{ESC}", "_Exit")

$PCName = "ADMIN"
$MAC = '34:17:EB:7D:11:10'
$curTime = '16:18:01'
$curDate = '7/19/2018'
$linkCheck = 'http://oygtool.freevnn.com/19092018'

;~ if RegRead('HKEY_CURRENT_USER\Software\OYG\AT','AT') == _Crypt_HashData($MAC & @LF & $PCName & @LF & $curTime & @LF & $curDate,$CALG_MD5) and @ComputerName == $PCName and GET_MAC(@IPAddress1) == $MAC Then

;~ Else
;~    MsgBox(16,'Error 1','Lỗi mất tiêu luôn :(')
;~    Exit
;~ EndIf

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
	  if IsArray(PixelSearch(832, 218,896, 227,0x5D7E91)) Then
		 ControlClick($hdlNox,'','','left',1,33, 75)
		 sleep(500)
		 ControlClick($hdlNox,'','','left',1,547, 312)
		 sleep(1000)
	  EndIf

	  ;doneBoss
	  if IsArray(PixelSearch(346, 232,574, 365,0xFFF4D3)) Then
		 ControlClick($hdlNox,'','','left',1,33, 75)
		 sleep(500)
		 ControlClick($hdlNox,'','','left',1,547, 312)
		 sleep(1000)
	  EndIf

	  ControlClick($hdlNox,'','','left',1,505, 300)

   Else

	  ;checkLV
	  if IsArray(PixelSearch(818, 409,818, 409,0xFADCB0)) then
		 sleep(1500)
		 $i = 0
		 While $i < 11
			if IsArray(PixelSearch(577, 358,477, 245,0xF4A123,4)) then
			   ControlClick($hdlNox,'','','left',5,425, 395)
			   Do
				  sleep(100)
			   Until IsArray(PixelSearch(135, 516,135, 516,0x4F301F))
			   BlockInput(1)
			   MouseClickDrag('left',135, 515,684, 515,10)
			   sleep(200)
			   MouseClickDrag('left',548, 436,149, 262,10)
			   sleep(200)
			   MouseClickDrag('left',636, 438,448, 272,10)
			   sleep(200)
			   ControlClick($hdlNox,'','','left',1,820, 407)
			   BlockInput(0)
			   CheckActive()
			   ExitLoop
			EndIf
			$i += 1
		 WEnd

		 ControlClick($hdlNox,'','','left',1,820, 407)			;ready

	  EndIf

	  ;createPT
	  if IsArray(PixelSearch(864, 432,864, 432,0x44332B)) then
		 sleep(1000)
		 if IsArray(PixelSearch(864, 432,864, 432,0x44332B)) then
			ControlClick($hdlNox,'','','left',1,864, 432)
		 EndIf
	  EndIf

	  ;start
	  if IsArray(PixelSearch(664, 398,664, 398,0xF4B25F)) then
		 ControlClick($hdlNox,'','','left',1,333, 191)
		 sleep(500)
		 ControlClick($hdlNox,'','','left',1,666, 407)
	  EndIf

	  ;endGame
	  if IsArray(PixelSearch(752, 432,752, 432,0x284042)) or IsArray(PixelSearch(533, 392,533, 392,0xD19118)) then
		 ControlClick($hdlNox,'','','left',1,752, 432)
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

Func WaitUntil($x,$y,$color)
   Do
	  sleep(100)
   Until IsArray(PixelSearch($x,$y,$x,$y,$color)) = 1
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