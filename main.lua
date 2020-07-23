

function love.load()
    
end

local accumulator = 0
local tickTime = 1/60
function love.update(dt)
    accumulator = accumulator + dt
    if accumulator >= tickTime then
        
        accumulator = accumulator - tickTime
    end
end

function love.draw()
    
end
