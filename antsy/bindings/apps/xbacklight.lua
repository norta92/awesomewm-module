------------------------------------------------------------------------------
----- Setup Fn keys for xbacklight.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')
local spawn = awful.spawn

-- Commands table
local cmd = {
    exe = 'xbacklight',
    inc = 'xbacklight -inc 10%',
    dec = 'xbacklight -dec 10%',
}

-- Key table
local keys = {
    -- increase
    awful.key({ }, 'XF86MonBrightnessUp', function() spawn(cmd.inc, false) end,
              {description = 'increase backlight brightness', group = 'Fn Keys: xbacklight'}),
    -- decrease
    awful.key({ }, 'XF86MonBrightnessDown', function() spawn(cmd.dec, false) end,
              {description = 'decrease backlight brightness', group = 'Fn Keys: xbacklight'}),
}

-- Add bindings
spawn.easy_async_with_shell('command -v ' .. cmd.exe , function(path)
    if not path then return end
    awful.keyboard.append_global_keybindings(keys)
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
