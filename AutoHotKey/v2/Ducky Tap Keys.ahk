; I wish ducky keyboards had tap keys!

RShift Up::
{
    if (A_PriorKey = "RShift") ;  If RShift was pressed alone
        Send("{Up}") ; up arrow
}
RAlt::Send("{LEFT}")
^+RAlt::Send("{Ctrl Shift Left}")
^+RCtrl::Send("{Ctrl Shift Right}")
RCtrl::Send("{RIGHT}")
RWin::Send("{DOWN}")

>+Del::Send("{Shift Down}{Del}{Shift Up}") ; >+ means RShift
