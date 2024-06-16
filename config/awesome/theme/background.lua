local bling = require("bling")

-- A random wallpaper with images from multiple folders
bling.module.wallpaper.setup {
    set_function = bling.module.wallpaper.setters.random,
    wallpaper = {"/opt/dotfiles/backgrounds"},
    change_timer = 631, -- prime numbers are better for timers
    position = "maximized",
}
