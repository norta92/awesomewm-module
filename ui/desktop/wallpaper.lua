local awful = require("awful")
local gears = require("gears")

local mod = require("config.bindings.mod")
local vars = require("config.vars")
local common = require("utils.common")

local screen = screen

local math, string = math, string
local collectgarbage = collectgarbage

-- mod.alt
-- mod.super
-- vars.wallpaper_path
-- vars.wallpaper_mode
-- vars.wallpaper_color
-- vars.wallpaper_span
-- vars.wallpaper_timeout
-- common.is_dir
-- common.is_file
-- common.scandir

local file_filter = function(file)
    return string.match(file,"%.png$")
        or string.match(file,"%.jpg$")
        or string.match(file,"%.svg$")
end

local get_index = function(index, total)
    local old = index

    while old == index do
        index = math.random(1, total)
    end

    return index
end

local get_image = function(path, files, index)
    return path .. "/" .. files[index]
end

local set_wallpaper = function(image, mode, s)
    local color = vars.wallpaper_color or "#333"

    if mode == 1 then
        gears.wallpaper.centered(image, s, color, 1)
    elseif mode == 2 then
        gears.wallpaper.tiled(image, s, {0,0})
    elseif mode == 3 then
        gears.wallpaper.maximized(image, s, false, {0,0})
    elseif mode == 4 then
        gears.wallpaper.fit(image, s, color)
    else
        gears.wallpaper.set(image)
    end

    collectgarbage("step", 4000)
end

local set_keybinding = function(timer)
    awful.keyboard.append_global_keybindings({
        awful.key({ mod.super, mod.alt }, "w", function()
                timer:emit_signal("timeout")
        end,
        {description = "Random wallpaper", group = "Awesome: extras"})
    })
end

local path = vars.wallpaper_path
local mode = vars.wallpaper_mode or 3
local span = vars.wallpaper_span or false
local color = vars.wallpaper_color or "#333"
local timeout = vars.wallpaper_timeout or 300
local timer = gears.timer { timeout = timeout }

if common.is_dir(path) then
    local files = common.scandir(path, file_filter)
    local index = get_index(1, #files)
    local image = get_image(path, files, index)

    for s = 1, screen.count() do
        if span then s = nil end
        set_wallpaper(image, mode, s)
        if span then break end
    end

    if timeout >= 1 then
        timer:connect_signal("timeout", function()
            timer:stop()

            index = get_index(index, #files)
            image = get_image(path, files, index)

            for s = 1, screen.count() do
                if span then s = nil end
                set_wallpaper(image, mode, s)

                if span then break end
            end

            timer.timeout = timeout
            timer:start()
        end)

        timer:start()
    end

    if timer.started then
        set_keybinding(timer)
    end

elseif common.is_file(path) then
    for s = 1, screen.count() do
        if span then s = nil end
        set_wallpaper(path, mode, s)
        if span then break end
    end

else
    gears.wallpaper.set(color)
end

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
