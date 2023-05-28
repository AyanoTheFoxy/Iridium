utilities = {}

function utilities:load()
--archives
    memory = require 'Src/Parts/EditorState/MoreUtilites/memory'

--tables
    --screen
    screen = {}
    screen.x, screen.y = buttonRight.x + buttonRight.w, buttonB.y + buttonB.h
    
    --tiles
    tiles = {} -- the tiles loaded
    tiles.w = {} --the tiles width
    tiles.h = {} ---the tiles height

    --map
    maps = {} --the map
    maps = json.decode(love.filesystem.read('Maps/' .. editorState.mapId .. '/map.json')) -- loadmap

--vars
    textureId = 1 --the texture
    objectId = 1 --the id on object
    layer = 1 --the layer
    mode = "block" --the mode of editor
    editorOffsetX, editorOffsetY = 0, 0 --editor off set
    tx, ty = -1, -1 --touch
    centerx, centery = 0, 0 --touch on grid

--cmds
    --load tiles
    if #love.filesystem.getDirectoryItems('Maps/' .. editorState.mapId .. '/Tiles') > 0 then
        for tile = 1, #love.filesystem.getDirectoryItems('Maps/' .. editorState.mapId .. '/Tiles'), 1 do
            table.insert( tiles, love.graphics.newImage('Maps/' .. editorState.mapId .. '/Tiles/' .. love.filesystem.getDirectoryItems('Maps/' .. editorState.mapId .. '/Tiles')[tile])) --insert all textures on the path
            table.insert( tiles.w, love.graphics.newImage('Maps/' .. editorState.mapId .. '/Tiles/' .. love.filesystem.getDirectoryItems('Maps/' .. editorState.mapId .. '/Tiles')[tile]):getWidth()) --take the width of tile
            table.insert( tiles.h, love.graphics.newImage('Maps/' .. editorState.mapId .. '/Tiles/' .. love.filesystem.getDirectoryItems('Maps/' .. editorState.mapId .. '/Tiles')[tile]):getHeight()) --take de height of tile
        end
    else
        table.insert( tiles, love.graphics.newImage('Rsrc/Images/NotTexture.png'))
        table.insert( tiles.w, 32) --take the width of tile
        table.insert( tiles.h, 32) --take the height of tile
    end
end

function utilities:draw()
    for i, block in ipairs(maps.map.blocks) do
        --put and move blocks
        if block.layer == layer then
            love.graphics.draw( tiles[block.textureId], block.x - editorOffsetX * maps.map.grid.size, block.y - editorOffsetY * maps.map.grid.size)
        end
    end
    
    if layer == 0 then
        for i, block in ipairs(maps.map.blocks) do
            love.graphics.draw( tiles[block.textureId], block.x - editorOffsetX * maps.map.grid.size, block.y - editorOffsetY * maps.map.grid.size)
        end
    end
    
    for i, object in ipairs(maps.map.objects) do
        --put and move objects
        if object.layer == layer then
            love.graphics.setColor( 0, 0, 0)
            love.graphics.rectangle( 'line',
                object.x - editorOffsetX * maps.map.grid.size,
                object.y - editorOffsetY * maps.map.grid.size,
                object.w,
                object.h
            )
            love.graphics.print( object.id, object.x + object.w / 2 - font:getWidth(objectId) / 2 - editorOffsetX * maps.map.grid.size, object.y + object.h / 2 - font:getHeight() / 2 - editorOffsetY * maps.map.grid.size)
            love.graphics.setColor( 0, 0, 0, .25)
            love.graphics.rectangle( 'fill',
                object.x - editorOffsetX * maps.map.grid.size,
                object.y - editorOffsetY * maps.map.grid.size,
                object.w,
                object.h
            )
        end
    end
    
    if layer == 0 then
        for i, object in ipairs(maps.map.objects) do
            love.graphics.setColor( 0, 0, 0)
            love.graphics.rectangle( 'line',
                object.x - editorOffsetX * maps.map.grid.size,
                object.y - editorOffsetY * maps.map.gridSize,
                object.w,
                object.h
            )
            love.graphics.print( object.id, object.x + object.w / 2 - font:getWidth(objectId) / 2 - editorOffsetX * maps.map.grid.size, object.y + object.h / 2 - font:getHeight() / 2 - editorOffsetY * maps.map.grid.size)
            love.graphics.setColor( 0, 0, 0, .25)
            love.graphics.rectangle( 'fill',
                object.x - editorOffsetX * maps.map.grid.size,
                object.y - editorOffsetY * maps.map.grid.size,
                object.w,
                object.h
            )
        end
    end
