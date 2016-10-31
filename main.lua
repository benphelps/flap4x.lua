--[[
    Flap4x - A flappy 4x space game.
]]

local SceneManager = require "utilities.scenemanager"
local sceneManager = SceneManager:new()

local Camera = require "vendor.hump.camera"
camera = Camera(0, 0)

local GameScene = require "scenes.game"
sceneManager:registerScene(GameScene, "GameScene")

function love.load()
    love.graphics.setBackgroundColor(20, 20, 20, 255)
    sceneManager:setScene("GameScene")
    sceneManager:load()
    camera:zoomTo(0.5)
    camera.smoother = Camera.smooth.damped(10)
end

function love.update(dt)
    imgui.NewFrame()
    sceneManager:update(dt)
end

function love.draw()
    love.graphics.setColor(255, 255, 255)
    camera:attach()
    sceneManager:draw(camera)
    camera:detach()
    love.graphics.setColor(255, 255, 255, 255)
    imgui.Render()
end

function love.quit()
    imgui.ShutDown()
end

function love.textinput(t)
    imgui.TextInput(t)
    if not imgui.GetWantCaptureKeyboard() then
        -- Pass event to the game
    end
end

function love.keypressed(key)
    imgui.KeyPressed(key)
    if not imgui.GetWantCaptureKeyboard() then
        -- Pass event to the game
    end
end

function love.keyreleased(key)
    imgui.KeyReleased(key)
    if not imgui.GetWantCaptureKeyboard() then
        -- Pass event to the game
    end
end

function love.mousemoved(x, y, dx, dy)
    imgui.MouseMoved(x, y)
    if not imgui.GetWantCaptureMouse() then
        if love.mouse.isDown(MOUSE_LEFT_BUTTON) then
            camera:move(-dx/camera.scale, -dy/camera.scale)
        end
    end
end

function love.mousepressed(x, y, button)
    imgui.MousePressed(button)
    if not imgui.GetWantCaptureMouse() then
        -- Pass event to the game
    end
end

function love.mousereleased(x, y, button)
    imgui.MouseReleased(button)
    if not imgui.GetWantCaptureMouse() then
        -- Pass event to the game
    end
end

local zoom = 1
function love.wheelmoved(x, y)
    imgui.WheelMoved(y)
    if not imgui.GetWantCaptureMouse() then
        local zoomStep = y / 50
        local newZoom = zoom + zoomStep
        print(newZoom)
        if newZoom >= 0.05 and newZoom <= 2 then
            zoom = newZoom
        end
        camera:zoomTo(zoom)
        -- local middleX, middleY = camera:worldCoords(love.graphics.getWidth()/2, love.graphics.getHeight()/2)
        -- local mouseX, mouseY = camera:worldCoords(love.mouse.getPosition())
        -- local lerpX, lerpY = (middleX + mouseX) / 2, (middleY + mouseY) / 2
        -- camera:move(lerpX - camera.x, lerpY - camera.y)
    end
end
