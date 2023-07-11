local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  --- General
  'nvim-lua/plenary.nvim', -- useful lua functions used by lots of plugins
  --- Navigation
  'nvim-telescope/telescope.nvim', -- fuzzy finder
  'nvim-telescope/telescope-file-browser.nvim', -- file browser
  'nvim-tree/nvim-tree.lua', -- file browser
  {'phaazon/hop.nvim', branch = 'v2'}, -- quickly hop to place
  --- Design
  'nyoom-engineering/oxocarbon.nvim',
  'folke/tokyonight.nvim',
  'EdenEast/nightfox.nvim',
  'hachy/eva01.vim',
  'daschw/leaf.nvim',
  'tamton-aquib/staline.nvim', -- status bar
  'nvim-tree/nvim-web-devicons', -- some icons
  'echasnovski/mini.indentscope', -- indent lines
  --- Highlighting
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  'norcalli/nvim-colorizer.lua',
  --- Tools
  'lambdalisue/suda.vim', -- write with sudo rights
  'joom/vim-commentary', -- auto comments with gc
  'windwp/nvim-autopairs', -- create auto brackets
  'mbbill/undotree', -- well its in the name...
  'Pocco81/auto-save.nvim', -- auto save
  'smolck/command-completion.nvim', -- better autocompletion in command mode
  ---- COC
  {'neoclide/coc.nvim', branch = 'release'},
  {'neoclide/coc.nvim', branch = 'release'},
  ---- Testing
  'rcarriga/nvim-notify',
  --- Tabs
  'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
  'romgrk/barbar.nvim',
  --- Terminal
  'akinsho/toggleterm.nvim',
  --- Markdown
  {'iamcco/markdown-preview.nvim', build = function() vim.fn["mkdp#util#install"]() end},
}
local opts = {}

require('lazy').setup(plugins, opts)
