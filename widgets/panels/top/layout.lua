----------------------------------------------------------------------------
----- Layout indicator widget.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module widgets.panels.top.layout
------------------------------------------------------------------------------

local awful = require("awful")
local theme = require("beautiful")
local wibox = require("wibox")
local container = require("widgets.clickable-container")

local _M = function(s)

    local layout_buttons = {
        awful.button({ }, 1, function() awful.layout.inc( 1) end),
        awful.button({ }, 3, function() awful.layout.inc(-1) end),
    }

    local layoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = layout_buttons,
    }

    local layout_widget = container(
        wibox.container.margin(
            layoutbox,
            theme.margins,
            theme.margins,
            theme.margins,
            theme.margins
        )
    )

    return layout_widget
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
