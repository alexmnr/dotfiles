local awful = require("awful")

awful.spawn.with_shell("picom --config ~/.config/picom/picom.conf")
awful.spawn.with_shell("lxsession")

