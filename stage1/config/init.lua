local menubar = require("menubar")
local apps = require('config.apps')

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

menubar.utils.terminal = apps.terminal

return {
    apps = require('config.apps'),
}
