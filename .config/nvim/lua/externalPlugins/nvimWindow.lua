local M = {
  's1n7ax/nvim-window-picker',
  name = 'window-picker',
  -- event = 'VeryLazy',
  version = '2.*',
  config = function()
    local picker = require("window-picker")
    picker.setup({
      hint = 'floating-big-letter',
      -- selection_chars = 'fndksoaleiru',
      selection_chars = '0123456789',
      filter_rules = {
        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { "neo-tree", "neo-tree-popup", "notify"},
          buftype = {},
        },
      }
    })

    vim.keymap.set("n", "<a-w>", function()
      local picked_window_id =
          picker.pick_window() or vim.api.nvim_get_current_win()
      vim.api.nvim_set_current_win(picked_window_id)
    end, { desc = "Pick a window" })
  end,
}

return M
