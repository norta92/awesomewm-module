local awful = require("awful")

-- Prevent clients from being unreachable after screen count changes.
client.connect_signal("request::manage", function (c)
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)
