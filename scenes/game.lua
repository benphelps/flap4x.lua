--[[
    Flap4x - A flappy 4x space game.

    The Game scene controls the rendering of scenes and other general functions.
]]


local Scene = require "utilities.scene"
local GalaxyScene = require "scenes.galaxy"
local GameScene = class "GameScene", Scene

function GameScene:initialize(sceneManager)
    self.galaxy = GalaxyScene:new(0, 0)
end

local mouseDragState = {x = 0, y = 0}
local scaleState = 1

function GameScene:load()
    self.galaxy:load()
end

function GameScene:update(dt)
    self.galaxy:update()
end

function GameScene:draw(camera)
    self.galaxy:draw(camera)
end

function GameScene:blur(newScene) end
function GameScene:focus(oldScene) end

function love.wheelmoved(x, y)
    if y > 0 then
        scaleState = scaleState + 0.05
    elseif y < 0 then
        scaleState = scaleState - 0.05
    end
end

return GameScene
