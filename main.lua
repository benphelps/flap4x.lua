--[[
    Flap4x - A flappy 4x space game.
]]

local GameScene = require "scenes.game"
local SceneManager = require "utilities.scenemanager"
local sceneManager = SceneManager:new()

sceneManager:setScene(GameScene:new())

function love.load()
    sceneManager:load()
end

function love.update(dt)
    sceneManager:update(dt)
end

function love.draw()
    sceneManager:draw()
end
