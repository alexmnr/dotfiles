vim.opt.background = "dark" -- set this to dark or light
vim.cmd("colorscheme oxocarbon")
-- vim.cmd("colorscheme tokyonight-night")
-- vim.cmd("colorscheme leaf")
background = '#000000'
vim.api.nvim_set_hl(0, 'Normal', { bg = background})
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = background})
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = background})
vim.api.nvim_set_hl(0, 'NormalNC', { bg = background})
vim.api.nvim_set_hl(0, 'NormalSB', { bg = background})
vim.api.nvim_set_hl(0, 'LineNr', { bg = '#111111'})
vim.api.nvim_set_hl(0, 'Comment', { bg = background, fg = '#8c8c8c'})

-- ---------- Telescope ----------
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = background})
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = background})
vim.api.nvim_set_hl(0, 'TelescopePreview', { bg = background})
vim.api.nvim_set_hl(0, 'TelescopePreviewLine', { bg = background})
vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = background})
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = background})
---------- NvimTree ----------
vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = background})
vim.api.nvim_set_hl(0, 'NvimTreeBorder', { bg = background})
vim.api.nvim_set_hl(0, 'NvimTreeCursorColumn', { bg = background})


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
