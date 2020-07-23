
local ug = {}

--- Returns the screen's width in pixels.
function ug.w() return love.graphics.getWidth() end
--- Returns the screen's height in pixels.
function ug.h() return love.graphics.getHeight() end

--- Returns two pixel values (x, y) of how far across the screen two percents are in width and height respectively.
function ug.pp(percentX, percentY)
    return ug.w() * percentX, ug.h() * percentY
end

return ug
