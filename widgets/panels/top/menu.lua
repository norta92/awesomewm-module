local awful = require("awful")
local theme = require("beautiful")
local dpi = theme.xresources.apply_dpi
local wibox = require("wibox")
require("ui.menus")

-- theme.launcher_icon
-- theme.hover_color

local menu_icon = wibox.widget {
    id = 'icon',
    image = theme.launcher_icon,
    widget = wibox.widget.imagebox,
    resize = false,
}

local menu_buttons = {
    awful.button({ }, 1, function()
        _G.main_menu:toggle({coords={x=0, y=0}})
    end),
}
local menu_widget = wibox.widget {
    {
        widget = menu_icon,
        forced_width = dpi(36),
        valign = 'center',
        halign = 'center',
    },
    widget = wibox.container.background,
    buttons = menu_buttons,
}

menu_widget:connect_signal("mouse::enter", function(widget)
    if widget.bg ~= theme.hover_color then
        widget.backup = widget.bg
        widget.has_backup = true
    end
    widget.bg = theme.hover_color
end)

menu_widget:connect_signal("mouse::leave", function(widget)
    if widget.has_backup then widget.bg = widget.backup end
end)

return menu_widget

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80:foldmethod=marker
