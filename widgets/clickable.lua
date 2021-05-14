local theme = require("beautiful")
local wibox = require("wibox")

local function clickable(widget)
    local container = wibox.widget {
        widget,
        widget = wibox.container.background
    }
    local old_cursor, old_wibox

    container:connect_signal("mouse::enter", function()
        container.bg = theme.hover_color
        local w = mouse.current_wibox
        if w then
            old_cursor, old_wibox = w.cursor, w
            w.cursor = "hand1"
        end
    end)

    container:connect_signal("mouse::leave", function()
        container.bg = theme.no_color
        if old_wibox then
            old_wibox.cursor = old_cursor
            old_wibox = nil
        end
    end)

    container:connect_signal("button::press", function()
        container.bg = theme.click_color
    end)

    container:connect_signal("button::release", function()
        container.bg = theme.hover_color
    end)

    return container
end

return clickable

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
