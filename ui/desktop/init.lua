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

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80:foldmethod=marker
