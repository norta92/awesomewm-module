# Penguin AwesomeWM config

#### Requirements (minimum)
+ [awesome-git](https://aur.archlinux.org/awesome-git) - git version required
+ [dex](https://archlinux.org/packages/community/any/dex/) - autostart applications
+ [xorg-xrdb](https://archlinux.org/packages/extra/x86_64/xorg-xrdb/) - theme dependency

#### Installation
```sh
git clone https://git.linuxit.us/awesome $XDG_CONFIG_HOME/awesome
```

#### Configuration
Colors ***must*** be set in `.Xresources`
```
*color0:                #000000
*color1:                #c23621
*color2:                #25bc24
*color3:                #adad27
*color4:                #492ee1
*color5:                #d338d3
*color6:                #33bbc8
*color7:                #cbcccd
*color8:                #818383
*color9:                #fc391f
*color10:               #31e722
*color11:               #eaec23
*color12:               #5833ff
*color13:               #f935f8
*color14:               #14f0f0
*color15:               #e9ebeb
```

Some environment variables are expected to be set:
```
# ~/.xinitrc (or ~/.xsession)
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CURRENT_DESKTOP=awesome

# you'll want to set these as well
export TERMINAL=urxvtc
export EDITOR=vim
export FILEXP=pcmanfm
export BROWSER=qutebrowser
```

Autostart items should be place in `$XDG_CONFIG_HOME/autostart`.
