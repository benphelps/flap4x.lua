--[[
    Flap4x - A flappy 4x space game.
]]

local StarTypes = require "assets.data.startypes"
local StarObject = class 'StarObject'
-- local img = love.graphics.newImage('assets/images/star.png')

local function random(min, max)
   local range = max - min
   local offset = range * math.random()
   return min + offset
end

function StarObject:initialize(x, y, starType)
    self.x, self.y = x, y
    self.star = StarTypes.types[starType]
end

function StarObject:draw(camera)
    if camera.scale > 1 then
        love.graphics.circle("fill", self.x, self.y, 10)
        love.graphics.setLineWidth(2)
        love.graphics.circle("line", self.x, self.y, 100)
    else
        love.graphics.circle("fill", self.x, self.y, 100)
    end


    if camera.scale > 1 then

    end

end

function StarObject:update(dt)

end

return StarObject
