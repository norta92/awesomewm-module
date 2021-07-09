------------------------------------------------------------------------------
----- AwesomeWM configuration
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------
-- awesome_mode: api-level=4:screen=on

-- Load LuaRocks, if installed
pcall(require, 'luarocks.loader')

-- Load config
_G.conf = require('config')

-- Load theme
local themes = _G.conf.paths.themes
local active = _G.conf.vars.themes.active
local beautiful = require('beautiful')
beautiful.init(string.format('%s/%s/theme.lua', themes, active))

-- Load key and mouse bindings
require('bindings')

-- Load signals
require('signals')

-- Load rules
require('rules')

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
