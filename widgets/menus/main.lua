------------------------------------------------------------------------------
----- Main menu.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
----    theme.awesome_icon
----    theme.terminal_icon
----    theme.filemanager_icon
------------------------------------------------------------------------------

local awful = require('awful')
local theme = require('beautiful')
local fd_check, menu = pcall(require, 'freedesktop.menu')
local awesome_menu = require('widgets.menus.awesome')
local apps = _G.conf.apps

--- The main menu.
local _M = function()

    -- Base menu
    local base = {
        { '&Awesome', awesome_menu, theme.awesome_icon },
        { 'Open &Terminal', apps.terminal, theme.terminal_icon },
        { 'Open &Files', apps.filemanager, theme.filemanager_icon },
    }

    if fd_check then
        -- Freedesktop menu.
        return menu.build({
            before = base,
            after = nil,
            sub_menu = nil,
            skip_items = nil,
        })
    else
        -- Basic menu.
        return awful.menu({ items = base })
    end
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
