local awful = require('awful')
local mod = require('bindings.mod')

local _M = function(s)
    s.prompt =  awful.widget.prompt()

    local widget = s.prompt

    return widget
end

awful.keyboard.append_global_keybindings({
    awful.key({ mod.super }, "r",
        function()
            awful.screen.focused().prompt:run()
        end,
        {description = "Run Command", group = "launcher"}),
    awful.key({ mod.super }, "x",
        function ()
            awful.prompt.run {
                prompt       = "Run Lua code: ",
                textbox      = awful.screen.focused().prompt.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        {description = "Eval Lua", group = "awesome"}),
})

return _M
