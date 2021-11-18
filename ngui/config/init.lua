local awful = require("awful")
local gfs = require('gears.filesystem')
local menubar = require("menubar")

local vars = {}

vars.layouts = {
    list = {
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.tile.left,
    },
}

vars.tags = {
    auto = 4,
    list = nil, -- {'one','two','three'},
}

vars.focus = {
    auto = true,
    raise = false,
    sloppy = true,
}

vars.dynamic_opacity = {
    focus = 0.9,
    unfocus = 0.85,
    exclude = {
        instance = { 'vlc', 'valheim.x86_64' },
        class = { 'vlc', 'mpv', 'valheim.x86_64' },
    },
}

vars.top_bar = {
    clock = {
        show_calendar = true,
    },
    tasklist = {
        button_width = 240,
        menu_width = 160,
    },
    systray = {
        autohide = false,
    },
}

vars.backdrop = {
    path = nil,             -- path to image or directory to shuffle
    mode = 'shuffle',       -- single, shuffle, slideshow
    scale = 'max',          -- center, tile, max, fit
    color = '#333',         -- color to set if no image found (or path is nil)
    span = false,           -- span multiple screens
    timeout = 10,           -- how often to shuffle wallpaper (in minutes)
}

vars.leaver = {
    timeout = 10,
    timeout_run = false,
}

local apps = {
    terminal = os.getenv('TERMINAL') or 'xterm',
    editor = os.getenv('EDITOR') or 'vi',
    files = os.getenv('FILEXP') or 'mc',
    browser = os.getenv('BROWSER') or 'netsurf',
    email = os.getenv('EMAIL') or 'thunderbird',
    calendar = os.getenv('CALENDAR') or 'thunderbird --calendar',
}
apps.editor_cmd = apps.terminal..' -e '..apps.editor

apps.awesome = {
    config = apps.editor_cmd..' '..awesome.conffile,
    manual = apps.terminal..' -e man awesome',
    restart = 'awesome-client \'awesome.restart()\'',
    exit = 'awesome-client \'awesome.quit()\'',
}

apps.leaver = {
    lock = 'light-locker-command -l',
    exit = 'awesome-client \'awesome.quit()\'',
    reboot = 'systemctl reboot',
    suspend = 'systemctl suspend',
    poweroff = 'systemctl poweroff',
}

local paths = {}

paths.config = gfs.get_configuration_dir()

paths.cache = os.getenv('XDG_CACHE_HOME')..'/awesome/'
           or paths.config..'/cache/'

paths.autostart = '/etc/xdg/autostart/:$XDG_CONFIG_HOME/autostart/'

paths.icons = {
    '/usr/share/icons/gnome/',
    '/usr/share/pixmaps/',
}

if vars.focus.auto then
    require("awful.autofocus")
end

require("awful.hotkeys_popup.keys")

menubar.utils.terminal = apps.terminal

awful.screen.set_auto_dpi_enabled = true

awful.titlebar.enable_tooltip = false

awful.mouse.snap.edge_enabled = true
awful.mouse.snap.client_enabled = true






















return {
    apps = apps,
    vars = vars,
    paths = paths,
}
