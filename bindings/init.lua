------------------------------------------------------------------------------
----- Setup key and mouse bindings.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module bindings
------------------------------------------------------------------------------

return {
    require("bindings.global.keys"),
    require("bindings.global.mouse"),
    require("bindings.client.keys"),
    require("bindings.client.mouse"),
    require("bindings.apps"),
}

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
