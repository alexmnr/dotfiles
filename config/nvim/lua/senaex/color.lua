vim.opt.background = "dark" -- set this to dark or light
vim.cmd("colorscheme oxocarbon")
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none'})
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none'})
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none'})
vim.api.nvim_set_hl(0, 'NormalNC', { bg = '#000000'})
vim.api.nvim_set_hl(0, 'NormalSB', { bg = '#000000'})
vim.api.nvim_set_hl(0, 'LineNr', { bg = '#111111'})
vim.api.nvim_set_hl(0, 'Comment', { bg = '#000000', fg = '#8c8c8c'})

---------- Telescope ----------
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = '#000000'})
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = '#000000'})
vim.api.nvim_set_hl(0, 'TelescopePreview', { bg = '#000000'})
vim.api.nvim_set_hl(0, 'TelescopePreviewLine', { bg = '#000000'})
vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = '#000000'})
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#000000'})
---------- NvimTree ----------
vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = '#000000'})
vim.api.nvim_set_hl(0, 'NvimTreeBorder', { bg = '#000000'})
vim.api.nvim_set_hl(0, 'NvimTreeCursorColumn', { bg = '#000000'})

---------- Statusline ----------
require('staline').setup {
    mode_colors = {
        n = "#2F87F7",
        i = "#37EA4E",
        c = "#FAE220",
        v = "#FA20B9",
        V = "#FA20B9",
    },
    mode_icons = {
        n = "󰋜 ",
        i = "󰏫 ",
        c = " ",
        v = "󰈈 ",
        V = "󰈈 ",
    }
}
