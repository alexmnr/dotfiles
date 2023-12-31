require("senaex.remap")
-- require("senaex.packer")
require("senaex.plugins")
require("senaex.color")
require("senaex.extensions")
------------ Options ------------
vim.api.nvim_set_option("clipboard","unnamedplus")
vim.opt.termguicolors = true

-- Neovide
vim.g.neovide_scale_factor = 0.85
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-=>", function()
  change_scale_factor(1.25)
end)
vim.keymap.set("n", "<C-->", function()
  change_scale_factor(1/1.25)
end)

vim.cmd([[
  syntax on
  set number relativenumber
  set shiftwidth=2
  set tabstop=2 softtabstop=2
  set expandtab
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  set nowrap

  set hlsearch
  set incsearch
  set ignorecase
  set smartcase
  set showmatch

  set undofile
]])
