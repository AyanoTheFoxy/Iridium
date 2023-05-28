ultilites = {}

function ultilites:load()
--libs
    timer = require 'FoxsToolBox/timer'

-- images
    self.logo = {}
        self.logo.image = love.graphics.newImage('Rsrc/Images/IridiumLogo.png')
        self.logo.alph = 0

--vars
    self.loadbarW = 1

-- cmds
    self.loadTimer = timer.new()
    self.loadTimer:after( 5,
        function()
            self.logo.image:release()
            gamestate.switch(states.mapManager)
        end
    )
end

function ultilites:draw()
    -- logo
    love.graphics.setColor( 1, 1, 1, self.logo.alph)
        love.graphics.draw( self.logo.image,
            love.graphics.getWidth() / 2,
            love.graphics.getHeight() / 2,
            nil,
            nil,
            nil,
            self.logo.image:getWidth() / 2,
            self.logo.image:getHeight() / 2
        )
        love.graphics.print( "Devlopers: AyanoTheFoxy and StrawberryChocolate; Artist: AyanoTheFoxy; Translate: AyanoTheFoxy and Tooru S.", 48, love.graphics.getHeight() - 64, nil, .5)
    love.graphics.setColor( 1, 1, 1)

    --loadbar
    love.graphics.rectangle( 'fill',
        0,
        love.graphics.getHeight() - 32,
        self.loadbarW % love.graphics.getWidth(),
        32
    )
    
    if self.loadbarW >= love.graphics.getWidth() / 2 then
        love.graphics.setColor( 0, 0, 0)
    else
        love.graphics.setColor( 1, 1, 1)
    end
        love.graphics.print( math.floor( self.loadbarW % love.graphics.getWidth() * .1183431953) .. "%", love.graphics.getWidth() / 2 - font:getWidth("100%") / 2, love.graphics.getHeight() - font:getHeight("100%") * 1.5)
    love.graphics.setColor( 1, 1, 1)

    love.graphics.print( string.format( "Memory used: %.2fKb",
            love.graphics.getStats().texturememory / 1024
        ),
        love.graphics.getWidth(),
        love.graphics.getHeight(),
        nil,
        .5,
        .5,
        font:getWidth(string.format( "Memory used: %.2fKb", love.graphics.getStats().texturememory / 1024)),
        80
    )
end

function ultilites:update(dt)
    self.loadTimer:update(dt)

    --visibility
    if self.logo.alph < 1 then
        self.logo.alph = self.logo.alph + .005
    end
    
    --load bar
    if self.loadbarW < love.graphics.getWidth() then
        self.loadbarW = self.loadbarW + 2.8
    end
end

return ultilites