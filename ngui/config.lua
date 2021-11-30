local awful = require("awful")
local gfs = require('gears.filesystem')
local menubar = require("menubar")

local vars = {}
vars.tag = {
    default_layouts = {
        layouts = {
            awful.layout.suit.floating,
            awful.layout.suit.tile.left,
            awful.layout.suit.fair,
            awful.layout.suit.fair.horizontal,
            awful.layout.suit.tile,
        }
    }
}
vars.screen = {
    create_tags = {
        auto = 4,
        --list = {' I ', ' II ', ' III ', ' IV '},
    },
}
vars.client = {
    mouse_focus = { sloppy = true },
    dynamic_opacity = {
        focus = 0.9,
        unfocus = 0.85,
        exclude = {
            instance = { 'vlc', 'valheim.x86_64' },
            class = { 'vlc', 'mpv', 'valheim.x86_64' },
        },
    },
}
vars.naughty = {}
vars.top_bar = {}
vars.backdrop = {
    path = os.getenv('HOME')..'/Wallpapers/Shuffle/',
    mode = 'slideshow',
}
vars.leaver = {}
vars.gtkini = {
    prompt = true,
    run = false,
}

local apps = {
    terminal = os.getenv('TERMINAL') or 'kitty',
    editor = os.getenv('EDITOR') or 'vim',
    files = os.getenv('FILEXP') or 'pcmanfm',
    browser = os.getenv('BROWSER') or 'firefox',
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
paths.autostart = '/etc/xdg/autostart/:$XDG_CONFIG_HOME/autostart/'
paths.gtkini = os.getenv('XDG_CONFIG_HOME')..'/gtk-3.0/settings.ini'
paths.icons = {
    '/usr/share/icons/gnome/',
    '/usr/share/pixmaps/',
}

require("awful.hotkeys_popup.keys")
menubar.utils.terminal = apps.terminal
awful.titlebar.enable_tooltip = false
awful.mouse.snap.edge_enabled = true
awful.mouse.snap.client_enabled = true

return {
    apps = apps,
    vars = vars,
    paths = paths,
}
