------------------------------------------------------------------------------
----- Call script to enable\disable touchpad.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')
local spawn = awful.spawn
local mod = require('bindings.mod')

local cmd = {
    touchpad = {
        toggle = 'touchpad-toggle',
    },
}

awful.keyboard.append_global_keybindings({
    awful.key({ mod.super, mod.alt }, 't', function() spawn(cmd.touchpad.toggle, false) end,
              {description = 'toggle touchpad input', group = 'Awesome: extras'}),
})

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
