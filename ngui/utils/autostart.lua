local spawn = require('awful.spawn')
local search_paths = _G.cfg.paths.autostart

local cmd = {
    exe = 'dex',
    run = 'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
          'xrdb -merge <<< "awesome.started:true";' ..
          'dex --environment AwesomeWM --autostart --search-paths "' .. search_paths .. '"',
}

spawn.easy_async_with_shell('command -v ' .. cmd.exe, function(path)
    if not path then return end
    spawn.with_shell(cmd.run)
end)
