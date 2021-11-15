local awful = require('awful')
local theme = require('beautiful')

local _M = function()
    return awful.widget.launcher({
                image = theme.awesome_icon,
                menu = _G.menus.main,
            })
end

return _M
