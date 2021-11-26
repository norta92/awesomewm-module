local _M = function(kwargs)
    local args = kwargs or {}

    screen.connect_signal("request::desktop_decoration", function(s)
        require('widgets.top_bar')(s)
    end)
end

return _M
