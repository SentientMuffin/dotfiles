local M = {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

-- keymap

vim.keymap.set(
  "n",
  "df",
  function()
    if next(require("diffview.lib").views) == nil then
      vim.cmd("DiffviewOpen")
    else
      vim.cmd("DiffviewClose")
    end
  end,
  { noremap = true, silent = true }
)

return M
