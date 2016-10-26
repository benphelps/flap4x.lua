--[[
    Flap4x - A flappy 4x space game.
]]

local SceneManager = class "SceneManager"

function SceneManager:initialize()
    self.scene = false
    self.scenes = { }
end

function SceneManager:load()
    -- nothing
end
function SceneManager:load()
    self.scene:load()
end

function SceneManager:registerScene(scene, sceneName)
    self.scenes[sceneName] = scene:new(self)
end

function SceneManager:setScene(sceneName)
    local oldScene = self.scene
    if oldScene then
        oldScene:blur(sceneName)
    end
    self.scene = self.scenes[sceneName]
    self.scene:focus(oldScene)
end

function SceneManager:update(dt)
    self.scene:update(dt)
end

function SceneManager:draw(camera)
    self.scene:draw(camera)
end

return SceneManager
