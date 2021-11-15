------------------------------------------------------------------------------
----- Client signals library.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')
require('awful.autofocus')

local client = client

--- When new client is added.
-- @param c
client.connect_signal('request::manage', function(c)
    awful.titlebar.show(c)
    require('signals.client.position_on_screen')(c)
    require('signals.client.center_over_parent')(c)
end)

--- When client requests a titlebar.
-- @param c
client.connect_signal('request::titlebars', function(c)
    require('widgets.titlebars')(c)
end)

--- When mouse enters client area.
-- @param c
client.connect_signal('mouse::enter', function(c)
    require('signals.client.sloppy_focus')(c)
end)

--- When client recieves focus.
-- @param c
client.connect_signal('focus', function(c)
    require('signals.client.dynamic_opacity').focus(c)
end)

--- When client loses focus.
-- @param c
client.connect_signal('unfocus', function(c)
    require('signals.client.dynamic_opacity').unfocus(c)
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
