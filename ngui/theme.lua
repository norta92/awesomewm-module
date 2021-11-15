local theme_assets  = require('beautiful.theme_assets')
local dpi           = require('beautiful.xresources').apply_dpi
local gtk           = require('beautiful.gtk')
local gears         = require('gears')
local gfs           = gears.filesystem
local themes_path   = gfs.get_themes_dir()
local res_path      = gfs.get_configuration_dir()..'/resources/'
local shape         = gears.shape
local debug         = gears.debug
local colors        = require('utils.colors')
local svg           = require('svgicons')
local render        = svg.render_icon
local cairo         = require("lgi").cairo

local theme = dofile(themes_path..'default/theme.lua')

theme.gtk = gtk.get_theme_variables()
if not theme.gtk then
    debug.print_warning("Can't load GTK+3 theme. You're going to have a bad time.")
    return theme
end

local button_shape                  = function(cr, w, h)
                                          shape.rounded_rect(cr, w, h, theme.border_radius)
                                      end

theme.font                          = theme.gtk.font_family..' '..theme.gtk.font_size
theme.font_bold                     = theme.gtk.font_family..' Bold '..theme.gtk.font_size
theme.font_italic                   = theme.gtk.font_family..' Italic '..theme.gtk.font_size

theme.useless_gap                   = dpi(4)

theme.opacity                       = 0.9
theme.transparent                   = '#00000000'

theme.fg_normal                     = theme.gtk.fg_color
theme.bg_normal                     = theme.gtk.bg_color

theme.fg_focus                      = theme.gtk.selected_fg_color
theme.bg_focus                      = theme.gtk.selected_bg_color

theme.fg_urgent                     = theme.gtk.warning_fg_color
theme.bg_urgent                     = theme.gtk.warning_bg_color

theme.fg_minimize                   = theme.gtk.text_color
theme.bg_minimize                   = theme.gtk.base_color

theme.fg_success                    = theme.gtk.success_fg_color
theme.bg_success                    = theme.gtk.success_bg_color

theme.fg_warning                    = theme.gtk.warning_fg_color
theme.bg_warning                    = theme.gtk.warning_bg_color

theme.fg_error                      = theme.gtk.error_fg_color
theme.bg_error                      = theme.gtk.error_bg_color

theme.base_fg                       = theme.gtk.text_color
theme.base_bg                       = theme.gtk.base_color

theme.wibar_fg                      = theme.gtk.fg_color
theme.wibar_bg                      = theme.gtk.bg_color

theme.menubar_fg                    = theme.gtk.menubar_fg_color
theme.menubar_bg                    = theme.gtk.menubar_bg_color
theme.menubar_border_color          = colors.mix(
                                          theme.gtk.menubar_bg_color,
                                          theme.gtk.menubar_fg_color,
                                          0.7
                                      )

theme.header_fg                     = theme.gtk.header_button_fg_color
theme.header_bg                     = theme.gtk.header_button_bg_color
theme.header_border_color           = theme.gtk.header_button_border_color

theme.osd_fg                        = theme.gtk.osd_fg_color
theme.osd_bg                        = theme.gtk.osd_bg_color
theme.osd_border_color              = theme.gtk.osd_border_color

theme.border_color                  = theme.bg_normal
theme.border_color_normal           = theme.bg_normal
theme.border_color_active           = theme.bg_focus
theme.border_color_marked           = theme.bg_warning
theme.border_width                  = dpi(theme.gtk.button_border_width or 1)
theme.border_radius                 = dpi(theme.gtk.button_border_radius or 0)

theme.titlebar_fg_normal            = theme.base_fg
theme.titlebar_bg_normal            = theme.bg_normal
theme.titlebar_font_normal          = theme.font_bold
theme.titlebar_fg_focus             = theme.fg_normal
theme.titlebar_bg_focus             = theme.bg_normal
theme.titlebar_font_focus           = theme.font_bold
theme.titlebar_fg_urgent            = theme.fg_success
theme.titlebar_bg_urgent            = theme.bg_normal
theme.titlebar_font_urgent          = theme.font_bold
theme.titlebar_height               = dpi(20)
theme.titlebar_shape                = button_shape

