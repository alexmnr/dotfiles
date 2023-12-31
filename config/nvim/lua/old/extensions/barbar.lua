local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- Move to previous/next
map('n', '<leader>b', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>w', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<leader><', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<leader>>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<leader>0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffec
map('n', '<leader>p', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<leader>d', '<Cmd>BufferClose<CR>', opts)
-- Magic buffer-picking mode
map('n', '<leader>s', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
-- map('n', '<leader>tb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
-- map('n', '<leader>td', '<Cmd>BufferOrderByDirectory<CR>', opts)
-- map('n', '<leader>tl', '<Cmd>BufferOrderByLanguage<CR>', opts)
-- map('n', '<leader>tw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
--
vim.g.barbar_auto_setup = false -- disable auto-setup

require'barbar'.setup {
  icons = {
  --   -- Configure the base icons on the bufferline.
  --   -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
    buffer_index = false,
    -- gitsigns = {
    --   added = {enabled = true, icon = '+'},
    --   changed = {enabled = true, icon = '~'},
    --   deleted = {enabled = true, icon = '-'},
    -- },
    pinned = {button = '', filename = true},

    -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
    preset = 'default',
  },
}
