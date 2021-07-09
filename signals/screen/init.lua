------------------------------------------------------------------------------
----- Connect screen signals.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local screen = screen

--- When the decorations need to be added to a new screen.
-- @param s
screen.connect_signal('request::desktop_decoration', function(s)

    -- Load screen signals
    require('signals.screen.create_tags')(s)

    -- Load wibars
    require('widgets.panels.top')(s)

end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
