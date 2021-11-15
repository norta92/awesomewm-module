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
local gears = require('gears')
local timer = gears.timer
local wibox = require('wibox')
local mod = require('bindings.mod')
local container = require('widgets.clickable-container')

local tonumber = tonumber

local vars = _G.conf.vars.panels.top.systray
local _V = {
    auto_hide = vars.auto_hide or nil,
}

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
    image = theme.systray_visible_icon,
    resize = false,
    widget = wibox.widget.imagebox,
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
    widget = container,
}

--- If auto_hide enabled, create timer
local create_hide_timer = function()
    if _V.auto_hide then
        local timeout = tonumber(_V.auto_hide)
        timer.start_new(timeout, function()
            toggle_button:emit_signal("systray_toggle")
        end)
    end
end

--- Setup signal
toggle_button:connect_signal("systray_toggle", function()
    systray.visible = not systray.visible
    if systray.visible then
        toggle_button:set_image(theme.systray_visible_icon)
        create_hide_timer()
    else
        toggle_button:set_image(theme.systray_hidden_icon)
    end
end)

--- Add mouse bindings
toggle_button:buttons(gears.table.join(
    awful.button({}, 1, function()
        toggle_button:emit_signal("systray_toggle")
    end)
))

--- Add key bindings
awful.keyboard.append_global_keybindings({
    awful.key({ mod.super, mod.alt }, 's', function()
        toggle_button:emit_signal("systray_toggle")
    end,
    {description = 'toggle systray', group = 'Awesome: extras'})
})

--- Hide at startup
if _V.auto_hide then
    toggle_button:emit_signal("systray_toggle")
end

return awful.widget.only_on_screen(systray_widget, 'primary')

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
