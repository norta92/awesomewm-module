pcall(require, "luarocks.loader")

-- Startup errors
require('utils.errors')

-- Load theme
local theme = require("beautiful")
local gfs = require("gears.filesystem")
theme.init(gfs.get_themes_dir() .. "default/theme.lua")

-- Load global configuration
_G.cfg = require('config')

-- Load key and mouse bindings
require('bindings')

-- Load rules
require('rules')

-- Setup global menus
_G.menus = {
    main = require('widgets.menus.main')(),
}

-- Connect signals
require('signals')
