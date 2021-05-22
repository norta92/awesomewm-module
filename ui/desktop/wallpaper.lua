local theme = require("beautiful")
local gears = require("gears")
local config_path = gears.filesystem.get_configuration_dir()
local default_path = config_path .. "/theme/assets/wallpaper/"
local scandir = require("utils.common").scandir
local vars = require("config.vars")
local common = require("utils.common")

local screen = screen
local math, string = math, string

-- theme.ui_alt_color

local file_path = vars.wallpaper_path or default_path
local fallback_color = theme.ui_alt_color or "#333333"

local set_wallpaper = function(path)
    for s = 1, screen.count() do
        gears.wallpaper.maximized(path, s, true)
    end
end

-- Native wallpaper shuffler
-- Based on https://gist.github.com/anonymous/37f3b1c58d6616cab756
local file_filter = function(file)
    return string.match(file,"%.png$") or string.match(file,"%.jpg$")
end

local get_files = function(path, filter)
    return scandir(path, filter)
end

local set_selected_wallpaper = function(path, files, index)
    for s = 1, screen.count() do
        gears.wallpaper.maximized(path .. "/" .. files[index], s, true)
    end
end

local wallpaper_shuffler = function()
    local files = get_files(file_path, file_filter)
    local index = math.random(1, #files)
    set_selected_wallpaper(file_path, files, index)

    local timeout = vars.wallpaper_timeout or 300
    if timeout >= 1 then

        local timer = gears.timer { timeout = timeout }
        timer:connect_signal("timeout", function()
            local old_index = index
            while old_index == index do
                index = math.random(1, #files)
            end
            set_selected_wallpaper(file_path, files, index)

            timer:stop()
            timer:start()
        end)

        timer:start()
    end
end

screen.connect_signal("request::wallpaper", function()

    if file_path then
        if common.is_dir(file_path) then
            wallpaper_shuffler()
            return
        end

        if common.is_file(file_path) then
            set_wallpaper(file_path)
            return
        end
    else
        gears.wallpaper.set(fallback_color)
    end

end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
