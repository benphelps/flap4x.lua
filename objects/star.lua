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

function StarObject:initialize(x, y)
    -- lets create a star!
    local roll = random(0.00, StarTypes.max)
    local bestRarity = 100
    local bestStar = false
    for type, star in pairs(StarTypes.types) do
        print(star.rarity, roll, bestRarity)
        if star.rarity > roll and star.rarity < bestRarity then
            bestStar = star
            bestRarity = star.rarity
        end
    end
    if not self.star then
        print('wat')
    end
    self.star = bestStar
    self.x = x
    self.y = y
end

function StarObject:draw()
    love.graphics.setColor(self.star.color[1], self.star.color[2], self.star.color[3], self.star.color[4])
    love.graphics.circle("fill", self.x, self.y, 1)
end

return StarObject
