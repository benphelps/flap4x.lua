--[[
    Flap4x - A flappy 4x space game.
]]

local StarTypes = require "assets.data.startypes"
local StarObject = class 'StarObject'

local function random(min, max)
   local range = max - min
   local offset = range * math.random()
   return min + offset
end

function StarObject:initialize(x, y, starType)
    self.x, self.y = x, y
    self.star = StarTypes.types[starType]
end

function StarObject:draw()
    love.graphics.setColor(self.star.color[1], self.star.color[2], self.star.color[3], self.star.color[4])
    love.graphics.circle("fill", self.x, self.y, 1)
end

return StarObject
