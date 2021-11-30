local spawn = require('awful.spawn')
local gfs = require('gears.filesystem')
local lfs = require('lfs')
local naughty = require('naughty')
local notification = naughty.notification
local wibox = require('wibox')

local ini_path = os.getenv('XDG_CONFIG_HOME')..'/gtk-3.0/settings.ini'

local vars = require('config').vars.gtkini
local paths = require('config').paths
local ini = paths.gtkini or ini_path or nil
local postrun = paths.config..'/modules/gtkini/theme_extras.sh &' or nil
local do_prompt = vars.prompt or false
local do_run = vars.run or true

local get_mtime = function(file)
    file = file or ''
    assert(type(file) == 'string')

    local attr = lfs.attributes(file)
    return attr.modification
end

local parse_ini = function(file)
    file = file or ''
    assert(type(file) == 'string')

    local data, section, key, value, temp = {}
    if not gfs.file_readable(file) then
        return data
    end

    for line in io.lines(file) do
        temp = line:match('^%[(.+)%]$')
        if temp ~= nil and section ~= temp then section = temp end
        key, value = line:match('^([^=]+)=(.+)$')
        if section ~= nil then
            data[section] = data[section] or {}
            if key ~= nil then
                data[section][key] = value
            end
        end
    end

    return data
end

local prompt_ok = naughty.action { name = "Okay" }
local prompt_cancel = naughty.action { name = "Cancel" }

local prompt_restart = function()
    local n = notification {
        title = "Theme Change",
        message = "Restart Awesome now?",
        timeout = 30,
        actions = {
            prompt_ok,
            prompt_cancel,
        }
    }
    wibox.widget {
        notification = n,
        widget = naughty.list.actions,
    }

end

prompt_ok:connect_signal('invoked', function()
    if do_run then
        spawn(postrun)
    end
    awesome.restart()
end)

local rc = parse_ini(ini)
rc = rc.Settings or {}
rc._mtime = get_mtime(ini)

client.connect_signal('request::unmanage', function(c)
    if c.class == "Lxappearance" or c.instance == "lxappearance" then
        local cur_mtime = get_mtime(ini)
        if rc._mtime ~= cur_mtime then
            rc._mtime = cur_mtime
            awesome.emit_signal('gtkini::update')
        else
            return
        end
    end
end)

awesome.connect_signal('gtkini::update', function()
    if do_prompt then
        prompt_restart()
    else
        if do_run then
            spawn(postrun)
        end
        awesome.restart()
    end
end)

return rc
