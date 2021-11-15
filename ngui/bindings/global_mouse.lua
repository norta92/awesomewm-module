local awful = require('awful')

local hide_menus = function()
    for _, menu in pairs(_G.menus) do
        menu:hide()
    end
end

awful.mouse.append_global_mousebindings({
    awful.button({ }, 1, function () hide_menus() end),
    awful.button({ }, 3, function () hide_menus() end),
})
