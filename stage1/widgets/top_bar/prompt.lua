local awful = require('awful')

local _M = function(s)
    return awful.widget.prompt(s)
end

return _M
