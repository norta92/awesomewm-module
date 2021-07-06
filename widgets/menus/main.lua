----------------------------------------------------------------------------
----- Main menu with freedesktop.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module widgets.menus.main
------------------------------------------------------------------------------

local theme = require("beautiful")
local freedesktop = require("freedesktop.menu")
local awesome_menu = require("widgets.menus.awesome")
local apps = _G.conf.apps

--- The main menu.
local _M = function()
    return freedesktop.build({
        before = {
            { "&Awesome", awesome_menu, theme.awesome_icon },
            { "Open &Terminal", apps.terminal, theme.terminal_icon },
            { "Open &Files", apps.filemanager, theme.filemanager_icon },
        },
        after = nil,
        sub_menu = nil,
        skip_items = nil,
    })
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
