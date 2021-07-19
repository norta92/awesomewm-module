------------------------------------------------------------------------------
----- Connect screen signals.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module signals.screen
------------------------------------------------------------------------------

local awful = require('awful')

local screen = screen

--- When new screen is added.
-- @param s
screen.connect_signal('added', function()

    -- Focus primary screen
    awful.screen.focus(screen.primary)

end)

--- When the decorations need to be added to a new screen.
-- @param s
screen.connect_signal('request::desktop_decoration', function(s)

    -- Load screen signals
    require('signals.screen.create_tags')(s)

    -- Load wibars
    require('widgets.panels.top')(s)

end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
