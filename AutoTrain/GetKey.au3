#include <Date.au3>
#include <Crypt.au3>

RegWrite('HKEY_CURRENT_USER\Software\OYG\AT','AT','REG_MULTI_SZ',_Crypt_HashData(GET_MAC(@IPAddress1) & @LF & @ComputerName & @LF & _NowTime(5) & @LF & _DateTimeFormat(_NowCalc(), 2),$CALG_MD5))

$sec = _NowTime(5)
MsgBox(0,'',StringSplit($sec, ':', $STR_ENTIRESPLIT)[3])

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