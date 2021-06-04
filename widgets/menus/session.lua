local awful = require("awful")
local spawn = awful.spawn
local theme = require("beautiful")
local apps = require("config.apps")

local awesome = awesome

local _M = function()
    return awful.menu({
        { "&Lock Desktop", function() spawn(apps.screenlocker) end, theme.screenlock_icon },
        { "&Exit Desktop", function() awesome.quit() end, theme.exit_icon },
        { "&Restart System", function() spawn(apps.reboot) end, theme.reboot_icon },
        { "&Suspend System", function() spawn(apps.suspend) end, theme.suspend_icon },
        { "&Halt System", function() spawn(apps.poweroff) end, theme.poweroff_icon },
    })
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
