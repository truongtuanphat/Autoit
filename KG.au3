HotKeySet("{ESC}", "_Exit")

WinActivate('Bộ giả lập android Nox')
WinActivate('NoxPlayer')
$noxPos = WinGetPos('NoxPlayer')
;$noxPos = WinGetPos('Bộ giả lập android Nox')
MouseClickDrag('left',$noxPos[0]+20,$noxPos[1]+20,20,20,1)
MouseClickDrag('left',$noxPos[2]-1,$noxPos[3]-1,900,536,1)

while 1

   $send = PixelSearch(440, 128,490, 184,0x111109)
   if IsArray($send) then
	  MouseClick('left',$send[0],$send[1],1)
	  sleep(1000)
   EndIf

   if IsArray(PixelSearch(547, 525,547, 525,0x4C3423)) then
	  MouseClickDrag('left',724, 437,816, 93)
	  sleep(800)
	  MouseClick('left',518, 412,1,1)
	  sleep(1000)
	  Exit
   EndIf

   sleep(1000)

WEnd

Func _Exit()
   Exit
EndFunc