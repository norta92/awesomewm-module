------------------------------------------------------------------------------
----- Paths configuration
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local gfs = require('gears.filesystem')

local config_dir = gfs.get_configuration_dir()
local cache_dir = os.getenv('XDG_CACHE_HOME') .. '/awesome/'
                  or config_dir .. '/awesome/cache/'

return {
    config = config_dir,
    themes = config_dir .. '/themes/',
    cache = cache_dir,
    autorun = '/etc/xdg/autostart/:$XDG_CONFIG_HOME/autostart/',
}

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
