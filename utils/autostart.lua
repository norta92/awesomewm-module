local spawn = require("awful.spawn")

-- XDG autostart (system and user)
spawn.with_shell(
   'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
   'xrdb -merge <<< "awesome.started:true";' ..
   'dex --environment Awesome --autostart --search-paths "/etc/xdg/autostart/:$XDG_CONFIG_HOME/autostart/"'
)
