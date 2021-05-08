---------------------------------------------
--  Antsy theme based on Xresources        --
--   by Jeff M. Hubbard                    --
---------------------------------------------

local theme_assets              = require("beautiful.theme_assets")
local xresources                = require("beautiful.xresources")
local dpi                       = xresources.apply_dpi
local xrdb                      = xresources.get_current_theme()
local gears                     = require("gears")
local assets_path               = gears.filesystem.get_configuration_dir() .. "theme/assets/"
local recolor_image             = gears.color.recolor_image
local vars                      = require("config.vars")

local theme = {}

-- Xresources colors
theme.black                     = xrdb.color0       -- #000000
theme.dark_red                  = xrdb.color1       -- #c23621
theme.dark_green                = xrdb.color2       -- #25bc24
theme.dark_yellow               = xrdb.color3       -- #adad27
theme.dark_blue                 = xrdb.color4       -- #492ee1
theme.dark_magenta              = xrdb.color5       -- #d338d3
theme.dark_cyan                 = xrdb.color6       -- #33bbc8
theme.gray                      = xrdb.color7       -- #cbcccd
theme.dark_gray                 = xrdb.color8       -- #818383
theme.red                       = xrdb.color9       -- #fc391f
theme.green                     = xrdb.color10      -- #31e722
theme.yellow                    = xrdb.color11      -- #eaec23
theme.blue                      = xrdb.color12      -- #5833ff
theme.magenta                   = xrdb.color13      -- #f935f8
theme.cyan                      = xrdb.color14      -- #14f0f0
theme.white                     = xrdb.color15      -- #e9ebeb
theme.background                = xrdb.background   -- #000000
theme.foreground                = xrdb.foreground   -- #cbcccd

-- Fonts
theme.font                      = "Hack Nerd Font 10"
theme.font_bold                 = "Hack Nerd Font Bold 10"
theme.font_large                = "Hack Nerd Font 12"
theme.font_small                = "Hack Nerd Font 9"
theme.font_extra_small          = "Hack Nerd Font 8"

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
theme.border_color                      = theme.ui_color     .. theme.alpha
theme.border_color_normal               = theme.ui_color     .. theme.alpha
theme.border_color_active               = theme.focus_color  .. theme.alpha
theme.border_color_urgent               = theme.urgent_color .. theme.alpha
theme.border_color_new                  = theme.ui_color     .. theme.alpha
theme.border_color_marked               = theme.marked_color .. theme.alpha
theme.border_color_floating             = theme.ui_color     .. theme.alpha
theme.border_color_floating_active      = theme.focus_color  .. theme.alpha
theme.border_color_floating_urgent      = theme.urgent_color .. theme.alpha
theme.border_color_maximized            = theme.ui_color     .. theme.alpha
theme.border_color_maximized_active     = theme.ui_color     .. theme.alpha
theme.border_color_maximized_urgent     = theme.urgent_color .. theme.alpha
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
theme.titlebar_bg_transparent   = theme.ui_color .. theme.alpha
theme.titlebar_height           = dpi(20)       -- custom

-- Systray widget
theme.bg_systray                = theme.ui_color
theme.systray_icon_spacing      = dpi(2)

-- Menus
theme.menu_width                    = dpi(160)
theme.menu_height                   = dpi(20)
theme.menu_border_color             = theme.border_color_active
theme.menu_border_width             = theme.border_width
theme.menu_submenu_icon             = assets_path .. "menu/submenu.svg"

-- Tooltips
theme.tooltip_fg                    = theme.text_color
theme.tooltip_bg                    = theme.ui_color .. theme.alpha
theme.tooltip_border_color          = theme.border_color_normal
theme.tooltip_border_width          = theme.border_width
theme.tooltip_opacity               = theme.opacity

-- Notifications
theme.notification_font         = theme.font
theme.notification_fg           = theme.text_color
theme.notification_bg           = theme.ui_color
theme.notification_border_width = theme.border_width
theme.notification_border_color = theme.active_color
theme.notification_opacity      = theme.opacity
theme.notification_margin       = theme.margins
theme.notification_width        = dpi(256)
--theme.notification_height       = dpi(60)
theme.notification_spacing      = theme.spacing

-- Window snap
theme.snap_bg                   = theme.new_color
theme.snap_border_width         = theme.border_width

-- Hotkeys popup
theme.hotkeys_bg                = theme.ui_color .. theme.alpha
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

-- Icon theme
theme.icon_theme = "Antsy"

