------------------------------------------------------------------------------
----- Connect tag signals.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local tag = tag

--- When the default layouts are requested.
tag.connect_signal('request::default_layouts', function()
    require('signals.tag.default_layouts')()
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
