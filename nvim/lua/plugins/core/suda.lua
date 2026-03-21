return {
	"lambdalisue/suda.vim", -- write with sudo rights
	config = function()
    vim.api.nvim_create_user_command("W", "SudaWrite", {})
  end,
}
