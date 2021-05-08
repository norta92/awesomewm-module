local awful = require("awful")
local spawn = awful.spawn
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local apps = require("config.apps")

local menu = {
   { "Show &Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end, beautiful.hotkeys_icon },
   { "Read &Manaul", apps.terminal .. " -e man awesome", beautiful.manual_icon },
   { "Edit &Config", apps.editor_cmd .. " " .. awesome.conffile, beautiful.editor_icon },
   { "&Lock Desktop", function () spawn(apps.screenlocker) end, beautiful.screenlock_icon },
   { "&Restart Desktop", awesome.restart, beautiful.restart_icon },
   { "&Exit Desktop", function() awesome.quit() end, beautiful.exit_icon },
}
return menu
