------------------------------------------------------------------------------
----- Setup bindings for touchpad-toggle.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')
local spawn = awful.spawn
local mod = require('bindings.mod')

-- Commands table
local cmd = {
    exe = 'touchpad-toggle',
    toggle = 'touchpad-toggle',
}

-- Key table
local keys = {
    awful.key({ mod.super, mod.alt }, 't', function() spawn(cmd.toggle, false) end,
              {description = 'toggle touchpad input', group = 'Scripts: touchpad-toggle'}),
}

-- Add bindings
spawn.easy_async_with_shell('command -v ' .. cmd.exe, function(path)
    if not path then return end
    awful.keyboard.append_global_keybindings(keys)

end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
