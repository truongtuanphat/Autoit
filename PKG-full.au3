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
   if $enterFight == 10 Then
	  MsgBox(0,'Done','Hết vé')
	  Exit
   EndIf

   if IsArray(PixelSearch(862, 173,862, 173,0x8D501E,10)) Then
	  $i = 0
	  while $i < 4

		 ;1-1
		 if IsArray(PixelSearch(316, 105,316, 105,0xC8B79F)) then
			   ControlClick($hdlNox,'','','left',1,261, 159)
			   sleep(500)
			   ControlClick($hdlNox,'','','left',1,261, 262)
			   ExitLoop
			   sleep(1000)
		 EndIf

		 ;1-2
		 if IsArray(PixelSearch(557, 105,557, 105,0xC8B79E)) then
			ControlClick($hdlNox,'','','left',1,501, 160)
			sleep(500)
			ControlClick($hdlNox,'','','left',1,503, 261)
			ExitLoop
			sleep(1000)
		 EndIf

		 ;1-3
		 if IsArray(PixelSearch(799, 103,799, 103,0xC5B49C)) then
			ControlClick($hdlNox,'','','left',1,743, 159)
			sleep(500)
			ControlClick($hdlNox,'','','left',1,742, 261)
			ExitLoop
			sleep(1000)
		 EndIf

		 ;2-1
		 if IsArray(PixelSearch(317, 199,317, 199,0xC7B69E)) then
			ControlClick($hdlNox,'','','left',1,261, 254)
			sleep(500)
			ControlClick($hdlNox,'','','left',1,266, 357)
			ExitLoop
			sleep(1000)
		 EndIf

		 ;2-2
		 if IsArray(PixelSearch(558, 198,558, 198,0xC6B59C)) then
			ControlClick($hdlNox,'','','left',1,502, 255)
			sleep(500)
			ControlClick($hdlNox,'','','left',1,502, 367)
			ExitLoop
			sleep(1000)
		 EndIf

		 ;2-3
		 if IsArray(PixelSearch(799, 199,799, 199,0xC7B69D)) then
			ControlClick($hdlNox,'','','left',1,743, 255)
			sleep(500)
			ControlClick($hdlNox,'','','left',1,744, 357)
			ExitLoop
			sleep(1000)
		 EndIf

		 ;3-1
		 if IsArray(PixelSearch(317, 294,317, 294,0xC7B69E)) then
			ControlClick($hdlNox,'','','left',1,261, 348)
			sleep(500)
			ControlClick($hdlNox,'','','left',1,262, 456)
			ExitLoop
			sleep(1000)
		 EndIf

		 ;3-2
		 if IsArray(PixelSearch(558, 295,558, 295,0xC7B69D)) then
			ControlClick($hdlNox,'','','left',1,501, 349)
			sleep(500)
			ControlClick($hdlNox,'','','left',1,504, 457)
			ExitLoop
			sleep(1000)
		 EndIf

		 ;3-3
		 if IsArray(PixelSearch(798, 293,798, 293,0xC7B69D)) then
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