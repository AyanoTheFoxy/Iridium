ui = {}

function ui.load()
    --inputs
    mapName = {text = "Untituled"}
    gridInput = {}
    gridInput.size = {text = "32"}
    gridInput.r = {text = "255"}
    gridInput.g = {text = "255"}
    gridInput.b = {text = "255"}
    gridInput.a = {text = "20"}

    -- c
    buttonC = {}
    buttonC.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/C-sheet.png')
    buttonC.x, buttonC.y, buttonC.w, buttonC.h = love.graphics.getWidth() - 64, love.graphics.getHeight() - 64, 64, 64
    buttonC.q = 1
    buttonCQuads = {
        love.graphics.newQuad( 0,
            0,
            64,
            64,
            buttonC.texture
        );
        love.graphics.newQuad( 64,
            0,
            64,
            64,
            buttonC.texture
        )
    }

    -- others buttons
    buttonTheme = {}
    buttonTheme.x, buttonTheme.y, buttonTheme.w, buttonTheme.h = 28, 183, 263, 16
    
    buttonLanguage = {}
    buttonLanguage.x, buttonLanguage.y, buttonLanguage.w, buttonLanguage.h = 28, 201, 236, 16
    
    showTouch = {} 
    showTouch.x, showTouch.y, showTouch.w, showTouch.h = 28, 219, 226, 16
    
    showInfos = {}
    showInfos.x, showInfos.y, showInfos.w, showInfos.h = 28, 168, 0, 16
    
    buttonHelp = {}
    buttonHelp.texture = love.graphics.newImage('Rsrc/Images/ButtonHelp.png')
    buttonHelp.x, buttonHelp.y, buttonHelp.w, buttonHelp.h = 0, love.graphics.getHeight() - 16, 16, 16

--cmds
    suit.theme.color.normal = { bg = { 0; 0; 200 / 255}; fg = { 1; 1; 1}}
    suit.theme.color.hovered = { bg = { 0; 0; 200 / 255}; fg = { 1; 1; 1}}
    suit.theme.color.active = { bg = { 0; 0; 200 / 255}; fg = { 1; 1; 1}}
end

function ui.draw()
    love.graphics.setBackgroundColor( 0, 0, 200 / 255)
    
--buttons
    love.graphics.draw( buttonC.texture, buttonCQuads[buttonC.q], buttonC.x, buttonC.y)
    love.graphics.draw( buttonHelp.texture, buttonHelp.x, buttonHelp.y)

-- to Map
    love.graphics.print( "Version " .. meta.map.version,
        0,
        0,
        nil,
        .5, 
        .5
    )
    love.graphics.print( lang.mapManagerTranslate.toTheMap, 28, 13)
    -- text
    love.graphics.print( lang.mapManagerTranslate.map, 28, 40)
    love.graphics.print( lang.mapManagerTranslate.gradeSize, 28, 58)
    love.graphics.print( "Px", 552 + font:getHeight(gridInput.size.text), 58)
    love.graphics.print( lang.mapManagerTranslate.gradeColor, 28, 76)
    -- RGB
    love.graphics.print( "R:", 28, 94)
    love.graphics.print( " / 255", 556, 94)
    love.graphics.print( "G:", 28, 112)
    love.graphics.print( " / 255", 556, 112)
    love.graphics.print( "B:", 28, 130)
    love.graphics.print( " / 255", 556, 130)
    love.graphics.print( "A:", 28, 148) love.graphics.print( "%", 566, 149)

-- to the editor
    love.graphics.print( lang.mapManagerTranslate.toTheEditor, 28, 173)
    love.graphics.print( lang.mapManagerTranslate.systemTheme, 28, 201)
    love.graphics.print( lang.mapManagerTranslate.language, 28, 219)
    love.graphics.print( lang.mapManagerTranslate.showTouch, 28, 237)
    love.graphics.print( lang.mapManagerTranslate.opitionalInfos, 28, 255)
    love.graphics.print( lang.mapManagerTranslate.grid, 28, 273)
    
