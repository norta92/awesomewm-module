# nGUI for AwesomeWM

A minimal, yet functional desktop.

### Requirements
#### Minimal
+ [awesome-git](https://aur.archlinux.org/awesome-git) - git version required
#### Optional
+ [dex](https://archlinux.org/packages/community/any/dex/) - XDG autostart
+ [xorg-xrdb](https://archlinux.org/packages/extra/x86_64/xorg-xrdb/) - autostart dependency
+ [awesome-freedesktop-git](https://aur.archlinux.org/awesome-freedesktop-git) - XDG menus
+ [picom-tryone-git](https://aur.archlinux.org/picom-tryone-git) - compositor with kawaze blur
+ [rxvt-unicode-cvs-patched-wideglyphs](https://aur.archlinux.org/rxvt-unicode-cvs-patched-wideglyphs) - terminal emulator
+ [rofi](https://archlinux.org/packages/community/x86_64/rofi/) - application search and switcher

### Installation
```sh
git clone https://git.linuxit.us/penguin/ngui $XDG_CONFIG_HOME/ngui
ln -s $XDG_CONFIG_HOME/ngui $XDG_CONFIG_HOME/awesome
```

Some environment variables are expected to be set:
```sh
# ~/.xsession (or ~/.xinitrc)
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
```

### Configuration
#### Main
There are three main configuration files:
+ `config/vars.lua`: variables can be set here (theme, wallpaper, layouts, etc)
+ `config/apps.lua`: apps used in menus and bindings
+ `config/paths.lua`: commonly used paths

#### Themes
In each theme directory (`themes/[active]`):
+ `theme.lua`: theme variables (colors, fonts, etc)
+ `svgicons.lua`: minified SVG icons

#### Autostart
Autostart items should be place in `$XDG_CONFIG_HOME/autostart`.

By default, nGUI loads both system and user autostart items. To change this behavior, edit `config/paths.lua`.

###
