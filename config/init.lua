------------------------------------------------------------------------------
----- Global configuration
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')

-- Misc. options that don't have a better place to go

-- Enable auto DPI support
awful.screen.set_auto_dpi_enabled(true)

-- Disable tooltips on titlebar
awful.titlebar.enable_tooltip = false

-- Enable window snap
awful.mouse.snap.edge_enabled = true
awful.mouse.snap.client_enabled = true

return {
    vars = require('config.vars'),
    apps = require('config.apps'),
    paths = require('config.paths'),
}

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
