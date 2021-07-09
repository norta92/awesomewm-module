------------------------------------------------------------------------------
----- Change client opacity on focus\unfocus.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local ruled = require('ruled')
local exclude = _G.conf.vars.dynamic_opacity.exclude

--- Add dynamic_opacity rule.
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

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
