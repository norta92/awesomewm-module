local _M = {
    terminal = os.getenv('TERMINAL') or 'xterm',
    editor = os.getenv('EDITOR') or 'vi',
    files = os.getenv('FILEXP') or 'mc',
    browser = os.getenv('BROWSER') or 'netsurf',
}
_M.editor_cmd = _M.terminal..' -e '.._M.editor

_M.awesome = {
    config = _M.editor_cmd..' '..awesome.conffile,
    manual = _M.terminal..' -e man awesome',
    restart = 'awesome-client \'awesome.restart()\'',
    exit = 'awesome-client \'awesome.quit()\'',
}

_M.leaver = {
    lock = 'light-locker-command -l',
    exit = 'awesome-client \'awesome.quit()\'',
    reboot = 'systemctl reboot',
    suspend = 'systemctl suspend',
    poweroff = 'systemctl poweroff',
}

return _M
