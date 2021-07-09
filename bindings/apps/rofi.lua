------------------------------------------------------------------------------
----- rofi-based apps.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')
local spawn = awful.spawn
local mod = require('bindings.mod')

local cmd = {
    rofi = {
        apps = 'rofi -show drun',
        windows = 'rofi -show window',
        pass = 'rofi-pass',
        calc = 'rofi -show calc',
    },
}

awful.keyboard.append_global_keybindings({
    -- app search
    awful.key({ mod.super }, 'space', function() spawn(cmd.rofi.apps, false) end,
              {description = 'show application search', group = 'rofi'}),
    -- window search
    awful.key({ mod.alt }, 'Tab', function() spawn(cmd.rofi.windows, false) end,
              {description = 'show window search', group = 'rofi'}),
    -- rofi-pass
    awful.key({ mod.super, mod.alt }, 'p', function() spawn(cmd.rofi.pass, false) end,
              {description = 'show password search', group = 'rofi'}),
    -- rofi-calc
    awful.key({ mod.super, mod.alt }, 'c', function() spawn(cmd.rofi.calc, false) end,
              {description = 'show calculator', group = 'rofi'}),
})

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
