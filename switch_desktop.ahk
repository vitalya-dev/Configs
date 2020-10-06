SetTitleMatchMode, 3

#IfWinActive ahk_class TTOTAL_CMD
  ^p::send {Up down}
      Sleep 200 
      send {Up up}
      return
  ^n::send {Down down}
      Sleep 200 
      send {Down up}
      return          
#IfWinActive

RControl::
  Send {Volume_Mute}
  return
Lwin & q::^#Left 
Lwin & e::^#Right
Lwin & w::Return
NumpadClear::Send !{F4}
    return
LWin & t::
  SendInput %A_Hour%:%A_Min%
  return

#IfWinActive C:\Windows\System32\cmd.exe
  ^p::send {Up down}
      Sleep 200 
      send {Up up}
      return
  ^n::send {Down down}
      Sleep 200 
      send {Down up}
      return
  ^b::send {Left down}
      Sleep 200 
      send {Left up}
      return
  ^f::send {Right down}
      Sleep 200
      send {Right up}
      return
  ^a::send {Home down}
      Sleep 200
      send {Home up}
      return
  ^e::send {End down}
      Sleep 200
      send {End up}
      return
  ^k::send {Esc down}
      Sleep 200
      send {Esc up}
  ^d::send {Del down}
      Sleep 200
      send {Del up}
  MButton::Enter

#IfWinActive





