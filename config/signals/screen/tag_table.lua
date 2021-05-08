local awful = require("awful")

screen.connect_signal("request::desktop_decoration", function(s)
    -- Create tag table
    awful.tag(_G.tag_list, s, awful.layout.layouts[1])
end)
