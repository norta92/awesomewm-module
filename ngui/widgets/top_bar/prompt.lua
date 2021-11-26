local awful = require('awful')
local mod = require('bindings.mod')

local cfg_vars = _G.cfg.vars.top_bar.prompt

local _M = function(screen, kwargs)
    local s = screen
    local args = cfg_vars or kwargs or {}
    local prompt_text = args.prompt_text or 'Run: '

    s.prompt = awful.widget.prompt({prompt=prompt_text})

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

    return s.prompt
end

return _M
