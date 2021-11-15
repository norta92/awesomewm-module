local awful = require('awful')
local gears = require('gears')
local notify = require('naughty.notification')
local lfs = require('lfs')
local mod = require('bindings.mod')
local vars = _G.cfg.vars.backdrop

local _V = {
    path = vars.path or nil,
    mode = vars.mode or 'shuffle',
    scale = vars.scale or 'max',
    color = vars.color or '#333',
    span = vars.span or false,
    timeout = vars.timeout or 10,
}

_V.timeout = _V.timeout * 60

local _M = function()

    local filter = function(file)
        return string.match(file, '%.png$')
            or string.match(file, '%.jpg$')
            or string.match(file, '%.svg$')
    end

    local get_random_index = function(index, total)
        local old = index

        while old == index do
            index = math.random(1, total)
        end

        return index
    end

    local is_dir = function(path)
        if type(path) ~= 'string' then return false end

        local cd = lfs.currentdir()
        local is = lfs.chdir(path) and true or false
        lfs.chdir(cd)

        return is
    end

    local is_file = function(path)
        if type(path) ~= 'string' then return false end

        if not is_dir(path) then
            return os.rename(path, path) and true or false
        end

        return false
    end

    local scandir = function(path)
        local files = {}

        for file in lfs.dir(path) do
            if file ~= '.' and file ~= '..' then
                local filepath = path .. '/' .. file
                if (is_file(filepath) and filter(filepath)) then
                    table.insert(files, filepath)
                end
            end
        end

        if #files == 0 then
            notify {message = '"'..path..'" does not contain any supported images!'}
        end

        return files
    end

    local set = function(image)
        for s = 1, screen.count() do
            if _V.span then s = nil end

            if _V.scale == 'center' then
                gears.wallpaper.centered(image, s, _V.color, 2)
            elseif _V.scale == 'tile' then
                gears.wallpaper.tiled(image, s, {0,0})
            elseif _V.scale == 'max' then
                gears.wallpaper.maximized(image, s, false, {0,0})
            elseif _V.scale == 'fit' then
                gears.wallpaper.fit(image, s, _V.color)
            else
                gears.wallpaper.set(image)
            end

            if _V.span then break end
        end

        collectgarbage('collect')
    end

    local update_menu = function(timer)
        return require('modules.backdrop.menu')(timer)
    end

    local set_keys = function(timer)
        awful.keyboard.append_global_keybindings({
            awful.key({ mod.super, mod.alt }, 'w', function()
                timer:emit_signal('timeout')
            end,
            {description = 'show next wallpaper', group = 'backdrop'}),
            awful.key({ mod.super, mod.ctrl }, 'w', function()
                if timer.started then
                    timer:stop()
                else
                    timer:start()
                end
            end,
            {description = 'toggle wallpaper timer', group = 'backdrop'}),
        })
    end

    local set_buttons = function()
        awful.mouse.append_global_mousebindings({
            awful.button({ mod.super }, 3, function()
                _G.menus.wallpaper:show()
            end),
        })
    end

    local modes = { 'single', 'slideshow', 'shuffle' }

    local single = function(path)
        local wallpapers = scandir(path)
        local index = get_random_index(1, #wallpapers)

        set(wallpapers[index], _V.scale)
    end

    local shuffle = function(path)
        local wallpapers = scandir(path)

        if #wallpapers == 0 then
            return
        end

        local index = get_random_index(1, #wallpapers)

        local timer = gears.timer { timeout = _V.timeout, autostart = true }

        timer:connect_signal('timeout', function()
            index = get_random_index(index, #wallpapers)
            set(wallpapers[index], _V.scale)
        end)

        timer:connect_signal('start', function()
            timer:emit_signal('timeout')
            _G.menus.wallpaper = update_menu(timer)
        end)

        timer:connect_signal('stop', function()
            _G.menus.wallpaper = update_menu(timer)
        end)

        if timer.started then
            _G.menus.wallpaper = update_menu(timer)
            timer:emit_signal('timeout')
            set_keys(timer)
            set_buttons()
        end
    end

    local slideshow = function(path)
        local wallpapers = scandir(path)
        table.sort(wallpapers)

        local index = 1
        local total = #wallpapers

        local timer = gears.timer { timeout = _V.timeout, autostart = true }

        timer:connect_signal('timeout', function()
            if index <= total then
                set(wallpapers[index], _V.scale)
                index = index + 1
            else
                set(wallpapers[1], _V.scale)
                index = 1
            end
        end)

        timer:connect_signal('start', function()
            timer:emit_signal('timeout')
            _G.menus.wallpaper = update_menu(timer)
        end)

        timer:connect_signal('stop', function()
            _G.menus.wallpaper = update_menu(timer)
        end)

        if timer.started then
            _G.menus.wallpaper = update_menu(timer)
            timer:emit_signal('timeout')
            set_keys(timer)
            set_buttons()
        end
    end

    do
        if _V.path then
            if vars.mode == modes[1] and is_file(_V.path) then
                set(_V.path)
            elseif vars.mode == modes[1] and is_dir(_V.path) then
                single(_V.path)
            elseif vars.mode == modes[2] and is_dir(_V.path) then
                slideshow(_V.path)
            elseif vars.mode == modes[3] and is_dir(_V.path) then
                shuffle(_V.path)
            else
                notify { message = '"'.._V.path..'" is invalid path!' }
            end
        else
            gears.wallpaper.set(_V.color)
        end
    end

end

return _M
