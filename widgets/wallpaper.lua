----------------------------------------------------------------------------
----- Wallpaper setter/shuffler
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module widgets.wallpaper
------------------------------------------------------------------------------

local awful = require("awful")
local gears = require("gears")

local mod = require("bindings.mod")
local wallpaper = _G.conf.vars.wallpaper
local utils = require("utils")

local screen = screen

local math, string = math, string
local collectgarbage = collectgarbage

--- Filter specific image formats.
-- @param file The file to check.
local file_filter = function(file)
    return string.match(file,"%.png$")
        or string.match(file,"%.jpg$")
        or string.match(file,"%.svg$")
end

--- Return table of file paths.
-- @param lines The output of ls.
local get_files = function(lines)
    local files = {}
    for file in lines:gmatch("[^\r\n]+") do
        if file_filter(file) then
            local filepath = file
            table.insert(files, filepath)
        end
    end

    return files
end

--- Return random and unique table index.
-- @param index The last index used.
-- @param total The total number of items in table.
local get_index = function(index, total)
    local old = index

    while old == index do
        index = math.random(1, total)
    end

    return index
end

--- Get image path from table.
-- @param path The directory containing the images
-- @param files The files table.
-- @param index The table index to use.
local get_image = function(path, files, index)
    return path .. "/" .. files[index]
end

--- Set wallpaper for screen.
-- @param image The image path.
-- @param mode The display mode (centered, tiled, maximized, fit).
-- @param s The screen to set the wallpaper for. Set to nil to span.
local set_wallpaper = function(image, mode, s)
    local color = wallpaper.color or "#333"

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

--- Set keybinding to shuffle wallpaper.
-- @param timer The shuffle timer.
local set_keybinding = function(timer)
    awful.keyboard.append_global_keybindings({
        awful.key({ mod.super, mod.alt }, "w", function()
                timer:emit_signal("timeout")
        end,
        {description = "set random wallpaper", group = "Awesome: extras"})
    })
end

local path = wallpaper.path
local mode = wallpaper.mode or 3
local span = wallpaper.span or false
local color = wallpaper.color or "#333"
local timeout = wallpaper.timeout or 300
local timer = gears.timer { timeout = timeout }

-- If path is directory, enable shuffler
if utils.is_dir(path) then
    awful.spawn.easy_async('ls -a "'.. path .. '"', function(lines)
        local files = get_files(lines)
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
    end)
-- If path is file, set single wallpaper
elseif utils.is_file(path) then
    for s = 1, screen.count() do
        if span then s = nil end
        set_wallpaper(path, mode, s)
        if span then break end
    end
-- If anything else, set solid color
else
    gears.wallpaper.set(color)
end

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
