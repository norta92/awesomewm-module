local awful = require("awful")

local vars = {
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
    recolor_titlebar_icons = false,
    recolor_panel_icons = true,
    recolor_layout_icons = true,
    recolor_menu_icons = true,
}

return vars
