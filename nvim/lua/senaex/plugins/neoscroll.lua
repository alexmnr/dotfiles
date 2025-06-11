return {
  "karb94/neoscroll.nvim",
  opts = {},
  config = function()
    local neoscroll = require('neoscroll')
    neoscroll.setup({
      -- Default easing function used in any animation where
      -- the `easing` argument has not been explicitly supplied
      easing = "quadratic"
    })
    local keymap = {
      -- Use the "sine" easing function
      ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 250; easing = 'sine' }) end;
      ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 250; easing = 'sine' }) end;

      -- When no value is passed the `easing` option supplied in `setup()` is used
      ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor=false; duration = 100 }) end;
      ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor=false; duration = 100 }) end;

      ["zt"]    = function() neoscroll.zt({ half_win_duration = 250 }) end;
      ["zz"]    = function() neoscroll.zz({ half_win_duration = 250 }) end;
      ["zb"]    = function() neoscroll.zb({ half_win_duration = 250 }) end;
    }
    local modes = { 'n', 'v', 'x' }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end,
}
