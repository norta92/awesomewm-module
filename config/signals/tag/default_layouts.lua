local awful = require("awful")
local vars = require("config.vars")

local tag = tag

-- Table of layouts, order matters
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts(vars.layout_list)
end)
