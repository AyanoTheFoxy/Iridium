mapManager = {}

function mapManager:enter()
-- archives
    ui = require 'Src/Parts/MapManager/ui'
    utilities = require 'Src/Parts/MapManager/utilities'

-- sources
    ui.load()
    utilities.load()
end

function mapManager:draw()
    ui.draw()
    suit.draw()
end

function mapManager:update(dt)
    ui.update(dt)
    utilities.update()
end

function mapManager:keypressed(k)
    suit.keypressed(k)
end

function mapManager:textedited( t, s, l)
    suit.textedited( t, s, l)
end

function mapManager:textinput(k)
    suit.textinput(k)
end

return mapManager