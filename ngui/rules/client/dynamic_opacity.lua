local ruled = require('ruled')
local cfg_vars = _G.cfg.vars.client.dynamic_opacity

local _M = function(kwargs)
    local args = cfg_vars or kwargs or {}
    local exclude = args.exclude or {}

    ruled.client.append_rule {
        id       = 'dynamic_opacity',
        rule_any = {
            instance = exclude.instance,
            class = exclude.class,
        },
        properties = {
            exclude_opacity = true,
        },
    }
end

return _M
