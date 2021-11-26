local awful = require('awful')
local theme = require('beautiful')
local dpi = theme.xresources.apply_dpi
local wibox = require('wibox')
local container = require('widgets.buttons.task')

local cfg_vars = _G.cfg.vars.top_bar.tasklist

local _M = function(screen, kwargs)
    local s = screen
    local args = cfg_vars or kwargs or {}
    local button_width = args.button_width or theme.tasklist_button_width or dpi(240)
    local menu_width = args.menu_width or theme.tasklist_menu_width or dpi(160)

    local buttons = {
        awful.button({ }, 1, function (c)
            c:activate { context = 'tasklist', action = 'toggle_minimization' }
        end),
        awful.button({ }, 3, function() awful.menu.client_list { theme = { width = menu_width } } end),
        awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
        awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
    }

    local layout = {
        layout = wibox.layout.flex.horizontal,
        spacing = dpi(4),
    }

    local widget_template = {
        {
            nil,
            {
                {
                    {
                        {
                            id     = 'icon_role',
                            resize = true,
                            widget = wibox.widget.imagebox,
                        },
                        widget = wibox.container.margin,
                        margins = dpi(2),
                    },
                    {
                        id     = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                    spacing = dpi(4),
                },
                widget = wibox.container.margin,
                left = dpi(4),
                right = dpi(6),
            },
            {
                wibox.widget.base.make_widget(),
                id = 'background_role',
                widget = wibox.container.background,
                forced_height = dpi(2),
            },
            layout = wibox.layout.align.vertical,
        },
        widget = container,
        forced_width = button_width,
    }

    return awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        layout  = layout,
        buttons = buttons,
        widget_template = widget_template,
    }
end

return _M
