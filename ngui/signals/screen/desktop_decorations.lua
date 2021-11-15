screen.connect_signal("request::desktop_decoration", function(s)
    require('widgets.top_bar')(s)
end)
