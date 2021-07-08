#RequireAdmin
HotKeySet("{ESC}", "_Exit")
$launcher = "launcher.exe"
$path = "D:\Genshin Impact\"&$launcher

While 1
   If ProcessExists($launcher) == 0 Then
	  Run($path)
   EndIf
   Sleep(5000)
WEnd

Func _Exit()
   Exit
EndFunc