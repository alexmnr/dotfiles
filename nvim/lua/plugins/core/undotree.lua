return {
	"mbbill/undotree", -- well its in the name...
	config = function()
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
  end,
}
