local awful = require("awful")
local theme = require("beautiful")
local wibox = require("wibox")
local utils = require("utils")
local menu_position = require("utils").set_menu_position

local _M = function()

    local menu_icon = wibox.widget {
        id = 'icon',
        image = theme.menu_button_icon,
        widget = wibox.widget.imagebox,
        resize = false,
    }

    local menu_buttons = {
        awful.button({ }, 1, function()
            local pos = menu_position("tl")
            _G.main_menu:toggle({coords=pos})
        end),
    }

    local menu_widget = wibox.widget {
        {
            widget = menu_icon,
            forced_width = theme.menu_button_width,
            valign = 'center',
            halign = 'center',
        },
        fg = theme.menu_button_fg,
        bg = theme.menu_button_bg,
        border_color = theme.menu_button_border_color,
        border_width = theme.menu_button_border_width,
        widget = wibox.container.background,
        buttons = menu_buttons,
    }

    menu_widget:connect_signal("mouse::enter", utils.on_hover_color)
    menu_widget:connect_signal("mouse::leave", utils.on_unhover_color)

    return menu_widget
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
