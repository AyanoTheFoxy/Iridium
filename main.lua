function love.load()
--libs
    json = require 'FoxsToolBox/json'
    gamestate = require 'FoxsToolBox/gamestate'
    suit = require 'FoxsToolBox/suit'
    lip = require 'FoxsToolBox/lip'

--Archives of state
--tables
    states = {}
        states.loadScreen = require 'Src/States/load_screen'
        states.mapManager = require 'Src/States/map_manager'
        states.mapEditor = require 'Src/States/editor_state'

    --Confs of editor
    editorConf = {}
        editorConf.theme = "Day"
        editorConf.language = "english"
        editorConf.touchOn = "On"
        editorConf.infoOn = "On"
        editorConf.gridOn = "On"

-- Vars
    tx, ty = -1, -1
    timeSleep = 1 / 12

--default cmds
    --archive
    confExiste = love.filesystem.getInfo('conf.json')
    
    if confExiste == nil then
        confFile = love.filesystem.newFile( 'conf.json', 'w')
        confFile:write(json.encode(editorConf))
        confFile:close()
    end

    editorConf = json.decode(love.filesystem.read('conf.json'))
    love.filesystem.createDirectory('Maps')

    --font and fiilter
    font = love.graphics.newFont( 'Rsrc/Font/PhoenixBIOS.ttf', 16, 'normal', 2)
    love.graphics.setFont(font)
    love.graphics.setDefaultFilter( 'nearest', 'nearest')

    --gamestate
    gamestate.registerEvents()
    gamestate.switch(states.loadScreen)

end

function love.update(dt)
--touch
    local touch = love.touch.getTouches()

    for i, touches in ipairs(touch) do
        -- take touches on screen and create a list with alls x and y
        tx, ty = love.touch.getPosition(touches)
    end

--languages
    lang = lip.load('Rsrc/Translation/' .. editorConf.language .. '.ini')
end

function isTouchOnButton( touchx, touchy, button)
    local tx, ty = touchx, touchy
    if button.x <= tx and button.x + button.w >= tx and button.y <= ty and button.y + button.h >= ty then
        return true
    else
        return false
    end
end