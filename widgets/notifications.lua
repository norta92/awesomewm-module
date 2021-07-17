------------------------------------------------------------------------------
----- Setup notifications.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @themevars
----    theme.notification_position
----    theme.notification_width
----    theme.notification_icon_size
----    theme.notification_margin
----    theme.notification_padding
----    theme.notification_spacing
----    theme.border_width
----    theme.margins
----    theme.spacing
----    theme.font
----    theme.font_bold
----    theme.ui_color
----    theme.ui_accent
----    theme.error_color
----    theme.alpha
------------------------------------------------------------------------------

local awful = require('awful')
local theme = require('beautiful')
local dpi = theme.xresources.apply_dpi
local ruled = require('ruled')
local wibox = require('wibox')
local naughty = require('naughty')
local container = require('widgets.clickable-container')

local paths = _G.conf.paths
local _V = {
    search_paths = paths.icons or {},
}

-- Naughty only reads these values, so we set them from the theme.
naughty.config.defaults.ontop = true
naughty.config.defaults.icon_size = theme.notification_icon_size
naughty.config.defaults.timeout = 5
naughty.config.defaults.title = 'System Information'
naughty.config.defaults.border_width = theme.border_width
naughty.config.defaults.max_width = theme.notification_width
naughty.config.defaults.position = theme.notification_position
naughty.config.defaults.margin = theme.margins
naughty.config.padding = theme.notification_padding
naughty.config.spacing = theme.notification_spacing

-- Paths to search when looking for icons.
naughty.config.icon_dirs = _V.search_paths

-- File formats to filter when looking for icons.
naughty.config.icon_formats = { 'svg', 'png' }

--- The notification widget.
-- @param n The notification to be displayed.
local _M = function(n)

    local actions_template = wibox.widget {
        notification = n,
        base_layout = wibox.widget {
            layout = wibox.layout.flex.horizontal,
            spacing = dpi(0),
        },
        widget_template = {
            {
                {
                    {
                        widget = wibox.widget.textbox,
                        id     = 'text_role',
                        font   = theme.font,
                    },
                    widget = wibox.container.place,
                },
                widget = container,
            },
            widget = wibox.container.margin,
            margins = theme.margins,
        },
        widget = naughty.list.actions,
        style = {
            underline_normal = false,
            underline_selected = true,
        },
    }

    naughty.layout.box {
        notification = n,
        type = 'notification',
        screen = awful.screen.preferred(),
        widget_template = {
            {
                {
                    {
                        {
                            {
                                {
                                    {
                                        {
                                            widget = naughty.widget.icon,
                                            resize_strategy = 'center',
                                        },
                                        widget = wibox.container.margin,
                                        margins = theme.notification_margin,
                                    },
                                    layout = wibox.layout.fixed.vertical,
                                    fill_space = false,
                                },
                                {
                                    {
                                        {
                                            widget = wibox.widget.textbox(),
                                            text = n.title,
                                            font = theme.font_bold,
                                            align = 'left',
                                            ellipsize = 'end',
                                            wrap = 'none',
                                        },
                                        {
                                            widget = wibox.widget.textbox(),
                                            text = n.message,
                                            valign = 'top',
                                            align = 'left',
                                            ellipsize = 'end',
                                            wrap = 'word_char',
                                        },
                                        layout = wibox.layout.fixed.vertical,
                                        fill_space = false,
                                    },
                                    widget = wibox.container.margin,
                                    margins = theme.notification_margin,
                                },
                                layout = wibox.layout.fixed.horizontal,
                            },
                            layout = wibox.layout.fixed.vertical,
                            spacing = theme.spacing,
                            fill_space = false,
                        },
                        -- Actions
                        widget = actions_template,
                        layout = wibox.layout.fixed.vertical,
                        spacing = theme.spacing,
                    },
                    widget = naughty.container.background,
                    id = 'background_role',
                    bg = theme.ui_color .. theme.alpha,
                },
                widget = wibox.container.constraint,
                width = theme.notification_width,
                strategy = 'min',
            },
            widget = wibox.container.constraint,
            width = theme.notification_width,
            strategy = 'max',
        }
    }

end

-- The notification rules.
ruled.notification.connect_signal('request::rules', function()
    ruled.notification.append_rule {
        rule       = { urgency = 'critical' },
        properties = {
            fg                  = theme.error_color,
            border_color        = theme.error_color,
            implicit_timeout    = 0,
        }
    }
    ruled.notification.append_rule {
        rule       = { urgency = 'normal' },
        properties = {
            implicit_timeout    = 10
        }
    }
    ruled.notification.append_rule {
        rule       = { urgency = 'low' },
        properties = {
            border_color        = theme.ui_accent,
            implicit_timeout    = 5
        }
    }
end)

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
