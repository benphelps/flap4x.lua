--[[
    Flap4x - A flappy 4x space game.

    The Game scene controls the rendering of scenes and other general functions.
]]

-- Load dependents
local Camera = require "utilities.camera"
local GalaxyScene = require "scenes.galaxy"

-- Create primary game scene
local Scene = require "utilities.scene"
local GameScene = class "GameScene", Scene

-- Defines
-- Lua doesn't create and global defines and uses ints instead, lets clean that up
MOUSE_LEFT_BUTTON = 1
MOUSE_RIGHT_BUTTON = 2
MOUSE_MIDDLE_BUTTON = 3

local scaleState = 1
function GameScene:initialize()
    self.camera = Camera:new()
    self.galaxy = GalaxyScene:new(self.camera)
end

function GameScene:load()
    love.graphics.setBackgroundColor(20, 20, 20, 255)
    self.galaxy:load()
end

local mouseDragState = { dragging = false, lastX = 0, lastY = 0 }


function GameScene:update(dt)

    self.camera:setScale(scaleState, scaleState)

    -- mouse map dragging
    -- if love.mouse.isDown(MOUSE_LEFT_BUTTON) then
    --     if not mouseDragState.dragging then
    --         mouseDragState.startX = love.mouse.getX()
    --         mouseDragState.startY = love.mouse.getY()
    --     end
    --     mouseDragState.dragging = true
    --     local offsetX = mouseDragState.startX - love.mouse.getX()
    --     local offsetY = mouseDragState.startY - love.mouse.getY()
    --     self.camera:setPosition(offsetX + mouseDragState.offsetX, offsetY + mouseDragState.offsetY)
    -- else
    --     if mouseDragState.dragging then
    --         mouseDragState.offsetX = mouseDragState.offsetX + (mouseDragState.startX - love.mouse.getX())
    --         mouseDragState.offsetY = mouseDragState.offsetY + (mouseDragState.startY - love.mouse.getY())
    --     end
    --     mouseDragState.dragging = false
    -- end

    if love.mouse.isDown(MOUSE_LEFT_BUTTON) then
        self.camera:setPosition(
            self.camera.x + (mouseDragState.lastX - love.mouse.getX()),
            self.camera.y + (mouseDragState.lastY - love.mouse.getY())
        )
        mouseDragState.lastX = love.mouse.getX()
        mouseDragState.lastY = love.mouse.getY()
    end



    self.galaxy:update()
end

function GameScene:draw()
    self.camera:set()
    self.galaxy:draw()
    self.camera:unset()
end

function love.wheelmoved(x, y)
    if y > 0 then
        scaleState = scaleState + 0.05
    elseif y < 0 then
        scaleState = scaleState - 0.05
    end
end

return GameScene
