ui = {}

function ui:load()
--tables
    --trash
    trash = {}
    
    --arrows
    buttonUp = {}
    buttonUp.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/Arrows/Up-sheet.png')
    buttonUp.x, buttonUp.y, buttonUp.w, buttonUp.h = 64, love.graphics.getHeight() - 128, 64, 64
    buttonUp.quad = 1
    buttonUpQuads = {
        love.graphics.newQuad( 0,
            0,
            64,
            64,
            buttonUp.texture
        );
        love.graphics.newQuad( 64,
            0,
            64,
            64,
            buttonUp.texture
        )
    }

    buttonDown = {}
    buttonDown.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/Arrows/Down-sheet.png')
    buttonDown.x, buttonDown.y, buttonDown.w, buttonDown.h = 64, love.graphics.getHeight() - 64, 64, 64
    buttonDown.quad = 1
    buttonDownQuads = {
        love.graphics.newQuad( 0,
            0,
            64,
            64,
            buttonDown.texture
        );
        love.graphics.newQuad( 64,
            0,
            64,
            64,
            buttonDown.texture
        )
    }

    buttonLeft = {}
    buttonLeft.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/Arrows/Left-sheet.png')
    buttonLeft.x, buttonLeft.y, buttonLeft.w, buttonLeft.h = 0, love.graphics.getHeight() - 64, 64, 64
    buttonLeft.quad = 1
    buttonLeftQuads = {
        love.graphics.newQuad( 0,
            0,
            64,
            64,
            buttonLeft.texture
        );
        love.graphics.newQuad( 64,
            0,
            64,
            64,
            buttonLeft.texture
        )
    }
    
    buttonRight = {}
    buttonRight.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme ..'/Arrows/Right-sheet.png')
    buttonRight.x, buttonRight.y, buttonRight.w, buttonRight.h = 128, love.graphics.getHeight() - 64, 64, 64
    buttonRight.quad = 1
    buttonRightQuads = {
        love.graphics.newQuad( 0,
            0,
            64,
            64,
            buttonRight.texture
        );
        love.graphics.newQuad( 64,
            0,
            64,
            64,
            buttonRight.texture
        )
    }

--keyboard 
    --change blocks buttons
    buttonB = {}
    buttonB.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/B-sheet.png')
    buttonB.x, buttonB.y, buttonB.w, buttonB.h = 48, 0, 48, 48
    buttonB.quad = 1
    buttonBQuads = {
        love.graphics.newQuad( 0,
            0,
            64,
            64,
            buttonB.texture
        );
        love.graphics.newQuad( 64,
            0,
            64,
            64,
            buttonB.texture
        )
    }

    buttonN = {}
    buttonN.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/N-sheet.png')
    buttonN.x, buttonN.y, buttonN.w, buttonN.h = 96, 0, 48, 48
    buttonN.quad = 1
    buttonNQuads = {
        love.graphics.newQuad( 0,
            0,
            64,
            64,
            buttonN.texture
        );
        love.graphics.newQuad( 64,
            0,
            64,
            64,
            buttonN.texture
        )
    }

    --undo/redo buttons
    buttonY = {}
    buttonY.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/Y-sheet.png')
    buttonY.x, buttonY.y, buttonY.w, buttonY.h = 192, 0, 48, 48
    buttonY.quad = 1
    buttonYQuads = {
        love.graphics.newQuad( 0,
            0,
            64,
            64,
            buttonY.texture
        );
        love.graphics.newQuad( 64,
            0,
            64,
            64,
            buttonY.texture
        )
    }

    buttonZ = {}
    buttonZ.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/Z-sheet.png')
    buttonZ.x, buttonZ.y, buttonZ.w, buttonZ.h = 144, 0, 48, 48
    buttonZ.quad = 1
    buttonZQuads = {
        love.graphics.newQuad( 0,
            0,
            64,
            64,
            buttonZ.texture
        );
        love.graphics.newQuad( 64,
            0,
            64,
            64,
            buttonZ.texture
        )
    }
    
    --save button
    buttonS = {}
    buttonS.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/S-sheet.png')
    buttonS.x, buttonS.y, buttonS.w, buttonS.h = 0, 0, 48, 48
    buttonS.quad = 1
    buttonSQuads = {
        love.graphics.newQuad( 0,
            0,
            64,
            64,
            buttonS.texture
        );
        love.graphics.newQuad( 64,
            0,
            64,
            64,
            buttonS.texture
        )
    }

    --Layer
    buttonT = {}
    buttonT.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/T-sheet.png')
    buttonT.x, buttonT.y, buttonT.w, buttonT.h = 240, 0, 48, 48
    buttonT.quad = 1
    buttonTQuads = {
        love.graphics.newQuad( 0,
            0,
            64,
            64,
            buttonT.texture
        );
        love.graphics.newQuad( 64,
            0,
            64,
            64,
            buttonT.texture
        )
    }

