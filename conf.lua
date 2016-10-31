--[[
    Flap4x - A flappy 4x space game.
]]

-- Setup our global
FLAP4X = {
    VERSION = '0.0.1'
}

require "utilities.bootstrap"

MOUSE_LEFT_BUTTON = 1
MOUSE_RIGHT_BUTTON = 2
MOUSE_MIDDLE_BUTTON = 3

function love.conf(conf)
    -- Global
    conf.version = "0.10.1"
    conf.identity = "flap4x"
    conf.console = true
    -- Window
    conf.window.width = 1920
    conf.window.height = 1080
    conf.window.resizeable = false
    conf.window.fullscreen = false
    conf.window.title = "Flap4x"
    conf.window.icon = "assets/images/icon_black.png"
    -- Modules
    conf.modules.math = true
    conf.modules.mouse = true
    -- console:success('Flap4x v' .. FLAP4X.VERSION .. ' loaded!')
end


-- imgui.PushStyleColor('TextDisabled', 0.24, 0.24, 0.20, 1.00)
-- imgui.PushStyleColor('Text', 0.00, 0.00, 0.00, 1.00)
-- imgui.PushStyleColor('WindowBg', 1.00, 1.00, 1.00, 0.78)
-- imgui.PushStyleColor('ChildWindowBg', 0.00, 0.00, 0.00, 0.00)
-- imgui.PushStyleColor('PopupBg', 1.00, 1.00, 1.00, 0.90)
-- imgui.PushStyleColor('Border', 0.39, 0.39, 0.30, 0.78)
-- imgui.PushStyleColor('BorderShadow', 1.00, 1.00, 1.00, 0.20)
-- imgui.PushStyleColor('FrameBg', 0.94, 0.94, 0.90, 1.00)
-- imgui.PushStyleColor('FrameBgHovered', 1.00, 1.00, 1.00, 1.00)
-- imgui.PushStyleColor('FrameBgActive', 0.96, 0.96, 1.00, 1.00)
-- imgui.PushStyleColor('TitleBg', 0.16, 0.54, 0.80, 1.00)
-- imgui.PushStyleColor('TitleBgCollapsed', 0.16, 0.54, 0.80, 1.00)
-- imgui.PushStyleColor('TitleBgActive', 0.16, 0.54, 0.80, 0.87)
-- imgui.PushStyleColor('MenuBarBg', 0.40, 0.40, 0.50, 0.80)
-- imgui.PushStyleColor('ScrollbarBg', 0.20, 0.25, 0.30, 0.60)
-- imgui.PushStyleColor('ScrollbarGrab', 0.40, 0.40, 0.80, 0.30)
-- imgui.PushStyleColor('ScrollbarGrabHovered', 0.40, 0.40, 0.80, 0.40)
-- imgui.PushStyleColor('ScrollbarGrabActive', 0.80, 0.50, 0.50, 0.40)
-- imgui.PushStyleColor('ComboBg', 0.20, 0.20, 0.20, 0.99)
-- imgui.PushStyleColor('CheckMark', 0.90, 0.90, 0.90, 0.50)
-- imgui.PushStyleColor('SliderGrab', 1.00, 1.00, 1.00, 0.30)
-- imgui.PushStyleColor('SliderGrabActive', 0.80, 0.50, 0.50, 1.00)
-- imgui.PushStyleColor('Button', 0.09, 0.79, 0.50, 0.60)
-- imgui.PushStyleColor('ButtonHovered', 0.09, 0.79, 0.50, 1.00)
-- imgui.PushStyleColor('ButtonActive', 0.09, 0.79, 0.50, 1.00)
-- imgui.PushStyleColor('Header', 1.00, 0.78, 0.20, 0.45)
-- imgui.PushStyleColor('HeaderHovered', 0.45, 0.45, 0.90, 0.80)
-- imgui.PushStyleColor('HeaderActive', 0.53, 0.53, 0.80, 0.80)
-- imgui.PushStyleColor('Column', 0.50, 0.50, 0.50, 1.00)
-- imgui.PushStyleColor('ColumnHovered', 0.70, 0.60, 0.60, 1.00)
-- imgui.PushStyleColor('ColumnActive', 0.90, 0.70, 0.70, 1.00)
-- imgui.PushStyleColor('ResizeGrip', 1.00, 1.00, 1.00, 0.30)
-- imgui.PushStyleColor('ResizeGripHovered', 1.00, 1.00, 1.00, 0.60)
-- imgui.PushStyleColor('ResizeGripActive', 1.00, 1.00, 1.00, 0.90)
-- imgui.PushStyleColor('CloseButton', 0.50, 0.50, 0.90, 0.50)
-- imgui.PushStyleColor('CloseButtonHovered', 0.70, 0.70, 0.90, 0.60)
-- imgui.PushStyleColor('CloseButtonActive', 0.70, 0.70, 0.70, 1.00)
-- imgui.PushStyleColor('PlotLines', 1.00, 1.00, 1.00, 1.00)
-- imgui.PushStyleColor('PlotLinesHovered', 0.90, 0.70, 0.00, 1.00)
-- imgui.PushStyleColor('PlotHistogram', 0.90, 0.70, 0.00, 1.00)
-- imgui.PushStyleColor('PlotHistogramHovered', 1.00, 0.60, 0.00, 1.00)
-- imgui.PushStyleColor('TextSelectedBg', 0.00, 0.00, 1.00, 0.35)
-- imgui.PushStyleColor('ModalWindowDarkening', 0.20, 0.20, 0.20, 0.35)
