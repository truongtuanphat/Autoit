Global $Paused
HotKeySet("{F5}", "Pause")
HotKeySet("{ESC}", "_Exit")

WinActivate('NoxPlayer')
$noxPos = WinGetPos('NoxPlayer')
$hdlNox = WinGetHandle('NoxPlayer')
MouseClickDrag('left',$noxPos[0]+20,$noxPos[1]+20,20,20,0)
MouseClickDrag('left',$noxPos[2]-1,$noxPos[3]-1,900,536,0)

while 1

   if IsArray(PixelSearch(250, 423,250, 423,0x955322)) then
	  ;2
	  if IsArray(PixelSearch(357, 236,357, 236,0x827E74)) then
		 if IsArray(PixelSearch(304, 238,304, 238,0x6A665D)) then
			ControlClick($hdlNox,'','','left',1,745, 253)
			;MouseMove(745, 253)
		 EndIf
	  EndIf
	  ;1
	  if IsArray(PixelSearch(358, 164, 358, 164,0xEAE4D0)) then
		 if IsArray(PixelSearch(304, 166, 304, 166,0x3B3833)) then
			ControlClick($hdlNox,'','','left',1,742, 184)
			;MouseMove(742, 184)
		 EndIf
	  EndIf
	  ;3
	  if IsArray(PixelSearch(358, 307,358, 307,0xA8A496)) then
		 if IsArray(PixelSearch(304, 309, 304, 309,0x413E38)) then
			ControlClick($hdlNox,'','','left',1,743, 326)
			;MouseMove(743, 326)
		 EndIf
	  EndIf

	  ;refresh
	  ControlClick($hdlNox,'','','left',1,348, 473)

   EndIf

   ;wrongRoom
   ;if IsArray(PixelSearch(733, 462,733, 462,0xC6BDB5)) then
	;  sleep(4000)
	;  ControlClick($hdlNox,'','','left',1,164, 441)
	;  sleep(500)
	;  ControlClick($hdlNox,'','','left',1,536, 332)
	;  sleep(100)
   ;EndIf

   ;pt
   if IsArray(PixelSearch(177, 463,177, 463,0xE6E6E6)) then
	  sleep(800)
	  ControlClick($hdlNox,'','','left',1,177, 463)
	  sleep(1000)
	  ControlClick($hdlNox,'','','left',1,249, 422)
	  sleep(50)
   EndIf

   ;endGame
   if IsArray(PixelSearch(668, 418,668, 418,0x261E09)) then
	  ControlClick($hdlNox,'','','left',1,692, 467)
	  sleep(4500)
	  if IsArray(PixelSearch(319, 187,319, 187,0x71641B)) then
		 ControlClick($hdlNox,'','','left',1,534, 393)
	  Else
		 MsgBox('','','Đủ 40 mảnh')
		 Exit
	  EndIf
	  sleep(500)
   EndIf

   ;lose
   if IsArray(PixelSearch(654, 120,654, 120,0xE2DED2)) Then
	  ControlClick($hdlNox,'','','left',1,692, 467)
	  sleep(500)
   EndIf

   ;ss
   if IsArray(PixelSearch(820, 407,820, 407,0xFEF1D0)) then
	  ControlClick($hdlNox,'','','left',1,820, 407)
	  sleep(500)
   EndIf

   ;key
   if IsArray(PixelSearch(734, 444,734, 444,0xF4B25F)) then
	  ControlClick($hdlNox,'','','left',1,734, 444)
	  sleep(200)
   EndIf

   ;Q
   if IsArray(PixelSearch(598, 326,598, 326,0x59B461)) then
	  ControlClick($hdlNox,'','','left',1,598, 326)
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