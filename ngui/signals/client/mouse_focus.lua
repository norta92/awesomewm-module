local cfg_vars = _G.cfg.vars.client.mouse_focus

local _M = function(kwargs)
    local args = cfg_vars or kwargs or {}
    local auto = args.auto or true
    local sloppy = args.sloppy or false
    local raise = args.raise or false

    if auto then
        require("awful.autofocus")
    end

    client.connect_signal('mouse::enter', function(c)
        if sloppy then
            c:activate { context = 'mouse_enter', raise = raise }
        end
    end)

end

return _M
