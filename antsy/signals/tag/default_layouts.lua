------------------------------------------------------------------------------
----- Add layout list to default layouts.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')
local vars = _G.conf.vars

--- Add default layouts.
local _M = function()
    awful.layout.append_default_layouts(vars.layouts.list)
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
