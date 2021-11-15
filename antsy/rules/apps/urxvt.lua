------------------------------------------------------------------------------
----- Urxvt.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local ruled = require('ruled')

-- Urxvt rules.
local _M = function()
    -- Make titlebar transparent to match terminal
    ruled.client.append_rule {
        id           = 'titlebars',
        rule_any     = {
            class    = { 'URxvt' },
            instance = { 'URxvt' }
        },
        properties = {
            transparent_titlebar = true,
            size_hints_honor = false
        }
    }
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
