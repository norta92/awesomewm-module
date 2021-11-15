local awful = require('awful')
local theme = require('beautiful')

local _M = {}

_M.set_menu_position = function(corner)
    local width = 0
    local height = 0

    local index = awful.screen.focused().index
    local menu_width = theme.menu_width+(theme.menu_border_width*2)

    for s = 1, screen.count() do
        width = width + screen[s].geometry.width
        height = screen[s].geometry.height
        if s == index then break end
    end

    if corner == 'tr' then
        return {
            x = width-menu_width,
            y = 0,
        }
    elseif corner == 'bl' then
        return {
            x = 0,
            y = height,
        }
    elseif corner == 'br' then
        return {
            x = width-menu_width,
            y = height,
        }
    else
        return {
            x = 0,
            y = 0,
        }
    end
end

return _M
