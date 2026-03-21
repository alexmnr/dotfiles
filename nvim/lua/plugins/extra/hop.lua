return {
	"phaazon/hop.nvim",
	branch = "v2",
	config = function()
		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

		-------------- hop --------------
		local hop = require("hop")
		local directions = require("hop.hint").HintDirection
		vim.keymap.set("n", "<leader>qq", ":HopWord<CR>", {desc = "Hop to word"})
		vim.keymap.set("n", "<leader>ql", ":HopLine<CR>", {desc = "Hop to line"})
		vim.keymap.set("n", "<leader>qp", ":HopPattern<CR>", {desc = "Hop to pattern"})
		vim.keymap.set("", "f", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		end, { remap = true, desc = "Hop to letter"})
	end,
}
