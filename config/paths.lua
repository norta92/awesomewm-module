------------------------------------------------------------------------------
----- Paths configuration
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module config.apps
------------------------------------------------------------------------------

local gfs = require('gears.filesystem')

local config_dir = gfs.get_configuration_dir()

return {
    config = config_dir,
    themes = config_dir .. "/themes/",
    cache = os.getenv("XDG_CACHE_HOME") .. "/awesome/"
            or config_dir .. "/awesome/cache/"
}

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
