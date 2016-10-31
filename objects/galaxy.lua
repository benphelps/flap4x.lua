--[[
    Flap4x - A flappy 4x space game.
]]

-- local math = require "utilities.math"
local StarTypes = require "assets.data.startypes"
local StarObject = require "objects.star"
local GalaxyObject = class "Galaxy"

local stars = 500
local scale = 100
local deviation = 2
local seed = 8675309

function GalaxyObject:initialize()
    -- The entire galaxy fits inside a single Lua table!
    self.galaxy = { }
    self.starStack = { }
    self:seedUniverse()
end

function GalaxyObject:load()
    camera:lookAt(self.center, self.center)
end

function GalaxyObject:update(dt)
    for _, star in pairs(self.galaxy) do
        star:update(dt)
    end
end

function GalaxyObject:seedStars()

end

local densityTarget1 = 0
local densityTarget2 = 0
function GalaxyObject:seedUniverse()
    self.radius = stars * scale
    self.center = self.radius / 2
    for type, star in pairs(StarTypes.types) do
        local count = star.rarity * stars * deviation
        for i = 1, count do
            table.insert(self.starStack, type)
        end
    end
    for i = 1, stars do
        local starType = table.remove(self.starStack, math.random(#self.starStack))
        local pointFound = false
        while not pointFound do
            local x = love.math.random(0, self.radius)
            local y = love.math.random(0, self.radius)
            local nearStar = false
            for _, star in ipairs(self.galaxy) do
                if star.x - x < 5 or star.y - y < 5 then
                    nearStar = true
                end
            end
            if not nearStar then
                if (x - self.center) ^ 2 + (y - self.center) ^ 2 < self.radius ^ 2 then
                    local density1 = love.math.noise(x, y)
                    local density2 = love.math.noise(y, x)
                    if density1 > densityTarget1 and density2 > densityTarget2 then
                        local pos = x * self.radius + y
                        self.galaxy[pos] = StarObject:new(x, y, starType)
                        pointFound = true
                    end
                end
            end
        end
    end
end

function GalaxyObject:draw(camera)
    love.math.setRandomSeed(8675309)
    self.galaxy = {}
    self.starStack = {}
    self:seedUniverse()
    for _, star in pairs(self.galaxy) do
        star:draw(camera)
    end

    imgui.SetNextWindowPos(px(80), py(10))
    imgui.SetNextWindowSize(150, 200)
    if imgui.Begin("Debug Status", true, { "NoTitleBar", "NoResize", "NoMove", "NoSavedSettings"}) then -- , { "NoTitleBar", "NoResize", "NoMove", "NoSavedSettings"}
        imgui.Text("Camera: " .. camera.x .. "x " .. camera.y .. "y")
        imgui.Text("Scale: " .. camera.scale)
        imgui.End()
    end
    _, stars = imgui.SliderInt("stars", stars, 1, 2000)
    _, scale = imgui.SliderInt("size", scale, 1, 200)
    _, deviation = imgui.SliderInt("deviation", deviation, 1, 10)
    _, deviation = imgui.SliderInt("deviation", deviation, 1, 10)
    _, densityTarget1 = imgui.SliderFloat("density1", densityTarget1, 0.0, 0.98)
    _, densityTarget2 = imgui.SliderFloat("density2", densityTarget2, 0.0, 0.98)
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
