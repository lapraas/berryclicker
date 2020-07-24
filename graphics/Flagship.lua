
local List =   require "libs.list"
local Object = require "libs.classic"

local Flagship = Object:extend()

--- Instantiate all screens in the screens folder and return them.
local function instScreens()
    local screens = {}
    -- Dynamically import all screen classes from the graphics/screens folder
    for _, fileName in ipairs(love.filesystem.getDirectoryItems("graphics/screens")) do
        -- Take the .lua off of the file name so that we can import it
        local splitFile = uq.split(fileName)
        local fileWithoutExt = table.concat({unpack(splitFile, 1, #splitFile - 4)})
        local Screen = require("graphics.screens." .. fileWithoutExt)
        screens[Screen.ID] = Screen()
    end
    return screens
end

function Flagship:new(startingScreenID)
    --- A list of all Screens tied to this Flagship.
    self.screens = instScreens()
    --- The currently displayed screen.
    self.cScreen = self.screens[startingScreenID]
end

function Flagship:update()
    if self.cScreen then
        self.cScreen:update()
        -- If the screen wants to go to the next screen (for instance a button that switches menus was pressed),
        -- get the next screen and make it the current screen.
        if self.cScreen:shouldGoNext() then
            self.cScreen.disembark()
            self.cScreen = self.screens[self.cScreen:getNextScreenID()]
            self.cScreen.embark()
        end
    end
end

function Flagship:draw()
    self.cScreen:draw()
end

return Flagship
