local menubar = require("menubar")
local apps = require("config.apps")
local vars = require("config.vars")

menubar.utils.terminal = apps.terminal

require("awful.autofocus")

require("config.bindings")

if vars.tag_list ~= nil then
    -- Use predefined tag names (see config/vars)
    _G.tag_list = vars.tag_list
else
    -- Create numbered tags
    _G.tag_list = {}
    _G.auto_tags = vars.auto_tags or 9
    for n = 1,_G.auto_tags,1 do
        table.insert(_G.tag_list, n)
    end
end

require("config.signals.client")
require("config.signals.tag")
require("config.signals.screen")

require("config.rules")

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
