function love.conf(t)
--screen
    --window screen
    t.window.fullscreen =      true

    --app aparence
    t.window.title      =      "Iridium"
    t.author            =      "AyanoTheFox and StrawberryChoolate"
    t.window.icon       =      "Rsrc/Images/IridiumIcon.png"
    t.version           =      "11.4"

-- directory
    t.externalstorage   =      true
    t.identity          =      "MapEditor"

--modules
    --audio and video
    t.modules.audio     =      false
    t.modules.sound     =      false
    t.modules.video     =      false

    --others
    t.modules.math      =      false
    t.modules.data      =      false
    t.modules.joystick  =      false
    t.modules.physics   =      false
    t.modules.thread    =      false
end