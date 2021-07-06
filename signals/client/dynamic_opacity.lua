------------------------------------------------------------------------------
----- Adjust opacity when clients recieve focus\unfocus.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module signals.client.dynamic_opacity
------------------------------------------------------------------------------

local opacity = _G.conf.vars.dynamic_opacity

local _M = {}

--- Set opacity of focused client.
---- @param c
_M.focus = function(c)
    c.opacity = opacity.focus or 1
end

--- Set opacity of unfocused clients.
---- @param c
_M.unfocus = function(c)
    if c.fullscreen or c.exclude_opacity then
        return
    end
    c.opacity = opacity.unfocus or 0.9
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
