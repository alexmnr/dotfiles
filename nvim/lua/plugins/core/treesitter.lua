return {
	{
		"nvim-treesitter/nvim-treesitter",
    lazy = false,
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
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
          "vue",
          "javascript",
          "typescript",
				},
			})
		end,
	},
}
