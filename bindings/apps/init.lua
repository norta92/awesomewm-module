------------------------------------------------------------------------------
----- Load application specific bindings.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

return {
    require('bindings.apps.mpc'),
    require('bindings.apps.pactl'),
    require('bindings.apps.xbacklight'),
    require('bindings.apps.rofi'),
    require('bindings.apps.screen-capture'),
    require('bindings.apps.touchpad-toggle'),
}

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
