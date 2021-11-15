local theme = require('beautiful')
local surface = require('gears.surface')

client.connect_signal('request::manage', function(c)
    if not next(c.icon_sizes) then
        local icon = surface(theme.default_app_icon)
        c.icon = icon and icon._native or nil
    end
end)
