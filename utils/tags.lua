-- Dynamic tagging from lain/util/init.lua
-- https://github.com/lcpz/lain

local awful = require("awful")

local _M = {}

-- Add a new tag
function _M.add_tag(layout)
    awful.prompt.run {
        prompt       = "New: ",
        textbox      = awful.screen.focused().prompt.widget,
        exe_callback = function(name)
            if not name or #name == 0 then return end
            awful.tag.add(name, { screen = awful.screen.focused(), layout = layout or awful.layout.suit.tile }):view_only()
        end
    }
end

-- Rename current tag
function _M.rename_tag()
    awful.prompt.run {
        prompt       = "Rename: ",
        textbox      = awful.screen.focused().prompt.widget,
        exe_callback = function(new_name)
            if not new_name or #new_name == 0 then return end
            local t = awful.screen.focused().selected_tag
            if t then
                t.name = new_name
            end
        end
    }
end

-- Move current tag
-- pos in {-1, 1} <-> {previous, next} tag position
function _M.move_tag(pos)
    local tag = awful.screen.focused().selected_tag
    if tonumber(pos) <= -1 then
        awful.tag.move(tag.index - 1, tag)
    else
        awful.tag.move(tag.index + 1, tag)
    end
end

-- Delete current tag
-- Any rule set on the tag shall be broken
function _M.delete_tag()
    local t = awful.screen.focused().selected_tag
    if not t then return end
    t:delete()
end

return _M
