-- awesome_mode: api-level=4:screen=on
-- Load LuaRocks, if installed
pcall(require, "luarocks.loader")

-- Error handling
require("utils.errors")

-- Load globals
require("config")

-- Load theme
local beautiful = require("beautiful")
local themes = {
    "antsy-next",       -- 1
    "antsy-classic",    -- 2
    "tango",            -- 3
}

beautiful.init(string.format(
    "%s/.config/awesome/themes/%s/theme.lua",
    os.getenv("HOME"), themes[1]))

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
