------------------------------------------------------------------------------
----- Setup Fn keys for pactl.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')
local spawn = awful.spawn

-- Commands table
local cmd = {
    exe = 'pactl',
    inc = 'pactl set-sink-volume @DEFAULT_SINK@ +5%',
    dec = 'pactl set-sink-volume @DEFAULT_SINK@ -5%',
    mute = 'pactl set-sink-mute @DEFAULT_SINK@ toggle',
}

-- Key table
local keys = {
    -- increase
    awful.key({ }, 'XF86AudioRaiseVolume', function() spawn(cmd.inc, false) end,
              {description = 'raise volume', group = 'Fn Keys: pactl'}),
    -- decrease
    awful.key({ }, 'XF86AudioLowerVolume', function() spawn(cmd.dec, false) end,
              {description = 'lower volume', group = 'Fn Keys: pactl'}),
    -- mute
    awful.key({ }, 'XF86AudioMute', function() spawn(cmd.mute, false) end,
              {description = 'toggle mute', group = 'Fn Keys: pactl'}),
}

-- Add bindings
spawn.easy_async_with_shell('command -v ' .. cmd.exe , function(path)
    if not path then return end
    awful.keyboard.append_global_keybindings(keys)
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
