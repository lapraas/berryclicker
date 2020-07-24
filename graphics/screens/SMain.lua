
local Screen = require "graphics.Screen"
local WLabel = require "graphics.widgets.WLabel"

local SMain = Screen:extend()

SMain.ID = "Main Screen"

function SMain:build()
    self:create(WLabel, {ug.w()/2, ug.h()/2, ug.pw(0.1), ug.ph(0.1), "Hello, World!", {0, 255, 0}, 5})
end

return SMain
