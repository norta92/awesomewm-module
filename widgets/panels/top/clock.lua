local awful = require("awful")
local theme = require("beautiful")
local wibox = require("wibox")
local calendar = require("awful.widget.calendar_popup").month()
local common = require("utils.common")

-- theme.margins
-- theme.panel_opacity

local clock = function()

    local textclock = wibox.widget.textclock(nil, 30)

    local clock_widget = wibox.widget {
        {
            nil,
            {
                {
                    widget = textclock,
                },
                margins = theme.margins,
                widget = wibox.container.margin,
            },
            layout = wibox.layout.align.vertical,
        },
        widget = wibox.container.background,
    }

    function calendar.call_calendar(self, offset, position, _)
        local screen = awful.screen.focused()
        awful.widget.calendar_popup.call_calendar(self, offset, position, screen)
    end

    calendar:attach(clock_widget, "tr", {on_hover=false})
    calendar.opacity = theme.panel_opacity

    clock_widget:connect_signal("mouse::enter", common.on_hover_color)

    clock_widget:connect_signal("mouse::leave", common.on_unhover_color)

    return clock_widget
end

return clock

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
