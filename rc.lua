-- awesome_mode: api-level=4:screen=on
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
--require("ui.notifications")

-- XDG autostart
require("utils.autostart")

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80:foldmethod=marker
