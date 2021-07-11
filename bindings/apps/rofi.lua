------------------------------------------------------------------------------
----- Setup bindings for rofi.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')
local spawn = awful.spawn
local vars = require('config.vars')
local mod = require('bindings.mod')

-- Commands table
local cmd = {
    exe = 'rofi',
    apps = 'rofi -show drun',
    windows = 'rofi -show window',
    pass = 'rofi-pass',
    calc = 'rofi -show calc',
}

-- Try to use matching rofi theme
if vars.rofi.follow_theme then
    for k, v in pairs(cmd) do
        local opts = {
            ' -theme ' .. vars.themes.active,
            ' -location ' .. vars.rofi.location,
            ' -xoffset '.. vars.rofi.offset[1],
            ' -yoffset ' .. vars.rofi.offset[2],
        }
        cmd[k] = v .. table.concat(opts, '')
    end
end

-- Key table
local keys = {
    -- app search
    awful.key({ mod.super }, 'space', function() spawn(cmd.apps, false) end,
              {description = 'show application search', group = 'rofi'}),
    -- window search
    awful.key({ mod.alt }, 'Tab', function() spawn(cmd.windows, false) end,
              {description = 'show window search', group = 'rofi'}),
    -- rofi-pass
    awful.key({ mod.super, mod.alt }, 'p', function() spawn(cmd.pass, false) end,
              {description = 'show password search', group = 'rofi'}),
    -- rofi-calc
    awful.key({ mod.super, mod.alt }, 'c', function() spawn(cmd.calc, false) end,
              {description = 'show calculator', group = 'rofi'}),
}

-- Add bindings
spawn.easy_async_with_shell('command -v ' .. cmd.exe , function(path)
    if not path then return end
    awful.keyboard.append_global_keybindings(keys)
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