theme.titlebar_ontop_button_focus_active = render(
    svg.titlebar.ontop_alt, theme.fg_normal)
theme.titlebar_ontop_button_focus_active_hover = render(
    svg.titlebar.ontop_alt, theme.bg_warning)
theme.titlebar_ontop_button_focus_active_press = render(
    svg.titlebar.ontop_alt, theme.bg_focus)
theme.titlebar_ontop_button_focus_inactive = render(
    svg.titlebar.ontop, theme.fg_normal)
theme.titlebar_ontop_button_focus_inactive_hover = render(
    svg.titlebar.ontop, theme.bg_warning)
theme.titlebar_ontop_button_focus_inactive_press = render(
    svg.titlebar.ontop, theme.bg_focus)
theme.titlebar_ontop_button_normal_active = render(
    svg.titlebar.ontop_alt, theme.fg_normal)
theme.titlebar_ontop_button_normal_active_hover = render(
    svg.titlebar.ontop_alt, theme.bg_warning)
theme.titlebar_ontop_button_normal_active_press = render(
    svg.titlebar.ontop_alt, theme.bg_focus)
theme.titlebar_ontop_button_normal_inactive = render(
    svg.titlebar.ontop, theme.fg_normal)
theme.titlebar_ontop_button_normal_inactive_hover = render(
    svg.titlebar.ontop, theme.bg_warning)
theme.titlebar_ontop_button_normal_inactive_press = render(
    svg.titlebar.ontop, theme.bg_focus)

theme.titlebar_sticky_button_focus_active = render(
    svg.titlebar.sticky_alt, theme.fg_normal)
theme.titlebar_sticky_button_focus_active_hover = render(
    svg.titlebar.sticky_alt, theme.bg_success)
theme.titlebar_sticky_button_focus_active_press = render(
    svg.titlebar.sticky_alt, theme.bg_focus)
theme.titlebar_sticky_button_focus_inactive = render(
    svg.titlebar.sticky, theme.fg_normal)
theme.titlebar_sticky_button_focus_inactive_hover = render(
    svg.titlebar.sticky, theme.bg_success)
theme.titlebar_sticky_button_focus_inactive_press = render(
    svg.titlebar.sticky, theme.bg_focus)
theme.titlebar_sticky_button_normal_active = render(
    svg.titlebar.sticky_alt, theme.fg_normal)
theme.titlebar_sticky_button_normal_active_hover = render(
    svg.titlebar.sticky_alt, theme.bg_success)
theme.titlebar_sticky_button_normal_active_press = render(
    svg.titlebar.sticky_alt, theme.bg_focus)
theme.titlebar_sticky_button_normal_inactive = render(
    svg.titlebar.sticky, theme.fg_normal)
theme.titlebar_sticky_button_normal_inactive_hover = render(
    svg.titlebar.sticky, theme.bg_success)
theme.titlebar_sticky_button_normal_inactive_press = render(
    svg.titlebar.sticky, theme.bg_focus)

theme.titlebar_minimize_button_normal = render(
    svg.titlebar.minimize, theme.fg_normal)
theme.titlebar_minimize_button_normal_hover = render(
    svg.titlebar.minimize, theme.bg_warning)
theme.titlebar_minimize_button_focus = render(
    svg.titlebar.minimize, theme.fg_normal)
theme.titlebar_minimize_button_focus_hover = render(
    svg.titlebar.minimize, theme.bg_warning)
theme.titlebar_minimize_button_focus_press = render(
    svg.titlebar.minimize, theme.bg_focus)

theme.titlebar_maximized_button_focus_active = render(
    svg.titlebar.maximize_alt, theme.fg_normal)
theme.titlebar_maximized_button_focus_active_hover = render(
    svg.titlebar.maximize_alt, theme.bg_success)
theme.titlebar_maximized_button_focus_active_press = render(
    svg.titlebar.maximize_alt, theme.bg_focus)
theme.titlebar_maximized_button_focus_inactive = render(
    svg.titlebar.maximize, theme.fg_normal)
