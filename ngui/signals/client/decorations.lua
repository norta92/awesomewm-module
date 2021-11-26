local awful = require('awful')
local theme = require('beautiful')

local cfg_vars = _G.cfg.vars.client.decoration
local _M = function(kwargs)
    local args = cfg_vars or kwargs or {}
    local enabled = args.enable or true

    if enabled then
        client.connect_signal("request::titlebars", function(c)
            require('widgets.titlebar')(c)
        end)

        client.connect_signal("request::manage", function(c)
            awful.titlebar.show(c)
            c.shape = theme.titlebar_shape
        end)
    end
end

return _M
