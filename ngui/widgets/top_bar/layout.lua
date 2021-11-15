local awful = require('awful')
local theme = require('beautiful')
local dpi = theme.xresources.apply_dpi
local wibox = require('wibox')
local container = require('widgets.buttons.gtk')

local _M = function(s)

    local buttons = {
        awful.button({ }, 1, function () awful.layout.inc( 1) end),
        awful.button({ }, 3, function () awful.layout.inc(-1) end),
        awful.button({ }, 4, function () awful.layout.inc(-1) end),
        awful.button({ }, 5, function () awful.layout.inc( 1) end),
    }

    local layoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = buttons,
    }

    local widget = wibox.widget {
        {
            layoutbox,
            widget = wibox.container.margin,
            margins = dpi(3),
        },
        widget = container,
    }

    return widget
end

return _M
