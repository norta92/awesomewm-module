local awful = require("awful")

-- dpi
awful.screen.set_auto_dpi_enabled(true)

-- snap
awful.mouse.snap.edge_enabled = true
awful.mouse.snap.client_enabled = true

return {
    vars = require("config.vars"),
    apps = require("config.apps"),
}
