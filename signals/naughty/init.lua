------------------------------------------------------------------------------
----- Connect naughty signals.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module signals.naughty
------------------------------------------------------------------------------

local awful = require('awful')
local naughty = require('naughty')
local theme = require('beautiful')
local get_icon = require('signals.naughty.get_icon')

-- Load notification widget
require("widgets.notifications")

--- Error handling.
-- @param message
-- @param startup
naughty.connect_signal('request::display_error', function(message, startup)
    naughty.notification {
        app_name = 'AwesomeWM',
        urgency = 'critical',
        title   = 'Oops, an error happened'..(startup and ' during startup!' or '!'),
        message = message,
        icon = theme.awesome_notification_icon,
    }
end)

--- When new notifications are added.
-- @param n
naughty.connect_signal("added", function(n)
    require('signals.naughty.history')(n)
end)

--- When notification icon is requested.
-- @param n
-- @param context
-- @param hints
naughty.connect_signal('request::icon', function(n, context, hints)
    n.icon = get_icon(context, hints)
end)

--- When notification requests to be displayed.
-- @param n
naughty.connect_signal('request::display', function(n)
    -- Call notification widget
    require('widgets.notifications')(n)

    local focused = awful.screen.focused()
    if _G.dont_disturb_state or (focused.info_center and focused.info_center.visible) then
        naughty.destroy_all_notifications(nil, 1)
    end
end)
-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
