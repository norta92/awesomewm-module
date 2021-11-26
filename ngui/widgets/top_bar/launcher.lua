local awful = require('awful')
local theme = require('beautiful')
local wibox = require('wibox')
local container = require('widgets.buttons.gtk')
local menu_position = require('utils.menus').set_menu_position

local cfg_vars = _G.cfg.vars.top_bar.launcher

local _M = function(kwargs)
    local args = cfg_vars or kwargs or {}
    local menu_pos = args.menu_pos or 'tl'

    local icon = wibox.widget {
        id = 'icon',
        image = theme.menu_button_icon,
        widget = wibox.widget.imagebox,
        resize = true,
    }

    local buttons = {
        awful.button({ }, 1, function()
            _G.menus.main:toggle({coords=menu_position(menu_pos)})
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
