local awful = require('awful')
local spawn = awful.spawn

local cmd = {
    exe = 'pactl',
    inc = 'pactl set-sink-volume @DEFAULT_SINK@ +5%',
    dec = 'pactl set-sink-volume @DEFAULT_SINK@ -5%',
    mute = 'pactl set-sink-mute @DEFAULT_SINK@ toggle',
}

local keys = {
    awful.key({ }, 'XF86AudioRaiseVolume', function() spawn(cmd.inc, false) end,
              {description = 'raise volume', group = 'Fn Keys'}),
    awful.key({ }, 'XF86AudioLowerVolume', function() spawn(cmd.dec, false) end,
              {description = 'lower volume', group = 'Fn Keys'}),
    awful.key({ }, 'XF86AudioMute', function() spawn(cmd.mute, false) end,
              {description = 'toggle mute', group = 'Fn Keys'}),
}

spawn.easy_async_with_shell('command -v ' .. cmd.exe , function(path)
    if not path then return end
    awful.keyboard.append_global_keybindings(keys)
end)
