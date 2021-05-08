local awful = require("awful")
local theme = require("beautiful")
local wibox = require("wibox")
local mod = require("config.bindings.mod")

-- theme.margins
-- theme.hover_color

local promptbox = function(s)

    s.prompt = awful.widget.prompt()

    local prompt_widget = wibox.widget {
        {
            nil,
            {
                {
                    widget = s.prompt,
                },
                margins = theme.margins,
                widget = wibox.container.margin,
            },
            layout = wibox.layout.align.vertical,
        },
        widget = wibox.container.background,
    }

    prompt_widget:connect_signal("mouse::enter", function(widget)
        if widget.bg ~= theme.hover_color then
            widget.backup = widget.bg
            widget.has_backup = true
        end
        widget.bg = theme.hover_color
    end)
    prompt_widget:connect_signal("mouse::leave", function(widget)
        if widget.has_backup then
            widget.bg = widget.backup
        end
    end)

    return prompt_widget
end

awful.keyboard.append_global_keybindings({
    awful.key({ mod.super, mod.alt }, "r", function() awful.screen.focused().prompt:run() end,
              {description = "run prompt", group = "Awesome: core"}),
    awful.key({ mod.super, mod.alt }, "x",
              function()
                  awful.prompt.run {
                    prompt       = "Run Lua: ",
                    textbox      = awful.screen.focused().prompt.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "Awesome: core"}),
})

return promptbox

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80:foldmethod=marker
