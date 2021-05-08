local beautiful = require("beautiful")
local naughty = require("naughty")

local notifications = {}

-- Notification settings
naughty.config.defaults['icon_size'] = beautiful.notification_icon_size
naughty.config.defaults['border_width'] = beautiful.notification_border_width

-- Timeouts
naughty.config.defaults.timeout = 10
naughty.config.presets.low.timeout = 5
naughty.config.presets.critical.timeout = 20


function notifications.init()
    require("ui.notifications.rules")
    require("ui.notifications.signals")
end


return notifications
