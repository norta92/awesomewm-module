local theme = require("beautiful")
local lfs = require("lfs")

local io, ipairs, os = io, ipairs, os

-- theme.hover_color

local common = {}

common.is_dir = function(path)
    if type(path) ~= "string" then return false end
    local cd = lfs.currentdir()
    local is = lfs.chdir(path) and true or false
    lfs.chdir(cd)
    return is
end


common.is_file = function(path)
    if type(path) ~= "string" then return false end
    if not common.is_dir(path) then
        return os.rename(path, path) and true or false
    end
    return false
end

common.scandir = function(dir, filter)
    local index, files, popen = 0, {}, io.popen
    if not filter then
        filter = function() return true end
    end
    for file in popen('ls -a "'.. dir .. '"'):lines() do
        if filter(file) then
            index = index + 1
            files[index] = file
        end
    end
    return files
end

common.has_value = function(table, value)
    for _, v in ipairs(table) do
        if v == value then return true end
    end
    return false
end

common.on_hover_color = function(widget)
    if widget.bg ~= theme.hover_color then
        widget.backup = widget.bg
        widget.has_backup = true
    end
    widget.bg = theme.hover_color
end

common.on_unhover_color = function(widget)
    if widget.has_backup then
        widget.bg = widget.backup
    end
end

return common

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
