----------------------------------------------------------------------------
----- Tasklist widget.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module widgets.panels.top.tasklist
------------------------------------------------------------------------------

local awful = require("awful")
local theme = require("beautiful")
local dpi = theme.xresources.apply_dpi
local wibox = require("wibox")
local container = require("widgets.clickable-container")

local _M = function(s)

    local task_buttons = {
        awful.button({ }, 1, function(c)
            c:activate {
                context = "tasklist",
                action = "toggle_minimization",
            }
        end),
        awful.button({ }, 3, function()
            awful.menu.client_list {
                theme = { width = theme.menu_width }
            }
        end),
        awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
        awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
    }

    local task_layout = {
        max_widget_size = theme.tasklist_item_width,
        layout = wibox.layout.flex.horizontal,
    }

    local task_template = {
        {
            nil,
            {
                {
                    {
                        id     = "icon_role",
                        widget = wibox.widget.imagebox,
                        resize = true,
                    },
                    {
                        id     = "text_role",
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                    spacing = dpi(4),
                },
                widget = wibox.container.margin,
                left    = dpi(4),
                right   = dpi(4),
                top     = dpi(1),
                bottom  = dpi(1),
            },
            {
                wibox.widget.base.make_widget(),
                forced_height = theme.border_width,
                id            = "background_role",
                widget        = wibox.container.background,
            },
            layout = wibox.layout.align.vertical,
        },
        widget = container,
    }

    local task_widget = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = task_buttons,
        layout = task_layout,
        widget_template = task_template,
        max_widget_size = theme.task_width,
    }
    return task_widget
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
