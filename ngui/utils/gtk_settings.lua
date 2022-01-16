-- Awesome
local spawn = require('awful.spawn')
local gfs = require('gears.filesystem')
local naughty = require('naughty')
local notification = naughty.notification
local action = naughty.action
local wibox = require('wibox')

-- External
local lfs = require('lfs')

-- Global
local cfg_vars = _G.cfg.vars
local cfg_paths = _G.cfg.paths

-- Local
local vars = {}
vars.restart = cfg_vars.theme_switch_prompt or false
vars.run = cfg_vars.theme_switch_run or false

local paths = {}
paths.settings = cfg_paths.gtk_settings or os.getenv('XDG_CONFIG_HOME')..'/gtk-3.0/settings.ini'
paths.script = cfg_paths.theme_switch_script or nil

-- Return modification time of file
local get_mtime = function(file)
    file = file or ''
    assert(type(file) == 'string')

    local attr = lfs.attributes(file)
    return attr.modification
end

-- Return table from INI file
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

local rc = parse_ini(paths.settings)
rc = rc.Settings or {}
rc._mtime = get_mtime(paths.settings)

-- Prompt buttons
local prompt_ok = action { name = "Okay", selected = true }
local prompt_cancel = action { name = "Cancel" }

-- Prompt notification
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

-- Prompt OK button pressed
prompt_ok:connect_signal('invoked', function()
    if paths.script and vars.run then
        spawn(paths.script..' &')
    end
    awesome.restart()
end)

client.connect_signal('request::unmanage', function(c)
    if not c.transient_for
        and (c.class == "Lxappearance" or c.instance == "lxappearance")
    then
        local cur_mtime = get_mtime(paths.settings)
        if rc._mtime ~= cur_mtime then
            rc._mtime = cur_mtime
            awesome.emit_signal('theme_changed')
        else
            return
        end
    end
end)

awesome.connect_signal('theme_changed', function()
    if vars.restart then
        prompt_notif()
    else
        if paths.script and vars.run then
            spawn(paths.script..' &')
        end
        awesome.restart()
    end
end)

return rc
