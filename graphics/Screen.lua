
local List = require "libs.list"
local Object = require "libs.classic"

local Screen = Object:extend()

--- A unique ID for this Screen.
Screen.ID = nil
function Screen:new()
    self.nextScreenID = nil
    self.widgets = List()
    self:build()
end

--- Return whether or not the Screen wants the Flagship to switch to a different Screen.
function Screen:shouldGoNext()
    return self.nextScreenID and true or false
end

--- Return the ID for the Screen to switch to.
function Screen:getNextScreenID()
    return self.nextScreenID
end

function Screen:add(widget)
    self.widgets:add(widget)
end

function Screen:create(widgetClass, args)
    local newWidget = widgetClass(unpack(args))
    self:add(newWidget)
    return newWidget
end

--- Populate the screen with widgets. Only called on instantiation.
function Screen:build()
    
end

--- Perform any setup just before this is displayed. Called when the Flagship switches to this Screen.
function Screen:embark()
    
end

--- A frame-by-frame update. Called every 1/60th of a second.
function Screen:update()
    for i = self.widgets.size, 1, -1 do
        -- iterate backwards so we can remove killed widgets
        local widget = self.widgets:get(i)
        widget:update()
        if widget:isDead() then
            self.widgets:remove(widget, i)
        end
    end
end

--- Perform any teardown on the final frame this is to be displayed. Called when the Flagship switches off this Screen.
function Screen:disembark()
    
end

function Screen:draw()
    for i = 1, self.widgets.size do
        local widget = self.widgets:get(i)
        widget:draw()
    end
end

return Screen
