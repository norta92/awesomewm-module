local theme = require("beautiful")
local surface = require("gears.wallpaper")

local screen = screen

screen.connect_signal("request::wallpaper", function(s)
    if theme.wallpaper then
        local wallpaper = theme.wallpaper
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        surface.maximized(wallpaper, s, true)
    end
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