theme.titlebar_maximized_button_focus_inactive_hover = render(
    svg.titlebar.maximize, theme.bg_success)
theme.titlebar_maximized_button_focus_inactive_press = render(
    svg.titlebar.maximize, theme.bg_focus)
theme.titlebar_maximized_button_normal_active = render(
    svg.titlebar.maximize_alt, theme.fg_normal)
theme.titlebar_maximized_button_normal_active_hover = render(
    svg.titlebar.maximize_alt, theme.bg_success)
theme.titlebar_maximized_button_normal_active_press = render(
    svg.titlebar.maximize_alt, theme.bg_focus)
theme.titlebar_maximized_button_normal_inactive = render(
    svg.titlebar.maximize, theme.fg_normal)
theme.titlebar_maximized_button_normal_inactive_hover = render(
    svg.titlebar.maximize, theme.bg_success)
theme.titlebar_maximized_button_normal_inactive_press = render(
    svg.titlebar.maximize, theme.bg_focus)

theme.titlebar_close_button_normal = render(
    svg.titlebar.close, theme.fg_normal)
theme.titlebar_close_button_normal_hover = render(
    svg.titlebar.close_alt, theme.bg_error)
theme.titlebar_close_button_focus = render(
    svg.titlebar.close, theme.bg_error)
theme.titlebar_close_button_focus_hover = render(
    svg.titlebar.close_alt, theme.bg_error)
theme.titlebar_close_button_focus_press = render(
    svg.titlebar.close_alt, theme.bg_focus)

theme.button_fg                     = theme.gtk.button_fg_color
theme.button_bg                     = theme.gtk.button_bg_color
theme.button_border_color           = theme.gtk.button_border_color
theme.button_border_width           = dpi(theme.gtk.button_border_width or 1)
theme.button_border_radius          = dpi(theme.gtk.button_border_radius or 0)
theme.button_shape                  = function(cr, w, h)
                                          shape.rounded_rect(cr, w, h, theme.border_radius)
                                      end

theme.button_fg_hover               = theme.fg_normal
theme.button_bg_hover               = theme.button_bg
theme.button_border_color_hover     = colors.mix(theme.bg_focus, theme.base_fg, 0.8)

theme.button_fg_pressed             = theme.fg_focus
theme.button_bg_pressed             = theme.bg_focus
theme.button_border_color_pressed   = colors.mix(theme.bg_focus, theme.base_fg, 0.8)

theme.menu_button_icon              = render(svg.wibars.main_menu, theme.button_fg, nil, 24)
theme.keyboard_layout_icon          = render(svg.wibars.keyboard_layout, theme.button_fg, nil, 24)
theme.leaver_button_icon            = render(svg.wibars.leaver_menu, theme.button_fg, nil, 24)
theme.systray_visible_icon          = render(svg.wibars.systray_visible, theme.button_fg, nil, 24)
theme.systray_hidden_icon           = render(svg.wibars.systray_hidden, theme.button_fg, nil, 24)

theme.layout_cornerne               = render(svg.layouts.cornerne, theme.fg_minimize, nil, 24)
theme.layout_cornernw               = render(svg.layouts.cornernw, theme.fg_minimize, nil, 24)
theme.layout_cornerse               = render(svg.layouts.cornerse, theme.fg_minimize, nil, 24)
theme.layout_cornersw               = render(svg.layouts.cornersw, theme.fg_minimize, nil, 24)
theme.layout_dwindle                = render(svg.layouts.dwindle, theme.fg_minimize, nil, 24)
theme.layout_fairh                  = render(svg.layouts.fairh, theme.fg_minimize, nil, 24)
theme.layout_fairv                  = render(svg.layouts.fairv, theme.fg_minimize, nil, 24)
theme.layout_floating               = render(svg.layouts.floating, theme.fg_minimize, nil, 24)
theme.layout_fullscreen             = render(svg.layouts.fullscreen, theme.fg_minimize, nil, 24)
theme.layout_magnifier              = render(svg.layouts.magnifier, theme.fg_minimize, nil, 24)
theme.layout_max                    = render(svg.layouts.max, theme.fg_minimize, nil, 24)
theme.layout_spiral                 = render(svg.layouts.spiral, theme.fg_minimize, nil, 24)
theme.layout_tile                   = render(svg.layouts.tile, theme.fg_minimize, nil, 24)
theme.layout_tilebottom             = render(svg.layouts.tilebottom, theme.fg_minimize, nil, 24)
theme.layout_tileleft               = render(svg.layouts.tileleft, theme.fg_minimize, nil, 24)
theme.layout_tiletop                = render(svg.layouts.tiletop, theme.fg_minimize, nil, 24)

