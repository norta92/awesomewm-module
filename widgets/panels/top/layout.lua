local awful = require("awful")
local theme = require("beautiful")
local wibox = require("wibox")

-- theme.margins
-- theme.hover_color

local layoutbox = function(s)

    local layout_buttons = {
        awful.button({ }, 1, function () awful.layout.inc( 1) end),
        -- TODO: popup layout list of middle-click
        awful.button({ }, 3, function () awful.layout.inc(-1) end),
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

    layout_widget:connect_signal("mouse::enter", function(widget)
        if widget.bg ~= theme.hover_color then
            widget.backup = widget.bg
            widget.has_backup = true
        end
        widget.bg = theme.hover_color
    end)

    layout_widget:connect_signal("mouse::leave", function(widget)
        if widget.has_backup then
            widget.bg = widget.backup
        end
    end)

    return layout_widget
end

return layoutbox

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80:foldmethod=marker
