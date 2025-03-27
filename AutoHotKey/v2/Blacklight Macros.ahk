; Macros that speed up my shenanigan game

Persistent
#HotIf WinActive("Blacklight: Retribution (32-bit, DX11)", )

$3:: 
{
    Send(33) ; The usual stuff from v1
    Return
}

$4:: 
{
    Send(244) ; Switch to secondary before switching to slot 4, which should be the exploding tomahawk
    Return
}

$5::
{
    Send(55) ; The usual stuff from v1
    Return
}

$6::
{
    Send(66) ; The usual stuff from v1
    Return
}

; I don't have a numpad, these keys are on my mouse >:)

Numpad3::
{
    Send(244)
    ; Send(233)
    Return
}

Numpad6::
{
    Send(2)
    Return
}

Numpad5:: ; Fastest throw and detonation in the west
{
    ; Send(233)
    Send(244)
    Sleep(540)
    Click
    send(1)
    Return
}

$x:: ; The most optimal self-healing macro
{
    Send("c")
    Sleep(850)
    Click("Right")
    Send(1)
    Return
}

up::
{
    Click
    Return
}