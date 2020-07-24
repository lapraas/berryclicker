

-- Command to run:
--  & "C:\Program Files\LOVE\lovec" "c:\Users\Basset Hound\Documents\coding\lua\newberryclicker"

ug = require "utils.graphics"
um = require "utils.math"
uq = require "utils.qol"

local Flagship = require "graphics.Flagship"
local SMainID = require "graphics.screens.SMain".ID

function love.load()
    FLAGSHIP = Flagship(SMainID)
end

local accumulator = 0
local tickTime = 1/60
local doDraw = false
function love.update(dt)
    accumulator = accumulator + dt
    if accumulator >= tickTime then
        FLAGSHIP:update()
        accumulator = accumulator - tickTime
        doDraw = true
    end
end

function love.draw()
    if not doDraw then return end
    FLAGSHIP:draw()
end
