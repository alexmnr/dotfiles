return {
	{
		"nvim-treesitter/nvim-treesitter",
    lazy = false,
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			-- "nvim-treesitter/nvim-treesitter-textobjects",
			-- "JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
		},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = {
					enable = true,
				},
				-- ensure these language parsers are installed
				ensure_installed = {
          "arduino",
          "c",
          "c_sharp",
          "cmake",
          "make",
          "cpp",
          "python",
          "go",
          "css",
          "html",
					"json",
					"yaml",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
				},
				-- incremental_selection = {
				-- 	enable = true,
				-- 	keymaps = {
				-- 		init_selection = "<C-space>",
				-- 		node_incremental = "<C-space>",
				-- 		scope_incremental = false,
				-- 		node_decremental = "<bs>",
				-- 	},
				-- },
			})

			-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
			-- require("ts_context_commentstring").setup({})
		end,
	},
}
