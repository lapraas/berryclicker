
local Widget = require "graphics.Widget"

local WLabel = Widget:extend()

function WLabel:new(x, y, w, h, text, color, padding)
    WLabel.super.new(self, x, y, w, h)
    self.text = text or ""
    self.padding =
        (type(padding) == "table" and padding) or
        (type(padding) == "number" and {u=padding, d=padding, l=padding, r=padding}) or
        {u=0, d=0, l=0, r=0}
    self.color = color
end

--- Called every frame.
function WLabel:update()
    -- Update the centering variables to keep the text centered vertically.
    local font = love.graphics.getFont()
    if(self.w<font:getWidth(self.text))then
       self._centerW = font:getWidth(self.text)
    else
       self._centerW = self.w
    end
    if(self.h<font:getHeight(self.test))then
       self._centerH = font:getHeight(self.text)
    else
       self._centerH = self.h
    end
end

--- Called every frame.
function WLabel:draw()
    love.graphics.setColor(self.color);
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h);
    love.graphics.setColor(255,255,255);
    love.graphics.printf(self.text, self.x, self.y + self.h / 2, self.w - self.padding.l - self.padding.r, "center");
end

return WLabel
