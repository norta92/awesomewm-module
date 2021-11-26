local awful = require('awful')
local spawn = awful.spawn
local theme = require('beautiful')
local cfg_apps = _G.cfg.apps.leaver

local _M = function(user_apps)
    local apps = cfg_apps or user_apps or {}
    local lock = apps.lock or 'light-locker-command -l'
    local exit = apps.exit or 'awesome-client \'awesome.quit()\''
    local reboot = apps.reboot or 'systemctl reboot'
    local suspend = apps.suspend or 'systemctl suspend'
    local poweroff = apps.poweroff or 'systemctl poweroff'

    return awful.menu({
        {
            '&Lock Desktop',
            function()
                spawn(lock)
            end,
            theme.leaver_lock_icon
        },
        {
            '&Exit Desktop',
            function()
                _G.leaver.cmd = exit
                _G.leaver.text = 'Exit Desktop'
                _G.leaver.icon = theme.leaver_exit_icon
                awesome.emit_signal('leaver::confirm:show')
            end,
            theme.leaver_exit_icon,
        },
        {
            '&Reboot System',
            function()
                _G.leaver.cmd = reboot
                _G.leaver.text = 'Reboot System'
                _G.leaver.icon = theme.leaver_reboot_icon
                awesome.emit_signal('leaver::confirm:show')
            end,
            theme.leaver_reboot_icon
        },
        {
            '&Suspend System',
            function()
                _G.leaver.cmd = suspend
                _G.leaver.text = 'Suspend System'
                _G.leaver.icon = theme.leaver_suspend_icon
                awesome.emit_signal('leaver::confirm:show')
            end,
            theme.leaver_suspend_icon
        },
        {
            '&Power Off',
            function()
                _G.leaver.cmd = poweroff
                _G.leaver.text = 'Power Off'
                _G.leaver.icon = theme.leaver_poweroff_icon
                awesome.emit_signal('leaver::confirm:show')
            end,
            theme.leaver_poweroff_icon
        },
    })

end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
