------------------------------------------------------------------------------
----- Pinetry dialog.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')
local ruled = require('ruled')

-- Pinentry rules.
local _M = function()
    -- Always center pinetry dialogs
    ruled.client.append_rule {
        id       = 'floating',
        rule_any = {
            instance = { 'pinentry-gtk-2' },
            class = { 'Pinentry-gtk-2' },
        },
        properties = {
            focus     = awful.client.focus.filter,
            raise     = true,
            screen    = awful.screen.preferred,
            placement = awful.placement.centered,
        }
    }
end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
