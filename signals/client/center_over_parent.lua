------------------------------------------------------------------------------
----- Center transient windows over parent.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module signals.client.center_over_parent
------------------------------------------------------------------------------

local awful = require("awful")

--- Center over parent.
---- @param c
local _M = function(c)
    if c.transient_for then
        awful.placement.centered(c, {parent = c.transient_for})
        awful.placement.no_offscreen(c)
    end
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
