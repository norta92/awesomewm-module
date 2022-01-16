#!/usr/bin/env bash

## RESTART AUTOSTART ITEMS WITH SYSTRAY ICONS
declare START_DIR TRAY_ITEMS
START_DIR=/etc/xdg/autostart
TRAY_ITEMS=(nm-applet blueman volumeicon cbatticon)

[ -d "$START_DIR" ] && { \

    function redex() {
        declare file exe

        file="$START_DIR/$1.desktop"
        [ -e "$file" ] || return

        exe_str=$(grep Exec= "$file" | cut -d= -f2)
        exe="${exe_str%% *}"
        [ -n "$exe" ] || return

        if pidof -x "$exe" >/dev/null 2>&1
        then
            killall "$exe"
            dex -v "$file" >/dev/null 2>&1
        fi
    }

    for i in "${TRAY_ITEMS[@]}"
    do
        redex "$i"
    done
}

## PARSE GTK INI AND THEME OTHER APPS ACCORDINGLY
declare GTK_INI GTK_THEME GTK_ICONS
GTK_INI="$XDG_CONFIG_HOME/gtk-3.0/settings.ini"
GTK_THEME="$(grep gtk-theme-name "$GTK_INI" | cut -d= -f2)"
GTK_ICONS="$(grep gtk-icon-theme-name "$GTK_INI" | cut -d= -f2)"

[ -f "$GTK_INI" ] && { \

    # KITTY THEME
    if [[ $(command -v kitty) ]]
    then
        cd "$XDG_CONFIG_HOME/kitty" || return
        if [[ -f "themes/$GTK_THEME.conf" ]]; then
            cp "themes/$GTK_THEME.conf" theme.conf
        else
            cp "themes/.default.conf" theme.conf
        fi
        killall -SIGUSR1 kitty
    fi

    # SPOTIFY THEME
    if [[ $(command -v spotify) && $(command -v oomox-cli) ]]
    then
        PRESET="$XDG_CONFIG_HOME/oomox/colors/Penguin/$GTK_THEME"
        [ -f "$PRESET" ] && \
            /opt/oomox/plugins/oomoxify/oomoxify.sh "$PRESET" >/dev/null 2>&1
    fi
}

exit 0
