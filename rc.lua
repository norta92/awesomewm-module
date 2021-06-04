-- awesome_mode: api-level=4:screen=on

-- Load LuaRocks, if installed
pcall(require, "luarocks.loader")

-- Error handling
require("utils.errors")

-- Load theme
local theme = require("beautiful")
local config_path = require("gears.filesystem").get_configuration_dir()
theme.init(config_path .. "theme/antsy.lua")

-- Load key and mouse bindings
require("bindings.global.keys")
require("bindings.global.mouse")
require("bindings.client.keys")
require("bindings.client.mouse")
require("bindings.apps")

-- Connect signals
require("signals.tag")
require("signals.screen")
require("signals.client")

-- Load rules
require("rules")

-- XDG autostart
require("utils.autostart")

-- Wallpaper shuffler
require("utils.wallpaper")

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
