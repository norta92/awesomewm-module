local awful = require("awful")
local spawn = awful.spawn
local theme = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local apps = require("config.apps")

local awesome = awesome

local menu = {
   { "Show Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end, theme.hotkeys_icon },
   { "Read Manaul", function() spawn(apps.terminal .. " -e man awesome") end, theme.manual_icon },
   { "Edit Config", function() spawn(apps.editor_cmd .. " " .. awesome.conffile) end, theme.editor_icon },
   { "Restart Desktop", function() awesome.restart() end, theme.restart_icon },
   { "Exit Desktop", function() awesome.quit() end, theme.exit_icon },
}

return menu

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
