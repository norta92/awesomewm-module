local theme = require('beautiful')
local gears = require('gears')
local wibox = require('wibox')

local _M = function(widget)

    local container = wibox.widget {
        widget,
        widget = wibox.container.background,
        fg = theme.button_fg,
        bg = theme.button_bg,
        border_color = theme.button_border_color,
        border_width = theme.button_border_width,
        shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, theme.border_radius)
        end,
    }

    container:connect_signal('mouse::enter', function()
        container.fg = theme.button_fg_hover
        container.bg = theme.button_bg_hover
        container.border_color = theme.button_border_color_hover
    end)

    container:connect_signal('mouse::leave', function()
        container.fg = theme.button_fg
        container.bg = theme.button_bg
        container.border_color = theme.button_border_color
    end)

    container:connect_signal('button::press', function()
        container.fg = theme.button_fg_pressed
        container.bg = theme.button_bg_pressed
        container.border_color = theme.button_border_color_pressed
    end)

    container:connect_signal('button::release', function()
        container.fg = theme.button_fg
        container.bg = theme.button_bg
        container.border_color = theme.button_border_color
    end)

    return container
end

return _M
