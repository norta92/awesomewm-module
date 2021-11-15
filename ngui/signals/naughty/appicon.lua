local theme = require('beautiful')
local naughty = require('naughty')
local lookup_icon = require('menubar.utils').lookup_icon

naughty.connect_signal("request::icon", function(n, context, hints)
    n.icon = theme.notification_default_icon
    if context ~= 'app_icon' then return end
    local path = lookup_icon(hints.app_icon)
                 or lookup_icon(hints.app_icon:lower())
    if path then
        n.icon = path
    end
end)
