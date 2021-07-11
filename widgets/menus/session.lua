------------------------------------------------------------------------------
----- Session menu.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
----    theme.lockscreen_icon
----    theme.exit_icon
----    theme.reboot_icon
----    theme.suspend_icon
----    theme.poweroff_icon
------------------------------------------------------------------------------

local awful = require('awful')
local spawn = awful.spawn
local theme = require('beautiful')
local apps = _G.conf.apps

local awesome = awesome

--- The session menu.
local _M = function()
    return awful.menu({
        { '&Lock Desktop', function() spawn(apps.lockscreen) end, theme.lockscreen_icon },
        { '&Exit Desktop', function() awesome.quit() end, theme.exit_icon },
        { '&Reboot System', function() spawn(apps.reboot) end, theme.reboot_icon },
        { '&Suspend System', function() spawn(apps.suspend) end, theme.suspend_icon },
        { '&Power Off', function() spawn(apps.poweroff) end, theme.poweroff_icon },
    })
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
