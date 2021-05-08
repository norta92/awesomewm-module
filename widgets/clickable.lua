local wibox = require('wibox')
local beautiful = require('beautiful')

local function build(widget)
    local container =
        wibox.widget {
        widget,
        widget = wibox.container.background
    }
    local old_cursor, old_wibox

    container:connect_signal(
        'mouse::enter',
        function()
            container.bg = beautiful.hover_color
            -- Hm, no idea how to get the wibox from this signal's arguments...
            local w = mouse.current_wibox
            if w then
                old_cursor, old_wibox = w.cursor, w
                w.cursor = 'hand1'
            end
        end
    )

    container:connect_signal(
        'mouse::leave',
        function()
            container.bg = beautiful.no_color
            if old_wibox then
                old_wibox.cursor = old_cursor
                old_wibox = nil
            end
        end
    )

    container:connect_signal(
        'button::press',
        function()
            container.bg = beautiful.click_color
        end
    )

    container:connect_signal(
        'button::release',
        function()
            container.bg = beautiful.hover_color
        end
    )

    return container
end

return build
