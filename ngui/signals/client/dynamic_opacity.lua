local cfg_vars = _G.cfg.vars.client.dynamic_opacity

local _M = function(kwargs)
    local args = cfg_vars or kwargs or {}
    local focus = args.focus or 1
    local unfocus = args.unfocus or 1

    client.connect_signal('focus', function(c)
        if not (c.exclude_opacity or c.fullscreen) then
            c.opacity = focus
        end
    end)

    client.connect_signal('unfocus', function(c)
        if not (c.exclude_opacity or c.fullscreen) then
            c.opacity = unfocus
        end
    end)
end

return _M
