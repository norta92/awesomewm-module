------------------------------------------------------------------------------
----- Titlebar widget.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module widgets.titlebars
---- @themevars
----    theme.margins
----    theme.titlebar_bg_normal
----    theme.titlebar_bg_transparent
----    theme.titlebar_height
------------------------------------------------------------------------------

local awful = require('awful')
local theme = require('beautiful')
local wibox = require('wibox')
local mod = require('bindings.mod')

--- Create titlebar for client.
-- @param c Titlebar to create client for.
local _M = function(c)

    -- Allow clients to request transparent titlebar.
    local bg_color = theme.titlebar_bg_normal
    if c.transparent_titlebar then
        bg_color = theme.titlebar_bg_transparent
    end

    -- Mouse clicks
    local buttons = {
        -- Left-click, move client.
        awful.button({ }, 1, function()
            c:activate { context = 'titlebar', action = 'mouse_move'  }
        end),
        -- Middle-click, maximize client.
        awful.button({ }, 2, function()
            c.maximized = not c.maximized
            c:activate { context = 'titlebar', raise = true }
        end),
        -- Crtl + middle-click, maximize client vertically.
        awful.button({ mod.ctrl }, 2, function()
            c.maximized_vertical = not c.maximized_vertical
            c:activate { context = 'titlebar', raise = true }
        end),
        -- Shift + middle-click, maximize client horizontally.
        awful.button({ mod.shift }, 2, function()
            c.maximized_horizontal = not c.maximized_horizontal
            c:activate { context = 'titlebar', raise = true }
        end),
        -- Right click, resize client.
        awful.button({ }, 3, function()
            c:activate { context = 'titlebar', action = 'mouse_resize'}
        end),
    }

    -- Define widget
    awful.titlebar(c, {
            size = theme.titlebar_height,
            bg_normal = bg_color,
            bg_focus = bg_color,
        }).widget = {
        { -- Left
            { -- Client icon
                awful.titlebar.widget.iconwidget(c),
                buttons = buttons,
                layout = wibox.layout.fixed.horizontal
            },
            margins = theme.margins,
            widget = wibox.container.margin
        },
        { -- Middle
            { -- Title
                align = 'center',
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout = wibox.layout.flex.horizontal
        },
        { -- Right
            { -- Minimize, maximize, and close buttons.
                awful.titlebar.widget.minimizebutton(c),
                awful.titlebar.widget.maximizedbutton(c),
                awful.titlebar.widget.closebutton(c),
                layout = wibox.layout.fixed.horizontal()
            },
            margins = theme.margins,
            widget = wibox.container.margin
        },
        layout = wibox.layout.align.horizontal
    }
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
