vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim' -- nvim package manager
    use 'nvim-lua/plenary.nvim' -- useful lua functions used by lots of plugins
    use 'nvim-telescope/telescope.nvim' -- fuzzy finder
    use "nvim-telescope/telescope-file-browser.nvim" -- file browser
    use {'ms-jpq/chadtree', {run = 'python3 -m chadtree deps'}} -- alternative filebrowser
    use 'nyoom-engineering/oxocarbon.nvim' -- color theme
    use {'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}} -- syntax-highlighter
    use 'lambdalisue/suda.vim' -- write with sudo rights
    use 'joom/vim-commentary' -- auto comments with gc
    use 'windwp/nvim-autopairs' -- create auto brackets
    use 'tamton-aquib/staline.nvim' -- status bar
    -- use 'feline-nvim/feline.nvim'
    use 'mbbill/undotree' -- well its in the name...
    use {'phaazon/hop.nvim', branch = 'v2', config = function() require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' } end } -- quickly hop to places
    use {"akinsho/toggleterm.nvim", tag = '*'} -- integrated terminal
     use 'nvim-tree/nvim-web-devicons' -- some icons
end)
