local awful = require('awful')
local cfg_vars = _G.cfg.vars.tag.default_layouts

local _M = function(kwargs)
    local args = cfg_vars or kwargs or {}
    local layouts = args.layouts or {
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.spiral,
        awful.layout.suit.spiral.dwindle,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
        awful.layout.suit.magnifier,
        awful.layout.suit.corner.nw,
    }

    tag.connect_signal('request::default_layouts', function()
        awful.layout.append_default_layouts(layouts)
    end)
end

return _M
