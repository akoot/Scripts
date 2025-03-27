; Some spy macros to make spying on people more.. efficient

Numpad3:: ; Quick disguise as a random enemy class
{
    if WinActive("ahk_class Valve001") ; Make sure the game window is active
    {
        Send("4")
        Sleep(100)

        ; Randomly select class 9, 8, 7, or 6 (no fat classes)
        randNum := Random(6, 9)
        Send(randNum)
        if(randNum != 8) {
            Sleep(2000)
            if(randNum = 7) {
                Send("2") ; If we disguise as Medic, take out the medigun otherwise the syringe gun will make it obvious you're a spy!
            } else {
                Send("3") ; Ameteurs don't even know you can switch weapons as spy, so switching to melee is usually a win
            }
            Sleep(100)
            Send("b") ; Re-disguide
            if(randNum = 7) {
                Sleep(100)
                Send("3") ; Get our knife back if we have a fake medigun
            }
        }
    }
    Return
}

Numpad6:: ; Quick disguise as an enemy spy
{
    if WinActive("ahk_class Valve001")
    {
        Send("4")
        Sleep(100) 
        Send("9") 
        Sleep(2000) 
        Send("b") 
    }
    Return
}


Numpad2:: ; Quick disguise as a teammate.
{
    if WinActive("ahk_class Valve001") 
    {
        Send("4") 
        Sleep(100) 
        Send("r") 
        Sleep(100) 
        
        ; Same as Numpad3 but we don't care about how authentic the disguise is because you will get shot at regardless
        randNum := Random(6, 9)
        if(randNum = 9) {
            randNum := 1
        }
        Send(randNum)
    }
    Return
}
