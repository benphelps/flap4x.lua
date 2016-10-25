--[[
    Flap4x - A flappy 4x space game.
]]

local SceneManager = class "SceneManager"

function SceneManager:setScene(scene)
    self.scene = scene
end

function SceneManager:load()
    self.scene:load()
end

function SceneManager:update(dt)
    self.scene:update(dt)
end

function SceneManager:draw()
    self.scene:draw()
end

return SceneManager
