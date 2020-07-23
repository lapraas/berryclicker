
math.randomseed(os.time())
math.random()
math.random()
math.random()

local Object = require "libs.classic"

local uq = require "utils.qol"

local um = {}

function um.pyth(x, y)
    return math.sqrt(x ^ 2 + y ^ 2)
end

function um.distance(x1, y1, x2, y2)
    return math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
end

function um.dot(x1, y1, x2, y2)
    return x1 * x2 + y1 * y2
end

function um.getXY(x, y)
    if type(x) == "table" then
        y = assert(x.y)
        x = assert(x.x)
    elseif not y then
        y = x
    end
    return x, y
end

function um.randChoice(l, pop)
    assert(l)
    local i = math.random(1, #l)
    local item = l[i]
    if pop then item = table.remove(l, i) end
    return item
end

um.Coord = Object:extend()
um.Coord.__type = "Coord"

function um.Coord:new(x, y)
    self.x = assert(x, "New Coord objects must be supplied an x and y value.")
    self.y = assert(y, "New Coord objects must be supplied an x and y value.")
end

function um.Coord:str()
    return "(" .. self.x .. ", " .. self.y .. ")"
end

function um.Coord:plus(x, y)
    x, y = um.getXY(x, y)
    return um.Coord(self.x + x, self.y + y)
end
function um.Coord:minus(x, y)
    x, y = um.getXY(x, y)
    return um.Coord(self.x - x, self.y - y)
end
function um.Coord:times(x, y)
    x, y = um.getXY(x, y)
    return um.Coord(self.x * x, self.y * y)
end
function um.Coord:over(x, y)
    x, y = um.getXY(x, y)
    return um.Coord(self.x / x, self.y / y)
end
function um.Coord:pow(x, y)
    x, y = um.getXY(x, y)
    return um.Coord(self.x ^ x, self.y ^ y)
end

function um.Coord:equals(x, y)
    x, y = um.getXY(x, y)
    return self.x == x and self.y == y
end

function um.Coord:sum()
    return self.x + self.y
end
function um.Coord:pyth()
    return math.sqrt(self.x ^ 2, self.y ^ 2)
end
function um.Coord:negate()
    return um.Coord(-self.x, -self.y)
end
function um.Coord:reciprocal()
    return um.Coord(1 / self.x, 1 / self.y)
end
function um.Coord:dump()
    return um.Coord(self.x, self.y)
end
function um.Coord:floor()
    return um.Coord(math.floor(self.x), math.floor(self.y))
end
function um.Coord:ceil()
    return um.Coord(math.ceil(self.x), math.ceil(self.y))
end
function um.Coord:swap()
    return um.Coord(self.y, self.x)
end

function um.Coord:dot(x, y)
    x, y = um.getXY(x, y)
    return self.x * x + self.y * y
end
function um.Coord:direction()
    local d = math.atan(self.y / self.x) / (math.pi / 180)
    if d ~= d then d = 180 end -- if d is NaN
    if self.x < 0 then d = d + 180 end
    return um.trunc(um.wrap(d))
end

function um.Coord:getAdjacentCoords(howFar)
    howFar = howFar or 1
    return {
        um.Coord(self.x + howFar, self.y),
        um.Coord(self.x - howFar, self.y),
        um.Coord(self.x, self.y + howFar),
        um.Coord(self.x, self.y - howFar)
    }
end
function um.Coord:getSurroundingCoords()
    return {
        um.Coord(self.x - 1, self.y - 1), -- 1
        um.Coord(self.x, self.y - 1), -- 2
        um.Coord(self.x + 1, self.y - 1), -- 3
        um.Coord(self.x + 1, self.y), -- 4
        um.Coord(self.x + 1, self.y + 1), -- 5
        um.Coord(self.x, self.y + 1), -- 6
        um.Coord(self.x - 1, self.y + 1), -- 7
        um.Coord(self.x - 1, self.y) -- 8
    }
end
function um.Coord:getSurroundingCoordsDict()
    return {
        ["1"] = um.Coord(self.x - 1, self.y - 1), -- 1
        ["2"] = um.Coord(self.x, self.y - 1), -- 2
        ["3"] = um.Coord(self.x + 1, self.y - 1), -- 3
        ["4"] = um.Coord(self.x + 1, self.y), -- 4
        ["5"] = um.Coord(self.x + 1, self.y + 1), -- 5
        ["6"] = um.Coord(self.x, self.y + 1), -- 6
        ["7"] = um.Coord(self.x - 1, self.y + 1), -- 7
        ["8"] = um.Coord(self.x - 1, self.y) -- 8
    }
end

return um
