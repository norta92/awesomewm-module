local awful = require('awful')
local theme = require('beautiful')
local dpi = theme.xresources.apply_dpi
local wibox = require('wibox')

local cfg_vars = _G.cfg.vars.top_bar

local _M = function(s, kwargs)
    local args = cfg_vars or kwargs or {}
    --local 

    --local launcher = 
    --local keyboard = require('widgets.top_bar.keyboard')()
    --local clock = require('widgets.top_bar.clock')()
    --local leaver = require('modules.leaver.widgets.wibar')()
    --s.prompt = require('widgets.top_bar.prompt')(s)
    --s.layout = require('widgets.top_bar.layout')(s)
    --s.taglist = require('widgets.top_bar.taglist')(s)
    --s.tasklist = require('widgets.top_bar.tasklist')(s)
    --s.systray = require('widgets.top_bar.systray')()

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
                    require('widgets.top_bar.launcher')(),
                    require('widgets.top_bar.taglist')(s),
                    require('widgets.top_bar.layout')(s),
                    require('widgets.top_bar.prompt')(s),
                    layout = wibox.layout.fixed.horizontal,
                    spacing = dpi(4),
                },
                {
                    {
                        require('widgets.top_bar.tasklist')(s),
                        layout = wibox.layout.align.horizontal,
                        fill_space = false,
                    },
                    widget = wibox.container.margin,
                    left = dpi(1),
                    right = dpi(4),
                },
                {
                    require('widgets.top_bar.keyboard')(),
                    require('widgets.top_bar.systray')(),
                    require('widgets.top_bar.clock')(),
                    require('modules.leaver.widgets.wibar')(),
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
