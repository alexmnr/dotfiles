require("config")

local plugins = {}
if vim.g.vscode then
else
  vim.list_extend(plugins, load_plugins("theme", "all"))
  vim.list_extend(plugins, load_plugins("core", "all"))
  vim.list_extend(plugins, load_plugins("extra", "all"))
  vim.list_extend(plugins, load_plugins("completion", "all"))
  -- vim.list_extend(plugins, load_plugins("extra", {"hop"}))
end

require("lazy").setup(plugins, {
	install = {
		colorscheme = { "carbonfox" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

