#include <HTTP.au3>

Global $Runner

HotKeySet("{END}", "stop")

While 1
	start ()
    Sleep(1*60000)
WEnd

Func stop()
    Exit
EndFunc

Func restartSW()
	ProcessClose('RobloxPlayerBeta.exe')
	ProcessClose('ScriptWare.exe')
      sleep(2*1000)
	ShellExecute('C:\Users\put the name of your computor here\Desktop\ScriptWare\ScriptWare.exe',"",'C:\Users\put the name of your computor here\Desktop\ScriptWare')
EndFunc


Func start()

If IsPlayingGame() Then
	return
EndIf

	restartSW()
	$Runner = Not $Runner

	Local $privateServer = "your private server link"

      sleep(11*1000)

	ShellExecute($privateServer)

	sleep(4*1000)


	WinActivate("ScriptWare","")
	sleep(2*1000)
	ControlClick("ScriptWare","","[NAME:ExecutorStrip]", "Left",1,33,12)
	sleep(10*1000)
	ControlClick("ScriptWare","","[NAME:ExecutorStrip]", "Left",1,33,12)

	WinActivate("Roblox")
EndFunc


Func IsPlayingGame()
        $sUserID = "your roblox user id"
        $sEndpoint = "https://www.roblox.com/users/profile/profileheader-json?userId=" & $sUserID
        $oHTTP = _HTTP_Get($sEndpoint)
		ConsoleWrite("resp: " & $oHTTP & @CRLF)

        If @error Then
            MsgBox(0, "error", @error)
            Return False
        Else

			If StringInStr($oHTTP, '"LastLocation":""') Then
				return True
    		EndIf

			return False
		EndIf

EndFunc
