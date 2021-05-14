local awful = require("awful")
local spawn = awful.spawn
local mod = require("config.bindings.mod")

local cmd = {
    touchpad = {
        toggle = "touchpad-toggle",
    },
}

awful.keyboard.append_global_keybindings({
    awful.key({ mod.super, mod.alt }, "t", function() spawn(cmd.touchpad.toggle, false) end,
              {description = "toggle touchpad input", group = "Awesome: toggle touchpad"}),
})

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
