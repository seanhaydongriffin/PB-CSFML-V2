
XIncludeFile "CSFML.pbi"


;  OpenLibrary(2, "csfml-system-2.dll")

;  PrototypeC.l ProtosfClock_create()
;  Global sfClock_create.ProtosfClock_create = GetFunction(2, "sfClock_create")
;  PrototypeC.l ProtosfClock_getElapsedTime(*clock)
;  Global sfClock_getElapsedTime.ProtosfClock_getElapsedTime = GetFunction(2, "sfClock_getElapsedTime")


OpenConsole()

_CSFML_Startup()

event.sfEvent
event\type = 999

black.sfColor
black\r = 0
black\g = 0
black\b = 0
black\a = 255

white.sfColor
white\r = 0
white\g = 100
white\b = 0
white\a = 255

mode.sfVideoMode
mode\width2 = 800
mode\height2 = 600
mode\bitsPerPixel2 = 16

sprite_pos.sfVector2f
sprite_pos\x = 100
sprite_pos\y = 100

window.l = _CSFML_sfRenderWindow_create(mode, "fgh", 6, #Null)
;Debug (fred)
joe.l = _CSFML_sfRenderWindow_getSystemHandle(window)

_CSFML_sfRenderWindow_setVerticalSyncEnabled(window, 1)

texture.l = _CSFML_sfTexture_createFromFile("crate.gif", #Null)
sprite.l = _CSFML_sfSprite_create()
_CSFML_sfSprite_setTexture(sprite, texture, 1)

While (_CSFML_sfRenderWindow_isOpen(window))

  While (_CSFML_sfRenderWindow_pollEvent(window, event))

;Debug event\type
    
    If event\type = #sfEvtClosed
      
      _CSFML_sfRenderWindow_close(window)
    
    EndIf
    
  Wend
  
;  _CSFML_sfRenderWindow_clear(window, white)
  _CSFML_sfRenderWindow_clear_rgba(window, 255, 255, 255, 255)
  
  _CSFML_sfSprite_setPosition(sprite, sprite_pos)
  
  _CSFML_sfRenderWindow_drawSprite(window, sprite, #Null)
  
  _CSFML_sfRenderWindow_display(window)
  
Wend

;fred.l = _CSFML_sfClock_create()

;Input()

;dur.l = _CSFML_sfClock_getElapsedTime(fred)

;Debug dur
;fred.l = _CSFML_sfClock_create()


_CSFML_sfRenderWindow_destroy(window)

_CSFML_Shutdown()


; IDE Options = PureBasic 5.40 LTS (Windows - x86)
; CursorPosition = 67
; FirstLine = 51
; EnableUnicode
; EnableXP
; Executable = ..\Box2C_hello2D\Box2C_hello2D.exe