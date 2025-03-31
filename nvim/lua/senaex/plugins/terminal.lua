return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			float_opts = {
				border = "curved",
				winblend = 3,
			},
			direction = "float",
		})
		local Terminal = require("toggleterm.terminal").Terminal
		local toggleterm = require("toggleterm")

		local float = Terminal:new({
			direction = "float",
			-- function to run on opening the terminal
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			end,
		})
		local horizontal = Terminal:new({
			direction = "horizontal",
			-- function to run on opening the terminal
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			end,
		})

		vim.keymap.set("n", "<leader>tt", function()
			float:toggle()
		end, { remap = true })
		vim.keymap.set("n", "<leader>th", function()
			horizontal:toggle()
		end, { remap = true })
		vim.keymap.set({ "t", "n" }, "<C-s>", function()
			toggleterm.toggle()
		end, { remap = true })
	end,
}