-- Titlebar icons
theme.titlebar_minimize_button_normal                   = assets_path .. "titlebar/minimize_normal.svg"
theme.titlebar_minimize_button_normal_hover             = assets_path .. "titlebar/minimize_normal_hover.svg"
theme.titlebar_minimize_button_focus                    = assets_path .. "titlebar/minimize_focus.svg"
theme.titlebar_minimize_button_focus_hover              = assets_path .. "titlebar/minimize_focus_hover.svg"
theme.titlebar_minimize_button_focus_press              = assets_path .. "titlebar/minimize_focus_press.svg"
theme.titlebar_close_button_normal                      = assets_path .. "titlebar/close_normal.svg"
theme.titlebar_close_button_normal_hover                = assets_path .. "titlebar/close_normal_hover.svg"
theme.titlebar_close_button_focus                       = assets_path .. "titlebar/close_focus.svg"
theme.titlebar_close_button_focus_hover                 = assets_path .. "titlebar/close_focus_hover.svg"
theme.titlebar_close_button_focus_press                 = assets_path .. "titlebar/close_focus_press.svg"
theme.titlebar_maximized_button_focus_active            = assets_path .. "titlebar/maximized_focus_active.svg"
theme.titlebar_maximized_button_focus_active_hover      = assets_path .. "titlebar/maximized_focus_active_hover.svg"
theme.titlebar_maximized_button_focus_active_press      = assets_path .. "titlebar/maximized_focus_active_press.svg"
theme.titlebar_maximized_button_focus_inactive          = assets_path .. "titlebar/maximized_focus_inactive.svg"
theme.titlebar_maximized_button_focus_inactive_hover    = assets_path .. "titlebar/maximized_focus_inactive_hover.svg"
theme.titlebar_maximized_button_focus_inactive_press    = assets_path .. "titlebar/maximized_focus_inactive_press.svg"
theme.titlebar_maximized_button_normal_active           = assets_path .. "titlebar/maximized_normal_active.svg"
theme.titlebar_maximized_button_normal_active_hover     = assets_path .. "titlebar/maximized_normal_active_hover.svg"
theme.titlebar_maximized_button_normal_active_press     = assets_path .. "titlebar/maximized_normal_active_press.svg"
theme.titlebar_maximized_button_normal_inactive         = assets_path .. "titlebar/maximized_normal_inactive.svg"
theme.titlebar_maximized_button_normal_inactive_hover   = assets_path .. "titlebar/maximized_normal_inactive_hover.svg"
theme.titlebar_maximized_button_normal_inactive_press   = assets_path .. "titlebar/maximized_normal_inactive_press.svg"

if vars.recolor_titlebar_icons then
    theme = theme_assets.recolor_titlebar(theme, theme.inactive_color, "normal")
    theme = theme_assets.recolor_titlebar(theme, theme.active_color, "normal", "hover")
    theme = theme_assets.recolor_titlebar(theme, theme.active_accent, "normal", "press")
    theme = theme_assets.recolor_titlebar(theme, theme.active_color, "focus")
    theme = theme_assets.recolor_titlebar(theme, theme.focus_color, "focus", "hover")
    theme = theme_assets.recolor_titlebar(theme, theme.focus_accent, "focus", "press")
end

-- Layout icons
theme.layout_fairh              = assets_path .. "layouts/fairhw.png"
theme.layout_fairv              = assets_path .. "layouts/fairvw.png"
theme.layout_floating           = assets_path .. "layouts/floatingw.png"
theme.layout_magnifier          = assets_path .. "layouts/magnifierw.png"
theme.layout_max                = assets_path .. "layouts/maxw.png"
theme.layout_fullscreen         = assets_path .. "layouts/fullscreenw.png"
theme.layout_tilebottom         = assets_path .. "layouts/tilebottomw.png"
theme.layout_tileleft           = assets_path .. "layouts/tileleftw.png"
theme.layout_tile               = assets_path .. "layouts/tilew.png"
theme.layout_tiletop            = assets_path .. "layouts/tiletopw.png"
theme.layout_spiral             = assets_path .. "layouts/spiralw.png"
theme.layout_dwindle            = assets_path .. "layouts/dwindlew.png"
theme.layout_cornernw           = assets_path .. "layouts/cornernww.png"
theme.layout_cornerne           = assets_path .. "layouts/cornernew.png"
theme.layout_cornersw           = assets_path .. "layouts/cornersww.png"
theme.layout_cornerse           = assets_path .. "layouts/cornersew.png"

if vars.recolor_layout_icons then
    theme = theme_assets.recolor_layout(theme, theme.ui_alt_color)
end

-- Custom menu icons
theme.terminal_icon             = assets_path .. "menu/terminal-emulator.svg"
theme.filemanager_icon          = assets_path .. "menu/file-manager.svg"
theme.hotkeys_icon              = assets_path .. "menu/show-hotkeys.svg"
theme.manual_icon               = assets_path .. "menu/read-manual.svg"
theme.editor_icon               = assets_path .. "menu/edit-config.svg"
theme.screenlock_icon           = assets_path .. "menu/session-lock.svg"
theme.restart_icon              = assets_path .. "menu/session-restart.svg"
theme.exit_icon                 = assets_path .. "menu/session-exit.svg"

if vars.recolor_menu_icons then
    theme = theme_assets.recolor_layout(theme, theme.ui_alt_color)
end

-- Panel widget icons
theme.launcher_icon             = assets_path .. "panel/menu-icon.svg"
theme.systray_visible           = assets_path .. "panel/systray-visible.svg"
theme.systray_hidden            = assets_path .. "panel/systray-hidden.svg"

if vars.recolor_panel_icons then
    theme.launcher_icon = recolor_image(theme.launcher_icon, theme.ui_alt_color)
    theme.systray_visible = recolor_image(theme.systray_visible, theme.ui_alt_color)
    theme.systray_hidden = recolor_image(theme.systray_hidden, theme.ui_alt_color)
end

-- Try to determine if we are running light or dark colorscheme:
--local bg_numberic_value = 0;
--for s in theme.bg_normal:gmatch("[a-fA-F0-9][a-fA-F0-9]") do
--    bg_numberic_value = bg_numberic_value + tonumber("0x"..s);
--end
--local is_dark_bg = (bg_numberic_value < 383)

-- Generate wallpaper:
--local wallpaper_bg = theme.dark_gray
--local wallpaper_fg = theme.gray
--local wallpaper_alt_fg = theme.black
--if not is_dark_bg then
--    wallpaper_bg, wallpaper_fg = wallpaper_fg, wallpaper_bg
--end
--theme.wallpaper = function(s)
--    return theme_assets.wallpaper(wallpaper_bg, wallpaper_fg, wallpaper_alt_fg, s)
--end

return theme

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
