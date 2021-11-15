local ruled = require('ruled')
local exclude = _G.cfg.vars.dynamic_opacity.exclude

local _M = function()
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