theme.tasklist_fg_normal            = theme.base_fg
theme.tasklist_bg_normal            = theme.button_bg
theme.tasklist_fg_focus             = theme.base_fg
theme.tasklist_bg_focus             = theme.bg_focus
theme.tasklist_fg_urgent            = theme.base_fg
theme.tasklist_bg_urgent            = theme.bg_success
theme.tasklist_fg_minimize          = theme.button_border_color
theme.tasklist_bg_minimize          = theme.button_bg
theme.tasklist_button_width         = dpi(240)
theme.tasklist_menu_width           = dpi(160)
theme.tasklist_plain_task_name      = true

theme.taglist_fg_empty              = theme.button_border_color
theme.taglist_bg_empty              = theme.button_bg
theme.taglist_fg_occupied           = theme.button_fg
theme.taglist_bg_occupied           = theme.button_bg
theme.taglist_fg_focus              = theme.button_fg
theme.taglist_bg_focus              = theme.bg_focus
theme.taglist_fg_urgent             = theme.button_fg
theme.taglist_bg_urgent             = theme.bg_success
theme.taglist_bg_container          = theme.button_bg
theme.taglist_shape                 = button_shape
theme.taglist_squares_sel           = nil
theme.taglist_squares_unsel         = nil

theme.menu_button_width             = dpi(32)
theme.menu_button_text              = nil

theme.menu_fg_normal                = theme.menubar_fg
theme.menu_bg_normal                = theme.menubar_bg
theme.menu_border_width             = theme.button_border_width
theme.menu_border_color             = theme.base_bg
theme.menu_width                    = dpi(150)
theme.menu_height                   = dpi(24)
theme.menu_submenu                  = render(svg.menus.submenu, theme.fg_normal, nil, 24)
theme.menu_submenu_icon             = render(svg.menus.submenu, theme.fg_normal, nil, 24)

theme.menu_terminal_icon            = res_path..'menus/main/terminal.svg'
theme.menu_files_icon               = res_path..'menus/main/files.svg'

theme.awesome_hotkeys_icon          = res_path..'menus/awesome/hotkeys.svg'
theme.awesome_manual_icon           = res_path..'menus/awesome/manual.svg'
theme.awesome_config_icon           = res_path..'menus/awesome/config.svg'
theme.awesome_restart_icon          = res_path..'menus/awesome/restart.svg'
theme.awesome_exit_icon             = res_path..'menus/awesome/exit.svg'

theme.backdrop_start_icon           = res_path..'menus/backdrop/start.svg'
theme.backdrop_stop_icon            = res_path..'menus/backdrop/stop.svg'
theme.backdrop_next_icon            = res_path..'menus/backdrop/next.svg'
theme.backdrop_prev_icon            = res_path..'menus/backdrop/prev.svg'

theme.leaver_dialog_icon            = res_path..'menus/leaver/dialog.svg'
theme.leaver_lock_icon              = res_path..'menus/leaver/lock.svg'
theme.leaver_exit_icon              = res_path..'menus/leaver/exit.svg'
theme.leaver_reboot_icon            = res_path..'menus/leaver/reboot.svg'
theme.leaver_suspend_icon           = res_path..'menus/leaver/suspend.svg'
theme.leaver_poweroff_icon          = res_path..'menus/leaver/shutdown.svg'
theme.leaver_confirm_icon           = res_path..'menus/leaver/confirm.svg'
theme.leaver_cancel_icon            = res_path..'menus/leaver/cancel.svg'

theme.bg_systray                    = theme.wibar_bg
theme.systray_icon_spacing          = dpi(2)

