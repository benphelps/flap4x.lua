--[[
    Flap4x - A flappy 4x space game.
]]

local GameInterface = class "GameInterface"

local showTestWindow = false
local showAnotherWindow = false
local floatValue = 0;
local sliderFloat = { 0.1, 0.5 }
local clearColor = { 0.2, 0.2, 0.2 }
local comboSelection = 1
local textValue = "text"

function GameInterface:initialize()

end

function GameInterface:load()

end

function GameInterface:update(dt)

end

function GameInterface:draw()
    local status




end

function GameInterface:quit()
    imgui.ShutDown()
end



return GameInterface
