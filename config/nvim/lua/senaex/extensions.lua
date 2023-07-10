require 'senaex.extensions.telescope'
require 'senaex.extensions.treesitter'
require 'senaex.extensions.hop'
require 'senaex.extensions.coc'
require 'senaex.extensions.auto-save'
require 'senaex.extensions.command-completion'
require 'senaex.extensions.barbar'
require 'senaex.extensions.staline'
require 'senaex.extensions.terminal'
require 'senaex.extensions.indentscope'
-- require 'senaex.extensions.nvim-tree'

--- Simple:
require("nvim-autopairs").setup()
require("colorizer").setup()

--- Notification
vim.notify = require("notify")
