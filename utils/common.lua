local theme = require("beautiful")

local ipairs = ipairs

local common = {

    scandir = function(directory, filter)
        local i, t, popen = 0, {}, io.popen
        if not filter then
            filter = function() return true end
        end
        for filename in popen('ls -a "'..directory..'"'):lines() do
            if filter(filename) then
                i = i + 1
                t[i] = filename
            end
        end
        return t
    end,

    has_value = function(table, value)
        for _, v in ipairs(table) do
            if v == value then return true end
        end
        return false
    end,

    on_hover_color = function(widget)
        if widget.bg ~= theme.hover_color then
            widget.backup = widget.bg
            widget.has_backup = true
        end
        widget.bg = theme.hover_color
    end,

    on_unhover_color = function(widget)
        if widget.has_backup then
            widget.bg = widget.backup
        end
    end,
}

return common

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
