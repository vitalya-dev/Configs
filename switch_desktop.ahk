#1::send {LWin down}{LCtrl down}{Left}{LCtrl up}{LWin up}
#2::send {LWin down}{LCtrl down}{Right}{LCtrl up}{LWin up}
#IfWinActive ahk_class ConsoleWindowClass
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