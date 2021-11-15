local awful = require('awful')
local theme = require('beautiful')
local wibox = require('wibox')
local container = require('widgets.buttons.gtk')
local menu_position = require('utils.menus').set_menu_position
local mod = require('bindings.mod')

local _M = function()

    local icon = wibox.widget {
        id = 'icon',
        image = theme.leaver_button_icon,
        widget = wibox.widget.imagebox,
        resize = true,
    }

    local buttons = {
        awful.button({ }, 1, function()
            local pos = menu_position('tr')
            _G.menus.leaver:toggle({coords=pos})
        end),
    }

    local widget = wibox.widget {
        {
            widget = icon,
            forced_width = theme.menu_height,
            valign = 'center',
            halign = 'center',
        },
        fg = theme.button_fg,
        bg = theme.button_bg,
        widget = container,
        buttons = buttons,
    }

    return widget
end

awful.keyboard.append_global_keybindings({
    awful.key({ mod.super, mod.ctrl }, 'q', function()
            local pos = menu_position('tr')
            _G.menus.leaver:show({coords=pos})
        end,
              {description = 'show session menu', group = 'Awesome: core'}),
})

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
