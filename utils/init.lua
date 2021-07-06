------------------------------------------------------------------------------
----- Utils library.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module utils
------------------------------------------------------------------------------

local awful = require("awful")
local theme = require("beautiful")
local lfs = require("lfs")
local cairo = require('lgi').cairo
local rsvg = require('lgi').Rsvg

local os, screen = os, screen

local _M = {}

--- Test if path is a directory.
-- @param path The path to check.
_M.is_dir = function(path)
    if type(path) ~= "string" then return false end
    local cd = lfs.currentdir()
    local is = lfs.chdir(path) and true or false
    lfs.chdir(cd)
    return is
end

--- Test if path is a file.
-- @param path The path to check.
_M.is_file = function(path)
    if type(path) ~= "string" then return false end
    if not _M.is_dir(path) then
        return os.rename(path, path) and true or false
    end
    return false
end

--- Calculate menu coords by corner.
-- @param corner Then corner to position menu in (tl, tr, bl, br).
_M.set_menu_position = function(corner)
    local width = 0
    local height = 0

    local index = awful.screen.focused().index
    local menu_width = theme.menu_width+(theme.menu_border_width*2)

    for s = 1, screen.count() do
        width = width + screen[s].geometry.width
        height = screen[s].geometry.height
        if s == index then break end
    end

    if corner == "tr" then
        return {
            x = width-menu_width,
            y = 0,
        }
    elseif corner == "bl" then
        return {
            x = 0,
            y = height,
        }
    elseif corner == "br" then
        return {
            x = width-menu_width,
            y = height,
        }
    else
        return {
            x = 0,
            y = 0,
        }
    end
end

--- Create image from SVG, optional replace color.
-- @param svg The string containing SVG data.
-- @param color The color of resulting image
-- @param replace The color to replace in data.
-- @param size The size of the image
_M.svg_to_surface = function(svg, color, replace, size)
    if not svg then return end
    color = color or nil
    replace = replace or "#ffffff"
    size = size or 16
    local surface = cairo.ImageSurface(cairo.Format.ARGB32, size, size)
    local context = cairo.Context(surface)
    if color then
        svg = string.gsub(svg, replace, color)
    end
    rsvg.Handle.new_from_data(svg):render_cairo(context)
    return surface
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
