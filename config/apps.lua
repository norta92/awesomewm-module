local _M = {
    terminal        = os.getenv("TERMINAL") or "urxvt",
    editor          = os.getenv("EDITOR") or "vim",
    filemanager     = os.getenv("FILEXP") or "pcmanfm",
    browser         = os.getenv("BROWSER") or "qutebrowser",
    search          = "rofi -show drun",
    -- session menu
    lockscreen      = "light-locker-command -l",
    reboot          = "systemctl reboot",
    suspend         = "systemctl suspend",
    poweroff        = "systemctl poweroff",

}

_M.editor_cmd = _M.terminal .. " -e " .. _M.editor
_M.manual_cmd = _M.terminal .. " -e man awesome"

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
