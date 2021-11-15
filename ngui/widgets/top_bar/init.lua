local awful = require('awful')
local theme = require('beautiful')
local dpi = theme.xresources.apply_dpi
local wibox = require('wibox')

local _M = function(s)

    local launcher = require('widgets.top_bar.launcher')()
    local keyboardlayout = require('widgets.top_bar.keyboard')()
    local textclock = require('widgets.top_bar.clock')()
    local leaver = require('modules.leaver.widgets.wibar')()
    s.prompt = require('widgets.top_bar.prompt')(s)
    s.layoutbox = require('widgets.top_bar.layout')(s)
    s.taglist = require('widgets.top_bar.taglist')(s)
    s.tasklist = require('widgets.top_bar.tasklist')(s)
    s.systray = require('widgets.top_bar.systray')

    return awful.wibar {
        screen       = s,
        position     = 'top',
        height       = dpi(24),
        border_width = theme.border_width,
        border_color = theme.wibar_bg,
        opacity      = theme.opacity,
        widget   = {
            {
                {
                    launcher,
                    s.taglist,
                    s.layoutbox,
                    s.prompt,
                    layout = wibox.layout.fixed.horizontal,
                    spacing = dpi(4),
                },
                {
                    {
                        s.tasklist,
                        layout = wibox.layout.align.horizontal,
                        fill_space = false,
                    },
                    widget = wibox.container.margin,
                    left = dpi(1),
                    right = dpi(4),
                },
                {
                    keyboardlayout,
                    s.systray,
                    textclock,
                    leaver,
                    layout = wibox.layout.fixed.horizontal,
                    spacing = dpi(4),
                },
                layout = wibox.layout.align.horizontal,
                spacing = dpi(0),
            },
            widget = wibox.container.margin,
            margins = dpi(2),
        }
    }
end

return _M
