local opacity = require("config.vars").dynamic_opacity

local client = client

client.connect_signal("focus", function(c)
    c.opacity = opacity.focus or 1
end)

client.connect_signal("unfocus", function(c)
    if c.fullscreen or c.exclude_opacity then
        return
    end
    c.opacity = opacity.unfocus or 0.9
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
