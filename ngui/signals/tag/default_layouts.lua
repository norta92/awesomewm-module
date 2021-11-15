local awful = require('awful')
local vars = _G.cfg.vars.layouts

tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts(
        vars.list or { awful.layouts.suit.floating }
    )
end)
