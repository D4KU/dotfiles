#c::Run calc
#q::Run ubuntu run cd /mnt/d/Documents; . ~/.bashrc; tmux new-session vim
#y::Run ubuntu run cd /mnt/d/Documents; tmux new-session python
#m::Run explorer.exe shell:appsFolder\microsoft.windowscommunicationsapps_8wekyb3d8bbwe!microsoft.windowsl runive.mail
#a::Run ubuntu run tmux new-session vim "/mnt/d/Documents/Scripts/rcfiles/autohotkey/Hotkeys.ahk"
#n::Run evernote
#F1::Run ubuntu run cd /mnt/d; tmux
#F2::Run ubuntu run cd /mnt/d; source ~/.bashrc; tmux new-session ranger
#F3::Run ubuntu run cd /mnt/d; source ~/.bashrc; tmux new-session ranger $(wslpath -u '%clipboard%')
#F4::Run ubuntu run wslpath -u '%clipboard%' | clip.exe
#F5::Run ubuntu run source ~/.bashrc; tmux new-session ranger $(echo '%clipboard%' | sed "0,/./{/./!d}")

#SingleInstance forceA
SetTitleMatchMode, 2

If WinActive("Ubuntu") or WinActive("Xiaomi") or WinActive("bash")
    Capslock::Esc

>!SPACE::Winset, Alwaysontop, , A

#IfWinActive Substance Designer
    ~b & LButton::Send {Space}B{Enter}
    ~c & LButton::Send {Space}C{Enter}
    ~l & LButton::Send {Space}L{Enter}
    ~a & LButton::Send {Space}Au{Enter}
    ~t & LButton::Send {Space}Tr{Enter}
    ~r & LButton::Send {Space}Blu{Enter}
    ~u & LButton::Send {Space}Un{Enter}
    ~o & LButton::Send {Space}Ou{Enter}
    ~n & LButton::Send {Space}No{Enter}
    ~g & LButton::Send {Space}G{Enter}
    ~i & LButton::Send {Space}Invert {Enter}
    ~s & LButton::Send {Space}Switch {Down}{Enter}
    ~p & LButton::Send {Space}Pi{Enter}
    ~m & LButton::Send {Space}M{Enter}
    ~w & LButton::Send {Space}w{Enter}
    ~d & LButton::Send {Space}d{Enter}
    ~h & LButton::Send {Space}hi{Enter}
    ~e & LButton::Send {Space}e{Enter}
    ~1 & LButton::Send {Space}Fl{Enter}
    ~2 & LButton::Send {Space}Fl{Down}{Enter}
    ~3 & LButton::Send {Space}Fl{Down}{Down}{Enter}
    ~4 & LButton::Send {Space}Fl{Down}{Down}{Down}{Enter}
    ~5 & LButton::Send {Space}Fl{Down}{Down}{Down}{Down}{Enter}
    ~6 & LButton::Send {Space}Fl{Down}{Down}{Down}{Down}{Down}{Enter}
    ~7 & LButton::Send {Space}Fl{Down}{Down}{Down}{Down}{Down}{Down}{Enter}
    ~8 & LButton::Send {Space}Fl{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}
    ~F1 & LButton::Send {Space}Get I{Enter}
    ~F2 & LButton::Send {Space}Get I{Down}{Enter}
    ~F3 & LButton::Send {Space}Get I{Down}{Down}{Enter}
    ~F4 & LButton::Send {Space}Get I{Down}{Down}{Down}{Enter}
    ~F5 & LButton::Send {Space}Int{Enter}
    ~F6 & LButton::Send {Space}Int{Down}{Enter}
    ~F7 & LButton::Send {Space}Int{Down}{Down}{Enter}
    ~F8 & LButton::Send {Space}Int{Down}{Down}{Down}{Enter}
    ~= & LButton::Send {Space}Ad{Enter}
    ~- & LButton::Send {Space}Su{Enter}
    ~/ & LButton::Send {Space}Div{Enter}
    ~. & LButton::Send {Space}Sw{Enter}
    ~, & LButton::Send {Space}<{Down}{Enter}
