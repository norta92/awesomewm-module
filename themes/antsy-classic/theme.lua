------------------------------------------------------------------------------
----- Antsy Classic theme
---- Based on Xterm color scheme
----
---- @author Jeff M. Hubbard &lt;jeffmhubbard@gmail.com&gt;
---- @copyright 2020-2021 Jeff M. Hubbard
---- @module themes.antsy-classic.theme
------------------------------------------------------------------------------

local beautiful         = require("beautiful")
local assets            = beautiful.theme_assets
local dpi               = beautiful.xresources.apply_dpi
local gears             = require("gears")
local wallpaper         = _G.conf.vars.wallpaper
local themes            = _G.conf.paths.themes
local active            = _G.conf.vars.themes.active
local res               = themes .. active .. "/resources/"
local svgdata           = require("themes." .. active .. ".svgicons")
local render            = require("utils").svg_to_surface

local theme = {}

-- Xresources colors
theme.black                     = xres.color0       -- #000000
theme.dark_red                  = xres.color1       -- #cd0000
theme.dark_green                = xres.color2       -- #00cd00
theme.dark_yellow               = xres.color3       -- #cdcd00
theme.dark_blue                 = xres.color4       -- #0000ee
theme.dark_magenta              = xres.color5       -- #cd00cd
theme.dark_cyan                 = xres.color6       -- #00cdcd
theme.gray                      = xres.color7       -- #e5e5e5
theme.dark_gray                 = xres.color8       -- #7f7f7f
theme.red                       = xres.color9       -- #ff0000
theme.green                     = xres.color10      -- #00ff00
theme.yellow                    = xres.color11      -- #ffff00
theme.blue                      = xres.color12      -- #5c5cff
theme.magenta                   = xres.color13      -- #ff00ff
theme.cyan                      = xres.color14      -- #00ffff
theme.white                     = xres.color15      -- #ffffff
theme.background                = xres.background   -- #000000
theme.foreground                = xres.foreground   -- #ffffff

-- Fonts
theme.font                      = "Hack Nerd Font Mono 10"
theme.font_bold                 = "Hack Nerd Font Mono Bold 10"
theme.font_large                = "Hack Nerd Font Mono 12"
theme.font_small                = "Hack Nerd Font Mono 9"
theme.font_extra_small          = "Hack Nerd Font Mono 8"

-- Aliases
theme.ui_color                  = theme.background
theme.ui_alt_color              = theme.dark_gray
theme.ui_accent                 = theme.gray
theme.text_color                = theme.foreground
theme.text_alt_color            = theme.black
theme.focus_color               = theme.blue
theme.focus_accent              = theme.dark_blue
theme.active_color              = theme.white
theme.active_accent             = theme.gray
theme.inactive_color            = theme.dark_gray
theme.inactive_accent           = theme.gray
theme.new_color                 = theme.yellow
theme.new_accent                = theme.dark_yellow
theme.urgent_color              = theme.cyan
theme.urgent_accent             = theme.dark_cyan
theme.marked_color              = theme.magenta
theme.marked_accent             = theme.dark_magenta
theme.minimize_color            = theme.black
theme.minimize_accent           = theme.dark_gray
theme.error_color               = theme.red
theme.error_accent              = theme.dark_red
theme.hover_color               = theme.active_color .. "26"
theme.click_color               = theme.focus_color .. "26"
theme.no_color                  = "#00000000"
theme.alpha                     = "e6" -- 90%

-- Misc options
theme.useless_gap               = dpi(4)
theme.border_width              = dpi(2)
theme.border_radius             = dpi(0)
theme.separator                 = " "           -- custom
theme.spacing                   = dpi(2)        -- custom
theme.margins                   = dpi(2)        -- custom
theme.opacity                   = 1.0           -- custom

-- General
theme.fg_normal                 = theme.text_color
theme.bg_normal                 = theme.ui_color
theme.wibar_fg                  = theme.text_color
theme.wibar_bg                  = theme.ui_color
theme.fg_focus                  = theme.text_alt_color
theme.bg_focus                  = theme.focus_color
theme.fg_urgent                 = theme.text_alt_color
theme.bg_urgent                 = theme.urgent_color
theme.fg_minimize               = theme.text_alt_color
theme.bg_minimize               = theme.minimize_color

