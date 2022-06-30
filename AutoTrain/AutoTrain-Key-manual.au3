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

while 1

   ;checkLV
   if IsArray(PixelSearch(818, 409,818, 409,0xFADCB0)) then
	  sleep(1000)
	  $i = 0
	  While $i <> 5
		 if IsArray(PixelSearch(311, 377,508, 486,0xEEDA21,10)) then
			ControlClick($hdlNox,'','','left',2,425, 395)
			sleep(2000)
			Beep(1000,1000)
			ExitLoop
		 EndIf
		 $i += 1
	  WEnd

	  ControlClick($hdlNox,'','','left',1,820, 407)			;ready
	  sleep(5000)

   EndIf


   ;continuePT
   if IsArray(PixelSearch(504, 330,504, 330,0xF4B25F)) then
	  ControlClick($hdlNox,'','','left',1,504, 330)
	  sleep(5000)
   EndIf

   ;createPT
   if IsArray(PixelSearch(864, 432,864, 432,0x44332B)) then
	  ControlClick($hdlNox,'','','left',1,864, 432)
	  sleep(500)
	  ControlClick($hdlNox,'','','left',1,459, 405)
	  sleep(1500)
   EndIf

   ;invite
   if IsArray(PixelSearch(690, 161,690, 161,0xC55178)) then

	  if IsArray(PixelSearch(251, 163,647, 406,0xB5CACB)) then
		 ControlClick($hdlNox,'','','left',1,545, 434)
		 sleep(5000)

	  EndIf

   EndIf

   ;endGame
   if IsArray(PixelSearch(717, 433,717, 433,0x223638)) then
	  ControlClick($hdlNox,'','','left',1,692, 467)
	  sleep(4500)
	  ControlClick($hdlNox,'','','left',1,534, 393)
	  sleep(500)
   EndIf

   ;Q
   if IsArray(PixelSearch(598, 326,598, 326,0x59B461)) then
	  ControlClick($hdlNox,'','','left',1,598, 326)
	  sleep(100)
   EndIf

   if IsArray(PixelSearch(547, 304,547, 304,0xF4B25F)) then
	  ControlClick($hdlNox,'','','left',1,547, 304)
	  sleep(100)
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