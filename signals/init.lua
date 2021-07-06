------------------------------------------------------------------------------
----- Connect signals.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module signals
------------------------------------------------------------------------------

return {
    require('signals.global'),
    require('signals.tag'),
    require('signals.screen'),
    require('signals.client'),
    require('signals.naughty'),
}

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
