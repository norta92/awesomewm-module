local awful = require("awful")
require("awful.autofocus")

local client = client

client.connect_signal("request::manage", function(c)
    awful.titlebar.show(c)
    require("signals.client.position_on_screen")(c)
    require("signals.client.center_over_parent")(c)
end)

client.connect_signal("request::titlebars", function(c)
    require("widgets.titlebars")(c)
end)

client.connect_signal("request::default_keybindings", function()
    require("bindings.client.keys")
end)

client.connect_signal("request::default_mousebindings", function()
    require("bindings.client.mouse")
end)

client.connect_signal("mouse::enter", function(c)
    require("signals.client.sloppy_focus")(c)
end)

client.connect_signal("focus", function(c)
    require("signals.client.dynamic_opacity").focus(c)
end)

client.connect_signal("unfocus", function(c)
    require("signals.client.dynamic_opacity").unfocus(c)
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
