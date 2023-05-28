ultilities = {}

function ultilities.load()
-- tables
    --meta
    meta = {}
    --map
    meta.map = {}
        meta.map.version = "0.1.0: Uranium"
        meta.map.id = string.gsub( mapName.text, " ", "")
        meta.map.blocks = {}
        meta.map.objects = {}
        --grid
        meta.map.grid = {}
            meta.map.grid.size = tonumber(gridInput.size.text)
        -- grid color
        meta.map.grid.color = {}
            meta.map.grid.color.r = tonumber(gridInput.r.text)
            meta.map.grid.color.g = tonumber(gridInput.g.text)
            meta.map.grid.color.b = tonumber(gridInput.b.text)
            meta.map.grid.color.a = tonumber(gridInput.a.text)

end

function ultilities.update()
--input vars
    --static
    mapName.text = string.gsub( mapName.text, '[%s%p]+', "")
    gridInput.size.text = string.gsub( gridInput.size.text, '[%s%a%p]+', "")
    gridInput.r.text = string.gsub( gridInput.r.text, '[%s%a%p]+', "")
    gridInput.g.text = string.gsub( gridInput.g.text, '[%s%a%p]+', "")
    gridInput.b.text = string.gsub( gridInput.b.text, '[%s%a%p]+', "")
    gridInput.a.text = string.gsub( gridInput.a.text, '[%s%a%p]+', "")

    --meta
    meta.map.id =  mapName.text
    meta.map.grid.size = tonumber(gridInput.size.text)
    meta.map.grid.color.r = tonumber(gridInput.r.text)
    meta.map.grid.color.g = tonumber(gridInput.g.text)
    meta.map.grid.color.b = tonumber(gridInput.b.text)
    meta.map.grid.color.a = tonumber(gridInput.a.text)
end

return ultilities