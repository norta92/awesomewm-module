local awful = require('awful')

local _M = {}

_M.layouts = {
    list = {
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.tile.left,
    },
}

_M.tags = {
    auto = 4,
    list = nil, -- {'one','two','three'},
--    list = {
--        {'one','two','three'},
--        {'four','five','six'},
--    }
}

_M.focus = {
    auto = true,
    raise = false,
    sloppy = true,
}

_M.dynamic_opacity = {
    focus = 0.9,
    unfocus = 0.85,
    exclude = {
        instance = { 'vlc', 'valheim.x86_64' },
        class = { 'vlc', 'mpv', 'valheim.x86_64' },
    },
}

_M.rounded_corners = {
    radius = 4,
}

_M.top_bar = {
    clock = {
        show_calendar = true,
    },
    tasklist = {
        button_width = 240,
        menu_width = 160,
    },
    systray = {
        autohide = false,
    },
}

_M.backdrop = {
    path = os.getenv('HOME')..'/Wallpapers/Shuffle/',             -- path to image or directory to shuffle
    mode = 'shuffle',       -- single, shuffle, slideshow
    scale = 'max',          -- center, tile, max, fit
    color = '#333',         -- color to set if no image found (or path is nil)
    span = false,           -- span multiple screens
    timeout = 10,           -- how often to shuffle wallpaper (in minutes)
}

_M.leaver = {
    timeout = 10,
    timeout_run = false,
}

return _M
