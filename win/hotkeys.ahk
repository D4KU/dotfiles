#SingleInstance forceA
SetTitleMatchMode, 2

#c::Run calc
#n::Run evernote
#q::Run wt -p "Vim"
#y::Run wt -p "Python"
#F2::Run wt -p "Ranger"
#F3::Run ubuntu run . ~/.profile; tmux new-session ranger $(wslpath -u '%clipboard%')
#F4::Run ubuntu run wslpath -u '%clipboard%' | clip.exe
#F5::Run ubuntu run . ~/.profile; tmux new-session ranger $(echo '%clipboard%' | sed "0,/./{/./!d}")
>!SPACE::Winset, Alwaysontop, , A

; Capslock = Ctrl when pressed with another key and Esc when not
; Press Shift + Capslock to have the original functionality
#InstallKeybdHook
SetCapsLockState, alwaysoff
Capslock::
    Send {LControl Down}
    KeyWait, CapsLock
    Send {LControl Up}
    if (A_PriorKey = "CapsLock")
    {
        Send {Esc}
    }
    return