--Words
    --delete button
    backspaceButton = {}
    backspaceButton.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/Words/BackSpace-sheet.png')
    backspaceButton.x, backspaceButton.y, backspaceButton.w, backspaceButton.h = love.graphics.getWidth() - 144, 0, 96, 48
    backspaceButton.quad = 1
    backspaceButtonQuads = {
        love.graphics.newQuad( 0,
            0,
            128,
            64,
            backspaceButton.texture
        );
        love.graphics.newQuad( 128,
            0,
            128,
            64,
            backspaceButton.texture
        )
    }
    
    --block state mode button
    escButton = {}
    escButton.texture = love.graphics.newImage('Rsrc/Images/Keyboard/'.. editorConf.theme .. '/Words/Esc-sheet.png')
    escButton.x, escButton.y, escButton.w, escButton.h = love.graphics.getWidth() - 192, 0, 48, 48
    escButton.quad = 1
    escButtonQuads = {
        love.graphics.newQuad( 0,
            0,
            64,
            64,
            escButton.texture
        );
        love.graphics.newQuad( 64,
            0,
            64,
            64,
            escButton.texture
        )
    }
    
    --mapselect button
    altButton = {}
    altButton.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/Words/Alt-sheet.png')
    altButton.x, altButton.y, altButton.w, altButton.h = love.graphics.getWidth() - 48, 0, 48, 48
    altButton.quad = 1
    altButtonQuads = {
        love.graphics.newQuad( 0,
            0,
            64,
            64,
            altButton.texture
        );
        love.graphics.newQuad( 64,
            0,
            64,
            64,
            altButton.texture
        )
    }
    --object mode button 
    ctrlButton = {}
    ctrlButton.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/Words/Ctrl-sheet.png')
    ctrlButton.x, ctrlButton.y, ctrlButton.w, ctrlButton.h = love.graphics.getWidth() - 288, 0, 96, 48
    ctrlButton.quad = 1
    ctrlButtonQuads = {
        love.graphics.newQuad( 0,
            0,
            128,
            64,
            ctrlButton.texture
        );
        love.graphics.newQuad( 128,
            0,
            128,
            64,
            ctrlButton.texture
        )
    }
    
    --symbols
    buttonSub = {}
    buttonSub.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/Symbols/Sub-sheet.png')
    buttonSub.x, buttonSub.y, buttonSub.w, buttonSub.h = 112, 190, 32, 32
    buttonSub.quad = 1
    buttonSubQuads = {
        love.graphics.newQuad( 0,
            0,
            32,
            32,
            buttonSub.texture
        );
        love.graphics.newQuad( 32,
            0,
            32,
            32,
            buttonSub.texture
        )
    }

