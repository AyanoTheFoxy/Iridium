theme = {}

function theme.load()
--addon
    require 'FoxsToolBox/gradient'

-- tables
    -- gradient
    greyScale = gradient {
        direction = 'horizontal';
        { .5; .5; .5};
        { 0; 0; 0};
    }
    redToGreenScale = gradient {
        direction = 'vertical';
        { 102 / 255; 19 / 255; 46 / 255};
        { 60 / 255; 179 / 255; 113 / 255};
    }
    blueToPurple = gradient {
        direction = 'vertical';
        { 0; 82 / 255; 185 / 255};
        { 139 / 255; 0; 139 / 255};
    }
end

function theme.draw()
    if editorConf.theme == "Night" then
        love.graphics.setBackgroundColor( 0, 0, 0)
    elseif editorConf.theme == "Day" then
        love.graphics.setBackgroundColor( .75, .75, .75)
    elseif editorConf.theme == "Carmin" then
        drawinrect( redToGreenScale,
            0,
            0,
            love.graphics.getWidth(),
            love.graphics.getHeight()
        )
    elseif editorConf.theme == "Currupition" then
        drawinrect( blueToPurple,
            0,
            0,
            love.graphics.getWidth(),
            love.graphics.getHeight()
        )
    elseif editorConf.theme == "Platinium" then
        drawinrect( greyScale,
            0,
            0,
            love.graphics.getWidth(),
            love.graphics.getHeight()
        )
    end
end
    
return theme