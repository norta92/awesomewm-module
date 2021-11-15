local vars = _G.cfg.vars.dynamic_opacity

local _V = {
    focus = vars.focus or 1,
    unfocus = vars.unfocus or 0.9,
}

client.connect_signal('focus', function(c)
    if not (c.exclude_opacity or c.fullscreen) then
        c.opacity = _V.focus
    end
end)

client.connect_signal('unfocus', function(c)
    if not (c.exclude_opacity or c.fullscreen) then
        c.opacity = _V.unfocus
    end
end)