-- Window border colors
theme.border_color                      = theme.ui_color
theme.border_color_normal               = theme.ui_color
theme.border_color_active               = theme.focus_color
theme.border_color_urgent               = theme.urgent_color
theme.border_color_new                  = theme.ui_color
theme.border_color_marked               = theme.marked_color
theme.border_color_floating             = theme.ui_color
theme.border_color_floating_active      = theme.focus_color
theme.border_color_floating_urgent      = theme.urgent_color
theme.border_color_maximized            = theme.ui_color
theme.border_color_maximized_active     = theme.ui_color
theme.border_color_maximized_urgent     = theme.urgent_color
theme.border_color_fullscreen           = theme.ui_color
theme.border_color_fullscreen_active    = theme.ui_color
theme.border_color_fullscreen_urgent    = theme.ui_color

-- Panel
--theme.panel_width               = dpi(0)
theme.panel_height              = dpi(20)
theme.panel_border_color        = theme.ui_color
theme.panel_border_width        = dpi(0)
theme.panel_margin              = dpi(2)
theme.panel_spacing             = dpi(6)
theme.panel_opacity             = theme.opacity

-- Taglist widget
theme.taglist_fg_empty          = theme.ui_alt_color
theme.taglist_bg_empty          = theme.no_color
theme.taglist_fg_focus          = theme.text_color
theme.taglist_bg_focus          = theme.focus_color
theme.taglist_fg_occupied       = theme.text_color
theme.taglist_bg_occupied       = theme.inactive_color
theme.taglist_fg_urgent         = theme.text_color
theme.taglist_bg_urgent         = theme.urgent_color
theme.taglist_fg_volatile       = theme.text_color
theme.taglist_bg_volatile       = theme.error_color
theme.taglist_font              = theme.font
theme.taglist_width             = dpi(20)
theme.taglist_spacing           = theme.spacing
theme.taglist_squares_sel       = nil
theme.taglist_squares_unsel     = nil

theme.taglist_shape_border_width            = dpi(0)
theme.taglist_shape_border_color            = theme.no_color
theme.taglist_shape_border_color_empty      = theme.no_color
theme.taglist_shape_border_color_focus      = theme.no_color
theme.taglist_shape_border_color_urgent     = theme.no_color
theme.taglist_shape_border_color_volatile   = theme.no_color


-- Tasklist widget
theme.tasklist_fg_normal        = theme.text_color
theme.tasklist_bg_normal        = theme.inactive_color
theme.tasklist_font_normal      = theme.font
theme.tasklist_fg_focus         = theme.text_color
theme.tasklist_bg_focus         = theme.focus_color
theme.tasklist_font_focus       = theme.font_bold
theme.tasklist_fg_minimize      = theme.ui_alt_color
theme.tasklist_bg_minimize      = theme.ui_color
theme.tasklist_font_minimized   = theme.font
theme.tasklist_fg_urgent        = theme.text_color
theme.tasklist_bg_urgent        = theme.urgent_color
theme.tasklist_font_urgent      = theme.font_bold
theme.tasklist_item_width       = dpi(256)      -- custom
theme.tasklist_spacing          = theme.spacing
theme.tasklist_shape_border_width           = theme.border_width
theme.tasklist_shape_border_color           = theme.inactive_color
theme.tasklist_shape_border_color_focus     = theme.focus_color
theme.tasklist_shape_border_color_minimized = theme.ui_color
theme.tasklist_shape_border_color_urgent    = theme.urgent_color

-- Titlebar widget
theme.titlebar_fg_normal        = theme.text_color
theme.titlebar_bg_normal        = theme.ui_color
theme.titlebar_font_normal      = theme.font
theme.titlebar_fg_focus         = theme.text_color
theme.titlebar_bg_focus         = theme.ui_color
theme.titlebar_font_focus       = theme.font_bold
theme.titlebar_bg_transparent   = theme.ui_color
theme.titlebar_height           = dpi(20)       -- custom

-- Systray widget
theme.bg_systray                = theme.ui_color
theme.systray_icon_spacing      = dpi(2)

