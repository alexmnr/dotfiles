vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim' -- nvim package manager
  use 'nvim-lua/plenary.nvim' -- useful lua functions used by lots of plugins
  use 'nvim-telescope/telescope.nvim' -- fuzzy finder
  use "nvim-telescope/telescope-file-browser.nvim" -- file browser
  use 'nyoom-engineering/oxocarbon.nvim' -- color theme
  use {'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}} -- syntax-highlighter
  use 'lambdalisue/suda.vim' -- write with sudo rights
  use 'joom/vim-commentary' -- auto comments with gc
  use 'windwp/nvim-autopairs' -- create auto brackets
  use 'tamton-aquib/staline.nvim' -- status bar
  use 'mbbill/undotree' -- well its in the name...
  use {'phaazon/hop.nvim', branch = 'v2'} -- quickly hop to places
  use {"akinsho/toggleterm.nvim", tag = '*'} -- integrated terminal
  use 'nvim-tree/nvim-web-devicons' -- some icons
  use 'ryanoasis/vim-devicons' -- more icons
  ---- Completion
  use "hrsh7th/nvim-cmp" -- The completion pluginpac
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
	use	"hrsh7th/cmp-nvim-lsp"
	use	"hrsh7th/cmp-nvim-lua"
  use "L3MON4D3/LuaSnip"
  ---- Snippets
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  ---- LSP
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }

end)

