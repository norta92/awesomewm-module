-- Native wallpaper shuffler
-- Based on https://gist.github.com/anonymous/37f3b1c58d6616cab756

local gears = require("gears")
local config_path = gears.filesystem.get_configuration_dir()
local default_path = config_path .. "/theme/assets/wallpaper/"
local scandir = require("utils.common").scandir
local vars = require("config.vars")

local screen = screen

screen.connect_signal("request::wallpaper", function()

    -- Find wallpapers
    local path = vars.wallpaper_path or default_path
    local filter = function(str)
        return string.match(str,"%.png$") or string.match(str,"%.jpg$")
    end
    local files = scandir(path, filter)

    -- Set random wallpaper
    local index = math.random(1, #files)
    for s = 1, screen.count() do
        gears.wallpaper.maximized(path .. "/" .. files[index], s, true)
    end

    -- Setup timer, timeout of 0 disables timer
    local timeout = vars.wallpaper_timeout or 300
    if timeout >= 1 then
        local timer = gears.timer { timeout = timeout }

        timer:connect_signal("timeout", function()
            -- Get new random wallpaper
            index = math.random(1, #files)
            for s = 1, screen.count() do
                gears.wallpaper.maximized(path .. "/" .. files[index], s, true)
            end

            -- Restart timer
            timer:stop()
            timer:start()
        end)

        -- Start initial timer
        timer:start()
    end

end)

