--[[
    Flap4x - A flappy 4x space game.
]]

local GalaxyObject = require "objects.Galaxy"
local Scene = require "utilities.scene"
local GalaxyScene = class("GalaxyScene", Scene)

function GalaxyScene:initialize()
    self.galaxy = GalaxyObject:new()
    self.stars = 1000
end

function GalaxyScene:update(dt)

end

function GalaxyScene:draw()
    -- local scaledX =
    -- local scaledY =
    for x = 1, 100*100 do
        for y = 1, 100*100 do
            local star = self.galaxy:starAt(x, y)
            if star then
                star:draw()
            end
        end
    end
end

return GalaxyScene
