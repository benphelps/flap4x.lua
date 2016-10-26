--[[
    Flap4x - A flappy 4x space game.

    The Scene prototype.
]]

local Scene = class "Scene"

function Scene:update(dt) end
function Scene:draw() end
function Scene:blur(newScene) end
function Scene:focus(oldScene) end

return Scene
