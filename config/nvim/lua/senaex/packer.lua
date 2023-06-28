vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  --- General
  use 'wbthomason/packer.nvim' -- nvim package manager
  use 'nvim-lua/plenary.nvim' -- useful lua functions used by lots of plugins
  --- Navigation
  use 'nvim-telescope/telescope.nvim' -- fuzzy finder
  use "nvim-telescope/telescope-file-browser.nvim" -- file browser
  use {'phaazon/hop.nvim', branch = 'v2'} -- quickly hop to place
  --- Design
  use 'nyoom-engineering/oxocarbon.nvim'
  use 'folke/tokyonight.nvim'
  use "EdenEast/nightfox.nvim"
  use "hachy/eva01.vim"
  use "daschw/leaf.nvim"
  use 'tamton-aquib/staline.nvim' -- status bar
  use 'nvim-tree/nvim-web-devicons' -- some icons
  --- Highlighting
  use {'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}} -- syntax-highlighter
  use 'norcalli/nvim-colorizer.lua'
  --- Tools
  use 'lambdalisue/suda.vim' -- write with sudo rights
  use 'joom/vim-commentary' -- auto comments with gc
  use 'windwp/nvim-autopairs' -- create auto brackets
  use 'mbbill/undotree' -- well its in the name...
  use 'Pocco81/auto-save.nvim' -- auto save
  use 'smolck/command-completion.nvim' -- better autocompletion in command mode
  ---- COC
  use {'neoclide/coc.nvim', branch = 'release'}
  ---- Testing
  use 'rcarriga/nvim-notify'
  --- Tabs
  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  use 'romgrk/barbar.nvim'
  --- Outline
end)

