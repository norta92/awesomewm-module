local awful = require('awful')
local mod = require('bindings.mod')

client.connect_signal('request::default_keybindings', function()
    awful.keyboard.append_client_keybindings({
        -- Toggle fullscreen client
        awful.key({ mod.super, mod.shift }, 'f',
            function(c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = 'toggle fullscreen', group = 'client'}
        ),
        -- Toggle floating client
        awful.key({ mod.super, mod.ctrl }, 'f',
            awful.client.floating.toggle,
            {description = 'toggle floating', group = 'client'}
        ),
        -- Toggle ontop client
        awful.key({ mod.super, mod.ctrl }, 't',
            function(c)
                c.ontop = not c.ontop
            end,
            {description = 'toggle keep on top', group = 'client'}
        ),
        -- Toggle sticky client
        awful.key({ mod.super, mod.ctrl }, 's',
            function(c)
                c.sticky = not c.sticky
            end,
            {description = 'toggle sticky', group = 'client'}
        ),
        -- Minimize client
        awful.key({ mod.super, }, 'n',
            function(c)
                c.minimized = true
            end,
            {description = 'minimize', group = 'client'}
        ),
        -- Toggle maximize client
        awful.key({ mod.super, }, 'm',
            function (c)
                c.maximized = not c.maximized
                c:raise()
            end ,
            {description = '(un)maximize', group = 'client'}
        ),
        -- Toggle vertical maximize client
        awful.key({ mod.super, mod.ctrl }, 'm',
            function (c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end ,
            {description = '(un)maximize vertically', group = 'client'}
        ),
        -- Toggle horizontal maximize client
        awful.key({ mod.super, mod.shift }, 'm',
            function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end ,
            {description = '(un)maximize horizontally', group = 'client'}
        ),
        -- Swap with primary client
        awful.key({ mod.super, mod.ctrl }, 'p',
            function(c)
                c:swap(awful.client.getmaster())
            end,
            {description = 'swap with primary', group = 'client'}
        ),
        -- Move client to next screen
        awful.key({ mod.super, mod.ctrl }, 'o',
            function(c)
                c:move_to_screen()
            end,
            {description = 'move to screen', group = 'client'}
        ),
        -- Kill client (close)
        awful.key({ mod.super, mod.ctrl }, 'Escape',
            function(c)
                c:kill()
            end,
            {description = 'close', group = 'client'}
        ),
    })
end)
