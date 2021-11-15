------------------------------------------------------------------------------
----- Always place clients on screen.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @themevars
----    theme.useless_gap
------------------------------------------------------------------------------

local awful = require('awful')
local theme = require('beautiful')

--- Always place clients on screen.
---- @param c
local _M = function(c)
    if not c.size_hints.user_position
        and not c.size_hints.program_position then
        awful.placement.no_offscreen(c, {
            honor_workarea=true,
            margins=theme.useless_gap
        })
    end
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
