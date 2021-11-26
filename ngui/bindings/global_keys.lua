local awful = require('awful')
local hotkeys_popup = require('awful.hotkeys_popup')
local mod = require('bindings.mod')
local apps = _G.cfg.apps
local focus = _G.cfg.vars.client.mouse_focus
local menu_position = require('utils.menus').set_menu_position

awful.keyboard.append_global_keybindings({
    awful.key({ mod.super,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ mod.super,           }, "w",
        function ()
            local pos = menu_position('tl')
            _G.menus.main:show({coords=pos})
        end,
        {description = "show main menu", group = "awesome"}
    ),
    awful.key({ mod.super, mod.ctrl }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ mod.super,           }, "Return", function () awful.spawn(apps.terminal) end,
              {description = "open a terminal", group = "launcher"}),
})

awful.keyboard.append_global_keybindings({
    awful.key({ mod.super,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ mod.super,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ mod.super,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
})

awful.keyboard.append_global_keybindings({
    awful.key({ mod.super }, "h",
        function()
            awful.client.focus.bydirection('left')
            if client.focus and focus.raise then
                client.focus:raise()
            end
        end,
        {description = "focus client to left", group = "client"}
    ),
    awful.key({ mod.super }, "j",
        function()
            awful.client.focus.bydirection('down')
            if client.focus and focus.raise then
                client.focus:raise()
            end
        end,
        {description = "focus client below", group = "client"}
    ),
    awful.key({ mod.super }, "k",
        function()
            awful.client.focus.bydirection('up')
            if client.focus and focus.raise then
                client.focus:raise()
            end
        end,
        {description = "focus client above", group = "client"}
    ),
    awful.key({ mod.super }, "l",
        function()
            awful.client.focus.bydirection('right')
            if client.focus and focus.raise then
                client.focus:raise()
            end
        end,
        {description = "focus client to right", group = "client"}
    ),
    awful.key({ mod.super, mod.shift   }, 'h',
        function()
            awful.client.swap.bydirection('left')
        end,
        {description = "swap with client to left", group = "client"}
    ),
    awful.key({ mod.super, mod.shift   }, 'j', function() awful.client.swap.bydirection('down') end,
              {description = "swap with client below", group = "client"}),
    awful.key({ mod.super, mod.shift   }, 'k', function() awful.client.swap.bydirection('up') end,
              {description = "swap with client above", group = "client"}),
    awful.key({ mod.super, mod.shift   }, 'l', function() awful.client.swap.bydirection('right') end,
              {description = "swap with client to right", group = "client"}),
    awful.key({ mod.alt }, "Tab",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "focus previous client", group = "client"}
    ),
    awful.key({ mod.alt, mod.shift }, "Tab",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "focus next client", group = "client"}
    ),
    awful.key({ mod.super, mod.shift }, "n",
        function ()
            local c = awful.client.restore()
            if c then
                c:activate { raise = true, context = "key.unminimize" }
            end
        end,
        {description = "restore minimized", group = "client"}
    ),
    awful.key({ mod.super, mod.shift }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
})

awful.keyboard.append_global_keybindings({
    awful.key({ mod.super, mod.ctrl }, 'h', function() awful.screen.focus_bydirection('left') end,
              {description = "focus screen to left", group = "screen"}),
    awful.key({ mod.super, mod.ctrl }, 'j', function() awful.screen.focus_bydirection('down') end,
              {description = "focus screen below", group = "screen"}),
    awful.key({ mod.super, mod.ctrl }, 'k', function() awful.screen.focus_bydirection('up') end,
              {description = "focus screen above", group = "screen"}),
    awful.key({ mod.super, mod.ctrl }, 'l', function() awful.screen.focus_bydirection('right') end,
              {description = "focus screen to right", group = "screen"}),
})

awful.keyboard.append_global_keybindings({
    awful.key({ mod.super,           }, "]", function () awful.layout.inc( 1) end,
              {description = "select next", group = "layout"}),
    awful.key({ mod.super,           }, "[", function () awful.layout.inc(-1) end,
              {description = "select previous", group = "layout"}),
})


awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { mod.super },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { mod.super, mod.ctrl },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { mod.super, mod.shift },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { mod.super, mod.ctrl, mod.shift },
        keygroup    = "numrow",
        description = "toggle focused client on tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { mod.super },
        keygroup    = "numpad",
        description = "select layout directly",
        group       = "layout",
        on_press    = function (index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end,
    }
})
