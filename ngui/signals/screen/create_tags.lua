local awful = require('awful')
local vars = _G.cfg.vars.tags

local _V = {
    list = vars.list or nil,
    auto = vars.auto or 9,
}

screen.connect_signal('request::desktop_decoration', function(s)
    if not _V.list then
        _V.list = {}
        for n = 1,_V.auto,1 do
            table.insert(_V.list, n)
        end
    end

    --if type(_V.list[1]) == 'table' then
    --    awful.tag(_V.list[s], s, awful.layout.layouts[1])
    --else
    --    awful.tag(_V.list, s, awful.layout.layouts[1])
    --end

        awful.tag(_V.list, s, awful.layout.layouts[1])
end)
