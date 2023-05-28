editorState = {}
editorState.mapId = nil

function editorState:enter()
-- archives
    ui = require 'Src/Parts/EditorState/ui'
    utilities = require 'Src/Parts/EditorState/utilities'
    theme = require 'Src/Parts/EditorState/MoreUtilites/theme'
    
-- sources
    theme.load()
    ui:load()
    utilities:load()
end

function editorState:draw()
    theme.draw()
    utilities:draw()
    ui:draw()
end

function editorState:update(dt)
    ui:update(dt)
end

function editorState:touchmoved( id, x, y, dx, dy, pressure)
    utilities:touchmoved()
end

function editorState:touchreleased( id, x, y, dx, dy, pressure)
    utilities:touchreleased()
    ui:touchreleased()
end

return editorState