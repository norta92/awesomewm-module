local screen = screen

screen.connect_signal("request::desktop_decoration", function(s)
    require("signals.screen.create_tag_table")(s)
    require("widgets.panels.top")(s)
    require("widgets.wallpaper")()
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
