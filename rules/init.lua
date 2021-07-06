------------------------------------------------------------------------------
----- Rules configuration
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module rules
------------------------------------------------------------------------------

local awful = require("awful")
local ruled = require("ruled")

ruled.client.connect_signal("request::rules", function()

    -- Matches all clients
    ruled.client.append_rule {
        id         = "global",
        rule       = { },
        properties = {
            focus     = awful.client.focus.filter,
            raise     = true,
            screen    = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    }

    -- Additional rules
    require("rules.dynamic_opacity")

    -- App-specific rules
    require("rules.apps.urxvt")()
    require("rules.apps.pinentry")()
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
