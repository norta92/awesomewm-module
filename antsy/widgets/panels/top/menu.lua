------------------------------------------------------------------------------
----- Main menu widget.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @themevars
----    theme.menu_button_icon
----    theme.menu_button_width
----    theme.menu_button_fg
----    theme.menu_button_bg
----    theme.menu_button_border_color
----    theme.menu_button_border_width
------------------------------------------------------------------------------

local awful = require('awful')
local theme = require('beautiful')
local wibox = require('wibox')
local container = require('widgets.clickable-container')
local menu_position = require('utils').set_menu_position

local _M = function()

    local menu_icon = wibox.widget {
        id = 'icon',
        image = theme.menu_button_icon,
        widget = wibox.widget.imagebox,
        resize = false,
    }

    local menu_buttons = {
        awful.button({ }, 1, function()
            local pos = menu_position('tl')
            _G.menus.main:toggle({coords=pos})
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
        widget = container,
        buttons = menu_buttons,
    }

    return menu_widget
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
