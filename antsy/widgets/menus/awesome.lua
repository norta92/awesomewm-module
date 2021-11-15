------------------------------------------------------------------------------
----- AwesomeWM menu.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @submodule widgets.menus
---- @themevars
----    theme.editor_icon
----    theme.exit_icon
----    theme.hotkeys_icon
----    theme.manual_icon
----    theme.restart_icon
------------------------------------------------------------------------------

local awful = require('awful')
local spawn = awful.spawn
local theme = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup')
local apps = _G.conf.apps

local awesome = awesome

--- The AwesomeWM menu.
local _M = {
   { '&Show Hotkeys', function() hotkeys_popup.show_help(nil, awful.screen.focused()) end, theme.hotkeys_icon },
   { 'Read &Manaul', function() spawn(apps.manual_cmd) end, theme.manual_icon },
   { 'Edit &Config', function() spawn(apps.editor_cmd .. ' ' .. awesome.conffile) end, theme.editor_icon },
   { '&Restart Awesome', function() awesome.restart() end, theme.restart_icon },
   { '&Quit Awesome', function() awesome.quit() end, theme.exit_icon },
}

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
