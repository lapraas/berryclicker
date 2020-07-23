
local Screen = require "graphics.Screen"

local ScrMain = Screen:extend()

ScrMain.ID = "Main Screen"

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
