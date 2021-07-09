------------------------------------------------------------------------------
----- Call screenshot script.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')
local spawn = awful.spawn
local mod = require('bindings.mod')

local cmd = {
    capture = {
        screen = 'screen-capture',
        select = 'screen-capture -s',
    },
}

awful.keyboard.append_global_keybindings({
    -- screen-capture
    awful.key({ }, 'Print', function() spawn(cmd.capture.screen, false) end,
              {description = 'capture whole screen', group = 'Awesome: screenshot'}),
    awful.key({ mod.super }, 'Print', function() spawn(cmd.capture.select, false) end,
              {description = 'capture selected window', group = 'Awesome: screenshot'}),
})

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