-- Menu widget
theme.menu_button_fg            = theme.ui_alt_color
theme.menu_button_bg            = theme.ui_color
theme.menu_button_width         = dpi(36)
theme.menu_button_border_color  = theme.ui_alt_color
theme.menu_button_border_width  = dpi(0)

-- Session widget
theme.session_button_fg            = theme.ui_alt_color
theme.session_button_bg            = theme.ui_color
theme.session_button_width         = dpi(20)
theme.session_button_border_color  = theme.ui_alt_color
theme.session_button_border_width  = dpi(0)

-- Menus
theme.menu_font                 = theme.font
theme.menu_width                = dpi(160)
theme.menu_height               = dpi(20)
theme.menu_border_color         = theme.border_color_active
theme.menu_border_width         = theme.border_width

-- Tooltips
theme.tooltip_fg                = theme.text_color
theme.tooltip_bg                = theme.ui_color
theme.tooltip_border_color      = theme.border_color_normal
theme.tooltip_border_width      = theme.border_width
theme.tooltip_opacity           = theme.opacity

-- Notifications
theme.notification_position     = 'top_right'
theme.notification_width        = dpi(300)
theme.notification_height       = dpi(30)
theme.notification_icon_size    = dpi(48)
theme.notification_font         = theme.font
theme.notification_fg           = theme.text_color
theme.notification_bg           = theme.ui_color
theme.notification_border_width = theme.border_width
theme.notification_border_color = theme.active_color
theme.notification_opacity      = theme.opacity
theme.notification_margin       = theme.margins
theme.notification_spacing      = theme.spacing
theme.notification_padding      = theme.useless_gap

-- Window snap
theme.snapper_gap               = theme.margins
theme.snap_bg                   = theme.new_color
theme.snap_border_width         = theme.border_width
theme.snap_shape                = gears.shape.rectangle

-- Hotkeys popup
theme.hotkeys_bg                = theme.ui_color
theme.hotkeys_fg                = theme.text_color
theme.hotkeys_label_bg          = theme.ui_color
theme.hotkeys_label_fg          = theme.text_alt_color
theme.hotkeys_modifiers_fg      = theme.marked_color
theme.hotkeys_font              = theme.font_bold
theme.hotkeys_description_font  = theme.font
theme.hotkeys_border_color      = theme.active_color
theme.hotkeys_border_width      = theme.border_width
theme.hotkeys_group_margin      = theme.margins

-- Customize awesome icon
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height,
    theme.magenta,
    theme.black)

theme.awesome_notification_icon = assets.awesome_icon(
    theme.notification_icon_size,
    theme.magenta,
    theme.black)

-- Icon theme
theme.icon_theme = "Antsy"

-- Panel widget icons
local panels = svg_icons.panels
theme.menu_button_icon      = render(panels.main_menu, theme.ui_alt_color, nil, 24)
theme.session_button_icon   = render(panels.session_menu, theme.ui_alt_color, nil, 24)
theme.systray_visible       = render(panels.systray_visible, theme.ui_alt_color, nil, 24)
theme.systray_hidden        = render(panels.systray_hidden, theme.ui_alt_color, nil, 24)

