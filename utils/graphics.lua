
local ug = {}

--- Returns the screen's width in pixels.
function ug.w() return love.graphics.getWidth() end
--- Returns the screen's height in pixels.
function ug.h() return love.graphics.getHeight() end

--- Returns two pixel values (w, h) of how far across the screen two percents are in width and height respectively.
function ug.pp(percentW, percentH)
    return ug.w() * percentW, ug.h() * percentH
end
function ug.pw(percentW)
    return ug.w() * percentW
end
function ug.ph(percentH)
    return ug.w() * percentH
end

function ug.mute(color, muteVal)
    newC = {}
    for _, cv in ipairs(color) do
        table.insert(newC, cv - muteVal)
    end
    return newC
end

return ug
