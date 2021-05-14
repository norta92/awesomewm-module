local client = client

client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
