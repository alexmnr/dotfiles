require('auto-save').setup {
    enabled = false
}

vim.api.nvim_set_keymap("n", "<leader>a", ":ASToggle<CR>", {})
