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
end

function love.update(dt)
    imgui.NewFrame()
    sceneManager:update(dt)
end

function love.draw()
    camera:attach()
    camera:zoom(1)
    love.graphics.setColor(255, 255, 255)
    love.graphics.circle("fill", 0, 0, 15)
    sceneManager:draw(camera)
    camera:detach()
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
        if (zoom + ( y / 10 )  > 0) and (zoom + ( y / 10 ) < 1) then
            zoom = zoom + ( y / 10 )
            camera:zoomTo(zoom)
        end
    end
end
