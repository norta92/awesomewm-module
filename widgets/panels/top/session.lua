------------------------------------------------------------------------------
----- Prompt widget.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')
local theme = require('beautiful')
local wibox = require('wibox')
local container = require('widgets.clickable-container')
local menu_position = require('utils').set_menu_position

local _M = function()

    local session_icon = wibox.widget {
        id = 'icon',
        image = theme.session_button_icon,
        widget = wibox.widget.imagebox,
        resize = true,
    }

    local session_buttons = {
        awful.button({ }, 1, function()
            local pos = menu_position('tr')
            _G.menus.session:toggle({coords=pos})
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
        widget = container,
        buttons = session_buttons,
    }

    return session_widget
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
