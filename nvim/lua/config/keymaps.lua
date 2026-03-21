-------------- Basic -------------
vim.g.mapleader = " "
------------ Movement ------------
vim.keymap.set({ "n", "v" }, "H", "^^")
vim.keymap.set({ "n", "v" }, "L", "$")
vim.keymap.set({ "n", "v" }, "K", "5k")
vim.keymap.set({ "n", "v" }, "J", "5j")
------------- Window -------------
-- vim.keymap.set("n", "<C-l>", "<C-w>l", {})
-- vim.keymap.set("n", "<leader>v", "<C-w>v", {})
-- vim.keymap.set("n", "<leader>s", "<C-w>s", {})
-- vim.keymap.set("n", "<leader>t", "<C-w>", {})
vim.keymap.set({ "n", "t" }, "<A-h>", "<C-w>h")
vim.keymap.set({ "n", "t" }, "<A-j>", "<C-w>j")
vim.keymap.set({ "n", "t" }, "<A-k>", "<C-w>k")
vim.keymap.set({ "n", "t" }, "<A-l>", "<C-w>l")
------------- Search -------------
vim.keymap.set("n", "<leader>n", vim.cmd.noh) -- stop current search
------------ Undo ------------
vim.keymap.set("n", "u", vim.cmd.undo) -- undo
vim.keymap.set("n", "U", vim.cmd.redo) -- redo
--------- start/end ----------
vim.keymap.set("n", "dL", "d$", {}) -- delete till end
vim.keymap.set("n", "dH", "d^", {}) -- delete till beginning
vim.keymap.set("n", "vL", "v$", {}) -- select till end
vim.keymap.set("n", "vH", "v^", {}) -- select till beginning
vim.keymap.set("n", "cL", "c$", {}) -- change till end
vim.keymap.set("n", "cH", "c^", {}) -- change till beginning
vim.keymap.set("n", "yL", "y$", {}) -- yank till end
vim.keymap.set("n", "yH", "y^", {}) -- yank till beginning
------------ Terminal -------------
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", {})
------------- dont yank when changing --------------
vim.cmd([[
  nnoremap c "_c
  vnoremap c "_c
  nnoremap C "_C
  vnoremap C "_C
]])
