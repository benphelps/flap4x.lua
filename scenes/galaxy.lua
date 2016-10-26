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

function GalaxyScene:load()
    self.galaxy:load()
end

function GalaxyScene:update(dt)
    self.galaxy:update()
end

function GalaxyScene:draw(camera)
    self.galaxy:draw(camera)
end

return GalaxyScene
