local awful = require("awful")

local _M = {
    -- List of named tags or nil
    --tag_list = {' term', ' webs', ' comm', ' code', ' util', ' play'},
    tag_list = nil,
    -- Number of tags to create if tag_list is nil
    auto_tags = 4,
    -- Default layouts
    layout_list = {
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.tile.top,
        awful.layout.suit.tile.left,
    },
    -- Recolor icons
    recolor_titlebar_icons = false,
    recolor_panel_icons = false,
    recolor_layout_icons = true,
    recolor_menu_icons = false,
    recolor_session_icons = false,
    -- Dynamic opacity
    dynamic_opacity = {
        focus = 0.95,
        unfocus = 0.8,
    },
    exclude_opacity = {
        instance = {"vlc", "valheim.x86_64"},
        class = {"mpv", "vlc", "valheim.x86_64"},
    },
    -- Wallpaper
    wallpaper_path = nil,
    wallpaper_mode = 3,
    wallpaper_color = "#333",
    wallpaper_span = false,
    wallpaper_timeout = 3600,
}

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
