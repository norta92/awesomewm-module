local focus = _G.cfg.vars.focus

local _V = {
    sloppy = focus.sloppy,
    raise = focus.raise,
}

client.connect_signal('mouse::enter', function(c)
    if _V.sloppy then
        c:activate { context = 'mouse_enter', raise = _V.raise }
    end
end)
