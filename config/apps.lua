local apps = {
    terminal = os.getenv("TERMINAL") or "urxvt",
    editor = os.getenv("EDITOR") or "vim",
    filemanager = os.getenv("FILEXP") or "pcmanfm",
    browser = os.getenv("BROWSER") or "qutebrowser",
    search = "rofi -show drun",
    -- session menu
    lockscreen = "light-locker-command -l",
    reboot = "systemctl reboot",
    suspend = "systemctl suspend",
    poweroff = "systemctl poweroff",

}

apps.editor_cmd = apps.terminal .. " -e " .. apps.editor
apps.manual_cmd = apps.terminal .. " -e man awesome"

return apps

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
