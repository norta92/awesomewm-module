local awful = require("awful")
local spawn = awful.spawn

local cmd = {
    media = {
        play = "mpc toggle",
        next = "mpc next",
        prev = "mpc prev",
        stop = "mpc stop",
    },
    volume = {
        inc = "pactl set-sink-volume @DEFAULT_SINK@ +5%",
        dec = "pactl set-sink-volume @DEFAULT_SINK@ -5%",
        mute = "pactl set-sink-mute @DEFAULT_SINK@ toggle",
    },
    brightness = {
        inc = "xbacklight -inc 10%",
        dec = "xbacklight -dec 10%",
    },
}

awful.keyboard.append_global_keybindings({
    -- media
    awful.key({ }, "XF86AudioPlay", function() spawn(cmd.media.play, false) end,
              {description = "toggle play and pause", group = "Awesome: Fn keys"}),
    awful.key({ }, "XF86AudioNext", function() spawn(cmd.media.next, false) end,
              {description = "go to next track", group = "Awesome: Fn keys"}),
    awful.key({ }, "XF86AudioPrev", function() spawn(cmd.media.prev, false) end,
              {description = "go to previous track", group = "Awesome: Fn keys"}),
    awful.key({ }, "XF86AudioStop", function() spawn(cmd.media.stop, false) end,
              {description = "stop playback", group = "Awesome: Fn keys"}),
    -- volume
    awful.key({ }, "XF86AudioRaiseVolume", function() spawn(cmd.volume.inc, false) end,
              {description = "raise volume", group = "Awesome: Fn keys"}),
    awful.key({ }, "XF86AudioLowerVolume", function() spawn(cmd.volume.dec, false) end,
              {description = "lower volume", group = "Awesome: Fn keys"}),
    awful.key({ }, "XF86AudioMute", function() spawn(cmd.volume.mute, false) end,
              {description = "toggle mute", group = "Awesome: Fn keys"}),
    -- brightness
    awful.key({ }, "XF86MonBrightnessUp", function() spawn(cmd.brightness.inc, false) end,
              {description = "increase backlight brightness", group = "Awesome: Fn keys"}),
    awful.key({ }, "XF86MonBrightnessDown", function() spawn(cmd.brightness.dec, false) end,
              {description = "decrease backlight brightness", group = "Awesome: Fn keys"}),
})

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
