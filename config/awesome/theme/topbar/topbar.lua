-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local color = require("theme.color")

local mytextclock = wibox.widget.textclock(
	'<span color="' .. color.white .. '" font="Ubuntu Nerd Font Bold 13"> %a %b %d, %H:%M </span>', 10)

local separator = wibox.widget.textbox("     ")
local batteryarc_widget = require("theme.topbar.batteryarc")
local fancy_taglist = require("theme.topbar.fancy_taglist")
local taglist_buttons = require("theme.topbar.taglist")
local tasklist_buttons = require("theme.topbar.tasklist")
local systray = require("theme.topbar.systray")

--Fancy taglist widget
awful.screen.connect_for_each_screen(function(s)
	mytaglist = fancy_taglist.new({
		screen   = s,
		taglist  = { buttons = taglist_buttons },
		tasklist = { buttons = tasklist_buttons },
		filter   = awful.widget.taglist.filter.all,
		style    = {
			shape = gears.shape.rounded_rect
		},
	})
end)
--Taglist widget
local fancy_taglist = wibox.widget {
	{
		mytaglist,
		widget = wibox.container.background,
		shape  = gears.shape.rounded_rect,
		bg     = color.background_lighter
	},
	left   = dpi(3),
	right  = dpi(3),
	top    = dpi(3),
	bottom = dpi(3),
	widget = wibox.container.margin

}

local mywibox =
	awful.wibar({
		position = "top",
		margins = { top = dpi(3), left = dpi(3), right = dpi(3), bottom = 0 },
		screen = s,
		height = dpi(35),
		opacity = 0.9,
		fg = color.text,
		bg = color.base,
	})

mywibox:setup {
  layout = wibox.layout.stack,
  expand = "none",
  {
    layout = wibox.layout.align.horizontal,
    {
      -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      fancy_taglist,
      separator,
    },
    nil,
    {
      -- Right widgets
      layout = wibox.layout.fixed.horizontal,
			systray,
      separator,
      batteryarc_widget({
        show_current_level = true,
        arc_thickness = 3,
        size = 30,
        font = "CaskaydiaCove Nerd Font 10",
        margins = 55,
        timeout = 5,
        charging_color = "#42f67b"
      }),
      wibox.widget.textbox("  "),

      -- separator,
    },
  },
  { -- Middle widgets
    mytextclock,
    valign = "center",
    halign = "center",
    layout = wibox.container.place,
  },
}
return mywibox
