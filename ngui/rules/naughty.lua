local awful = require('awful')
local ruled = require('ruled')
local theme = require('beautiful')

ruled.notification.connect_signal('request::rules', function()
    ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            implicit_timeout = 5,
            opacity = 0.5,
        }
    }

    --ruled.notification.append_rule {
    --    rule       = { urgency = 'critical' },
    --    properties = {
    --        fg                  = theme.fg_error,
    --        bg                  = theme.bg_error,
    --        border_color        = theme.bg_error,
    --        implicit_timeout    = 0,
    --    }
    --}

    --ruled.notification.append_rule {
    --    rule       = { urgency = 'normal' },
    --    properties = {
    --        implicit_timeout    = 10
    --    }
    --}

    --ruled.notification.append_rule {
    --    rule       = { urgency = 'low' },
    --    properties = {
    --        implicit_timeout    = 5
    --    }
    --}
end)
