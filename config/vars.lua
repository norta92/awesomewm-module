------------------------------------------------------------------------------
----- Variables configuration
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module config.vars
------------------------------------------------------------------------------

local awful = require('awful')

--- Variables table.
local _M = {}

-- Theme list
_M.themes = {
    'antsy-next',       -- 1
    'antsy-classic',    -- 2
}
_M.themes.active = _M.themes[1]

-- Tag names
_M.tags = {
    -- List of named tags or nil
    --list = {' term', ' webs', ' comm', ' code', ' util', ' play'},
    list = nil,
    -- Number of tags to create if tag_list is nil
    auto = 4,
}

-- Default layouts
_M.layouts = {
    list = {
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.tile.top,
        awful.layout.suit.tile.left,
    },
}

-- Dynamic opacity
_M.dynamic_opacity = {
    focus = 0.95,
    unfocus = 0.8,
    exclude = {
        instance = {'vlc', 'valheim.x86_64'},
        class = {'mpv', 'vlc', 'valheim.x86_64'},
    },
}

-- Wallpaper
_M.wallpaper = {
    path = nil,
    mode = 3,
    color = '#333',
    span = false,
    timeout = 3600,
}

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
