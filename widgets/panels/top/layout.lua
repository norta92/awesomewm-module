local awful = require("awful")
local theme = require("beautiful")
local wibox = require("wibox")
local common = require("utils.common")

local _M = function(s)

    local layout_buttons = {
        awful.button({ }, 1, function() awful.layout.inc( 1) end),
        awful.button({ }, 3, function() awful.layout.inc(-1) end),
    }

    local layoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = layout_buttons,
    }

    local layout_widget = wibox.container.background(
        wibox.container.margin(
            layoutbox,
            theme.margins,
            theme.margins,
            theme.margins,
            theme.margins
        )
    )

    layout_widget:connect_signal("mouse::enter", common.on_hover_color)
    layout_widget:connect_signal("mouse::leave", common.on_unhover_color)

    return layout_widget
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
