local opacity = require("config.vars").dynamic_opacity

local _M = {}

_M.focus = function(c)
    c.opacity = opacity.focus or 1
end

_M.unfocus = function(c)
    if c.fullscreen or c.exclude_opacity then
        return
    end
    c.opacity = opacity.unfocus or 0.9
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
