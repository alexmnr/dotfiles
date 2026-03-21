-- Install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

function load_plugins(folder, selection)
  local plugins = {}
  -- Selection can be "all" or a table of filenames like {"telescope", "treesitter"}
  
  if selection == "all" then
    -- lazy.nvim can automatically import an entire directory
    table.insert(plugins, { import = "plugins." .. folder })
  elseif type(selection) == "table" then
    -- Manually import specific files from the folder
    for _, name in ipairs(selection) do
      table.insert(plugins, { import = "plugins." .. folder .. "." .. name })
    end
  end
  
  return plugins
end
