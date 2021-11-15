local awful = require('awful')
local spawn = awful.spawn
local theme = require('beautiful')
local dpi = theme.xresources.apply_dpi
local wibox = require('wibox')
local button = require('widgets.buttons.gtk')
local vars = _G.cfg.vars.leaver

local _V = {
    timeout     = vars.timeout or 10,
    timeout_run = vars.timeout_run or false,
}

_G.leaver = {
    cmd     = nil,
    text    = nil,
    icon    = nil,
}

local clock = wibox.widget {
    widget  = wibox.widget.textclock,
    font    = theme.font_bold,
    align   = 'center',
    valign  = 'center',
}

local icon = wibox.widget {
    widget          = wibox.widget.imagebox,
    image           = theme.leaver_dialog_icon,
    resize          = true,
    forced_height   = dpi(140),
}

local message = wibox.widget {
    widget          = wibox.widget.textbox,
    markup          = '',
    font            = theme.font_bold,
    align           = 'center',
    valign          = 'center',
}

local build_button = function(image, callback)

    local widget = wibox.widget {
        {
            {
                {
                    widget  = wibox.widget.imagebox,
                    image   = image,
                },
                widget      = wibox.container.margin,
                margins     = dpi(16),
            },
            widget          = button,
            shape           = theme.button_shape,
            border_color    = theme.base_bg,
            border_width    = dpi(1),
            forced_width    = dpi(64),
            forced_height   = dpi(64),
        },
        widget  = wibox.container.margin,
        left    = dpi(16),
        right   = dpi(16),
    }

    local container = wibox.widget {
        widget,
        nil,
        layout      = wibox.layout.fixed.vertical,
        --spacing     = theme.spacing,
    }

    container:connect_signal('button::release', function()
        callback()
    end)

    return container
end

local footer = wibox.widget {
    widget  = wibox.widget.textbox,
    markup  = 'Press <b>Enter to Continue</b> or <b>Escape to Cancel</b>',
    font    = theme.font,
    align   = 'center',
    valign  = 'center',
}

local on_confirm = function()
    spawn(_G.leaver.cmd)
    awesome.emit_signal('leaver::confirm:hide')
end

local on_cancel = function()
    awesome.emit_signal('leaver::confirm:hide')
end

local confirm_button = build_button(theme.leaver_confirm_icon, on_confirm)
local cancel_button = build_button(theme.leaver_cancel_icon, on_cancel)

local create_dialog = function(s)

    s.leaver_confirm = wibox {
        screen      = s,
        type        = 'splash',
        visible     = false,
        ontop       = true,
        fg          = theme.osd_fg,
        bg          = theme.osd_bg,
        height      = s.geometry.height,
        width       = s.geometry.width,
        x           = s.geometry.x,
        y           = s.geometry.y,
    }

    s.leaver_confirm:setup {
        {
            layout = wibox.layout.align.horizontal,
            expand = 'none',
            nil,
            {
                widget = wibox.container.margin,
                top = dpi(10),
                clock,
            },
            nil,
        },
        {
            layout = wibox.layout.align.vertical,
            {
                nil,
                {
                    nil,
                    icon,
                    nil,
                    layout = wibox.layout.align.horizontal,
                    expand = 'none',
                },
                nil,
                layout = wibox.layout.align.vertical,
                expand = 'none',
            },
            {
                nil,
                {
                    message,
                    widget      = wibox.container.margin,
                    margins     = dpi(24),
                },
                nil,
                layout  = wibox.layout.align.horizontal,
                expand  = 'none',
            },
            {
                nil,
                {
                    {
                        confirm_button,
                        cancel_button,
                        layout  = wibox.layout.fixed.horizontal,
                    },
                    widget  = wibox.container.margin,
                    margins = dpi(24),
                },
                nil,
                layout  = wibox.layout.align.horizontal,
                expand  = 'none',
            }
        },
        {
            nil,
            {
                footer,
                widget  = wibox.container.margin,
                bottom  = dpi(10),
            },
            nil,
            layout  = wibox.layout.align.horizontal,
            expand  = 'none',
        },
        layout  = wibox.layout.align.vertical,
        expand  = 'none',
    }
end

local create_backdrop = function(s)
    s.leaver_backdrop = wibox {
        screen      = s,
        type        = 'splash',
        visible     = false,
        ontop       = true,
        fg          = theme.osd_fg,
        bg          = theme.osd_bg,
        height      = s.geometry.height,
        width       = s.geometry.width,
        x           = s.geometry.x,
        y           = s.geometry.y,
    }
end

screen.connect_signal('request::desktop_decoration', function(s)
    create_backdrop(s)
    create_dialog(s)
end)

local screen_grabber = awful.keygrabber {
    auto_start = true,
    stop_event = 'release',
    keypressed_callback = function(_, _, key, _)
        if key == 'Return' then
            on_confirm()
        elseif key == 'Escape' then
            on_cancel()
        end
    end,
    timeout = _V.timeout or 10,
    timeout_callback = function()
        if _V.timeout_run then
            on_confirm()
        else
            on_cancel()
        end
    end,
}

awesome.connect_signal('leaver::confirm:show', function()

    message:set_text(_G.leaver.text)
    icon:set_image(_G.leaver.icon)

    for s in screen do
        s.leaver_backdrop.visible = true
        s.leaver_confirm.visible = false
    end

    awful.screen.focused().leaver_confirm.visible = true
    awful.screen.focused().leaver_backdrop.visible = false

    screen_grabber:start()
end)

awesome.connect_signal('leaver::confirm:hide', function()

    for s in screen do
        s.leaver_backdrop.visible = false
        s.leaver_confirm.visible = false
    end

    screen_grabber:stop()

    _G.leaver = {}
end)