--number
    button0 = {}
    button0.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/Numbers/0-sheet.png')
    button0.x, button0.y, button0.w, button0.h = 33, 222, 32, 32
    button0.quad = 1
    button0Quads = {
        love.graphics.newQuad( 0,
            0,
            32,
            32,
            button0.texture
        );
        love.graphics.newQuad( 32,
            0,
            32,
            32,
            button0.texture
        )
    }

    button1 = {}
    button1.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/Numbers/1-sheet.png')
    button1.x, button1.y, button1.w, button1.h = 1, 190, 32, 32
    button1.quad = 1
    button1Quads = {
        love.graphics.newQuad( 0,
            0,
            32,
            32,
            button1.texture
        );
        love.graphics.newQuad( 32,
            0,
            32,
            32,
            button1.texture
        )
    }

    button2 = {}
    button2.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/Numbers/2-sheet.png')
    button2.x, button2.y, button2.w, button2.h = 33, 190, 32, 32
    button2.quad = 1
    button2Quads = {
        love.graphics.newQuad( 0,
            0,
            32,
            32,
            button2.texture
        );
        love.graphics.newQuad( 32,
            0,
            32,
            32,
            button2.texture
        )
    }

    button3 = {}
    button3.texture = love.graphics.newImage('Rsrc/Images/Keyboard/' .. editorConf.theme .. '/Numbers/3-sheet.png')
    button3.x, button3.y, button3.w, button3.h = 64, 190, 32, 32
    button3.quad = 1
    button3Quads = {
        love.graphics.newQuad( 0,
            0,
            32,
            32,
            button3.texture
        );
        love.graphics.newQuad( 32,
            0,
            32,
            32,
            button3.texture
        )
    }

--vars
    self.buttonsSize = .75
    self.ramUsed = nil --ram
end

function ui:draw()
    -- grade
    if editorConf.gridOn == "On" then
        for x = 0, love.graphics.getWidth(), meta.map.grid.size do
            for y = 0, love.graphics.getHeight(), meta.map.grid.size do
                -- crate the grade with base on gradeSize
                love.graphics.setColor( meta.map.grid.color.r / 255, meta.map.grid.color.g / 255, meta.map.grid.color.b / 255, meta.map.grid.color.a / 100)
                    love.graphics.rectangle( 'line',
                        x,
                        y,
                        meta.map.grid.size,
                        meta.map.grid.size
                    )
                love.graphics.setColor( 1, 1, 1)
            end
        end
    end
   
    -- show the block in your hand
    love.graphics.draw( tiles[textureId], 162, 64)
    
    -- touch
    if editorConf.touchOn == "On" then
        love.graphics.setColor( 0, 1, 0)
            love.graphics.rectangle( 'line',
                centerx,
                centery,
                meta.map.grid.size,
                meta.map.grid.size
            )
    end

    -- theme
    if editorConf.theme == "Night" then
       love.graphics.setColor( .25, .25, .25)
    elseif editorConf.theme == "Carmin" then
        love.graphics.setColor( 102 / 255, 255 / 255, 227 / 255)
    elseif editorConf.theme == "Currupition" then
       love.graphics.setColor( 255 / 255 , 200 / 255, 0)
    end

    love.graphics.rectangle( 'line',
        162,
        64,
        meta.map.grid.size,
        meta.map.grid.size
    )

    -- text infos
    love.graphics.print( lang.editorStateTranslate.mode .. mode, 0, 48)
    love.graphics.print( lang.editorStateTranslate.layer .. layer, 0, 64)
    love.graphics.print( lang.editorStateTranslate.object .. objectId, 0, 80)
    
    if editorConf.infoOn == "On" then
        love.graphics.print( lang.mapManagerTranslate.map .. meta.map.id, 0, 96)
        love.graphics.print( "X:" .. editorOffsetX, 0, 112)
        love.graphics.print( "Y:" .. editorOffsetY, 96, 112)
        love.graphics.print( "FPS:" .. love.timer.getFPS(), 0, 128)
        love.graphics.print( "RAM:" .. self.ramUsed, 0, 144)
    end

    ---show layers
    if mode == "layer selector" or mode == "object" then
        -- window theme
        if editorConf.theme == "Carmin" then
            love.graphics.setColor( 1, 0, 0)
        elseif editorConf.theme == "Currupition" then
            love.graphics.setColor( 0, 0, 1)
        else
           love.graphics.setColor( 96 / 255, 96 / 255, 112 / 255)
        end
        
        love.graphics.rectangle( 'fill',
            0,
            158,
            144,
            32
        )
        love.graphics.rectangle( 'line',
            0,
            158,
            144,
            96
        )
        love.graphics.setColor( 194 / 255, 194 / 255, 209 / 255)
        love.graphics.rectangle( 'fill',
            0,
            190,
            144,
            64
        )

        --leter theme
        if editorConf.theme == "Night" then
            love.graphics.setColor( .25, .25, .25)
        elseif editorConf.theme == "Carmin" then
            love.graphics.setColor( 102 / 255, 255 / 255, 227 / 255)
        elseif editorConf.theme == "Currupition" then
            love.graphics.setColor( 255 / 255 , 200 / 255, 0)
        else
            love.graphics.setColor( 1, 1, 1)
        end

        if mode == "layer selector" then
            love.graphics.print( lang.editorStateTranslate.layers, 16, 164)
        elseif mode == "object" then
            love.graphics.print( lang.editorStateTranslate.objects, 16, 164)
        end
    end
    love.graphics.setColor( 1, 1, 1)
    
