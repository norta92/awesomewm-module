local awful = require("awful")
local mod = require("config.bindings.mod")

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ mod.super, mod.ctrl }, "c", function(c) c:kill() end,
                {description = "close", group = "Awesome: client"}),
        awful.key({ mod.super, mod.shift }, "p", function(c) c:swap(awful.client.getmaster()) end,
                {description = "move to master", group = "Awesome: client"}),
        awful.key({ mod.super, mod.shift }, "o", function(c) c:move_to_screen() end,
                {description = "move to screen", group = "Awesome: client"}),
        awful.key({ mod.super, mod.ctrl }, "f",
            function(c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "Awesome: client"}),
        awful.key({ mod.super }, "f", awful.client.floating.toggle,
                {description = "toggle floating", group = "Awesome: client"}),
        awful.key({ mod.super }, "t", function(c) c.ontop = not c.ontop end,
                {description = "toggle keep on top", group = "Awesome: client"}),
        awful.key({ mod.super }, "n", function(c) c.minimized = true end ,
            {description = "minimize", group = "Awesome: client"}),
        awful.key({ mod.super }, "m",
            function(c)
                c.maximized = not c.maximized
                c:raise()
            end ,
            {description = "(un)maximize", group = "Awesome: client"}),
        awful.key({ mod.super, mod.ctrl }, "m",
            function(c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end ,
            {description = "(un)maximize vertically", group = "Awesome: client"}),
        awful.key({ mod.super, mod.shift }, "m",
            function(c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end ,
            {description = "(un)maximize horizontally", group = "Awesome: client"}),
    })
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
