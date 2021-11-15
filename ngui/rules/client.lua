local ruled = require('ruled')

ruled.client.connect_signal("request::rules", function()
    require('rules.client.global')()
    require('rules.client.floating')()
    require('rules.client.titlebars')()
    require('rules.client.terminals')()
    require('rules.client.dynamic_opacity')()
end)
