local awful = require("awful")
local theme = require("beautiful")
local wibox = require("wibox")

local _M = function(s)
    s.panel = awful.wibar {
        screen          = s,
        position        = "top",
        height          = theme.panel_height,
        border_width    = theme.panel_border_width,
        border_color    = theme.panel_border_color,
        opacity         = theme.panel_opacity,
    }

    s.panel:setup {
        layout = wibox.layout.align.horizontal,
        expand = true,
        { -- Left widgets
            require("widgets.panels.top.menu"),
            require("widgets.panels.top.taglist")(s),
            --require("widgets.panels.top.prompt")(s),
            require("widgets.panels.top.layout")(s),
            layout = wibox.layout.fixed.horizontal,
            spacing = theme.panel_spacing,
        },
        { -- Middle widget
            {
                require("widgets.panels.top.tasklist")(s),
                layout = wibox.layout.fixed.horizontal,
                fill_space = true,
            },
            widget = wibox.container.margin,
            left = theme.panel_spacing,
            right = theme.panel_spacing,
        },
        { -- Right widgets
            require("widgets.panels.top.systray"),
            require("widgets.panels.top.clock")(),
            layout = wibox.layout.fixed.horizontal,
            spacing = theme.panel_spacing,
        },
    }

end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
