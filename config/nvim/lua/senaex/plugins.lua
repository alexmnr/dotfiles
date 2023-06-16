require 'senaex.extensions.telescope'
require 'senaex.extensions.treesitter'
require 'senaex.extensions.hop'
require 'senaex.extensions.coc'
require 'senaex.extensions.auto-save'
require 'senaex.extensions.command-completion'
require 'senaex.extensions.barbar'

--- Simple:
require("nvim-autopairs").setup()

--- Notification
vim.notify = require("notify")