--arrows
    love.graphics.draw( buttonUp.texture, buttonUpQuads[buttonUp.quad], buttonUp.x, buttonUp.y)
    love.graphics.draw( buttonDown.texture, buttonDownQuads[buttonDown.quad], buttonDown.x, buttonDown.y)
    love.graphics.draw( buttonLeft.texture, buttonLeftQuads[buttonLeft.quad], buttonLeft.x, buttonLeft.y)
    love.graphics.draw( buttonRight.texture, buttonRightQuads[buttonRight.quad], buttonRight.x, buttonRight.y)

--Keyboard
    --change blocks
    love.graphics.draw( buttonB.texture,
        buttonBQuads[buttonB.quad],
        buttonB.x,
        buttonB.y,
        nil,
        self.buttonsSize
    )
    love.graphics.draw( buttonN.texture,
        buttonNQuads[buttonN.quad],
        buttonN.x,
        buttonN.y,
        nil,
        self.buttonsSize
    )

    --undo/redo
    love.graphics.draw( buttonY.texture,
        buttonYQuads[buttonY.quad],
        buttonY.x,
        buttonY.y,
        nil,
        self.buttonsSize
    )
    love.graphics.draw( buttonZ.texture,
        buttonZQuads[buttonZ.quad],
        buttonZ.x,
        buttonZ.y,
        nil,
        self.buttonsSize
    )

    --save
    love.graphics.draw( buttonS.texture,
        buttonSQuads[buttonS.quad],
        buttonS.x,
        buttonS.y,
        nil,
        self.buttonsSize
    )

    --layer
    love.graphics.draw( buttonT.texture,
        buttonTQuads[buttonT.quad],
        buttonT.x,
        buttonT.y,
        nil, 
        self.buttonsSize
    )

    if mode == "layer selector" or mode == "object" then
        love.graphics.draw( button0.texture, button0Quads[button0.quad], button0.x, button0.y )
        love.graphics.draw(button1.texture, button1Quads[button1.quad], button1.x, button1.y)
        love.graphics.draw( button2.texture, button2Quads[button2.quad], button2.x, button2.y)
        love.graphics.draw( button3.texture, button3Quads[button3.quad], button3.x, button3.y)
        
        if mode == "layer selector" then
            love.graphics.draw( buttonSub.texture, buttonSubQuads[buttonSub.quad], buttonSub.x, buttonSub.y)
        end
    end

