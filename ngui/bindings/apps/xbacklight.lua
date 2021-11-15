local awful = require('awful')
local spawn = awful.spawn

local cmd = {
    exe = 'xbacklight',
    inc = 'xbacklight -inc 10%',
    dec = 'xbacklight -dec 10%',
}

local keys = {
    awful.key({ }, 'XF86MonBrightnessUp', function() spawn(cmd.inc, false) end,
              {description = 'increase backlight brightness', group = 'Fn Keys'}),
    awful.key({ }, 'XF86MonBrightnessDown', function() spawn(cmd.dec, false) end,
              {description = 'decrease backlight brightness', group = 'Fn Keys'}),
}

spawn.easy_async_with_shell('command -v ' .. cmd.exe , function(path)
    if not path then return end
    awful.keyboard.append_global_keybindings(keys)
end)
