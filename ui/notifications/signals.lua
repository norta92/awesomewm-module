local naughty = require("naughty")
local menubar = require("menubar")

naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)

-- Handle notification icon
naughty.connect_signal("request::icon", function(n, context, hints)
    -- Handle other contexts here
    if context ~= "app_icon" then return end

    -- Use XDG icon
    local path = menubar.utils.lookup_icon(hints.app_icon) or
    menubar.utils.lookup_icon(hints.app_icon:lower())

    if path then
        n.icon = path
    end
end)

-- Use XDG icon
naughty.connect_signal("request::action_icon", function(a, context, hints)
    a.icon = menubar.utils.lookup_icon(hints.id)
end)
