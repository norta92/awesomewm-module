local awful = require('awful')
local cfg_vars = _G.cfg.vars.screen.create_tags

local _M = function(kwargs)
    local args = cfg_vars or kwargs or {}
    local list = args.list or nil
    local auto = args.auto or 9

    screen.connect_signal('request::desktop_decoration', function(s)
        if not list then
            list = {}
            for n = 1,auto,1 do
                table.insert(list, n)
            end
        end

            awful.tag(list, s, awful.layout.layouts[1])
    end)
end

return _M
