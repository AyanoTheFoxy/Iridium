loadScreen = {}

function loadScreen:enter()
    utilites = require 'Src/Parts/LoadScreen/utilites'

    utilites:load()
end

function loadScreen:draw()
    utilites:draw()
end

function loadScreen:update(dt)
    utilites:update(dt)
end

return loadScreen