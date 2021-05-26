local awful = require("awful")

local main_menu = require("widgets.menus").main()

awful.mouse.append_global_mousebindings({
    awful.button({ }, 1, function() main_menu:hide() end),
    awful.button({ }, 3, function() main_menu:hide() end),
})

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
