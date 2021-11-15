local awful = require('awful')
local theme = require('beautiful')
local wibox = require('wibox')
local container = require('widgets.buttons.gtk')
local menu_position = require('utils.menus').set_menu_position

local _M = function()

    local icon = wibox.widget {
        id = 'icon',
        image = theme.menu_button_icon,
        widget = wibox.widget.imagebox,
        resize = true,
    }

    local buttons = {
        awful.button({ }, 1, function()
            local pos = menu_position('tl')
            _G.menus.main:toggle({coords=pos})
        end),
    }

    local widget = wibox.widget {
        {
            widget = icon,
            forced_width = theme.menu_button_width,
            valign = 'center',
            halign = 'center',
        },
        widget = container,
        buttons = buttons,
    }

    return widget
end

return _M
