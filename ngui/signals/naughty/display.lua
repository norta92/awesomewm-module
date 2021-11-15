local naughty = require('naughty')

naughty.connect_signal("request::display", function(n)
    require('widgets.notification')(n)
end)
