local beautiful = require("beautiful")
local freedesktop = require("ui.menus.freedesktop")
local awesome_menu = require("ui.menus.awesome")
local apps = require("config.apps")

_G.main_menu = freedesktop.build({
    icon_size = beautiful.menu_height,
    before = {
        { "&Awesome", awesome_menu, beautiful.awesome_icon },
        { "Open &Terminal", apps.terminal, beautiful.terminal_icon },
        { "Open &Files", apps.filemanager, beautiful.filemanager_icon },
    },
    after = nil,
    sub_menu = nil,
    skip_items = nil,
})
