require('auto-save').setup {
    enabled = false, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
}

vim.api.nvim_set_keymap("n", "<leader>a", ":ASToggle<CR>", {})
