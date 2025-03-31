-- awesome_mode: api-level=4:screen=on

-- load luarocks if installed
pcall(require, 'luarocks.loader')
local gears = require'gears'

-- load theme
local beautiful = require'beautiful'
beautiful.init(gears.filesystem.get_themes_dir() .. 'default/theme.lua')

-- load theme
require'theme'

-- load key and mouse bindings
require'bindings'

-- load modules
require'modules'

