local awful = require('awful')
local spawn = awful.spawn
local mod = require('bindings.mod')

local cmd = {
    exe = 'rofi',
    run = 'rofi -show run',
    drun = 'rofi -show drun',
    window = 'rofi -show window',
    pass = 'rofi-pass',
}

local keys = {
    awful.key({ mod.super            }, "space", function () awful.spawn(cmd.drun) end,
              {description = "application search", group = "launcher"}),
    awful.key({ mod.super, mod.alt   }, "r", function () awful.spawn(cmd.run) end,
              {description = "command search", group = "launcher"}),
    awful.key({ mod.super, mod.alt   }, "Tab", function () awful.spawn(cmd.window) end,
              {description = "window search", group = "launcher"}),
    awful.key({ mod.super, mod.alt   }, "p", function () awful.spawn(cmd.pass) end,
              {description = "password search", group = "launcher"}),
}

spawn.easy_async_with_shell('command -v ' .. cmd.exe , function(path)
    if not path then return end
    awful.keyboard.append_global_keybindings(keys)
end)
