local awful = require("awful")
local spawn = awful.spawn
local hotkeys_popup = require("awful.hotkeys_popup").widget
require("awful.hotkeys_popup.keys")
local apps = require("config.apps")
local mod = require("config.bindings.mod")
require("ui.menus")

-- General Awesome keys
awful.keyboard.append_global_keybindings({
    awful.key({ mod.super }, "Return", function () spawn(apps.terminal) end,
              {description = "open a terminal", group = "Awesome: core"}),
    awful.key({ mod.super }, "w", function () _G.main_menu:show({coords={x=0, y=0}}) end,
              {description = "show main menu", group = "Awesome: core"}),
    awful.key({ mod.super }, "s", hotkeys_popup.show_help,
              {description="show help", group="Awesome: core"}),
    awful.key({ mod.super, mod.ctrl }, "r", awesome.restart,
              {description = "reload awesome", group = "Awesome: core"}),
    awful.key({ mod.super, mod.ctrl }, "q", awesome.quit,
              {description = "quit awesome", group = "Awesome: core"}),
})

-- Tag related keybindings
awful.keyboard.append_global_keybindings({
    -- Focus tag by number
    awful.key {
        modifiers   = { mod.super },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "Awesome: tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if not tag then
                -- Tag doesn't exist, do nothing
                -- TODO: create new tag
                return
            elseif tag.selected then
                -- Restore last tag by selecting current tag
                awful.tag.history.restore(screen, 1)
            else
                -- View selected tag
                tag:view_only()
            end
        end,
    },
    -- Toggle multiple tags
    awful.key {
        modifiers   = { mod.super, mod.ctrl },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "Awesome: tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    -- Send to tag by number
    awful.key {
        modifiers = { mod.super, mod.shift },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "Awesome: tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
})


-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    -- Cycle layouts
    awful.key({ mod.super }, "]", function () awful.layout.inc( 1) end,
              {description = "select next layout", group = "Awesome: layout"}),
    awful.key({ mod.super }, "[", function () awful.layout.inc(-1) end,
              {description = "select previous layout", group = "Awesome: layout"}),
    -- Swap with client by direction (vi)
    awful.key({ mod.super, mod.shift }, "h", function () awful.client.swap.bydirection("left") end,
              {description = "swap with client to left", group = "Awesome: client"}),
    awful.key({ mod.super, mod.shift }, "j", function () awful.client.swap.bydirection("down") end,
              {description = "swap with client below", group = "Awesome: client"}),
    awful.key({ mod.super, mod.shift }, "k", function () awful.client.swap.bydirection("up") end,
              {description = "swap with client above", group = "Awesome: client"}),
    awful.key({ mod.super, mod.shift }, "l", function () awful.client.swap.bydirection("right") end,
              {description = "swap with client to right", group = "Awesome: client"}),
})

-- Screen related keybindings
awful.keyboard.append_global_keybindings({
    -- Focus screen by direction (vi)
    awful.key({ mod.super, mod.ctrl }, "h", function ()
        awful.screen.focus_bydirection("left")
        if client.focus ~= nil
            and client.focus.screen.index ~= awful.screen.focused().index then
            client.focus = nil
        end
    end,
    {description = "focus screen to left", group = "Awesome: screen"}),
    awful.key({ mod.super, mod.ctrl }, "j", function ()
        awful.screen.focus_bydirection("down")
        if client.focus ~= nil
            and client.focus.screen.index ~= awful.screen.focused().index then
            client.focus = nil
        end
    end,
    {description = "focus screen to down", group = "Awesome: screen"}),
    awful.key({ mod.super, mod.ctrl }, "k", function ()
        awful.screen.focus_bydirection("up")
        if client.focus ~= nil
            and client.focus.screen.index ~= awful.screen.focused().index then
            client.focus = nil
        end
    end,
    {description = "focus screen to up", group = "Awesome: screen"}),
    awful.key({ mod.super, mod.ctrl }, "l", function ()
        awful.screen.focus_bydirection("right")
        if client.focus ~= nil
            and client.focus.screen.index ~= awful.screen.focused().index then
            client.focus = nil
        end
    end,
    {description = "focus screen to right", group = "Awesome: screen"}),
})

