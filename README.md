# Flap4x

This is a high level overview of the game structure.


1 unit = 1 light year

Galaxy [v]
    Cluster (perlin noise)
        Stars [v]
            All star types with no accompanying planets or bodies, i.e. black holes.
        Bodies [v]
            All body types with no parent star.
        Systems [v]
            Star
                The systems star(s).
            Bodies
                The systems bodies, this includes planets and other smaller bodies like asteroids.

[v] Has a view


imgui.PushStyleColor('Text',                 0.40, 0.39, 0.38, 1.00)
imgui.PushStyleColor('TextDisabled',         0.40, 0.39, 0.38, 0.77)
imgui.PushStyleColor('WindowBg',             0.92, 0.91, 0.88, 0.70)
imgui.PushStyleColor('ChildWindowBg',        1.00, 0.98, 0.95, 0.58)
imgui.PushStyleColor('PopupBg',              0.92, 0.91, 0.88, 0.92)
imgui.PushStyleColor('Border',               0.84, 0.83, 0.80, 0.65)
imgui.PushStyleColor('BorderShadow',         0.92, 0.91, 0.88, 0.00)
imgui.PushStyleColor('FrameBg',              1.00, 0.98, 0.95, 1.00)
imgui.PushStyleColor('FrameBgHovered',       0.99, 1.00, 0.40, 0.78)
imgui.PushStyleColor('FrameBgActive',        0.26, 1.00, 0.00, 1.00)
imgui.PushStyleColor('TitleBg',              1.00, 0.98, 0.95, 1.00)
imgui.PushStyleColor('TitleBgCollapsed',     1.00, 0.98, 0.95, 0.75)
imgui.PushStyleColor('TitleBgActive',        0.25, 1.00, 0.00, 1.00)
imgui.PushStyleColor('MenuBarBg',            1.00, 0.98, 0.95, 0.47)
imgui.PushStyleColor('ScrollbarBg',          1.00, 0.98, 0.95, 1.00)
imgui.PushStyleColor('ScrollbarGrab',        0.00, 0.00, 0.00, 0.21)
imgui.PushStyleColor('ScrollbarGrabHovered', 0.90, 0.91, 0.00, 0.78)
imgui.PushStyleColor('ScrollbarGrabActive',  0.25, 1.00, 0.00, 1.00)
imgui.PushStyleColor('ComboBg',              1.00, 0.98, 0.95, 1.00)
imgui.PushStyleColor('CheckMark',            0.25, 1.00, 0.00, 0.80)
imgui.PushStyleColor('SliderGrab',           0.00, 0.00, 0.00, 0.14)
imgui.PushStyleColor('SliderGrabActive',     0.25, 1.00, 0.00, 1.00)
imgui.PushStyleColor('Button',               0.00, 0.00, 0.00, 0.14)
imgui.PushStyleColor('ButtonHovered',        0.99, 1.00, 0.22, 0.86)
imgui.PushStyleColor('ButtonActive',         0.25, 1.00, 0.00, 1.00)
imgui.PushStyleColor('Header',               0.25, 1.00, 0.00, 0.76)
imgui.PushStyleColor('HeaderHovered',        0.25, 1.00, 0.00, 0.86)
imgui.PushStyleColor('HeaderActive',         0.25, 1.00, 0.00, 1.00)
imgui.PushStyleColor('Column',               0.00, 0.00, 0.00, 0.32)
imgui.PushStyleColor('ColumnHovered',        0.25, 1.00, 0.00, 0.78)
imgui.PushStyleColor('ColumnActive',         0.25, 1.00, 0.00, 1.00)
imgui.PushStyleColor('ResizeGrip',           0.00, 0.00, 0.00, 0.04)
imgui.PushStyleColor('ResizeGripHovered',    0.25, 1.00, 0.00, 0.78)
imgui.PushStyleColor('ResizeGripActive',     0.25, 1.00, 0.00, 1.00)
imgui.PushStyleColor('CloseButton',          0.40, 0.39, 0.38, 0.16)
imgui.PushStyleColor('CloseButtonHovered',   0.40, 0.39, 0.38, 0.39)
imgui.PushStyleColor('CloseButtonActive',    0.40, 0.39, 0.38, 1.00)
imgui.PushStyleColor('PlotLines',            0.40, 0.39, 0.38, 0.63)
imgui.PushStyleColor('PlotLinesHovered',     0.25, 1.00, 0.00, 1.00)
imgui.PushStyleColor('PlotHistogram',        0.40, 0.39, 0.38, 0.63)
imgui.PushStyleColor('PlotHistogramHovered', 0.25, 1.00, 0.00, 1.00)
imgui.PushStyleColor('TextSelectedBg',       0.25, 1.00, 0.00, 0.43)
imgui.PushStyleColor('ModalWindowDarkening', 1.00, 0.98, 0.95, 0.73)
