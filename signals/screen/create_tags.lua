local awful = require("awful")

local vars = require("config.vars")

local _M = function(s)
    local tag_list = vars.tag_list or nil
    local auto_tags = vars.auto_tags or 9

    if not tag_list then
        tag_list = {}
        for n = 1,auto_tags,1 do
            table.insert(tag_list, n)
        end
    end

    awful.tag(tag_list, s, awful.layout.layouts[1])
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
