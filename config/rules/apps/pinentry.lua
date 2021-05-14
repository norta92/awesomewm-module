
local awful = require("awful")
local ruled = require("ruled")

ruled.client.connect_signal("request::rules", function()
    ruled.client.append_rule {
        id       = "floating",
        rule_any = {
            instance = { "pinentry-gtk-2" },
            class = { "Pinentry-gtk-2" },
        },
        properties = {
            focus     = awful.client.focus.filter,
            raise     = true,
            screen    = awful.screen.preferred,
            placement = awful.placement.centered,
        }
    }
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
