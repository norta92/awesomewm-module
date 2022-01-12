-- awesome_mode: api-level=4:screen=on
pcall(require, 'luarocks.loader')

-- Startup errors
require('utils.errors')

-- Load global config
_G.cfg = require('config')

-- Load theme
require('beautiful').init(require('theme'))

-- Load menus
_G.menus = {
    main = require('widgets.menus.main')(),
    leaver = require('widgets.leaver.menu')(),
}

-- Connect signals and rules
require('signals')
require('rules')

-- Load key and mouse bindings
require('bindings')
require('bindings_external')

-- XDG autostart
require('utils.autostart')()
