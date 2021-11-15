local awful = require('awful')
local spawn = awful.spawn
local mod = require('bindings.mod')

local cmd = {
    exe = 'touchpad-toggle',
    toggle = 'touchpad-toggle',
}

local keys = {
    awful.key({ mod.super, mod.alt }, 't', function() spawn(cmd.toggle, false) end,
              {description = 'toggle touchpad input', group = 'Scripts: touchpad-toggle'}),
}

spawn.easy_async_with_shell('command -v ' .. cmd.exe, function(path)
    if not path then return end
    awful.keyboard.append_global_keybindings(keys)

end)
