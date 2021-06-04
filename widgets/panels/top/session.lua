local awful = require("awful")
local theme = require("beautiful")
local wibox = require("wibox")
local common = require("utils.common")

local _M = function()

    local session_icon = wibox.widget {
        id = 'icon',
        image = theme.session_button_icon,
        widget = wibox.widget.imagebox,
        resize = true,
    }

    local session_buttons = {
        awful.button({ }, 1, function()
            local pos = common.session_position()
            _G.session_menu:toggle({coords=pos})
        end),
    }

    local session_widget = wibox.widget {
        {
            widget = session_icon,
            forced_width = theme.session_button_width,
            valign = 'center',
            halign = 'center',
        },
        fg = theme.session_button_fg,
        bg = theme.session_button_bg,
        border_color = theme.session_button_border_color,
        border_width = theme.session_button_border_width,
        widget = wibox.container.background,
        buttons = session_buttons,
    }

    session_widget:connect_signal("mouse::enter", common.on_hover_color)
    session_widget:connect_signal("mouse::leave", common.on_unhover_color)

    return session_widget
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
