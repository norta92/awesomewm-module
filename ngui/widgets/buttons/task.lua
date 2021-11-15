local theme = require('beautiful')
local gears = require('gears')
local wibox = require('wibox')

local _M = function(widget)

    local container = wibox.widget {
        widget,
        widget = wibox.container.background,
        bg = theme.button_bg,
        border_color = theme.button_border_color,
        border_width = theme.button_border_width,
        shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, theme.border_radius)
        end,
    }

    container:connect_signal('mouse::enter', function()
        container.border_color = theme.button_border_color_hover
    end)

    container:connect_signal('mouse::leave', function()
        container.border_color = theme.button_border_color
    end)

    return container
end

return _M
