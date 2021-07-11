------------------------------------------------------------------------------
----- Main configuration
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')

--- Variables table.
local _M = {}

--- Theme
-- Table of themes
_M.themes = {
    'antsy-next',       -- 1
    'antsy-classic',    -- 2
}
-- Active theme
_M.themes.active = _M.themes[1]

--- Wallpaper
-- Settings for widgets.wallpaper
_M.wallpaper = {
    path = nil,         -- path to image or directory to shuffle
    mode = 'max',       -- center, tile, max, fit
    color = '#333',     -- color to set if no image found (or path is nil)
    span = false,       -- span multiple screens
    timeout = 3600,     -- how often to shuffle wallpaper
}

--- Tags
_M.tags = {
    auto = 4,           -- number of tags to create if tags.list is nil
    list = nil,         -- List of named tags or nil
    --list = {' term', ' www', ' comms', ' code', ' tools', ' r&r'},
}

--- Layouts
_M.layouts = {
    list = {            -- defaults (order matters)
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        --awful.layout.suit.tile.bottom,
        awful.layout.suit.fair,
        --awful.layout.suit.fair.horizontal,
        --awful.layout.suit.tile.top,
        awful.layout.suit.tile.left,
    },
}

--- Dynamic opacity
-- Settings for signals.client.dynamic_opacity
_M.dynamic_opacity = {
    focus = 1.0,        -- focused opacity
    unfocus = 0.9,      -- unfocused opacity
    exclude = {         -- apps to be excluded
        instance = {'vlc', 'valheim.x86_64'},
        class = {'mpv', 'vlc', 'valheim.x86_64'},
    },
}

--- Rofi
_M.rofi = {
    follow_theme = true,    -- call rofi with matching theme
    location = 0,           -- where rofi is located on screen
    offset = { 0, -120 },   -- offset from location
}

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