-- Client related keybindings
awful.keyboard.append_global_keybindings({
    -- Focus client by direction (vi)
    awful.key({ mod.super }, "h",
        function ()
            awful.client.focus.bydirection("left")
            if client.focus then
                client.focus:raise() end
        end,
        {description = "focus client to left", group = "Awesome: client"}
    ),
    awful.key({ mod.super }, "j",
        function ()
            awful.client.focus.bydirection("down")
            if client.focus then
                client.focus:raise() end
        end,
        {description = "focus client below", group = "Awesome: client"}
    ),
    awful.key({ mod.super }, "k",
        function ()
            awful.client.focus.bydirection("up")
            if client.focus then
                client.focus:raise() end
        end,
        {description = "focus client above", group = "Awesome: client"}
    ),
    awful.key({ mod.super }, "l",
        function ()
            awful.client.focus.bydirection("right")
            if client.focus then
                client.focus:raise() end
        end,
        {description = "focus client to right", group = "Awesome: client"}
    ),
    -- Focus previous client
    awful.key({ mod.super }, "Tab",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "focus previous client", group = "Awesome: client"}
    ),
    -- Focus next client
    awful.key({ mod.super, mod.shift }, "Tab",
        function ()
            awful.client.focus.byidx(1)
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "focus next client", group = "Awesome: client"}
    ),
    -- Restore minimized client
    awful.key({ mod.super, mod.shift }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:activate { raise = true, context = "key.unminimize" }
                  end
              end,
              {description = "restore minimized", group = "Awesome: client"}
    ),
})

-- Custom
awful.keyboard.append_global_keybindings({
    -- rofi
    awful.key({ mod.super }, "space", function () spawn("rofi -show drun", false) end,
              {description = "show application search", group = "rofi"}),
    awful.key({ mod.super, mod.alt }, "p", function () spawn("rofi-pass", false) end,
              {description = "show password search", group = "rofi"}),
    awful.key({ mod.super, mod.alt }, "c", function () spawn("rofi -show calc", false) end,
              {description = "show calculator", group = "rofi"}),
    -- mpc
    awful.key({ }, "XF86AudioPlay", function () spawn("mpc toggle", false) end,
              {description = "toggle play and pause", group = "Awesome: Fn keys"}),
    awful.key({ }, "XF86AudioNext", function () spawn("mpc next", false) end,
              {description = "go to next track", group = "Awesome: Fn keys"}),
    awful.key({ }, "XF86AudioPrev", function () spawn("mpc prev", false) end,
              {description = "go to previous track", group = "Awesome: Fn keys"}),
    awful.key({ }, "XF86AudioStop", function () spawn("mpc stop", false) end,
              {description = "stop playback", group = "Awesome: Fn keys"}),
    -- pactl
    awful.key({ }, "XF86AudioRaiseVolume", function () spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%", false) end,
              {description = "raise volume", group = "Awesome: Fn keys"}),
    awful.key({ }, "XF86AudioLowerVolume", function () spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%", false) end,
              {description = "lower volume", group = "Awesome: Fn keys"}),
    awful.key({ }, "XF86AudioMute", function () spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle", false) end,
              {description = "toggle mute", group = "Awesome: Fn keys"}),
    -- xbacklight
    awful.key({ }, "XF86MonBrightnessUp", function () spawn("xbacklight -inc 10%", false) end,
              {description = "increase backlight brightness", group = "Awesome: Fn keys"}),
    awful.key({ }, "XF86MonBrightnessDown", function () spawn("xbacklight -dec 10%", false) end,
              {description = "decrease backlight brightness", group = "Awesome: Fn keys"}),
    -- touchpad-toggle
    awful.key({ mod.super, mod.alt }, "t", function () spawn("touchpad-toggle", false) end,
              {description = "toggle touchpad input", group = "Awesome: toggle touchpad"}),
    -- screen-capture
    awful.key({ }, "Print", function () spawn("screen-capture", false) end,
              {description = "capture whole screen", group = "Awesome: screenshot"}),
    awful.key({ mod.super }, "Print", function () spawn("screen-capture -s", false) end,
              {description = "capture selected window", group = "Awesome: screenshot"})
})
