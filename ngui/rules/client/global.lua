local awful = require('awful')
local ruled = require('ruled')

local _M = function()
    ruled.client.append_rule {
        id         = "global",
        rule       = { },
        properties = {
            focus     = awful.client.focus.filter,
            raise     = true,
            screen    = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen,
            callback  = awful.client.setslave,
        }
    }
end

return _M
