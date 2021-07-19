------------------------------------------------------------------------------
----- Connect awesome signals.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module signals.awesome
------------------------------------------------------------------------------

local awesome = awesome

--- AwesomeWM is about to enter the event loop.
awesome.connect_signal('startup', function()

    -- Load menus
    _G.menus = {
        main = require('widgets.menus.main')(),
        session = require('widgets.menus.session')(),
    }

    -- Wallpaper
    require('widgets.wallpaper')

    -- XDG autostart
    require('utils.autostart')

end)

