local awful = require('awful')
local spawn = awful.spawn
local theme = require('beautiful')
local apps = _G.cfg.apps.leaver

local awesome = awesome

local _V = {
    lock = apps.lock or 'light-locker-command -l',
    exit = apps.exit or 'awesome-client \'awesome.quit()\'',
    reboot = apps.reboot or 'systemctl reboot',
    suspend = apps.suspend or 'systemctl suspend',
    poweroff = apps.poweroff or 'systemctl poweroff',
}

local _M = function()

    return awful.menu({
        {
            '&Lock Desktop',
            function()
                spawn(_V.lock)
            end,
            theme.leaver_lock_icon
        },
        {
            '&Exit Desktop',
            function()
                _G.leaver.cmd = _V.exit
                _G.leaver.text = 'Exit Desktop'
                _G.leaver.icon = theme.leaver_exit_icon
                awesome.emit_signal('leaver::confirm:show')
            end,
            theme.leaver_exit_icon,
        },
        {
            '&Reboot System',
            function()
                _G.leaver.cmd = _V.reboot
                _G.leaver.text = 'Reboot System'
                _G.leaver.icon = theme.leaver_reboot_icon
                awesome.emit_signal('leaver::confirm:show')
            end,
            theme.leaver_reboot_icon
        },
        {
            '&Suspend System',
            function()
                _G.leaver.cmd = _V.suspend
                _G.leaver.text = 'Suspend System'
                _G.leaver.icon = theme.leaver_suspend_icon
                awesome.emit_signal('leaver::confirm:show')
            end,
            theme.leaver_suspend_icon
        },
        {
            '&Power Off',
            function()
                _G.leaver.cmd = _V.poweroff
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
