------------------------------------------------------------------------------
----- Container with hover and click events.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local theme = require('beautiful')
local wibox = require('wibox')

local mouse = mouse

--- Wrap widget in background, connect signals to change bg color.
-- @param w The widget to be wrapped.
local _M = function(w)

    -- Wrap original widget.
    local widget = wibox.widget {
        w,
        widget = wibox.container.background,
    }
    local old_wibox

    -- Hover begin
    widget:connect_signal('mouse::enter', function()
        widget.bg = theme.hover_color
        local cur_wibox = mouse.current_wibox
        if w then
            old_wibox = cur_wibox
        end
    end)

    -- Hover end.
    widget:connect_signal('mouse::leave', function()
        widget.bg = theme.no_color
        if old_wibox then
            old_wibox = nil
        end
    end)

    -- Click begin.
    widget:connect_signal('button::press', function()
        widget.bg = theme.click_color
    end)

    -- Click end.
    widget:connect_signal('button::release', function()
        widget.bg = theme.hover_color
    end)

    return widget
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
