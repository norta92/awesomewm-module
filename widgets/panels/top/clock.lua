------------------------------------------------------------------------------
----- Clock widget with popup calendar.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @themevars
----    theme.margins
----    theme.panel_opacity
------------------------------------------------------------------------------

local awful = require('awful')
local theme = require('beautiful')
local wibox = require('wibox')
local container = require('widgets.clickable-container')
local calendar = require('awful.widget.calendar_popup').month()

local _M = function()

    local textclock = wibox.widget.textclock('%a %b %d, %H:%M', 30)

    local clock_widget = wibox.widget {
        {
            nil,
            {
                {
                    widget = textclock,
                },
                widget = wibox.container.margin,
                margins = theme.margins,
            },
            layout = wibox.layout.align.vertical,
        },
        widget = container,
    }

    function calendar.call_calendar(self, offset, position, _)
        local screen = awful.screen.focused()
        awful.widget.calendar_popup.call_calendar(self, offset, position, screen)
    end

    calendar:attach(clock_widget, 'tr', {on_hover=false})
    calendar.opacity = theme.panel_opacity

    return clock_widget
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
