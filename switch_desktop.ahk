RControl::Send {Volume_Mute}
#1::^#Left 
#2::^#Right 
#t::
  SendInput %A_Hour%:%A_Min%
  return
#IfWinActive ahk_class ConsoleWindowClass
  ^p::send {Up down}
      Sleep 200 
      send {Up up}
  ^n::send {Down down}
      Sleep 200 
      send {Down up}
  ^b::send {Left down}
      Sleep 200 
      send {Left up}
  ^f::send {Right down}
      Sleep 200
      send {Right up}
  ^a::send {Home down}
      Sleep 200
      send {Home up}
  ^e::send {End down}
      Sleep 200
      send {End up}
  ^k::send {Esc down}
      Sleep 200
      send {Esc up}
  ^d::send {Del down}
      Sleep 200
      send {Del up}
  !b::send {LCtrl down}{Left down}{LCtrl up}{Left up}
  !f::send {LCtrl down}{Right down}{LCtrl up}{Right up}
#IfWinActive
;WinGetClass, class, A
;MsgBox, The active window's class is "%class%".


