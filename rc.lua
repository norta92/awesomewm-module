-- awesome_mode: api-level=4:screen=on

-- Load LuaRocks, if installed
pcall(require, "luarocks.loader")

-- Error handling
require("utils.errors")

-- Load theme
local theme = require("beautiful")
local config_path = require("gears.filesystem").get_configuration_dir()
theme.init(config_path .. "theme/antsy.lua")

-- Load configuration
require("config")

-- Load interface
require("ui.desktop")
require("ui.panels")
require("ui.menus")
require("ui.titlebars")

-- XDG autostart
require("utils.autostart")

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
