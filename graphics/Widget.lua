

local Object = require "libs.classic"

local Widget = Object:extend()

function Widget:new(x, y, w, h)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    
    self.dead = false
end

--- Called when this Widget is hovered over.
function Widget:onHover()
    
end

--- Called when the mouse leaves the boundaries of this Widget.
function Widget:onLeave()
    
end

--- Called when this Widget is hovered over and a button is pressed.
function Widget:onPress(button)
    
end

--- Called when this Widget is hovered over and a button is released.
function Widget:onRelease(button)
    
end

--- Checks to see whether or not we need to remove this Widget from the 
function Widget:isDead()
    return self.dead
end

--- Called every frame.
function Widget:update()
    
end

--- Called every frame.
function Widget:draw()
    
end

return Widget
