local awful = require("awful")

local client = client

client.connect_signal("request::manage", function(c)
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
