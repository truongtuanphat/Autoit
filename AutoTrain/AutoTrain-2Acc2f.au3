#RequireAdmin
#include <Date.au3>
#include <Crypt.au3>
#include <IE.au3>

HotKeySet("{ESC}", "_Exit")

$linkCheck = 'https://oygtool.000webhostapp.com/CUSTOMERS/admin'

$partnerColor = RegRead('HKEY_CURRENT_USER\Software\OYG\AT','PC')

$checkActive = ''
;~ checkActive()

$noxPos = WinGetPos('NoxPlayer-Key')
$noxSize = WinGetClientSize('NoxPlayer-Key')
$hdlNox = WinGetHandle('NoxPlayer-Key')
$noxPos2 = WinGetPos('NoxPlayer-NotKey')
$noxSize2 = WinGetClientSize('NoxPlayer-NotKey')
$hdlNox2 = WinGetHandle('NoxPlayer-NotKey')
If $noxPos[0] <> 0 Or $noxPos[1] <>0 Or $noxSize[0] <> 743 Or $noxSize[1] <> 448 Then
   WinActivate('NoxPlayer-Key')
   BlockInput(1)
   MouseClickDrag('left',$noxPos[0]+20,$noxPos[1]+20,20,20,0)
   MouseClickDrag('left',$noxPos[2]-1,$noxPos[3]-1,745,447,0)
   BlockInput(0)
EndIf
If $noxPos2[0] <> 0 Or $noxPos2[1] <> 444 Or $noxSize2[0] <> 523 Or $noxSize2[1] <> 324 Then
   WinActivate('NoxPlayer-NotKey')
   BlockInput(1)
   MouseClickDrag('left',$noxPos2[0]+20,$noxPos2[1]+20,20,20,0)
   MouseClickDrag('left',$noxPos2[2]-1,$noxPos2[3]-1,521,323,0)
   MouseClickDrag('left',20,20,20,464,0)
   BlockInput(0)
EndIf

