local awful = require('awful')
local theme = require('beautiful')
local apps = _G.cfg.apps

local awesome_menu = require('widgets.menus.awesome')

local _M = function()

    return awful.menu({
        { 'awesome', awesome_menu, theme.awesome_icon },
        { 'open terminal', apps.terminal, nil },
    })
end

return _M
