return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-file-browser.nvim", -- file browser
	},
	config = function()
		local builtin = require("telescope.builtin")
		local fb_actions = require "telescope._extensions.file_browser.actions"
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { ".conda", ".git", "build", "__pycache__", "go.mod", "go.sum" },
				-- file_ignore_patterns = { ".conda", ".git", "build", "__pycache__"},
				mappings = {
					n = {
						["<k>"] = actions.move_selection_previous,
						["<j>"] = actions.move_selection_next,
						["<l>"] = actions.select_default,
						["cd"] = function(prompt_bufnr)
							local selection = require("telescope.actions.state").get_selected_entry()
							local dir = vim.fn.fnamemodify(selection.path, ":p:h")
							require("telescope.actions").close(prompt_bufnr)
							-- Depending on what you want put `cd`, `lcd`, `tcd`
							vim.cmd(string.format("silent lcd %s", dir))
						end,
					},
				},
			},
			extensions = {
				file_browser = {
					depth = 1,
					hidden = true,
					prompt_path = true,
					dir_icon = "",
					hijack_netrw = true,
					cwd_to_path = false,
          mappings = {
            ["i"] = {
              ["<C-d>"] = fb_actions.change_cwd,
            },
          }
				},
			},
		})
		require("telescope").load_extension("file_browser")

		---------- Keybindings -----------
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {desc = "Search files"})
		vim.keymap.set("n", "<leader>fd", "<cmd>Telescop lsp_document_symbols<CR>", {desc = "Search document symbols"})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {desc = "Live grep"})
		vim.keymap.set("n", "<leader>e", ":Telescope file_browser<CR>", {desc = "File Browser"})
	end,
}
