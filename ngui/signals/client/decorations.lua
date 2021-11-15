local awful = require('awful')
local theme = require('beautiful')

client.connect_signal("request::titlebars", function(c)
    require('widgets.titlebar')(c)
end)

client.connect_signal("request::manage", function(c)
    awful.titlebar.show(c)
    c.shape = theme.titlebar_shape
end)
