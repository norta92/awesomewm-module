------------------------------------------------------------------------------
----- Apps configuration
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module config.apps
------------------------------------------------------------------------------

--- Apps table.
local _M = {
    -- common
    terminal        = os.getenv("TERMINAL") or "urxvt",
    editor          = os.getenv("EDITOR") or "vim",
    filemanager     = os.getenv("FILEXP") or "pcmanfm",
    browser         = os.getenv("BROWSER") or "qutebrowser",
    top             = "htop",
    -- session menu
    lockscreen      = "light-locker-command -l",
    reboot          = "systemctl reboot",
    suspend         = "systemctl suspend",
    poweroff        = "systemctl poweroff",
}

-- Commands that need a terminal
_M.editor_cmd = _M.terminal .. " -e " .. _M.editor
_M.manual_cmd = _M.terminal .. " -e man awesome"
_M.top_cmd = _M.terminal .. " -e " .. _M.top

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
