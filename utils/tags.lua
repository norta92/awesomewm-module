------------------------------------------------------------------------------
----- Tag utilites.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')

local _M = {}

-- Dynamic tagging from lain/util/init.lua
-- https://github.com/lcpz/lain
-- {{{

--- Add a new tag.
-- @param layout The default layout of the new tag.
function _M.add_tag(layout)
    local tags = awful.screen.focused().tags
    awful.prompt.run {
        prompt       = 'Add: ',
        text         = tostring(#tags+1),
        textbox      = awful.screen.focused().prompt.widget,
        exe_callback = function(name)
            if not name or #name == 0 then return end
            awful.tag.add(name, {
                screen = awful.screen.focused(),
                layout = layout or awful.layout.suit.tile
            }):view_only()
        end
    }
end

--- Rename current tag.
function _M.rename_tag()
    local tag = awful.screen.focused().selected_tag
    awful.prompt.run {
        prompt       = 'Edit: ',
        text         = tag.name,
        textbox      = awful.screen.focused().prompt.widget,
        exe_callback = function(new_name)
            if not new_name or #new_name == 0 then return end
            if tag then
                tag.name = new_name
            end
        end
    }
end

--- Move current tag.
-- @param pos The direction to move tag (-1, 1).
function _M.move_tag(pos)
    local tag = awful.screen.focused().selected_tag
    if tonumber(pos) <= -1 then
        awful.tag.move(tag.index - 1, tag)
    else
        awful.tag.move(tag.index + 1, tag)
    end
end

--- Delete current tag.
function _M.delete_tag()
    local t = awful.screen.focused().selected_tag
    if not t then return end
    t:delete()
end

-- }}}

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
