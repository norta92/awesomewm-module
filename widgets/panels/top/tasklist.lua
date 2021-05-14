local awful = require("awful")
local theme = require("beautiful")
local dpi = theme.xresources.apply_dpi
local wibox = require("wibox")
local common = require("utils.common")

-- theme.border_width
-- theme.tasklist_item_width
-- theme.menu_width
-- theme.margins
-- theme.spacing

local tasklist = function(s)

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

    local function hover_callback(widget)
        widget:connect_signal("mouse::enter", common.on_hover_color)
        widget:connect_signal("mouse::leave", common.on_unhover_color)
    end

    local task_template = {
        {
            nil,
            {
                {
                    {
                        id     = "icon_role",
                        widget = wibox.widget.imagebox,
                    },
                    {
                        id     = "text_role",
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                    spacing = dpi(4),
                },
                widget = wibox.container.margin,
                left  = dpi(4),
                right = dpi(4),
            },
            {
                wibox.widget.base.make_widget(),
                forced_height = theme.border_width,
                id            = "background_role",
                widget        = wibox.container.background,
            },
            layout = wibox.layout.align.vertical,
        },
        widget = wibox.container.background,
        create_callback = hover_callback,
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

return tasklist

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
