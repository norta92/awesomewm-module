local awful = require("awful")
local spawn = awful.spawn
local theme = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local apps = require("config.apps")

local awesome = awesome

local menu = {
   { "Show Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end, theme.hotkeys_icon },
   { "Read Manaul", apps.terminal .. " -e man awesome", theme.manual_icon },
   { "Edit Config", apps.editor_cmd .. " " .. awesome.conffile, theme.editor_icon },
   { "Lock Desktop", function() spawn(apps.screenlocker) end, theme.screenlock_icon },
   { "Restart Desktop", awesome.restart, theme.restart_icon },
   { "Exit Desktop", function() awesome.quit() end, theme.exit_icon },
}

return menu

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
