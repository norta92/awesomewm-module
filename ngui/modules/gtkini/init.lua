local spawn = require('awful.spawn')
local gfs = require('gears.filesystem')
local lfs = require('lfs')
local naughty = require('naughty')
local notification = naughty.notification
local action = naughty.action
local wibox = require('wibox')

local cfg_vars = _G.cfg.vars
local cfg_paths = _G.cfg.paths

local vars = {}
vars.prompt_restart = cfg_vars.gtkini_prompt_restart or false
vars.run_script = cfg_vars.gtkini_run_script or false

local paths = {}
paths.gtk_settings = cfg_paths.gtkini_gtk_settings or os.getenv('XDG_CONFIG_HOME')..'/gtk-3.0/settings.ini'
paths.post_script = cfg_paths.gtkini_post_script or nil

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

local prompt_ok = action { name = "Okay", selected = true }
local prompt_cancel = action { name = "Cancel" }

local prompt_notif = function()
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
    if paths.post_script and vars.run_script then
        spawn(paths.post_script..' &')
    end
    awesome.restart()
end)

local rc = parse_ini(paths.gtk_settings)
rc = rc.Settings or {}
rc._mtime = get_mtime(paths.gtk_settings)

client.connect_signal('request::unmanage', function(c)
    if c.class == "Lxappearance" or c.instance == "lxappearance" then
        local cur_mtime = get_mtime(paths.gtk_settings)
        if rc._mtime ~= cur_mtime then
            rc._mtime = cur_mtime
            awesome.emit_signal('gtkini::update')
        else
            return
        end
    end
end)

awesome.connect_signal('gtkini::update', function()
    if vars.prompt_restart then
        prompt_notif()
    else
        if paths.post_script and vars.run_script then
            spawn(paths.post_script..' &')
        end
        awesome.restart()
    end
end)

return rc
