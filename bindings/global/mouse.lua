------------------------------------------------------------------------------
----- Load global mouse bindings.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')

awful.mouse.append_global_mousebindings({
    awful.button({ }, 1, function()
        _G.menus.main:hide()
        _G.menus.session:hide()
    end),
    awful.button({ }, 3, function()
        _G.menus.main:hide()
        _G.menus.session:hide()
    end),
})

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
