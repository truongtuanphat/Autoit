#RequireAdmin

Global $Paused
HotKeySet("{F5}", "Pause")
HotKeySet("{ESC}", "_Exit")

WinActivate('NoxPlayer')
$noxPos = WinGetPos('NoxPlayer')
$hdlNox = WinGetHandle('NoxPlayer')
BlockInput(1)
MouseClickDrag('left',$noxPos[0]+20,$noxPos[1]+20,20,20,0)
MouseClickDrag('left',$noxPos[2]-1,$noxPos[3]-1,900,536,0)
BlockInput(0)

$countWin = 0
$enterFight = 0

while 1

   ;done
   if $enterFight == 2 Then
	  MsgBox(0,'Done','Hết vé')
	  Exit
   EndIf

   if IsArray(PixelSearch(862, 173,862, 173,0x8D501E)) Then
	  $i = 0
	  while $i < 4

		 ;3win
		 if $countWin >= 3 Then
			if IsArray(PixelSearch(778, 410,778, 410,0xF4B25F)) then
			   $countWin = 0
			   ControlClick($hdlNox,'','','left',1,738, 413)
			   sleep(500)
			   ControlClick($hdlNox,'','','left',1,533, 332)
			   sleep(200)
			EndIf
		 EndIf

		 ;1-1
		 if IsArray(PixelSearch(261, 160,261, 160,0xA09B94)) and IsArray(PixelSearch(315, 105,315, 105,0xC9B8A0)) then
			   ControlClick($hdlNox,'','','left',1,261, 159)
			   sleep(500)
			   ControlClick($hdlNox,'','','left',1,261, 262)
			   ExitLoop
			   sleep(1000)
		 EndIf

		 ;1-2
		 if IsArray(PixelSearch(501, 159,501, 159,0x9B968F)) and IsArray(PixelSearch(557, 104,557, 104,0xC8B79E)) then
			ControlClick($hdlNox,'','','left',1,501, 160)
			sleep(500)
			ControlClick($hdlNox,'','','left',1,503, 261)
			ExitLoop
			sleep(1000)
		 EndIf

		 ;1-3
		 if IsArray(PixelSearch(743, 159,743, 159,0x827D76)) and IsArray(PixelSearch(798, 103,798, 103,0xC6B59D)) then
			ControlClick($hdlNox,'','','left',1,743, 159)
			sleep(500)
			ControlClick($hdlNox,'','','left',1,742, 261)
			ExitLoop
			sleep(1000)
		 EndIf

		 ;2-1
		 if IsArray(PixelSearch(261, 254,261, 254,0x827C75)) and IsArray(PixelSearch(316, 200,316, 200,0xC8B79F)) then
			ControlClick($hdlNox,'','','left',1,261, 254)
			sleep(500)
			ControlClick($hdlNox,'','','left',1,266, 357)
			ExitLoop
			sleep(1000)
		 EndIf

		 ;2-2
		 if IsArray(PixelSearch(502, 253,502, 253,0x827D76)) and IsArray(PixelSearch(558, 200,558, 200,0xC8B79E)) then
			ControlClick($hdlNox,'','','left',1,502, 255)
			sleep(500)
			ControlClick($hdlNox,'','','left',1,502, 367)
			ExitLoop
			sleep(1000)
		 EndIf

		 ;2-3
		 if IsArray(PixelSearch(743, 255,743, 255,0x9E9992)) and IsArray(PixelSearch(800, 199,800, 199,0xC6B59D)) then
			ControlClick($hdlNox,'','','left',1,743, 255)
			sleep(500)
			ControlClick($hdlNox,'','','left',1,744, 357)
			ExitLoop
			sleep(1000)
		 EndIf

		 ;3-1
		 if IsArray(PixelSearch(261, 348,261, 348,0x8C8780)) and IsArray(PixelSearch(319, 292,319, 292,0xC4B39A)) then
			ControlClick($hdlNox,'','','left',1,261, 348)
			sleep(500)
			ControlClick($hdlNox,'','','left',1,262, 456)
			ExitLoop
			sleep(1000)
		 EndIf

		 ;3-2
		 if IsArray(PixelSearch(501, 349,501, 349,0x928D86)) and IsArray(PixelSearch(559, 294,559, 294,0xC6B59D)) then
			ControlClick($hdlNox,'','','left',1,501, 349)
			sleep(500)
			ControlClick($hdlNox,'','','left',1,504, 457)
			ExitLoop
			sleep(1000)
		 EndIf

		 ;3-3
		 if IsArray(PixelSearch(743, 349,743, 349,0x7F7A73)) and IsArray(PixelSearch(801, 293,801, 293,0xC4B39B)) then
			ControlClick($hdlNox,'','','left',1,743, 349)
			sleep(500)
			ControlClick($hdlNox,'','','left',1,745, 460)
			ExitLoop
			sleep(1000)
		 EndIf

		 $i += 1
	  WEnd

	  ;refresh
	  if IsArray(PixelSearch(691, 409,691, 409,0xF4B25F)) then
		 ControlClick($hdlNox,'','','left',1,738, 413)
		 sleep(1000)
		 ControlClick($hdlNox,'','','left',1,533, 332)
		 $countWin = 0
		 sleep(200)
	  EndIf

   EndIf

   ;countWin
   if IsArray(PixelSearch(600, 166,600, 166,0xFCE7B3)) Then
	  $countWin += 1
	  ControlClick($hdlNox,'','','left',1,532, 392)
	  sleep(1500)
	  ControlClick($hdlNox,'','','left',1,532, 392)
	  sleep(1000)
   EndIf

   ;get369
   if IsArray(PixelSearch(531, 393,531, 393,0xD29019,10)) then
	  ControlClick($hdlNox,'','','left',3,663, 469)
	  sleep(200)
   EndIf

   ;ready
   if IsArray(PixelSearch(822, 409,822, 409,0xEFA960)) then
	  ControlClick($hdlNox,'','','left',1,822, 409)
	  sleep(5000)
   EndIf

   ;lose
   if IsArray(PixelSearch(654, 158,654, 158,0xE7E3D7)) then
	  ControlClick($hdlNox,'','','left',1,839, 443)
	  sleep(1500)
   EndIf

   ;Q
   if IsArray(PixelSearch(598, 326,598, 326,0x59B461)) then
	  ControlClick($hdlNox,'','','left',1,598, 326)
	  sleep(100)
   EndIf

   ;errorBoard
   if IsArray(PixelSearch(882, 272,882, 272,0x27190F)) then
	  ControlClick($hdlNox,'','','left',1,882, 272)
	  $enterFight += 1
	  sleep(200)
   EndIf

   sleep(200)

WEnd

Func Pause()
   $Paused = NOT $Paused
   While $Paused
	  sleep(100)
   WEnd
EndFunc

Func _Exit()
   Exit
EndFunc