while 1

   ;searchEXP
   if IsArray(PixelSearch(617, 363,617, 363,0xF84E21)) Then
	  $i = 0
	  $boss = PixelSearch(7, 86,738, 135,0x3D2413) ;hơn 3/4

	  while $i < 31
		 $exp = PixelSearch(3, 220,739, 347,0xE0CFA3)

		 ;exp
		 if IsArray($exp) Then
			$exp_fight = PixelSearch($exp[0]-10,$exp[1]-30,$exp[0]+10,$exp[1]-120,0xF0F0FD,2)
			if IsArray($exp_fight) Then
			   ControlClick($hdlNox,'','','left',1,$exp_fight[0],$exp_fight[1])
			EndIf
		 EndIf

		 $i += 1
	  WEnd

	  ;boss
	  if IsArray($boss) Then
		 ControlClick($hdlNox,'','','left',1,$boss[0]-65,$boss[1]+6)
		 sleep(100)
	  EndIf

	  ;outPT
	  if IsArray(PixelSearch(666, 176,740, 202,0x5D7D8F)) or IsArray(PixelSearch(562, 300,562, 300,0x13383C)) Then
		 ControlClick($hdlNox,'','','left',1,28, 67)
		 sleep(500)
	  EndIf

	  ;doneBoss
	  if IsArray(PixelSearch(249, 196,517, 345,0xFFF4D3)) and IsArray(PixelSearch(29, 652,29, 652,0x483726)) = 0 Then
		 ControlClick($hdlNox,'','','left',1,28, 67)
		 sleep(500)
	  EndIf

	  ControlClick($hdlNox,'','','left',1,410, 249)

   Else

	  ;checkLv
	  if IsArray(PixelSearch(680, 341,680, 341,0xF7CF9E)) And IsArray(PixelSearch(373, 54,373, 54,0xFFF0C5)) then
		 sleep(1500)
		 $i = 0
		 While $i < 11
			if IsArray(PixelSearch(277, 334,404, 405,0xF2EA31,10)) then
			   ControlClick($hdlNox,'','','left',5,348, 340)
			   WaitUntil(111, 429,0x4A3121)
			   sleep(500)
			   BlockInput(1)
			   MouseClickDrag('left',111, 428,531, 429,10)
			   sleep(500)
			   MouseClickDrag('left',452, 377,194, 193,15)
			   sleep(500)
			   MouseClickDrag('left',524, 368,526, 239,15)
			   sleep(500)
			   BlockInput(0)
			   ExitLoop
			EndIf
			$i += 1
		 WEnd
		 ControlClick($hdlNox,'','','left',2,650, 356)			;ready
		 Sleep(100)

		 $i = 0
		 While $i < 11
			if IsArray(PixelSearch(265, 597,343, 652,0xFBA62F,10)) then
			   ControlClick($hdlNox2,'','','left',4,235, 689 - 444)
			   WaitUntil(79, 754,0x4C3221)
			   sleep(500)
			   BlockInput(1)
			   MouseClickDrag('left',79, 754,383, 757,15)
			   sleep(500)
			   MouseClickDrag('left',266, 720,82, 606,15)
			   sleep(500)
			   MouseClickDrag('left',319, 724,257, 615,15)
			   sleep(500)
			   BlockInput(0)
			   CheckActive()
			   ExitLoop
			EndIf
			$i += 1
		 WEnd
		 ControlClick($hdlNox2,'','','left',2,472, 701 - 444)			;ready
		 sleep(100)

	  EndIf

	  ;target
	  if IsArray(PixelSearch(510, 440,510, 440,0xFFFFFF)) then
		 ControlClick($hdlNox,'','','left',3,368, 125)
		 sleep(300)
	  EndIf

	  ;continuePT
	  if IsArray(PixelSearch(470, 280,470, 280,0xF4B25F)) then
		 ControlClick($hdlNox,'','','left',1,470, 280)
		 sleep(3000)
	  EndIf

	  ;createPT
	  if IsArray(PixelSearch(712, 359,712, 359,0x44332B)) then
		 ControlClick($hdlNox,'','','left',1,712, 359)
		 sleep(500)
	  EndIf
	  if IsArray(PixelSearch(400, 341,400, 341,0xF4B25F)) And IsArray(PixelSearch(558, 332,558, 332,0xF4B25F)) then
		 ControlClick($hdlNox,'','','left',1,400, 341)
		 sleep(500)
	  EndIf
	  if IsArray(PixelSearch(293, 115,293, 115,0xA26950)) then
		 ControlClick($hdlNox,'','','left',1,293, 115)
		 sleep(500)
	  EndIf

	  ;invite
	  if IsArray(PixelSearch(325, 115,325, 115,0xE9C89E)) And IsArray(PixelSearch(555, 333,555, 333,0xF4B25F)) then

		 if IsArray(PixelSearch(207, 139,536, 340,0xB5CACB)) And IsArray(PixelSearch(471, 364,471, 364,0xF4B25F)) then ;mời khi đã chọn được
			ControlClick($hdlNox,'','','left',1,451, 363)
			sleep(1000)
		 Else
			$partnerPos = PixelSearch(207, 139,425, 340,$partnerColor,2)
			if IsArray($partnerPos) then
			   ControlClick($hdlNox,'','','left',1,$partnerPos[0],$partnerPos[1])
			   sleep(100)
			Else
			   while IsArray(PixelSearch(348, 336,348, 336,0xCCB49B)) <> 1 And IsArray(PixelSearch(471, 364,471, 364,0xF4B25F))	;endList
				  BlockInput(1)
				  MouseClickDrag('left',517, 331,518, 123,15)
				  BlockInput(0)
				  sleep(500)
				  $j = 0
				  While $j < 3
					 $partnerPos = PixelSearch(207, 139,425, 340,$partnerColor,2)
					 if IsArray($partnerPos) then
						ControlClick($hdlNox,'','','left',1,$partnerPos[0],$partnerPos[1])
						sleep(100)
						ControlClick($hdlNox,'','','left',1,451, 363)
						sleep(1000)
						ExitLoop
					 EndIf
					 $j += 1
				  WEnd
				  if IsArray(PixelSearch(207, 139,536, 340,0xB5CACB)) = 1 Then	;mời khi đã chọn được
					 ExitLoop
				  EndIf
			   WEnd
			   if IsArray(PixelSearch(251, 163,647, 406,0xB5CACB)) <> 1 and IsArray(PixelSearch(471, 364,471, 364,0xF4B25F)) then
				  ControlClick($hdlNox,'','','left',1,712, 359)
				  WaitUntil(401, 341,0xF4B25F)
				  ControlClick($hdlNox,'','','left',1,401, 341)
				  WaitUntil(305, 115,0xA1694E)
				  ControlClick($hdlNox,'','','left',1,304, 105)
				  WaitUntil(286, 116,0xE9C89E)
			   EndIf
			EndIf
		 EndIf
	  EndIf

	  ;acceptInvite
	  if IsArray(PixelSearch(2, 517,73, 640,0x5BB563)) then
		 $v = PixelSearch(2, 517,73, 640,0x5BB563)
		 if IsArray($v) Then
			ControlClick($hdlNox2,'','','left',1,$v[0], $v[1] - 444)
		 EndIf
	  EndIf

	  ;getDaruma
	  if IsArray(PixelSearch(430, 721,430, 721,0x273C3E)) then
		 ControlClick($hdlNox2,'','','left',2,451, 727 - 444)
		 sleep(500)
		 ControlClick($hdlNox,'','','left',2,614, 394)
		 sleep(500)
	  EndIf

	  ;endGame
	  If IsArray(PixelSearch(308, 684,308, 684,0xD29019)) Then
		 ControlClick($hdlNox2,'','','left',2,308, 683 - 444)
		 sleep(500)
	  EndIf
	  If IsArray(PixelSearch(438, 329,438, 329,0xD29019)) Then
		 ControlClick($hdlNox,'','','left',2,439, 329)
		 sleep(500)
	  EndIf

	  ;outPT
	  if IsArray(PixelSearch(433, 706,433, 706,0xF6671C,10)) and IsArray(PixelSearch(29, 653,29, 653,0x453424,10)) == 0 Then
		 ControlClick($hdlNox2,'','','left',1,18, 500 - 444)
		 sleep(500)
	  EndIf

	  ;OKoutPT
	  if IsArray(PixelSearch(471, 263,471, 263,0xF4B25F)) Then
		 ControlClick($hdlNox,'','','left',1,471, 263)
		 sleep(500)
	  EndIf
	  if IsArray(PixelSearch(328, 638,328, 638,0xF4B25F)) Then
		 ControlClick($hdlNox2,'','','left',1,328, 638 - 444)
		 sleep(500)
	  EndIf

	  ;ErrorInMap
	  if IsArray(PixelSearch(25, 360,25, 360,0x552032)) Then
		 ControlClick($hdlNox,'','','left',1,25, 360)
		 sleep(200)
	  EndIf

	  ;Q
	  if IsArray(PixelSearch(345, 644,345, 644,0x5EB967)) then
		 ControlClick($hdlNox2,'','','left',1,345, 644 - 444)
		 sleep(100)
	  EndIf

	  ;Q
	  if IsArray(PixelSearch(491, 272,491, 272,0x5EB967)) then
		 ControlClick($hdlNox,'','','left',1,491, 272)
		 sleep(100)
	  EndIf

	  sleep(200)

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