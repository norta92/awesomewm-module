local tag = tag

tag.connect_signal("request::default_layouts", function()
    require("signals.tag.default_layouts")
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
