#RequireAdmin
#include <Array.au3>
#include <Misc.au3>


HotKeySet("{ESC}", "_Exit")

;======================================
$delay = 1 ;delay
$keys = "r r left-mouse" ;keys
$continue = 0
;======================================

Opt("SendKeyDelay", $delay)
$array = StringSplit($keys, " ")
$loopFlag = 0
$i = 0

While 1

    If _IsPressed("56") Then
		If $i <= $array[0] Then
			$i += 1
			$key = $array[$i]
			If $key = "left-mouse" Then
			   MouseClick("left",0,0,1,1)
			Else
			   Send($array[$i])
			EndIf
		EndIf

		If $i = $array[0] Then
			$i = 0
		EndIf

		If $continue = 0 Then
			If _IsPressed("56") = 0 Then
				$i = 0
			EndIf
		EndIf
    EndIf
WEnd

Func _Exit()
   Exit
EndFunc
