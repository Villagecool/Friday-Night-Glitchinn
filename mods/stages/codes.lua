function onCreate()
     makeLuaSprite('screen', 'codeBG', 0, 0)
     scaleObject('screen', 1, 1)
     setObjectCamera('screen', 'other')
     addLuaSprite('screen')
     
     makeLuaText('st_shadow', 'ENTER CODE', nil, 503, 203)
     setTextFont('st_shadow', 'sonic-cd-menu-font.ttf')
     setTextColor('st_shadow', '000000')
     setTextBorder('st_shadow', 0)
     setTextSize('st_shadow', 30)
     setObjectCamera('st_shadow', 'other')
     addLuaText('st_shadow')

     makeLuaText('back', 'Press ESC or backspace to leave', nil, 53, 53)
     setTextFont('back', 'sonic-cd-menu-font.ttf')
     setTextColor('back', '696969')
     setTextBorder('back', 0)
     setTextSize('back', 20)
     setObjectCamera('back', 'other')
     addLuaText('back')

     close(true)
end