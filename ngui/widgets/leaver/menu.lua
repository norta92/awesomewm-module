-- Awesome
local awful = require('awful')
local spawn = awful.spawn
local theme = require('beautiful')
local lookup_icon = require('menubar.utils').lookup_icon

-- Custom
local cfg_apps = _G.cfg.apps or nil

-- Local
local apps = {}
apps.lock = cfg_apps.leaver_lock or 'light-locker-command -l'
apps.exit = cfg_apps.leaver_exit or 'awesome-client \'awesome.quit()\''
apps.reboot = cfg_apps.leaver_reboot or 'systemctl reboot'
apps.suspend = cfg_apps.leaver_suspend or 'systemctl suspend'
apps.poweroff = cfg_apps.leaver_poweroff or 'systemctl poweroff'

local icons = {}
icons.lock = lookup_icon('xfce-system-lock') or theme.leaver_lock_icon
icons.exit = lookup_icon('xfsm-logout') or theme.leaver_exit_icon
icons.reboot = lookup_icon('xfsm-reboot') or theme.leaver_reboot_icon
icons.suspend = lookup_icon('xfsm-suspend') or theme.leaver_suspend_icon
icons.poweroff = lookup_icon('xfsm-shutdown') or theme.leaver_poweroff_icon

local _M = function()

    return awful.menu({
        {
            '&Lock Desktop',
            function()
                spawn(apps.lock)
            end,
            icons.lock
        },
        {
            '&Exit Desktop',
            function()
                _G.leaver.cmd = apps.exit
                _G.leaver.text = 'Exit Desktop'
                _G.leaver.icon = icons.exit
                awesome.emit_signal('leaver::confirm:show')
            end,
            icons.exit,
        },
        {
            '&Reboot System',
            function()
                _G.leaver.cmd = apps.reboot
                _G.leaver.text = 'Reboot System'
                _G.leaver.icon = icons.reboot
                awesome.emit_signal('leaver::confirm:show')
            end,
            icons.reboot
        },
        {
            '&Suspend System',
            function()
                _G.leaver.cmd = apps.suspend
                _G.leaver.text = 'Suspend System'
                _G.leaver.icon = icons.suspend
                awesome.emit_signal('leaver::confirm:show')
            end,
            icons.suspend
        },
        {
            '&Power Off',
            function()
                _G.leaver.cmd = apps.poweroff
                _G.leaver.text = 'Power Off'
                _G.leaver.icon = icons.poweroff
                awesome.emit_signal('leaver::confirm:show')
            end,
            icons.poweroff
        },
    })

end

return _M
