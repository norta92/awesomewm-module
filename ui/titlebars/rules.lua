local ruled = require("ruled")

ruled.client.connect_signal("request::rules", function()
    -- Make titlebar transparent to match terminal
    ruled.client.append_rule {
        id           = "titlebars",
        rule_any     = {
            class    = { "URxvt" },
            instance = { "URxvt" }
        },
        properties = {
            transparent_titlebar = true,
            size_hints_honor = false
        }
    }
end)
