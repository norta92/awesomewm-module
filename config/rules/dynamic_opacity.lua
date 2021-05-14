local ruled = require("ruled")
local exclude = require("config.vars").exclude_opacity

ruled.client.connect_signal("request::rules", function()
    ruled.client.append_rule {
        id       = "dynamic_opacity",
        rule_any = {
            instance = exclude.instance,
            class = exclude.class,
        },
        properties = {
            exclude_opacity = true,
        },
    }
end)

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
