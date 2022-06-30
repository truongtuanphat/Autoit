HotKeySet("{ESC}", "_Exit")

while 1

   ;Q
   $pxs = PixelSearch(0, 0,1920, 1080,0x59B461)
   if IsArray($pxs) then
	  MouseClick('left',$pxs[0],$pxs[1],1,1)
	  sleep(500)
   EndIf
   sleep(2000)

WEnd

Func _Exit()
   Exit
EndFunc