--[[
    Flap4x - A flappy 4x space game.
]]

require "imgui"

class = require("vendor.middleclass")

function px(p) return love.graphics.getWidth() * (p / 100) end
function py(p) return love.graphics.getHeight() * (p / 100) end
