------------------------------------------------------------------------------
----- Awesome configuration
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module rc
------------------------------------------------------------------------------
-- awesome_mode: api-level=4:screen=on

-- Load LuaRocks, if installed
pcall(require, 'luarocks.loader')

-- Load global config
_G.conf = require('config')

-- Load theme
local theme = require('beautiful')
local path = _G.conf.paths.themes
local active = _G.conf.vars.themes.active
theme.init(string.format('%s/%s/theme.lua', path, active))

-- Load key and mouse bindings
require('bindings')

-- Load rules
require('rules')

-- Load signals
require('signals')

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
