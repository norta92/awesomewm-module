------------------------------------------------------------------------------
----- Setup Fn keys for mpc.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')
local spawn = awful.spawn

-- Commands table
local cmd = {
    exe = 'mpc',
    play = 'mpc toggle',
    next = 'mpc next',
    prev = 'mpc prev',
    stop = 'mpc stop',
}

-- Key table
local keys = {
    -- play
    awful.key({ }, 'XF86AudioPlay', function() spawn(cmd.play, false) end,
              {description = 'toggle play and pause', group = 'Fn Keys: mpc'}),
    -- next
    awful.key({ }, 'XF86AudioNext', function() spawn(cmd.next, false) end,
              {description = 'go to next track', group = 'Fn Keys: mpc'}),
    -- prev
    awful.key({ }, 'XF86AudioPrev', function() spawn(cmd.prev, false) end,
              {description = 'go to previous track', group = 'Fn Keys: mpc'}),
    -- stop
    awful.key({ }, 'XF86AudioStop', function() spawn(cmd.stop, false) end,
              {description = 'stop playback', group = 'Fn Keys: mpc'}),
}

spawn.easy_async_with_shell('command -v ' .. cmd.exe , function(path)
    if not path then return end

    -- Add bindings
    awful.keyboard.append_global_keybindings(keys)
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
