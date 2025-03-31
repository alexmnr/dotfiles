local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local beautiful = require'beautiful'
local color = require("theme.color")

local theme = {}

theme.font = "Fira Code"

theme.useless_gap = dpi(5)
theme.border_width = dpi(2)
theme.border_color_normal = color.base
theme.border_color_active = color.sapphire
-- theme.border_color_marked = catppuccin.red
theme.bg_normal = color.surface0

theme.gap_single_client = true

theme.window_switcher_widget_bg = color.base              -- The bg color of the widget
theme.window_switcher_widget_border_width = 0            -- The border width of the widget
theme.window_switcher_widget_border_radius = 10           -- The border radius of the widget
theme.window_switcher_widget_border_color = color.base
theme.window_switcher_clients_spacing = 20               -- The space between each client item
theme.window_switcher_client_icon_horizontal_spacing = 5 -- The space between client icon and text
theme.window_switcher_client_width = 250                 -- The width of one client widget
theme.window_switcher_client_height = 350                -- The height of one client widget
theme.window_switcher_client_margins = 10                -- The margin between the content and the border of the widget
theme.window_switcher_thumbnail_margins = 10             -- The margin between one client thumbnail and the rest of the widget
theme.thumbnail_scale = true                            -- If set to true, the thumbnails fit policy will be set to "fit" instead of "auto"
theme.window_switcher_name_margins = 10                  -- The margin of one clients title to the rest of the widget
theme.window_switcher_name_valign = "center"             -- How to vertically align one clients title
theme.window_switcher_name_forced_width = 200            -- The width of one title
theme.window_switcher_name_font = "sans 11"              -- The font of all titles
theme.window_switcher_name_normal_color = color.text
theme.window_switcher_name_focus_color = color.red
theme.window_switcher_icon_valign = "center"             -- How to vertically align the one icon
theme.window_switcher_icon_width = 40                    -- The width of one icon

beautiful.init(theme)