end

function utilities:update()

end

function utilities:touchmoved()
    -- center the block
    centerx, centery = math.floor(tx / maps.map.grid.size) * maps.map.grid.size, math.floor(ty / maps.map.grid.size) * maps.map.grid.size

    if tx > screen.x and ty > screen.y and mode == "block" and layer > 0 and not canPlaceBlocks( centerx + editorOffsetX * maps.map.grid.size, centery + editorOffsetY * maps.map.grid.size) then
        createBlocks( textureId, centerx + editorOffsetX * maps.map.grid.size, centery + editorOffsetY * maps.map.grid.size, layer)
    elseif tx > screen.x and ty > screen.y and mode == "object" and layer > 0 and not canPlaceObjects( centerx + editorOffsetX * maps.map.grid.size, centery + editorOffsetY * maps.map.grid.size) then
        createObject( objectId,
            centerx + editorOffsetX * maps.map.grid.size,
            centery + editorOffsetY * maps.map.grid.size,
            layer,
            textureId
        )
    end

    if tx > screen.x and ty > screen.y and mode == "delete block" and layer > 0 then
        deleteBlocks( centerx + editorOffsetX * maps.map.grid.size, centery + editorOffsetY * maps.map.grid.size, layer)
    elseif tx > screen.x and ty > screen.y and mode == "delete object" and layer > 0 then
        deleteObject( centerx + editorOffsetX * maps.map.grid.size, centery + editorOffsetY * maps.map.grid.size, layer)
    end
end

function utilities.touchreleased()
    -- center the block
    centerx, centery = math.floor(tx / maps.map.grid.size) * maps.map.grid.size, math.floor(ty / maps.map.grid.size) * maps.map.grid.size
end

function canPlaceBlocks( x, y)
--functions
    for i, block in pairs(maps.map.blocks) do
        if x == block.x and y == block.y then
            return true
        end
    end
end

function canPlaceObjects( x, y)
    for i, object in pairs(maps.map.objects) do
        if x == object.x and y == object.y then
            return true
        end
    end
end

function createBlocks( textureId, x, y, layer)
    block = {}
        block.textureId = textureId
        block.x = x
        block.y = y
        block.w = tiles.w[textureId]
        block.h = tiles.h[textureId]
        block.layer = layer
    
    table.insert( maps.map.blocks, block)
end

function deleteBlocks( x, y, layer)
    for i, block in ipairs(maps.map.blocks) do
        if x == block.x and y == block.y and layer == block.layer then
            table.insert( trash, 1, maps.map.blocks[i])
            table.remove( maps.map.blocks, i)
            break
        end
    end
end

function createObject( objectId, x, y, layer, tile)
    object = {}
        object.id = objectId
        object.x = x
        object.y = y
        object.w = tiles.w[tile]
        object.h = tiles.h[tile]
        object.layer = layer

    table.insert( maps.map.objects, object)
end

function deleteObject( x, y, layer)
    for i, block in ipairs(maps.map.objects) do
        if x == block.x and y == block.y and layer == block.layer then
            table.insert( trash, 1, maps.map.objects[i])
            table.remove( maps.map.objects, i)
            break
        end
    end
end
return utilities