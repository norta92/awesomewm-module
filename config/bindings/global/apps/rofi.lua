local awful = require("awful")
local spawn = awful.spawn
local mod = require("config.bindings.mod")

local cmd = {
    rofi = {
        apps = "rofi -show drun",
        --run = "rofi -show run",
        --files = "rofi -show file-browser",
        pass = "rofi-pass",
        calc = "rofi -show calc",
    },
}

awful.keyboard.append_global_keybindings({
    awful.key({ mod.super }, "space", function() spawn(cmd.rofi.apps, false) end,
              {description = "show application search", group = "rofi"}),
    --awful.key({ mod.super }, "colon", function() spawn(cmd.rofi.run, false) end,
    --          {description = "show command search", group = "rofi"}),
    --awful.key({ mod.super, mod.alt }, "f", function() spawn(cmd.rofi.files, false) end,
    --          {description = "show file search", group = "rofi"}),
    awful.key({ mod.super, mod.alt }, "p", function() spawn(cmd.rofi.pass, false) end,
              {description = "show password search", group = "rofi"}),
    awful.key({ mod.super, mod.alt }, "c", function() spawn(cmd.rofi.calc, false) end,
              {description = "show calculator", group = "rofi"}),
})

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
