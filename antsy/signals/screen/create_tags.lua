------------------------------------------------------------------------------
----- Create tags from tag list or auto tags.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')

local vars = _G.conf.vars

--- Creats tags from list and initial layout.
-- @param s
local _M = function(s)
    local list = vars.tags.list or nil
    local auto = vars.tags.auto or 9

    if not list then
        list = {}
        for n = 1,auto,1 do
            table.insert(list, n)
        end
    end

    awful.tag(list, s, awful.layout.layouts[1])
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