-- tips
    if meta.map.grid.color.r ~= nil and meta.map.grid.color.g ~= nil and meta.map.grid.color.b ~= nil and meta.map.grid.color.a ~= nil then
        if meta.map.grid.color.r <= 255 and meta.map.grid.color.g <= 255 and meta.map.grid.color.b <= 255 and meta.map.grid.color.a <= 100 then
            love.graphics.print( lang.mapManagerTranslate.clickOnTheTextsToChange, 28, love.graphics.getHeight() - 32)
        end
    end

    -- errors
    if meta.map.grid.color.r ~= nil and meta.map.grid.color.g ~= nil and meta.map.grid.color.b ~= nil and meta.map.grid.color.a ~= nil then
        if meta.map.grid.color.r > 255 or meta.map.grid.color.g > 255 or meta.map.grid.color.b > 255 or meta.map.grid.color.a > 100 then
            love.graphics.print( lang.errorInfo.value, 28, love.graphics.getHeight() - 32)
        end
    elseif meta.map.grid.color.r == nil or meta.map.grid.color.g == nil or meta.map.grid.color.b == nil or meta.map.grid.color.a == nil or meta.map.grid.size == nil then
        love.graphics.print( lang.errorInfo.nilValue, 28, love.graphics.getHeight() - 32)
    end
    
    --buttons
    suit.Button( editorConf.theme, {id = 1}, 512, 201)
    suit.Button( editorConf.language, {id = 2}, 512, 219)
    suit.Button( editorConf.touchOn, {id = 3}, 512, 237)
    suit.Button( editorConf.infoOn, {id = 4}, 512, 255)
    suit.Button( editorConf.gridOn, {id = 5}, 512, 273)
    
    --inputs
    suit.Input( mapName, 512, 28, 325)
    suit.Input( gridInput.size, 512, 57, 50)
    suit.Input( gridInput.r, 512, 93, 50)
    suit.Input( gridInput.g, 512, 111, 50)
    suit.Input( gridInput.b, 512, 129, 50)
    suit.Input( gridInput.a, 512, 149, 50)
end

function ui.update(dt)
    if love.mouse.isDown(1) then
        if isTouchOnButton( tx, ty, buttonC) then
            --quads
            buttonC.q = 2
            if meta.map.grid.color.r ~= nil and meta.map.grid.color.g ~= nil and meta.map.grid.color.b ~= nil and meta.map.grid.color.a ~= nil and meta.map.grid.size ~= nil then
                 if meta.map.grid.color.r <= 255 and meta.map.grid.color.g <= 255 and meta.map.grid.color.b <= 255 and meta.map.grid.color.a <= 100 then
                --directory
                    love.filesystem.createDirectory( 'Maps/' .. meta.map.id)
                    love.filesystem.createDirectory( 'Maps/' .. meta.map.id .. '/Tiles')
                    
                --archive
                    --map
                    local mapExiste = love.filesystem.getInfo( 'Maps/' .. meta.map.id .. '/map.json')
                    
                    if mapExiste == nil then
                        --if the map not existe he creates a map
                        mapFile = love.filesystem.newFile( 'Maps/' .. meta.map.id .. '/map.json', 'w')
                        mapFile:write(json.encode(meta))
                        mapFile:close()
                    end
                    
                    --conf
                    love.filesystem.write( 'conf.json', json.encode(editorConf)) --save the confs how language
                    
                    states.mapEditor.mapId = meta.map.id
                    
                    buttonHelp.texture:release()
                    buttonC.texture:release()
                    gamestate.switch(states.mapEditor)
                
                    if dt < timeSleep then
                        love.timer.sleep(timeSleep - dt)
                    end
                end
            end
        elseif suit.isActive(1) then
            if editorConf.theme == "Day" then
                editorConf.theme = "Night"
            elseif editorConf.theme == "Night" then
                editorConf.theme = "Carmin"
            elseif editorConf.theme == "Carmin" then
                editorConf.theme = "Currupition"
            elseif editorConf.theme == "Currupition" then
                editorConf.theme = "Platinium" 
            else
                editorConf.theme = "Day"
            end
            
            if dt < timeSleep then
                love.timer.sleep(timeSleep - dt)
            end
        elseif suit.isActive(2) then
            if editorConf.language == "english" then
                editorConf.language = "portugues"
            elseif editorConf.language == "portugues" then
                editorConf.language = "espanol"
            elseif editorConf.language == "espanol" then
                editorConf.language = "francais"
            elseif editorConf.language == "francais" then
                editorConf.language = "deutsch"
            else
                editorConf.language = "english"
            end
            
            if dt < timeSleep then
                love.timer.sleep(timeSleep - dt)
            end
        elseif suit.isActive(3) then
            if editorConf.touchOn == "On" then
                editorConf.touchOn = "Off"
            else
                editorConf.touchOn = "On"
            end
            
            love.timer.sleep(timeSleep)    
        elseif suit.isActive(4) then
            if editorConf.infoOn == "On" then
                editorConf.infoOn = "Off"
            else
                editorConf.infoOn = "On"
            end
            
            if dt < timeSleep then
                love.timer.sleep(timeSleep - dt)
            end
        elseif suit.isActive(5) then
            if editorConf.gridOn == "On" then
                editorConf.gridOn = "Off"
            else
                editorConf.gridOn = "On"
            end
            
            if dt < timeSleep then
                love.timer.sleep(timeSleep - dt)
            end
        elseif isTouchOnButton( tx, ty, buttonHelp) then
            love.system.openURL('https://orangefoxteamoft.github.io/Iridium-Docs/')
        end
    else
        --quads
        buttonC.q = 1
    end
end

return ui