
local Object = require "libs.classic"
local json   = require "libs.json"

local uq = {}

function uq.str(t)
    if type(t) ~= "table" then return tostring(t) end
    local toReturn
    if t.str then
        pcall(function ()
            toReturn = t:str()
        end)
    end
    if toReturn ~= nil then return toReturn end
    if t.__tostring then
        pcall(function () 
            toReturn = tostring(t)
        end)
    end
    if toReturn ~= nil then return toReturn end
    local concatList = {}
    for key, val in pairs(t) do
        table.insert(concatList, "[" .. tostring(key) .. "]: " .. tostring(val))
    end
    return "{" .. table.concat(concatList, ",\t") .. "}"
end

function uq.equals(t1, t2)
    return uq.str(t1) == uq.str(t2)
end

function uq.isInstance(object, objectType)
    if objectType == "any" then return true end
    if type(objectType) == "string" and string.find(objectType, "?") then
        if object == nil then return true end
        objectType = objectType:sub(1, -2)
    end
        if object == nil and objectType == "nil" then return true
    elseif type(objectType) == "table" and type(object) == "table" and type(objectType.is) == "function" and type(object.is) == "function" then
        return object:is(objectType)
    elseif type(objectType) == "table" and type(objectType.is) ~= "function" then
        for _, val in ipairs(objectType) do
            if uq.isInstance(object, val) then return true end
        end
    else
        return type(object) == objectType
    end
end

-- taken from lua-users wiki (http://lua-users.org/wiki/CopyTable)
function uq.copy(orig, copies)
    copies = copies or {}
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if copies[orig] then
            copy = copies[orig]
        else
            copy = {}
            copies[orig] = copy
            for orig_key, orig_value in next, orig, nil do
                copy[uq.copy(orig_key, copies)] = uq.copy(orig_value, copies)
            end
            setmetatable(copy, uq.copy(getmetatable(orig), copies))
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function uq.printTable(t)
end

function uq.search(t, target)
    for i, val in ipairs(t) do
        if target == val then return i end
    end
    return false
end

function uq.searchKeys(t, target)
    for key, val in pairs(t) do
        if target == key then return key end
    end
    return false
end

function uq.searchVals(t, target)
    for key, val in pairs(t) do
        if val == t then return key end
    end
    return false
end

uq.Queue = Object:extend()
uq.Queue.__type = "Queue"

function uq.Queue:new()
    self.data = {}
    self.size = 0
end

function uq.Queue:enqueue(obj)
    table.insert(self.data, 1, obj)
    self.size = self.size + 1
end

function uq.Queue:dequeue()
    local obj = self.data[#self.data]
    self.data[#self.data] = nil
    self.size = self.size - 1
    return obj
end

function uq.requireJson(path)
    --print(path)
    local f = io.open("." .. path)
    if f == nil then
        f = io.open(love.filesystem.getSource() .. path)
    end
    local t = json.decode(f:read("*a"))
    io.close(f)
    return t
end

return uq
