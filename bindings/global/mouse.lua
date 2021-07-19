------------------------------------------------------------------------------
----- Load global mouse bindings.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @submodule bindings
------------------------------------------------------------------------------

local awful = require('awful')

local pairs = pairs

local hide_menus = function()
    for _, m in pairs(_G.menus) do
        m:hide()
    end
end

awful.mouse.append_global_mousebindings({
    awful.button({ }, 1, function()
        hide_menus()
    end),
    awful.button({ }, 3, function()
        hide_menus()
    end),
})

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
