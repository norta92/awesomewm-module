#!/usr/bin/env bash

declare GTK_INI GTK_THEME GTK_ICONS
declare START_DIR TRAY_ITEMS

GTK_INI="$XDG_CONFIG_HOME/gtk-3.0/settings.ini"
[ -f "$GTK_INI" ] || return

GTK_THEME="$(grep gtk-theme-name "$GTK_INI" | cut -d= -f2)"
GTK_ICONS="$(grep gtk-icon-theme-name "$GTK_INI" | cut -d= -f2)"

[ -d /etc/xdg/autostart ] && START_DIR=/etc/xdg/autostart
TRAY_ITEMS="nm-applet blueman volumeicon cbatticon"

function restart() {
    declare file exe

    file="$START_DIR/$1.desktop"
    [ -e "$file" ] || return

    exe=$(grep Exec= "$file" | cut -d= -f2)
    [ -n "$exe" ] || return

    if pidof -x "$exe" >/dev/null 2>&1
    then
        killall "$exe"
        dex -v "$file" >/dev/null 2>&1
    fi
}

for i in ${TRAY_ITEMS[@]}
do
    restart "$i"
done

theme_kitty() {
    cd "$XDG_CONFIG_HOME/kitty" || return
    if [[ -f "themes/$GTK_THEME.conf" ]]; then
        cp "themes/$GTK_THEME.conf" theme.conf
    else
        cp "themes/.default.conf" theme.conf
    fi
}
[[ $(command -v kitty) ]] && theme_kitty

theme_spotify() {
    PRESET="$XDG_CONFIG_HOME/oomox/colors/Penguin/$GTK_THEME"

    [ -f "$PRESET" ] && \
        /opt/oomox/plugins/oomoxify/oomoxify.sh "$PRESET" >/dev/null 2>&1
}
[[ $(command -v spotify) ]] && theme_spotify

