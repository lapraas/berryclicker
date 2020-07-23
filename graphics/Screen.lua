
local List = require "libs.list"
local Object = require "libs.classic"

local Screen = Object:extend()

--- A unique ID for this Screen.
Screen.ID = nil
function Screen:new()
    self.nextScreenID = nil
    self.widgets = List()
    self.build()
end

--- Return whether or not the Screen wants the Flagship to switch to a different Screen.
function Screen:shouldGoNext()
    return self.nextScreenID and true or false
end

--- Return the ID for the Screen to switch to.
function Screen:getNextScreenID()
    return self.nextScreenID
end

--- Populate the screen with widgets. Only called on instantiation.
function Screen:build()
    
end

--- Perform any setup just before this is displayed. Called when the Flagship switches to this Screen..
function Screen:embark()
    
end

--- A frame-by-frame update. Called every 1/60th of a second.
function Screen:update()
    
end

--- Perform any teardown on the final frame this is to be displayed. Called when the Flagship switches off this Screen.
function Screen:disembark()
    
end

return Screen
