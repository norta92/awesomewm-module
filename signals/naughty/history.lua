------------------------------------------------------------------------------
----- Log notifications to a file.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module signals.naughty.history
------------------------------------------------------------------------------

local io = io

local cache = _G.conf.paths.cache
local history_file = cache .. "/notification_history"

--- Log notifications.
-- @param n
local _M = function(n)
    local file = io.open(history_file, "a")
    file:write(n.title .. ": " .. n.message .. "\n")
    file:close()
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
