local M = {
  "t9md/vim-choosewin",
  config = function()
    -- Basic setup - map '-' to invoke choosewin (like the example in README)
    vim.keymap.set("n", "<c-j>", "<Plug>(choosewin)", {silent = true})
    
    -- Optional: Enable overlay feature for visual labels in window centers
    -- vim.g.choosewin_overlay_enable = 1
    
    -- Optional: Set overlay font (if you want a specific look)
    -- vim.g.choosewin_overlay_font_size = 12
  end
}

return M
