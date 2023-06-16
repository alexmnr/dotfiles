require("senaex.remap")
require("senaex.packer")
require("senaex.color")
require("senaex.plugins")
------------ Options ------------
vim.api.nvim_set_option("clipboard","unnamedplus")
vim.opt.termguicolors = true

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
