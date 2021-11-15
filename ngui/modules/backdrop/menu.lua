------------------------------------------------------------------------------
----- Backdrop menu.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local awful = require('awful')
local theme = require('beautiful')

local _M = function(timer)

    local mode = _G.cfg.vars.backdrop.mode

    local menu = {
        {
            '&Next Wallpaper',
            function()
                timer:emit_signal('timeout')
            end,
            theme.backdrop_next_icon,
        },
    }

    if mode == 'shuffle' then
        if timer.started then
            table.insert(menu, {
                '&Stop Shuffle',
                function()
                    timer:stop()
                end,
                theme.backdrop_stop_icon,
            })
        else
            table.insert(menu, {
                '&Start Shuffle',
                function()
                    timer:again()
                end,
                theme.backdrop_start_icon,
            })
        end
    end

    if mode == 'slideshow' then
        if timer.started then
            table.insert(menu, {
                '&Stop Slideshow',
                function()
                    timer:stop()
                end,
                theme.backdrop_stop_icon,
            })
        else
            table.insert(menu, {
                '&Start Slideshow',
                function()
                    timer:again()
                end,
                theme.backdrop_start_icon,
            })
        end
    end

    return awful.menu(menu)

end

return _M

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
