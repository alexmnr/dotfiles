-- No need to copy this inside `setup()`. Will be used automatically.
local config = {
  draw = {
    delay = 50,
    priority = 2,
  },
  options = {
    border = 'both',
    indent_at_cursor = true,

    try_as_border = false,
  },

  -- Which character to use for drawing scope indicator
  symbol = '╎',
}

require('mini.indentscope').setup(config)
