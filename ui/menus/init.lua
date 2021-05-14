local theme = require("beautiful")
local freedesktop = require("ui.menus.freedesktop")
local awesome_menu = require("ui.menus.awesome")
local apps = require("config.apps")

_G.main_menu = freedesktop.build({
    icon_size = theme.menu_height,
    before = {
        { "&Awesome", awesome_menu, theme.awesome_icon },
        { "Open &Terminal", apps.terminal, theme.terminal_icon },
        { "Open &Files", apps.filemanager, theme.filemanager_icon },
    },
    after = nil,
    sub_menu = nil,
    skip_items = nil,
})

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
