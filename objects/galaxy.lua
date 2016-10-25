--[[
    Flap4x - A flappy 4x space game.
]]

local math = require "utilities.math"
local StarObject = require "objects.star"
local GalaxyObject = class "Galaxy"

function GalaxyObject:initialize()
    -- The entire galaxy fits inside a single Lua table!
    self.galaxy = {

    }
    self.stars = 100
    self.scale = 100
    self:seedUniverse()
end

function GalaxyObject:seedUniverse()
    local radius = self.stars * self.scale
    local center = radius / 2
    local currentStars = 0
    local at = 0
    while currentStars < self.stars do
        local x = love.math.random(0, radius)
        local y = love.math.random(0, radius)
        if (x - center) ^ 2 + (y - center) ^ 2 < radius ^ 2 then
            local hit = love.math.noise(x, y)
            if hit > 0.98 then
                local pos = x * radius + y
                self.galaxy[pos] = StarObject:new(x, y)
                currentStars = currentStars + 1
            end
        end
        local complete = (currentStars / self.stars * 100)
        if complete % 10 == 0 and at < complete then
            print('Seeding Universe .. ' .. complete .. '%')
            at = complete
        end
    end
end

function GalaxyObject:starAt(x, y)
    local radius = self.stars * self.scale
    local pos = x * radius + y
    if self.galaxy[pos] then
        return self.galaxy[pos]
    end
    return false
end

return GalaxyObject
