local awful = require("awful")
local vars = require("config.vars")

local _M = function()
    awful.layout.append_default_layouts(vars.layout_list)
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
