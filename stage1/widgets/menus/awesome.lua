local awful = require('awful')
local spawn = awful.spawn
local hotkeys_popup = require('awful.hotkeys_popup')
local apps = _G.cfg.apps.awesome

local _M = {
    { 'hotkeys',
        function()
           hotkeys_popup.show_help(nil, awful.screen.focused())
        end,
        nil
    },
    { 'manaul', function() spawn(apps.manual) end, nil },
    { 'edit config', function() spawn(apps.config) end, nil },
    { 'restart', function() spawn(apps.restart) end, nil },
    { 'quit', function() spawn(apps.exit) end, nil },
}

return _M
