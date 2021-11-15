local awful = require('awful')

local menu_position = require('utils.menus').set_menu_position
local mod = require('bindings.mod')

local _M = function()
    awful.keyboard.append_global_keybindings({
        awful.key({ mod.super, mod.ctrl }, 'q', function()
                local pos = menu_position('tr')
                _G.menus.leaver:show({coords=pos})
            end,
                  {description = 'show session menu', group = 'Awesome: core'}),
    })
end

return _M

