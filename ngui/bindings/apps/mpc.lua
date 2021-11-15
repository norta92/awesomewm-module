local awful = require('awful')
local spawn = awful.spawn

local cmd = {
    exe = 'mpc',
    play = 'mpc toggle',
    next = 'mpc next',
    prev = 'mpc prev',
    stop = 'mpc stop',
}

local keys = {
    -- play
    awful.key({ }, 'XF86AudioPlay', function() spawn(cmd.play, false) end,
              {description = 'toggle play and pause', group = 'Fn Keys'}),
    -- next
    awful.key({ }, 'XF86AudioNext', function() spawn(cmd.next, false) end,
              {description = 'go to next track', group = 'Fn Keys'}),
    -- prev
    awful.key({ }, 'XF86AudioPrev', function() spawn(cmd.prev, false) end,
              {description = 'go to previous track', group = 'Fn Keys'}),
    -- stop
    awful.key({ }, 'XF86AudioStop', function() spawn(cmd.stop, false) end,
              {description = 'stop playback', group = 'Fn Keys'}),
}

spawn.easy_async_with_shell('command -v ' .. cmd.exe , function(path)
    if not path then return end
    awful.keyboard.append_global_keybindings(keys)
end)
