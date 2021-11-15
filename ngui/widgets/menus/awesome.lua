local awful = require('awful')
local spawn = awful.spawn
local theme = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup')
local apps = _G.cfg.apps.awesome

local _M = {
    { '&Show Hotkeys',
        function()
           hotkeys_popup.show_help(nil, awful.screen.focused())
        end,
        theme.awesome_hotkeys_icon
    },
    { 'Read &Manaul', function() spawn(apps.manual) end, theme.awesome_manual_icon },
    { 'Edit &Config', function() spawn(apps.config) end, theme.awesome_config_icon },
    { '&Restart Awesome', function() spawn(apps.restart) end, theme.awesome_restart_icon },
    { '&Exit Awesome', function() spawn(apps.exit) end, theme.awesome_exit_icon },
}

return _M
