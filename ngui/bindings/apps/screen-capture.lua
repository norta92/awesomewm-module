local awful = require('awful')
local spawn = awful.spawn
local mod = require('bindings.mod')

local cmd = {
    exe = 'screen-capture',
    capture = 'screen-capture',
    select = 'screen-capture -s',
}

local keys = {
    awful.key({ }, 'Print', function() spawn(cmd.capture, false) end,
              {description = 'capture whole screen', group = 'Script: capture screen'}),
    awful.key({ mod.super }, 'Print', function() spawn(cmd.select, false) end,
              {description = 'capture selected window', group = 'Script: capture window'}),
}

spawn.easy_async_with_shell('command -v ' .. cmd.exe, function(path)
    if not path then return end
    awful.keyboard.append_global_keybindings(keys)
end)
