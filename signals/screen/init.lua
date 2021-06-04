local screen = screen

_G.main_menu = require("widgets.menus.main")()
_G.session_menu = require("widgets.menus.session")()

screen.connect_signal("request::desktop_decoration", function(s)
    require("signals.screen.create_tags")(s)
    require("widgets.panels.top")(s)
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