--words
    love.graphics.draw( backspaceButton.texture, backspaceButtonQuads[backspaceButton.quad],
        backspaceButton.x, 
        backspaceButton.y,
        nil,
        self.buttonsSize
    )

    love.graphics.draw( altButton.texture,
        altButtonQuads[altButton.quad], 
        altButton.x,
        altButton.y,
        nil,
        self.buttonsSize
    )

    love.graphics.draw( escButton.texture,
        escButtonQuads[escButton.quad],
        escButton.x,
        escButton.y,
        nil,
        self.buttonsSize
    )

    love.graphics.draw( ctrlButton.texture,
        ctrlButtonQuads[ctrlButton.quad],
        ctrlButton.x,
        ctrlButton.y,
        nil,
        self.buttonsSize
    )
end

function ui:update(dt)
    self.ramUsed = memory.byteToSize(love.graphics.getStats().texturememory)
    if love.mouse.isDown(1) then
        --arrows
        if isTouchOnButton( tx, ty, buttonUp) then
            buttonUp.quad = 2
            buttonDown.quad = 1
            buttonLeft.quad = 1
            buttonRight.quad = 1
            editorOffsetY = editorOffsetY - 1
        elseif isTouchOnButton( tx, ty, buttonDown) then
            buttonUp.quad = 1 
            buttonDown.quad = 2
            buttonLeft.quad = 1
            buttonRight.quad = 1
            editorOffsetY = editorOffsetY + 1
        elseif isTouchOnButton( tx, ty, buttonLeft) then
            buttonRight.quad = 1
            buttonUp.quad = 1 
            buttonDown.quad = 1
            buttonLeft.quad = 2
            editorOffsetX = editorOffsetX - 1
        elseif isTouchOnButton( tx, ty, buttonRight) then
            buttonUp.quad = 1 
            buttonDown.quad = 1
            buttonLeft.quad = 1
            buttonRight.quad = 2
            editorOffsetX = editorOffsetX + 1
            
        --keyboard change blocks
        elseif isTouchOnButton( tx, ty, buttonB) then
            buttonB.quad = 2
            
            --cmds
            if textureId > 1 then
                textureId = textureId - 1
            elseif textureId == 1 then
                textureId = #tiles
            end
            
            love.timer.sleep(timeSleep)
        elseif isTouchOnButton( tx, ty, buttonN) then
            buttonN.quad = 2
            
            --cmds
            if textureId < #tiles then
                textureId = textureId + 1
            elseif textureId == #tiles then
                textureId = 1
            end
            
            if dt < timeSleep then
                love.timer.sleep(timeSleep - dt)
            end
        --undo/redo
        elseif isTouchOnButton( tx, ty, buttonY) then
            buttonY.quad = 2
            
            -- cmds
            if #trash > 0 then
                table.insert( maps.map.blocks, #maps.map.blocks, trash[1])
                table.remove( trash, 1)
            end
            
            if dt < timeSleep then
                love.timer.sleep(timeSleep - dt)
            end
        elseif isTouchOnButton( tx, ty, buttonZ) then
            buttonZ.quad = 2
            
            -- cmds
            if #maps.map.blocks > 0 then
                table.insert( trash, 1, maps.map.blocks[#maps.map.blocks])
                table.remove( maps.map.blocks, #maps.map.blocks)
            end
            
            if dt < timeSleep then
                love.timer.sleep(timeSleep - dt)
            end
        --save
        elseif isTouchOnButton( tx, ty, buttonS) then
            buttonS.quad = 2
            
            --cmds
            love.filesystem.write( 'Maps/' .. editorState.mapId .. '/map.json', json.encode(maps))
        --words delete
        elseif isTouchOnButton( tx, ty, backspaceButton) then
            backspaceButton.quad = 2
 
            --cmds
            if mode == "object" then
                mode = "delete object"
            elseif mode == "block" then
                mode = "delete block"
            end
        --words change map
        elseif isTouchOnButton( tx, ty, altButton) then
            altButton.quad = 2
            
            --cmds
            buttonS.texture:release()
            buttonN.texture:release()
            buttonB.texture:release()
            buttonZ.texture:release()
            buttonY.texture:release()
            buttonT.texture:release()
            buttonUp.texture:release()
            buttonLeft.texture:release()
            buttonDown.texture:release()
            buttonRight.texture:release()
            buttonSub.texture:release()
            button0.texture:release()
            button1.texture:release()
            button2.texture:release()
            button3.texture:release()
            backspaceButton.texture:release()
            ctrlButton.texture:release()
            escButton.texture:release()
            altButton.texture:release()
            for i, tile in ipairs(tiles) do
                tiles[i]:release()
            end
            
            gamestate.switch(states.mapManager)
        elseif isTouchOnButton( tx, ty, escButton) then
            escButton.quad = 2
            
            --cmds
            mode = "block"
        elseif isTouchOnButton( tx, ty, ctrlButton) then
            ctrlButton.quad = 2
            
            --cmds
            mode = "object"
        elseif isTouchOnButton( tx, ty, buttonT) then
            buttonT.quad = 2
            
            --cmds
            mode = "layer selector"
        end
        
        if mode == "layer selector" or mode == "object" then
            if isTouchOnButton( tx, ty, button0) then
                button0.quad = 2
                
                if mode == "layer selector" then
                    layer = 0
                elseif mode == "object" then
                    objectId = 1
                end
            elseif isTouchOnButton( tx, ty, button1) then
                button1.quad = 2
                
                --cmds
                if mode == "layer selector" then
                    if layer > 0 then
                        layer = layer - 1
                    end
                elseif mode == "object" then
                    if objectId > 1 then
                        objectId = objectId - 1
                    end
                end
                
                if dt < timeSleep then
                    love.timer.sleep(timeSleep - dt)
                end
            elseif isTouchOnButton( tx, ty, button2) then
                button2.quad = 2
                
                --cmds
                if mode == "layer selector" then
                    layer = layer + 1
                elseif mode == "object" then
                    objectId = objectId + 1
                end
                
                if dt < timeSleep then
                    love.timer.sleep(timeSleep - dt)
                end
            elseif isTouchOnButton( tx, ty, button3) then
                button3.quad = 2
                
                --cmds
                if mode == "layer selector" then
                    layer = layer + 10
                elseif mode == "object" then
                    objectId = objectId + 10
                end
                
                if dt < timeSleep then
                    love.timer.sleep(timeSleep - dt)
                end
            elseif isTouchOnButton( tx, ty, buttonSub) then
                buttonSub.quad = 2
                if mode == "layer selector" then
                    -- cmds
                    for i, block in ipairs(maps.map.blocks) do
                        if layer == block.layer then
                            table.insert( trash, 1, maps.map.blocks[i])
                            table.remove( maps.map.blocks, i)
                        end
                    end
                    
                    for i, object in ipairs(maps.map.objects) do
                        if layer == object.layer then
                            table.insert( trash, 1, maps.map.objects[i])
                            table.remove( maps.map.objects, i)
                        end
                    end
                end
            end
        end
    end
end

function ui.touchreleased()
    buttonUp.quad = 1 
    buttonDown.quad = 1
    buttonLeft.quad = 1
    buttonRight.quad = 1
    buttonB.quad = 1
    buttonN.quad = 1
    buttonY.quad = 1
    buttonZ.quad = 1
    buttonS.quad = 1
    buttonT.quad = 1
    backspaceButton.quad = 1
    altButton.quad = 1
    escButton.quad = 1
    ctrlButton.quad = 1
    buttonSub.quad = 1
    button0.quad = 1
    button1.quad = 1
    button2.quad = 1
    button3.quad = 1
end

return ui