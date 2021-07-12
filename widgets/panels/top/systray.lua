------------------------------------------------------------------------------
----- Systray widget.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @themevars
----    theme.margins
----    theme.systray_visible
----    theme.systray_hidden
----    theme.panel_margin
------------------------------------------------------------------------------

local awful = require('awful')
local theme = require('beautiful')
local dpi = theme.xresources.apply_dpi
local gears = require('gears')
local wibox = require('wibox')
local mod = require('bindings.mod')
local container = require('widgets.clickable-container')

local systray = wibox.widget {
    {
        widget = wibox.widget.systray
    },
    visible = true,
    left = theme.margins,
    widget = wibox.container.margin,
}

local toggle_button = wibox.widget {
    id = 'icon',
    image = theme.systray_visible,
    widget = wibox.widget.imagebox,
    resize = false,
}

local toggle_widget = wibox.widget {
    {
        widget = toggle_button,
    },
    widget = wibox.container.background
}

local systray_widget = wibox.widget {
    {
        {
            toggle_widget,
            systray,
            layout = wibox.layout.fixed.horizontal,
        },
        left = theme.panel_margin,
        right = theme.panel_margin,
        top = theme.panel_margin,
        bottom = theme.panel_margin,
        widget = wibox.container.margin
    },
    border_width = dpi(0),
    widget = container,
}

toggle_button:buttons(
    gears.table.join(
        awful.button({}, 1, function()
            systray.visible = not systray.visible
            if systray.visible then
                toggle_button:set_image(theme.systray_visible)
            else
                toggle_button:set_image(theme.systray_hidden)
            end
        end)
    )
)

awful.keyboard.append_global_keybindings({
    awful.key({ mod.super, mod.alt }, 's', function()
        systray.visible = not systray.visible
        if systray.visible then
            toggle_button:set_image(theme.systray_visible)
        else
            toggle_button:set_image(theme.systray_hidden)
        end
    end,
    {description = 'toggle systray', group = 'Awesome: extras'})
})

return awful.widget.only_on_screen(systray_widget, 'primary')

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
