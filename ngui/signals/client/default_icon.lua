local theme = require('beautiful')
local surface = require('gears.surface')

local _M = function(kwargs)
    local args = kwargs or {}
    local icon_path = args.icon_path or theme.default_app_icon or nil

    if icon_path then
        client.connect_signal('request::manage', function(c)
            if not next(c.icon_sizes) then
                local icon = surface(icon_path)
                c.icon = icon and icon._native or nil
            end
        end)
    end
end

return _M
