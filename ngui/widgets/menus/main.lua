local awful = require('awful')
local theme = require('beautiful')
local fd_check, menu = pcall(require, 'freedesktop.menu')
local apps = _G.cfg.apps

local awesome_menu = require('widgets.menus.awesome')

local _M = function()

    local base = {
        { '&Awesome', awesome_menu, theme.awesome_menu_icon },
        { 'Open &Terminal', apps.terminal, theme.menu_terminal_icon },
        { 'Open &Files', apps.files, theme.menu_files_icon },
    }

    if fd_check then
        return menu.build({
            before = base,
            after = nil,
            sub_menu = nil,
            skip_items = nil,
        })
    else
        return awful.menu({ items = base })
    end
end

return _M