-- Titlebar icons
local titlebar = svg_icons.titlebar
theme.titlebar_minimize_button_normal                   = render(titlebar.minimize, theme.inactive_color)
theme.titlebar_minimize_button_normal_hover             = render(titlebar.minimize, theme.dark_yellow)
theme.titlebar_minimize_button_focus                    = render(titlebar.minimize, theme.active_color)
theme.titlebar_minimize_button_focus_hover              = render(titlebar.minimize, theme.yellow)
theme.titlebar_minimize_button_focus_press              = render(titlebar.minimize, theme.dark_yellow)
theme.titlebar_maximized_button_focus_active            = render(titlebar.maximize, theme.active_color)
theme.titlebar_maximized_button_focus_active_hover      = render(titlebar.maximize, theme.green)
theme.titlebar_maximized_button_focus_active_press      = render(titlebar.maximize, theme.dark_green)
theme.titlebar_maximized_button_focus_inactive          = render(titlebar.maximize, theme.active_color)
theme.titlebar_maximized_button_focus_inactive_hover    = render(titlebar.maximize, theme.green)
theme.titlebar_maximized_button_focus_inactive_press    = render(titlebar.maximize, theme.dark_green)
theme.titlebar_maximized_button_normal_active           = render(titlebar.maximize, theme.inactive_color)
theme.titlebar_maximized_button_normal_active_hover     = render(titlebar.maximize, theme.dark_green)
theme.titlebar_maximized_button_normal_active_press     = render(titlebar.maximize, theme.inactive_accent)
theme.titlebar_maximized_button_normal_inactive         = render(titlebar.maximize, theme.inactive_color)
theme.titlebar_maximized_button_normal_inactive_hover   = render(titlebar.maximize, theme.dark_green)
theme.titlebar_maximized_button_normal_inactive_press   = render(titlebar.maximize, theme.inactive_accent)
theme.titlebar_close_button_normal                      = render(titlebar.close, theme.inactive_color)
theme.titlebar_close_button_normal_hover                = render(titlebar.close_alt, theme.dark_red)
theme.titlebar_close_button_focus                       = render(titlebar.close, theme.error_color)
theme.titlebar_close_button_focus_hover                 = render(titlebar.close_alt, theme.red)
theme.titlebar_close_button_focus_press                 = render(titlebar.close_alt, theme.error_accent)

-- Layout icons
local layouts = svg_icons.layouts
theme.layout_cornerne   = render(layouts.cornerne, theme.ui_alt_color, nil, 24)
theme.layout_cornernw   = render(layouts.cornernw, theme.ui_alt_color, nil, 24)
theme.layout_cornerse   = render(layouts.cornerse, theme.ui_alt_color, nil, 24)
theme.layout_cornersw   = render(layouts.cornersw, theme.ui_alt_color, nil, 24)
theme.layout_dwindle    = render(layouts.dwindle, theme.ui_alt_color, nil, 24)
theme.layout_fairh      = render(layouts.fairh, theme.ui_alt_color, nil, 24)
theme.layout_fairv      = render(layouts.fairv, theme.ui_alt_color, nil, 24)
theme.layout_floating   = render(layouts.floating, theme.ui_alt_color, nil, 24)
theme.layout_fullscreen = render(layouts.fullscreen, theme.ui_alt_color, nil, 24)
theme.layout_magnifier  = render(layouts.magnifier, theme.ui_alt_color, nil, 24)
theme.layout_max        = render(layouts.max, theme.ui_alt_color, nil, 24)
theme.layout_spiral     = render(layouts.spiral, theme.ui_alt_color, nil, 24)
theme.layout_tile       = render(layouts.tile, theme.ui_alt_color, nil, 24)
theme.layout_tilebottom = render(layouts.tilebottom, theme.ui_alt_color, nil, 24)
theme.layout_tileleft   = render(layouts.tileleft, theme.ui_alt_color, nil, 24)
theme.layout_tiletop    = render(layouts.tiletop, theme.ui_alt_color, nil, 24)

-- Menu icons
local menus = svg_icons.menus
theme.menu_submenu_icon = render(menus.submenu, theme.text_color, nil, 24)

-- Custom menu icons
theme.terminal_icon     = res .. "menus/terminal-emulator.svg"
theme.filemanager_icon  = res .. "menus/file-manager.svg"
theme.hotkeys_icon      = res .. "menus/show-hotkeys.svg"
theme.manual_icon       = res .. "menus/read-manual.svg"
theme.editor_icon       = res .. "menus/edit-config.svg"
theme.restart_icon      = res .. "menus/session-restart.svg"

-- Session menu icons
theme.lockscreen_icon   = res .. "menus/session-lock.svg"
theme.exit_icon         = res .. "menus/session-exit.svg"
theme.reboot_icon       = res .. "menus/system-reboot.svg"
theme.suspend_icon      = res .. "menus/system-suspend.svg"
theme.poweroff_icon     = res .. "menus/system-shutdown.svg"

-- Wallpaper
wallpaper.path          = "/usr/share/backgrounds/archlinux/"

return theme

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
