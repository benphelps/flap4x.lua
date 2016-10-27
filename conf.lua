--[[
    Flap4x - A flappy 4x space game.
]]

-- Setup our global
FLAP4X = {
    VERSION = '0.0.1'
}

console = require "utilities.bootstrap"

MOUSE_LEFT_BUTTON = 1
MOUSE_RIGHT_BUTTON = 2
MOUSE_MIDDLE_BUTTON = 3

function love.conf(conf)
    -- Global
    conf.version = "0.10.1"
    conf.identity = "flap4x"
    conf.console = false -- I use cupid for this
    -- Window
    conf.window.width = 1280
    conf.window.height = 720
    conf.window.resizeable = true
    conf.window.fullscreen = true
    conf.window.title = "Flap4x"
    conf.window.icon = "assets/images/icon_black.png"
    -- Modules
    conf.modules.math = true
    conf.modules.mouse = true

    console:success('Flap4x v' .. FLAP4X.VERSION .. ' loaded!')
end
