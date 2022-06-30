#RequireAdmin
#include <Date.au3>
#include <Crypt.au3>
#include <IE.au3>

HotKeySet("{ESC}", "_Exit")

$PCName = "DESKTOP-J2FQ7R3"
$MAC = '00:50:56:C0:00:08'
$curTime = '00:58:51'
$curDate = '7/18/2018'
$linkCheck = 'http://oygtool.freevnn.com/18012019'

if RegRead('HKEY_CURRENT_USER\Software\OYG\AT','AT') == _Crypt_HashData($MAC & @LF & $PCName & @LF & $curTime & @LF & $curDate,$CALG_MD5) and @ComputerName == $PCName and GET_MAC(@IPAddress1) == $MAC Then

Else
   MsgBox(16,'Error 1','Lỗi mất tiêu luôn :(')
   Exit
EndIf

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

   ;outPT
   if IsArray(PixelSearch(747, 431,747, 431,0xFF8436)) Then
	  if IsArray(PixelSearch(41, 355,41, 355,0xFBFAF2)) == 0 Then
		 ControlClick($hdlNox,'','','left',1,33, 75)
		 sleep(500)
		 ControlClick($hdlNox,'','','left',1,547, 312)
		 sleep(1000)
	  EndIf
   EndIf

   ;checkLV
   if IsArray(PixelSearch(818, 409,818, 409,0xFADCB0)) then
	  sleep(1000)
	  $i = 0
	  While $i < 4
		 if IsArray(PixelSearch(428, 246,608, 426,0xF4A123,4)) then
			ControlClick($hdlNox,'','','left',2,425, 395)
			WaitUntil(135, 516,0x4F301F)
			BlockInput(1)
			MouseClickDrag('left',135, 515,684, 515,10)
			sleep(500)
			MouseClickDrag('left',548, 436,143, 262,10)
			sleep(200)
			MouseClickDrag('left',636, 438,445, 268,10)
			BlockInput(0)
			ControlClick($hdlNox,'','','left',1,820, 407)
			ExitLoop
			462, 439  747, 291
		 EndIf
		 $i += 1
	  WEnd

	  ControlClick($hdlNox,'','','left',1,820, 407)			;ready
	  sleep(100)

   EndIf

   ;target
   if IsArray(PixelSearch(619, 527,619, 527,0xFDFFFF)) then
	  ControlClick($hdlNox,'','','left',3,451, 142)
	  sleep(300)
   EndIf

   ;acceptInvite
   if IsArray(PixelSearch(98, 211,98, 211,0x57B25F)) then
	  ControlClick($hdlNox,'','','left',1,98, 211)
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

   sleep(200)

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