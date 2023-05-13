-------------- Basic -------------
vim.g.mapleader = " "
vim.api.nvim_create_user_command("W", "SudaWrite", {})
------------ Movement ------------
vim.keymap.set({'n', 'v'}, "H", "^^")
vim.keymap.set({'n', 'v'}, "L", "$")
vim.keymap.set({'n', 'v'}, "K", "5k")
vim.keymap.set({'n', 'v'}, "J", "5j")
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==")
------------- Window -------------
vim.keymap.set('n', '<C-l>', "<C-w>l", {})
vim.keymap.set('n', '<leader>v', "<C-w>v", {})
vim.keymap.set('n', '<leader>s', "<C-w>s", {})
vim.keymap.set('n', '<leader>t', "<C-w>", {})
vim.keymap.set('n', '<leader>h', "<C-w>h", {})
vim.keymap.set('n', '<leader>j', "<C-w>j", {})
vim.keymap.set('n', '<leader>k', "<C-w>k", {})
vim.keymap.set('n', '<leader>l', "<C-w>l", {})
------------- Search -------------
vim.keymap.set("n", "<leader>n", vim.cmd.noh)
------------ Undo ------------
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
vim.keymap.set('n', 'U', vim.cmd.redo)
--------- start/end ----------
vim.keymap.set('n', 'dL', "d$", {})
vim.keymap.set('n', 'dH', "d^", {})
vim.keymap.set('n', 'vL', "v$", {})
vim.keymap.set('n', 'vH', "v^", {})
vim.keymap.set('n', 'cL', "c$", {})
vim.keymap.set('n', 'cH', "c^", {})
vim.keymap.set('n', 'yL', "y$", {})
vim.keymap.set('n', 'yH', "y^", {})
-------------- hop --------------
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('n', '<leader>w', ':HopWord<CR>', {})
-- vim.keymap.set('n', '<leader>hl', ':HopLine<CR>', {})
-- vim.keymap.set('n', '<leader>ha', ':HopAnywhere<CR>', {})
-- vim.keymap.set('n', '<leader>hw', ':HopPattern<CR>', {})
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
----------- Filebrowser -----------
vim.keymap.set('n', '<leader>e', ':Telescope file_browser<CR>', {})
------------ Terminal -------------
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', {})