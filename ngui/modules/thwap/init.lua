local spawn = require('awful.spawn')
local fs = require('gears.filesystem')
local lfs = require('lfs')

local gtkrc = require('config').paths.gtkrc
local postrun = fs.get_configuration_dir()..'/modules/thwap/postrun.sh'

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
    if not fs.file_readable(file) then
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

local rc = parse_ini(gtkrc)
_G.gtkrc = rc.Settings or {}
_G.gtkrc._mtime = get_mtime(gtkrc)

client.connect_signal('request::unmanage', function(c)
    if c.class == "Lxappearance" or c.instance == "lxappearance" then
        local cur_mtime = get_mtime(gtkrc)
        if _G.gtkrc._mtime ~= cur_mtime then
            _G.gtkrc._mtime = cur_mtime
            spawn(postrun)
            -- popup or notification confirming restart here
            awesome.restart()
        else
            return
        end
    end
end)
