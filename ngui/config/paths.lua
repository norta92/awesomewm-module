local gfs = require('gears.filesystem')

local _M = {}

_M.config = gfs.get_configuration_dir()

_M.cache = os.getenv('XDG_CACHE_HOME')..'/awesome/'
           or _M.config..'/cache/'

_M.autostart = '/etc/xdg/autostart/:$XDG_CONFIG_HOME/autostart/'

_M.icons = {
    '/usr/share/icons/gnome/',
    '/usr/share/pixmaps/',
}

return _M
