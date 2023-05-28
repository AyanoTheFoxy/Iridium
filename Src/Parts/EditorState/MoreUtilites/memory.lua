memory = {}

function round( num, idp)
    return tonumber(string.format( '%.' .. (idp or 0) .. 'f', num))
end

function memory.byteToSize(b)
    local kb = 1024
    local mb = kb * 1024
    local gb = mb * 1024
    local tb = gb * 1024
    
    if b >= 0 and b < kb then
        return b .. "b"
    elseif b >= kb and b < mb then
        return round( b / kb, 2) .. "kb"
    elseif b >= mb and b < gb then
        return round( b / mb, 2) .. "mb"
    elseif b >= gb and b < tb then
        return round( b / gb, 2) .. "gb"
    else
        return round( b / tb, 2) .. "tb"
    end
end

return memory