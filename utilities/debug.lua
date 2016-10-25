--[[
    Flap4x - A flappy 4x space game.
]]

local Debug = class('Debug')

function Debug:initialize(p)
    self.out = p
end

function Debug:notice(t)
    self.out(t, {91, 192, 222, 255})
end

function Debug:success(t)
    self.out(t, {92, 184, 92, 255})
end

function Debug:error(t)
    self.out(t, {217, 83, 79, 255})
end

function Debug:warn(t)
    self.out(t, {240, 173, 78, 255})
end

function Debug:log(t)
    self.out(t)
end

return Debug
