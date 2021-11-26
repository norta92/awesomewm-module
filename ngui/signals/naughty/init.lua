local theme = require('beautiful')
local naughty = require('naughty')
local search_paths = _G.cfg.paths.icons or {}

naughty.config.defaults.ontop           = true
naughty.config.defaults.icon_size       = theme.notification_icon_size
naughty.config.defaults.timeout         = 5
naughty.config.defaults.title           = 'System Information'
naughty.config.defaults.border_width    = theme.border_width
naughty.config.defaults.max_width       = theme.notification_width
naughty.config.defaults.position        = theme.notification_position
naughty.config.defaults.opacity         = theme.notification_opacity
naughty.config.padding                  = theme.notification_padding
naughty.config.icon_dirs                = search_paths
naughty.config.icon_formats             = { 'svg', 'png' }

return {
    require('signals.naughty.appicon'),
    require('signals.naughty.display'),
}
