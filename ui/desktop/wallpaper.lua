-- Native wallpaper shuffler
-- Basedd on https://gist.github.com/anonymous/37f3b1c58d6616cab756

local theme = require("beautiful")
local gears = require("gears")
local config_path = gears.filesystem.get_configuration_dir()
local default_path = config_path .. "/theme/assets/wallpaper/"
local scandir = require("utils.common").scandir

local screen = screen

-- theme.wallpaper_path
-- theme.wallpaper_timeout

screen.connect_signal("request::wallpaper", function()

    local index = 1
    local timeout  = theme.wallpaper_timeout or 300
    local path = theme.wallpaper_path or default_path
    local filter = function(s)
        return string.match(s,"%.png$") or string.match(s,"%.jpg$")
    end
    local files = scandir(path, filter)
    local timer = gears.timer { timeout = timeout }

    timer:connect_signal("timeout", function()

        for s = 1, screen.count() do
            gears.wallpaper.maximized(path .. "/" .. files[index], s, true)
        end

        timer:stop()

        index = math.random(1, #files)

        if timeout == 0 then
            return
        end

        timer.timeout = timeout
        timer:start()
    end)

    timer:start()
end)

