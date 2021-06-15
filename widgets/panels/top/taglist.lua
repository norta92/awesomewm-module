local awful = require("awful")
local theme = require("beautiful")
local dpi = theme.xresources.apply_dpi
local wibox = require("wibox")
local mod = require("bindings.mod")
local utils = require("utils")

local client = client

local _M = function(s)

    local tag_buttons = {
        awful.button({ }, 1, function(t)
            t:view_only() end),
        awful.button({ mod.super }, 1, function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end),
        awful.button({ }, 3, awful.tag.viewtoggle),
        awful.button({ mod.super }, 3, function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end),
    }

    local tag_layout = {
        layout = wibox.layout.flex.horizontal
    }

    local function hover_callback(widget)
        widget:connect_signal("mouse::enter", utils.on_hover_color)
        widget:connect_signal("mouse::leave", utils.on_unhover_color)
    end

    local tag_template = {
        {
            nil,
            {
                {
                    {
                        id     = "index_role",
                        widget = wibox.widget.textbox,
                    },
                    {
                        id     = "text_role",
                        widget = wibox.widget.textbox,
                        align = "center",
                    },
                    layout = wibox.layout.fixed.horizontal,
                    fill_space = true,
                },
                widget= wibox.container.margin,
                left = dpi(4),
                right = dpi(4),
            },
            {
                wibox.widget.base.make_widget(),
                forced_height = theme.border_width,
                forced_width  = theme.taglist_width,
                id            = "background_role",
                widget        = wibox.container.background,
            },
            layout = wibox.layout.align.vertical,
        },
        widget = wibox.container.background,
        create_callback = hover_callback,
    }

    local tag_widget = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = tag_buttons,
        layout  = tag_layout,
        widget_template = tag_template,
    }
    return tag_widget
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
