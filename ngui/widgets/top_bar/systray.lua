local awful = require('awful')
local theme = require('beautiful')
local dpi = require("beautiful.xresources").apply_dpi
local gears = require('gears')
local timer = gears.timer
local wibox = require('wibox')
local mod = require('bindings.mod')
local container = require('widgets.buttons.gtk')

local cfg_vars = _G.cfg.vars.top_bar.systray

local _M = function(kwargs)
    local args = cfg_vars or kwargs or {}
    local auto_hide = args.auto_hide or false

    local systray = wibox.widget {
        {
            widget = wibox.widget.systray
        },
        widget = wibox.container.margin,
        left = theme.systray_icon_spacing,
        visible = true,
    }

    local toggle_button = wibox.widget {
        {
            widget = wibox.widget.imagebox,
            id = 'icon',
            image = theme.systray_visible_icon,
            resize = true,
        },
        widget = wibox.container.margin,
        margins = dpi(2),
    }

    local toggle_widget = wibox.widget {
        {
            widget = toggle_button,
        },
        widget = container,
    }

    local systray_widget = wibox.widget {
        toggle_widget,
        systray,
        layout = wibox.layout.fixed.horizontal,
        spacing = dpi(2),
    }

    local create_hide_timer = function()
        if auto_hide then
            local timeout = tonumber(_V.auto_hide)
            timer.start_new(timeout, function()
                toggle_button:emit_signal("systray_toggle")
            end)
        end
    end

    toggle_button:connect_signal("systray_toggle", function(self)
        local icon = self:get_children_by_id('icon')[1]
        systray.visible = not systray.visible
        if systray.visible then
            icon:set_image(theme.systray_visible_icon)
            create_hide_timer()
        else
            icon:set_image(theme.systray_hidden_icon)
        end
    end)

    toggle_button:buttons(gears.table.join(
        awful.button({}, 1, function()
            toggle_button:emit_signal("systray_toggle")
        end)
    ))

    awful.keyboard.append_global_keybindings({
        awful.key({ mod.super, mod.alt }, 's', function()
            toggle_button:emit_signal("systray_toggle")
        end,
        {description = 'toggle systray', group = 'Awesome: extras'})
    })

    if auto_hide then
        toggle_button:emit_signal("systray_toggle")
    end

    return awful.widget.only_on_screen(systray_widget, 'primary')
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
