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
require("bindings")

-- Connect signals
require("signals.screen")
require("signals.tag")
require("signals.client")

-- Load rules
require("rules")

-- XDG autostart
require("utils.autostart")

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