theme.calendar_style                = {
                                          fg_color      = theme.fg_color,
                                          bg_color      = theme.bg_color,
                                          shape         = button_shape,
                                          padding       = dpi(2),
                                          border_color  = theme.base_bg,
                                          border_width  = theme.border_width,
                                          opacity       = theme.opacity,
                                      }
theme.calendar_normal_fg_color      = theme.button_fg
theme.calendar_normal_bg_color      = theme.button_bg
theme.calendar_normal_border_color  = theme.button_border_color
theme.calendar_focus_fg_color       = theme.fg_focus
theme.calendar_focus_bg_color       = theme.bg_focus
theme.calendar_header_fg_color      = theme.header_fg
theme.calendar_header_bg_color      = theme.header_bg
theme.calendar_header_border_color  = theme.header_border_color
theme.calendar_weekday_fg_color     = theme.button_border_color
theme.calendar_weekday_bg_color     = theme.button_bg
theme.calendar_weekday_border_color = theme.button_bg

theme.tooltip_fg                    = theme.gtk.tooltip_fg_color
theme.tooltip_bg                    = theme.gtk.tooltip_bg_color
theme.tooltip_border_color          = theme.base_bg
theme.tooltip_border_width          = dpi(1)
theme.tooltip_font                  = theme.font
theme.tooltip_opacity               = theme.opacity
theme.tooltip_gaps                  = dpi(2)
theme.tooltip_shape                 = theme.titlebar_shape
theme.tooltip_align                 = 'left'

theme.notification_position         = 'top_right'
theme.notification_width            = dpi(240)
theme.notification_height           = dpi(30)
theme.notification_icon_size        = dpi(48)
theme.notification_font             = theme.font
theme.notification_fg               = theme.osd_fg
theme.notification_bg               = theme.osd_bg
theme.notification_border_color     = theme.osd_border_color
theme.notification_border_width     = theme.border_width
theme.notification_shape            = button_shape
theme.notification_opacity          = theme.opacity
theme.notification_padding          = theme.useless_gap
theme.notification_spacing          = theme.useless_gap

theme.snapper_gap                   = dpi(3)
theme.snap_bg                       = theme.base_bg
theme.snap_border_width             = theme.border_width
theme.snap_shape                    = button_shape

theme.hotkeys_fg                    = theme.fg_normal
theme.hotkeys_bg                    = theme.bg_normal
theme.hotkeys_label_fg              = theme.fg_focus
theme.hotkeys_label_bg              = theme.button_bg
theme.hotkeys_modifiers_fg          = theme.bg_warning
theme.hotkeys_font                  = theme.font_bold
theme.hotkeys_description_font      = theme.font
theme.hotkeys_border_color          = theme.base_bg
theme.hotkeys_border_width          = theme.border_width
theme.hotkeys_shape                 = button_shape
theme.hotkeys_group_margin          = dpi(2)

local function awesomer_icon(args)
    args = args or {}
    local fg = args.fg or theme.bg_normal
    local bg = args.bg or theme.bg_focus
    local border_color = args.border_color or theme.bg_normal
    local border_width = args.border_width or theme.border_width
    local size = args.size or theme.menu_height
    local margin = args.margin or theme.border_width

    local img = cairo.ImageSurface(cairo.Format.ARGB32, size, size)
    local cr = cairo.Context(img)
    local icon_size = size - (2*border_width) - (2*margin)
    cr:set_source(gears.color(border_color))
    cr:paint()
    cr:translate(border_width+margin, border_width+margin)
    cr:set_antialias(cairo.Antialias.NONE)
    theme_assets.gen_logo(cr, icon_size, icon_size, fg, bg)
    return img
end

theme.awesome_menu_icon = awesomer_icon({})

theme.default_app_icon = awesomer_icon {
    fg = theme.base_bg,
    bg = theme.base_fg,
    border_color = theme.base_bg,
}

theme.notification_default_icon = awesomer_icon {
    fg = theme.bg_normal,
    bg = theme.bg_focus,
    border_color = theme.bg_normal,
    size = theme.notification_icon_size,
}

theme.icon_theme = 'nGUI'

return theme
