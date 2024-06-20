-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local color = require("theme.color")

local mytextclock = wibox.widget.textclock(
	'<span color="' .. color.white .. '" font="Ubuntu Nerd Font Bold 13"> %a %b %d, %H:%M </span>', 10)

local mywibox =
	awful.wibar({
		position = "top",
		-- margins = { top = dpi(7), left = dpi(8), right = dpi(8), bottom = 0 },
		margins = { top = dpi(3), left = dpi(3), right = dpi(3), bottom = 0 },
		screen = s,
		height = dpi(35),
		opacity = 0.9,
		fg = color.text,
		bg = color.base,
		-- shape = function(cr, width, height)
		--   -- gears.shape.rounded_rect(cr, width, height, 8)
		--   gears.shape.rounded_rect(cr, width, height, 0)
		-- end,

	})

mywibox:setup {
  layout = wibox.layout.align.horizontal,
  expand = "none",
  { -- Middle widgets
    layout = wibox.layout.flex.horizontal,
    max_widget_size = 1500,
    mytextclock
  },
}
