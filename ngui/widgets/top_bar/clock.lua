local awful = require('awful')
local theme = require('beautiful')
local dpi = theme.xresources.apply_dpi
local wibox = require('wibox')
local container = require('widgets.buttons.gtk')
local calendar = require('awful.widget.calendar_popup').month()

local vars = _G.cfg.vars.top_bar.clock
local _V = {
    calendar = vars.show_calendar or false,
}

local _M = function()

    local textclock = wibox.widget.textclock(' %a %b %d, %H:%M ', 30)

    local widget = wibox.widget {
        {
            {
                textclock,
                widget = wibox.container.margin,
                left    = dpi(4),
                right   = dpi(4),
                top     = dpi(2),
                bottom  = dpi(2),
            },
            layout = wibox.layout.align.vertical,
        },
        widget = container,
    }

    if _V.calendar then
        function calendar.call_calendar(self, offset, position, _)
            local focus_screen = awful.screen.focused()
            awful.widget.calendar_popup.call_calendar(self, offset, position, focus_screen)
        end

        calendar:attach(widget, 'tr', { on_hover=false })
        calendar.opacity = theme.opacity
    end

    return widget
end

return _M
