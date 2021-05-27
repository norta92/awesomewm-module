local awful = require("awful")
local mod = require("bindings.mod")

local _M = function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function(c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ mod.super }, 1, function(c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({ mod.super }, 3, function(c)
            c:activate { context = "mouse_click", action = "mouse_resize" }
        end),
    })
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker