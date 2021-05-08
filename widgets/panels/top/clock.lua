local awful = require("awful")
local theme = require("beautiful")
local wibox = require("wibox")
local calendar = require("awful.widget.calendar_popup").month()
local mod = require("config.bindings.mod")

-- theme.margins
-- theme.hover_color

local clock = function(s)

    local textclock = wibox.widget.textclock()

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

    calendar:attach(clock_widget, "tr")

    clock_widget:connect_signal("mouse::enter", function(widget)
        if widget.bg ~= theme.hover_color then
            widget.backup = widget.bg
            widget.has_backup = true
        end
        widget.bg = theme.hover_color
    end)

    clock_widget:connect_signal("mouse::leave", function(widget)
        if widget.has_backup then widget.bg = widget.backup end
    end)

    awful.keyboard.append_global_keybindings({
        awful.key({ mod.super, mod.alt }, "i", function()
            calendar:call_calendar(0, "tr", s)
        end,
        {description = "Toggle systray", group = "Awesome: widgets"})
    })

    return clock_widget
end

return clock

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80:foldmethod=marker
