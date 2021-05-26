local awful = require("awful")
local theme = require("beautiful")
local wibox = require("wibox")
local common = require("utils.common")
local main_menu = require("widgets.menus").main()

-- theme.menu_button_icon
-- theme.menu_button_width
-- theme.menu_button_fg
-- theme.menu_button_bg
-- theme.menu_button_border_color
-- theme.menu_button_border_width

local menu_icon = wibox.widget {
    id = 'icon',
    image = theme.menu_button_icon,
    widget = wibox.widget.imagebox,
    resize = false,
}

local menu_buttons = {
    awful.button({ }, 1, function()
        main_menu:toggle({coords={x=0, y=0}})
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

menu_widget:connect_signal("mouse::enter", common.on_hover_color)

menu_widget:connect_signal("mouse::leave", common.on_unhover_color)

return menu_widget

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
