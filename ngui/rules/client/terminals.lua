local ruled = require('ruled')

local _M = function()
    ruled.client.append_rule {
        id           = 'titlebars',
        rule_any     = {
            class    = { 'URxvt', 'XTerm', 'UXTerm' },
            instance = { 'urxvt', 'xterm' }
        },
        properties = {
            transparent_titlebar = true,
            size_hints_honor = false
        }
    }
end

return _M
