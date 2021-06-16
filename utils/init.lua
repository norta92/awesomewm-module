----------------------------------------------------------------------------
----- Utils library.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2021 Jeff M. Hubbard
---- @module utils
------------------------------------------------------------------------------
--

local os = os
local awful = require("awful")
local theme = require("beautiful")
local lfs = require("lfs")
local cairo = require('lgi').cairo
local rsvg = require('lgi').Rsvg

-- theme.hover_color

local _M = {}

--- Check if path is a directory.
---- @param path
_M.is_dir = function(path)
    if type(path) ~= "string" then return false end
    local cd = lfs.currentdir()
    local is = lfs.chdir(path) and true or false
    lfs.chdir(cd)
    return is
end

--- Check if path is a file.
---- @param path
_M.is_file = function(path)
    if type(path) ~= "string" then return false end
    if not _M.is_dir(path) then
        return os.rename(path, path) and true or false
    end
    return false
end

--- Set background color of widget, store previous.
---- @param widget
_M.on_hover_color = function(widget)
    if widget.bg ~= theme.hover_color then
        widget.backup = widget.bg
        widget.has_backup = true
    end
    widget.bg = theme.hover_color
end

--- Restore background color of widget.
---- @param widget
_M.on_unhover_color = function(widget)
    if widget.has_backup then
        widget.bg = widget.backup
    end
end

--- Calculate menu coords by corner (tl, tr, bl, br).
---- @param corner
_M.set_menu_position = function(corner)
    local position = corner or "tl"
    local screen_width = 0
    local screen_height = 0

    local index = awful.screen.focused().index
    local menu_width = theme.menu_width+(theme.menu_border_width*2)

    for s = 1, screen.count() do
        screen_width = screen_width + screen[s].geometry.width
        screen_height = screen[s].geometry.height
        if s == index then break end
    end

    if position == "tr" then
        return {
            x = screen_width-menu_width,
            y = 0,
        }
    elseif position == "bl" then
        return {
            x = 0,
            y = screen_height,
        }
    elseif position == "br" then
        return {
            x = screen_width-menu_width,
            y = screen_height,
        }
    else
        return {
            x = 0,
            y = 0,
        }
    end
end

--- Create image from raw SVG, optional replace color.
---- @param svg
---- @param color
---- @param replace
---- @param size
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
