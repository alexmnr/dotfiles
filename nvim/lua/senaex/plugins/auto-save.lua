return {
	"okuuva/auto-save.nvim",
	event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
	opts = {
		enabled = false,
	},
	config = function()
		require("auto-save").setup({
			enabled = false,
		})

		vim.api.nvim_set_keymap("n", "<leader>a", ":ASToggle<CR>", {})
		require("auto-save").off()
	end,
}
