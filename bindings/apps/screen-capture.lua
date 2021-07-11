------------------------------------------------------------------------------
----- Setup bindings for screen-capture.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')
local spawn = awful.spawn
local mod = require('bindings.mod')

-- Commands table
local cmd = {
    exe = 'screen-capture',
    capture = 'screen-capture',
    select = 'screen-capture -s',
}

-- Key table
local keys = {
    awful.key({ }, 'Print', function() spawn(cmd.capture.screen, false) end,
              {description = 'capture whole screen', group = 'Script: capture screen'}),
    awful.key({ mod.super }, 'Print', function() spawn(cmd.capture.select, false) end,
              {description = 'capture selected window', group = 'Script: capture window'}),
}

-- Add bindings
spawn.easy_async_with_shell('command -v ' .. cmd.exe, function(path)
    if not path then return end
    awful.keyboard.append_global_keybindings(keys)

end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
