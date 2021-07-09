------------------------------------------------------------------------------
----- Get app icon.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local lookup_icon = require('menubar.utils').lookup_icon

local _M = function(context, hints)
    if context ~= 'app_icon' then return end
    local path = lookup_icon(hints.app_icon)
                 or lookup_icon(hints.app_icon:lower())
    if path then
        return path
    end
end

return _M
