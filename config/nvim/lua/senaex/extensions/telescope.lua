------------ telescop ------------
local builtin = require('telescope.builtin')
local fb_actions = require "telescope._extensions.file_browser.actions"
local actions = require "telescope.actions"
require("telescope").setup {
	defaults = {
    -- file_ignore_patterns = { ".conda", ".git", "build", "__pycache__", "go.mod", "go.sum" },
    file_ignore_patterns = { ".conda", ".git", "build", "__pycache__"},
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
        end
      },
		}
	},
	extensions = {
    file_browser = {
      depth = 1,
      hidden = true,
      prompt_path = true,
      dir_icon = "",
      hijack_netrw = true,
      cwd_to_path = true,
    },
  }
}
require("telescope").load_extension "file_browser"

---------- Keybindings -----------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fa', "<cmd>Telescop find_files search_dirs=/home/ALEX<CR>", {})
vim.keymap.set('n', '<leader>fh', "<cmd>Telescop find_files search_dirs=~<CR>", {})
vim.keymap.set('n', '<leader>fr', "<cmd>Telescop find_files search_dirs=/<CR>", {})
vim.keymap.set('n', '<c-f>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ft', builtin.live_grep, {})
