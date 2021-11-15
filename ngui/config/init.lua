local awful = require("awful")
local menubar = require("menubar")

local apps = require('config.apps')
local vars = require('config.vars')
local paths = require('config.paths')

if vars.focus.auto then
    require("awful.autofocus")
end

require("awful.hotkeys_popup.keys")

menubar.utils.terminal = apps.terminal

awful.screen.set_auto_dpi_enabled = true

awful.titlebar.enable_tooltip = false

awful.mouse.snap.edge_enabled = true
awful.mouse.snap.client_enabled = true

return {
    apps = apps,
    vars = vars,
    paths = paths,
}
