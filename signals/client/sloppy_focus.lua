------------------------------------------------------------------------------
----- Enable sloppy focus with mouse.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module signals.client.sloppy_focus
------------------------------------------------------------------------------

local _M = function(c)
    c:activate {
        context = "mouse_enter",
        raise = false,
    }
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
