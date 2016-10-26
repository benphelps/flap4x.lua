--[[
    Flap4x - A flappy 4x space game.
]]

local math = require "utilities.math"
local StarObject = require "objects.star"
local GalaxyObject = class "Galaxy"

function GalaxyObject:initialize()
    -- The entire galaxy fits inside a single Lua table!
    self.galaxy = { }
    self.stars = 100
    self.scale = 100
    self.radius = self.stars * self.scale
    self.center = self.radius / 2
    self:seedUniverse()
end

function GalaxyObject:load()
    camera:lookAt(self.center, self.center)
end

function GalaxyObject:update()
    --
end

function GalaxyObject:seedUniverse()
    local currentStars = 0
    local at = 0
    while currentStars < self.stars do
        local x = love.math.random(0, self.radius)
        local y = love.math.random(0, self.radius)
        if (x - self.center) ^ 2 + (y - self.center) ^ 2 < self.radius ^ 2 then
            local hit = love.math.noise(x, y)
            if hit > 0.98 then
                local pos = x * self.radius + y
                self.galaxy[pos] = StarObject:new(x, y)
                currentStars = currentStars + 1
            end
        end
        local complete = (currentStars / self.stars * 100)
        if complete % 10 == 0 and at < complete then
            print('Seeding Universe .. ' .. complete .. '%')
            at = complete
        end
    end
end

function GalaxyObject:draw(camera)
    local c = 0
    for _, v in pairs(self.galaxy) do
        c = c + 1
    end

    -- for x = 1, love.graphics.getWidth() do
    --     for y = 1, love.graphics.getWidth() do
    --         local pos = x * self.radius + y
    --         if self.galaxy[pos] then
    --             love.graphics.circle("fill", x, y, 4)
    --         end
    --     end
    --
    -- end

    for _, star in pairs(self.galaxy) do
        love.graphics.setColor(star.star.color[1], star.star.color[2], star.star.color[3])
        love.graphics.circle("fill", star.x, star.y, 10, 30)
        love.graphics.print( star.star.type, star.x - 4, star.y + 10 )
    end


    imgui.SetNextWindowPos(px(80), py(10))
    imgui.SetNextWindowSize(150, 200)
    if imgui.Begin("Debug Status", true, { "NoTitleBar", "NoResize", "NoMove", "NoSavedSettings"}) then -- , { "NoTitleBar", "NoResize", "NoMove", "NoSavedSettings"}
        imgui.Text("Stars: " .. c)
        imgui.Separator()
        imgui.Text("Camera: " .. camera.x .. "x " .. camera.y .. "y")
        imgui.End()
    end

end

function GalaxyObject:starAt(x, y)
    local radius = self.stars * self.scale
    local pos = x * radius + y
    if self.galaxy[pos] then
        return self.galaxy[pos]
    end
    return false
end

return GalaxyObject
