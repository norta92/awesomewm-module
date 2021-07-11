------------------------------------------------------------------------------
----- XDG autostart with dex.
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
------------------------------------------------------------------------------

local spawn = require('awful.spawn')
local paths = _G.conf.paths

-- Commands table
local cmd = {
    exe = 'dex',
    run = 'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
          'xrdb -merge <<< "awesome.started:true";' ..
          'dex --environment AwesomeWM --autostart --search-paths "' .. paths.autorun .. '"',
}

-- Run dex.
spawn.easy_async_with_shell('command -v ' .. cmd.exe , function(path)
    if not path then return end
    spawn.with_shell(cmd.run)
end)


-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
