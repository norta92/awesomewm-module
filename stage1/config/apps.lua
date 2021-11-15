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

return _M
