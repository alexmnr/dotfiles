return {
	"phaazon/hop.nvim",
	branch = "v2",
	config = function()
		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

		-------------- hop --------------
		local hop = require("hop")
		local directions = require("hop.hint").HintDirection
		vim.keymap.set("n", "<leader>qq", ":HopWord<CR>", {})
		vim.keymap.set("n", "<leader>ql", ":HopLine<CR>", {})
		vim.keymap.set("n", "<leader>qp", ":HopPattern<CR>", {})
		vim.keymap.set("", "f", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		end, { remap = true })
	end,
}
