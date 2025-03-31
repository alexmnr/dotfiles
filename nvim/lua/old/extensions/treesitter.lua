---------- Treesitter -----------
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "rust", "python", "c", "lua", "vim", "vimdoc", "query" },

  sync_install = true,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
