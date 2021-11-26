-- awesome_mode: api-level=4:screen=on
pcall(require, 'luarocks.loader')

require('utils.errors')

local theme = require('beautiful')
local gfs = require('gears.filesystem')
theme.init(gfs.get_configuration_dir()..'theme.lua')

_G.cfg = require('config')

_G.menus = {
    main = require('widgets.menus.main')(),
    leaver = require('modules.leaver.widgets.menu')(),
}

require('signals')
require('bindings')
require('rules')

require('utils.autostart')()

require('modules.backdrop')()
require('modules.leaver')()
