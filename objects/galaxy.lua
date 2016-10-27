--[[
    Flap4x - A flappy 4x space game.
]]

-- local math = require "utilities.math"
local StarTypes = require "assets.data.startypes"
local StarObject = require "objects.star"
local GalaxyObject = class "Galaxy"

function GalaxyObject:initialize()
    -- The entire galaxy fits inside a single Lua table!
    self.galaxy = { }
    self.starStack = { }
    self.stars = 500
    self.scale = 50
    self.deviation = 2
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

function GalaxyObject:seedStars()

end

function GalaxyObject:seedUniverse()
    for type, star in pairs(StarTypes.types) do
        local count = star.rarity * self.stars * self.deviation
        for i = 1, count do
            table.insert(self.starStack, type)
        end
    end
    for i = 1, self.stars do
        local starType = table.remove(self.starStack, math.random(#self.starStack))
        local pointFound = false
        while not pointFound do
            local x = love.math.random(0, self.radius)
            local y = love.math.random(0, self.radius)
            if (x - self.center) ^ 2 + (y - self.center) ^ 2 < self.radius ^ 2 then
                -- the universe is non-homogeneous
                local density = love.math.noise(x, y)
                if density > 0.98 then
                    local pos = x * self.radius + y
                    self.galaxy[pos] = StarObject:new(x, y, starType)
                    pointFound = true
                end
            end
        end
    end
end

function GalaxyObject:draw(camera)
    for _, star in pairs(self.galaxy) do
        love.graphics.setColor(star.star.color[1], star.star.color[2], star.star.color[3])
        love.graphics.circle("fill", star.x, star.y, 100, 30)
        love.graphics.print( star.star.type, star.x - 4, star.y + 10 )
    end
    imgui.SetNextWindowPos(px(80), py(10))
    imgui.SetNextWindowSize(150, 200)
    if imgui.Begin("Debug Status", true, { "NoTitleBar", "NoResize", "NoMove", "NoSavedSettings"}) then -- , { "NoTitleBar", "NoResize", "NoMove", "NoSavedSettings"}
        imgui.Text("Camera: " .. camera.x .. "x " .. camera.y .. "y")
        imgui.Text("Scale: " .. camera.scale)
        imgui.End()
    end
    imgui.ShowTestWindow()
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
