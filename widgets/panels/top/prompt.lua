local awful = require("awful")
local theme = require("beautiful")
local wibox = require("wibox")
local mod = require("bindings.mod")
local common = require("utils.common")

local _M = function(s)

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

    prompt_widget:connect_signal("mouse::enter", common.on_hover_color)
    prompt_widget:connect_signal("mouse::leave", common.on_unhover_color)

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

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
