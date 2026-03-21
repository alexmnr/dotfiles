return {
	{
		"EdenEast/nightfox.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			local palettes = {
				carbonfox = {
					bg0 = "#000000",
					bg1 = "#000000",
					fg3 = "#404040",
				},
			}
			require("nightfox").setup({ palettes = palettes })
			vim.cmd([[colorscheme carbonfox]])
			vim.api.nvim_set_hl(0, "VertSplit", { bg = "#000000", fg = "#252525" })
		end,
	},
}
