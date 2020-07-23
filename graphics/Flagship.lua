
local List =   require "libs.list"
local Object = require "libs.classic"

local Flagship = Object:extend()

--- Instantiate all screens in the screens folder and return them.
local function instScreens()
    local screens = {}
    for _, file in ipairs(love.filesystem.enumerate("./graphics/screens")) do
        local Screen = require "graphics.screens." .. file
        screens[Screen.ID] = Screen()
    end
    return screens
end

function Flagship:new()
    --- A list of all Screens tied to this Flagship.
    self.screens = instScreens()
    --- The currently displayed screen.
    self.cScreen = nil
end

function Flagship:update()
    if self.cScreen then
        self.cScreen.update()
        -- If the screen wants to go to the next screen (a button that switches menus was pressed),
        -- get the next screen and make it the current screen.
        if self.cScreen:shouldGoNext() then
            self.cScreen.disembark()
            self.cScreen = self.screens[self.cScreen:getNextScreenID()]
            self.cScreen.embark()
        end
    end
end

return Flagship
