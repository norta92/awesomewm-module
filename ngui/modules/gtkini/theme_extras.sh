#!/usr/bin/env bash

SETTINGS="$XDG_CONFIG_HOME/gtk-3.0/settings.ini"
[[ -f "$SETTINGS" ]] || return

THEME="$(grep gtk-theme-name "$SETTINGS" | cut -d= -f2)"
#ICONS="$(grep gtk-icon-theme-name "$SETTINGS" | cut -d= -f2)"

restart_systray() {
    AUTOSTART=/etc/xdg/autostart

    killall nm-applet
    dex -v "$AUTOSTART/nm-applet.desktop"

    killall blueman-applet
    dex -v "$AUTOSTART/blueman.desktop"

    killall volumeicon
    dex -v "$AUTOSTART/volumeicon.desktop"
}
restart_systray

kitty() {
    cd "$XDG_CONFIG_HOME/kitty" || return
    if [[ -f "colors/$THEME.conf" ]]; then
        cp "colors/$THEME.conf" theme.conf
    else
        cp "colors/.default.conf" theme.conf
    fi
}
kitty

rofi() {
    cd "$XDG_CONFIG_HOME/rofi/themes" || return
    if [[ -f "$THEME.rasi" ]]; then
        cp "$THEME.rasi" ".current.rasi"
    else
        cp ".default.rasi" ".current.rasi"
    fi
}
rofi

spotify() {
    PRESET="$XDG_CONFIG_HOME/oomox/colors/$THEME"
    [[ -f "$PRESET" ]] && \
        /opt/oomox/plugins/oomoxify/oomoxify.sh "$PRESET"
}
spotify
