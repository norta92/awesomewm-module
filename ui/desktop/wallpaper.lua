local theme = require("beautiful")
local gears = require("gears")
local config_path = gears.filesystem.get_configuration_dir()
local vars = require("config.vars")
local common = require("utils.common")
local scandir = require("utils.common").scandir

local screen = screen
local math, string = math, string

-- theme.ui_alt_color
-- vars.wallpaper_path
-- vars.wallpaper_span
-- vars.wallpaper_timeout

local default_path = config_path .. "/theme/assets/wallpaper/"
local file_path = vars.wallpaper_path or default_path
local fallback_color = theme.ui_alt_color or "#333333"

local set_wallpaper = function(path)
    for s = 1, screen.count() do
        if vars.wallpaper_span then s = nil end
        gears.wallpaper.maximized(path, s, false)
    end
end


--[[
  Native wallpaper shuffler
  Based on https://gist.github.com/anonymous/37f3b1c58d6616cab756
--]]
local file_filter = function(file)
    return string.match(file,"%.png$") or string.match(file,"%.jpg$")
end

local get_new_index = function(index, total)
    local i = index or 1
    local t = total or 1
    local o = i
    while o == i do
        i = math.random(1, t)
    end
    return i
end

local set_selected_wallpaper = function(path, files, index)
    for s = 1, screen.count() do
        if vars.wallpaper_span then s = nil end
        gears.wallpaper.maximized(path .. "/" .. files[index], s, false)
    end
end

local wallpaper_shuffler = function()
    local files = scandir(file_path, file_filter)
    local index = get_new_index(1, #files)
    set_selected_wallpaper(file_path, files, index)

    local timeout = vars.wallpaper_timeout or 300
    if timeout >= 1 then

        local timer = gears.timer { timeout = timeout }
        timer:connect_signal("timeout", function()
            index = get_new_index(index, #files)
            set_selected_wallpaper(file_path, files, index)

            timer:stop()
            timer:start()
        end)

        timer:start()
    end
end
--]]

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

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
