
local awful = require("awful")
local wibox = require("wibox")

local mylauncher = require('widgets.top_bar.launcher')()
local mykeyboardlayout = require('widgets.top_bar.keyboard')()
local mytextclock = require('widgets.top_bar.clock')()

screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    s.mypromptbox = require('widgets.top_bar.prompt')(s)
    s.mylayoutbox = require('widgets.top_bar.layout')(s)
    s.mytaglist = require('widgets.top_bar.taglist')(s)
    s.mytasklist = require('widgets.top_bar.tasklist')(s)

    s.mywibox = awful.wibar {
        position = "top",
        screen   = s,
        widget   = {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                mylauncher,
                s.mytaglist,
                s.mypromptbox,
            },
            s.mytasklist, -- Middle widget
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                mykeyboardlayout,
                wibox.widget.systray(),
                mytextclock,
                s.mylayoutbox,
            },
        }
    }
end)
