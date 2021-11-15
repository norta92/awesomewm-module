local theme = require('beautiful')
local gears = require('gears')

screen.connect_signal("request::wallpaper", function(s)
    if theme.wallpaper then
        local wallpaper = theme.wallpaper
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)
